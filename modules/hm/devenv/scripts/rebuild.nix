{
  pkgs,
  username,
  host,
}:

pkgs.writeShellApplication {
  name = "rebuild";

  text = ''
    if [ $# -eq 0 ]; then
        # No arguments, rebuild default host
        sudo nixos-rebuild switch --flake "/home/${username}/conf.nix?submodules=1#${host}"
    elif [[ "$1" == -* ]]; then
        # First argument is a flag, assume default host and pass all args as flags
        sudo nixos-rebuild switch --flake "/home/${username}/conf.nix?submodules=1#${host}" "$@"
    else
        # First argument is likely a specific target host
        target_host="$1"
        shift # Remove the hostname from the arguments
        nixos-rebuild switch --flake "/home/${username}/conf.nix?submodules=1#$target_host" --target-host "root@$target_host" "$@"
    fi
  '';
}
