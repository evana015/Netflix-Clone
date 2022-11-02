//
//  Movie.swift
//  Netflix Clone
//
//  Created by Evans, Adam on 20/10/2022.
//

import Foundation

struct TrendingTitleResponse: Codable {
    let results: [Title]
}

struct Title: Codable {
    let id: Int
    let media_type: String?
    let original_name: String?
    let original_title: String?
    let poster_path: String?
    let overview: String?
    let vote_count: Int
    let release_date: String?
    let vote_average: Double
}

/* EXAMPLE DATA
 id = 616820;
 "media_type" = movie;
 "original_language" = en;
 "original_title" = "Halloween Ends";
 overview = "Four years after the events of Halloween in 2018, Laurie has decided to liberate herself from fear and rage and embrace life. But when a young man is accused of killing a boy he was babysitting, it ignites a cascade of violence and terror that will force Laurie to finally confront the evil she can\U2019t control, once and for all.";
 popularity = "4845.496";
 "poster_path" = "/3uDwqxbr0j34rJVJMOW6o8Upw5W.jpg";
 "release_date" = "2022-10-12";
 title = "Halloween Ends";
 video = 0;
 "vote_average" = "6.86";
 "vote_count" = 433;
 */
