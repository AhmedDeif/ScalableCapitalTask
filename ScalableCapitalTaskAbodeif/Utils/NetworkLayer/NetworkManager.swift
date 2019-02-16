//
//  NetworkManager.swift
//  ScalableCapitalTaskAbodeif
//
//  Created by Ahmed Abodeif on 2/16/19.
//  Copyright © 2019 Ahmed Abodeif. All rights reserved.
//

import Foundation

class NetworkManager {
    
    private var urlSession: URLSession
    static private var sharedManager: NetworkManager = {
        let urlSession = URLSession(configuration: .default)
        let manager = NetworkManager(urlSession: urlSession)
        return manager
    }()
    
    private init(urlSession: URLSession) {
        self.urlSession = urlSession
    }
    
    class func shared() -> NetworkManager {
        return sharedManager
    }
    
    func loadRepos(url: String, completition: @escaping ((_ callSucceeded: Bool, _ result: [RepositoryModel]?)->())) {
        guard let urlObject = URL(string: url) else {
            // malformed URL
            completition(false, nil)
            return
        }
        let dataTask = self.urlSession.dataTask(with: urlObject) { data, response, error in
            
            if let httpResponse = response as? HTTPURLResponse {
                switch httpResponse.statusCode {
                case (200..<300):
                    print("call success")
                    if let data = data {
                        guard let parsedResponse = try? JSONDecoder().decode([RepositoryModel].self, from: data) else {
                            print("failes to parse")
                            completition(false, nil)
                            return
                        }
                        // I have the data parsed
                        completition(true, parsedResponse)
                    }
                default:
                    print("server error")
                }
            }
        }
        
        dataTask.resume()
    }
    
    
    func loadCommits(url: String, completition: @escaping ((_ callSucceeded: Bool, _ result: [CommitModel]?)->())) {
        guard let urlObject = URL(string: url) else {
            // malformed URL
            completition(false, nil)
            return
        }
        let dataTask = self.urlSession.dataTask(with: urlObject) { data, response, error in
            
            if let httpResponse = response as? HTTPURLResponse {
                switch httpResponse.statusCode {
                case (200..<300):
                    print("call success")
                    if let data = data {
                        guard let parsedResponse = try? JSONDecoder().decode([CommitModel].self, from: data) else {
                            print("failes to parse")
                            completition(false, nil)
                            return
                        }
                        // I have the data parsed
                        completition(true, parsedResponse)
                    }
                default:
                    print("server error")
                }
            }
        }
        dataTask.resume()
    }
    
}
