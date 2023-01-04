import 'package:base58/src/constants.dart';

import 'alphabet.dart';
import 'base58_exception.dart';

mixin Decoder {
  static List<int> decode(
    String str,
    Alphabet alphabet,
  ) {
    if (str.isEmpty) {
      throw Base58Exception.emptyString;
    }

    var zero = alphabet.encode[0];
    var b58sz = str.length;

    var zcount = 0;
    for (var i = 0; i < b58sz && str.runes.toList()[i] == zero; i++) {
      zcount++;
    }

    var c = 0;
    var t = 0;
    var binu = List<int>.filled(2 * ((b58sz * 406 ~/ 555) + 1), 0);

    var outi = List<int>.filled((b58sz + 3) >> 2, 0);

    for (final r in str.runes) {
      if (r > 127) {
        throw Base58Exception.invalidDigitOnHighBit;
      }

      if (alphabet.decode[r] == -1) {
        throw Base58Exception.invalidBase58Digit(r);
      }

      c = alphabet.decode[r];

      for (var j = outi.length - 1; j >= 0; j--) {
        if (support64) {
          t = outi[j] * 58 + c;
          c = t >> 32;
          outi[j] = t & 0xffffffff;
        } else {
          t = outi[j] * 58 + c;
          c = (outi[j] * 58 + c) ~/ 0xffffffff;
          outi[j] = t & 0xffffffff;
        }
      }
    }

    var mask = ((b58sz % 4) * 8) & 0xffffffff;
    if (mask == 0) {
      mask = 32;
    }
    mask = (mask - 8) & 0xffffffff;

    var outLen = 0;
    for (var j = 0; j < outi.length; j++) {
      for (; mask < 32;) {
        binu[outLen] = (outi[j] >> mask) & 0xff;
        mask = (mask - 8) & 0xffffffff;
        outLen++;
      }
      mask = 24;
    }

    for (var msb = zcount; msb < binu.length; msb++) {
      if (binu[msb] > 0) {
        return binu.sublist(msb - zcount, outLen);
      }
    }

    return binu.sublist(0, outLen);
  }
}
