import XCTest
@testable import KeychainHelper

final class KeychainHelperTests: XCTestCase {
    struct Object: Codable, Equatable {
        let id: UUID
    }
    
    private var keychainHelper: KeychainHelper!
    private var object: Object!
    
    override func setUp() {
        super.setUp()
        object = Object(id: UUID())
        keychainHelper = KeychainHelper(
            keychainKey: "testKey",
            synchronizable: false
        )
    }
    
    override func tearDown() {
        keychainHelper.clean()
        object = nil
        keychainHelper = nil
        super.tearDown()
    }
    
    func testCreateSyncInfo() {
        XCTAssertNoThrow(try keychainHelper.createSyncInfo(for: object))
    }
    
    func testFetchSyncInfo() {
        XCTAssertNoThrow(try keychainHelper.createSyncInfo(for: object))
        
        XCTAssertNoThrow(try {
            let fetchedObject: Object? = try keychainHelper.fetchSyncInfo()
            XCTAssertEqual(fetchedObject, object)
        }())
    }
    
    func testClean() {
        XCTAssertNoThrow(try keychainHelper.createSyncInfo(for: object))
        keychainHelper.clean()
        
        let fetchedObject: String? = try? keychainHelper.fetchSyncInfo()
        XCTAssertNil(fetchedObject)
    }
}
