//
// Created by Tomasz Stachowiak on 15.01.24.
//

import Foundation


struct KeyedQueryStringEncodingContainer<Key>: KeyedEncodingContainerProtocol where Key: CodingKey {
    let codingPath: [CodingKey]
    private let container: QueryParametersEncoder.Data

    init(to container: QueryParametersEncoder.Data, codingPath: [CodingKey] = []) {
        self.container = container
        self.codingPath = codingPath
    }

    mutating func encodeNil(forKey key: Key) throws {
        container.encode(key: codingPath + [key], value: "")
    }

    mutating func encode(_ value: Bool, forKey key: Key) throws {
        container.encode(key: codingPath + [key], value: value.description)
    }

    mutating func encode(_ value: String, forKey key: Key) throws {
        let characters = CharacterSet(
                charactersIn: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789~-._"
        )
        container.encode(
                key: codingPath + [key],
                value: value.addingPercentEncoding(withAllowedCharacters: characters)!
        )
    }

    mutating func encode(_ value: Double, forKey key: Key) throws {
        container.encode(key: codingPath + [key], value: value.description)
    }

    mutating func encode(_ value: Float, forKey key: Key) throws {
        container.encode(key: codingPath + [key], value: value.description)
    }

    mutating func encode(_ value: Int, forKey key: Key) throws {
        container.encode(key: codingPath + [key], value: value.description)
    }

    mutating func encode(_ value: Int8, forKey key: Key) throws {
        container.encode(key: codingPath + [key], value: value.description)
    }

    mutating func encode(_ value: Int16, forKey key: Key) throws {
        container.encode(key: codingPath + [key], value: value.description)
    }

    mutating func encode(_ value: Int32, forKey key: Key) throws {
        container.encode(key: codingPath + [key], value: value.description)
    }

    mutating func encode(_ value: Int64, forKey key: Key) throws {
        container.encode(key: codingPath + [key], value: value.description)
    }

    mutating func encode(_ value: UInt, forKey key: Key) throws {
        container.encode(key: codingPath + [key], value: value.description)
    }

    mutating func encode(_ value: UInt8, forKey key: Key) throws {
        container.encode(key: codingPath + [key], value: value.description)
    }

    mutating func encode(_ value: UInt16, forKey key: Key) throws {
        container.encode(key: codingPath + [key], value: value.description)
    }

    mutating func encode(_ value: UInt32, forKey key: Key) throws {
        container.encode(key: codingPath + [key], value: value.description)
    }

    mutating func encode(_ value: UInt64, forKey key: Key) throws {
        container.encode(key: codingPath + [key], value: value.description)
    }

    mutating func encode<T>(_ value: T, forKey key: Key) throws where T: Encodable {
        if let date = value as? Date {
            let iso8601DateFormatter = ISO8601DateFormatter()
            iso8601DateFormatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
            let string = iso8601DateFormatter.string(from: date)
            try self.encode(string, forKey: key)
            return
        }

        let encoder = QueryParametersEncoder(to: container, codingPath: codingPath + [key])
        try value.encode(to: encoder)
    }


    mutating func nestedContainer<NestedKey>(
            keyedBy keyType: NestedKey.Type,
            forKey key: Key
    ) -> KeyedEncodingContainer<NestedKey> where NestedKey: CodingKey {
        let container = KeyedQueryStringEncodingContainer<NestedKey>(to: container, codingPath: codingPath + [key])
        return KeyedEncodingContainer(container)
    }

    func nestedUnkeyedContainer(forKey key: Key) -> UnkeyedEncodingContainer {
        fatalError("nestedUnkeyedContainer(forKey:) has not been implemented")
    }

    func superEncoder() -> Encoder {
        fatalError("superEncoder() has not been implemented")
    }

    func superEncoder(forKey key: Key) -> Encoder {
        fatalError("superEncoder(forKey:) has not been implemented")
    }
}
