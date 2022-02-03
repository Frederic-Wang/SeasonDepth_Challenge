<%@ page isELIgnored="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">



<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Competition Sign Up Page</title>
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
<%--<h2>Hello World!</h2>--%>
<!--get 4 parameters from form-->
<!--here we need a group or final class to serialize data-->
<div class="modal fade" id="userAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">Sign Up</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">UserName</label>
                        <div class="col-sm-10">
                            <input type="text" name="userName" class="form-control" id="userName_add_input" placeholder="userName">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">E-Mail</label>
                        <div class="col-sm-10">
                            <input type="text" name="eMail" class="form-control" id="eMail_add_input" placeholder="eMail">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">PassWord</label>
                        <div class="col-sm-10">
                            <input type="text" name="passWord" class="form-control" id="passWord_add_input" placeholder="passWord">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">ConfirmPassWord</label>
                        <div class="col-sm-10">
                            <input type="text" name="confirmPassword" class="form-control" id="confirmPassword_add_input" placeholder="confirmPassword">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">Verify Code</label>
                        <div class="col-sm-10">
                            <input type="text" name="verifyCode" class="form-control" id="verify_code_input" placeholder="verify code">
                            <span class="help-block"></span>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" id="send_code_btn">SendCode</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary" id="user_save_btn">Submit</button>
            </div>
        </div>
    </div>
</div>
<!--show page-->
<div class="container">
    <!-- title -->
    <div class="row">
        <div class="col-md-12">
            <h1>Competition Sign Up Page</h1>
        </div>
    </div>

    <!--sign up button-->
    <div class="row">
        <div class="col-md-4 col-md-offset-8">
            <button class="btn btn-primary" id="signup_btn">Sign Up</button>
        </div>
        <div class="col-md-4 col-md-offset-8">
            <button class="btn btn-primary" id="login_btn" onclick="window.location.href = '${APP_PATH}/login'">Log In</button>
        </div>
    </div>

</div>

<script type="text/javascript">
    function reset_form(ele){
        $(ele)[0].reset();

        $(ele).find("*").removeClass("has-error has-success");
        $(ele).find(".help-block").text("");
    }

    $("#signup_btn").click(function(){
        // clear form
        reset_form("#userAddModal form");
        // get out modal form
        $("#userAddModal").modal({
            backdrop:"static"
        });
    });

    function validate_add_form(){
        //1、get data in form
        // check user name
        var userName = $("#userName_add_input").val();
        var regName = /(^[a-zA-Z0-9_-]{6,16}$)/;
        if(!regName.test(userName)){
            show_validate_msg("#userName_add_input", "error", "UserName should be combination of 0 - 9 and Letters");
            return false;
        }else{
            show_validate_msg("#userName_add_input", "success", "");
        };

        //check email
        var email = $("#eMail_add_input").val();
        var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
        if(!regEmail.test(email)){
            show_validate_msg("#eMail_add_input", "error", "Please input valid e-mail");
            return false;
        }else{
            show_validate_msg("#eMail_add_input", "success", "");
        }
        return true;
    }

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

    // check if user name is duplicated
    $("#userName_add_input").change(function(){
        var userName = this.value;
        $.ajax({
            url:"${APP_PATH}/checkUser",
            data:"userName="+userName,
            type:"POST",
            success:function(result){
                // 100 means success
                console.log(result.code)
                if(result.code==100){
                    show_validate_msg("#userName_add_input","success","user name is valid");
                    $("#user_save_btn").attr("ajax-va","success");
                }else{
                    show_validate_msg("#userName_add_input","error",result.extend.va_msg);
                    $("#user_save_btn").attr("ajax-va","error");
                }
            }
        });
    });

    // check if e-mail is valid
    $("#eMail_add_input").change(function(){
        var eEmail = this.value;
        $.ajax({
            url:"${APP_PATH}/checkEmail",
            data:"eMail="+eEmail,
            type:"POST",
            success:function(result){
                // 100 means success
                console.log(result.code)
                if(result.code==100){
                    show_validate_msg("#eMail_add_input","success","e-mail is valid");
                    $("#send_code_btn").attr("eMail-va","success");
                }else{
                    show_validate_msg("#eMail_add_input","error",result.extend.va_msg);
                    $("#send_code_btn").attr("eMail-va","error");
                }
            }
        });
    });

    $("#confirmPassword_add_input").change(function(){
        var firstPassword = $("#passWord_add_input").val();
        var secondPassword = this.value;
        $.ajax({
            url:"${APP_PATH}/checkPassWord",
            data:{"firstPassword":firstPassword, "secondPassword":secondPassword},
            // data:"firstPassword="+firstPassword,
            type:"POST",
            success:function(result){
                // 100 means success
                console.log(result.code)
                if(result.code==100){
                    show_validate_msg("#confirmPassword_add_input","success","great");
                    $("#user_save_btn").attr("pass-va","success");
                }else{
                    show_validate_msg("#confirmPassword_add_input","error",result.extend.va_msg);
                    $("#user_save_btn").attr("pass-va","error");
                }
            }
        });
    });

    // check if verify code is right
    $("#verify_code_input").change(function(){
        var codeInput = this.value;
        var codeSent = $("#send_code_btn").attr("sent_code");
        $.ajax({
            url:"${APP_PATH}/checkCode",
            data:{"codeInput":codeInput, "codeSent":codeSent},
            type:"POST",
            success:function(result){
                // 100 means success
                console.log(result.code)
                if(result.code==100){
                    show_validate_msg("#verify_code_input","success","correct");
                    $("#user_save_btn").attr("code-va","success");
                }else{
                    show_validate_msg("#verify_code_input","error",result.extend.va_msg);
                    $("#user_save_btn").attr("code-va","error");
                }
            }
        });
    });

    <!--send code and verify-->
    $("#send_code_btn").click(function() {
        if($(this).attr("eMail-va")=="error"){
            return false;
        }
        var emailInput = $("#eMail_add_input").val()
        $.ajax({
            url:"${APP_PATH}/sendCode",
            type:"POST",
            data:"emailInput=" + emailInput,
            success:function(result){
                if(result.code == 100){
                    //user saving success
                    //close modal
                    show_validate_msg("#eMail_add_input","success","e-mail has sent successfully");
                    $("#send_code_btn").attr("sent_code", result.extend.sent_code);
                }else{
                    show_validate_msg("#eMail_add_input", "error", "There are some problem, please check your e-mail again");
                }
            }
        });
    })

    <!--push submit button, save user-->
    $("#user_save_btn").click(function(){
        // first validate data in form
        if(!validate_add_form()){
            return false;
        };

        if($(this).attr("ajax-va")=="error"){
            return false;
        }

        if($(this).attr("pass-va")=="error"){
            return false;
        }

        if($(this).attr("code-va")=="error"){
            return false;
        }


        // send ajax post to save user
        $.ajax({
            url:"${APP_PATH}/saveUser",
            type:"POST",
            data:$("#userAddModal form").serialize(),
            success:function(result){
                if(result.code == 100){
                    //user saving success
                    //close modal
                    $("#userAddModal").modal('hide');
                }else{
                    if(undefined != result.extend.errorFields.eMail){
                        show_validate_msg("#eMail_add_input", "error", result.extend.errorFields.eMail);
                    }
                    if(undefined != result.extend.errorFields.userName){
                        show_validate_msg("#userName_add_input", "error", result.extend.errorFields.userName);
                    }
                }
            }
        });
    });

</script>

</body>
</html>
