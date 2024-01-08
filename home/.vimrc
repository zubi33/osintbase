" Détection du type de fichier
filetype on

" coloration syntaxique
syntax on

" Coupe la ligne au mot
set linebreak

" Clignotement au lieu du son
set visualbell

" Surligner le mot recherché et tous les autres trouvés
set showmatch
set hlsearch

" indentation automatique
set autoindent
set smartindent

" affiche le numéro de ligne de code 
set number

" utilisation de la souris dans tous les modes 
set mouse=a

" thème vim
colorscheme gruvbox-material
set background=dark
let g:gruvbox_material_better_performance = 1

" Phyton
 set expandtab 
 set tabstop=4 
 set softtabstop=4 
 set shiftwidth=4 

 " Backup
set backup
 if filewritable(expand("~/.vim/backup")) == 2
    " comme le répertoire est accessible en écriture,
    " on va l'utiliser.
	set backupdir=$HOME/.vim/backup
else
	if has("unix") || has("win32unix")
        " C'est c'est un système compatible UNIX, on
        " va créer le répertoire et l'utiliser.
		call system("mkdir $HOME/.vim/backup -p")
		set backupdir=$HOME/.vim/backup
	endif
endif

" Mapping

" Tabs
map ,t :tabnew<cr>
map ,w :tabclose<cr>
imap <C-t> <Esc><C-t>
imap <C-w> <Esc><C-w>
map <tab> gt

" Mode normal
map ,mn :set guifont=<cr>

" Mode programmation
map ,mp :set guifont=Monospace\ 9<cr>

" Sélectionner tout
map <C-a> ggVG

" Copier (le gv c'est pour remettre le sélection)
map <C-c> "+ygv

" Couper
map <C-x> "+x

" Coller
map <C-p> "+gP

" Complétion en mode insertion (<C-n>)
set completeopt=longest,menuone
set omnifunc=syntaxcomplete#Complete

" Encoding
set encoding=utf-8

" Le texte sélectionné en mode visuel est collé dans le presse-papier CLIPBOARD
set clipboard=autoselect

" Sortir du mode insertion
inoremap jj <esc>

" Exécuter fichier python
autocmd FileType python map <buffer> <F9> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <F9> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>

" Commentaire Python et xml
autocmd FileType xml,html setlocal commentstring=<!--%s--> # here %s is the content wrapped by comment strings
autocmd FileType sh,python,text setlocal commentstring=#%s
