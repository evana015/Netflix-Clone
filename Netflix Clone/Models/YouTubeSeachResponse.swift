//
//  YouTubeSeachResponse.swift
//  Netflix Clone
//
//  Created by Evans, Adam on 25/10/2022.
//

import Foundation

struct YouTubeSearchResponse: Codable {
    let items: [VideoElement]
}

struct VideoElement: Codable {
    let id: VideoElementID
}

struct VideoElementID: Codable {
    let kind: String
    let videoId: String
}

/* EXAMPLE DATA
 items =     (
             {
         etag = iAYjM0Bt9KSNMzAQhbBEqR2MDa4;
         id =             {
             kind = "youtube#video";
             videoId = d6RobHD9SiU;
         };
         kind = "youtube#searchResult";
     },
 */
