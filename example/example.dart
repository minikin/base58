import 'dart:convert';

import 'package:base58/base58.dart';

void main() {
  /// Initialize btcBase58 class.
  final btcBase58 = Base58.btc();

  /// Encode raw bytes to String.
  final encodedString = btcBase58.encode([
    84,
    104,
    105,
    115,
    32,
    105,
    115,
    32,
    98,
    97,
    115,
    101,
    53,
    56,
    32,
    101,
    120,
    97,
    109,
    112,
    108,
    101,
    46,
  ]);
  print(encodedString);

  /// Prints:
  /// `2k7m8YHnAT7drBUN3ri5ajasSA5sqWAq`

  /// Decode String to Raw bytes.
  final decodedRawBytes = btcBase58.decode(encodedString);
  print(decodedRawBytes);

  /// Prints:
  /// `[84, 104, 105, 115, 32, 105, 115, 32, 98, 97, 115, 101, 53, 56, 32, 101, 120, 97, 109, 112, 108, 101, 46]`

  print(utf8.decode(decodedRawBytes));

  /// Prints:
  /// `This is base58 example.`
}
