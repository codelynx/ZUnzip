//
//	ZUnzipTests.swift
//	ZUnzipTests
//
//	Created by Kaz Yoshikawa on 9/22/16.
//
//

import XCTest
@testable import ZUnzip

class ZUnzipTests: XCTestCase {

	func file(name: String, ofType type: String) -> String {
		return Bundle(for: ZUnzipTests.self).path(forResource: name, ofType: type)!
	}
	
	func data(name: String, ofType type: String) -> NSData {
		let file = self.file(name: name, ofType: type)
		return try! NSData(contentsOfFile: file, options: .uncached)
	}
	
	override func setUp() {
		super.setUp()

		let file = Bundle(for: ZUnzipTests.self).path(forResource: "fmemopen", ofType: "zip")
		print("\(file)")

	}
	
	override func tearDown() {
		// Put teardown code here. This method is called after the invocation of each test method in the class.
		super.tearDown()
	}
	
	func testExample() {
		let file = self.file(name: "fmemopen", ofType: "zip")
		do {
			let file1 = self.data(name: "README.md", ofType: "dat")
			let file2 = self.data(name: "fmemopen.c", ofType: "dat")
			let file3 = self.data(name: "fmemopen.h", ofType: "dat")
			let file4 = self.data(name: "module.modulemap", ofType: "dat")
		
		
			let zip = try ZUnzip(path: file)
			let data1 = zip.data(forFile: "fmemopen/README.md")
			let data2 = zip.data(forFile: "fmemopen/fmemopen.c")
			let data3 = zip.data(forFile: "fmemopen/fmemopen.h")
			let data4 = zip.data(forFile: "fmemopen/module.modulemap")

			XCTAssertNotNil(data1)
			XCTAssertNotNil(data2)
			XCTAssertNotNil(data3)
			XCTAssertNotNil(data4)

			XCTAssertEqual(file1, data1)
			XCTAssertEqual(file2, data2)
			XCTAssertEqual(file3, data3)
			XCTAssertEqual(file4, data4)
		}
		catch {
			print("\(error)")
		}
	}
	
	func testPerformanceExample() {
		// This is an example of a performance test case.
		self.measure {
			// Put the code you want to measure the time of here.
		}
	}
	
}
