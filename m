Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793186520;
	b=WC9z4mJhOtr4FT1bANzwgDdZX6CqzoQ8b5N3ZcOqaUMe953/4artJvTvSoMYnQk8FeSv
	 DQwutNdwo9uoNN9JP7KSMxpk+fA1hYXIm3VBaAGNxYHY5s+8/+5ch8RPwI2XDte8oqi0T
	 2ERRdS1zDpmwfVykVrBF2B0NF/xMQaEQFQJRHSwgFhIcRbsA356n2lXMXNET0MDSytn2x
	 UcNRVOlezbL934D6UC0ct3po4x1B4ERYZC8ycQRVIR6k3AWD5rNZMcBCx73nbydjvagW3
	 rgcyn6nBcDsAwL2n5iEBVf5YBfomKbImoOBlNc0cX+9ntN/qHV1RNeBfs8momlt5SIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793186520;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=nxIae98zDVY6PJLzZH0rbHlhoy2I3FG3UuF6SelgCus=;
	b=PMAYgyk2r1cd/Nk8hL2ggdRxyLNsgVwGq16Os/yvjYdsxWLdijZP8QEW95V/T3qomwys
	 wDJwlOmhccKczGiF8KFDKjPM3cp4EChcYPtPFXjDZQfW6lckBsP4wsj+Q0B/9j7djjJDM
	 muhBq6OAtShEO7byJBcNErBEhjKKsbbnTGeMd+/VxmncNEYmaHYGwQbFXblktnz8RQLGG
	 ejFLPr3LBUmOQ181WwFEQEDfChRut081W0PxGwN1EywhwqBgielWP8AD9jlGfuvIssXs1
	 WTcUUJX7VjidFatacxnENiBopxmcNJFjw76eezGG1DuY5bA9yOyfRIx9wDm7KnI5JWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D81ng3aI;
	arc=none smtp.remote-ip=209.85.214.181
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9465C606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 11:21:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9465C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D81ng3aI
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2e8ad5b2f61so2299255ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 04:21:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793186519; x=1793791319; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nxIae98zDVY6PJLzZH0rbHlhoy2I3FG3UuF6SelgCus=;
        b=D81ng3aIWRJF0Dn7Mf/zKViiAg7py7RwSLhIu6rqK0inevjj0zw0T59Cvh0829lOFL
         rtB3KQpCrte2eouOdB2AvdVsqvjuXk6DMQkMSg6F2LcuooARPBdo10JInnBdaNHUc4B1
         YQ9SKnOQiu3yXoxJzwj1doFlr2mY47sM9qJPDEPoxExYPOE4wteLCmpuM3N8iG87yEe/
         ALryLAK4I9dwqLoKpgnb8iBOiuaFPEMLrFm1R5jD4FG3E5I8tSruQXVUMMcpzpn9cwfn
         PRluAS0HN7wl9NxrXBYAk3E6yWvdNveu3UaZW/+vVFrcwWtVBsn4oHRRGC6xMQnCgAMx
         YODQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793186519; x=1793791319;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nxIae98zDVY6PJLzZH0rbHlhoy2I3FG3UuF6SelgCus=;
        b=1nhRIv1YgYtSn3OpwUcbeL8ZXvLJmYm6/ueSNhh8KrfhQOVQnxwU99K4p4uUE7U9+q
         DMWuaoqE6oV65uVicQ5kQn6TCFRDMu3AjH6DjiRtld/71xQm3ugDluaO8pW3aT9YDq3w
         0MoWFu7HoF0xL1pPLZLezR0JJYvN4K/8PssabA8q65Urs932AavrI75QUwzCPZ8XRB1I
         ImLiZnuC+SkDc1yyrX9GmVdauc04QiaQ5HyDrScNlF78WpCF1vRIR78wo9QMMTpwA16D
         19ncELWOCrUenVLi8EBzKSkD0gVqXl9Lj9nCmQ4Sk76L/KP4s7DltBhf77kVU2n7Ao+b
         KACQ==
X-Forwarded-Encrypted: i=1; AKwUvBxSZ6P5770LZyIxJO8BV1UN/tvfN/4yhNQ5fvh6/9R1EbrEJGzVswZmX3AWXwUj3/KlIkxm3hykFTjS5yo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJEPogTIYbZtn4qF1HQutPJc9ipG3L139zSglxXWl1AkbXiZ+4J
	b5iRPNKjgBrHLTl8/bQw7Lww3sqMK22XOxAu5nstCRv824qfdXDBmWBY
