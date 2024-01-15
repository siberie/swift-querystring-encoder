### QueryString encoder

This is a simple encoder for query strings. It is not a parser, so it does not
support decoding (yet).

## Usage

```swift

import QueryStringEncoder

struct Data: Encodable {
    let foo: String
    let bar: Int
}

let encoder = QueryStringEncoder()
let data = Data(foo: "foo", bar: 42)
let query = try encoder.encode(data)

print(query) // foo=foo&bar=42
```

## Installation

### Swift Package Manager

Add the following dependency to your `Package.swift` file:

```swift
.package(url: "https://github.com/siberie/swift-querystring-encoder.git", from: "0.1.0")
```
