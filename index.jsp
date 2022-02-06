<%@ page isELIgnored="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">



<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Season Depth Challenge</title>
    <%
        pageContext.setAttribute("APP_PATH", request.getContextPath());
    %>

    <style>
        .container1 {
            position:relative;
            width: 100%;
            max-width: 5000px;
        }

        .container1 img {
            width: 100%;
            height: auto;
        }

        .container1 .btn {
            position: absolute;
            top: 75%;
            left: 50%;
            transform: translate(-50%, -50%);
            -ms-transform: translate(-50%, -50%);
            background-color: rgb(255, 187, 0);
            color: white;
            font-size: 20px;
            padding: 18px 280px;
            border: none;
            cursor: pointer;
            border-radius: 6px;
            text-align: center;
        }

        .container1 .btn:hover {
            background-color: black;
        }
        .mx-a {
        }
        .text-cen {
        }
        .mb-6 {
        }
    </style>


    <!-- Bootstrap core CSS -->

    <!--${APP_PATH}/static/source-pic-->

    <!-- Bootstrap core CSS -->

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">


    <!-- Custom styles for this template -->
    <link rel="icon" href="${APP_PATH}/static/source-pics/brand_black.png" type="image/png">

    <link href="${APP_PATH}/static/bootstrap-5.13/css/jiaun.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet/less" type="text/css" href="${APP_PATH}/static/bootstrap-5.13/css/styles.less" />
    <link href="${APP_PATH}/static/bootstrap-5.13/css/carousel.css" rel="stylesheet">
    <link href="${APP_PATH}/static/bootstrap-5.13/css/pricing.css" rel="stylesheet">
    <meta http-equiv="Access-Control-Allow-Origin" content="*" />
    <script src="https://cdn.jsdelivr.net/npm/less@4.1.1" ></script>

<%--    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>--%>

    <!--===================================================================================-->
    <script type="text/javascript"
            src="${APP_PATH }/static/js/jquery-1.12.4.min.js"></script>
    <link
            href="${APP_PATH }/static/bootstrap-3.3.7-dist/css/bootstrap.min.css"
            rel="stylesheet">


    <script
            src="${APP_PATH }/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>



</head>
<body>

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
                            <input type="text" name="eMail" class="form-control" id="eMail_add_input" placeholder="Please use your official education e-mail ending with .edu">
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
                    <div class="form-group">
                        <label class="col-sm-2 control-label">ConfirmPW</label>
                        <div class="col-sm-10">
                            <input type="password" name="confirmPassword" class="form-control" id="confirmPassword_add_input" placeholder="confirmPassword">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">Verify Code</label>
                        <div class="col-sm-10">
                            <input type="text" name="verifyCode" class="form-control" id="verify_code_input" placeholder="Please click on send code button below">
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

<%--<div class="text-end">--%>
<%--    <button type="button" class="btn btn-outline-light me-2" id="login_btn" onclick="window.location.href = '${APP_PATH}/login'">Login</button>--%>
<%--    <button type="button" class="btn btn-warning" id="signup_btn">Sign-up</button>--%>
<%--</div>--%>

