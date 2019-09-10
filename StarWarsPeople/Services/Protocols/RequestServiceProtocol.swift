//
//  RequestServiceProtocol.swift
//  StarWarsPeople
//
//  Created by Anan Sadiya on 09/09/2019.
//  Copyright © 2019 Anan Sadiya. All rights reserved.
//

import UIKit

protocol RequestServiceProtocol {
    func getData(_ url: String, onSuccess success: @escaping (_ nextUrl: String, _ persons: [Person], _ lodeMore: Bool) -> Void, onFailure failure: @escaping (_ error: RequestServiceError?) -> Void)
}
