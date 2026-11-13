Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794537674;
	b=YiIxsYKi3gcbIjwJcLPVnxbPfExEUzGoTXCHfMurqezk9Y1R4/LF+lz9PUgy/EKMjAI4
	 2aB+Q9TVXIcRqVWvkm722lZk/e8PRQf4TjMeG5H1hpPAQS29zQQcFIrQoT/Wg4UGBITP4
	 6Sc0j9bdgNXLmlvSrxY711ojPoUhsPnprF/f5C0AIjMa57ARthLhAXktOPLQWnPUFvD3j
	 cUCQP+G1KX7izVACmh+56E8V4MxYuIDzDnT0p/NZSRQP0zOVu1TM8JBPqZ9CnwVh1U3VS
	 tMj6r+sFqNC29cBpeucAEeGRCGGefzsLF+w3losbtf+vMtJhf1bwDeJGJXAjmn8jCRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794537674;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=5WoaMAiIqjCuHp5AZk2CyAFMuNVa43CH+JwXBHXHvPo=;
	b=z/LbDPLElU1tVl8YAtV0R6DwVBhmuS1PTn6fWrBybSZxt+68XrE8ni2ckxDIPgLQzjO6
	 SmFP8Q6K8xOtwsjsT7GX12LoSMH6iOGwlxR7iCVsBaEaly+ggSWwveBDVspAnjUZiZptZ
	 6R3wdu5bcf3IPrSbyswYb0ItuFjFRd4IyatlwpvqKZpKCwwqly3d3kIJbil1dsa+PYjJW
	 8szmfz8GannkHmVBicwmSeqAyBgceSyc1FXHHvoX947YbpLLdgD0VoPANX7OguTW1amq9
	 WzVnBqAaecaOlKCj82kAD7THkvbi4OEUodlASaVpJ+Y2fIeBhgEmhnPYEXfKObeDk7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qwB8kA6q;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AB65606A321
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 02:41:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6AB65606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qwB8kA6q
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-36e90071735so82273eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 18:41:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794537674; x=1795142474; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5WoaMAiIqjCuHp5AZk2CyAFMuNVa43CH+JwXBHXHvPo=;
        b=qwB8kA6q8z7rcUbIKKtXMHF6+vWlpiwXJCdxbKJokEDvGjcR//ZWDd+7LG8TIZ910Q
         l1ABmvtr6N7HYTxxMfqnrzL6hcK/SIkZ5rbaXz0d6BoKa+EcfnP/wZbMbSge7HIxsZDu
         fHcYH08FiYKnZiE3ZDib+xPt1OKuqzlhL0RHh9NPIC4EipnEVBtNvYy8Jg20Fxv6/vqY
         /ShhFjVhgobZPjnNnzTgfXMu/k6oL8A0u0MwajoiWaP/HYC3U5pE7rbFvRLNE76ou4ff
         /Y11EfLIcUpfQOPz8M3bXww9oJaSc0VuBd+T7eBjvWKyszF618E2lE3yjjz0nJY7jkA6
         gkUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794537674; x=1795142474;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5WoaMAiIqjCuHp5AZk2CyAFMuNVa43CH+JwXBHXHvPo=;
        b=VQEmA/dxg4h/rrZLcXYXz4uJUVgYdIBUXg5fqZgP+7I9UAtDXd2BG2DkH2Tp4PfqKX
         TLi5d4Lblofa4kW6w0aRBlTLh3wAkvkX7KAv2w5KoFaSyf7TRPfNcTA/DmJk56klIlQk
         HApqs+W0OQwlGn5KiQt4JIyXR6VypOS/EvRG5xLLKAckcD9U+8TKnLM5zdH/WM6ZxgYP
         ExzWRuM3uOk59Nuyvz4veMquIvZWSIa2UxGOsFJpo0JJ0NvcVWeoCzuvqW3tK7+t7zpK
         wpvxiqbo5x7eVOmyD+eIC5zcGQWxOx9B7DalkPYTRBr17KvfICAkAG5QCMuJuOY5zvYS
         Ccqw==
X-Forwarded-Encrypted: i=1; AL+hErGHhJW0hLYFoRbKBElHZgSfyQrH5NpO48Ah2JOAP2i9kF3aJ8O38QS5fZXVTzKhahiMn2H70qGX+LN/LEU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9cZ0M10HlfMMJZh+Fojz0+TmtkDOAohpbxM7ShompsZVYfJZNW
	qE4FfovPNOQQERkTmaf0LQWrvhoL1eihzxRLZDqEScO4d3nXLkeUCyvX
