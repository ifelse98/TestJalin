package com.test.dynamic;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/StudentServlet")
public class StudentServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userId = request.getParameter("userId");
        String password = request.getParameter("password");
        
        // Valid user and password for demonstration purposes
        String validUserId = "admin";
        String validPassword = "root";
        
        if (userId.equals(validUserId) && password.equals(validPassword)) {
            List<Student> students = Student.getHardcodedStudentData();
            List<String> departments = Student.getDepartments(students);

            Map<String, Integer> departmentRowCountMap = new HashMap<>();
            for (String department : departments) {
                int rowCount = 0;
                for (Student student : students) {
                    if (student.getDepartment().equals(department)) {
                        rowCount++;
                    }
                }
                departmentRowCountMap.put(department, rowCount);
            }

            request.getSession().setAttribute("userId", userId);
            request.getSession().setAttribute("students", students);
            request.getSession().setAttribute("departments", departments);
            request.getSession().setAttribute("departmentRowCountMap", departmentRowCountMap);

            response.sendRedirect("welcome.jsp");
        } else {
            response.sendRedirect("login.jsp?error=1");
        }
    }
}
