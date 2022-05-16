<#import "parts/common.ftlh" as c>

<@c.page>
    <h1><strong>Редактор пользователей</strong></h1>

    <form action="/user" method="post">
        <!-- отображение данных которые мы хотим отредактировать -->
        <div><label> Логин : <input type="text" name="username" value="${user.username}"></label></div>
        <div><label> Email : <input type="text" name="email" value=""></label></div>
        <div><label> ФИО :
                <input type="text" name="surname" placeholder="Фамилия"/>
                <input type="text" name="name" placeholder="Имя"/>
                <input type="text" name="patronymic" placeholder="Отчество(если есть)"/></label></div>

        <!-- отображение списка ролей -->
        <#list roles as role>
            <!-- каждую роль выводим на отдельной строке в чекбоксе -->
            <div>
                <!-- добавляем пометку активна данная роль или нет
                через метод на проверку наличия элементов в коллекции seq_contains
                он возвращает boolean поэтому преобразовываем его в строку
                и указываем значения либо checked либо ""-->
                <label><input type="checkbox" name="${role}"
                            ${user.roles?seq_contains(role)?string("checked", "")}>${role}</label>
            </div>
        </#list>
        <!-- идентификатор пользователя -->
        <input type="hidden" value="${user.id}" name="userId">
        <!-- без этого скрытого токена POST форма не будет принята сервером -->
        <input type="hidden" value="${_csrf.token}" name="_csrf">
        <button type="submit">Сохранить</button>
    </form>
</@c.page>
