# My Boilerplate to create Drupal 8 themes
> Work in progress I am checkin how I would create Drupal themes easily

## Gulp
> Usage Gulp

### Build
`gulp build`

### Watch
`gulp`

## Start working
First need docker running and if needed machine env loader (with docker-machine) then:
`/usr/sbin/chown a+x start.sh && ./start.sh`

OR

`sudo chown a+x start.sh && ./start.sh`

## Clear the data for new start
`docker rm -v $(docker ps -aqf name=my-drupal-data)`
> If you still have my-drupal running
`docker kill my-drupal && docker rm my-drupal && ./start.sh`
