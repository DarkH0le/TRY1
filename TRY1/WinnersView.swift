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
    let playAgainBtn : UIButton = {
       let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Play Again" , for: .normal)
        btn.backgroundColor = UIColor.cyan
        btn.layer.cornerRadius = 3
        btn.layer.shadowOpacity = 0.8
        btn.layer.shadowOffset = CGSize(width: 3, height: 2)
        btn.addTarget(self, action: #selector(showWinner), for: .touchUpInside)
        return btn
    }()
    
    @objc func showWinner() -> Void{
        
    }
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
        view.addSubview(playAgainBtn)
        //Set Contr
        labelWinner.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        labelWinner.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        //Play Button
        playAgainBtn.heightAnchor.constraint(greaterThanOrEqualToConstant: 36).isActive = true
        playAgainBtn.widthAnchor.constraint(greaterThanOrEqualToConstant: 88).isActive = true
        playAgainBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//        playAgainBtn.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100).isActive = true
        playAgainBtn.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant:-(view.bounds.height*1/10)).isActive = true
    }
}

extension WinnersView: winnerDelegate {
    func valueSelected(value: String) {
        labelWinner.text = value
    }
    
    
}

