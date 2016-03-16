function buttonClick()
{
    alert("hello world");
}

function butClick(){

    alert("world Hello");
}


function PClick(x,y){

    
    return x + y;

}

window.onload = function () {
    var u = navigator.userAgent;
    if (u.indexOf('Android') > -1 || u.indexOf('Linux') > -1) {//安卓手机
        alert("安卓手机");
        // window.location.href = "mobile/index.html";
    } else if (u.indexOf('iPhone') > -1) {//苹果手机
        // window.location.href = "mobile/index.html";
        alert("苹果手机");
    } else if (u.indexOf('Windows Phone') > -1) {//winphone手机
        alert("winphone手机");
        // window.location.href = "mobile/index.html";
    }
}

function postStr(str1,str2){

    return str1.concat(str2);
    //return “javaScript返回值啦”;
}

function change(){

    document.getElementById("show").innerHTML = "段落已修改。";
}