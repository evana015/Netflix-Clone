//
//  TVShows.swift
//  Netflix Clone
//
//  Created by Evans, Adam on 20/10/2022.
//

import Foundation

//Repeat code to allow for adjustment if the server/service we are calling decides to make the Movie and TV data different, at the moment they are the same

struct TrendingTVResponse: Codable {
    let results: [TVShow]
}

struct TVShow: Codable {
    let id: Int?
    let media_type: String?
    let original_name: String?
    let original_title: String?
    let poster_path: String?
    let overview: String?
    let vote_count: Int?
    let release_date: String?
    let vote_average: Double?
}
