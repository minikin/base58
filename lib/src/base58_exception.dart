class Base58Exception {
  final String message;

  const Base58Exception._({required this.message});

  static Base58Exception get notBase58Alphabet => Base58Exception._(
        message: 'Alphabets must be 58 bytes long.',
      );

  static Base58Exception get notDistinctValues => Base58Exception._(
        message: 'Alphabet does not consist of 58 distinct characters.',
      );

  static Base58Exception get emptyString => Base58Exception._(
        message: 'Empty string',
      );

  static Base58Exception get invalidDigitOnHighBit => Base58Exception._(
        message: 'High-bit set on invalid digit.',
      );

  static Base58Exception invalidBase58Digit(int r) => Base58Exception._(
        message: 'Invalid base58 digit ${String.fromCharCode(r)}.',
      );
}
