# GlotPress for VVV

This is a simple GlotPress trunk auto-sitesetup designed to be used with [Varying Vagrants Vagrant](https://github.com/Varying-Vagrant-Vagrants/VVV). It is based on [VVV Auto Bootstrap Demo](https://github.com/simonwheatley/vvv-demo-3) by @simonwheatley

To get started:

1. If you don't already have it, clone the [Vagrant repo](https://github.com/Varying-Vagrant-Vagrants/VVV) , perhaps into your `~/Vagrants/` directory (you may need to create it if it doesn't already exist)
2. Install the Vagrant hosts updater: `vagrant plugin install vagrant-hostsupdater`
3. Clone this branch of this repo into the `www` directory of your Vagrant as `www/vvv-glotpress`
4. If your Vagrant is running, from the Vagrant directory run `vagrant halt`
5. Followed by `vagrant up --provision`.  Perhaps a cup of tea now? The provisioning may take a while.
6. Open [http://glotpress.dev/](http://glotpress.dev/) in your browser. You will be redirected to the admin user creation.
7. Create a user and your GlotPress install is ready
