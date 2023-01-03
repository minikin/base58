import 'dart:convert';

import 'package:base58/base58.dart';
import 'package:base58/src/alphabet.dart';

void main() {
  final base58 = Base58(alphabet: Alphabet.btc());

  final encodedString = base58.encodeBase58(utf8.encode('bitcoin'));

  print(encodedString);
}
