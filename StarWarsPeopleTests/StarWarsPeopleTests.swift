//
//  StarWarsPeopleTests.swift
//  StarWarsPeopleTests
//
//  Created by Anan Sadiya on 08/09/2019.
//  Copyright © 2019 Anan Sadiya. All rights reserved.
//

import XCTest
@testable import StarWarsPeople

let fakeJsonPeoplePage1 = """
{"count":87,"next":"https://swapi.co/api/people/?page=2","previous":null,"results":[{"name":"Luke Skywalker","height":"172","mass":"77","hair_color":"blond","skin_color":"fair","eye_color":"blue","birth_year":"19BBY","gender":"male","homeworld":"https://swapi.co/api/planets/1/","films":["https://swapi.co/api/films/2/","https://swapi.co/api/films/6/","https://swapi.co/api/films/3/","https://swapi.co/api/films/1/","https://swapi.co/api/films/7/"],"species":["https://swapi.co/api/species/1/"],"vehicles":["https://swapi.co/api/vehicles/14/","https://swapi.co/api/vehicles/30/"],"starships":["https://swapi.co/api/starships/12/","https://swapi.co/api/starships/22/"],"created":"2014-12-09T13:50:51.644000Z","edited":"2014-12-20T21:17:56.891000Z","url":"https://swapi.co/api/people/1/"},{"name":"C-3PO","height":"167","mass":"75","hair_color":"n/a","skin_color":"gold","eye_color":"yellow","birth_year":"112BBY","gender":"n/a","homeworld":"https://swapi.co/api/planets/1/","films":["https://swapi.co/api/films/2/","https://swapi.co/api/films/5/","https://swapi.co/api/films/4/","https://swapi.co/api/films/6/","https://swapi.co/api/films/3/","https://swapi.co/api/films/1/"],"species":["https://swapi.co/api/species/2/"],"vehicles":[],"starships":[],"created":"2014-12-10T15:10:51.357000Z","edited":"2014-12-20T21:17:50.309000Z","url":"https://swapi.co/api/people/2/"},{"name":"R2-D2","height":"96","mass":"32","hair_color":"n/a","skin_color":"white, blue","eye_color":"red","birth_year":"33BBY","gender":"n/a","homeworld":"https://swapi.co/api/planets/8/","films":["https://swapi.co/api/films/2/","https://swapi.co/api/films/5/","https://swapi.co/api/films/4/","https://swapi.co/api/films/6/","https://swapi.co/api/films/3/","https://swapi.co/api/films/1/","https://swapi.co/api/films/7/"],"species":["https://swapi.co/api/species/2/"],"vehicles":[],"starships":[],"created":"2014-12-10T15:11:50.376000Z","edited":"2014-12-20T21:17:50.311000Z","url":"https://swapi.co/api/people/3/"},{"name":"Darth Vader","height":"202","mass":"136","hair_color":"none","skin_color":"white","eye_color":"yellow","birth_year":"41.9BBY","gender":"male","homeworld":"https://swapi.co/api/planets/1/","films":["https://swapi.co/api/films/2/","https://swapi.co/api/films/6/","https://swapi.co/api/films/3/","https://swapi.co/api/films/1/"],"species":["https://swapi.co/api/species/1/"],"vehicles":[],"starships":["https://swapi.co/api/starships/13/"],"created":"2014-12-10T15:18:20.704000Z","edited":"2014-12-20T21:17:50.313000Z","url":"https://swapi.co/api/people/4/"},{"name":"Leia Organa","height":"150","mass":"49","hair_color":"brown","skin_color":"light","eye_color":"brown","birth_year":"19BBY","gender":"female","homeworld":"https://swapi.co/api/planets/2/","films":["https://swapi.co/api/films/2/","https://swapi.co/api/films/6/","https://swapi.co/api/films/3/","https://swapi.co/api/films/1/","https://swapi.co/api/films/7/"],"species":["https://swapi.co/api/species/1/"],"vehicles":["https://swapi.co/api/vehicles/30/"],"starships":[],"created":"2014-12-10T15:20:09.791000Z","edited":"2014-12-20T21:17:50.315000Z","url":"https://swapi.co/api/people/5/"},{"name":"Owen Lars","height":"178","mass":"120","hair_color":"brown, grey","skin_color":"light","eye_color":"blue","birth_year":"52BBY","gender":"male","homeworld":"https://swapi.co/api/planets/1/","films":["https://swapi.co/api/films/5/","https://swapi.co/api/films/6/","https://swapi.co/api/films/1/"],"species":["https://swapi.co/api/species/1/"],"vehicles":[],"starships":[],"created":"2014-12-10T15:52:14.024000Z","edited":"2014-12-20T21:17:50.317000Z","url":"https://swapi.co/api/people/6/"},{"name":"Beru Whitesun lars","height":"165","mass":"75","hair_color":"brown","skin_color":"light","eye_color":"blue","birth_year":"47BBY","gender":"female","homeworld":"https://swapi.co/api/planets/1/","films":["https://swapi.co/api/films/5/","https://swapi.co/api/films/6/","https://swapi.co/api/films/1/"],"species":["https://swapi.co/api/species/1/"],"vehicles":[],"starships":[],"created":"2014-12-10T15:53:41.121000Z","edited":"2014-12-20T21:17:50.319000Z","url":"https://swapi.co/api/people/7/"},{"name":"R5-D4","height":"97","mass":"32","hair_color":"n/a","skin_color":"white, red","eye_color":"red","birth_year":"unknown","gender":"n/a","homeworld":"https://swapi.co/api/planets/1/","films":["https://swapi.co/api/films/1/"],"species":["https://swapi.co/api/species/2/"],"vehicles":[],"starships":[],"created":"2014-12-10T15:57:50.959000Z","edited":"2014-12-20T21:17:50.321000Z","url":"https://swapi.co/api/people/8/"},{"name":"Biggs Darklighter","height":"183","mass":"84","hair_color":"black","skin_color":"light","eye_color":"brown","birth_year":"24BBY","gender":"male","homeworld":"https://swapi.co/api/planets/1/","films":["https://swapi.co/api/films/1/"],"species":["https://swapi.co/api/species/1/"],"vehicles":[],"starships":["https://swapi.co/api/starships/12/"],"created":"2014-12-10T15:59:50.509000Z","edited":"2014-12-20T21:17:50.323000Z","url":"https://swapi.co/api/people/9/"},{"name":"Obi-Wan Kenobi","height":"182","mass":"77","hair_color":"auburn, white","skin_color":"fair","eye_color":"blue-gray","birth_year":"57BBY","gender":"male","homeworld":"https://swapi.co/api/planets/20/","films":["https://swapi.co/api/films/2/","https://swapi.co/api/films/5/","https://swapi.co/api/films/4/","https://swapi.co/api/films/6/","https://swapi.co/api/films/3/","https://swapi.co/api/films/1/"],"species":["https://swapi.co/api/species/1/"],"vehicles":["https://swapi.co/api/vehicles/38/"],"starships":["https://swapi.co/api/starships/48/","https://swapi.co/api/starships/59/","https://swapi.co/api/starships/64/","https://swapi.co/api/starships/65/","https://swapi.co/api/starships/74/"],"created":"2014-12-10T16:16:29.192000Z","edited":"2014-12-20T21:17:50.325000Z","url":"https://swapi.co/api/people/10/"}]}
"""