X-Gm-Gg: AYBFou0WLsXd5OctfO2dQeGvGcPOlAwxW0PRm+PW0j4/gabsnEcMKU6ggvgpGVT6S86
	RXiMkDtTRKICNU8sX7Rrg4IDeiop0rchDWeVQJOPIGBwm+J4BMhnbuicviw7O2nSl+MH1Ux+Jto
	NH0bLX6yClylZHqwxjzo0KRFucPMHg6z84poik3v1/rCrTa7V5X127s3r0so297VerIoxzD5fH8
	gfl6S+mibbEYwF6qfFjvIN4CGf7DLv5/0SH+uDbC2C+N61e25nksy0KRwZmfQHNXk8ljx0ari7x
	ekN+8zB/iBZJsCMnoOE1Obxi37qbH3U4J7zOkkKk3eqA58fP3S9/u2BcQBMwsdaVq98A98fidY/
	j1jjzpuXXSIZTgRBti+i3xIMfIDSvuB43zJZHGRmPwXmrSnp3pnggVxKjlMr52y+PYmyyzSxYpf
	pl+HC5nlwwe81CPBZaw6m9rvdLDcuTIpJYIGXkblarYvCCZ+83CY6CN59AqafJE0j6+eIratlXT
	qcgYm+w2apbwJLdULX4Eibl/+umSDbIoP+ikVwTWQBxsyNL4w5aHJBsZ1oC0ycZcMcac2sDqcZg
	YDdDJZ1yMmJqOJtkL7zf/SvCSqK4SNWJqY3c43PPM+bsBXf3CUl/TcPIw2xmFDqo0Z0iNLTonn6
	oaKPCEnqLkcOnav+xY6BcVspzS5IPiOu9dwJPwIV+49qBZx7GJyFGJ58htbYONX47i7tTVLNYPE
	1lmD0+flsDeaZK4ODshGc=
X-Received: by 2002:a17:903:37ce:b0:2e9:4f73:83d4 with SMTP id d9443c01a7336-2eb005b6602mr30886385ad.4.1793186518836;
        Wed, 28 Oct 2026 04:21:58 -0700 (PDT)
Received: from esteban.tail1178e6.ts.net (132.20.31.150.dy.iij4u.or.jp. [150.31.20.132])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eafcdb52e6sm10157945ad.74.2026.10.28.04.21.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 04:21:58 -0700 (PDT)
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
Subject: [PATCH v2 0/9] media: i2c: ov7251: fixes and infrared strobe for Surface Book 2
Date: Wed, 28 Oct 2026 20:21:45 +0900
Message-ID: <20261028112154.855185-1-antoine.pichot@gmail.com>
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
  clock before dividing it, which runs the PLL's VCO at 2553.6 MHz
  against the 300 to 800 MHz the datasheet allows. The Surface Pro 7+
  drops most frames at that setting; the Book 2 copes. Dividing first
  keeps the link rate and brings the VCO to 638.4 MHz (Fixes, Cc
  stable). It goes before patch 2 because patch 2 is what makes the
  driver select this table.
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
  v1. The core then handles control events, which v1's patch 3 added
  by hand, and v4l2-compliance passes on the sensor.
- 6: orientation and rotation controls from firmware.

Dave Stevenson noted on v1 that set_frame_interval does not belong in
a raw sensor driver that also exposes VBLANK. Patch 4 only fixes the
current behaviour and does not stand in the way of removing it.

Patches 7 and 8 add the emitter. 7 moves the strobe registers, which
the three mode tables write identically, out of the tables without
functional change. 8 adds a V4L2_CID_FLASH_STROBE_OE control that
enables the STROBE pin, pulses it on alternate frames and makes the
pulse follow the exposure, from 52 lines up to 45% of the frame and
never more than 776 lines. This matches the Windows driver installed
on this machine (Intel ov7251.sys 30.18305.6.5127, read with a
decompiler): all four of its streaming modes enable the STROBE pin and
clamp the pulse to the exposure within 52 to 776 lines; the two modes
Windows Hello uses light alternate frames (0xaa), the other two every
frame (0xff). A register dump taken on a Surface Book 2 during a
Windows Hello sign-in [1] matches the 30 fps alternate mode. V4L2 has
no per-frame illumination flag, so user space tells lit frames from
dark ones by brightness; the dark frames give the ambient-light
reference a face liveness check uses. With every frame lit and filmed
by a phone at locked exposure, each pulse is 1.1x (default exposure)
to 1.2x (776-line pulse) as bright as during a Windows Hello sign-in
on the same unit; with alternate frames the average emission is within
the same ratio of Windows'.

A linux-surface pull request for the Surface Pro 7+ [2] instead turns
the emitter on unconditionally while the sensor streams, with a module
parameter to disable it. This series leaves the choice to user space:
the control is off by default, and the emitter is off whenever the
sensor is not streaming.

Patch 9 makes ipu-bridge report a rotation of 90 degrees for the
infrared sensor, whose frames show an upright scene turned 90 degrees
clockwise while the firmware says 0. It adds a DMI quirk table next to
the existing one for upside-down sensors, with entries for the Surface
Book 2 and the Surface Pro 7+, the two machines checked. A user-space
project for the Surface Book 3 rotates that model's infrared frames by
90 degrees as well [3].

