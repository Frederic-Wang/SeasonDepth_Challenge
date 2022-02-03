<%--
  Created by IntelliJ IDEA.
  User: ws199
  Date: 12/16/2021
  Time: 8:40 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Competition Log In Page</title>
    <%
        pageContext.setAttribute("APP_PATH", request.getContextPath());
    %>

    <script type="text/javascript"
            src="${APP_PATH }/static/js/jquery-1.12.4.min.js"></script>
    <link
            href="${APP_PATH }/static/bootstrap-3.3.7-dist/css/bootstrap.min.css"
            rel="stylesheet">
    <script
            src="${APP_PATH }/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>

</head>
<body>
    <form class="form-horizontal" id = "loginForm">
        <div class="form-group">
            <label class="col-sm-2 control-label">UserName</label>
            <div class="col-sm-10">
                <input type="text" name="userName" class="form-control" id="userName_add_input" placeholder="userName">
                <span class="help-block"></span>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">PassWord</label>
            <div class="col-sm-10">
                <input type="password" name="passWord" class="form-control" id="passWord_add_input" placeholder="passWord">
                <span class="help-block"></span>
            </div>
        </div>
    </form>

    <div class="row">
        <div class="col-md-4 col-md-offset-8">
            <button class="btn btn-primary" id="login_btn">Log In</button>
        </div>
    </div>

</body>

<script type="text/javascript">
    function show_validate_msg(ele,status,msg){

        $(ele).parent().removeClass("has-success has-error");
        $(ele).next("span").text("");
        if("success"==status){
            $(ele).parent().addClass("has-success");
            $(ele).next("span").text(msg);
        }else if("error" == status){
            $(ele).parent().addClass("has-error");
            $(ele).next("span").text(msg);
        }
    }

    $("#login_btn").click(function(){
        // first get the username and password input
        var userName = $("#userName_add_input").val();
        var passWord = $("#passWord_add_input").val();
        var model_and_view;
        // send ajax post to check if valid
        $.ajax({
            url:"${APP_PATH}/userLogin",
            type:"POST",
            data:{"userName":userName, "passWord":passWord},
            success:function(result){
                if(result.code == 100){
                    // if all things are good, then forward to user's homepage
                    show_validate_msg("#passWord_add_input", "success", "");
                    <%--window.location.href = '${APP_PATH}/ranking_show';--%>

                    window.location.href = '${APP_PATH}/user_homepage';
                    <%--$.ajax({--%>
                    <%--    url: "${APP_PATH}/user_homepage",--%>
                    <%--    type: "POST",--%>
                    <%--    data: {"userName":userName},--%>
                    <%--    success:function (result){--%>
                    <%--        if(result.code == 100){--%>
                    <%--            model_and_view = result.extend.modelAndView;--%>
                    <%--        }--%>
                    <%--    }--%>
                    <%--})--%>
                    <%--window.location.href = '${model_and_view}';--%>
                }else{
                    // if not good, show message
                    show_validate_msg("#passWord_add_input","error",result.extend.va_msg);
                }
            }
        });
    });
</script>
</html>