let fakeJsonPeoplePage2 = """
{"count":87,"next":"https://swapi.co/api/people/?page=3","previous":"https://swapi.co/api/people/?page=1","results":[{"name":"Anakin Skywalker","height":"188","mass":"84","hair_color":"blond","skin_color":"fair","eye_color":"blue","birth_year":"41.9BBY","gender":"male","homeworld":"https://swapi.co/api/planets/1/","films":["https://swapi.co/api/films/5/","https://swapi.co/api/films/4/","https://swapi.co/api/films/6/"],"species":["https://swapi.co/api/species/1/"],"vehicles":["https://swapi.co/api/vehicles/44/","https://swapi.co/api/vehicles/46/"],"starships":["https://swapi.co/api/starships/59/","https://swapi.co/api/starships/65/","https://swapi.co/api/starships/39/"],"created":"2014-12-10T16:20:44.310000Z","edited":"2014-12-20T21:17:50.327000Z","url":"https://swapi.co/api/people/11/"},{"name":"Wilhuff Tarkin","height":"180","mass":"unknown","hair_color":"auburn, grey","skin_color":"fair","eye_color":"blue","birth_year":"64BBY","gender":"male","homeworld":"https://swapi.co/api/planets/21/","films":["https://swapi.co/api/films/6/","https://swapi.co/api/films/1/"],"species":["https://swapi.co/api/species/1/"],"vehicles":[],"starships":[],"created":"2014-12-10T16:26:56.138000Z","edited":"2014-12-20T21:17:50.330000Z","url":"https://swapi.co/api/people/12/"},{"name":"Chewbacca","height":"228","mass":"112","hair_color":"brown","skin_color":"unknown","eye_color":"blue","birth_year":"200BBY","gender":"male","homeworld":"https://swapi.co/api/planets/14/","films":["https://swapi.co/api/films/2/","https://swapi.co/api/films/6/","https://swapi.co/api/films/3/","https://swapi.co/api/films/1/","https://swapi.co/api/films/7/"],"species":["https://swapi.co/api/species/3/"],"vehicles":["https://swapi.co/api/vehicles/19/"],"starships":["https://swapi.co/api/starships/10/","https://swapi.co/api/starships/22/"],"created":"2014-12-10T16:42:45.066000Z","edited":"2014-12-20T21:17:50.332000Z","url":"https://swapi.co/api/people/13/"},{"name":"Han Solo","height":"180","mass":"80","hair_color":"brown","skin_color":"fair","eye_color":"brown","birth_year":"29BBY","gender":"male","homeworld":"https://swapi.co/api/planets/22/","films":["https://swapi.co/api/films/2/","https://swapi.co/api/films/3/","https://swapi.co/api/films/1/","https://swapi.co/api/films/7/"],"species":["https://swapi.co/api/species/1/"],"vehicles":[],"starships":["https://swapi.co/api/starships/10/","https://swapi.co/api/starships/22/"],"created":"2014-12-10T16:49:14.582000Z","edited":"2014-12-20T21:17:50.334000Z","url":"https://swapi.co/api/people/14/"},{"name":"Greedo","height":"173","mass":"74","hair_color":"n/a","skin_color":"green","eye_color":"black","birth_year":"44BBY","gender":"male","homeworld":"https://swapi.co/api/planets/23/","films":["https://swapi.co/api/films/1/"],"species":["https://swapi.co/api/species/4/"],"vehicles":[],"starships":[],"created":"2014-12-10T17:03:30.334000Z","edited":"2014-12-20T21:17:50.336000Z","url":"https://swapi.co/api/people/15/"},{"name":"Jabba Desilijic Tiure","height":"175","mass":"1,358","hair_color":"n/a","skin_color":"green-tan, brown","eye_color":"orange","birth_year":"600BBY","gender":"hermaphrodite","homeworld":"https://swapi.co/api/planets/24/","films":["https://swapi.co/api/films/4/","https://swapi.co/api/films/3/","https://swapi.co/api/films/1/"],"species":["https://swapi.co/api/species/5/"],"vehicles":[],"starships":[],"created":"2014-12-10T17:11:31.638000Z","edited":"2014-12-20T21:17:50.338000Z","url":"https://swapi.co/api/people/16/"},{"name":"Wedge Antilles","height":"170","mass":"77","hair_color":"brown","skin_color":"fair","eye_color":"hazel","birth_year":"21BBY","gender":"male","homeworld":"https://swapi.co/api/planets/22/","films":["https://swapi.co/api/films/2/","https://swapi.co/api/films/3/","https://swapi.co/api/films/1/"],"species":["https://swapi.co/api/species/1/"],"vehicles":["https://swapi.co/api/vehicles/14/"],"starships":["https://swapi.co/api/starships/12/"],"created":"2014-12-12T11:08:06.469000Z","edited":"2014-12-20T21:17:50.341000Z","url":"https://swapi.co/api/people/18/"},{"name":"Jek Tono Porkins","height":"180","mass":"110","hair_color":"brown","skin_color":"fair","eye_color":"blue","birth_year":"unknown","gender":"male","homeworld":"https://swapi.co/api/planets/26/","films":["https://swapi.co/api/films/1/"],"species":["https://swapi.co/api/species/1/"],"vehicles":[],"starships":["https://swapi.co/api/starships/12/"],"created":"2014-12-12T11:16:56.569000Z","edited":"2014-12-20T21:17:50.343000Z","url":"https://swapi.co/api/people/19/"},{"name":"Yoda","height":"66","mass":"17","hair_color":"white","skin_color":"green","eye_color":"brown","birth_year":"896BBY","gender":"male","homeworld":"https://swapi.co/api/planets/28/","films":["https://swapi.co/api/films/2/","https://swapi.co/api/films/5/","https://swapi.co/api/films/4/","https://swapi.co/api/films/6/","https://swapi.co/api/films/3/"],"species":["https://swapi.co/api/species/6/"],"vehicles":[],"starships":[],"created":"2014-12-15T12:26:01.042000Z","edited":"2014-12-20T21:17:50.345000Z","url":"https://swapi.co/api/people/20/"},{"name":"Palpatine","height":"170","mass":"75","hair_color":"grey","skin_color":"pale","eye_color":"yellow","birth_year":"82BBY","gender":"male","homeworld":"https://swapi.co/api/planets/8/","films":["https://swapi.co/api/films/2/","https://swapi.co/api/films/5/","https://swapi.co/api/films/4/","https://swapi.co/api/films/6/","https://swapi.co/api/films/3/"],"species":["https://swapi.co/api/species/1/"],"vehicles":[],"starships":[],"created":"2014-12-15T12:48:05.971000Z","edited":"2014-12-20T21:17:50.347000Z","url":"https://swapi.co/api/people/21/"}]}
"""

