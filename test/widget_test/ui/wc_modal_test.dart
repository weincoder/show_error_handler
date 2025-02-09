import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:show_error_handler/domain/wc_base_error.dart';
import 'package:show_error_handler/ui/wc_modal.dart';

void main() {
  testWidgets(
    'WcModal displays error message and icon',
    (WidgetTester tester) async {
      // Arrange
      final error = WcBaseError(
        title: 'Error Title',
        message: 'Error message goes here.',
      );

      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: WcModal(
              error: error,
            ),
          ),
        ),
      );

      // Assert
      expect(find.text('Error Title'), findsOneWidget);
      expect(find.text('Error message goes here.'), findsOneWidget);
      expect(find.byIcon(Icons.error_outline), findsOneWidget);
    },
  );

  testWidgets(
    'WcModal displays custom icon and colors',
    (WidgetTester tester) async {
      // Arrange
      final error = WcBaseError(
        title: 'Error Title',
        message: 'Error message goes here.',
      );

      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: WcModal(
              error: error,
              backgroundColor: Colors.red,
              textColor: Colors.black,
              icon: Icons.warning,
              iconColor: Colors.yellow,
            ),
          ),
        ),
      );

      // Assert
      final container = tester.widget<Container>(find.byType(Container));
      final boxDecoration = container.decoration as BoxDecoration;

      expect(boxDecoration.color, Colors.red);
      expect(find.text('Error Title'), findsOneWidget);
      expect(find.text('Error message goes here.'), findsOneWidget);
      expect(find.byIcon(Icons.warning), findsOneWidget);
      expect(
        find.byIcon(Icons.warning).evaluate().single.widget,
        isA<Icon>().having((icon) => icon.color, 'color', Colors.yellow),
      );
    },
  );

  testWidgets(
    'WcModal calls onPressed callback when action button is pressed',
    (WidgetTester tester) async {
      // Arrange
      bool buttonPressed = false;
      final error = WcBaseError(
        title: 'Error Title',
        message: 'Error message goes here.',
      );

      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: WcModal(
              error: error,
              onPressed: () {
                buttonPressed = true;
              },
            ),
          ),
        ),
      );

      await tester.tap(find.text('Action'));
      await tester.pump();

      // Assert
      expect(buttonPressed, isTrue);
    },
  );

  testWidgets(
    'WcModal displays error message and icon',
    (WidgetTester tester) async {
      // Arrange
      final error = WcBaseError(
        title: 'Error Title',
        message: 'Error message goes here.',
      );

      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: WcModal(
              error: error,
            ),
          ),
        ),
      );

      // Assert
      expect(find.text('Error Title'), findsOneWidget);
      expect(find.text('Error message goes here.'), findsOneWidget);
      expect(find.byIcon(Icons.error_outline), findsOneWidget);
    },
  );

  testWidgets(
    'WcModal displays custom icon and colors',
    (WidgetTester tester) async {
      // Arrange
      final error = WcBaseError(
        title: 'Error Title',
        message: 'Error message goes here.',
      );

      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: WcModal(
              error: error,
              backgroundColor: Colors.red,
              textColor: Colors.black,
              icon: Icons.warning,
              iconColor: Colors.yellow,
            ),
          ),
        ),
      );

      // Assert
      final container = tester.widget<Container>(find.byType(Container));
      final boxDecoration = container.decoration as BoxDecoration;

      expect(boxDecoration.color, Colors.red);
      expect(find.text('Error Title'), findsOneWidget);
      expect(find.text('Error message goes here.'), findsOneWidget);
      expect(find.byIcon(Icons.warning), findsOneWidget);
      expect(
        find.byIcon(Icons.warning).evaluate().single.widget,
        isA<Icon>().having((icon) => icon.color, 'color', Colors.yellow),
      );
    },
  );

  testWidgets(
    'WcModal calls onPressed callback when action button is pressed',
    (WidgetTester tester) async {
      // Arrange
      bool buttonPressed = false;
      final error = WcBaseError(
        title: 'Error Title',
        message: 'Error message goes here.',
      );

      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: WcModal(
              error: error,
              onPressed: () {
                buttonPressed = true;
              },
            ),
          ),
        ),
      );

      await tester.tap(find.text('Action'));
      await tester.pump();

      // Assert
      expect(buttonPressed, isTrue);
    },
  );

  testWidgets(
    'showWcModal displays and removes modal after duration',
    (WidgetTester tester) async {
      // Arrange
      final error = WcBaseError(
        title: 'Error Title',
        message: 'Error message goes here.',
      );

      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) {
                return ElevatedButton(
                  onPressed: () {
                    showWcModal(
                      context,
                      error,
                      durationSeconds: 1,
                    );
                  },
                  child: Text('Show Modal'),
                );
              },
            ),
          ),
        ),
      );

      await tester.tap(find.text('Show Modal'));
      await tester.pump();

      // Assert
      expect(find.text('Error Title'), findsOneWidget);
      expect(find.text('Error message goes here.'), findsOneWidget);

      // Act
      await tester.pump(Duration(seconds: 1));
      await tester.pump();

      // Assert
      expect(find.text('Error Title'), findsNothing);
      expect(find.text('Error message goes here.'), findsNothing);
    },
  );

  testWidgets(
    'showWcModal calls onPressed callback when action button is pressed',
    (WidgetTester tester) async {
      // Arrange
      bool buttonPressed = false;
      final error = WcBaseError(
        title: 'Error Title',
        message: 'Error message goes here.',
      );

      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) {
                return ElevatedButton(
                  onPressed: () {
                    showWcModal(
                      context,
                      error,
                      onPressed: () {
                        buttonPressed = true;
                      },
                    );
                  },
                  child: Text('Show Modal'),
                );
              },
            ),
          ),
        ),
      );

      await tester.runAsync(() async {
        await tester.tap(find.text('Show Modal'));
        await tester.pump();

        // Act
        await tester.tap(find.text('Action'));
        await tester.pump();

        // Assert
        expect(buttonPressed, isTrue);
      });
    },
  );
  testWidgets(
    'showWcModal displays and removes modal after duration',
    (WidgetTester tester) async {
      // Arrange
      final error = WcBaseError(
        title: 'Error Title',
        message: 'Error message goes here.',
      );

      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) {
                return ElevatedButton(
                  onPressed: () {
                    showWcModal(
                      context,
                      error,
                      durationSeconds: 1,
                    );
                  },
                  child: Text('Show Modal'),
                );
              },
            ),
          ),
        ),
      );

      await tester.tap(find.text('Show Modal'));
      await tester.pump();

      // Assert
      expect(find.text('Error Title'), findsOneWidget);
      expect(find.text('Error message goes here.'), findsOneWidget);

      // Act
      await tester.pump(Duration(seconds: 1));
      await tester.pump();

      // Assert
      expect(find.text('Error Title'), findsNothing);
      expect(find.text('Error message goes here.'), findsNothing);
    },
  );
}
