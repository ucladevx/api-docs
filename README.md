# UCLA DevX API

## Set Up

```shell
bundle install
bundle exec middleman server
```

This will allow you to see the docs at: http://localhost:4567

Now that Slate is all set up on your machine, you'll probably want to learn more about [editing Slate markdown](https://github.com/lord/slate/wiki/Markdown-Syntax)

## Publishing Docs

After making your changes, execute this command 
```shell
bundle exec middleman build --clean
```
Then, add the build folder to the commit
```shell
git add build/*
```
Finally, push to prod
```shell
git push prod
```
Note: The final command requires extra permissions, so if you would like to push to production, please contact a DevX board member


<a href='https://github.com/lord/slate'>Documentation Powered by Slate</a>