//
//  HTTPViewController.swift
//  BradSample
//
//  Created by Bradley Johnson on 7/22/15.
//  Copyright (c) 2015 BPJ. All rights reserved.
//

import UIKit

class HTTPViewController: UIViewController, UITableViewDataSource, UISearchBarDelegate {

  @IBOutlet weak var searchBar: UISearchBar!
  @IBOutlet weak var tableView: UITableView!
  
  var repos = [Repository]()
  
    override func viewDidLoad() {
        super.viewDidLoad()
      tableView.dataSource = self
      tableView.rowHeight = UITableViewAutomaticDimension
      tableView.estimatedRowHeight = 70
      searchBar.delegate = self
    }
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return repos.count
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    
    let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! SearchCell
    
    cell.searchLabel.text = repos[indexPath.row].description
    
    return cell
    
  }
  
  func searchBarSearchButtonClicked(searchBar: UISearchBar) {
    
    searchBar.resignFirstResponder()
    
   GithubService.fetchReposForSearch(searchBar.text, completionHandler: { (reposFromSearch, error) -> (Void) in
      if let reposFromSearch = reposFromSearch {
        self.repos = reposFromSearch
        self.tableView.reloadData()
      } else {
        println(error)
    }
    })
    
  }
    


}
