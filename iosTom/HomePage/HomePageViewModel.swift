//
//  HomePageViewModel.swift
//  iosTom
//
//  Created by Hastomi Riduan Munthe on 22/10/24.
//

import UIKit

class HomePageViewModel {
    
    private var datas: [String] = ["News", "Games", "Music"]
    private var result: [Post] = []
    
    //To Get Data
    func getDatas() -> [String] {
        return datas
    }
    
    //To get News
    func getNews() -> [Post] {
        return result
    }
   
    //API Call
    func fetchData(completion: @escaping ([Post]) -> Void) {
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, error == nil else {
                print("Error fetching data: \(String(describing: error))")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let posts = try decoder.decode([Post].self, from: data)
                self.result = posts
                completion(posts)
            } catch {
                print("Error parsing JSON: \(error)")
            }
        }
        
        task.resume()
    }
}
