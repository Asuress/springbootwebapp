<#import "basic/page.ftl" as page>
<#import "basic/login.ftl" as login>

<@page.page>
<h1>Registration page</h1>

<h4>
<#if message??>
${message}
<#else>
</#if>
</h4>

<@login.login "/registration" />
</@page.page>