//
//  FilmsViewModelTest.swift
//  StarWarsTests
//
//  Created by Wandeep Basra on 23/11/2022.
//

import XCTest
@testable import StarWars

@MainActor class FilmsViewModelTest: XCTestCase {
    private var sut: FilmsViewModel!
    
    func testFilmsArrayIsEmptyWhenFetchFilmsFails() async {
        // Given
        sut = FilmsViewModel(webService: MockWebService(isSuccessful: false))
        // When
        await sut.fetchFilms()
        // Then
        XCTAssertTrue(sut.films.isEmpty)
    }
    
    func testFilmsArrayIsNotEmptyWhenFetchFilmsSucceeds() async {
        // Given
        sut = FilmsViewModel(webService: MockWebService(isSuccessful: true))
        // When
        await sut.fetchFilms()
        // Then
        XCTAssertFalse(sut.films.isEmpty)
    }
}

class MockWebService: WebServiceProtocol {
    let isSuccessful: Bool
    
    init(isSuccessful: Bool) {
        self.isSuccessful = isSuccessful
    }
    
    func fetch<T>(endpoint: StarWars.Endpoint, responseType: T.Type) async -> Result<T, StarWars.WebServiceError> where T : Decodable {
        if isSuccessful {
            return .success(FilmsResponse.sample as! T)
        } else {
            return .failure(WebServiceError.fetchError)
        }
    }
}

