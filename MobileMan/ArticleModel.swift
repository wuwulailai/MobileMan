//
//  ArticleModel.swift
//  Network
//
//  Created by wubaolai on 2019/7/25.
//  Copyright © 2019 wubaolai. All rights reserved.
//

import Foundation

public struct ArticleModel: Codable {
    var _id: String
    var createdAt: String
    var desc: String
    var publishedAt: String
    var images: [String]?
    var source: String
    var type: String
    var url: String
    var used: Bool
    var who: String?
}
