//
//  NewsData.swift
//  CodeLapTaskOne
//
//  Created by Ahmed Baloch on 10/06/2021.
//

import Foundation

class NewsData {
    
    var id : Int?
    var link : String?
    var published : String?
    var summary : String?
    var title : String?
    
    init(id : Int , link : String , published : String , summary : String , title : String) {
        self.id = id
        self.link = link
        self.published = published
        self.summary = summary
        self.title = title
    }
}
