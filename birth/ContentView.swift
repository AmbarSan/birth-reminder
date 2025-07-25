//
//  ContentView.swift
//  birth
//
//  Created by Ámbar Aguilar Sánchez on 25/07/25.
//

import SwiftUI
import SwiftData
struct ContentView: View {
    @Query private var friends: [Friend]
    @Environment(\.modelContext) private var context
    @State private var newname = ""
    @State private var newBirthday = Date.now
    
    var body: some View {
        NavigationStack{
            List(friends, id: \.name){ friend in
                HStack{
                    Text(friend.name)
                    Spacer()
                    Text(friend.birthday, format: .dateTime.month(.wide).day().year())
                }
            }
            .navigationTitle("Birthdays")
            .safeAreaInset(edge:.bottom) {
                VStack(alignment:.center, spacing: 20){
                    Text("New birhday")
                        .font(.headline)
                    DatePicker(selection: $newBirthday, in: Date.distantPast...Date.now, displayedComponents: .date){
                        TextField("Name", text:$newname)
                            .textFieldStyle(.roundedBorder)
                    }
                    Button("Save") {
                        let newFriend = Friend(name: newname, birthday: newBirthday)
                        context.insert(newFriend)
                        newname = ""
                        newBirthday = .now
                    }
                    .bold()
                }
                .padding()
                .background(.bar)
            }
            
        }
    }
}
