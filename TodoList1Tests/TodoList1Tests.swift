//
//  TodoList1Tests.swift
//  TodoList1Tests
//
//  Created by Ujjwal Arora on 10/11/24.
//

import XCTest
@testable import TodoList1

final class TodoList1Tests: XCTestCase {

    func testNewItem(){
        let newItem = ItemModel(title: "New Item", isCompleted: false)
        XCTAssertNotNil(newItem)
        XCTAssertEqual(newItem.title, "New Item")
        XCTAssertFalse(newItem.isCompleted)
    }
    func testMaths(){
        XCTAssertEqual(7+2, 9)
    }

}