X-Gm-Gg: AYBFou03Dm+i8lxtoxG5pJURQPF4dfcpPzdxRgK9FfyvTM5Y3v2OVoRGwwt5v6uVmKK
	7L0Wb1i1YvogT9MlLhuZpx+ooX43qwAyuLfj67aHPRI0CeE8W2RDlVtR6oSAhckfAZ42RGuLM/x
	ArPi/lWz3QYIoxNR6V9YfEnce6xh5xwC3lWFCDbeP247EUkSEf9HGjFUF9iAgYRRxJMukR9o8D5
	QMVDRDXuefkk85yH3QAJLA4MGQziXXfV/mA9u7Yj5Y1YNPh9uJlnL+mMQJcmlcMfFpnxqT/ejFa
	W66VyYH9Q9yXqMCSpY3Ddi5O3i8WtwAQ5X3EtgLUuIbKt5ceVB1Lm4mRVTCo8YSR01cdCXzzTyY
	eL/j8XnUfd7zT6q2S5i3PoKUCfS0IJtDdnzNNySQjK+8K5In3Sj8shK71TtY6T/JdAYLAH3Iygz
	1qMMlvwKd/flsuPBgYiy43PeJbnk+oYmKi1RHnzNSiwG86mFdUweU7CqBz5FuRqFPRZjVoXTIxj
	LgwBvaKKdwSzNu0VCAbaWiBTPEJ6N0ZsQltf+uFbp2LoZe406IvUTV3nqPQvvvxufdmlH/4lCFt
	w07aTiy/ui8YrGvAbKMYboLYtVpnrH/+prk/OjIYkTrLd9i0Nmg7onV7n56B0fLxqyDOmBj3h55
	/NoWN7chfo9K9Djt+nq6LETOurKosCLPrmVc66N2gbIX5uAZJIQIdkrU0Z/CbeSkvv9EuVCI/x4
	rmzPC7oymuxQ==
X-Received: by 2002:a05:693c:880d:20b0:35f:ea17:d171 with SMTP id 5a478bee46e88-379658c7afcmr1472277eec.2.1794537673416;
        Thu, 12 Nov 2026 18:41:13 -0800 (PST)
Received: from esteban.tail1178e6.ts.net ([240b:c020:623:52c6::44d])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379565d07b3sm2334704eec.22.2026.11.12.18.41.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 18:41:12 -0800 (PST)
From: Antoine Pichot <antoine.pichot@gmail.com>
To: linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com,
	mchehab@kernel.org,
	hansg@kernel.org,
	andriy.shevchenko@linux.intel.com,
	dan.scally@ideasonboard.com,
	djrscally@gmail.com,
	dmanresa@gmail.com,
	dave.stevenson@raspberrypi.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/9] media: i2c: ov7251: fixes and infrared strobe for Surface Book 2
Date: Fri, 13 Nov 2026 11:40:50 +0900
Message-ID: <20261113024059.1087031-1-antoine.pichot@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Microsoft Surface Book 2 has an OV7251 infrared camera (used by
Windows Hello) next to its front camera, both on the Intel IPU3 camera
interface. Its 850 nm emitter is wired to the sensor's STROBE output
pin: the ACPI tables describe no LED, GPIO line or regulator for it.
With the mainline driver the camera streams, but always unlit.

Patches 1 to 4 fix bugs found while testing on this machine and on a
Surface Pro 7+, 5 and 6 rework the driver's state handling and add the
placement controls:

- 1: the 19.2 MHz PLL table for the 319.2 MHz link multiplies the
  clock before dividing it, which runs the PLL's voltage-controlled
  oscillator (VCO) at 2553.6 MHz against the 300 to 800 MHz the
  datasheet allows. The Surface Pro 7+ gets CSI-2 errors or stalls in
  most runs at that setting; the Book 2 copes. Dividing first keeps
  the link rate and brings the VCO to 638.4 MHz (Fixes, Cc stable). It
  precedes patch 2, which is what makes the driver select this table.
- 2: the link frequency index is taken from the firmware list instead
  of the driver's table, so the sensor runs at 240 MHz while
  ipu-bridge asks for 319.2 MHz (Fixes, Cc stable).
- 3: V4L2_CID_PIXEL_RATE reports the CSI-2 bus rate instead of the
  pixel array clock, which is 48 MHz at both link frequencies (Fixes,
  Cc stable).
- 4: the 60 and 90 fps frame intervals are accepted but the sensor
  keeps streaming at 30 fps, the vertical blanking control not being
  updated (Fixes, Cc stable).
- 5: conversion to the sub-device active state, as Sakari asked on
  v1 [7]. The core then handles control events and v4l2-compliance
  passes on the sensor.
- 6: orientation and rotation controls from firmware.

Patch 4 only fixes the current behaviour of set_frame_interval, which
Dave Stevenson noted on v1 does not belong in a raw sensor driver that
also exposes the vertical blanking control. Patches 5 to 9 apply on
top of 1 to 4.

Patches 7 and 8 add the emitter.

