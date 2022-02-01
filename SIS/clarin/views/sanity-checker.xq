xquery version "3.0";

declare namespace exist = "http://exist.sourceforge.net/NS/exist";
declare option exist:serialize "method=xhtml media-type=text/html indent=yes doctype-system=about:legacy-compat";

import module namespace menu = "http://clarin.ids-mannheim.de/standards/menu" at "../modules/menu.xql";
import module namespace app = "http://clarin.ids-mannheim.de/standards/app" at "../modules/app.xql";
import module namespace sc = "http://clarin.ids-mannheim.de/standards/sanity-checker" at "../modules/sanity-checker.xql";

(: 
    @author margaretha
:)

<html>
    <head>
        <title>Recommendation sanity checker</title>
        <link rel="stylesheet" type="text/css" href="{app:resource("style.css", "css")}"/>
        <script type="text/javascript" src="{app:resource("edit.js", "js")}"/>
        <script type="text/javascript" src="{app:resource("utils.js", "js")}"/>
    </head>
    <body>
        <div id="all">
            <div class="logoheader"/>
            {menu:view()}
            <div class="content">
                <div class="navigation">
                    &gt; <a href="{app:link("views/sanity-checker.xq")}">Recommendation Sanity Checker</a>
                </div>
                
                <div class="title">Sanity checker for recommendation files</div>
                
                <div>
                    <h2>Recommendations missing or having unknown domains</h2>
                    {sc:get-recommendations-with-missing-or-unknown-domains()}
                </div>
                
                <div>
                    <h2>Recommendations missing or having unknown levels</h2>
                    {sc:get-recommendations-with-missing-or-unknown-levels()}
                </div>
                
                <div>
                    <h2>Similar Recommendations</h2>
                    {sc:get-similar-recommendations()}
                </div>
                
                </div>
            <div
                class="footer">{app:footer()}</div>
        </div>
    </body>
</html>