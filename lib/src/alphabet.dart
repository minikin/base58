import 'base58_exception.dart';
import 'constants.dart';

class Alphabet {
  late List<int> decode;
  late List<int> encode;

  factory Alphabet.btc() => Alphabet._(btcAlphabet);

  factory Alphabet.flickr() => Alphabet._(flickrAlphabet);

  Alphabet._(String string) {
    if (string.length != 58) {
      throw Base58Exception.notBase58Alphabet;
    }

    encode = string.codeUnits;

    decode = List<int>.filled(128, -1);

    var distinct = 0;

    encode.asMap().forEach((i, b) {
      if (decode[b] == -1) {
        distinct++;
      }
      decode[b] = i & 0xff;
    });

    if (distinct != 58) {
      throw Base58Exception.notDistinctValues;
    }
  }
}
