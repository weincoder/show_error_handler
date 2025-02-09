# Testing Guidelines

## AAA Structure

When writing tests, follow the AAA (Arrange, Act, Assert) structure:

1. **Arrange**: Set up the conditions for the test.
2. **Act**: Execute the behavior you want to test.
3. **Assert**: Verify that the behavior works as expected.

## Widget Test vs Unit Test

- **Unit Test**: Tests a single function, method, or class in isolation. It focuses on the smallest parts of the application to ensure they work correctly.

- **Widget Test**: Tests the UI components (widgets) of the application. It ensures that the widgets render correctly and interact as expected.

### Example

**Unit Test Example**:
```python
def test_addition():
    # Arrange
    a = 1
    b = 2

    # Act
    result = add(a, b)

    # Assert
    assert result == 3
```

**Widget Test Example**:
```dart
testWidgets('Counter increments smoke test', (WidgetTester tester) async {
  // Arrange
  await tester.pumpWidget(MyApp());

  // Act
  await tester.tap(find.byIcon(Icons.add));
  await tester.pump();

  // Assert
  expect(find.text('1'), findsOneWidget);
});
```