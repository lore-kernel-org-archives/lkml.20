Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792664690;
	b=FAwHC86rMMYQGlgGPt/sBLSFfHWzWE7uKR2PpKQac2dGQ5Pq6uw3fFqkY8o5FZAsaaHB
	 v3Z8AnJ4ziSf5LlWtGw9ggYP6YGFpmKQSBC9+ll0jXn6N1LsV4aoJeYcD8FTGL+VdKYQi
	 ADbF7SCTGluRpuaehwAoi5hWJy2nPWdyiezS3buun6+wLLagyl/pktMfQZACb16EkqVlJ
	 QHM3wV7NBBpSWVpvHkqF9semr0q4FyazQb4iekBtPDEm0eOaXK6AAQGf8+ilrm78UkYwa
	 HyFyfWRL82wX9C4LmgNl2uu1sYkeJXMK8Tr2jMZq0ir4LI/CigEKVbV4qHl5A8so/cg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792664690;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Content-Language:To:Cc:From:
	 Subject:Content-Type:Content-Transfer-Encoding;
	bh=pOK+MsJLB+UOA9uQBG84++ekBGJh1mHJyeB6ZcGJiNE=;
	b=oHr92sWrwGjPPo0QwA7hzcvP5FcStz7gghTH+gYXFPc+sYy4sHFGoB5LayZxShsv0iyh
	 +yhUCSMTvc6s+nWP7xQtc0bOsl67hhZb1WsdjCn55FiIkP0iykB4rw+wV9kpJpfWImsJF
	 48Hk03DZ6nT6BeQ6JN5Z/H1LDFQLLD7pGvJszPJqAVaelwpgqZ/vekc8QqpVt+zwTDm5I
	 3Lu+wRaid7oRcTZgRB0jpeP4gGBezc+uTKGRBLLcXwpQPZ87o/tb2QZxDgVArRtbYL4IU
	 SHtwHdOtUtpOD7kXHEQq+5mIiRdL3emBmx4TTFAEIRA+sJWHWUrNvck7WTDwc2iD3QQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=DO8xdrbR;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3BAE606A31B
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 10:24:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3BAE606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=DO8xdrbR
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48c4d870d54so1214824f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 03:24:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792664688; x=1793269488; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=pOK+MsJLB+UOA9uQBG84++ekBGJh1mHJyeB6ZcGJiNE=;
        b=DO8xdrbRO6Eea6fWYSKuYysp+WZj1kNJMGDybTOfWi8vFLXMfg5RgTu6wjntKseX36
         Wc43/g36K8NQ6Edu4M04cd2glQnjNEsg5CPEux5Aq5Z4RJbwkyox0fwH36qpWo7C5/WI
         wLU/VoLeJYNq5tOQfoDKLAXsNmGs/P55VT/uwqA0zvv75oc7ZGWav5n76omrCClJ5Ac5
         uI9MWhoklIhjPwdiR3U0ZkKT8RZuUaCHeIPVnC3KewZuVffnX5j2TYusPcw4fso4i5Gp
         1MoLDePLUqXVOwNC7Ymrrz3v4jtd2MDqgYBq/RZOEV5Ah8rjWB6Ya48AjLuDzEoZe2vg
         adqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792664688; x=1793269488;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pOK+MsJLB+UOA9uQBG84++ekBGJh1mHJyeB6ZcGJiNE=;
        b=rR3D8T9KEZwfkzKme2HrufzpWkPxPZjPCMOaiiUfqkD72AH9p7q0/Kw3pkZh+YTTZh
         B2xwVI2Y6ZVVZkv/cz45ZKDRfbHWM0IYjImBPfOIaEQqGHb8NB53mYOJK1P7eJDvOGxM
         RZ5Lkz8V1L0nu1uYS6EjmT3tTzDvG6+QhjzFL5CbeY/cIyfE5KBX1EFme38gkGkRMjjJ
         DtnYrl3+vpOyVgVu1VJx0YFrUAvYBSIR3dK7XcU7J5hFbEBxVnZ+kWEdZ5ZiVFU5xxuB
         CyKUNhxgY1psBt15KQmtAJMZRZ2O/RX/wBBNydGS82F57eZJ6jPoekLgcWOs6wqpLd7g
         dFWw==
