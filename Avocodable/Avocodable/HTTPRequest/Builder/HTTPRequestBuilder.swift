//
//  HTTPRequestBuilder.swift
//  Avocodable
//
//  Created by Nahuel Zapata on 9/2/18.
//  Copyright © 2018 iNahuelZapata. All rights reserved.
//

import Alamofire
import Foundation

public class HTTPRequestBuilder: HTTPRequestBuildeable {

    private var endpoint: Endpoint!

    private var method: HTTPMethod!

    private var params: RequestEncodable!

    private var response: ResponseDecodable!

    private var encoding = JSONEncoding()

    private var headers = [String: String]()

    private var keyDecodingStrategy = JSONDecoder.KeyDecodingStrategy.useDefaultKeys

    public init() { }

    @discardableResult
    public func build() -> HTTPRequestable {
        return HTTPRequest(endpoint: endpoint,
                           httpMethod: method,
                           parameters: params,
                           response: response,
                           encoding: encoding,
                           headers: headers,
                           decodingStrategy: keyDecodingStrategy)
    }

    @discardableResult
    public func consume(endpoint: Endpoint) -> HTTPRequestBuildeable {
        self.endpoint = endpoint

        return self
    }

    @discardableResult
    public func withMethod(_ httpMethod: HTTPMethod) -> HTTPRequestBuildeable {
        self.method = httpMethod

        return self
    }

    @discardableResult
    public func withParams(params: RequestEncodable) -> HTTPRequestBuildeable {
        self.params = params
        return self
    }

    @discardableResult
    public func expectedResponse(_ response: ResponseDecodable) -> HTTPRequestBuildeable {
        self.response = response

        return self
    }

    @discardableResult
    public func withHeaders(_ headers: [String: String]) -> HTTPRequestBuildeable {
        self.headers = headers

        return self
    }

    @discardableResult
    public func withEncoding(_ encoding: JSONEncoding) -> HTTPRequestBuildeable {
        self.encoding = encoding

        return self
    }

    @discardableResult
    public func withDecodingStrategy(_ strategy: JSONDecoder.KeyDecodingStrategy) -> HTTPRequestBuildeable {
        self.keyDecodingStrategy = strategy

        return self
    }
}
