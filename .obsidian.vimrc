
set clipboard=unnamed

nmap <F9> :nohl

nmap j gj
nmap k gk

nmap H ^
nmap L $

nmap <C-d> <C-d>zz
nmap <C-u> <C-u>zz
nmap n nzz
nmap N Nzz

vnoremap <leader>p "_dP

exmap back obcommand app:go-back
nmap <C-o> :back
exmap forward obcommand app:go-forward
nmap <C-i> :forward
