//
//  ImageListViewController.swift
//  NSKeyedArchiver-Exercise
//
//  Created by C4Q on 12/12/17.
//  Copyright © 2017 Melissa He @ C4Q. All rights reserved.
//

import UIKit

class ImageListViewController: UIViewController {
    
    @IBOutlet weak var imageSearchTableView: UITableView!
    
    //Table View Data Source Variable
    var images: [Image] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageSearchTableView.dataSource = self
    }
}

extension ImageListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return images.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "imageCell", for: indexPath)
        
        //to do
        
        return cell
    }
}
