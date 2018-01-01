//
//  ViewController.swift
//  KSDropDownList-Swift
//
//  Created by Mac on 1/1/18.
//  Copyright © 2018 Home. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // ooutlets for view components
    @IBOutlet weak var dropDown: UITextField!
    @IBOutlet weak var dropDownListBox: UITableView!
    
    // a boolean value to toggle dropdown list visiblity
    var visible:Bool = false
    
    // Drop down list items
    var phones = [
        "\u{1F496} Gallus domesticus",
        "\u{1F496} Corvus brachyrhynchos",
        "\u{1F496} Anas platyrhynchos",
        "\u{1F496} Hierococcyx varius",
        "\u{1F496} Milvus migrans",
        "\u{1F496} Acridotheres tristis",
        "\u{1F496} Luscinia megarhynchos",
        "\u{1F496} Struthio camelus",
        "\u{1F496} Perdix perdix",
        "\u{1F496} Columbidae"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // configure uitextField as dropdown button using
        self.dropDown.layer.borderColor = UIColor.init(red: 0.13, green: 0.31, blue: 0.44, alpha: 1.0).cgColor
        self.dropDown.layer.borderWidth = 1.0
        self.dropDown.layer.cornerRadius = 2.0
        
        // right most dropdown arrow icon and apply tap gesture to handle click
        let dropDownArrow = UIImageView.init(image: UIImage.init(named: "dropdown-icon"))
        dropDownArrow.isUserInteractionEnabled = true
        dropDownArrow.addGestureRecognizer(UITapGestureRecognizer.init(target: self, action: #selector(dropDownArrowClicked(_:))))
        self.dropDown.rightView = dropDownArrow
        self.dropDown.rightViewMode = .always;
        
        
        // configure uitableview as dropdown list
        self.dropDownListBox.isHidden = true
        self.dropDownListBox.layer.borderColor = UIColor.init(red: 0.13, green: 0.31, blue: 0.44, alpha: 1.0).cgColor
        self.dropDownListBox.layer.borderWidth = 1.0
        self.dropDownListBox.layer.cornerRadius = 2.0
        self.dropDownListBox.separatorStyle = .none
        self.dropDownListBox.rowHeight = 35.0
        self.dropDownListBox.backgroundColor = UIColor.groupTableViewBackground
    }
    
    // handler for dropdown arrow icon
    func dropDownArrowClicked(_ gesture: UITapGestureRecognizer){
        
        if !visible{
            self.dropDownListBox.isHidden = false
        }
        else{
            self.dropDownListBox.isHidden = true
        }
        
        visible = !visible
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /* --- tableview datasource and delegates --- */
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return self.phones.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        let cell: UITableViewCell = UITableViewCell.init(style: .default, reuseIdentifier:"TableCellIdentifier")
        
        cell.textLabel?.text = String(self.phones[indexPath.row])
        cell.backgroundColor = UIColor.clear
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        
        tableView.deselectRow(at: indexPath, animated: false)
        
        let itemName = " \(self.phones[indexPath.row])"
        self.dropDown.text = itemName
        self.dropDownListBox.isHidden = true
        
        self.visible = false
    }
}

