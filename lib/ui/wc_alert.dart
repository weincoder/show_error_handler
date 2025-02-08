/// A widget that displays an alert with a custom error message.
///
/// The [WcAlert] widget is a stateless widget that shows an alert box with a
/// specified error message and optional title. It provides customization options
/// for background color and text color.
///
/// The alert box includes an error icon, an optional title, and a message. The
/// title is displayed in bold if provided, and the message is displayed below
/// the title.
///
/// The [WcAlert] widget is typically used to show error messages in a user-friendly
/// manner within a Flutter application.
///
/// Example usage:
///
/// ```dart
/// WcAlert(
///   error: WcBaseError(title: 'Error', message: 'An unexpected error occurred.'),
///   backgroundColor: Colors.red,
///   textColor: Colors.white,
/// )
/// ```
///
/// Parameters:
/// - [error]: The error object containing the title and message to be displayed.
/// - [backgroundColor]: The background color of the alert box. Defaults to [Colors.deepPurple].
/// - [textColor]: The color of the text in the alert box. Defaults to [Colors.white].
///
/// See also:
/// - [WcBaseError], which defines the structure of the error object.
library;

import 'package:flutter/material.dart';

import '../domain/wc_base_error.dart';

class WcAlert extends StatelessWidget {
  final WcBaseError error;
  final Color backgroundColor;
  final Color textColor;

  const WcAlert({
    super.key,
    required this.error,
    this.backgroundColor = Colors.deepPurple,
    this.textColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.error_outline,
                  color: textColor,
                ),
                SizedBox(width: 9.0),
                Expanded(
                  child: Column(
                    children: [
                      if (error.title != null)
                        DefaultTextStyle(
                          style: TextStyle(
                            color: textColor,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                          child: Text(
                            error.title ?? '',
                          ),
                        ),
                      DefaultTextStyle(
                        style: TextStyle(
                          color: textColor,
                          fontSize: 16.0,
                        ),
                        child: Text(
                          error.message,
                          style: TextStyle(color: textColor, fontSize: 16.0),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

void showWcAlert(
  BuildContext context,
  WcBaseError error, {
  Color backgroundColor = Colors.deepPurple,
  Color textColor = Colors.white,
  int durationSeconds = 3,
}) {
  final overlay = Overlay.of(context);
  final overlayEntry = OverlayEntry(
    builder: (context) => Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 9),
        child: WcAlert(
          error: error,
          backgroundColor: backgroundColor,
          textColor: textColor,
        ),
      ),
    ),
  );

  overlay.insert(overlayEntry);

  Future.delayed(Duration(seconds: durationSeconds), overlayEntry.remove);
}
