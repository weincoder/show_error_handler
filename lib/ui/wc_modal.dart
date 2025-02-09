/// A modal widget that displays an error message along with an icon
/// and an optional action button. It is useful for scenarios where you need
/// to inform the user about an error and optionally provide a way to take action.
///
/// The widget takes the following parameters:
///
/// * `error`: An instance of [WcBaseError] that contains the error details.
/// * `backgroundColor`: The background color of the modal. Defaults to `Colors.deepPurple`.
/// * `textColor`: The color of the text displayed in the modal. Defaults to `Colors.white`.
/// * `icon`: The icon displayed at the top of the modal. Defaults to `Icons.error_outline`.
/// * `iconColor`: The color of the icon. Defaults to `Colors.white`.
/// * `onPressed`: An optional callback function that is triggered when the action button is pressed.
///
/// Example usage:
///
/// ```dart
/// WcModal(
///   error: WcBaseError(
///     title: 'Error Title',
///     message: 'Error message goes here.',
///   ),
///   backgroundColor: Colors.red,
///   textColor: Colors.white,
///   icon: Icons.error,
///   iconColor: Colors.white,
///   onPressed: () {
///     print('Action button pressed');
///   },
/// );
/// ```
///
/// This widget is stateless, meaning it does not maintain any state across rebuilds.
library;

import 'package:flutter/material.dart';

import '../domain/wc_base_error.dart';

class WcModal extends StatelessWidget {
  final WcBaseError error;
  final Color backgroundColor;
  final Color textColor;
  final IconData icon;
  final Color iconColor;
  final VoidCallback? onPressed;
  final String buttonText;

  const WcModal({
    super.key,
    required this.error,
    this.backgroundColor = Colors.deepPurple,
    this.textColor = Colors.white,
    this.icon = Icons.error_outline,
    this.iconColor = Colors.white,
    this.onPressed,
    this.buttonText = 'Action',
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        height: 300,
        padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Icon(
                icon,
                color: iconColor,
                size: 27.0,
              ),
            ),
            SizedBox(height: 27.0),
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
                  if (onPressed != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: ElevatedButton(
                        onPressed: onPressed,
                        child: Text(buttonText),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void showWcModal(
  BuildContext context,
  WcBaseError error, {
  Color backgroundColor = Colors.deepPurple,
  Color textColor = Colors.white,
  IconData icon = Icons.error_outline,
  Color iconColor = Colors.white,
  int durationSeconds = 3,
  double height = 300,
  double width = 200,
  Alignment alignment = Alignment.center,
  VoidCallback? onPressed,
  String buttonText = 'Action',
}) {
  final overlay = Overlay.of(context);
  late OverlayEntry overlayEntry;

  overlayEntry = OverlayEntry(
    builder: (context) => Align(
      alignment: alignment,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: width,
          height: height,
          child: WcModal(
            error: error,
            backgroundColor: backgroundColor,
            textColor: textColor,
            icon: icon,
            iconColor: iconColor,
            onPressed: () {
              if (onPressed != null) {
                onPressed();
              }
              if (overlayEntry.mounted) {
                overlayEntry.remove();
              }
            },
            buttonText: buttonText,
          ),
        ),
      ),
    ),
  );

  overlay.insert(overlayEntry);

  Future.delayed(Duration(seconds: durationSeconds), () {
    if (overlayEntry.mounted) {
      overlayEntry.remove();
    }
  });
}
