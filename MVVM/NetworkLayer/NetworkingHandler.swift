//
//  NetworkingHandler.swift
//  MVVM
//
//  Created by Payal Gupta on 25/10/18.
//  Copyright © 2018 Payal Gupta. All rights reserved.
//

import Foundation

class NetworkingHandler {
    static func fetchData(at urlString: String, handler: ((Any?, Error?)->())?)  {
        if let url = URL(string: urlString) {
            URLSession.shared.dataTask(with: url) { (data, urlResponse, error) in
                if let data = data, let todos = try? JSONDecoder().decode([Model].self, from: data) {
                    handler?(todos, nil)
                }
                else {
                    handler?(nil, error)
                }
            }.resume()
        }
        else {
            handler?(nil, nil) //TODO:
        }
    }
}
