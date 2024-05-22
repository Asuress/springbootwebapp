<#macro page>
    <!DOCTYPE html>
    <html>

    <head>
        <title>Awesome Title</title>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
            integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    </head>

    <body>
        <nav class="navbar navbar-expand-lg bg-body-tertiary" data-bs-theme="dark">
            <div class="container-fluid">
                <a class="navbar-brand" href="/">SpringServingWebContent</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                    data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                    aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="/greeting">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="/users">User list</a>
                        </li>
                    </ul>

                    <div class="navbar-nav">
                        <h3 class="nav-item navbar-brand active" aria-current="page">Page</h3>
                    </div>

                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="/login">Sign in</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="/registration">Register</a>
                        </li>
                        <li class="nav-item" class="nav-item">
                            <form action="/logout" method="post">
                                <input type="hidden" name="_csrf" value="${_csrf.token}" />
                                <input type="submit" value="Sign Out" class="nav-link active" aria-current="page" />
                            </form>
                        </li>
                    </ul>

                    <form class="d-flex" role="search">
                        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                        <button class="btn btn-outline-success" type="submit">Search</button>
                    </form>
                </div>
            </div>
        </nav>

        <#nested>

            <script type="text/javascript">
                const article = document.getElementById("selection");
                article.addEventListener('mouseup', handlerFunction, false);

                function handlerFunction(event) {
                    if (document.contains(document.getElementById("share-snippet"))) {
                        document.getElementById("share-snippet").remove();
                    }

                    if (window.getSelection().toString().length > 0) {

                        const selection = encodeURIComponent(window.getSelection().toString()).replace(/[!'()*]/g, escape);

                        var scrollTop = (window.pageYOffset !== undefined) ? window.pageYOffset : (document.documentElement || document.body.parentNode || document.body).scrollTop;

                        const posX = event.clientX - 110;
                        const posY = event.clientY + 20 + scrollTop;

                        const shareUrl = 'http://twitter.com/share?text=' + selection + '&url=https://awik.io';

                        document.body.insertAdjacentHTML('beforeend', '<div id="share-snippet" style="position: absolute; top: ' + posY + 'px; left: ' + posX + 'px;"><div class="speech-bubble"><div class="share-inside"><a href="javascript:void(0);" onClick=\'window.open(\"' + shareUrl + '\", \"\", \"menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600\");\'>TWEET SELECTION</a></div></div></div>');
                    }
                }
            </script>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
                crossorigin="anonymous"></script>
            <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
                integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
                crossorigin="anonymous"></script>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js"
                integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy"
                crossorigin="anonymous"></script>
            <script src="https://cdn.jsdelivr.net/npm/@floating-ui/core@1.6.1"></script>
            <script src="https://cdn.jsdelivr.net/npm/@floating-ui/dom@1.6.5"></script>
    </body>

    <footer>

    </footer>

    </html>
</#macro>