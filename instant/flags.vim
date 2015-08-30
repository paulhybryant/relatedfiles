""
" @section Introduction, intro
" This plugin identifies files related to the current one, like test or header
" files, and implements a selector window to jump between them.

let [s:plugin, s:enter] = maktaba#plugin#Enter(expand('<sfile>:p'))
if !s:enter
  finish
endif


""
" Location of the quickfix window; a window-positioning command like
" |:leftabove|, |:aboveleft|, |:rightbelow|, |:belowright|, |:topleft|,
" or |:botright|.
" If set to the empty string (for no explicit position), this will respect the
" current 'splitbelow' and 'splitright' settings.
call s:plugin.Flag('window_position', 'botright')

""
" Command to open files on shortcuts (BUILD, _test, etc).
call s:plugin.Flag('open_command', 'edit')
