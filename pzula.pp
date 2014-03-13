class people::pzula {
  include iterm2::dev
  include iterm2::colors::solarized_light
  include iterm2::colors::solarized_dark
  include mou

  $home     = "/Users/${::boxen_user}"

  package {
    [
      'tree',
      'tmux',
      'reattach-to-user-namespace',
      'terminal-notifier',
      'ack',
      'the-silver-searcher',
      'bash-completion'
    ]:
  }

}
