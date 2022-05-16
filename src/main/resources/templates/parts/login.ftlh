<#macro login path >
    <form action="${path}" method="post">
        <div class="form-group row">
            <label class="col-sm-2 col-form-label">Логин :</label>
            <div class="col-sm-6">
                <input type="text" name="username" class="form-control" placeholder="Имя пользователя"/>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-2 col-form-label">Пароль :</label>
            <div class="col-sm-6">
                <input type="password" name="password" class="form-control" placeholder="Пароль"/>
            </div>
        </div>
        <!-- без этого скрытого токена POST форма не будет принята сервером -->
        <input type="hidden" name="_csrf" value="${_csrf.token}" />
            <a href="/registration">Зарегистрироваться</a>
        <button class="btn btn-primary" type="submit">Вход</button>
    </form>
</#macro>

<#macro registration path>
    <form action="${path}" method="post">

        <div class="form-group row">
            <label class="col-sm-2 col-form-label">Логин :</label>
            <div class="col-sm-6">
                <input type="text" name="username" class="form-control" placeholder="Имя пользователя"/>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-2 col-form-label">Пароль :</label>
            <div class="col-sm-6">
                <input type="password" name="password" class="form-control" placeholder="Пароль"/>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-2 col-form-label">Email :</label>
            <div class="col-sm-6">
                <input type="email" name="email" class="form-control" placeholder="your@email.com"/>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-2 col-form-label">ФИО :</label>
            <div class="col-sm-2">
                <input type="text" name="surname" placeholder="Фамилия"/>
                <input type="text" name="name" placeholder="Имя"/>
                <input type="text" name="patronymic" placeholder="Отчество (если есть)"/>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-2 col-form-label">Дата рождения :</label>
            <div class="col-sm-6">
                <input type="date" id="date" name="dateOfBirth"/>
            </div>
        </div>
        <!-- без этого скрытого токена POST форма не будет принята сервером -->
        <input type="hidden" name="_csrf" value="${_csrf.token}" />
        <a href="/login">Вход</a>
        <button class="btn btn-primary" type="submit">Зарегистрироваться</button>
    </form>
</#macro>

<#macro logout>
    <form action="/logout" method="post">
        <!-- без этого скрытого токена POST форма не будет принята сервером -->
        <input type="hidden" name="_csrf" value="${_csrf.token}" />
        <button class="btn btn-primary" type="submit">Выход</button>
    </form>
</#macro>