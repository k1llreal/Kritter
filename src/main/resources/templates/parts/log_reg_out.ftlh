<#macro login path >
    <form action="${path}" method="post">
        <div class="form-group row">
            <label class="col-sm-2 col-form-label">Логин :</label>
            <div class="col-sm-4">
                <input type="text" name="username" value="<#if user??>${user.username}</#if>"
                       class="form-control ${(usernameError??)?string('is-invalid', '')}"
                       placeholder="Имя пользователя"/>
                <#if usernameError??>
                    <div class="invalid-feedback">
                        ${usernameError}
                    </div>
                </#if>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-2 col-form-label">Пароль :</label>
            <div class="col-sm-4">
                <input type="password" name="password"
                       class="form-control ${(passwordError??)?string('is-invalid', '')}"
                       placeholder="Пароль"/>
                <#if passwordError??>
                    <div class="invalid-feedback">
                        ${passwordError}
                    </div>
                </#if>
            </div>
        </div>
        <!-- без этого скрытого токена POST форма не будет принята сервером -->
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        <button class="btn btn-primary" type="submit">Вход</button>
        <a href="/registration">Зарегистрироваться--></a>
    </form>
</#macro>

<#macro registration path>
    <form action="${path}" method="post">

        <div class="form-group row">
            <label class="col-sm-2 col-form-label">Логин :</label>
            <div class="col-sm-4">
                <input type="text" name="username" value="<#if user??>${user.username}</#if>"
                       class="form-control ${(usernameError??)?string('is-invalid', '')}"
                       placeholder="Имя пользователя"/>
                <#if usernameError??>
                    <div class="invalid-feedback">
                        ${usernameError}
                    </div>
                </#if>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-2 col-form-label">Пароль :</label>
            <div class="col-sm-4">
                <input type="password" name="password"
                       class="form-control ${(passwordError??)?string('is-invalid', '')}"
                       placeholder="Пароль"/>
                <#if passwordError??>
                    <div class="invalid-feedback">
                        ${passwordError}
                    </div>
                </#if>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-2 col-form-label">Повтор пароля :</label>
            <div class="col-sm-4">
                <input type="password" name="password2"
                       class="form-control ${(password2Error??)?string('is-invalid', '')}"
                       placeholder="Повтор пароля"/>
                <#if password2Error??>
                    <div class="invalid-feedback">
                        ${password2Error}
                    </div>
                </#if>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-2 col-form-label">Email :</label>
            <div class="col-sm-4">
                <input type="email" name="email" value="<#if user??>${user.email}</#if>"
                       class="form-control ${(emailError??)?string('is-invalid', '')}"
                       placeholder="your@email.com"/>
                <#if emailError??>
                    <div class="invalid-feedback">
                        ${emailError}
                    </div>
                </#if>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-2 col-form-label">ФИО :</label>
            <div class="col-sm-3">
                <input type="text" name="surname"  value="<#if user??>${user.surname}</#if>"
                       class="form-control ${(surnameError??)?string('is-invalid', '')}" placeholder="Фамилия"/>
                <#if surnameError??>
                    <div class="invalid-feedback">
                        ${surnameError}
                    </div>
                </#if>
                <input type="text" name="name" value="<#if user??>${user.name}</#if>"
                       class="form-control ${(nameError??)?string('is-invalid', '')}" placeholder="Имя"/>
                <#if nameError??>
                    <div class="invalid-feedback">
                        ${nameError}
                    </div>
                </#if>
                <input type="text" name="patronymic" value="<#if user??>${user.patronymic}</#if>"
                       class="form-control ${(patronymicError??)?string('is-invalid', '')}" placeholder="Отчество"/>
                <#if patronymicError??>
                    <div class="invalid-feedback">
                        ${patronymicError}
                    </div>
                </#if>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-2 col-form-label">Дата рождения :</label>
            <div class="col-sm-3">
                <input type="date" id="date" name="dateOfBirth"
                       class="form-control ${(dateOfBirthError??)?string('is-invalid', '')}"/>
                <#if dateOfBirthError??>
                    <div class="invalid-feedback">
                        ${dateOfBirthError}
                    </div>
                </#if>
            </div>
        </div>
        <!-- без этого скрытого токена POST форма не будет принята сервером -->
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        <button class="btn btn-primary" type="submit">Зарегистрироваться</button>
        <a href="/login">Вход--></a>
    </form>
</#macro>

<#macro logout>
    <form action="/logout" method="post">
        <!-- без этого скрытого токена POST форма не будет принята сервером -->
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        <button class="btn btn-primary" type="submit">Выход</button>
    </form>
</#macro>