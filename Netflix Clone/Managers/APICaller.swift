//
//  APICaller.swift
//  Netflix Clone
//
//  Created by Evans, Adam on 20/10/2022.
//

import Foundation

struct Constants {
    static let TMD_API_KEY = ConfigValues.get().TMD_API_KEY
    static let baseURL = "https://api.themoviedb.org"
    static let YouTube_API_KEY = ConfigValues.get().YouTube_API_KEY
    static let YouTubeBaseURL = "https://youtube.googleapis.com/youtube/v3/search?"
}

enum APIError: Error {
    case failedToGetData
}

class APICaller {
    static let shared = APICaller()
    
    func getTrendingMovies(compeltion: @escaping (Result<[Title], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)/3/trending/movie/day?api_key=\(Constants.TMD_API_KEY )") else {return}
        
        //Get data
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            //Decode JSON Object
            do {
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                compeltion(.success(results.results))
            } catch {
                compeltion(.failure(APIError.failedToGetData))
            }
        }
        task.resume()
    }
    
    func getTrendingTVShows(compeltion: @escaping (Result<[Title], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)/3/trending/tv/day?api_key=\(Constants.TMD_API_KEY )") else {return}
        
        //Get data
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            //Decode JSON Object
            do {
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                compeltion(.success(results.results))
            } catch {
                compeltion(.failure(APIError.failedToGetData))
            }
        }
        task.resume()
    }
    
    func getUpcomingMovies(compeltion: @escaping (Result<[Title], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)/3/movie/upcoming?api_key=\(Constants.TMD_API_KEY )") else {return}
        
        //Get data
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            //Decode JSON Object
            do {
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                compeltion(.success(results.results))
            } catch {
                compeltion(.failure(APIError.failedToGetData))
            }
        }
        task.resume()
    }
    
    func getPopularMovies(compeltion: @escaping (Result<[Title], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)/3/movie/popular?api_key=\(Constants.TMD_API_KEY )") else {return}
        
        //Get data
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            //Decode JSON Object
            do {
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                compeltion(.success(results.results))
            } catch {
                compeltion(.failure(error))
            }
        }
        task.resume()
    }
    
    func getTopRatedMovies(compeltion: @escaping (Result<[Title], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)/3/movie/top_rated?api_key=\(Constants.TMD_API_KEY )") else {return}
        
        //Get data
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            //Decode JSON Object
            do {
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                compeltion(.success(results.results))
            } catch {
                compeltion(.failure(APIError.failedToGetData))
            }
        }
        task.resume()
    }
    
    func getDiscoverMovies(compeltion: @escaping (Result<[Title], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)/3/discover/movie?api_key=\(Constants.TMD_API_KEY )&language=en-GB&sort_by=popularity.desc&include_adult=false&include_video=false&page=1&with_watch_monetization_types=flatrate") else {return}
        
        //Get data
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            //Decode JSON Object
            do {
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                compeltion(.success(results.results))
            } catch {
                compeltion(.failure(APIError.failedToGetData))
            }
        }
        task.resume()
    }
    
    func search(with query: String, compeltion: @escaping (Result<[Title], Error>) -> Void) {
        
        guard let query = query.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else {
            return
        }
        
        guard let url = URL(string: "\(Constants.baseURL)/3/search/movie?api_key=\(Constants.TMD_API_KEY )&query=\(query)") else {
            return
        }
        
        //Get data
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            //Decode JSON Object
            do {
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                compeltion(.success(results.results))
            } catch {
                compeltion(.failure(APIError.failedToGetData))
            }
        }
        task.resume()
    }
    
    func getYouTubeResult(with query: String, compeltion: @escaping (Result<VideoElement, Error>) -> Void) {
        guard let query = query.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else {
            return
        }
        guard let url = URL(string: "\(Constants.YouTubeBaseURL)q=\(query)&key=\(Constants.YouTube_API_KEY ?? "")") else {
            return
        }
        //Get data
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            //Decode JSON Object
            do {
                let results = try JSONDecoder().decode(YouTubeSearchResponse.self, from: data)
                compeltion(.success(results.items[0]))  //[0] to get top result from the query
            } catch {
                compeltion(.failure(error))
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
}

