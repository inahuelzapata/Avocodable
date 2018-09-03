//
//  JSONDecoderStrategy+Extension.swift
//  Avocodable
//
//  Created by Nahuel Zapata on 9/2/18.
//  Copyright © 2018 iNahuelZapata. All rights reserved.
//

import Foundation

public extension JSONDecoder.KeyDecodingStrategy {
    // swiftlint:disable force_unwrapping
    static var convertFromUpperCamelCase: JSONDecoder.KeyDecodingStrategy {
        return .custom { codingKeys in

            var key = AnyCodingKey(codingKeys.last!)

            if let firstChar = key.stringValue.first {
                let i = key.stringValue.startIndex
                key.stringValue.replaceSubrange(
                    i ... i, with: String(firstChar).lowercased()
                )
            }

            return key
        }
    }
}
