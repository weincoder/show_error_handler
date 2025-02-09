## 0.0.1 Initial Release

🚀 **Introducing show_error_handler**: This package provides a streamlined approach to displaying errors in your Flutter applications.

### Features:
- **WcBaseError**: A fundamental class for structuring error information, including message, code, title, description, type, and origin layer.

## 0.0.2

🔔 **New Feature: WcAlert**

### Features:
- **WcAlert Widget**: A versatile widget for presenting error alerts with customizable background and text colors.
- **showWcAlert Function**: A convenient function to trigger the display of WcAlert messages.

### Example Usage:
```dart
WcAlert(
    error: WcBaseError(title: 'Error', message: 'An unexpected error occurred.'),
    backgroundColor: Colors.red,
    textColor: Colors.white,
)
```

## 0.0.3

📢 **New Feature: WcModal**

### Features:
- **WcModal Widget**: A modal widget for displaying errors with an icon, message, and an optional action button.
- **showWcModal Function**: A function to present WcModal dialogs with customizable appearance and action callbacks.

### Example Usage:
```dart
WcModal(
    error: WcBaseError(
        title: 'Error Title',
        message: 'Error message goes here.',
    ),
    backgroundColor: Colors.red,
    textColor: Colors.white,
    icon: Icons.error,
    iconColor: Colors.white,
    onPressed: () {
        print('Action button pressed');
    },
);
```
