//
//  ChatModel.swift
//  Chat
//
//  Created by Nirav on 14/06/19.
//  Copyright © 2019 Nirav. All rights reserved.
//

import UIKit

class ChatModel: NSObject {
    var text: String = ""
    var isIncoming: Bool = false
    var date: Date = Date()
    
    func getMessages()-> [ChatModel] {
        let chat1 : ChatModel = ChatModel()
        chat1.text = "Here's my very first message"
        chat1.isIncoming = true
        chat1.date = Date.dateFromCustomString(customString: "08/03/2018 06:30 am")
        
        let chat2 : ChatModel = ChatModel()
        chat2.text = "I'm going to message another long message that will word wrap"
        chat2.isIncoming = true
        chat2.date = Date.dateFromCustomString(customString: "08/03/2018 12:30 pm")
        
        let chat3 : ChatModel = ChatModel()
        chat3.text = "A message is a discrete unit of communication intended by the source for consumption by some recipient or group of recipients. A message may be delivered by various means, including courier, telegraphy, carrier pigeon and electronic bus. A message can be the content of a broadcast."
        chat3.isIncoming = false
        chat3.date = Date.dateFromCustomString(customString: "09/15/2018 06:30 am")
        
        let chat4 : ChatModel = ChatModel()
        chat4.text = "Yo, dawg, Whatsup!"
        chat4.isIncoming = false
        chat4.date = Date()
        
        let chat5 : ChatModel = ChatModel()
        chat5.text = "This message should appear on the left with a white background bubble"
        chat5.isIncoming = true
        chat5.date = Date.dateFromCustomString(customString: "09/15/2018 09:00 pm")
        
        let chat6 : ChatModel = ChatModel()
        chat6.text = "Third Section message"
        chat6.isIncoming = true
        chat6.date = Date.dateFromCustomString(customString: "10/31/2018 04:00 am")
        
        let chat7 : ChatModel = ChatModel()
        chat7.text = "This message should appear on the right with a white background bubble"
        chat7.isIncoming = false
        chat7.date = Date.dateFromCustomString(customString: "09/15/2018 06:45 am")

        var messagesFromServer : [ChatModel] = [ChatModel]()
        messagesFromServer.append(chat1)
        messagesFromServer.append(chat2)
        messagesFromServer.append(chat3)
        messagesFromServer.append(chat4)
        messagesFromServer.append(chat5)
        messagesFromServer.append(chat6)
        messagesFromServer.append(chat7)
        return messagesFromServer
    }
}
