//
//  HomePageViewController.swift
//  iosTom
//
//  Created by Hastomi Riduan Munthe on 22/10/24.
//

import UIKit

class HomePageViewController: UIViewController {
    @IBOutlet weak var homePageLabel: UILabel!
    @IBOutlet weak var homePageTableView: UITableView!

    var viewModel = HomePageViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupTableView()
    }
    
    func setupUI() {
        homePageLabel.text = "Choose Our Services"
        homePageLabel.font = .systemFont(ofSize: 30)
        homePageLabel.font = .boldSystemFont(ofSize: 40)
        homePageLabel.textColor = .systemBlue
    }
    
    func setupTableView() {
        homePageTableView.delegate = self
        homePageTableView.dataSource = self
        
        let nib = UINib(nibName: "HomePageTableViewCell", bundle: nil)
        homePageTableView.register(nib, forCellReuseIdentifier: "cell")
    }
    
    func getDataNews() {
        viewModel.fetchData { fetchedPosts in
            DispatchQueue.main.async {
                self.navToNewsView()
            }
        }
    }
    
    private func navToNewsView() {
        let newsVC = NewsViewController()
        newsVC.news = viewModel.getNews()
        navigationController?.pushViewController(newsVC, animated: true)
    }
}

extension HomePageViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.getDatas().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! HomePageTableViewCell
        cell.titleLabel.text = viewModel.getDatas()[indexPath.row]
         return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            getDataNews()
        case 1:
          print("satu")
        case 2:
            print("dua")
        default: break
        }
    }
}
