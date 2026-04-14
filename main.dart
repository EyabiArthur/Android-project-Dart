import 'package:flutter/material.dart';

void main() {
  runApp(StudentApp());
}

class StudentApp extends StatelessWidget {
  const StudentApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StudentPage(),
    );
  }
}

class Student {
  String id;
  String name;
  String email;
  String course;
  double score;
  String grade;

  Student(this.id, this.name, this.email, this.course, this.score, this.grade);
}

class StudentPage extends StatefulWidget {
  const StudentPage({super.key});

  @override
  _StudentPageState createState() => _StudentPageState();
}

class _StudentPageState extends State<StudentPage> {
  final idController = TextEditingController();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final courseController = TextEditingController();
  final scoreController = TextEditingController();

  List<Student> students = [];

  String calculateGrade(double score) {
    if (score >= 80) return "A";
    if (score >= 70) return "B";
    if (score >= 60) return "C";
    if (score >= 50) return "D";
    return "F";
  }

  void addStudent() {
    String id = idController.text;
    String name = nameController.text;
    String email = emailController.text;
    String course = courseController.text;
    double score = double.tryParse(scoreController.text) ?? 0;

    if (id.isEmpty ||
        name.isEmpty ||
        email.isEmpty ||
        course.isEmpty) {
      return;
    }

    String grade = calculateGrade(score);

    setState(() {
      students.add(Student(id, name, email, course, score, grade));
    });

    clearFields();
  }

  void clearFields() {
    idController.clear();
    nameController.clear();
    emailController.clear();
    courseController.clear();
    scoreController.clear();
  }

  void deleteStudent(int index) {
    setState(() {
      students.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Student Manager"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            // INPUT FIELDS
            TextField(
              controller: idController,
              decoration: InputDecoration(labelText: "Student ID"),
            ),
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: "Name"),
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: "Email"),
            ),
            TextField(
              controller: courseController,
              decoration: InputDecoration(labelText: "Course"),
            ),
            TextField(
              controller: scoreController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Score"),
            ),

            SizedBox(height: 10),

            ElevatedButton(
              onPressed: addStudent,
              child: Text("Add Student"),
            ),

            SizedBox(height: 10),

            // TABLE HEADER
            Expanded(
              child: ListView.builder(
                itemCount: students.length,
                itemBuilder: (context, index) {
                  final s = students[index];
                  return Card(
                    child: ListTile(
                      title: Text("${s.name} (${s.id})"),
                      subtitle: Text(
                          "Email: ${s.email}\nCourse: ${s.course}\nScore: ${s.score} | Grade: ${s.grade}"),
                      trailing: IconButton(
                        icon: Icon(Icons.delete, color: Colors.red),
                        onPressed: () => deleteStudent(index),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}