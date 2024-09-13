
<h1 align="center">Base58 encoding and decoding for Dart</h1>

<p align="center">
    <a href="https://github.com/minikin/base58/actions">
    <img src="https://github.com/minikin/base58/actions/workflows/dart.yml/badge.svg" alt="CI Status" />
  </a>
    
   <a href="https://github.com/minikin/base58/blob/main/LICENSE">
    <img src="https://img.shields.io/badge/license-MIT-blue.svg" alt="Result Type is released under the MIT license." />
  </a>

  <a href="https://github.com/minikin/base58/blob/main/CODE_OF_CONDUCT.md">
    <img src="https://img.shields.io/badge/PRs-welcome-brightgreen.svg" alt="PRs welcome!" />
  </a>
</p>

# Content

- [Content](#content)
  - [Features](#features)
  - [Requirements](#requirements)
  - [Install](#install)
  - [Example](#example)
  - [Support](#support)
  - [License](#license)

## Features

> The Base58 is a group of binary-to-text encoding schemes used to represent large integers as alphanumeric text.
> It's designed for use in Bitcoin and is used in many other cryptocurrencies.

- Encodes and decodes Base58.

## Requirements

- Dart: 2.18.6+

## Install

```yaml
dependencies:
  base58: ^0.0.1
```

## Example

The detailed example can be found at [base58/example/example.dart](https://github.com/minikin/base58/blob/main/example/example.dart).

```dart
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
```

To see examples of the following package in action:

```sh
cd example && dart run
```

## Support

Post issues and feature requests on the GitHub [issue tracker](https://github.com/minikin/base58/issues).

## License

The source code is distributed under the MIT license.
See the [LICENSE](https://github.com/minikin/base58/blob/main/LICENSE) file for more info.
