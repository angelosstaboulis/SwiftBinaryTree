//
//  main.swift
//  SwiftBinaryTree
//
//  Created by Angelos Staboulis on 2/8/23.
//

import Foundation

class Node{
    var value: Int
    var left: Node?
    var right: Node?
    init(value:Int,left: Node? = nil,right: Node? = nil) {
        self.value = value
        self.left = left
        self.right = right
    }
}
class BinaryTree{
    var root:Node?
    init(){
        self.root = nil
    }
    public func insert(value:Int){
        root = insertNode(node: root, data: value)
    }
    public func insertNode(node:Node?,data:Int) -> Node{
        guard let anode = node else {
            return Node(value: data)
        }
        if (data < anode.value) {
            anode.left = insertNode(node: anode.left, data: data)
        }else {
            anode.right = insertNode(node: anode.right, data: data)
        }
        return anode
    }
    func search(node:Node?, value: Int) -> Int? {
        guard let aNode = node else {
            return nil
        }
        
        if value < aNode.value {
            return search(node: aNode.left, value: value)
        } else if value > aNode.value {
            return search(node: aNode.right, value: value)
        } else {
            return aNode.value
        }
    }
    
    func inorder(node:Node?) {
        if let anode = node  {
            self.inorder(node: anode.left)
            print(" ", node!.value)
            self.inorder(node: anode.right)
        }
    }
}
let binaryTree = BinaryTree()
binaryTree.insert(value: 10)
binaryTree.insert(value: 20)
binaryTree.insert(value: 30)
binaryTree.insert(value: 40)
binaryTree.insert(value: 50)
print("InOrder")
binaryTree.inorder(node:binaryTree.root!)
print("search")
if let result = binaryTree.search(node: binaryTree.root!, value: 130){
    debugPrint("node found",result)
}else{
    debugPrint("node not found")
}