class FakeSuccessNetworkService: NetworkServiceProtocol {
    var didCallGetDataFromPage = false
    
    func getDataFromPage(_ url: String, onSuccess success: @escaping (String, [Person], Bool) -> Void, onFailure failure: @escaping (RequestServiceError?) -> Void) {
        didCallGetDataFromPage = true
        if let data: Data = fakeJsonPeoplePage1.data(using: String.Encoding.utf8) {
            let page = try! JSONDecoder().decode(Page.self, from: data)
            success(page.next!, page.persons, true)
        }
    }
}

class FakeFailureNetworkService: NetworkServiceProtocol {
    var didCallGetDataFromPage = false
    
    func getDataFromPage(_ url: String, onSuccess success: @escaping (String, [Person], Bool) -> Void, onFailure failure: @escaping (RequestServiceError?) -> Void) {
        failure(RequestServiceError.clientError)
    }
}

class FakeSuccessRequestService: RequestServiceProtocol {
    var didCallGetData = false
    
    func getData(_ url: String, onSuccess success: @escaping (String, [Person], Bool) -> Void, onFailure failure: @escaping (RequestServiceError?) -> Void) {
        didCallGetData = true
        var nextUrl = ""
        var persons = [Person]()
        if let data: Data = fakeJsonPeoplePage1.data(using: String.Encoding.utf8) {
            //Page 1
            let page = try! JSONDecoder().decode(Page.self, from: data)
            nextUrl = page.next ?? ""
            persons = page.persons
            //Page 2
            if let data: Data = fakeJsonPeoplePage1.data(using: String.Encoding.utf8) {
                //Page 2
                let page = try! JSONDecoder().decode(Page.self, from: data)
                nextUrl = page.next ?? ""
                persons += page.persons
            }
            success(nextUrl, persons, true)
        }
    }
}

