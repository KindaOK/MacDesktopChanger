# MacOS Desktop Background Changer

Pull images from top daily posts in subreddits given in `~/wallpaper/subreddits.txt`. Will not change the background if the top post is not an image.

## Getting Started

### Prerequisites
* MacOS (can be ported to other unix-like operating system though)
* Zsh
* curl

### Basic Installation
Run the below command in terminal.

`$ curl -fsSL https://github.com/KindaOK/MacDesktopChanger/raw/master/install.sh | bash`

Your computer may ask you to provide permission for terminal to automate/administrate your computer.
For this program to run, you must allow it.
Future versions may remove this need.
Everything should now be installed.

### Configuration
To add additional subreddits to the rotation, simply add the name of each on a separate line in `subreddits.txt`.
The sample subreddits are r/surrealmemes and r/programmingmemes.


## TODO
- [ ] Modularize background changing effect
- [ ] Switch to improved cron installation technique (currently clobbers everything else in cron)
- [ ] Intelligently pick between bash and zsh