<div class="bg-black">
    <header class="p-3 text-white fixed-top" style="background-color:#252727;">
        <div class="container">
            <div class="d-flex flex-wrap align-items-center">

                <img src="${APP_PATH}/static/source-pics/brand_white.svg" class="navbar-brand" width="50">
                <ul class="nav col-lg-auto me-lg-auto mb-md-0">
                    <li class="align-content-center nav-item">
                        <a href="#int" class="nav-link text-white"><a1>Introduction</a1></a>
                    </li>
                    <li>
                        <a href="#tra" class="nav-link text-white"><a1>Tracks</a1></a>
                    </li>
                    <li>
                        <a href="#eva" class="nav-link text-white"><a1>Evaluation</a1></a>
                    </li>
                    <li>
                        <a href="#tim" class="nav-link text-white"><a1>Timeline</a1></a>
                    </li>
                    <li>
                        <a href="#awa" class="nav-link text-white"><a1>Award</a1></a>
                    </li>
                    <li>
                        <a href="#org" class="nav-link text-white"><a1>Orgnizer</a1></a>
                    </li>
                </ul>
                <div class="text-end">
                    <button type="button" class="btn btn-outline-light me-2" id="login_btn" onclick="window.location.href = '${APP_PATH}/login'">Login</button>
                    <button type="button" class="btn btn-warning" id="signup_btn">Sign-up</button>
                </div>
            </div>
        </div>
    </header>
    <div class="container1">
        <img1><img src="${APP_PATH}/static/source-pics/cover3.png" class="img-fluid" alt="img-responsive"></img1>        </div>
    <div id="int" class="container p-4 anchor">
        <h1 class="text-white">Introduction</h1>
        <p class="text-white-50">
            Long-term robustness of perception under various environments has been the bottleneck of lifelong trustworthy autonomy in the application of outdoor mobile robotics and autonomous driving. Although monocular depth prediction has been well studied as a typical perception task, there is little work on robust depth prediction across different environments, e.g. changing illumination and seasons, which is owing to the lack of a diverse real-world dataset containing various scenarios and the corresponding benchmark.
            To this end, we introduce <b> the SeasonDepth Prediction Challenge</b> as the first open-source challenge focusing on depth prediction performance under different environmental conditions.
        </p>
        <p class="text-white-50"> The SeasonDepth Prediction Challenge is based on our new monocular depth prediction dataset, <a href="https://seasondepth.github.io/">SeasonDepth</a>, which contains multi-traverse outdoor images from changing environments.
            To quantitatively evaluate the accuracy and robustness of monocular depth prediction across dramatically changing environments, we set up two tracks with 7 slices of training set under 12 different environmental conditions, using both mean and variance of performance as evaluation metrics. We believe our competition will contribute to flourish the long-term robust perception research among the research community with our dataset and benchmark.</p>
        <h1 class="text-white" id="tra">Challenge Tracks</h1>
        <p class="text-white-50">In this competition, we propose to host two tracks --- one <i>supervised learning track</i> and one <i>self-supervised learning track</i> for both supervised learning and self-supervised learning-based methods. We also provide high-quality demonstrations as a <a href="https://github.com/SeasonDepth/SeasonDepth/tree/master/tutorial">tutorial</a> for some baseline algorithms. Anyone can access to the leaderboard of each track after releasing the test set and participants can submit the predicted depth maps to our website to occupy the top spot. </p>
        <div class="row row-cols-1 row-cols-md-2 mb-3 text-center align-content-center text-white">
            <div class="col">
                <div class="card rounded-3 shadow-sm">
                    <div class="card-header py-3 bg-warning">
                        <h4 class="my-0 fw-normal text-black">SLT&nbsp;</h4>
                    </div>
                    <div class="card-body bg-black">
                        <h3>Supervised Learning Track</h3>

                        <ul class="list-unstyled mt-3 mb-4">
                            <li> The participants can make full use of all depth maps released in the SeasonDepth dataset to train the model</li>
                        </ul>
                        <button type="button" class="w-100 btn btn-lg btn-outline-warning">View Leaderboard</button>
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="card mb-4 rounded-3 shadow-sm">
                    <div class="card-header py-3 bg-warning">
                        <h4 class="my-0 fw-normal text-black">SSLT</h4>
                    </div>
                    <div class="card-body bg-black">
                        <h3>Self-Supervised Learning Track</h3>
                        <ul class="list-unstyled mt-3 mb-4">
                            <li>Only monocular image sequences are used for model training without the supervision of depth maps</li>
                        </ul>

                        <button type="button" class="w-100 btn btn-lg btn-warning">View Leaderboard</button>
                    </div>
                </div>
            </div></div>
        <h1 class="text-white" id="eva">Evaluation</h1>
        <p class="text-white-50">The RGB images and depth ground truth have been released for the <a href="https://figshare.com/articles/dataset/SeasonDepth_Cross-Season_Monocular_Depth_Prediction_Training_Dataset/16442025">training set</a> and  <a href="https://figshare.com/articles/dataset/SeasonDepth_Cross-Season_Monocular_Depth_Prediction_Dataset/14731323">validation set</a> of the challenge.
            For the test set of the challenge, only RGB images will be released, and the corresponding ground truth is retained and used to evaluate the submissions in the challenge. The training and validation set contain 7 multi-environment slices of images under 12 different environments, and we leave one additional slice as the test set for the challenge.
            Besides our released training and validation set, we set no limits on other third-party public datasets or pretrained models in the competition. Each individual participant will be graded based on 6 metrics in SeasonDepth benchmark of the test set. The evaluation code and instructions can be found on <a href="https://github.com/SeasonDepth/SeasonDepth">evaluation toolkit</a> for the convenience of participants to evaluate the performance themselves before submission to our challenge website. Note that the grading metrics are scaleless for relative depth values, which are compatible for both  supervised and self-supervised learning-based methods.</p>
        <h1 class="text-white" id="awa">Awards</h1>
        <div class="row row-cols-1 row-cols-md-2 mb-3 text-center align-content-center text-white">
            <div class="col">
                <div class="card rounded-3 shadow-sm">
                    <div class="card-header py-3 bg-warning">
                        <h4 class="my-0 fw-normal text-black">SLT&nbsp;</h4>
                    </div>
                    <div class="card-body bg-black">
                        <h3>Supervised Learning Track</h3>
                        <ul class="list-unstyled mt-3 mb-4">
                            <li>First prize: $1,000</li>
                            <li>Second prize: $500</li>
                            <li>Third prize: $300</li>
                        </ul>
                        <button type="button" class="w-100 btn btn-lg btn-outline-warning">Get started</button>
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="card mb-4 rounded-3 shadow-sm">
                    <div class="card-header py-3 bg-warning">
                        <h4 class="my-0 fw-normal text-black">SSLT</h4>
                    </div>
                    <div class="card-body bg-black">
                        <h3>Self-Supervised Learning Track</h3>
                        <ul class="list-unstyled mt-3 mb-4">
                            <li>First prize: $1,000</li>
                            <li>Second prize: $500</li>
                            <li>Third prize: $300</li>
                        </ul>
                        <button type="button" class="w-100 btn btn-lg btn-warning">Get started</button>
                    </div>
                </div>
            </div>
        </div>
        <h1 class="text-white" id="tim">Timeline</h1>
        <div id="timeline-content">
            <ul class="timeline">
                <li class="event" data-date="Now">
                    <h3>Training Dataset Released</h3>
                    <p>Now availabe <a href="https://seasondepth.github.io/">here</a></p>
                </li>
                <li class="event" data-date="Time TBD">
                    <h3>Releasing Test Set</h3>
                    <p>Announce on the website and sign-up <a href="#signup_btn">here</a> to receive notification</p>
                </li>
                <li class="event" id="date" data-date="Time TBD">
                    <h3>Submission Deadline</h3>
                    <p></p> <p>Don't forget to include your code in your submission&nbsp;</p>
                </li>

                <li class="event" data-date="Time TBD">

                    <h3>Award Decision Announcement</h3>

                    <p>Get up to $1,000 !</p></li>
            </ul>
        </div>
        <h1 class="text-white" id="org">Organizers</h1>
        <div class="container text-center p-3 text-white" >
            <!-- Three columns of text below the carousel -->
            <div class="row">
                <div class="col"> <img src="${APP_PATH}/static/people-image/hanjiang.png" class="rounded-circle" width="140">
                    <h2>Hanjiang Hu</h2>
                    <p>Ph.D. @ CMU</p>
                </div>
                <!-- /.col-lg-4 -->
                <div class="col"> <img src="${APP_PATH}/static/people-image/jiacheng.png" class="rounded-circle" width="140">
                    <h2>Jiacheng Zhu</h2>
                    <p>Ph.D. @ CMU</p>
                </div>
                <!-- /.col-lg-4 -->
                <div class="col"> <img src="${APP_PATH}/static/people-image/zuxin.jpg" class="rounded-circle" width="140">
                    <h2>Zuxin Liu</h2>
                    <p>Ph.D. @ CMU</p>
                </div>
                <div class="col"> <img src="${APP_PATH}/static/people-image/wenhao.jpg" class="rounded-circle" width="140">
                    <h2>Wenhao Ding</h2>
                    <p>Ph.D. @ CMU</p>
                </div>
                <div class="col"> <img src="${APP_PATH}/static/people-image/linyi.png" class="rounded-circle" width="140">
                    <h2>Linyi Li</h2>
                    <p>Ph.D. @ UIUC</p>
                </div>
                <!-- /.col-lg-4 -->
            </div>
            <!-- /.row -->
        </div>
        <div class="container text-center p-3 text-white">
            <!-- Three columns of text below the carousel -->
            <div class="row">
                <!-- /.col-lg-4 -->
                <div class="col-lg-3"> <img src="${APP_PATH}/static/people-image/shuai.png" class="rounded-circle" width="140">
                    <h2>Shuai Wang</h2>
                    <p>Master @ CMU</p>
                </div>
                <div class="col-lg-3"> <img src="${APP_PATH}/static/people-image/jiarun.JPG" class="rounded-circle" width="140">
                    <h2>Jiarun Wei</h2>
                    <p>Master @ CMU</p>
                </div>
                <!-- /.col-lg-4 -->
                <div class="col-lg-3"> <img src="${APP_PATH}/static/people-image/baoquan.jpg" class="rounded-circle" width="140">
                    <h2>Baoquan Yang</h2>
                    <p>Undergraduate @ SJTU</p>
                </div>
                <div class="col-lg-3"> <img src="${APP_PATH}/static/people-image/zhijian.jpg" class="rounded-circle" width="140">
                    <h2>Zhijian Qiao</h2>
                    <p>Master @ SJTU</p>
                </div>
                <!-- /.col-lg-4 -->
            </div>
            <!-- /.row -->
        </div>
        <div class="container marketing p-3 text-white">
            <!-- Three columns of text below the carousel -->
            <div class="row">
                <div class="col"> <img src="${APP_PATH}/static/people-image/ding.jpg" class="rounded-circle mx-auto d-block" width="140">
                    <h2 class="text-center">Ding Zhao</h2>
                    <p class="text-center">Assistant Professor @ CMU</p>
                </div>

                <div class="col"> <img src="${APP_PATH}/static/people-image/bo.png" class="rounded-circle d-block mx-auto" width="140">
                    <h2 class="text-center">Bo Li</h2>
                    <p class="text-cen text-center">Assistant Professor @&nbsp; UIUC</p>
                </div>
                <!-- /.col-lg-4 -->
                <div class="col"> <img src="${APP_PATH}/static/people-image/hesheng.png" class="rounded-circle d-block mx-auto" width="140">
                    <h2 class="text-center">Hesheng Wang</h2>
                    <p class="text-cen text-center">Professor @&nbsp; SJTU</p>
                </div>
                <!-- /.col-lg-4 -->
                <!-- /.col-lg-4 -->
            </div>
            <!-- /.row -->
        </div>
        <footer class="container p-5">
            <p class="float-lg-end"><a href="#">Back to top</a></p>
            <p class="text-white">&copy; The SeasonDepth Committee &middot; <a href="#">Privacy</a> &middot; <a href="#">Terms</a></p>
        </footer>
    </div>
<%--    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>--%>
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
