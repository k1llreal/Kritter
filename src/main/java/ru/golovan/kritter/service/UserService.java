package ru.golovan.kritter.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import ru.golovan.kritter.domain.Role;
import ru.golovan.kritter.domain.User;
import ru.golovan.kritter.repos.UserRepo;

import java.sql.Date;
import java.util.*;
import java.util.stream.Collectors;

@Service
public class UserService implements UserDetailsService {
    @Autowired
    private UserRepo userRepo;

    @Autowired
    private MailSender mailSender;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        User user = userRepo.findByUsername(username);

        if (user == null) {
            throw new BadCredentialsException("Пользователь не существует, либо вы ввели неверный пароль");
        }

        return user;
    }

    public boolean addUser(User user) {
        User userFromDb = userRepo.findByUsername(user.getUsername());

        if (userFromDb != null) {
            return false;
        }

        user.setActive(false);
        user.setRoles(Collections.singleton(Role.USER));
        user.setActivationCode(UUID.randomUUID().toString());
        user.setPassword(passwordEncoder.encode(user.getPassword()));

        userRepo.save(user);

        sendMessage(user);

        return true;
    }

    private void sendMessage(User user) {
        if (!StringUtils.isEmpty(user.getEmail())) {
            String message = String.format(
                    "Привет, %s! \n" +
                            "Ты зарегистрировался в Kritter. Тебе нужно подтвердить почту, для этого перейди по ссылке: " +
                            "http://localhost:8080/activate/%s",
                    user.getUsername(),
                    user.getActivationCode()
            );

            mailSender.send(user.getEmail(), "Код активации", message);
        }
    }

    public List<User> findAll() {
        return userRepo.findAll();
    }

    public void saveUser(User user, String username, Map<String, String> form) {
        //меняем имя пользователя
        user.setUsername(username);

        //получаем список ролей, чтобы проверить что они установлены данному пользователю
        //и переводим их в строковый вид с помощью stream
        Set<String> roles = Arrays.stream(Role.values())
                .map(Role::name)
                .collect(Collectors.toSet());

        //отчищаем все роли пользователя
        user.getRoles().clear();

        //проверяем что данная форма содержит роли для нашего пользователя
        for (String key : form.keySet()) {
            if (roles.contains(key)) {
                //добавляем роль пользователю
                user.getRoles().add(Role.valueOf(key));
            }
        }

        //сохраняем пользователя
        userRepo.save(user);
    }

    public void updateProfile(User user, String password, String email,
                              String surname, String name, String patronymic,
                              Date dateOfBirth) {
        String usrEmail = user.getEmail();
        String usrSurname = user.getSurname();
        String usrName = user.getName();
        String usrPatronymic = user.getPatronymic();
        Date usrDateOfBirth = user.getDateOfBirth();

        boolean isEmailChanged = (email != null && !email.equals(usrEmail)) ||
                (usrEmail != null && !usrEmail.equals(email));
        boolean isSurnameChanged = (surname != null && !surname.equals(usrSurname)) ||
                (usrSurname != null && !usrSurname.equals(surname));
        boolean isNameChanged = (name != null && !name.equals(usrName)) ||
                (usrName != null && !usrName.equals(name));
        boolean isPatronymicChanged = (patronymic != null && !patronymic.equals(usrPatronymic)) ||
                (usrPatronymic != null && !usrPatronymic.equals(patronymic));
        boolean isDateChanged = (dateOfBirth != null && !dateOfBirth.equals(usrDateOfBirth)) ||
                (usrDateOfBirth != null && !usrDateOfBirth.equals(dateOfBirth));


        if (isEmailChanged) {
            user.setEmail(email);
        }

        if (isSurnameChanged) {
            user.setSurname(surname);
        }

        if (isNameChanged) {
            user.setName(name);
        }

        if (isPatronymicChanged) {
            user.setPatronymic(patronymic);
        }

        if (isDateChanged) {
            user.setDateOfBirth(dateOfBirth);
        }

        if (!StringUtils.isEmpty(password)) {
            user.setPassword(passwordEncoder.encode(password));
        }

        userRepo.save(user);

    }

    public boolean activateUser(String code) {
        User user = userRepo.findByActivationCode(code);

        if (user == null) {
            return false;
        }

        user.setActivationCode(null);
        user.setActive(true);
        userRepo.save(user);

        return true;
    }
}
