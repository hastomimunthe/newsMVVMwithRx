//
//  NewsViewController.swift
//  iosTom
//
//  Created by Hastomi Riduan Munthe on 22/10/24.
//

import UIKit

class NewsViewController: UIViewController {
    
    @IBOutlet weak var newsTableView: UITableView!
    @IBOutlet weak var nameSearchBar: UISearchBar!
    
    var news = [Post]()
    var filteredNews = [Post]()
    var isSearching = false

    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewSetup()
        searchSetup()
    }
    
    func tableViewSetup() {
        newsTableView.dataSource = self
        newsTableView.delegate = self
        
        let nib = UINib(nibName: "NewsTableViewCell", bundle: nil)
        newsTableView.register(nib, forCellReuseIdentifier: "NewsCell")
    }
    
    func searchSetup() {
        nameSearchBar.delegate = self
    }
}

extension NewsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return isSearching ? filteredNews.count : news.count
     }
     
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCell", for: indexPath) as! NewsTableViewCell
         let post = isSearching ? filteredNews[indexPath.row] : news[indexPath.row]
         cell.configureCell(post: post)
         return cell
     }
}

extension NewsViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            isSearching = false
            filteredNews.removeAll()
        } else {
            isSearching = true
            filteredNews = news.filter { $0.title.lowercased().contains(searchText.lowercased()) }
        }
        newsTableView.reloadData()
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = nil
        isSearching = false
        filteredNews.removeAll()
        newsTableView.reloadData()
        searchBar.resignFirstResponder() 
    }
}
