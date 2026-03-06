List<int> processList(List<int> numbers, bool Function(int) predicate) {
  List<int> result = [];

  for (int num in numbers) {
    if (predicate(num)) {
      result.add(num);
    }
  }

  return result;
}

void main() {
  List<int> nums = [1, 2, 3, 4, 5, 6];

  // Lambda function to get even numbers
  List<int> even = processList(nums, (n) => n % 2 == 0);

  print(even); // Output: [2, 4, 6]
}