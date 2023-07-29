import KeychainSwift
import Foundation

public struct KeychainHelper {
    private let keychainKey: String
    private let synchronizable: Bool
    
    public init(
        keychainKey: String,
        synchronizable: Bool = false
    ) {
        self.keychainKey = keychainKey
        self.synchronizable = synchronizable
    }

    private var keychain: KeychainSwift {
        let store = KeychainSwift()
        store.synchronizable = synchronizable
        return store
    }
    
    public func createSyncInfo<T: Codable>(for object: T) throws {
        let encoded = try PropertyListEncoder().encode(object)
        keychain.set(
            encoded,
            forKey: keychainKey
        )
    }
    
    public func fetchSyncInfo<T: Codable>() throws -> T? {
        let data = keychain.getData(keychainKey)
        guard
            let decodedData = data else {
            return nil
        }
        return try PropertyListDecoder().decode(T.self, from: decodedData)
    }
    
    /// Для служебной очистки ключа
    public func clean() {
        keychain.delete(keychainKey)
    }
}
