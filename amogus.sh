for i in $(seq 1 120)
  do
    catimg ~/Downloads/frames/frame_$((1+i%6)).png -w $COLUMNS
    sleep 0.02s
  done
echo sus
