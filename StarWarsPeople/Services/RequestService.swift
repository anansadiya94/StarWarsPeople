//
//  RequestService.swift
//  StarWarsPeople
//
//  Created by Anan Sadiya on 08/09/2019.
//  Copyright © 2019 Anan Sadiya. All rights reserved.
//

import UIKit

class RequestService: RequestServiceProtocol {
    static let shared = RequestService()
    
    private init(){}
    
    func getData(_ url: String, onSuccess success: @escaping (_ nextUrl: String, _ persons: [Person], _ lodeMore: Bool) -> Void, onFailure failure: @escaping (_ error: RequestServiceError?) -> Void) {
        var nextUrl = ""
        var persons = [Person]()
        NetworkService.shared.getDataFromPage(url, onSuccess: { (nextUrlResponse, personsResponse, lodeMoreReponse) in
            nextUrl = nextUrlResponse
            persons += personsResponse
            if (nextUrl != "") {
                NetworkService.shared.getDataFromPage(nextUrl, onSuccess: { (nextUrlResponse, personsResponse, lodeMoreReponse) in
                    nextUrl = nextUrlResponse
                    persons += personsResponse
                    if (nextUrl != "") {
                        success(nextUrl, persons, true)
                    } else {
                        success(nextUrl, persons, false)
                    }
                }) { (error) in
                    failure(error)
                }
            } else {
                success(nextUrl, persons, false)
            }
        }) { (error) in
           failure(error)
        }
    }
}
