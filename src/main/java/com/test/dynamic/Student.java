package com.test.dynamic;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class Student {
	private String studentID;
	private String studentName;
	private String department;
	private int mark;

	public Student(String studentID, String studentName, String department, int mark) {
		this.studentID = studentID;
		this.studentName = studentName;
		this.department = department;
		this.mark = mark;
	}

	public String getStudentID() {
		return studentID;
	}

	public String getStudentName() {
		return studentName;
	}

	public String getDepartment() {
		return department;
	}

	public int getMark() {
		return mark;
	}

	public static List<Student> getHardcodedStudentData() {
		List<Student> students = new ArrayList<>();
		students.add(new Student("1", "S1", "Dep 1", 35));
		students.add(new Student("2", "S2", "Dep 1", 70));
		students.add(new Student("3", "S3", "Dep 1", 60));
		students.add(new Student("4", "S4", "Dep 1", 90));
		students.add(new Student("5", "S5", "Dep 2", 30));
		students.add(new Student("6", "S6", "Dep 3", 32));
		students.add(new Student("7", "S7", "Dep 3", 70));
		students.add(new Student("8", "S8", "Dep 3", 20));
		return students;
	}

	public static List<String> getDepartments(List<Student> students) {
		Set<String> departmentSet = new HashSet<>();
		for (Student student : students) {
			departmentSet.add(student.getDepartment());
		}
		return new ArrayList<>(departmentSet);
	}
}