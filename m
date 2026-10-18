Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E11B64052D5
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 20:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792357041; cv=none; b=pBvjuRRQI8xgceJlG9QYxVHwYizXTetXQO5/5nc4JQLEple4ZHNNATqkuET1hW64ycrkAj4QNINkAopD3na8qjspQ0v+u74MzdUc84UDmCDT/4pO3MpTxnFFmJpEC7eObwCQrdvcyU1uM5OeJLTasC0F79uQp2zCUG3ug4/Iaik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792357041; c=relaxed/simple;
	bh=x3Df/eIGv6o4/7feO2EA+lXeYAnRrb5+0INU/XhijVQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KQZYbjruRen0sgwBkDhPB4dFCKqo+aazT8xCtxjd041Hj0xzv9zbL3tiaJfrRFJy74wWtxn3LEAThBBibLYyUUCs6eKqIy7nozZHxsPwryDVK5SfL+XbnaxLs/CfFyB3mP8LjfGTZw9KAMjqCzdAAPaNzQ83Kt+SbeX9MyTD9UE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RbOTx1Tk; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RbOTx1Tk"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48df0fa43c5so1035351f8f.0
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 13:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792357038; x=1792961838; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xVaVgwdVIKoTGAYIK7qaWv0TXT25+xxApfVDrPP1pI0=;
        b=RbOTx1TkpaduRZMdmAdp8IrMlGJcGFowuwdoYO6ePHqxaY2xGXHaQS/sSGX/elnrWg
         HDuCfXwT+z4Mi9AirPayRWTlgBAUPgDJnAeLUF4v3hj9kTWDmeDpoyVx4ek8Q7rfzcrR
         Bb4Gp3cKnyqi5xrSi90PCGzwnwSmbPmmJ8F+hYdpPGtY0MznO2lrrFRQd572IktVuELw
         hqHRwcvBfBUsHKVUzRyxh/sOtysH6SIxv1jCPL5jUcSYrIjBERGfBUM+/LQ7gWZZ5A5Q
         B7P87jjTrGQsPFbP6zGzyQwF2atzdxuW8kPLOdMSzvT+QnXaMGRZ0I4zPlxRSvN4VsKI
         ICjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792357038; x=1792961838;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xVaVgwdVIKoTGAYIK7qaWv0TXT25+xxApfVDrPP1pI0=;
        b=YVumM0/Lwor2cEEmOXrwAsdw+1Nbi0rCbw0D9mgHoLFRQpDo6qJh9aFmuQQP5dGYfW
         nxTtuTaqAUr7J7lxqZ13c3/zSLcC9Nv1snIYoVzh9h2aoGDiWCh823uuhdmnzksKfvS1
         Nef8qxDgBjJODZdzz2Oj3Zp3tv2AO1foqDC/dE/lSblURPdSnw7pMXga6eOf+o8bTYlJ
         3679dyiIDGRC9PzzybIL9DDuNkOKLROy/ie7EoBVwYl5G2orHroqG7oLul72cXosECyD
         vrvlOORhp4O+urKqBCGHhXSGDaklR9r9zUschPBNth4dYFVG02IPFB9ZfqUkO7TnBjkR
         naIA==
X-Forwarded-Encrypted: i=1; AKwUvByZMid3YTALr5zKzXLxazkH+hT8Mt7/GyLJ72kz8x7FGg2rGDQq1NjJsJzNm/NzPnz3v5XStohNwwOsa2c=@vger.kernel.org
X-Gm-Message-State: AFq9FYLuDeI9KoOUB61QOmAG413+F8SzrVlXX0xZtlhmEO53NfoWqHoA
	UWiEixKAeoM5JdLcz+QBRx9qvV2JqmmqMbBiIIEsi6OQo2MsXlDOHNsb
X-Gm-Gg: AYBFou1nsfYn3jLVBhjmgfcdj+AWEedM3VH6sgwwNV+yq7IBbUJWhvKJHffpFEK3Z+Q
	kBI2XOMI3cOOOEeUiJ7FobH8ZQQJQT1toJC/RGlh0NBCSCye068HPyTqbRAmqrAX4XNhSL1n1PO
	4/PhjpyJVkBiVCVOscZ42g1id3ldVehXs89vav9oCVrTPbBd63vZ12v10Ij3b0T1jfl24JhKQj+
	jUHsMer/EaxLQPJJup9Z0mPa1H5n2trhG0Hi7xdaNKfCTSkb/gTgXdeQztGLH/Ox/D3/oj8UyeL
	8WzLyeDAwMEPFLncGJaISU3m8dIezzPZFkqUbza2JBKS2FIi2/WhhMGVynsY39d2qwjZQuvUE9B
	HJIjY/2+lUGf0eD70ANao4/nv5eNTdPQmpzc12aleTZ2zCYevAxrEhxqCf4FFPtJo2/EdTgDypp
	d8fOyTXCJL3ZD1hXANKCqAeNaMUbFbLqovilzdYEYOJZ5i0OF9UrUeyIs/2ToYNCazAHw7vOqGa
	PmVpI0I7tc3Sz0BiTrb3uX44HyKIPFtynpx+Z/IM7TiRlMnI81wgWgq+uq+KBGJvW1p4w==
