//
//  JSONParser.swift
//  StarWarsPeople
//
//  Created by Anan Sadiya on 09/09/2019.
//  Copyright © 2019 Anan Sadiya. All rights reserved.
//

import UIKit

class JSONParser {
    static func parsePeople(_ params: Data) -> Page? {
        do {
            let decoder = JSONDecoder()
            let page = try decoder.decode(Page.self, from: params)
            return page
        } catch {
            return nil
        }
    }
}
