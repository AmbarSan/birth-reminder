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
        NavigationStack {
            List {
                ForEach(friends) { friend in
                    HStack {
                        HStack {
                            Text(friend.name)
                            Spacer()
                            Text(friend.birthday, format: .dateTime.month(.wide).day().year())
                        }
                    }
                }
                .onDelete(perform: deleteFriend)
            }
            .navigationTitle("Birthdays")
            .safeAreaInset(edge: .bottom) {
                VStack(alignment: .center, spacing: 20) {
                    Text("New birthday") 
                        .font(.headline)

                    TextField("Name", text: $newname)
                        .textFieldStyle(.roundedBorder)

                    DatePicker("Birthday", selection: $newBirthday, in: Date.distantPast...Date.now, displayedComponents: .date)

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

    func deleteFriend(at offsets: IndexSet) {
        for index in offsets {
            let friendToDelete = friends[index]
            context.delete(friendToDelete)
        }
    }
}
#Preview {
    ContentView()
        .modelContainer(for: Friend.self, inMemory: true)
}

