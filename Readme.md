
A Docker image that signs and verifies your email address to claim your rewards for the Casper Test Net by [DEVxDAO](https://devxdao.com).

* Info from [Howto Casperlabs](https://github.com/make-software/how-to-casperlabs)
* [Ubuntu node setup](https://github.com/make-software/how-to-casperlabs/blob/master/docs/ubuntu/setup-testnet-validator-from-scratch.md)
* [casper-testnet-validator-identification](https://github.com/make-software/casper-testnet-validator-identification) for signing.


## Usage 

1. Clone this repo and cd into it
2. Run `make` with variables:
   * `EMAIL`: your email address
   * `KEYS_FOLDER`: absolute path to the folder containing your validator key files.  

```
git clone https://github.com/thaussma/casper-sign
cd casper-sign
make EMAIL=testmail@address KEYS_FOLDER=${PWD}/validator_keys
```

This will then build the image and then run `sign.py` and `verify.py`:
```
Signing testmail@address
Public Key:
 01e08fb25d24b30903840958509489430483934585896845684275894259348567
Message:
 testmail@address
Signature:
  0b5749ea0957397eaec1d1e84bd6b4cf0770333f8850e3064b5fee3e37351f89aa904b185d1f89aa900e63326513c82f60464456fa42a08627c7bde4b049347
Verified!
```