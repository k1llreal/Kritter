package ru.golovan.kritter.repos;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.golovan.kritter.domain.User;

public interface UserRepo extends JpaRepository<User, Long> {
    User findByUsername(String username);
}
