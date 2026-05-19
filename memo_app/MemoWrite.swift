//
//  MemoWrite.swift
//  memo_app
//
//  Created by dgsw40 on 5/11/26.
//

import SwiftUI

struct MemoWrite: View {
    @Binding var memo: Memo
    @Binding var memos: [Memo]
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                
                Menu {
                    Button(role: .destructive, action: {
                        memo.title.removeAll()
                        memo.content.removeAll()
                    }) {
                        Label("내용 전체 삭제", systemImage: "trash")
                    }
                }label: {
                    Image(systemName: "ellipsis.circle")
                        .font(.system(size: 26))
                        .foregroundColor(.yellow)
                }
                
                Spacer()
                
                Button {
                    if let index = memos.firstIndex(where: { $0.id == memo.id }) {
                        memos[index] = memo
                    } else {
                        memos.append(memo)
                        memo = Memo(title: "", content: "")
                    }
                } label: {
                    Text("완료") 
                        .foregroundColor(.yellow)
                        .font(.system(size: 25))
                }

            }
            
            TextField("Title", text: $memo.title)
                .font(.system(size: 24, weight: .bold))
                .padding(.top, 20)
            
            Divider()
            
            TextEditor(text: $memo.content)
                .font(.body)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }.padding()
            
    }
}

#Preview {
    NavigationStack {
        MemoWrite(
            memo: .constant(Memo(title: "", content: "")),
            memos: .constant([])
        )
    }
}
