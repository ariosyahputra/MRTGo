//
//  DestinationList.swift
//  MRTGo
//
//  Created by Ario Syahputra on 19/07/23.
//

import SwiftUI

struct Destination {
    var name: String
    var exitGate: String
    var location: (latitude: Double, longitude: Double)
}

struct DestinationList: View {

    @Binding var destination: String
    @Binding var isDestinationChosen: Bool
    
    private func filteredDestination() -> [Destination] {
           return matchedDestination(destinationPlace: destinationPlace, destination: destination)
       }
    
//    private func filteredDestination() -> [Destination] {
//        if destination.isEmpty {
//            return destinationPlace
//        } else {
//            return destinationPlace.filter { $0.name.lowercased().contains(destination.lowercased()) }
//        }
//    }

    var body: some View {
        VStack(alignment: .leading) {
            Text("Pilih Tujuan")
                .font(.system(size: 24, weight: .bold))
                .foregroundColor(Color("Primary"))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 20)
                .padding(.vertical, 15)

            ScrollView {
                VStack {
                    ForEach(filteredDestination(), id: \.name) { destinations in
                        Button(action: {
                            destination = destinations.name // Set the departure state to the selected station's name
                            isDestinationChosen = true
                        }) {
                            HStack(spacing: 10) {
                                Image("train")
                                    .resizable()
                                    .frame(width: 24, height: 24)
                                VStack(alignment: .leading, spacing: 2) {
                                    Text(destinations.name)
                                        .font(.system(size: 16, weight: .medium))
                                    Text("\(destinations.exitGate)")
                                        .font(.system(size: 16, weight: .medium))
                                        .foregroundColor(Color("Gray-400"))
                                }
                                Spacer()
                            }
                            .padding(.horizontal, 20)
                            .padding(.vertical, 5)
                            .frame(maxWidth: .infinity)
                        }
                    }
                }
            }
        }
    }
}

//struct DestinationList_Previews: PreviewProvider {
//    static var previews: some View {
//        DestinationList()
//    }
//}
