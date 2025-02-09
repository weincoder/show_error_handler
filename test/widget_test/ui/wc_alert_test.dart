import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:show_error_handler/domain/wc_base_error.dart';
import 'package:show_error_handler/ui/wc_alert.dart';

void main() {
  group('WcAlert Widget Tests', () {
    testWidgets(
      'displays error message and title correctly',
      (WidgetTester tester) async {
        // Arrange
        final error = WcBaseError(
          title: 'Error',
          message: 'An unexpected error occurred.',
        );

        // Act
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: WcAlert(
                error: error,
                backgroundColor: Colors.red,
              ),
            ),
          ),
        );

        // Assert
        expect(find.text('Error'), findsOneWidget);
        expect(find.text('An unexpected error occurred.'), findsOneWidget);
        expect(find.byIcon(Icons.error_outline), findsOneWidget);
      },
    );

    testWidgets(
      'displays only error message when title is null',
      (WidgetTester tester) async {
        // Arrange
        final error = WcBaseError(message: 'An unexpected error occurred.');

        // Act
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: WcAlert(
                error: error,
                backgroundColor: Colors.red,
                textColor: Colors.white,
              ),
            ),
          ),
        );

        // Assert
        expect(find.text('An unexpected error occurred.'), findsOneWidget);
        expect(find.byIcon(Icons.error_outline), findsOneWidget);
      },
    );

    testWidgets(
      'displays alert with default colors',
      (WidgetTester tester) async {
        // Arrange
        final error = WcBaseError(
          title: 'Error',
          message: 'An unexpected error occurred.',
        );

        // Act
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: WcAlert(
                error: error,
              ),
            ),
          ),
        );

        // Assert
        final container = tester.widget<Container>(find.byType(Container));
        expect(
          (container.decoration as BoxDecoration?)?.color,
          Colors.deepPurple,
        );
        expect(find.text('An unexpected error occurred.'), findsOneWidget);
      },
    );

    testWidgets(
      'displays alert with custom text color',
      (WidgetTester tester) async {
        // Arrange
        final error = WcBaseError(
          title: 'Error',
          message: 'An unexpected error occurred.',
        );

        // Act
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: WcAlert(
                error: error,
                textColor: Colors.yellow,
              ),
            ),
          ),
        );

        // Assert
        final text =
            tester.widget<Text>(find.text('An unexpected error occurred.'));
        expect(text.style?.color, Colors.yellow);
      },
    );

    testWidgets(
      'showWcAlert displays alert and removes it after duration',
      (WidgetTester tester) async {
        // Arrange
        final error = WcBaseError(
          title: 'Error',
          message: 'An unexpected error occurred.',
        );

        // Act
        await tester.pumpWidget(
          MaterialApp(
            home: Builder(
              builder: (context) {
                return Scaffold(
                  body: Center(
                    child: ElevatedButton(
                      onPressed: () {
                        showWcAlert(
                          context,
                          error,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          durationSeconds: 1,
                        );
                      },
                      child: Text('Show Alert'),
                    ),
                  ),
                );
              },
            ),
          ),
        );

        // Tap the button to show the alert
        await tester.tap(find.text('Show Alert'));
        await tester.pump();

        // Assert that the alert is displayed
        expect(find.text('Error'), findsOneWidget);
        expect(find.text('An unexpected error occurred.'), findsOneWidget);

        // Wait for the alert to be removed
        await tester.pump(Duration(seconds: 1));
        await tester.pumpAndSettle();

        // Assert that the alert is removed
        expect(find.text('Error'), findsNothing);
        expect(find.text('An unexpected error occurred.'), findsNothing);
      },
    );
  });
}
