import 'dart:io';
import '../lib/student.dart';
import '../lib/grade_calculator.dart';

void main() {

  print("===== STUDENT GRADE CALCULATOR =====");

  // Input student name
  stdout.write("Enter Student Name: ");
  String name = stdin.readLineSync()!;

  // Input student score
  stdout.write("Enter Student Score: ");
  double score = double.parse(stdin.readLineSync()!);

  // Create Student Object
  Student student = Student(name, score);

  // Create GradeCalculator Object
  GradeCalculator calculator = GradeCalculator();

  // Calculate grade
  String grade = calculator.calculateGrade(student.score);

  // Display result
  print("\n===== STUDENT RESULT =====");
  print("Name  : ${student.name}");
  print("Score : ${student.score}");
  print("Grade : $grade");
}