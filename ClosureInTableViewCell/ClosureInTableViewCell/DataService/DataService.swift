//
//  DataService.swift
//  ClosureInTableViewCell
//
//  Created by Boss on 9/6/20.
//  Copyright © 2020 LuyệnĐào. All rights reserved.
//

import UIKit

class DataService {
    static let sharing: DataService = DataService()
    
    func getData(url: String, completion: @escaping(BaseDataModel) -> Void) {
        guard let url = URL(string: url) else {return}
        URLSession.shared.dataTask(with: url, completionHandler: { data, response, error in
            if let data = data, let dataString = String(data: data, encoding: .utf8) {
                           print("fullURLRequest: ", url)
                           print("params: ", url.query as Any)
                           print("header: ", url.relativeString)
                           print("Response json:\n", dataString)
                       }
            do {
                let json = try? JSONDecoder().decode(BaseDataModel.self, from: data!)
                DispatchQueue.main.async {
                    if let json = json {
                        completion(json)
                    }
                }
            } catch let error {
                print("decode error: ", error)
            }
        })
        .resume()
    }
}
