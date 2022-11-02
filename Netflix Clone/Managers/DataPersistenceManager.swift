//
//  DataPersistenceManager.swift
//  Netflix Clone
//
//  Created by Evans, Adam on 02/11/2022.
//

import Foundation
import UIKit
import CoreData

class DataPersistenceManager {
    
    enum DataBaseError: Error {
        case failedToSaveData
    }
    
    static let shared = DataPersistenceManager()
    
    func downloadTitleWith(model: Title, completion: @escaping (Result <Void, Error>) -> Void) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let context = appDelegate.persistentContainer.viewContext
        
        let item = TitleItem(context: context)
        
        item.id = Int64(model.id)
        item.original_title = model.original_title
        item.original_name = model.original_name
        item.overview = model.overview
        item.media_type = model.media_type
        item.poster_path = model.poster_path
        item.release_date = model.release_date
        item.vote_count = Int64(model.vote_count)
        item.vote_average = model.vote_average
        
        do {
            try context.save()
            completion(.success(()))    // Parsing () is used to parse void
        } catch {
            print(error.localizedDescription)
            completion(.failure(DataBaseError.failedToSaveData))
        }
    }
}
