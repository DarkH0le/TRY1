//
//  WinnersView.swift
//  TRY1
//
//  Created by Ivan Aldama on 08/03/18.
//  Copyright © 2018 Ivan Aldama. All rights reserved.
//

import UIKit

class WinnersView: UIViewController {
    
    let labelWinner : UILabel = {
        let newlabel = UILabel()
        newlabel.text = "WINNERS ISSSSSSSSSS"
        newlabel.backgroundColor = UIColor.cyan
        newlabel.translatesAutoresizingMaskIntoConstraints = false
        return newlabel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.brown
        setViews()
        presentChoices()
    }
    
    func presentChoices() -> Void {
        let viewMain:ViewController = ViewController()
        viewMain.winnerDelegate = self
        present(viewMain, animated: true, completion: nil)
    }
    func setViews() -> Void {
        //Adding views
        view.addSubview(labelWinner)
        //Set Contr
        labelWinner.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        labelWinner.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
}

extension WinnersView: winnerDelegate {
    func valueSelected(value: String) {
        labelWinner.text = value
    }
    
    
}

