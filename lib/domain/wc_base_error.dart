/// A base class for representing errors within the application.
///
/// This class provides a structured way to handle and report errors,
/// including a human-readable message, an optional error code, title,
/// detailed description, error type, and the layer where the error
/// originated.
class WcBaseError {
  /// Creates a new [WcBaseError].
  ///
  /// The [message] is required and provides a brief description of the error.
  /// The [code], [title], [description], [type], and [layer] are optional
  /// and provide additional context about the error.
  WcBaseError({
    required this.message,
    this.code,
    this.title,
    this.description,
    this.type,
    this.layer,
  });

  /// A short, human-readable message describing the error.
  final String message;

  /// An optional error code, typically a string, for programmatic handling.
  final String? code;

  /// An optional title for the error, often displayed to the user.
  final String? title;

  /// An optional detailed description of the error.
  final String? description;

  /// An optional type or category of the error.
  final String? type;

  /// An optional indication of the layer (e.g., presentation, data, domain)
  /// where the error occurred.
  final String? layer;

  /// Returns a string representation of the error, primarily the [message].
  @override
  String toString() {
    return message;
  }
}
