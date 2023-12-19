<%-- 
    Document   : adminhome
    Created on : 17 Oct, 2023, 5:37:05 PM
    Author     : Hemant
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="connect.DbManager"%>
<%
    if(session.getAttribute("adminid")==null){
        response.sendRedirect("../login.jsp");
    } else{
        
  
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Home</title>
        <link href="../css/bootstrap.css" rel="stylesheet"/>
        <script src="../js/bootstrap.bundle.js"></script>
    </head>
    <body>
        <div class="container">
            <jsp:include page="header.jsp"/>
            <div class="row">
                <div class="col-sm-12" style="min-height: 600px; background-color:lightgrey">
                    <h2 style="color:blue; text-align: center">Feedback Management</h2>
                    <table class="table table-bordered">
                        <tr>
                        <th>id</th>
                        <th>Name</th>
                        <th>Contact No</th>
                        <th>Email Address</th>
                        <th>Subject</th>
                        <th>Feedback</th>
                        <th>Date</th>
                        <th>Delete</th>
                        </tr>
                        
                        <%
                        DbManager dm = new DbManager();
                       String query="select * from response where responsetype='feedback'";
                       ResultSet rs = dm.select(query);
                       while(rs.next())
                       {
                        %>
                        <tr>
                        <td><%=rs.getInt("Id")%></td>
                        <td><%=rs.getString("name")%></td>
                        <td><%=rs.getString("contactno")%></td>
                        <td><%=rs.getString("emailaddress")%></td>
                        <td><%=rs.getString("subject")%></td> 
                         <td><%=rs.getString("responsetext")%></td>
                        <td><%=rs.getString("responsedate")%></td>  
                        <td>
                            <a href="deleteEnqu.jsp?id=<%=rs.getInt("id")%>&responsetype=<%=rs.getString("responsetype")%>">
                                <button type="button" class="btn btn-danger">Delete</button>
                            </a>
                        </td>
                        <tr>
                        <%}%>
                    </table>
                    
                </div>
            
        </div>
            <jsp:include page="footer.jsp"/>
        </div>
    </body>
</html>
<%}%>