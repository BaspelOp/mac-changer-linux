echo "Changing MAC Address..."
ifconfig wlan0 down

hex=()
for x in {0..9} {a..f}; do
        for y in {0..9} {a..f}; do
                hex+=("$x$y")
        done
done

first=${hex[ $RANDOM % ${#hex[@]}]}
second=${hex[ $RANDOM % ${#hex[@]}]}
third=${hex[ $RANDOM % ${#hex[@]}]}
fourth=${hex[ $RANDOM % ${#hex[@]}]}
fifth=${hex[ $RANDOM % ${#hex[@]}]}

ifconfig wlan0 hw ether 00:$first:$second:$third:$fourth:$fifth
ifconfig wlan0 up
echo "Your new MAC Address is: 00:$first:$second:$third:$fourth:$fifth"
