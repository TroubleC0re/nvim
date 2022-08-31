local function map(mode, shortcut, command)
  vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
end

local function imap(shortcut, command)
  map('i', shortcut, command)
end

local function nmap(shortcut, command)
  map('n', shortcut, command)
end

vim.g.mapleader = " "

-- Packer
map('', '<c-u>', ':PackerSync<cr>')
map('', '<c-i>', ':PackerInstall<cr>')
map('', '<c-c>', ':PackerCompile<cr>')

-- Nvim Tree
nmap('<c-b>', ':NvimTreeToggle<cr>')
nmap('<leader>ef', ':NvimTreeFindFile<cr>')

nmap('<c-f>', ':Format<cr>')

-- Commentary
map('', '<leader>/', ':Commentary<cr>')


vim.keymap.set("n", "<c-q>", function()
  local cmd = vim.cmd
  cmd([[
  try
  q
  catch 
  echo "Error " . v:exception
  endtry
  ]])

  if cmd then
    if vim.fn.input "Quieres guardar y salir? (s = si)" == "s" then
      cmd([[
      write
      q
      ]])
    else
      cmd([[
      q!
      ]])
    end
  end
end, { desc = "Pregunta si quieres guardar antes de salir si el buffer no está guardado" })

-- Nvim
nmap('ss', ':split<Return><C-w>w')
nmap('sv', ':vsplit=<Return><C-w>w')
map('', '<F5>', ':set nowrap!<cr>')
imap(',,', '<Esc>')
map('', '<c-s>', ':w<cr>')
map('', '<c-r>', ':source %<cr>')
nmap('dw', 'vb"_d')
nmap('U', '<cmd>redo<cr>')
-- Tabs
nmap('<s-tab>', ':tabnext<return>')
nmap('<tab>', ':tabprev<return>')
vim.cmd([[
vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>
vnoremap <silent> # :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy?<C-R><C-R>=substitute(
  \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>
" }}}
]])