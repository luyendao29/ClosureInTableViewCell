//
//  CocktailCell.swift
//  ClosureInTableViewCell
//
//  Created by Boss on 9/6/20.
//  Copyright © 2020 LuyệnĐào. All rights reserved.
//

import UIKit

class CocktailCell: UITableViewCell, UITextViewDelegate {
    @IBOutlet weak var strInstructionsTextView: UITextView!
    @IBOutlet weak var strDrinkThumbTextView: UITextView!
    @IBOutlet weak var dateModifiedTextView: UITextView!

    var infoCocktail = CocktailModel()
    var passObject: ((_ data: CocktailModel) -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        strInstructionsTextView.delegate = self
        strDrinkThumbTextView.delegate = self
        dateModifiedTextView.delegate = self
    }

    func setData() {
        infoCocktail.strInstructions = strInstructionsTextView.text
        infoCocktail.strDrinkThumb = strDrinkThumbTextView.text
        infoCocktail.dateModified = dateModifiedTextView.text
    }
    
    func fillData() {
        strInstructionsTextView.text = infoCocktail.strInstructions
        strDrinkThumbTextView.text = infoCocktail.strDrinkThumb
        dateModifiedTextView.text = infoCocktail.dateModified
    }
    
    func textViewDidChange(_ textView: UITextView) {
        setData()
        passObject?(infoCocktail)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
