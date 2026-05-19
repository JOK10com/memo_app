//
//  MemoDetail.swift
//  memo_app
//
//  Created by dgsw40 on 5/13/26.
//

import SwiftUI

struct MemoDetail: View {
    @Binding var memo: Memo
    @Binding var memos: [Memo]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Menu {
                NavigationLink(destination: MemoWrite(memo: $memo, memos: $memos)) {
                    Label("수정", systemImage: "pencil")
                }
                
                Button(role: .destructive, action: {
                    memo.title.removeAll()
                    memo.content.removeAll()
                }) {
                    Label("내용 전체 삭제", systemImage: "trash")
                }
            } label: {
                Image(systemName: "ellipsis.circle")
                    .font(.system(size: 25))
                    .foregroundColor(.yellow)
            }
            
            Text(memo.title)
                .font(.system(size: 28, weight: .bold))
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Divider()
            
            ScrollView {
                Text(memo.content)
                    .font(.system(size: 18))
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
        .padding()
    }
}

#Preview {
    NavigationStack {
        MemoDetail(
            memo: .constant(Memo(title: "", content: "")),
            memos: .constant([])
        )
    }
}
