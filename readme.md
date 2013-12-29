# GlotPress for VVV

This is a simple GlotPress trunk auto-sitesetup designed to be used with [Varying Vagrants Vagrant](https://github.com/10up/varying-vagrant-vagrants/). It is based on [VVV Auto Bootstrap Demo](https://github.com/simonwheatley/vvv-demo-3) by @simonwheatley

To get started:

1. If you don't already have it, clone the [Vagrant repo](https://github.com/10up/varying-vagrant-vagrants/) , perhaps into your `~/Vagrants/` directory (you may need to create it if it doesn't already exist)
2. Install the Vagrant hosts updater: `vagrant plugin install vagrant-hostsupdater`
3. Clone this branch of this repo into the `www` directory of your Vagrant as `www/glotpress`
4. If your Vagrant is running, from the Vagrant directory run `vagrant halt`
5. Followed by `vagrant up --provision`.  Perhaps a cup of tea now? The provisioning may take a while.

Then you can visit [http://glotpress.dev/](http://glotpress.dev/). The default username/password is `admin`.
