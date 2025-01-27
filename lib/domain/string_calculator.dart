class StringCalculator {
  /// Extracts the delimiter from the input string.
  List<int> extractDelimiter(String input) {
    String delimiterPattern = ','; // Default delimiter

    // Step 1: Check if custom delimiters are defined
    if (input.startsWith('//')) {
      final delimiterSection = input.substring(2, input.indexOf('\n'));
      final customDelimiters = RegExp(r'\[(.*?)\]')
          .allMatches(delimiterSection)
          .map((match) => RegExp.escape(match.group(1)!))
          .toList();

      // Single custom delimiter without brackets
      if (customDelimiters.isEmpty) {
        delimiterPattern = RegExp.escape(delimiterSection);
      } else {
        delimiterPattern =
            customDelimiters.join('|'); // Combine multiple delimiters
      }

      // Remove the delimiter section from the input
      input = input.substring(input.indexOf('\n') + 1);
    }

    // Step 2: Split numbers by the combined delimiters
    final numbers = input
        .split(RegExp(
            '[$delimiterPattern\n]')) // Split using delimiters and newlines
        .where((num) => num.isNotEmpty) // Remove empty strings
        .map((num) => int.parse(num)) // Convert each part to an integer
        .toList();
    return numbers;
  }

  /// Remove number bigger than 1000 .
  List<int> _removeBiggerNumbers(List<int> numbers) {
    return numbers.where((num) => num <= 1000).toList();
  }

  /// Ensures no negative numbers are present in the input array.
  bool _ensureNoNegatives(List<int> nums) {
    final negatives = nums.where((num) => num < 0).toList();
    if (negatives.isNotEmpty) {
      return true;
      throw ArgumentError('Negative numbers not allowed: $negatives');
    }
    return false;
  }

  /// Calculates the sum of the numbers.
  int _calculateSum(List<int> nums) {
    return nums.fold(0, (sum, num) => sum + num);
  }

  /// Adds the numbers in the input string.
  int add(String numbers) {
    if (numbers.isEmpty) {
      return 0;
    }

    final numList = extractDelimiter(numbers);
    final nums = _removeBiggerNumbers(numList);
    bool isNegative = _ensureNoNegatives(nums);

    if (isNegative) {
      return -1;
    } else {
      return _calculateSum(nums);
    }
  }
}
