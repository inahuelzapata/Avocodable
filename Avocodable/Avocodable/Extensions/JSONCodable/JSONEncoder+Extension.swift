//
//  JSONEncoder+Extension.swift
//  Avocodable
//
//  Created by Nahuel Zapata on 9/2/18.
//  Copyright © 2018 iNahuelZapata. All rights reserved.
//

import Foundation

extension JSONEncoder {
    func encodeJSONObject<T: Encodable>(_ value: T,
                                        options opt: JSONSerialization.ReadingOptions = []) throws -> Any {
        let data = try encode(value)

        return try JSONSerialization.jsonObject(with: data, options: opt)
    }
}
