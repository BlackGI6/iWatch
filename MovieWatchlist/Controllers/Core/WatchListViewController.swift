//
//  WatchListViewController.swift
//  MovieWatchlist
//
//  Created by Vlada Misici on 19.12.2022.
//

import UIKit

class WatchListViewController: UIViewController {
    
    private let upcomingTable: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
    }
}
