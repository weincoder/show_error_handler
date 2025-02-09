import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:example/main.dart';

void main() {
  testWidgets('Show WcAlert test', (WidgetTester tester) async {
    await tester.runAsync(() async {
      // Arrange
      await tester.pumpWidget(const MyApp());

      // Act
      await tester.tap(find.byIcon(Icons.add));
      await tester.pump();

      // Assert
      expect(find.text('This is a title'), findsOneWidget);
      expect(find.text('This is a message'), findsOneWidget);
    });
  });

  testWidgets('Show WcModal test', (WidgetTester tester) async {
    await tester.runAsync(() async {
      // Arrange
      await tester.pumpWidget(const MyApp());

      // Act
      await tester.tap(find.byIcon(Icons.remove));
      await tester.pump();

      // Assert
      expect(find.text('This is a title'), findsOneWidget);
      expect(find.text('This is a message'), findsOneWidget);
    });
  });
}
