import DapperWalletCollections from 0x6d9ae43184a7ad9f

transaction(identifiers: [String]) {
    prepare(acct: AuthAccount) {
        let ref = acct.borrow<&DapperWalletCollections.Admin>(from: DapperWalletCollections.StoragePath)
            ?? panic("admin not found")

        for identifier in identifiers {
            if let c = CompositeType(identifier) {
                ref.addType(c)
            }
        }
    }
}