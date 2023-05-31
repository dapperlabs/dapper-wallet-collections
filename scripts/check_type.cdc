import DapperWalletCollections from 0x6d9ae43184a7ad9f

pub fun main(identifiers: [String]) {
    let acct = getAuthAccount(0x6d9ae43184a7ad9f)
    let ref = acct.borrow<&DapperWalletCollections.Admin>(from: DapperWalletCollections.StoragePath)
        ?? panic("admin not found")

    for identifier in identifiers {
        if let c = CompositeType(identifier) {
            ref.addType(c)
        }
    }
}