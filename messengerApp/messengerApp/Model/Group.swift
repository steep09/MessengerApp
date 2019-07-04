//
//  Group.swift
//  messengerApp
//
//  Created by Stephenson Ang on 04/07/2019.
//  Copyright © 2019 Stephenson Ang. All rights reserved.
//

import Foundation

class Group {
    
    private var _title: String
    private var _description: String
    private var _memberCount: Int
    
    var title:String{
        return _title
    }
    
    var description:String{
        return _description
    }
    
    var memberCount:Int{
        return _memberCount
    }
    
    init(title:String, description:String, memberCount:Int) {
        self._title = title
        self._description = description
        self._memberCount = memberCount
    }
}