class FakeFailureRequestService: RequestServiceProtocol {
    var didCallGetData = false
    
    func getData(_ url: String, onSuccess success: @escaping (String, [Person], Bool) -> Void, onFailure failure: @escaping (RequestServiceError?) -> Void) {
        failure(RequestServiceError.emptyDataError)
    }
}

class StarWarsPeopleTests: XCTestCase {
    var successNetworkService : FakeSuccessNetworkService?
    var failureNetworkService : FakeFailureNetworkService?
    var successRequestService : FakeSuccessRequestService?
    var failureRequestService : FakeFailureRequestService?

    override func setUp() {
        successNetworkService = FakeSuccessNetworkService()
        failureNetworkService = FakeFailureNetworkService()
        successRequestService = FakeSuccessRequestService()
        failureRequestService = FakeFailureRequestService()
    }
    
    override func tearDown() {
        successNetworkService = nil
        successRequestService = nil
    }

    func testGetDataFromPage() {
        XCTAssertFalse(successNetworkService?.didCallGetDataFromPage ?? false)
        successNetworkService?.getDataFromPage(NetworkingConstants.baseUrl ,onSuccess: { (nextUrl, persons, lodeMore) in
            XCTAssertTrue(self.successNetworkService?.didCallGetDataFromPage ?? false)
            XCTAssertTrue(nextUrl != "")
            XCTAssert(persons.count == 10)
            XCTAssertTrue(lodeMore == true)
        }, onFailure: { (failure) in
        })
    }
    
    //Client has no internet
    func testGetDataFromPageFails() {
        XCTAssertFalse(successNetworkService?.didCallGetDataFromPage ?? false)
        failureNetworkService?.getDataFromPage(NetworkingConstants.baseUrl ,onSuccess: { (nextUrl, persons, lodeMore) in
        }, onFailure: { (failure) in
            XCTAssertNotNil(failure)
            XCTAssertTrue(failure == RequestServiceError.clientError)
        })
    }
    
    func testGetData() {
        XCTAssertFalse(successRequestService?.didCallGetData ?? false)
        successRequestService?.getData(NetworkingConstants.baseUrl ,onSuccess: { (nextUrl, persons, lodeMore) in
            XCTAssertTrue(self.successRequestService?.didCallGetData ?? false)
            XCTAssertTrue(nextUrl != "")
            XCTAssert(persons.count == 20)
            XCTAssertTrue(lodeMore == true)
        }, onFailure: { (failure) in
        })
    }
    
    //Page 9 has no next page
    func testGetDataFails() {
        XCTAssertFalse(failureRequestService?.didCallGetData ?? false)
        failureRequestService?.getData(NetworkingConstants.baseUrl + "?page=9" ,onSuccess: { (nextUrl, persons, lodeMore) in
        }, onFailure: { (failure) in
            XCTAssertNotNil(failure)
            XCTAssertTrue(failure == RequestServiceError.emptyDataError)
        })
    }
}
