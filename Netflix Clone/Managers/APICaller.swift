//
//  APICaller.swift
//  Netflix Clone
//
//  Created by Evans, Adam on 20/10/2022.
//

import Foundation

struct Constants {
    static let API_KEY = "7502a13c57cecf92823b6e9f7424ef17"
    static let baseURL = "https://api.themoviedb.org"
}

enum APIError: Error {
    case failedToGetData
}

class APICaller {
    static let shared = APICaller()
    
    func getTrendingMovies(compeltion: @escaping (Result<[Movie], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)/3/trending/movie/day?api_key=\(Constants.API_KEY)") else {return}
        
        //Get data
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            //Convert to JSON Object
            do {
                let results = try JSONDecoder().decode(TrendingMoviesResponse.self, from: data)
                compeltion(.success(results.results))
            } catch {
                compeltion(.failure(error))
            }
        }
        task.resume()
    }
    
    func getTrendingTVShows(compeltion: @escaping (Result<[TVShow], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)/3/trending/tv/day?api_key=\(Constants.API_KEY)") else {return}
        
        //Get data
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            //Convert to JSON Object
            do {
                let results = try JSONDecoder().decode(TrendingTVResponse.self, from: data)
                compeltion(.success(results.results))
            } catch {
                compeltion(.failure(error))
            }
        }
        task.resume()
    }
    
    func getUpcomingMovies(compeltion: @escaping (Result<[Movie], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)/3/movie/upcoming?api_key=\(Constants.API_KEY)") else {return}
        
        //Get data
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            //Convert to JSON Object
            do {
                //Using TrendingMovies as it has the same structure
                let results = try JSONDecoder().decode(TrendingMoviesResponse.self, from: data)
                compeltion(.success(results.results))
            } catch {
                compeltion(.failure(error))
            }
        }
        task.resume()
    }
    
    func getPopularMovies(compeltion: @escaping (Result<[Movie], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)/3/movie/popular?api_key=\(Constants.API_KEY)") else {return}
        
        //Get data
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            //Convert to JSON Object
            do {
                //Using TrendingMovies as it has the same structure
                let results = try JSONDecoder().decode(TrendingMoviesResponse.self, from: data)
                compeltion(.success(results.results))
            } catch {
                compeltion(.failure(error))
            }
        }
        task.resume()
    }
}

//https://api.themoviedb.org/3/movie/top_rated?api_key=

