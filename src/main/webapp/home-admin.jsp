<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <title>eCLASS-Learn From Home</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600&family=Nunito:wght@600;700;800&display=swap" rel="stylesheet">

    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="lib/animate/animate.min.css" rel="stylesheet">
    <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="css/style.css" rel="stylesheet">
</head>

<body>
    <!-- Navbar Start -->
    <nav class="navbar navbar-expand-lg bg-white navbar-light shadow sticky-top p-0">
        <a href="index.jsp" class="navbar-brand d-flex align-items-center px-4 px-lg-5">
            <h2 class="m-0 text-primary"><i class="fa fa-book me-3"></i>eCLASS</h2>
        </a>
        <button type="button" class="navbar-toggler me-4" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarCollapse">
            <div class="navbar-nav ms-auto p-4 p-lg-0">
                <a href="#" class="nav-item nav-link active">Home</a>
                <a href="User" class="nav-item nav-link active">Add user</a>
                <a href="Logout" class="nav-item nav-link active">Log out</a>
                
            </div>
        </div>
    </nav>
    <!-- Navbar End -->
    
    <br> <br>
	
    <div class="jumbotron jumbotron-fluid">
        <div class="container">
        	<!-- Accessing the full name of admin -->
            <h3 class="display-4">Welcome <%= request.getAttribute("full_name") %>
            </h3>
            <p class="lead">Administration Desk</p>
        </div>
    </div>
    
    <br>
    
    <div class="container">
        <div class="row">
            <div class="col-md-4">

                <div class="card">
                    <div class="card-header">Add new Courses</div>
                    <div class="card-body">
                    	<!-- Course Registration form start -->
                        <form method="post" action="AddCourse">
                            <div class="form-group">
                                <label for="formGroupExampleInput">Course ID</label> <input type="text"
                                    class="form-control" name="courseId" placeholder="Like CSE401">
                            </div>
                            <div class="form-group">
                                <label for="formGroupExampleInput2">Course Name</label> <input type="text"
                                    class="form-control" name="courseName" placeholder="Like Web Technology">
                            </div>
                            <div class="form-group">
                                <label for="formGroupExampleInput2">Course Teacher Username</label> <input type="text"
                                    class="form-control" name="courseTeacher" placeholder="Like summit">
                            </div>
                            <button type="submit" class="btn btn-primary custom-button mt-3">Add course</button>
                        </form>
                        <!-- Course Registration form end -->
                    </div>
                </div>
            </div>

            <div class="col-md-8">
            	<!-- Existing course list -->
                <table class="table table-striped table-bordered">
                    <thead>
                        <tr>
                            <th scope="col">Course ID</th>
                            <th scope="col">Course Name</th>
                            <th scope="col">Course Teacher</th>
                            <th scope="col">Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${courses}" var="i">
                            <tr>
                                <td>${i[0]}</td>
                                <td>${i[1]}</td>
                                <td>${i[2]}</td>
                                <td>
                                    <form class="form-inline" method="post" action="RemoveCourse">
                                        <input type="hidden" name="id" value="${i[0]}">
                                        <button type="submit"
                                            class="btn btn-outline-danger btn-sm removebtn">Remove</button>
                                    </form>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</body>

</html>