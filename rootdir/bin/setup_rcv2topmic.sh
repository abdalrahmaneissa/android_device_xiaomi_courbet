set -x
# tinyplay file.wav [-D card] [-d device] [-p period_size] [-n n_periods]
# sample usage: playback.sh 2000.wav  1

sleep 1

echo "enabling top mic"
	echo "enabling top mic"
	tinymix "MultiMedia1 Mixer TX_CDC_DMA_TX_3" 1
	tinymix "TX DEC0 MUX" "SWR_MIC"
	tinymix "TX SMIC MUX0" "ADC2"
	tinymix "TX_CDC_DMA_TX_3 Channels" "One"
	tinymix "TX_AIF1_CAP Mixer DEC0" "1"
	tinymix "ADC2_MIXER Switch" "1"
	tinymix "ADC2 MUX" "INP3"
	tinymix "ADC2 Volume" "12"

# start recording
nohup tinycap /sdcard/top_mic.wav -D 0 -d 0 -r 44100 -b 16 -c 2 -T 4 > /sdcard/nohup.out &

sleep 2
echo "enabling receiver"
    echo "enabling receiver"
    tinymix "PRI_MI2S_RX Audio Mixer MultiMedia1" 1
    tinymix "PRIM_MI2S_RX Channels" "Two"
    tinymix "TFA Profile" "handset"

    tinyplay /vendor/etc/rcv_pink.wav

sleep 1

echo "disabling top mic"
	echo "disabling top mic"
	tinymix "TX SMIC MUX0" "ZERO"
	tinymix "TX_CDC_DMA_TX_3 Channels" "One"
	tinymix "TX_AIF1_CAP Mixer DEC0" "0"
	tinymix "ADC2_MIXER Switch" "1"
	tinymix "MultiMedia1 Mixer TX_CDC_DMA_TX_3" 0
	tinymix "ADC2 Volume" "6"

echo "disabling receiver"
    echo "disabling receiver"
    tinymix "TFA Profile" "powerdown"
    tinymix "PRIM_MI2S_RX Channels" "Two"
    tinymix "PRI_MI2S_RX Audio Mixer MultiMedia1" 0

