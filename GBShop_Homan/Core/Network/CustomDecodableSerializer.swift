//
//  CustomDecodableSerializer.swift
//  GBShop
//
//  Created by aaa on 12/05/2023.
//

import Alamofire
import Foundation

// MARK: - Decodable Serializer
class CustomDecodableSerializer<T: Decodable>: DataResponseSerializerProtocol {
    // properties
    private let errorParser: AbstractErrorParser
    init(errorParser: AbstractErrorParser) {
        self.errorParser = errorParser
    }
    func serialize(request: URLRequest?,
                   response: HTTPURLResponse?,
                   data: Data?,
                   error: Error?) throws -> T {
        if let error = errorParser.parse(response: response, data: data, error: error) {
            throw error
        }
        do {
            let data = try DataResponseSerializer().serialize(request: request,
                                                              response: response,
                                                              data: data,
                                                              error: error)
            let value = try JSONDecoder().decode(T.self, from: data)
            return value
        } catch {
            let customError = errorParser.parse(error)
            throw customError
        }
    }
}
