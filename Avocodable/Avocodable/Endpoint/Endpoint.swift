//
//  Endpoint.swift
//  Avocodable
//
//  Created by Nahuel Zapata on 9/2/18.
//  Copyright © 2018 iNahuelZapata. All rights reserved.
//

import Foundation

public protocol Endpoint {
    var baseUrl: String { get }

    var path: String { get }

    func buildURL() -> String
}
