//
//  HomeViewController.swift
//  Netflix-clone
//
//  Created by Daim Abbas Kazmi on 31/03/2023.
//

import UIKit

class HomeViewController: UIViewController {
    
    private let homeFeed : UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(CollectionViewTableViewCell.self ,forCellReuseIdentifier: CollectionViewTableViewCell.identifier)
        return table
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(homeFeed)
        
        homeFeed.delegate = self
        homeFeed.dataSource = self
        homeFeed.tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 500))
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        homeFeed.frame = view.bounds
    }


}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 20
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CollectionViewTableViewCell.identifier, for: indexPath)
                as? CollectionViewTableViewCell
        else{
            return UITableViewCell()
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
}
