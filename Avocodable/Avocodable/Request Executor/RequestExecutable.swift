//
//  RequestExecutable.swift
//  Avocodable
//
//  Created by Nahuel Zapata on 9/2/18.
//  Copyright © 2018 iNahuelZapata. All rights reserved.
//

import Alamofire
import Foundation
import PromiseKit

public protocol RequestExecutable {
    func execute(request: HTTPRequestable) -> HttpResponsable
}

public protocol HttpResponsable { }

public class AlamofireRequestExecutor: RequestExecutable {

    public let encoder = JSONEncoder()

    public func execute(request: HTTPRequestable) -> HttpResponsable {
        do {
            let params = try self.encode(request.params)

        } catch {

        }

        return Promise<ResponseDecodable> { seal in
            Alamofire.request(request.endpoint.buildURL(),
                              method: request.method,
                              parameters: [:],
                              encoding: request.encoding,
                              headers: request.headers)
                .validate()
                .responseJSON { response in
                    do {
                        let parsedResponse = try
                        self.responseHandler.handleResponse(response: response, expectedType: T.self,
                                                            decodingStrategy: request.keyDecodingStrategy)
                        seal.fulfill(parsedResponse)
                    } catch {
                        NSLog(error.localizedDescription)
                        seal.reject(error)
                    }
            }
        }
    }

    private func encode<T: Encodable>(_ request: T) throws -> Data {
        do {
            let data = try encoder.encode(request)

            return data
        } catch {
            throw NSError(domain: "600", code: 500, userInfo: nil)
        }
    }
}
