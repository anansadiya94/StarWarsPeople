////
////  ConnectService.swift
////  StarWarsPeople
////
////  Created by Anan Sadiya on 09/09/2019.
////  Copyright © 2019 Anan Sadiya. All rights reserved.
////

import UIKit

class NetworkService: NetworkServiceProtocol {
    static let shared = NetworkService()
    
    private init(){}
    
    func getDataFromPage(_ url: String, onSuccess success: @escaping (_ nextUrl: String, _ persons: [Person], _ lodeMore: Bool) -> Void, onFailure failure: @escaping (_ error: RequestServiceError?) -> Void) {
        var persons = [Person]()
        var nextUrl = ""
        URLSession.shared.dataTask(with: URL(string: url)!) { data, urlResponse, error in
            guard error == nil || data != nil else {
                failure(.clientError)
                return
            }
            
            guard let response = urlResponse as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
                failure(.serverError)
                return
            }
            
            guard let data = data else {return}
            
            guard let page = JSONParser.parsePeople(data) else {
                failure(.parserError)
                return
            }
            
            nextUrl = page.next ?? ""
            persons = page.persons
            
            if persons.isEmpty {
                failure(.emptyDataError)
            }
            if (nextUrl != "") {
                success(nextUrl, persons, true)
            } else {
                success(nextUrl, persons, false)
            }
        }.resume()
    }
}
