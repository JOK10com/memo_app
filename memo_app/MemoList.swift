//
//  MemoList.swift
//  memo_app
//
//  Created by dgsw40 on 5/11/26.
//
import SwiftUI

struct Memo: Identifiable {
    let id = UUID()
    var title: String
    var content: String
}

struct MemoList: View {
    @State var searchText: String = ""
    @State var memos: [Memo] = [
        Memo(title: "5월 13일 수요일", content: "아침/점심은 좋지만 저녁이 살짝 아쉬운 느낌."),
        Memo(title: "체육대회 날", content: "기마전, 꼬리잡기, 줄다리기")
    ]
    @State var newMemo = Memo(title: "", content: "")
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .bottomTrailing) {
                VStack(spacing: 0) {
                    HStack {
                        Text("Memos")
                            .font(.system(size: 35, weight: .bold))
                        Spacer()
                        
                        
                        Menu {
                            Button(role: .destructive, action: {
                                memos.removeAll()
                            }) {
                                Label("메모 전체 삭제", systemImage: "trash")
                            }
                        }label: {
                            Image(systemName: "ellipsis.circle")
                                .font(.system(size: 25))
                                .foregroundColor(.yellow)
                        }
                        .searchable(text: $searchText, prompt: "메모를 검색하세요")
                    }
                    .padding(.horizontal, 15)
                    .padding(.top, 20)
                    
                    ScrollView {
                        VStack(spacing: 8) {
                            ForEach($memos) { $memo in
                                if searchText.isEmpty ||
                                    memo.title.localizedStandardContains(searchText) ||
                                    memo.content.localizedStandardContains(searchText) {
                                    
                                    HStack(spacing: 0) {
                                        NavigationLink(destination: MemoDetail(memo: $memo, memos: $memos)) {
                                            VStack(alignment: .leading, spacing: 5) {
                                                Text(memo.title)
                                                    .font(.headline)
                                                    .foregroundColor(.black)
                                                Text(memo.content)
                                                    .font(.subheadline)
                                                    .foregroundColor(.gray)
                                                    .lineLimit(1)
                                            }
                                            .padding()
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                        }
                                        
                                        Spacer()
                                        
                                        Button(role: .destructive) {
                                            if let index = memos.firstIndex(where: { $0.id == memo.id }) {
                                                memos.remove(at: index)
                                            }
                                        } label: {
                                            Image(systemName: "trash")
                                                .font(.system(size: 20))
                                                .foregroundColor(.red)
                                                .padding()
                                        }
                                    }
                                    .background(Color(.systemGray6))
                                    .cornerRadius(10)
                                }
                            }
                        }
                        .padding()
                    }
                    
                    NavigationLink(destination: MemoWrite(memo: $newMemo, memos: $memos)) {
                        Image(systemName: "square.and.pencil.circle.fill")
                            .symbolRenderingMode(.palette)
                            .foregroundStyle(.white, Color(.yellow))
                            .font(.system(size: 65))
                    }
                    .padding(.leading, 280)
                    .padding(.bottom, 20)
                }
            }
        }
    }
}

#Preview {
    MemoList()
}