Patch 7 is Dave Stevenson's, taken from his ov7251 branch with his
agreement. The three mode tables wrote the same 117 registers; the patch
moves them into the global init table, written once after the power-on
reset, and leaves each mode table with the six clock control registers
(0x3016 to 0x301c). The frame length, the only other value that differed
between the tables, is dropped from them since the vertical blanking
control writes it. Two side effects show on the bus: a stream restarted
before the runtime autosuspend powers the sensor down no longer rewrites
the common registers, which the sensor keeps in software standby, and
register 0x3820 holds 0x40 while streaming, the value the mode tables
had always asked for, instead of 0x00; the picture is unchanged. The
datasheet names the bits of the clock control registers as per-block
clock gates and resets and does not say what a cleared bit does. The
30 fps table holds the reset values but for one reset bit, the 60 and
90 fps tables what the machine's Windows driver writes in all four of
its modes. On the Book 2 the sensor streams the same with either set at
all three rates (rate, black level, test pattern, no CSI-2 errors).
Clearing the gates, in [4] and then one at a time, changed only two
blocks the driver does not use (OTP load, group hold) and the timing
control gate, which stops the frames when cleared. Power was not
measured. Whether one set moves to the init table, as [4] proposed, is
left to a follow-up; the rest of Dave's branch (CCI register helpers
among them) waits for this series to land, as agreed on the v2 thread.

Patch 8 adds a V4L2_CID_FLASH_STROBE_OE control that enables the
STROBE pin, pulses it on alternate frames and makes the pulse follow
the exposure, from 52 lines up to 45% of the frame, capped at 776
lines. This matches the Windows driver of this machine (Intel
ov7251.sys 30.18305.6.5127, read with a decompiler): all four of its
streaming modes enable the STROBE pin and clamp the pulse to the
exposure within 52 to 776 lines; the two Windows Hello uses light
alternate frames (0xaa), the other two every frame (0xff). A register
dump from a Surface Book 2 during a Windows Hello sign-in [1] matches
the 30 fps alternate mode. With every frame lit and filmed by a phone
at locked exposure, each pulse is 1.1x (default exposure) to 1.2x
(776-line pulse) as bright as during a Windows Hello sign-in on the
same unit; with alternate frames the average emission is within the
same ratio of Windows'.

Two design choices differ from ov9282, the other sensor with this
control. ov9282 exposes the pulse length as V4L2_CID_FLASH_DURATION;
here the pulse follows the exposure within the envelope the Windows
driver applies at every frame rate, so user space cannot drive the
emitter beyond it, and a duration control can be added later. ov9282
pulses every frame; here the pattern is fixed to alternate frames
because the dark frames are the ambient-light reference that face
recognition subtracts from the lit ones (V4L2 has no per-frame
illumination flag, so user space tells them apart by brightness). A
control to light every frame, asked about on v2 [5] without an answer,
can be added later without changing this one.

A linux-surface pull request for the Surface Pro 7+ [2] turns the
emitter on whenever the sensor streams, with a module parameter to
disable it. This series leaves the choice to user space: the control
is off by default, and the emitter is off whenever the sensor is not
streaming.

Patch 9 makes ipu-bridge report a rotation of 90 degrees for the
infrared sensor, whose frames show an upright scene turned 90 degrees
clockwise while the firmware says 0. It adds a DMI quirk table next to
the existing one for upside-down sensors, with entries for the Surface
Book 2 and the Surface Pro 7+, the two machines checked. The entries
match on the SKU because Microsoft reuses the product name across
sizes and the 15 inch Book 2 was not checked. A user-space project
rotates the Surface Book 3's infrared frames by 90 degrees too [3].

Patch 8 needs V4L2_CID_FLASH_STROBE_OE, added in v7.0 by commit
5be4154f6255 ("media: v4l: ctrls: add a control for enabling strobe
output"), and is not meant for stable. Only patches 1 to 4 apply to
older trees on their own.

[1] https://github.com/linux-surface/linux-surface/issues/739
[2] https://github.com/linux-surface/linux-surface/pull/2252
[3] https://github.com/linux-surface/linux-surface/pull/2289
[4] https://lore.kernel.org/linux-media/20261030142628.2235190-1-antoine.pichot@gmail.com/
[5] https://lore.kernel.org/linux-media/20261030121235.2163478-1-antoine.pichot@gmail.com/

Changes since v2 [6]:
- Patch 1: Reported-by and Closes tags for D. Manresa's report, and
  Dave Stevenson's measurement cited as [1] in the text (Andy
  Shevchenko). The sentence on the 24 MHz tables was wrong, Dave has
  tested them: they are left to a separate change (Dave Stevenson).
- Patch 3: the pixel clock is defined as 48 * HZ_PER_MHZ, and Dave's
  report carries Reported-by and Closes tags (Andy Shevchenko).