Patch 8 needs V4L2_CID_FLASH_STROBE_OE, added in v7.0 by commit
5be4154f6255 ("media: v4l: ctrls: add a control for enabling strobe
output"), and is not meant for stable. Only patches 1 to 4, the ones
with a stable tag, apply to older trees on their own.

[1] https://github.com/linux-surface/linux-surface/issues/739
[2] https://github.com/linux-surface/linux-surface/pull/2252
[3] https://github.com/linux-surface/linux-surface/pull/2289

Changes since v1 [4]:
- New patch 1: in-range PLL dividers for the 319.2 MHz link. D.
  Manresa reported that v1's index fix made his Surface Pro 7+ (IPU6)
  drop most frames and stall; with the dividers swapped he measured
  13 clean runs of 13 against 7 bad of 10. Dave Stevenson read the
  same values out of the datasheet and measured on a 24 MHz board
  that the out-of-range tables do not produce their nominal
  frequency. The 24 MHz tables have problems of their own and are left
  alone: nobody in the thread can test a change to them.
- Patch 2: Reviewed-by from Daniel Scally.
- New patch 3: report the pixel array rate, 48 MHz, for both link
  frequencies. v1 reported 63.84 MHz at 319.2 MHz, the bus rate. Dave
  Stevenson saw the same on a Raspberry Pi, where libcamera asked for
  100 fps and got 75.
- Patch 3 of v1 (control event support) dropped; patch 5 converts the
  driver to the sub-device active state instead, following ov5645,
  which gives the same result through the core (Sakari Ailus).
- Patch 8: use PERCENT from linux/units.h and plain clamp(), clamp
  the span to its limits before applying the duty limit (Andy
  Shevchenko). The CCI register helpers are left for a follow-up
  after this series.
- Patch 9: entry for the Surface Pro 7+, whose infrared frames D.
  Manresa found turned the same way as the Book 2's.
- Tested-by from D. Manresa on a Surface Pro 7+ (IPU6, kernel 6.19)
  on patches 4, 6 and 7. He tested v1's strobe control too, with the
  same result after Andy's changes, and asked to re-run the v2 patch
  rather than have the tag carried.

[4] https://lore.kernel.org/linux-media/20261026111032.88355-1-antoine.pichot@gmail.com/

Tested on a Surface Book 2 (i7-8650U) with the series built out of
tree against linux-surface 7.2.12 (test suite, logs and a v4l2loopback
bridge for applications: https://github.com/antoine79/surface-ir-camera):

- link frequency 319200000, pixel rate 48000000, 30.0 fps measured;
  PLL registers read back as programmed while streaming
- 3 x 155 frames at 30 fps and 3 x 155 at 90 fps on the 319.2 MHz
  link: 0 dropped buffers, 0 CSI-2 error lines
- v4l2-compliance -u on the sensor: 0 failures (was 1)
- --set-subdev-fps 60 / 90: 60.16 / 90.46 fps measured (was 30.01)
- orientation front, rotation 90 (0 before patch 9); the colour sensors
  still report 180
- dark frames and the sensor test pattern unchanged after patch 7
- strobe span read back while streaming: 504 lines at exposure 504,
  776 at exposure 1704 (30 fps), 258 at exposure 552 (90 fps)
- mean pixel value of an indoor infrared frame at analogue gain 128:
  18 to 19 unlit; with the strobe enabled the lit frames read 526 at
  exposure 504 and 609 at 1704, the dark frames in between 18 to 21
- strobe off and sensor suspended within 2 s of the stream stopping
- 10 unbind/unload/load cycles: no warning in the kernel log
- Howdy face login enrols and recognises through a v4l2loopback bridge
  that passes the lit frames

The remaining v4l2-compliance failures are in the ipu3-cio2 capture
driver (buffer creation and mapping checks) and unchanged by this
series.

I developed this series with an AI coding assistant (Claude): the
design choices (alternate frames, the pulse limits, the exact SKU
match), the reading of the Windows driver and the measurements above
are mine, and I reviewed and tested every patch on the hardware
before signing it off.

Antoine Pichot (9):
  media: i2c: ov7251: Use in-range PLL1 dividers for the 319.2 MHz link
  media: i2c: ov7251: Fix link frequency index
  media: i2c: ov7251: Report the pixel array rate for both link
    frequencies
  media: i2c: ov7251: Reset vblank when the frame interval changes
  media: i2c: ov7251: Use sub-device active state
  media: i2c: ov7251: Add orientation and rotation controls
  media: i2c: ov7251: Move the strobe registers out of the mode tables
  media: i2c: ov7251: Add strobe output enable control
  media: ipu-bridge: Add a rotation quirk for the Surface Book 2 and Pro
    7+

 drivers/media/i2c/ov7251.c           | 360 +++++++++++++--------------
 drivers/media/pci/intel/ipu-bridge.c |  31 +++
 2 files changed, 209 insertions(+), 182 deletions(-)

-- 
2.56.0

