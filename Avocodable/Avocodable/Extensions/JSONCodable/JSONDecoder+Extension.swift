//
//  JSONDecoder+Extension.swift
//  Avocodable
//
//  Created by Nahuel Zapata on 9/2/18.
//  Copyright © 2018 iNahuelZapata. All rights reserved.
//

import Foundation

public extension JSONDecoder {
    func decode<T: Decodable>(_ type: T.Type,
                              withJSONObject object: Any,
                              options opt: JSONSerialization.WritingOptions = .prettyPrinted) throws -> T {
        let data = try JSONSerialization.data(withJSONObject: object, options: opt)

        return try decode(T.self, from: data)
    }

    func decodeRequest<T: RequestEncodable>(_ type: T.Type,
                                            withJSONObject object: Any,
                                            options opt: JSONSerialization.WritingOptions = .prettyPrinted) throws -> T {
        let data = try JSONSerialization.data(withJSONObject: object, options: opt)

        return try decode(T.self, from: data)
    }
}
