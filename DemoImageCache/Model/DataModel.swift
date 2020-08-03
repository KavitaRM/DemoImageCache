//
//  DataModel.swift
//  DemoImageCache
//
//  Created by Kavita Malagavi on Aug-3-2020.
//  Copyright © 2020 Kavita Malagavi. All rights reserved.
//

import Foundation

struct DataModel: Codable {
    let title: String?
    let rows: [RowValues]?
    
    private enum CodingKeys: String, CodingKey {
        case rows = "rows", title
    }
}

struct RowValues: Codable {
    let title: String?
    let description: String?
    let imageUrl: String?
    
    private enum CodingKeys: String, CodingKey {
        case imageUrl = "imageHref", title, description
    }
}
