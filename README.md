# show_error_handler

A Flutter package that provides a convenient and customizable way to display errors to the user.

This package simplifies error handling by providing a centralized mechanism to present error messages, handling different error types gracefully, and offering flexibility in how errors are displayed. It allows developers to define custom error presenters and easily integrate them into their applications.

## Features

*   **Centralized Error Handling:** Manage and display errors from anywhere in your application through a single point.
*   **Customizable Error Presentation:** Define how errors are shown to the user, whether through SnackBars, dialogs, or other UI elements. This package provides `WcAlert` for simple alerts and `WcModal` for more interactive error displays.
*   **Error Type Handling:** Handle different types of errors (e.g., network errors, validation errors) with specific presentations using the `WcBaseError` class to structure your errors.
*   **Easy Integration:** Simple to integrate into existing Flutter projects.
*   **Extensible:** Allows for customization of the alert and modal widgets.

## Getting started

Add `show_error_handler` to your `pubspec.yaml` dependencies:

```yaml
dependencies:
  show_error_handler: ^latest_version 
```

## Usage

Claro, aquí tienes el contenido del README en formato Markdown, combinando toda la información que te proporcioné en un único archivo:

Markdown

# show_error_handler

A Flutter package that provides a convenient and customizable way to display errors to the user.

This package simplifies error handling by providing a centralized mechanism to present error messages, handling different error types gracefully, and offering flexibility in how errors are displayed. It allows developers to define custom error presenters and easily integrate them into their applications.

## Features

*   **Centralized Error Handling:** Manage and display errors from anywhere in your application through a single point.
*   **Customizable Error Presentation:** Define how errors are shown to the user, whether through SnackBars, dialogs, or other UI elements. This package provides `WcAlert` for simple alerts and `WcModal` for more interactive error displays.
*   **Error Type Handling:** Handle different types of errors (e.g., network errors, validation errors) with specific presentations using the `WcBaseError` class to structure your errors.
*   **Easy Integration:** Simple to integrate into existing Flutter projects.
*   **Extensible:** Allows for customization of the alert and modal widgets.

## Getting started

Add `show_error_handler` to your `pubspec.yaml` dependencies:

```yaml
dependencies:
  show_error_handler: ^latest_version  # Replace with the latest version
```
Then, run flutter pub get in your terminal.

## Usage

### Defining Errors
Use the WcBaseError class to create structured error objects:

```dart
import 'package:show_error_handler/show_error_handler.dart';

final myError = WcBaseError(
  message: 'An unexpected error occurred.',
  title: 'Error',
  code: '123',
  type: 'network',
  layer: 'data',
);
```

### Showing Alerts

Display a simple alert using the showWcAlert function:

```dart
import 'package:flutter/material.dart';
import 'package:show_error_handler/show_error_handler.dart';

showWcAlert(context, myError);
```

You can customize the alert's appearance:

```dart
showWcAlert(context, myError, backgroundColor: Colors.red, textColor: Colors.white);
```

### Showing Modals

Display a modal dialog with the error details and an optional action button using showWcModal:

```dart
showWcModal(context, myError, onPressed: () {
  // Handle the action, e.g., retry the operation
  print('Action button pressed!');
});
```
Customize the modal:

```dart
showWcModal(
  context,
  myError,
  backgroundColor: Colors.blue,
  textColor: Colors.yellow,
  icon: Icons.warning,
  iconColor: Colors.white,
  onPressed: () {
    // ...
  },
);

```

## Example

```dart
import 'package:flutter/material.dart';
import 'package:show_error_handler/show_error_handler.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final wcBaseError = WcBaseError(
    message: 'This is a message',
    title: 'This is a title',
  );
  int _counter = 0;

  void _showWcAlert() {
    showWcAlert(context, wcBaseError);
  }

  void _showWcModal() {
    showWcModal(context, wcBaseError, onPressed: () {
      setState(() {
        _counter--;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            FloatingActionButton(
              onPressed: _showWcAlert,
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            ),
            const SizedBox(width: 10),
            FloatingActionButton(
              onPressed: _showWcModal,
              tooltip: 'Second Button',
              child: const Icon(Icons.remove),
            ),
          ],
        ));
  }
}
```
