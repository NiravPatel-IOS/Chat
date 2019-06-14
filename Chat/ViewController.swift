//
//  ViewController.swift
//  Chat
//
//  Created by Nirav on 14/06/19.
//  Copyright © 2019 Nirav. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tblChat : UITableView!
    
    var objcChatModel : ChatModel = ChatModel()
    var objcChatListModel : ChatListModel = ChatListModel()
    
    var MessagesFromServer = [ChatModel]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        navigationItem.title = "Messages"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        getMessage()
        setupTableView()
    }

    func setupTableView() {
        tblChat.register(UINib(nibName: "ChatMessageCell", bundle: nil), forCellReuseIdentifier: "ChatMessageCell")
        
        tblChat.rowHeight = UITableView.automaticDimension
        tblChat.estimatedRowHeight = 60.0
            
        tblChat.delegate = objcChatListModel
        tblChat.dataSource = objcChatListModel
        objcChatListModel.reloadTableWithShorting(arrMessage: MessagesFromServer)
    }
    
    func getMessage() {
        MessagesFromServer = objcChatModel.getMessages()
    }
    
}


