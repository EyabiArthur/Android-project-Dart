class Student {
  String name;
  double score;

  // Constructor
  Student(this.name, this.score);

  void displayStudent() {
    print("Student Name: $name");
    print("Student Score: $score");
  }
}