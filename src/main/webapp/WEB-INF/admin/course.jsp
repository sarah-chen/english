<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="baseurl" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>course</title>
    <link rel="stylesheet" type="text/css" href="styles/basic.css"/>
    <script type="application/javascript" src="scripts/jquery-3.1.1.js"></script>
       <style type="text/css">
        .white_content { 
           display: none;  
            position: absolute; 
            top: 25%; 
            left: 25%; 
            width: 40%; 
            padding: 20px; 
            border: 10px solid #008080; 
            background-color: white; 
            z-index:1002; 
            overflow: auto; 
        } 
    </style>
</head>
<body>
<jsp:include page="adminheader.jsp"></jsp:include>

        <div id="find">
            <form id="searchForm" method="POST" action="${baseurl}/selectParAdminCourse">
                <table>
                    <tr>
                        <td> <input name="coursename" type="text" id="search" ></td>
                        <td><input type="submit" value="查询" class="button"/></td>
                    </tr>
                </table>
            </form>
        </div>
        <div class="operation">课程管理：
        </div>
        <div>
            <table class="dt" border="0" cellspacing="1">
                <tr>
                    <th>序号</th>
                    <th>课程名字</th>
                    <th>课程类别</th>
                  <!--   <th>课程等级</th> -->
                   <!--  <th>课程时长</th> -->
                    <th>课程老师</th>
                    <th>点击率</th>
                     <th>课程图片</th>
                      <th>课程内容</th>
                    <th>修改</th>
                    <th>删除</th>
                </tr>
            <c:forEach items="${courseList}"  var="course">
     	<tr>
  			<td>${course.courseId}</td>
  			<td>${course.coursename}</td>
  			<td>${course.categoryId}</td>
  			<td>${course.teacher} </td>
  			<td>${course.clickrate}</td>
  			<td>${course.coursepic}</td>
  			<td>${course.coursecontent}</td>
  			
  			<td><a href = "JavaScript:void(0)" onclick = "document.getElementById('light${course.courseId}').style.display='block';document.getElementById('fade').style.display='block'">修改</a></td>
  			<td>   <a href="${baseurl}/delete?id=${course.courseId}">删除</a> </td>
  		<td>
  			<div class="white_content" id="light${course.courseId}">更新课程：

        
        <div class="ft">
            <form method="post" action="${pageContext.request.contextPath }/updateByCourseId" enctype="multipart/form-data">
                <table>
                 
                    <tr>
                        <td class="lable">课程名</td>
                        <td><input type="text" name="coursename" value="${course.coursename }" id="class"/></td>
                    </tr>
                    <tr>
                        <td class="lable">课程开始时间</td>
                        <td><input type="text" name="" id=""></td>
                    </tr>
                    <tr>
                        <td class="lable">课程等级</td>
                        <td><select name="gradeId" class="box">
							<option value="1">CET4</option>
							<option value="2">CET6</option>
							<option value="3">GRE</option>
							<option value="4">雅思</option>
							<option value="5">托福</option>
					</select></td>
                    </tr>
                    <tr>
                        <td class="lable">课程类别</td>
                        <td><select name="categoryId" class="box">
                            <option value="1">口语</option>
                            <option value="2">听力</option>
                            <option value="3">单词</option>
                            <option value="4">写作</option>
                            <option value="5">语法</option>
                             <option value="6">阅读</option>
                        </select>
                        </td>
                    </tr>

                    <tr>
                        <td class="lable">课程授课老师</td>
                        <td><input type="text" name="teacher" value="${course.teacher }" id="classTeacher"/></td>
                    </tr>
                    <tr>
                        <td class="lable">课程图片</td>
                        <td><input type="file"  name="course_pic" id="image"/></td>
                    </tr>
                    <tr>
                        <td class="lable">课程内容</td>
                        <td><input type="file" name="course_video"  id="video"/></td>
                    </tr>
                    <tr>
                        <td class="lable">课程简介</td>
                        <td><textarea name="courseintro" value="${course.courseintro }" rows="4" cols="30"></textarea></td>
                    </tr>
                    <tr>
                        <td class="lable">课程点击率</td>
                        <td><input type="text" readonly="readonly" name="clickrate" value="${course.clickrate}"/><br/></td>
                    </tr>
                  
                    <tr>
                        <td class="lable">课时</td>
                        <td><input type="text" name="period" value="${course.period}" id="keshi"/></td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <input type="submit" value="确认添加" class="button"/>
                            <input type="reset"  value="重置" class="button" id="reset" onclick = "document.getElementById('light${course.courseId}').style.display='none';document.getElementById('fade').style.display='none'"/>
                        </td>
                    </tr>
                    <tr>
                       
                        <td><input type="hidden" name="courseId" value="${course.courseId }" id="class"/></td>
                    </tr>
                </table>
            </form>
        </div>

    <div class="clearf"></div>


  		</div></td>
  		</tr>
  		
     </c:forEach> 
            </table>
            <div class="pagenav">
                <ul >
                    <li class="pageLeft">
                      <a href="${baseurl}/fowardCourse?page=${page.prePage}">上一页</a></li>
                    <li><a href="${baseurl}/fowardCourse?page=${1}">1</a></li>
                    <li><a href="${baseurl}/fowardCourse?page=${2}">2</a></li>
                    <li><a href="${baseurl}/fowardCourse?page=${3}">3</a></li>
                    <li><a href="${baseurl}/fowardCourse?page=${4}">4</a></li>
                    <li><a href="${baseurl}/fowardCourse?page=${5}">5</a></li>
                    <li class="pageRight">
                        <a href="${baseurl}/fowardCourse?page=${page.nextPage}">下一页</a></li>
              </ul> 
            </div>
        </div>
    </div>
    <div class="clearf"></div>
</div>
<script type="application/javascript">
    document.write("<script src='jquery-3.1.1.js'><\/script>");
    var $course = $("#menu a:eq(2)");
    $course.next().hide();
    $course.click(function () {
        if($course.next().is(":hidden")){
            $course.next().show();
        }else{
            $course.next().hide();
        }
    });
</script>
</body>
</html>