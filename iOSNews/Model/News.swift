//
//  News.swift
//  iOSNews
//
//  Created by Ricardo Duarte on 19/10/2018.
//  Copyright © 2018 Ricardo Duarte. All rights reserved.
//

import UIKit

struct TopHeadlines: Codable {
    let status: String
    let totalResults: Int
    let articles: [Article]
}

struct Article: Codable {
    let source: Source
    let author: String?
    let title: String?
    let description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String?
    let content: String?
}

struct Source: Codable {
    let id: String?
    let name: String
}
