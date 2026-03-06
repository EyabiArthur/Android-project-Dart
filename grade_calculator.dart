class GradeCalculator {

  // Function to calculate grade
  String calculateGrade(double score) {

    if (score >= 90) {
      return "A";
    } 
    else if (score >= 80) {
      return "B";
    } 
    else if (score >= 70) {
      return "C";
    } 
    else if (score >= 60) {
      return "D";
    } 
    else if (score >= 50) {
      return "E";
    } 
    else {
      return "F";
    }

  }
}