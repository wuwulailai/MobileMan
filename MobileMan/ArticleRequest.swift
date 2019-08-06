//
//  ArticleRequest.swift
//  Network
//
//  Created by wubaolai on 2019/7/25.
//  Copyright © 2019 wubaolai. All rights reserved.
//

import Foundation
import NetworkTool

public struct ArticleRequest: Request {
    public var path: String = "api/data/iOS/20/2"
    public var method: HTTPMethod = .GET
    public var contentType: ContentType = .None
    public var query: Query?
    public typealias Response = ArticleResponse
    public typealias Query = String
    
    public init() {
        
    }
}