X-Forwarded-Encrypted: i=1; AKwUvBwAOlDobOlg91zey6Y7BnCcJ6j6FHz70MyHrWpamKY0japW9jcyZwWZZUdCIxE3WjA5Zf/H1FXZv/PkAZs=@vger.kernel.org
X-Gm-Message-State: AFq9FYL7kVEJXRm/I8L3YFB6zucQfvU3l/o0VVrCT0Oa6K38SulwJszB
	qWmVGzrfVwA8x2XsYpqyCMiwjarVi047mQMEx/Y2aNY4p9WG/qGD5g53
X-Gm-Gg: AYBFou12mv7GAAOHC17P2BTLr4G8MiHHobR5Sj61fPWB2ZLOtrhnUbYieu2U5sFX5Uz
	KOBSPp7OADrBw+VvOxeIVeyKeCnhFXxP3S1EBr/ce+undqG5XUU5CM5wu6ux82lDCADT/0vwIhj
	zMam5iMJ5miAv57shOpgM+cImoDAGxKwT0NSMSBlqTDwGV3+HR5eQhFHefQ6dcECGzrq3taay0n
	Bm+ml034vg5Ih5zjgkBrPHGSTouA8Ok6K+WBeMiAgW4/nXuruL6rba48wBkmB6jD7zA7nFTu5on
	vzLH8gAvZMGu5GdDf5wZKi2JIH6sQSGRY0ti9XCBTm2p6Z3NACrFwuSI4LMiXO7yFVzkc94NAxr
	rF9THE7SwSvbDtyeciPShiAKu5uTfLs0Q3e16VoW3njpb3U1YjkEfWLDBxMjFyD1lfb1wgVsE5w
	ei0JMiWbTxNVPmAXNC2dn66dTdDTSW8hkWYGFW6cCdF7zuIkxB5/O1Oii8vIVpfQMUScc1cf/uN
	gZ1iiNpRILsMQMfT2AZXAGEp+c2y7tU+KdCJCH933o5xQsnIAV6eEbysO4=
X-Received: by 2002:a05:6000:1801:b0:486:f9ea:796f with SMTP id ffacd0b85a97d-48e264cd778mr6455586f8f.41.1792664687952;
        Thu, 22 Oct 2026 03:24:47 -0700 (PDT)
Received: from [192.168.1.80] ([87.116.133.17])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e25835b1dsm12505216f8f.40.2026.10.22.03.24.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 03:24:47 -0700 (PDT)
Message-ID: <6bf6c3eb-a142-4f11-92a7-bea7bc715010@gmail.com>
Date: Thu, 22 Oct 2026 12:24:46 +0200
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
From: role <bezrabotni@gmail.com>
Subject: [BUG] TPPS/2 Elan TrackPoint middle/right buttons not reported on
 ThinkPad T14s Gen 2
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Subject: [BUG] TPPS/2 Elan TrackPoint middle/right buttons not reported 
on ThinkPad T14s Gen 2

Summary:
On a Lenovo ThinkPad T14s Gen 2, the middle and right buttons of the 
TPPS/2 Elan TrackPoint do not generate any input events at the kernel 
level, while the left button and pointing stick movement work correctly. 
The same hardware works without issues under Windows 11, indicating this 
is a Linux driver initialization or reporting issue, not a hardware fault.

Environment:

     Laptop: Lenovo ThinkPad T14s Gen 2

     Distribution: Fedora Atomic (Sway)

     Kernel: 7.2.9-201.fc44.x86_64

     libinput: libinput-1.31.3-1.fc44.x86_64

     Input device name: TPPS/2 Elan TrackPoint

     Device node: /dev/input/event4

     Bus/Vendor/Product: 0x11 / 0x2 / 0xa

