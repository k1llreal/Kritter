<#import "parts/common.ftlh" as c>


<@c.page>
    <h5><strong>Профиль пользователя: ${username}</strong></h5>
    <h6>Изменение данных</h6>
    <form method="post">
        <div class="form-group row">
            <label class="col-sm-2 col-form-label">ФИО :</label>
            <div class="col-sm-3">
                <input type="text" name="surname" class="form-control" value="${surname!''}" placeholder="Фамилия"/>
                <input type="text" name="name" class="form-control" value="${name!''}" placeholder="Имя"/>
                <input type="text" name="patronymic" class="form-control" value="${patronymic!''}" placeholder="Отчество (если есть)"/>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-2 col-form-label">Дата рождения :</label>
            <div class="col-sm-2">
                ${dateOfBirth!''}
                <input type="date" id="date" name="dateOfBirth" class="form-control" value="${dateOfBirth!''}"/>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-2 col-form-label">Email :</label>
            <div class="col-sm-4">
                <input type="email" name="email" class="form-control" value="${email!''}" placeholder="your@email.com"/>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-2 col-form-label">Пароль :</label>
            <div class="col-sm-4">
                <input type="password" name="password" class="form-control" placeholder="Пароль"/>
            </div>
        </div>
        <!-- без этого скрытого токена POST форма не будет принята сервером -->
        <input type="hidden" name="_csrf" value="${_csrf.token}" />
        <button class="btn btn-primary" type="submit">Сохранить изменения</button>
    </form>
</@c.page>