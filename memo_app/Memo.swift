//
//  Memo.swift
//  memo_app
//
//  Created by dgsw40 on 5/21/26.
//

import SwiftUI

struct Memo: Identifiable {
    let id = UUID()
    var title: String
    var content: String
}
