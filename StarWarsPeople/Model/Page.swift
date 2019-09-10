//
//  Page.swift
//  StarWarsPeople
//
//  Created by Anan Sadiya on 08/09/2019.
//  Copyright © 2019 Anan Sadiya. All rights reserved.
//

import UIKit

class Page: Codable {
    var count: Int
    var next: String?
    var previous: String?
    var persons: [Person]
}

extension Page {
    enum CodingKeys: String, CodingKey {
        case count
        case next
        case previous
        case persons = "results"
    }
}
