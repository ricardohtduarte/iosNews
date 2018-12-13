import UIKit

private let reuseIdentifier = "Cell"

final class HomeViewController: UITableViewController {
    
    let tableview = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        tableView.register(NewsCell.self, forCellReuseIdentifier: reuseIdentifier)
        tableview.delegate = self
        tableview.dataSource = self
        self.navigationItem.title = "iOS News"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.searchController = UISearchController(searchResultsController: nil)
    }
}

extension HomeViewController {
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! NewsCell
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
}
