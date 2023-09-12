# PoW Blockchain made on Crystal programming language

Small proof of work blockchain made by [tutorial](https://www.toptal.com/blockchain/crystal-programming-language-tutorial)

## Requirements

`crystal` installed

## Usage

`crystal run src/server.cr`

## Abilities

`GET /chain`             - get current state of chain <br/>
`GET /mine`              - mine block <br/>
`GET /pending`           - get pending transactions <br/>
`POST /transactions/new` - create new transaction <br/>
`POST /nodes/register`   - register node <br/>
`GET /nodes/resolve`     - sync nodes <br/>


## Contributing

1. Fork it (<https://github.com/your-github-user/crystal_blockchain/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [Ivan Vasylyshyn](https://github.com/your-github-user) - creator and maintainer
