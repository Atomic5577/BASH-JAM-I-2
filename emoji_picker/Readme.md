# Emoji Picker

A simple emoji picker that copies the emoji you choose directly to your clipboard.

## Features

* **Clipboard copy:** Select an emoji and it will automatically be copied to your clipboard.
* **Add custom emojis:** You can add your own emojis to the menu using the `add` argument.
* **Automatic dependency check:** The script checks if the required tools are installed. If not, it will run the setup script to install them.
* **History system:** The script saves emojis you use so you can access them later using the `history` argument.
* **Clear history:** You can clear the emoji history whenever you want using the `clear-history` argument.

## Usage

Run the emoji picker:

```
./emoji_picker.sh
```

Add a new emoji:

```
./emoji_picker.sh add
```

Open emoji history:

```
./emoji_picker.sh history
```

Clear history:

```
./emoji_picker.sh clear-history
```

