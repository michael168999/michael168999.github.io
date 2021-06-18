function getSyncScriptParams() {
    var scripts = document.getElementsByTagName('script');
    var lastScript = scripts[scripts.length-1];
    var scriptName = lastScript;
    return [ scriptName.getAttribute('p1'), scriptName.getAttribute('p2') ];
}

var p=getSyncScriptParams();
x=p[0]+"-"+p[1]+"b";
document.getElementById("gettext").innerHTML=x;

var h1="product.jsp?product="+p[0]+"&id=";
//var h2=".html\"";
var p1="\"image/product/"+p[0];
var p2=".jpg\"";
var size=" width=\"240\" height=\"240\"";

var i=0;
for(i=1;i<=10;++i)
{
    var h=h1+i;
    //var h="product.jsp?product=pc&id="+i;
    var p=p1+i+p2;
    document.write("<a href="+h+"><img src="+p+size+"></a>");
}

