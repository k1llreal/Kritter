<#import "parts/common.ftlh" as c>

<@c.page>
    <h1><strong>Список пользователей</strong></h1>
    <table>
        <thead>
        <tr>
            <th>Логин</th>
            <th>Роли</th>
            <th>email</th>
            <th>ФИО</th>
            <th>Дата рождения</th>
        </tr>
        </thead>
        <tbody>
        <#list users as user>
            <tr>
                <td>${user.username}</td>
                <td><#list user.roles as role>${role}<#sep>, </#list></td>
                <td><a href="/user/${user.id}">Редактировать</a></td>
            </tr>
        </#list>
        </tbody>
    </table>
</@c.page>