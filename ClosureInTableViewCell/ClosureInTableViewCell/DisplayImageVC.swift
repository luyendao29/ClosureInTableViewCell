//
//  DisplayImageVC.swift
//  ClosureInTableViewCell
//
//  Created by Boss on 9/7/20.
//  Copyright © 2020 LuyệnĐào. All rights reserved.
//

import UIKit

class DisplayImageVC: UIViewController {
    @IBOutlet weak var imageView1: UIImageView!
    @IBOutlet weak var indicatorView: UIActivityIndicatorView!
    var linkString: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        loadImageView()
    }
    
    
    func loadImageView() {
        if let cocktailImageView = self.imageView1 {
            if let linkString = linkString {
                indicatorView.startAnimating()
                DispatchQueue.global().async {
                    // load anh
                    guard let url = URL(string: linkString) else {return}
                    guard let data = try? Data(contentsOf: url) else {return}
                    DispatchQueue.main.async {
                        cocktailImageView.image = UIImage(data: data)
                        cocktailImageView.alpha = 0.3
                        UIView.animate(withDuration: 0.35, animations: {
                            cocktailImageView.alpha = 1
                        })
                        self.indicatorView.stopAnimating()
                    }
                }
            }
        }
    }
}
