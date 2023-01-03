import 'alphabet.dart';
import 'decoder.dart';
import 'encoder.dart';

class Base58 {
  final Alphabet alphabet;

  const Base58({required this.alphabet});

  @override
  int get hashCode => alphabet.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Base58 && other.alphabet == alphabet;
  }

  List<int> decodeAlphabet(String string) => Decoder.decode(string, alphabet);

  List<int> decodeBase58(String string) => Decoder.decode(string, alphabet);

  String encodeAlphabet(List<int> bin) => Encoder.encode(bin, alphabet);

  String encodeBase58(List<int> bin) => Encoder.encode(bin, alphabet);

  @override
  String toString() => 'Base58(alphabet: $alphabet)';
}
