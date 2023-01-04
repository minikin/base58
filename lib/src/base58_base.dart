import 'alphabet.dart';
import 'decoder.dart';
import 'encoder.dart';

class Base58 {
  final Alphabet alphabet;

  factory Base58.btc() => Base58._(alphabet: Alphabet.btc());

  factory Base58.flickr() => Base58._(alphabet: Alphabet.flickr());

  const Base58._({required this.alphabet});

  @override
  int get hashCode => alphabet.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Base58 && other.alphabet == alphabet;
  }

  List<int> decode(String string) => Decoder.decode(string, alphabet);

  String encode(List<int> bin) => Encoder.encode(bin, alphabet);

  @override
  String toString() => 'Base58(alphabet: $alphabet)';
}
