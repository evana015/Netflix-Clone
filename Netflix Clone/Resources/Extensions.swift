//
//  Extensions.swift
//  Netflix Clone
//
//  Created by Evans, Adam on 20/10/2022.
//

import Foundation

extension String {
    func capitiliseFirstLetter() -> String {
        if self.range(of: "tv", options: .caseInsensitive){
            let startindex = self.range(of: "tv")!.lowerBound
            let endindex = self.range(of: "tv")!.upperBound
            return String(self.localizedCapitalized[..<startindex] + "TV" + self.localizedCapitalized[endindex...])
        }else {
            return self.localizedCapitalized
        }
    }
}
