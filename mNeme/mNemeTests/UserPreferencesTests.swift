//
//  UserPreferencesTests.swift
//  mNemeTests
//
//  Created by Lambda_School_Loaner_204 on 2/24/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import XCTest

@testable import mNeme

class UserPreferencesTests: XCTestCase {

    func testGetUserWithData() {
        let mock = ModckDataLoader()
        mock.data = userWithData
        
        let controller = UserController(networkDataLoader: mock)
        controller.user = User("r4Ok4g9OA5UHtpXnDRqF5XFCduH3")

        let expect = expectation(description: "Wait for User Preferences to return from API")

        controller.getUserPreferences() {
            expect.fulfill()
        }

        wait(for: [expect], timeout: 2)

        XCTAssertEqual(controller.user?.data?.MobileOrDesktop, "Desktop")
    }

    func testGetUserWithoutData() {
        let mock = ModckDataLoader()
        mock.data = userWithoutData

        let controller = UserController(networkDataLoader: mock)
        controller.user = User("r4Ok4g9OA5UHtpXnDRqF5XFCduH3")

        let expect = expectation(description: "Wait for User Preferences to return from API")

        controller.getUserPreferences() {
            expect.fulfill()
        }

        wait(for: [expect], timeout: 2)

        XCTAssertNotNil(controller.user?.data)
    }

}
