//
//  ChatListModel.swift
//  Chat
//
//  Created by Nirav on 14/06/19.
//  Copyright © 2019 Nirav. All rights reserved.
//

import UIKit

class ChatListModel: NSObject {

    var chatMessages = [[ChatModel]]()
    
    func reloadTableWithShorting(arrMessage : [ChatModel]) {
        attemptToAssembleGroupedMessages(messagesFromServer: arrMessage)
    }
    
    fileprivate func attemptToAssembleGroupedMessages(messagesFromServer : [ChatModel]) {
        print("Attempt to group our messages together based on Date property")
        
        let groupedMessages = Dictionary(grouping: messagesFromServer) { (element) -> Date in
            return element.date.reduceToMonthDayYear()
        }
        
        // provide a sorting for your keys somehow
        let sortedKeys = groupedMessages.keys.sorted()
        sortedKeys.forEach { (key) in
            var values = groupedMessages[key]
            values = values!.sorted(by: {
                $0.date.compare($1.date) == .orderedAscending
            })
            chatMessages.append(values!)
        }
    }
}

extension ChatListModel : UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return chatMessages.count
    }
    
    class DateHeaderLabel: UILabel {
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            
            backgroundColor = .black
            textColor = .white
            textAlignment = .center
            translatesAutoresizingMaskIntoConstraints = false // enables auto layout
            font = UIFont.boldSystemFont(ofSize: 14)
        }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        override var intrinsicContentSize: CGSize {
            let originalContentSize = super.intrinsicContentSize
            let height = originalContentSize.height + 12
            layer.cornerRadius = height / 2
            layer.masksToBounds = true
            return CGSize(width: originalContentSize.width + 20, height: height)
        }
        
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if let firstMessageInSection = chatMessages[section].first {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MM/dd/yyyy"
            let dateString = dateFormatter.string(from: firstMessageInSection.date)
            
            let label = DateHeaderLabel()
            label.text = dateString
            
            let containerView = UIView()
            
            containerView.addSubview(label)
            label.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
            label.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
            
            return containerView
            
        }
        return nil
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chatMessages[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChatMessageCell", for: indexPath) as! ChatMessageCell
        let chatMessage = chatMessages[indexPath.section][indexPath.row]
        //cell.chatMessage = chatMessage
        
        cell.bubbleBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        cell.bubbleBackgroundView.backgroundColor = chatMessage.isIncoming ? .white : #colorLiteral(red: 0.01176470588, green: 0.7843137255, blue: 0.3647058824, alpha: 1)
        cell.messageLabel.textColor = chatMessage.isIncoming ? .black : .white
        cell.timeLabel.textColor = chatMessage.isIncoming ? #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1) : #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
        
        cell.messageLabel.text = chatMessage.text
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "hh:mm a"
        let dateString = dateFormatter.string(from: chatMessage.date)
        
        cell.timeLabel.text = dateString
        
        if chatMessage.isIncoming {
            cell.leadingConstraint.isActive = true
            cell.trailingConstraint.isActive = false
        } else {
            cell.leadingConstraint.isActive = false
            cell.trailingConstraint.isActive = true
        }
        
        cell.selectionStyle = .none
        return cell
    }
}

extension Date {
    static func dateFromCustomString(customString: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy hh:mm a"
        return dateFormatter.date(from: customString) ?? Date()
    }
    
    func reduceToMonthDayYear() -> Date {
        let calendar = Calendar.current
        let month = calendar.component(.month, from: self)
        let day = calendar.component(.day, from: self)
        let year = calendar.component(.year, from: self)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        return dateFormatter.date(from: "\(month)/\(day)/\(year)") ?? Date()
    }
}
