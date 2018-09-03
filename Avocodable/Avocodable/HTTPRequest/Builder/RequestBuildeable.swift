//
//  HTTPRequestBuildeable.swift
//  Avocodable
//
//  Created by Nahuel Zapata on 9/2/18.
//  Copyright © 2018 iNahuelZapata. All rights reserved.
//

import Alamofire
import Foundation

public protocol HTTPRequestBuildeable {
    func build() -> HTTPRequestable

    func consume(endpoint: Endpoint) -> HTTPRequestBuildeable

    func withMethod(_ httpMethod: HTTPMethod) -> HTTPRequestBuildeable

    func withParams(params: Request) -> HTTPRequestBuildeable

    func expectedResponse(_ response: Response) -> HTTPRequestBuildeable

    func withHeaders(_ headers: [String: String]) -> HTTPRequestBuildeable

    func withEncoding(_ encoding: JSONEncoding) -> HTTPRequestBuildeable

    func withDecodingStrategy(_ strategy: JSONDecoder.KeyDecodingStrategy) -> HTTPRequestBuildeable
}
