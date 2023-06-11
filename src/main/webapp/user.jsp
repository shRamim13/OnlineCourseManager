<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
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
        <a href="index.html" class="navbar-brand d-flex align-items-center px-4 px-lg-5">
            <h2 class="m-0 text-primary"><i class="fa fa-book me-3"></i>eCLASS</h2>
        </a>
        <button type="button" class="navbar-toggler me-4" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarCollapse">
            <div class="navbar-nav ms-auto p-4 p-lg-0">
                <a href="Admin" class="nav-item nav-link active">Home</a>
                <a href="Logout" class="nav-item nav-link active">Log out</a>
            </div>
        </div>
    </nav>
    <!-- Navbar End -->

    <br> <br>
	
    <div class="jumbotron jumbotron-fluid">
        <div class="container">
            <h1 class="display-4">Welcome <%= request.getAttribute("full_name") %>
            </h1>
            <p class="lead">Administration Desk</p>
        </div>
    </div>

    <br> <br>

    <div class="container">
        <div class="row">
            <div class="col-md-4">

                <div class="card">
                    <div class="card-header">Add User</div>
                    <div class="card-body">
                    	<!-- User registration form start -->
                        <form method="post" action="AddUser">
                            <div class="form-group">
                                <label for="usernumber" class="form-label">Number of users</label>
                                <input type="number" class="form-control" id="usernumber" name="usernumber" placeholder="1"
                                    required>
                            </div>
                            <div class="form-group">
                                <label for="usertype">User Type</label>
                                <select class="form-select" id="usertype" name="usertype" required>
                                    <option value="" selected disabled>Select type</option>
                                    <option value="teacher">Teacher</option>
                                    <option value="student">Student</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="department" class="form-label">Department</label>
                                <input type="text" class="form-control" id="department" name="department" placeholder="Enter full name"
                                    required>
                            </div>
                            <div class="form-group">
                                <label for="userid" class="form-label">Starting User ID</label>
                                <input type="text" class="form-control" id="userid" name="userid" placeholder="Enter user ID"
                                    required>
                            </div>
                            <button type="submit" class="btn btn-primary custom-button mt-3">Add user</button>
                        </form>
                        <!-- User registration form end -->
                        
                        
                    </div>
                </div>
            </div>

            <div class="col-md-8">
            	<!-- All existing users -->
                <table class="table table-striped table-bordered">
                    <thead>
                        <tr>
                            <th scope="col">User name</th>
                            <th scope="col">User type</th>
                            <th scope="col">User ID</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${courses}" var="i">
                            <tr>
                                <td>${i[0]}</td>
                                <td>${i[1]}</td>
                                <td>${i[2]}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</body>
</html>