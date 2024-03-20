//
//  Strucet.swift
//  NewsApiGetMethode
//
//  Created by Asaithambi on 01/09/2023.
//

import Foundation

struct ArticleS: Codable {
    var articles: [ArticleNew]?
}
    struct ArticleNew: Codable{
    var title : String?
    var description : String?
    var urlToImage: String?
    var url : String?
    var publishedAt: String?
    
    }

