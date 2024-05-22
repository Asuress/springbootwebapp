<#import "basic/page.ftl" as page>
<#import "basic/common.ftl" as common>

<@page.page>
<h4>
<#if message??>
${message}
<#else>
</#if>
</h4>

<@common.login "/registration" />
</@page.page>