import 'alphabet.dart';

class Encoder {
  static String encode(
    List<int> bin,
    Alphabet alphabet,
  ) {
    var size = bin.length;

    var zcount = 0;
    for (; zcount < size && bin[zcount] == 0;) {
      zcount++;
    }

    size = (zcount + (size - zcount) * 555 ~/ 406 + 1);

    var out = List<int>.filled(size, 0);

    var i = 0;
    var high = 0;

    high = size - 1;
    for (final b in bin) {
      i = size - 1;
      for (var carry = b; i > high || carry != 0; i--) {
        carry = (carry + 256 * (out[i])) & 0xffffffff;
        out[i] = carry % 58;
        carry = carry ~/ 58;
      }
      high = i;
    }

    final val = out.sublist(i - zcount);
    size = val.length;
    for (i = 0; i < size; i++) {
      out[i] = alphabet.encode[val[i]];
    }

    return String.fromCharCodes(out.sublist(0, size));
  }
}
