
  #------------------------------------------------------------------
  # Tests lui lw sw
  #------------------------------------------------------------------

  org   0x0000
  lui   $10, 0xFEED
  #nop   #had to add this
  ori   $1, $zero, 0x0F00
  ori   $2, $zero, 0x0800
  ori   $10, $10, 0xBEEF
  nop
  lw    $3,0($1)
  lw    $4,4($1)
  lw    $5,8($1)
  nop
  nop
  sw    $3,0($2)
  sw    $4,4($2)
  sw    $5,8($2)
  sw    $10,12($2)
  halt      # that's all

  org   0x0F00
  cfw   0x7337
  cfw   0x2701
  cfw   0x1337
