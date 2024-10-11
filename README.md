# Matricula Online Newsfeed Mailer

This project is a simple Python script that sends an email with the latest newsfeed from the Matricula Online website, if certain keywords are found in the newsfeed. The script is run in a Docker container and can be scheduled to run periodically using systemd.

## Prerequisites

You must have installed:
- Docker
- Git

## Install

0. Clone the repository
```bash
$ mkdir ~/.matricula && cd ~/.matricula # stay here for the next steps
$ mkdir data # this directory will be mounted to the docker container
$ git clone https://github.com/lsg551/matricula-online-newsfeed-mailer.git
```

1. Build the Dockerfile
```bash
$ cd matricula-online-newsfeed-mailer
$ docker build -t matricula-online-newsfeed-mailer .
$ cd ..
```

2. Copy and adjust config file 
```bash
$ cp ./matricula-online-newsfeed-mailer/matricula-online-newsfeed-mailer.config.env ./matricula-online-newsfeed-mailer.config.env
$ vim ./matricula-online-newsfeed-mailer.config.env # edit the env variables according to your needs
```

3. Replace `<user>` in `matricula-online-newsfeed-mailer.service` with your own user

4. Set up systemd service and timer unit
```bash
$ cp ./matricula-online-newsfeed-mailer/matricula-online-newsfeed-mailer.service /etc/systemd/system/
$ cp ./matricula-online-newsfeed-mailer/matricula-online-newsfeed-mailer.timer /etc/systemd/system/
$ sudo systemctl daemon-reload
$ systemctl enable matricula-online-newsfeed-mailer.timer
$ systemctl start matricula-online-newsfeed-mailer.timer
```

Check the status and logs to see when the service was last run
```bash
$ systemctl status matricula-online-newsfeed-mailer.timer
$ systemctl status matricula-online-newsfeed-mailer.service
$ sudo journalctl -u my-docker.service
```

You can also run
```bash
$ matricula-online-newsfeed-mailer.py --help
```
to see how to use the script manually.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.