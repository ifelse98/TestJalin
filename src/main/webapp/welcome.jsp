<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>Welcome Page</title>
<style>
body {
	font-family: Arial, sans-serif;
	margin: 20px;
}

h2 {
	color: #333;
}

table {
	border-collapse: collapse;
	width: 100%;
}

th, td {
	border: 1px solid #ddd;
	padding: 8px;
	text-align: center;
}

th {
	background-color: #f2f2f2;
}

tr:nth-child(even) {
	background-color: #f2f2f2;
}

a {
	text-decoration: none;
	color: #007bff;
}

a:hover {
	text-decoration: underline;
}
</style>
<script>
        function showUserId() {
        	var userId = '<%=session.getAttribute("userId")%>';
		alert("Student Name: " + userId);
	}
</script>
</head>
<body>
	<h2>
		Welcome: <a href="#" onclick="showUserId();"><%=session.getAttribute("userId")%></a>
	</h2>
	<table border="1">
		<tr>
			<th>Department</th>
			<th>Student ID</th>
			<th>Marks</th>
			<th>Pass %</th>
		</tr>
		<c:forEach var="department" items="${departments}">
			<c:set var="passCount" value="0" />
			<c:set var="totalStudents" value="0" />
			<c:forEach var="student" items="${students}">
				<c:if test="${student.department == department}">
					<tr>
						<c:if test="${totalStudents == 0}">
							<td rowspan="${departmentRowCountMap[department]}">${department}</td>
						</c:if>
						<td>${student.studentID}</td>
						<td>${student.mark}</td>
						<c:if test="${student.mark >= 40}">
							<c:set var="passCount" value="${passCount + 1}" />
						</c:if>
						<c:set var="totalStudents" value="${totalStudents + 1}" />
						<c:if test="${totalStudents == departmentRowCountMap[department]}">
							<td><c:choose>
									<c:when test="${totalStudents > 0}">
										<c:out value="${(passCount * 100.0 / totalStudents)}" />
									</c:when>
									<c:otherwise>
                                        0.0
                                    </c:otherwise>
								</c:choose></td>
						</c:if>
					</tr>
				</c:if>
			</c:forEach>
		</c:forEach>
	</table>
</body>
</html>
