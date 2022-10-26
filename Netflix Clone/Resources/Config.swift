//
//  Config.swift
//  Netflix Clone
//
//  Created by Evans, Adam on 26/10/2022.
//

import UIKit

struct Config: Decodable {
    let YouTube_API_KEY: String
    let TMD_API_KEY: String
}

struct ConfigValues {
    static func get() -> Config {
        guard let url = Bundle.main.url(forResource: "Keys", withExtension: "plist") else {
            fatalError("Could not find Keys.plist in your Bundle")
        }
        do {
            let data = try Data(contentsOf: url)
            let decoder = PropertyListDecoder()
            return try decoder.decode(Config.self, from: data)
        } catch let error {
            fatalError(error.localizedDescription)
        }
    }
}