X-Received: by 2002:a5d:5610:0:b0:48c:72fc:3644 with SMTP id ffacd0b85a97d-48e07fa927amr9407194f8f.22.1792357037830;
        Sun, 18 Oct 2026 13:57:17 -0700 (PDT)
Received: from localhost ([178.214.243.78])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4f5177sm18496263f8f.30.2026.10.18.13.57.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 13:57:16 -0700 (PDT)
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org,
	tiwai@suse.de
Cc: tiwai@suse.com,
	perex@perex.cz,
	linux-input@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Subject: [PATCH v10 0/8] the Topping M62's and E2x2 OTG's vendor controls, on the component framework
Date: Mon, 19 Oct 2026 01:57:02 +0500
Message-ID: <20261018205711.168291-1-mikhail.v.gavrilov@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Topping M62 and E2x2 OTG keep part of their mixer behind a vendor
protocol on a HID interface, outside the USB Audio Class: on the M62 the
analogue input gains, the output volumes, the MUTEs beside them and the
output and loopback routing, on the E2x2 OTG the input gains, the
faders, the routing and the output switches. On Linux they can only be
set by hand on the front panel where it has a knob for them, and not at
all where it has none. An E2x2 OTG whose headphone, TRS and AUX outputs
were switched off by the vendor's application stays silent on Linux, and
so does an M62 input or output that application left muted. The M62's
battery level, which the card reports, shows nowhere, and an M62 whose
USB-C port that application has set not to charge from the computer runs
its battery down, with nothing on Linux to set it back.

This series makes them ordinary ALSA controls on the card snd-usb-audio
already creates. 1/8 is a HID driver that carries the protocol, and 2/8
adds the M62's controls to its mixer quirk, which is also the component
master the HID driver binds to. 3/8 and 4/8 add the E2x2 OTG, which
speaks the same frame; 5/8 offers the M62's battery level as a power
supply, 6/8 the power settings of its two USB ports as controls, 7/8 the
M62's MUTEs as switches and 8/8 the E2x2 OTG's input MUTEs. 1/8, 3/8 and
5/8 are HID, the other five ALSA: the ALSA patches build on the header
1/8 adds and need nothing else from the HID side.

