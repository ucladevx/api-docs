# UCLA DevX API

## Set Up

```shell
make setup
```

## Development

```shell
make dev
```

This will allow you to see the docs at: http://localhost:4567

Now that Slate is all set up on your machine, you'll probably want to learn more about [editing Slate markdown](https://github.com/lord/slate/wiki/Markdown-Syntax)

## Publishing Docs

After making your changes, add the ec2 remote repo. Please contact a DevX exec for this:
```shell
git remote add prod <ec2-user@amazon-instance-public-dns>:/path/to/repo
```

Then, run this to create a build folder with our html file:
```shell
make build
```

Then, add the build folder as well as any other files you changed and commit them:
```shell
git add build/* <any other files>
git commit
```

Finally, push to prod:
```shell
git push prod
```

<a href='https://github.com/lord/slate'>Documentation Powered by Slate</a>