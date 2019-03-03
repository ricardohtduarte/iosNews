import UIKit

private let reuseIdentifier = "Cell"

final class HomeViewController: UIViewController {
    
    let tableview = UITableView()
    var articles: [Article] = []
    
    var homeViewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        self.view.addSubview(tableview)
        tableview.register(NewsCell.self, forCellReuseIdentifier: reuseIdentifier)
        tableview.delegate = self
        tableview.dataSource = self
        
        tableview.translatesAutoresizingMaskIntoConstraints = false
        tableview.topAnchor.constraint(equalTo:view.topAnchor).isActive = true
        tableview.leftAnchor.constraint(equalTo:view.leftAnchor).isActive = true
        tableview.rightAnchor.constraint(equalTo:view.rightAnchor).isActive = true
        tableview.bottomAnchor.constraint(equalTo:view.bottomAnchor).isActive = true
        
        self.navigationItem.title = "iOS News"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.searchController = UISearchController(searchResultsController: nil)
        fetchViewModelData()
    }
    
    func fetchViewModelData() {
        homeViewModel.fetchNews()
        homeViewModel.onUpdate = { [weak self] status in
            guard let self = self else {
                return
            }
            switch status {
            case .loading:
                print("Is loading")
            case .ready(let articles):
                self.articles = articles
                DispatchQueue.main.async {
                    print("Reloaded tableView")
                    self.tableview.reloadData()
                }
            case .offline:
                print("Is offline")
            case .failed:
                print("Request in view model failed")
            }
        }
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! NewsCell
        cell.titleLabel.text = articles[indexPath.row].title
        cell.descriptionLabel.text = articles[indexPath.row].description
        cell.authorLabel.text = articles[indexPath.row].author
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
}
