//
//  News.swift
//  iOSNews
//
//  Created by Ricardo Duarte on 19/10/2018.
//  Copyright © 2018 Ricardo Duarte. All rights reserved.
//

import UIKit

class News: Decodable {
    let author: String
    let title: String
    let description: String
    let url: String
    let urlToImage: String
    let publishedAt: String
    let content: String
    
    init(author: String, title: String, description: String, url: String, urlToImage: String, publishedAt: String, content: String) {
        self.author = author
        self.title = title
        self.description = description
        self.url = url
        self.urlToImage = urlToImage
        self.publishedAt = publishedAt
        self.content = content
    }
}
