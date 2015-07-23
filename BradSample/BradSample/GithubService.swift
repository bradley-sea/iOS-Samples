//
//  GithubService.swift
//  GithubToGo
//
//  Created by Bradley Johnson on 4/13/15.
//  Copyright (c) 2015 BPJ. All rights reserved.
//

import Foundation


class GithubService : NSObject, NSURLSessionDataDelegate {
  
  class func fetchReposForSearch(searchTerm : String, completionHandler : ( [Repository]?, String?) ->(Void)) {
    
    let githubSearchRepoURL = "https://api.github.com/search/repositories"
    let queryString = "?q=\(searchTerm)"
    let requestURL = githubSearchRepoURL + queryString
    let url = NSURL(string: requestURL)
    let request = NSMutableURLRequest(URL: url!)
    
    let dataTask = NSURLSession.sharedSession().dataTaskWithRequest(request, completionHandler: { (data, response, error) -> Void in
      
      if let error = error {
        completionHandler(nil,"Could not connect to Github, please make sure you have an internet connection and try again")
      } else {
        
        if let httpResponse = response as? NSHTTPURLResponse {
          println(httpResponse.statusCode)
          
          if httpResponse.statusCode == 200 {
            
            let repos = RepoJSONParser.reposFromJSONData(data)
            NSOperationQueue.mainQueue().addOperationWithBlock({ () -> Void in
              completionHandler(repos,nil)
            })
          } else {
            completionHandler(nil,"Could not complete your search, please try again later")
          }
        }
      }
    })
    dataTask.resume()
  }
}