Problem Description:
The kernel input device declares support for BTN_LEFT, BTN_RIGHT, and 
BTN_MIDDLE, but when physically pressing the middle or right button, 
evtest and libinput debug-events only show events for BTN_LEFT and 
REL_X/REL_Y. The middle and right buttons produce no EV_KEY events 
whatsoever.

Evidence:

     - evtest shows the device's declared capabilities include the 
middle and right buttons:

         Event type 1 (EV_KEY)
           Event code 272 (BTN_LEFT)
           Event code 273 (BTN_RIGHT)
           Event code 274 (BTN_MIDDLE)

     - evtest raw output (pressing left button and moving the stick 
produces events; pressing middle/right produces nothing):

         Event: time ..., type 1 (EV_KEY), code 272 (BTN_LEFT), value 1
         Event: time ..., type 2 (EV_REL), code 1 (REL_Y), value 1
         // No BTN_MIDDLE or BTN_RIGHT events observed

     - libinput debug-events also shows no middle/right button events, 
only left button and movement events for event4.

     - libinput quirks list --verbose /dev/input/event4 did not reveal 
any active quirk rules disabling the middle or right buttons.

Attempted Workarounds (all ineffective):
     - Configuring scroll_method on_button_down / scroll_button 
BTN_MIDDLE for the TrackPoint in Sway.
     - Using libinput local-overrides.quirks to try to explicitly enable 
the buttons.
     - Removing the psmouse.synaptics_intertouch=1 kernel parameter 
(currently removed).

Request:
     Please advise whether the psmouse/trackpoint driver has a known 
issue with the Elan TrackPoint on this specific ThinkPad model, or if 
additional debugging information is needed from my side. Since the 
hardware is fully functional under Windows 11, I suspect the driver may 
be failing to properly initialize the TrackPoint's extended button 
functionality during PS/2 protocol negotiation.



Additional information:

uname -r:
     7.2.9-201.fc44.x86_64

cat /proc/version:
     Linux version 7.2.9-201.fc44.x86_64 
(mockbuild@3cc06c60463046bc9e2813f8ad822a95) (gcc (GCC) 16.2.1 20260819 
(Red Hat 16.2.1-2), GNU ld version 2.46.1-1.fc44) #1 SMP PREEMPT_DYNAMIC 
Fri Oct  9 15:04:46 UTC 2026

sudo evtest /dev/input/event4:
     Input driver version is 1.0.1
     Input device ID: bus 0x11 vendor 0x2 product 0xa version 0x63
     Input device name: "TPPS/2 Elan TrackPoint"
     Supported events:
       Event type 0 (EV_SYN)
       Event type 1 (EV_KEY)
         Event code 272 (BTN_LEFT)
         Event code 273 (BTN_RIGHT)
         Event code 274 (BTN_MIDDLE)
       Event type 2 (EV_REL)
         Event code 0 (REL_X)
         Event code 1 (REL_Y)
     Properties:
       Property type 0 (INPUT_PROP_POINTER)
       Property type 5 (INPUT_PROP_POINTING_STICK)
     Testing ... (interrupt to exit)
     Event: time 1792663533.898538, type 1 (EV_KEY), code 272 
(BTN_LEFT), value 1
     Event: time 1792663533.898538, -------------- SYN_REPORT ------------
     Event: time 1792663534.025420, type 1 (EV_KEY), code 272 
(BTN_LEFT), value 0
     Event: time 1792663534.025420, -------------- SYN_REPORT ------------
     Event: time 1792663543.308504, type 2 (EV_REL), code 1 (REL_Y), 
value -1
     Event: time 1792663543.308504, -------------- SYN_REPORT ------------
     Event: time 1792663549.938592, type 2 (EV_REL), code 0 (REL_X), value 1
     Event: time 1792663549.938592, type 2 (EV_REL), code 1 (REL_Y), value 1