Changes since v9
(https://lore.kernel.org/all/20261018124838.129349-1-mikhail.v.gavrilov@gmail.com/),
all three after Sashiko's review of it:

  - 5/8: the battery's power supply is registered without devres, its
    name made at probe, and unregistered in .remove() once the reports
    have stopped. component_bind() keeps a devres group open on the HID
    device while topping_bind() runs, and a battery report that came in
    meanwhile could put the supply registered with devm into that group,
    so that the audio side's next unbind freed it under the driver;
  - 5/8: the bind opens its session under a runtime PM reference, taken
    before the component is published. A bind outside any USB probe, as
    when hid-topping is loaded onto an interface usbhid already holds,
    could otherwise outlast the autosuspend delay while it waits for the
    card's answer to the handshake;
  - 1/8: pm_ptr() around the PM callbacks. That is the only change to
    1/8, so it keeps Jiri Kosina's Acked-by.

The selectors keep "... Source". Named "... Playback Route" or
"... Capture Route", a selector would join the volume of the same name
in alsa-lib's simple mixer, which then reads and writes only the
selector.

Tested

Fedora, 7.3.0-rc7-32c52ec87d62 plus this series, with KASAN (generic),
lockdep and UBSAN, an M62 (firmware V87.05.45.48.27, bcdDevice 3.27 in
Pro Audio Mode, 1.45 in Mobile Mode) and an E2x2 OTG (firmware V1.10,
bcdDevice 1.10). Both loaded modules were matched against the installed
files by build ID.

  - fifty cycles of hid-topping unload and load with both cards
    connected and PipeWire running: a hundred binds, two per cycle,
    every mixer control of both cards the same before and after, and the
    M62's battery supply there again after the last load;
  - five audio-side rebinds of each card with the HID driver left bound,
    all three snd-usb-audio interfaces unbound and the control interface
    bound again: ten binds, every control there again, and the M62's
    battery supply still there after each;
  - "alsactl restore" exits 0 on both cards;
  - suspend to RAM and back: the controls of both cards unchanged, and
    afterwards the M62's headphone knob and an E2x2 OTG MON button each
    reported to their own card;
  - the cable pulled out twice on each card during playback while a loop
    wrote a loopback gain: each time the card bound again once plugged
    back; after the last plug the control took the loop's writes again
    and read the last one written, and neither hid-topping nor the
    quirk logged an error;
  - the M62 switched to Mobile Mode and back, twice: the driver's twenty
    controls in Mobile Mode, the first bind writing every one of them,
    and alsactl's restore the stored gains 0.10 to 0.12 s later;
  - the M62's port power at eighteen first binds with the HID driver
    loaded after the card, out of reach of alsactl's restore: on a card
    left on Off and Discharge the bind wrote Charge and Off, and Off and
    Discharge written right after the bind, as a restore of those values
    would, left the card on the bus for the 10 s it was watched; every
    value of the two the card announced afterwards was the one last
    written;
  - the M62 answered each of the 75 handshakes captured in these runs
    11 to 378 ms after it, and no other frame of the protocol was sent
    to it in between;
  - the M62's Loopback 1/2, with a 1 kHz tone at -20 dBFS peak on
    Playback 1/2 and all sixteen capture columns recorded: its source
    set to Playback 3/4 turned the two Loopback 1/2 columns into digital
    zero and set back brought the tone back; its gain at -20 and +12 dB
    moved them by -20.00 and +12.00 dB;
  - each M62 input's switch turned off took the input to digital zero,
    in its own capture columns in Pro Audio Mode and in the recording in
    Mobile Mode, and turned on brought it back;
  - each E2x2 OTG input's switch turned off silenced the card's meter of
    that input; a gain set while it was off was not written, and the
    switch turned on wrote it and the meter came back;
  - no WARNING, BUG, KASAN, UBSAN, lockdep report or call trace in the
    kernel log over these runs, and lockdep still on after the last.

The M62's battery shows as a power supply, and in UPower, 2.6 to 2.8
seconds after the card is plugged in, and 1.8 to 3.5 seconds after it
comes back in Mobile Mode.

With PipeWire and the M62's UCM profile
(https://github.com/alsa-project/alsa-ucm-conf/pull/826), in Pro Audio
Mode the M62's headphone level follows the desktop volume and the
front-panel knob both ways; with the E2x2 OTG's profile, to be sent
after that pull request, the desktop volume moves the E2x2 OTG's
Master.

Not tested:

  - runtime autosuspend: power/control was "on" on both cards, so the
    reference the bind now takes kept nothing awake;
  - hibernation, and with it .reset_resume;
  - kmemleak, compiled in here but disabled at boot;
  - a card whose battery has run down;
  - a big-endian host.

The plain E2x2, 152a:8752, is left out: it needs its own channel names
and a test by someone who has one.

Mikhail Gavrilov (8):
  HID: topping: transport for the M62's vendor controls
  ALSA: usb-audio: add the Topping M62's vendor controls
  HID: topping: add the E2x2 OTG
  ALSA: usb-audio: add the Topping E2x2 OTG's vendor controls
  HID: topping: report the M62's battery level
  ALSA: usb-audio: add the Topping M62's port power settings
  ALSA: usb-audio: add the Topping M62's mutes
  ALSA: usb-audio: add the Topping E2x2 OTG's input mutes

 MAINTAINERS               |   10 +
 drivers/hid/Kconfig       |   22 +
 drivers/hid/Makefile      |    1 +
 drivers/hid/hid-ids.h     |    4 +
 drivers/hid/hid-quirks.c  |    4 +
 drivers/hid/hid-topping.c |  716 ++++++++++++++++++
 include/sound/topping.h   |   57 ++
 sound/usb/Makefile        |    1 +
 sound/usb/mixer_quirks.c  |    6 +
 sound/usb/mixer_topping.c | 1452 +++++++++++++++++++++++++++++++++++++
 sound/usb/mixer_topping.h |    7 +
 11 files changed, 2280 insertions(+)
 create mode 100644 drivers/hid/hid-topping.c
 create mode 100644 include/sound/topping.h
 create mode 100644 sound/usb/mixer_topping.c
 create mode 100644 sound/usb/mixer_topping.h

base-commit: f6e8d5ebde5ceb7d3c0eef6e9e4d82862b503ade
-- 
2.43.0

