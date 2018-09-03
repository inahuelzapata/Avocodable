//
//  HTTPRequest.swift
//  Avocodable
//
//  Created by Nahuel Zapata on 9/2/18.
//  Copyright © 2018 iNahuelZapata. All rights reserved.
//

import Alamofire
import Foundation

public typealias HTTPHeaders = [String: String]

public struct HTTPRequest: HTTPRequestable {

    public var endpoint: Endpoint

    public var method: HTTPMethod

    public var encoding: JSONEncoding

    public var headers: HTTPHeaders

    public var keyDecodingStrategy: JSONDecoder.KeyDecodingStrategy

    public var params: Request

    public var response: Response

    public init(endpoint: Endpoint,
                httpMethod: HTTPMethod,
                parameters: Request,
                response: Response,
                encoding: JSONEncoding = JSONEncoding.default,
                headers: HTTPHeaders,
                decodingStrategy: JSONDecoder.KeyDecodingStrategy) {
        self.endpoint = endpoint
        self.method = httpMethod
        self.params = parameters
        self.response = response
        self.encoding = encoding
        self.headers = headers
        self.keyDecodingStrategy = decodingStrategy
    }
}
