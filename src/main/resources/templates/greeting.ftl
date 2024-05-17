<#import "basic/page.ftl" as page>
<#import "basic/common.ftl" as common>

<@page.page>
    <h1>Hello <span>User</span>!</h1>
    <div>
        <@common.logout />
    </div>

    <div>
        <form method="post">
            <input type="hidden" name="_csrf" value="${_csrf.token}" />
            <input type="text" name="text" placeholder="Message text">
            <input type="text" name="tag" placeholder="Tag">
            <button type="submit">Отправить</button>
        </form>
    </div>

    <div>
        <h3>Messages</h3>
        <#list messages as message>
            <div>
                <b>${message.id}</b>
                <span>${message.text}</span>
                <i>${message.tag}</i>
                <strong>${message.authorName}</strong>
            </div>
            <#else>
            No message
        </#list>
    </div>

</@page.page>