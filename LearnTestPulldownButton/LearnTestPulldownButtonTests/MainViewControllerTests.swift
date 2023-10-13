//
//  MainViewControllerTests.swift
//  LearnTestPulldownButtonTests
//
//  Created by Galih Samudra on 13/10/23.
//

import XCTest
import LearnTestPulldownButton

final class MainViewControllerTests: XCTestCase {

    func test_initConfigureButton_currentButtonTitleSelectedFirstTitle() {
        let sut = makeSUT()
        
        sut.loadViewIfNeeded()
        
        XCTAssertEqual(sut.currentButtonTitleSelected, "button 1")
    }
    
    //MARK: Helpers
    private func makeSUT(file: StaticString = #filePath,
                         line: UInt = #line) -> MainViewController {
        let sut = MainViewController(nibName: "MainViewController", bundle: Bundle(for: MainViewController.self))
        trackForMemoryLeak(sut, file: file, line: line)
        return sut
    }
    
    func trackForMemoryLeak(_ instance: AnyObject, file: StaticString = #filePath, line: UInt = #line) {
        addTeardownBlock { [weak instance] in
            XCTAssertNil(instance, "Instance should have beed deallocated, potential memory leak", file: file, line: line)
        }
    }
}