sudo libinput debug-events:
     -event5   DEVICE_ADDED                 ELAN0676:00 04F3:3195 Mouse  
      seat0 default group1  cap:p left scroll-nat scroll-button
     -event6   DEVICE_ADDED                 ELAN0676:00 04F3:3195 
Touchpad    seat0 default group1  cap:pg  size 114x58mm tap (dl off) 
left scroll-nat scroll-2fg-edge click-buttonareas-clickfinger dwt-on dwtp-on
     -event7   DEVICE_ADDED                 RAYD0001:00 2386:4B48       
      seat0 default group2  cap:t  size 320x180mm ntouches 10 calib
     -event9   DEVICE_ADDED                 Video Bus            seat0 
default group3  cap:k
     -event10  DEVICE_ADDED                 Intel HID events           
seat0 default group4  cap:k
     -event2   DEVICE_ADDED                 Power Button           seat0 
default group5  cap:k
     -event1   DEVICE_ADDED                 Lid Switch           seat0 
default group6  cap:S
     -event0   DEVICE_ADDED                 Sleep Button           seat0 
default group7  cap:k
     -event3   DEVICE_ADDED                 AT Translated Set 2 
keyboard      seat0 default group8  cap:k
     -event4   DEVICE_ADDED                 TPPS/2 Elan TrackPoint       
     seat0 default group9  cap:p left scroll-nat scroll-button
     -event8   DEVICE_ADDED                 ThinkPad Extra Buttons       
     seat0 default group10 cap:k
     -event4   POINTER_MOTION               +0.000s   -0.31/ -0.31 ( 
-1.00/ -1.00)
      event4   POINTER_MOTION            2  +0.009s   -9.41/ -9.41 ( 
-3.00/ -3.00)
      event4   POINTER_MOTION            3  +0.019s   -5.55/ -8.32 ( 
-2.00/ -3.00)
      event4   POINTER_MOTION            4  +0.029s   -4.51/ -4.51 ( 
-2.00/ -2.00)
      event4   POINTER_MOTION            5  +0.049s   -0.80/ -0.80 ( 
-1.00/ -1.00)
      event4   POINTER_MOTION            6  +0.058s    0.00/ -1.00 ( 
+0.00/ -1.00)
      event4   POINTER_MOTION            7  +0.068s    0.00/  1.00 ( 
+0.00/ +1.00)
      event4   POINTER_BUTTON               +1.889s  BTN_LEFT (272) 
pressed, seat count: 1
      event4   POINTER_BUTTON               +2.026s  BTN_LEFT (272) 
released, seat count: 0

sudo dmesg | grep -i -E "psmouse|trackpoint|elan|input":
     [    0.712414] input: Sleep Button as 
/devices/platform/PNP0C0E:00/input/input0
     [    0.712517] input: Lid Switch as 
/devices/platform/PNP0C0D:00/input/input1
     [    0.712535] input: Power Button as 
/devices/platform/LNXPWRBN:00/input/input2
     [    1.007578] input: AT Translated Set 2 keyboard as 
/devices/platform/i8042/serio0/input/input3
     [    1.284865] psmouse serio1: trackpoint: Elan TrackPoint 
firmware: 0xa1, buttons: 3/3
     [    1.309768] input: TPPS/2 Elan TrackPoint as 
/devices/platform/i8042/serio1/input/input5
     [    2.160064] input: ELAN0676:00 04F3:3195 Mouse as 
/devices/pci0000:00/0000:00:15.0/i2c_designware.0/i2c-0/i2c-ELAN0676:00/0018:04F3:3195.0001/input/input6
     [    2.160228] input: ELAN0676:00 04F3:3195 Touchpad as 
