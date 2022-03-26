<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Users</title>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

    </head>
    <body>


        <div class="container">
            <div class="row">
                <div class="col">
                    <h1>User Management System</h1>

                    <table class="table">
                        <thead>
                            <tr>
                                <th>E-mail</th>
                                <th>First name</th>
                                <th>Last name</th>
                                <th>Active</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="user" items="${users}">
                                <tr>
                                    <td>${user.email}</td>
                                    <td>${user.firstName}</td>
                                    <td>${user.lastName}</td>
                                    <td>${user.active ? "Y" : "N"}</td>
                                    <td>
                                        <a href="user action=edit">Edit</a>
                                        <a href="user?action=delete&email=${user.email.replace("+", "%2B")}">Delete</a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class = "createUser">
                <div class="row">
                    <div class="col">
                        <h3>Add User</h3>
                        <form>
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>E-mail</th>
                                        <th>First name</th>
                                        <th>Last name</th>
                                        <th>Role</th>
                                        <th>Active</th>
                                        <th>Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td><input type="text" name="email" id="email"></td>
                                        <td><input type="text" name="fristName" id="fristName"></td>
                                        <td><input type="text" name="lastName" id="lastName"></td>
                                        <td>
                                            <select name="role" id="role">
                                                <option value="1">System Admin</option>
                                                <option value="2">Regular User</option>
                                                <option value="3">Company Admin</option>
                                        </td>
                                        <td>
                                            <input type="radio" name="active" id="true">Yes
                                            <br>
                                            <input type="radio" name="active" id="false">No
                                        </td>
                                        <td>
                                            <button name="action" id="addUser">Save</button>
                                            <button name="action" id="cancelAddUser">Cancel</button>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </form>
                    </div>
                </div>
            </div>
        </div>

    </body>
</html>
