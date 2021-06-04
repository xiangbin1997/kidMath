#!/bin/bash
MIN_NUM=10
MAX_NUM=100
ADD_SPACES=2

function genNum
{
  while :
  do
    randNum=$((RANDOM % MAX_NUM + 1))
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
  while :
  do
    a=$(genNum)
    b=$(genNum)
    c=0
    let "c=a+b"

    if [ $c -lt $MAX_NUM ]; then
      echo -n "$a + $b = "
      break
    fi
  done
}

function genMinus
{
  while :
  do
    a=$(genNum)
    b=$(genNum)

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

function genOne
{
  opt=$(genOpt)

  if [ $opt = "+" ]; then
    genPlus
  else
    genMinus
  fi

  echo -e -n "\t"
  #addSpaces
}


function genAll
{
  MAX_LINE=20
  MAX_COL=5

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



