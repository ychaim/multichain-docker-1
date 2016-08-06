# USAGE

```shell
multichaind chain1 -daemon
```

then 

```shell
tail ~/.multichain/chain1/multichain.conf
```

grab user/password and use them to connect via JSON RPC, then

```shell
cat ~/.multichain/chain1/params.dat | grep rpc
```

to catch the RPC port that need to be used.

Now go to `/root/test/` and set the `test.js` file configuration according the information you discovered so far and then run with `nodejs test`
