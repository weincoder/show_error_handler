import 'package:flutter_test/flutter_test.dart';
import 'package:show_error_handler/domain/wc_base_error.dart';

void main() {
  group('WcBaseError Tests', () {
    test('should return correct string representation', () {
      // Arrange
      const title = 'Error';
      const message = 'An unexpected error occurred.';
      final error = WcBaseError(title: title, message: message);

      // Act
      final result = error.toString();

      // Assert
      expect(result, 'An unexpected error occurred.');
    });
  });
}
