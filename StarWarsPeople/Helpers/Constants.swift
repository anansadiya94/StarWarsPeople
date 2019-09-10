//
//  Constatns.swift
//  StarWarsPeople
//
//  Created by Anan Sadiya on 10/09/2019.
//  Copyright © 2019 Anan Sadiya. All rights reserved.
//

import UIKit

struct NetworkingConstants {
    private init () { }
    static let baseUrl = Bundle.main.infoDictionary?["API"] as! String
    static let search = "?search="
}

struct PersonTexts {
    private init() {}
    static let personBirthYearTitle = "I was born in "
    static let personMFGenderTitle = "I'm a "
    static let personUnGenderTitle = "I'm "
    static let personNAGenderTitle = "I don't have a gender"
    static let personHeightTitle = "I measure "
    static let personHeightTitleExtension = "cm"
    static let personMassTitle = "I weigh "
    static let personMassTitleExtension = "kg"
    static let personHairColorTitle = "My hair color is "
    static let personNAHairColorTitle = "I don't have hair"
    static let personEyeColorTitle = "My eye color is "
    static let personNAEyeColorTitle = "I don't have an eye"
    static let personUrlTitle = "Want to know more about me? Visit my website: "
}

struct RequestServiceErrorTexts {
    private init () { }
    static let clientErrorTitle = "Internet connection error"
    static let clientErrorMessage = "Check you internet connection and try again."
    static let serverErrorTitle = "Server error"
    static let serverErrorMessage = "Something happened with the server, try again."
    static let parserErrorTitle = "Parser error"
    static let parserErrorMessage = "Something happened while parsing the data, try again."
    static let tryAgainErrorActionTitle = "Try again"
    static let emptyDataErrorTitle = "No results found"
    static let emptyDataErrorActionTitle = "Search again"
}

struct NavigationControllerTexts {
    private init () { }
    static let navigationControllerTitle = "Star Wars People"
    static let navigationControllerSearchBarText = "Search persons"
}