/devices/pci0000:00/0000:00:15.0/i2c_designware.0/i2c-0/i2c-ELAN0676:00/0018:04F3:3195.0001/input/input8
     [    2.160285] hid-generic 0018:04F3:3195.0001: input,hidraw0: I2C 
HID v1.00 Mouse [ELAN0676:00 04F3:3195] on i2c-ELAN0676:00
     [    2.232543] input: RAYD0001:00 2386:4B48 Touchscreen as 
/devices/pci0000:00/0000:00:15.1/i2c_designware.1/i2c-1/i2c-RAYD0001:00/0018:2386:4B48.0002/input/input9
     [    2.232641] hid-generic 0018:2386:4B48.0002: input,hidraw1: I2C 
HID v1.00 Device [RAYD0001:00 2386:4B48] on i2c-RAYD0001:00
     [    2.356491] input: ELAN0676:00 04F3:3195 Mouse as 
/devices/pci0000:00/0000:00:15.0/i2c_designware.0/i2c-0/i2c-ELAN0676:00/0018:04F3:3195.0001/input/input11
     [    2.356652] input: ELAN0676:00 04F3:3195 Touchpad as 
/devices/pci0000:00/0000:00:15.0/i2c_designware.0/i2c-0/i2c-ELAN0676:00/0018:04F3:3195.0001/input/input13
     [    2.356803] hid-multitouch 0018:04F3:3195.0001: input,hidraw0: 
I2C HID v1.00 Mouse [ELAN0676:00 04F3:3195] on i2c-ELAN0676:00
     [    2.388505] input: RAYD0001:00 2386:4B48 as 
/devices/pci0000:00/0000:00:15.1/i2c_designware.1/i2c-1/i2c-RAYD0001:00/0018:2386:4B48.0002/input/input14
     [    2.388562] hid-multitouch 0018:2386:4B48.0002: input,hidraw1: 
I2C HID v1.00 Device [RAYD0001:00 2386:4B48] on i2c-RAYD0001:00
     [    2.520171] input: ThinkPad Extra Buttons as 
/devices/platform/thinkpad_acpi/input/input16
     [    3.057098] input: Video Bus as 
/devices/pci0000:00/acpi.video_bus.0/input/input17
     [   87.858014] input: Intel HID events as 
/devices/platform/INTC1051:00/input/input18
     [   88.311777] input: PC Speaker as 
/devices/platform/pcspkr/input/input19
     [   91.694203] snd_hda_codec_alc269 ehdaudio0D0:    inputs:
     [   91.767147] input: sof-hda-dsp Mic as 
/devices/pci0000:00/0000:00:1f.3/skl_hda_dsp_generic/sound/card0/input20
     [   91.767353] input: sof-hda-dsp Headphone as 
/devices/pci0000:00/0000:00:1f.3/skl_hda_dsp_generic/sound/card0/input21
     [   91.767490] input: sof-hda-dsp HDMI/DP,pcm=3 as 
/devices/pci0000:00/0000:00:1f.3/skl_hda_dsp_generic/sound/card0/input22
     [   91.767646] input: sof-hda-dsp HDMI/DP,pcm=4 as 
/devices/pci0000:00/0000:00:1f.3/skl_hda_dsp_generic/sound/card0/input23
     [   91.767802] input: sof-hda-dsp HDMI/DP,pcm=5 as 
/devices/pci0000:00/0000:00:1f.3/skl_hda_dsp_generic/sound/card0/input24

cat /sys/class/dmi/id/modalias:
dmi:bvnLENOVO:bvrN35ET66W(1.66):bd05/18/2026:br1.66:efr1.46:svnLENOVO:pn20WNS1B010:pvrThinkPadT14sGen2i:rvnLENOVO:rn20WNS1B010:rvrSDK0J40697WIN:cvnLENOVO:ct10:cvrNone:skuLENOVO_MT_20WN_BU_Think_FM_ThinkPadT14sGen2i:pfaThinkPadT14sGen2i:


Best Regards,

Robert

