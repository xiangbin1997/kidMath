#!/bin/bash
MIN_NUM=5

MAX_LINE=20
MAX_COL=5

ADD_SPACES=2

function genNum
{
  local myMaxNum=$1

  while :
  do
    randNum=$((RANDOM % myMaxNum + 1))
    if [ $randNum -lt $MIN_NUM ];then
      continue
    fi

    echo $randNum
    break
  done
}

function genOpt
{
  UPPER_LIMIT=2
  randNum=$((RANDOM % UPPER_LIMIT))

  if [ $randNum -eq 1 ]; then
    echo "+"
  else
    echo "-"
  fi
}

function genPlus
{
  local myMaxNum=$1

  while :
  do
    a=$(genNum $myMaxNum)
    b=$(genNum $myMaxNum)
    c=0
    let "c=a+b"

    if [ $c -lt $myMaxNum ]; then
      echo -n "$a + $b = "
      break
    fi
  done
}

function genMinus
{
  local myMaxNum=$1

  while :
  do
    a=$(genNum $myMaxNum)
    b=$(genNum $myMaxNum)

    if [ $a -lt $b ]; then
      echo -n "$b - $a = "
      break
    fi
  done
}


function addSpaces
{
  local spaces=1

  while :
  do
    if [ $spaces -gt $ADD_SPACES ];then
      break
    fi

    echo -n " "
    let "spaces=spaces+1"
  done
}

function genMax
{
  local randNum=$((RANDOM % 8 + 3))
  local output=$((randNum *10))
  echo -n "$output"
}

function genOne
{
  opt=$(genOpt)
  local myMaxNum=$(genMax)
  #dbg
  #echo "($opt $myMaxNum)"

  if [ $opt = "+" ]; then
    genPlus $myMaxNum
  else
    genMinus $myMaxNum
  fi

  echo -e -n "\t"
  #addSpaces
}


function genAll
{
  line=1
  col=1

  while :
  do
    if [ $col -gt $MAX_COL ];then
      echo
      col=1
      let "line=line+1"
    fi

    if [ $line -gt $MAX_LINE ];then
      break
    fi


    genOne
    let "col=col+1"
  done
}

genAll



