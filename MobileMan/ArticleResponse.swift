//
//  ArticleResponse.swift
//  Network
//
//  Created by wubaolai on 2019/7/25.
//  Copyright © 2019 wubaolai. All rights reserved.
//

import Foundation
import NetworkTool

public struct ArticleResponseModel: Codable {
    public var error: Bool?
    public var results: [ArticleModel]?
}

public struct ArticleResponse: Parsable {
    public typealias Result = ArticleResponseModel
    
    public static func parse(data: Data) throws -> ArticleResponseModel? {
        do {
            let responseJson = try JSONDecoder().decode(Result.self, from: data)
            return responseJson
        } catch {
            throw ClientError.jsonParsingFailure
        }
    }
}
