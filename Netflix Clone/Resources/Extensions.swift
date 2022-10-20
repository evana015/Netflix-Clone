//
//  Extensions.swift
//  Netflix Clone
//
//  Created by Evans, Adam on 20/10/2022.
//

import Foundation

extension String {
    func capitiliseFirstLetter() -> String {
        let str =  self.lowercased()
        if str.contains("tv"){
            let startindex = str.range(of: "tv")!.lowerBound
            let endindex = str.range(of: "tv")!.upperBound
            return String(self.localizedCapitalized[..<startindex] + "TV" + self.localizedCapitalized[endindex...])
        }else {
            return self.localizedCapitalized
        }
    }
}
