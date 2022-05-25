<#include "security.ftlh">
<#import "log_reg_out.ftlh" as l>

<header>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container-fluid">
            <a class="navbar-brand" href="/"><h3>Golovan Kritter</h3></a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                    data-bs-target="#navbarSupportedContent"
                    aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="/">Главная</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/main">Стена</a>
                    </li>
                    <#if isAdmin>
                        <li class="nav-item">
                            <a class="nav-link" href="/user">Список пользователей</a>
                        </li>
                    </#if>
                </ul>

                <#if name != "unknown">
                    <a class="nav-link" href="/user-messages/${currentUserId}">Мои записи</a>
                    <a class="nav-link" href="/user/profile">Профиль</a>
                    <div class="navbar-text mr-3">
                            ${name}
                    </div>
                    <@l.logout/>
                <#else>
                    <a href="http://localhost:8080/login" class="btn btn-primary"
                       role="button" aria-pressed="true">Войти</a>
                </#if>
            </div>
        </div>
    </nav>
</header>