- Patch 5: code unchanged; Suggested-by and Link added for Sakari's v1
  request. V4L2 has no guard class for the state lock, so the explicit
  lock and unlock pair stays, as imx290, imx415, ov2740 and ov8858 do in
  s_stream (Andy Shevchenko, answered on the thread). The move to
  enable_streams and disable_streams, which removes the pair, is left to
  a follow-up to keep this series to the fixes and the camera.
- Patch 7: replaced by Dave Stevenson's patch described above, which
  answers his question on v1 about where the strobe registers belong;
  v2's patch moved only the strobe registers out of the mode tables.
  D. Manresa's Tested-by from v2's patch 7 is not carried over, the
  patch being a different one.
- Patch 8: follows the init table of patch 7, which now holds the
  strobe defaults it restores; the commit message now also says that
  the dark frames are the ambient-light reference face recognition
  subtracts.
- Patch 9: D. Manresa's report cited as [1] in the text (Andy
  Shevchenko).
- Rebased on the current media-committers next.

[6] https://lore.kernel.org/linux-media/20261028112154.855185-1-antoine.pichot@gmail.com/
[7] https://lore.kernel.org/linux-media/20261026111032.88355-1-antoine.pichot@gmail.com/

Tested on a Surface Book 2 (i7-8650U) with the series built out of
tree against linux-surface 7.2.12 and 7.2.15 (test suite and logs:
https://github.com/antoine79/surface-ir-camera). The rebase changed
no code: ov7251.c on the base commit is byte-identical to the driver
tested, and both files build on the base with W=1 without warnings.

- link frequency 319200000, pixel rate 48000000, 30.0 fps measured;
  PLL registers read back as programmed while streaming
- 3 x 155 frames at 30 fps and 3 x 155 at 90 fps on the 319.2 MHz
  link: 0 dropped buffers, 0 CSI-2 error lines
- v4l2-compliance 1.32.0 -u on the sensor: 0 failures
- --set-subdev-fps 60 / 90: 60.16 / 90.44 fps measured; mode switches
  from 30 to 90, to 60 and back to 30 fps on a powered sensor give a
  correct first frame every time
- the clock, timing, PLL, flip and strobe registers read back while
  streaming at 30, 60 and 90 fps are those of v2, apart from 0x3820
- orientation front, rotation 90 with patch 9 (on 7.2.12; the 7.2.15
  runs kept the stock ipu-bridge); the colour sensors still report 180
- dark frames and the sensor test pattern unchanged
- strobe span read back while streaming: 504 lines at exposure 504 and
  776 at exposure 1704 (30 fps), 258 at exposure 552 (90 fps); it
  follows exposure changes mid-stream
- mean pixel value of an indoor infrared frame at analogue gain 128
  (12 Nov run; patch 8's message quotes the 25 Oct run): 18 to 19 unlit;
  with the strobe enabled the lit frames read 517 at exposure 504 and
  681 at 1704, the dark frames in between 18 to 21
- Howdy face login recognises the enrolled face through a v4l2loopback
  bridge that passes the lit frames
- strobe off and sensor suspended within 2 s of the stream stopping

D. Manresa's Tested-by tags on patches 4 and 6 date from v1; the changes
those patches make are the same since. The Surface Pro 7+ ran v1 and the
divider fix of patch 1 as a test patch (13 clean 150-frame runs of 13),
not v2 or v3. The remaining v4l2-compliance failures are in the
ipu3-cio2 capture driver (buffer creation and mapping checks) and
unchanged by this series.

I developed this series with an AI coding assistant (Claude) over
interactive sessions: it drafted the code, the commit messages, the
test scripts and this letter from my notes, measurements and register
dumps. The design choices (alternate frames, the pulse limits, the
exact SKU match), the reading of the Windows driver and the
measurements above are mine, and I reviewed and tested every patch on
the hardware before signing it off.

Antoine Pichot (8):
  media: i2c: ov7251: Use in-range PLL1 dividers for the 319.2 MHz link
  media: i2c: ov7251: Fix link frequency index
  media: i2c: ov7251: Report the pixel array rate for both link
    frequencies
  media: i2c: ov7251: Reset vblank when the frame interval changes
  media: i2c: ov7251: Use sub-device active state
  media: i2c: ov7251: Add orientation and rotation controls
  media: i2c: ov7251: Add strobe output enable control
  media: ipu-bridge: Add a rotation quirk for the Surface Book 2 and Pro
    7+

Dave Stevenson (1):
  media: i2c: ov7251: Move the common registers into the global init
    table

 drivers/media/i2c/ov7251.c           | 531 ++++++++-------------------
 drivers/media/pci/intel/ipu-bridge.c |  31 ++
 2 files changed, 191 insertions(+), 371 deletions(-)


base-commit: 3fc9303dba01676c2090768126e5327e341b7761
-- 
2.56.0

