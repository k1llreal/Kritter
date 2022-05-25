<#import "parts/common.ftlh" as c>
<#import "parts/log_reg_out.ftlh" as l>

<@c.page>
    <#if RequestParameters.error??>
        <div class="alert alert-danger" role="alert">
            ${Session.SPRING_SECURITY_LAST_EXCEPTION.message}
        </div>
    </#if>
    <@l.login "/login" />
</@c.page>