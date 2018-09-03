//
//  HTTPRequestable.swift
//  Avocodable
//
//  Created by Nahuel Zapata on 9/2/18.
//  Copyright © 2018 iNahuelZapata. All rights reserved.
//

import Alamofire
import Foundation

public protocol HTTPRequestable {

    var endpoint: Endpoint { get set }

    var encoding: JSONEncoding { get set }

    var headers: [String: String] { get set }

    var method: HTTPMethod { get set }

    var params: RequestEncodable { get set }

    var response: ResponseDecodable { get set }

    var keyDecodingStrategy: JSONDecoder.KeyDecodingStrategy { get set }
}
