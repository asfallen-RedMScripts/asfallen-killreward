# Kill Reward System.

## Description
This project is a RedM script that provides a kill reward system with healing and fire effects for players in the game. When a player kills another, the killer is healed with a visual effect and receives a notification about the reward.

## Features
- Heals the killer after a kill.
- Displays a message notifying the killer about the health reward.

## Installation

1. Clone or download this repository.
2. Place the files (`client.lua`, `server.lua`, and `fxmanifest.lua`) in a new folder within your RedM resources directory.
3. Add the resource to your `server.cfg`:
   ```
   ensure [resource-folder-name]
   ```

## Configuration

No additional configuration is needed. The script integrates with the VORPcore system and automatically handles kill rewards.

## Usage

- Ensure that your server has VORPcore installed and running.
- Start your server, and the kill reward system will activate.

## File Structure

### fxmanifest.lua
Defines the metadata for the script, including dependencies and resource information:
```lua
fx_version 'cerulean'
game 'rdr3'
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

author 'asfallen'
description 'Kill reward system.'
version '1.0.0'

server_scripts {
    'server.lua'
}

client_scripts {
    'client.lua'
}
```

### client.lua
Handles client-side functionality such as applying healing effects and triggering particle animations.

### server.lua
Handles server-side events, such as detecting player deaths and triggering rewards for killers.

## Events

### Client-Side Events
- `triggerParticleAndHeal`: Applies healing and particle effects to the player.

### Server-Side Events
- `vorp_core:Server:OnPlayerDeath`: Detects player death and identifies the killer.
- `PlayerKilled:HealKiller`: Provides the killer with a reward and notification.

## Dependencies
- [VORPcore](https://github.com/VORPCore)

## Credits
- **Author:** asfallen

## License
This project is licensed under the MIT License. See the LICENSE file for details.

---
For further support or contributions, feel free to create an issue or pull request on this repository.
