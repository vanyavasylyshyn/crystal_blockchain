require "kemal"
require "uuid"
require "json"

require "./crystal_blockchain/blockchain"

node_identifier = UUID.random.to_s
blockchain = CrystalBlockchain::Blockchain.new

get "/chain" do
  result = Hash(String, Array(CrystalBlockchain::Block)).new
  result["chain"] = blockchain.chain
  result.to_json
end

get "/mine" do
  blockchain.mine
  "Block with index=#{blockchain.chain.last.index} is mined."
end

get "/pending" do
  result = Hash(String, Array(CrystalBlockchain::Block::Transaction)).new
  result["transactions"] = blockchain.uncommitted_transactions
  result.to_json
end

post "/transactions/new" do |env|
  transaction = CrystalBlockchain::Block::Transaction.new(
    from:    env.params.json["from"].as(String),
    to:      env.params.json["to"].as(String),
    amount:  env.params.json["amount"].as(Int64)
  )

  blockchain.add_transaction(transaction)

  "Transaction #{transaction} has been added to the node"
end

post "/nodes/register" do |env|
  nodes = env.params.json["nodes"].as(Array)

  raise "Empty array" if nodes.empty?

  nodes.each do |node|
    blockchain.register_node(node.to_s)
  end

  "New nodes have been added: #{blockchain.nodes}"
end

get "/nodes/resolve" do
  if blockchain.resolve
    "Successfully updated the chain"
  else
    "Current chain is up-to-date"
  end
end

Kemal.run 3000
