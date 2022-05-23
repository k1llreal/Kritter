<#import "parts/common.ftlh" as c>
<#import "parts/log_reg_out.ftlh" as l>

<@c.page>
    ${message!}
    <@l.registration "/registration" />
</@c.page>