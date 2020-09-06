//
//  ViewController.swift
//  ClosureInTableViewCell
//
//  Created by Boss on 9/6/20.
//  Copyright © 2020 LuyệnĐào. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var strInstructionsTextView: UITextView!
    @IBOutlet weak var strDrinkThumbTextView: UITextView!
    @IBOutlet weak var dateModifiedTextView: UITextView!
    @IBOutlet weak var tableView: UITableView!
    var listCocktail = [CocktailModel]()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "CocktailCell", bundle: nil), forCellReuseIdentifier: "CocktailCell")
        let url = "https://www.thecocktaildb.com/api/json/v1/1/search.php?f=a"
        DataService.sharing.getData(url: url, completion: { data in
            if let drinks = data.drinks {
                self.listCocktail = drinks
            }
            self.tableView.reloadData()
        })
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listCocktail.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CocktailCell", for: indexPath) as? CocktailCell else {
            return UITableViewCell()
        }
        cell.infoCocktail = listCocktail[indexPath.row]
        cell.fillData()
        cell.passObject = { data in
            self.fillData(data: data)
            // tableView Cell sinh đẩy xuống dòng
            tableView.beginUpdates()
            tableView.endUpdates()
        }
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(identifier: "DisplayImageVC") as! DisplayImageVC
        vc.linkString = listCocktail[indexPath.row].strDrinkThumb
        navigationController?.pushViewController(vc, animated: false)
    }
    
    func fillData(data: CocktailModel) {
        strInstructionsTextView.text = data.strInstructions
        strDrinkThumbTextView.text = data.strDrinkThumb
        dateModifiedTextView.text = data.dateModified
    }


}

