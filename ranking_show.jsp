<%--
  Created by IntelliJ IDEA.
  User: ws199
  Date: 1/12/2022
  Time: 8:15 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Ranking Page</title>
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
<!-- show page -->
<div class="container">
    <!-- Title -->
    <div class="row">
        <div class="col-md-12">
            <h1>Ranking Page</h1>
        </div>
    </div>
    <!-- Form Data -->
    <div class="row">
        <div class="col-md-12">
            <table class="table table-hover" id="result_table">
                <thead>
                <tr>
<%--                    <th>--%>
<%--                        <input type="checkbox" id="check_all"/>--%>
<%--                    </th>--%>
                    <th>user_name</th>
                    <th>method_name</th>
                    <th>url</th>
                    <th>sub_time</th>
                    <th>metrix1</th>
                    <th>metrix2</th>
                    <th>metrix3</th>
                    <th>metrix4</th>
                    <th>metrix5</th>
                    <th>metrix6</th>
                </tr>
                </thead>
                <tbody>

                </tbody>
            </table>
        </div>
    </div>

    <!-- page info -->
    <div class="row">
        <!--page info text  -->
        <div class="col-md-6" id="page_info_area"></div>
        <!-- page nav -->
        <div class="col-md-6" id="page_nav_area">

        </div>
    </div>

</div>

<script type="text/javascript">
    var totalRecord, currentPage;
    //1.  when complete jsp loading, send ajax request, get page info
    $(function(){
        //directly to first page
        to_page(1);
    });

    function to_page(pn){
        $.ajax({
            url:"${APP_PATH}/results",
            data:"pn="+pn,
            type:"GET",
            success:function(result){
                //console.log(result);
                //1、show results data
                build_result_table(result);
                // //2、show page info
                build_page_info(result);
                // //3、show page nav info
                build_page_nav(result);
            }
        });
    }

    //2. build form
    function build_result_table(result) {
        // empty table
        $("#result_table tbody").empty();
        var results = result.extend.pageInfo.list;
        $.each(results,function(index,item){
            var userNameTd = $("<td></td>").append(item.userName);
            var methodNameTd = $("<td></td>").append(item.methodName);
            var urlTd = $("<td></td>").append(item.publicationUrl);
            var subTimeTd = $("<td></td>").append(item.submissionTime);
            var metrix1Td = $("<td></td>").append(item.metrix1);
            var metrix2Td = $("<td></td>").append(item.metrix2);
            var metrix3Td = $("<td></td>").append(item.metrix3);
            var metrix4Td = $("<td></td>").append(item.metrix4);
            var metrix5Td = $("<td></td>").append(item.metrix5);
            var metrix6Td = $("<td></td>").append(item.metrix6);

            $("<tr></tr>").append(userNameTd)
                .append(methodNameTd)
                .append(urlTd)
                .append(subTimeTd)
                .append(metrix1Td)
                .append(metrix2Td)
                .append(metrix3Td)
                .append(metrix4Td)
                .append(metrix5Td)
                .append(metrix6Td)
                .appendTo("#result_table tbody");
        });
    }

    // 3. page info
    function build_page_info(result){

        $("#page_info_area").empty();
        $("#page_info_area").append("current"+result.extend.pageInfo.pageNum+"page,total"+
            result.extend.pageInfo.pages+"pages,total"+
            result.extend.pageInfo.total+"docs");
        totalRecord = result.extend.pageInfo.total;
        currentPage = result.extend.pageInfo.pageNum;
    }

    //nav, and go to next page
    function build_page_nav(result){
        //page_nav_area
        $("#page_nav_area").empty();
        var ul = $("<ul></ul>").addClass("pagination");

        //elements
        var firstPageLi = $("<li></li>").append($("<a></a>").append("First Page").attr("href","#"));
        var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;"));
        if(result.extend.pageInfo.hasPreviousPage == false){
            firstPageLi.addClass("disabled");
            prePageLi.addClass("disabled");
        }else{
            //add change page transaction
            firstPageLi.click(function(){
                to_page(1);
            });
            prePageLi.click(function(){
                to_page(result.extend.pageInfo.pageNum -1);
            });
        }



        var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;"));
        var lastPageLi = $("<li></li>").append($("<a></a>").append("末页").attr("href","#"));
        if(result.extend.pageInfo.hasNextPage == false){
            nextPageLi.addClass("disabled");
            lastPageLi.addClass("disabled");
        }else{
            nextPageLi.click(function(){
                to_page(result.extend.pageInfo.pageNum +1);
            });
            lastPageLi.click(function(){
                to_page(result.extend.pageInfo.pages);
            });
        }


        ul.append(firstPageLi).append(prePageLi);
        //page hint
        $.each(result.extend.pageInfo.navigatepageNums,function(index,item){

            var numLi = $("<li></li>").append($("<a></a>").append(item));
            if(result.extend.pageInfo.pageNum == item){
                numLi.addClass("active");
            }
            numLi.click(function(){
                to_page(item);
            });
            ul.append(numLi);
        });
        //next and final page hint
        ul.append(nextPageLi).append(lastPageLi);

        var navEle = $("<nav></nav>").append(ul);
        navEle.appendTo("#page_nav_area");
    }

</script>

</body>
</html>
