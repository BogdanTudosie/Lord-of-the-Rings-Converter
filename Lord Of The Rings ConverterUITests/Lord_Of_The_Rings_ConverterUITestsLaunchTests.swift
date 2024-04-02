//
//  Lord_Of_The_Rings_ConverterUITestsLaunchTests.swift
//  Lord Of The Rings ConverterUITests
//
//  Created by Bogdan Tudosie on 2.4.2024.
//

import XCTest

final class Lord_Of_The_Rings_ConverterUITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        // Insert steps here to perform after app launch but before taking a screenshot,
        // such as logging into a test account or navigating somewhere in the app

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
