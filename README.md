# Deepin Emacs

**Description**: Is a customized emacs for Deepin

Emacs is hackable OS for top hackers, most of emacs extensions are written in elisp.
Deepin Emacs merged many extensions from [AndyStewart](http://www.emacswiki.org/emacs/AndyStewart),
you can find all extensions under [site-lisp](https://gitcafe.com/Deepin/deepin-emacs/tree/master/site-lisp).

Deepin Emacs’s target is to build a development environment that users don’t need to config elisp code line by line.
Deepin Emacs provides below features:

- Code auto completion with most languages. (by autocomplete extensions)
- Code template system. (by yasnippet extension)
- Anything search system. (by helm extensions)
- Auto save when figure idle.
- Line number support. (by linum extension)
- Kill ring search. (by kill-ring-search extension)
- File manager. (by dired extension)
- Music player. (by emms extensions)
- Pdf viewer. (by doc-view extension)
- Irc client. (by rcirc and erc extension)
- Minibuffer tray and disable fringe. (by minibuffer-tray extension)
- Oddmuse wiki editor. (by yaoddmuse extension)
- Remember window position. (by winpoint extension)
- Web browser. (by w3m extension)
- Code speed bar. (by speedbar extension)
- Tab manager. (by tabbar extension)
- Terminal manager. (by multi-term extension)
- Powerful syntax edit. (by paredit extension)
- One key system. (by one-key extensions)
- Point translate system. (by sdcv extension)
- Org GTD manager. (by org extensions)
- News reader. (by newsticker extension)
- Code search and replace. (by moccur extension)
- RFC reader. (by irfc extension)
- Edit multiple regions in the same way simultaneously. (by iedit.el)
- Quick global jump. (by ace-jump extension)
- Apt search. (by apt-utils extension)
- Man manual reader. (by woman extension)
- IDE features. (by ecb extension)
- API document helper. (by eldoc extension)
- Tag search. (by etags extension)
- Fly make checker. (by flymake extension)
- Git manage. (by magit extension)
- Mailing reader. (by gnus extension)
- Code function expander. (by hideshow extension)
- Command completion. (by icicles extensions)
- Info reader. (by info extension)
- Vi-reader. (by less extension)
- Elisp package manager. (by auto-install and package extension)
- Regex real-time matcher. (by rebuilder extension)
- Smooth scroll. (by smooth-scrolling extension)
- Donkey download manager. (by mldonkey extension)
- English completion helper. (by predictive extension)
- Webkit browser. (by webkit extension)

## Dependencies

### Build dependencies

 - build-essential (>= 12.1)
 - git (>= 1:2.6.2-1)
 - autoconf (>= 2.69-9)
 - texinfo (>= 6.0.0.dfsg.1-3)

### Runtime dependencies

 - libxaw7-dev (>= 2:1.0.13-1)
 - libxpm-dev (>= 1:3.5.11-1)
 - libpng12-dev (>= 1.2.50-2)
 - libjpeg-dev (>= 1:1.4.1-2)
 - libtiff5-dev (>= 4.0.5-1)
 - libgif-dev (>= 4.1.6-11)
 - libncurses5-dev (>= 6.0+20151024-2)
 - libdbus-1-dev (>= 1.10.2-1)
 - libgtk-3-dev (>= 3.18.4-1)
 - w3m (>= 0.5.3-25)
 - w3m-img (>= 0.5.3-25)
 - pyflakes (>= 1.0.0-4）
 - locate (>= 4.4.2-10)

## Install rtags for C/C++
git clone --recursive https://github.com/Andersbakken/rtags.git
cd rtags
mkdir build
cd build
cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=1 ..
make
sudo make install

## Installation

### Debian 8.0 (jessie)

Install prerequisites
```
$ sudo apt-get install \
               build-essential \
               git \
               autoconf \
               texinfo \
               libxaw7-dev \
               libxpm-dev \
               libpng-dev \
               libjpeg-dev \
               libtiff5-dev \
               libgif-dev \
               libncurses5-dev \
               libdbus-1-dev \
               libgtk-3-dev \
               w3m \
               w3m-img \
               pyflakes \
               elpa-pdf-tools-server \
               locate
```
```
$ sudo apt-get install python-pip && sudo pip install jedi epc mocker
```

Download emacs git code
```
$ git clone --depth 1 git://git.savannah.gnu.org/emacs.git
```

Compile emacs git
```
$ sudo mkdir -p /usr/share/deepin-emacs/common
$ cd ./emacs-git && ./autogen.sh
$ ./configure --prefix=/usr/share/deepin-emacs/common --with-x-toolkit=gtk3 && make && sudo make install
```

Install Deepin emacs
```
$ sudo cp ./site-start.el /usr/share/deepin-emacs/common/share/emacs/site-lisp/
$ sudo cp -r ./site-lisp /usr/share/deepin-emacs
$ sudo ln -s /usr/share/deepin-emacs/common/bin/emacs /usr/bin/deepin-emacs
$ sudo cp ./deepin-emacs.svg /usr/share/icons/hicolor/scalable/apps/
$ sudo cp ./deepin-emacs.desktop /usr/share/applications/
```

## Usage

Run deepin emacs with the command below
```
$ deepin-emacs
```

## Getting help

Any usage issues can ask for help via

* [Gitter](https://gitter.im/orgs/linuxdeepin/rooms)
* [IRC channel](https://webchat.freenode.net/?channels=deepin)
* [Forum](https://bbs.deepin.org)
* [WiKi](http://wiki.deepin.org/)

## Getting involved

We encourage you to report issues and contribute changes

* [Contribution guide for users](http://wiki.deepin.org/index.php?title=Contribution_Guidelines_for_Users)
* [Contribution guide for developers](http://wiki.deepin.org/index.php?title=Contribution_Guidelines_for_Developers).

## License

Deepin Emacs is licensed under [GPLv3](LICENSE).
