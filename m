Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793013038;
	b=uXjuhjPE5q5ZSc3cER8TyzxjeT+fltazZvpNP1W22Zuy44v7Hv7YZQLdme6/yhDEhfSz
	 rI3pavDvBcxNZXSo62T9cvrZcs9V4XTnDprU2FsbWFojpJ9sTXx/akkyyQdEchZFnxFk+
	 rtNquHx0F+ya3pZExQX4eGlSizT/kFYaaqZpf+MwbdykWWhyN0ZpmankM4d4Z5y6oIr8k
	 7D+xDrXaFMRCMfoOiQDWNlay8f4bgfmr69ePZ1AVC5jGxqyyNtZuHDwJfg/uKZCHhuZil
	 FrGmwAaqP7UmmJNHzwp2rxbc8723IK0k33biRb4nIM4IJABNrJoDgZM3HLLtBJObw9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793013038;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ygOfLFGA6D6eDRDgr2JvGUAeMnNwYneJ217o1J504M4=;
	b=29mivQg9dtrdRSNspz/RzlgNy19fRTcgtSigBwaJFiuIndvyQBQSIPFkpuWgIcz1Kwzu
	 M4LlIYf3yJ3fVkxFjCCuiuJ3rUmGtbDOacgxaZX1scNaaoqh2v5fyeNiwff7cNm66N5Zp
	 oYfl8qM/Wlp5LYOAro747XurP6OHBCcu945Hrwy8XWQhSBWwtXbKoAL44vaFhIf6fiU9O
	 Qz2jte0unACyzXC8bLPZrUgWAJ3eY9q0dyvuiYJGYBJSfTHvqj0D/mAOaANcCEa4XXbwZ
	 KB+dMJKYSsBvDjgq4A8RZhHUqLf/5FeVobGKSjz88UqNMkXXDN/G93HoFwFqbENYCQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=leJC5g4W;
	arc=none smtp.remote-ip=209.85.215.180
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B52BC60A261C
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 11:10:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B52BC60A261C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=leJC5g4W
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cd69aa46f21so102585a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 04:10:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793013037; x=1793617837; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ygOfLFGA6D6eDRDgr2JvGUAeMnNwYneJ217o1J504M4=;
        b=leJC5g4WhfPokxZgfHYbnuy2QxMXj1zphFraeVCq15RtgR9yc5yrI7X0s9BAE8ILqs
         Us5TUEWtF2hKbu++rqdGky9mkb+52JiKjFsZp3EvrTMTiDWdzf3HDG+cpF1DWZdIsWs1
         8BHZ8ytKT/qPzNudmtjQiYs7uroY/Fs7C1kryO0tXp4x7u4Xg+zvkBwWDM3Vr/vqtMUU
         s/ShbBptletrivewS5iHSSfhSUttq2RRWEWnfHpj0lRK1hJuxFnTA+tu5/6Bfj269rS7
         vF0mGy/H6GsLKb7eA3gitPSl5aSSF5gI8mmQpZdrltW4X0CTQh3mnsNovlLzUmRwNY74
         seuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793013037; x=1793617837;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ygOfLFGA6D6eDRDgr2JvGUAeMnNwYneJ217o1J504M4=;
        b=ZoxtWdJCHpJPr58Qh/dZoyfk9amInpLo8A3F4q97B/jv4rWJGP74JJ52NHd773V8Pg
         QgHUuwJMJGo+9uTz1VVPoNccF2ueia/LUtZ1HmUmHheXF9nOqZoG0c5pO9wgxB2azIiu
         U4TAR2hzOFosRG2G/gPVwTd9REtPRXOkrQC0Du+q6m812n6Tl0w8kBy4x8YnYfzcdVXC
         ByNa3brw70nYDyI3BRFv1O42791Ytd7gZaMhiZQqaHL0xqAS5pK3sRjQfTLpaMjoliSA
         5CbIe2cMFQGggNSQlx7rXfDHbPsyGw6J2KmW3a2/Oem/fnObafrZyt1UPouEUrSkTNpf
         jMQg==
X-Forwarded-Encrypted: i=1; AKwUvBz2DBbf19g2MCXvQafWGNSg91gNQZMnpv7+cSfBBGHhdEtlMf7WJ7bNb1F+CYxJIBUnGKiU2HkHR8AZ57w=@vger.kernel.org
X-Gm-Message-State: AFq9FYLkw/BssYC8tCmOfzw9T3YkwPDWg6U/0Mgz9kPkZW+Qa/dC0oOP
	HXuGH/HJ3kjpsKUozdiJpjtsZKN16FLUnqk5UiBfV9YiVu3p7Nulp5vv
X-Gm-Gg: AYBFou0vm7ms6+w1fZT6o2lSRBjtyKacBex1MW1YK+z0Sh3Q8yWSonZiXGsAWb+lRNN
	LQC58aafw0+rPCWh5z8o4HiR+oke5UJqXuwV7qVg2LdLU1CJHWa/iWxlScATXdcWgO5sQs9TSyz
	zA26tkwMnhuE+akFWE1n5yeziwJHH1JClybaGNe9ikjSQzgqe7EahxUgn+n+PiLhlkz3CwvcjYT
	4hcyfcCQfvdpbnmJru7hGCfuIYgZSZw5d3R0rw6JDS7zRhzC1sDhrJy/i9vNp2MjFETj48NjH/P
	CQlsNKpJYncmm2aWCSqO7/r0x6APIy35ceqOwQdsXw3mMNepQnk/7WOjubJ1ARcM3jcns2Q0a3B
	vDdh1yDhPeUst1FRKv/2GJuaiXGtcnFsLxoL6b9x7FSoEOQKsB4GqFcBYl2rdndTggdN3fQVKC1
	Xg6RtOzWkauPqX09CsGynr+DFBIbpJJzjoQDStCluDz+b54Et5tHk78STmUforC0J3A9vRorkQ4
	CWVBAdjpySDIUkAHLNt1EQy9evPv4zl7fxUZNFk9lq3YAJ9APZ9mvCf5uzTdLVFmgXYykyy4hDH
	m1NQb8ZpykOXcr42TPngqqEuk8Fv+uszdfK5J92ZhqOu0NIFVtqS6APOZKZdqqL+KXQwwel7XTa
	txUFSDQ9Kn/inYlO0Yvtc0JpNF2UXLRQYRJFdIaYaFej49A==
X-Received: by 2002:a17:90b:438a:b0:3ae:629:ca12 with SMTP id 98e67ed59e1d1-3ae0629cee5mr4238879a91.3.1793013037033;
        Mon, 26 Oct 2026 04:10:37 -0700 (PDT)
Received: from esteban.tail1178e6.ts.net (132.20.31.150.dy.iij4u.or.jp. [150.31.20.132])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebadfa82sm8023593a91.8.2026.10.26.04.10.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:10:36 -0700 (PDT)
From: Antoine Pichot <antoine.pichot@gmail.com>
To: linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com,
	mchehab@kernel.org,
	djrscally@gmail.com,
	dan.scally@ideasonboard.com,
	hansg@kernel.org,
	andriy.shevchenko@linux.intel.com,
	linux-kernel@vger.kernel.org,
	Antoine Pichot <antoine.pichot@gmail.com>
Subject: [PATCH 0/7] media: i2c: ov7251: fixes and infrared strobe for Surface Book 2
Date: Mon, 26 Oct 2026 20:10:25 +0900
Message-ID: <20261026111032.88355-1-antoine.pichot@gmail.com>
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

Patches 1 to 3 fix bugs found while testing on this machine, patch 4
adds the placement controls:

- 1: the link frequency index is taken from the firmware list instead
  of the driver's table, so the sensor runs at 240 MHz while
  ipu-bridge asks for 319.2 MHz (Fixes, Cc stable).
- 2: the 60 and 90 fps frame intervals are accepted but the sensor
  keeps streaming at 30 fps, the vertical blanking control not being
  updated (Fixes, Cc stable).
- 3: control events, the one v4l2-compliance failure on the sensor.
- 4: orientation and rotation controls from firmware.

Patches 5 and 6 add the emitter. 5 moves the strobe registers, which
the three mode tables write identically, out of the tables without
functional change. 6 adds a V4L2_CID_FLASH_STROBE_OE control that
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
dark ones by brightness; the dark frames give it the ambient-light
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

Patch 7 makes ipu-bridge report a rotation of 90 degrees for the
infrared sensor, whose frames show an upright scene turned 90 degrees
clockwise while the firmware says 0. It adds a DMI quirk table next to
the existing one for upside-down sensors. A user-space project for the
Surface Book 3 rotates that model's infrared frames by 90 degrees as
well [3]; the quirk covers only the Book 2, the one checked.

[1] https://github.com/linux-surface/linux-surface/issues/739
[2] https://github.com/linux-surface/linux-surface/pull/2252
[3] https://github.com/linux-surface/linux-surface/pull/2289

Tested on a Surface Book 2 (i7-8650U) with the series built out of
tree against linux-surface 7.2.12 (test suite, logs and a v4l2loopback
bridge for applications: https://github.com/antoine79/surface-ir-camera):

- link frequency 319200000, pixel rate 63840000, 30.01 fps unchanged
- v4l2-compliance -u on the sensor: 0 failures (was 1)
- --set-subdev-fps 60 / 90: 60.16 / 90.45 fps measured (was 30.01)
- orientation front, rotation 90 (0 before patch 7); the colour sensors
  still report 180
- dark frames and the sensor test pattern unchanged after patch 5
- strobe span read back while streaming: 504 lines at exposure 504,
  776 at exposure 1704 (30 fps), 258 at exposure 552 (90 fps)
- mean pixel value of an indoor infrared frame at analogue gain 128:
  19 unlit; with the strobe enabled the lit frames read 496 at
  exposure 504 and 587 at 1704, the dark frames in between 18 to 20
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

Antoine Pichot (7):
  media: i2c: ov7251: Fix link frequency index
  media: i2c: ov7251: Reset vblank when the frame interval changes
  media: i2c: ov7251: Add control event support
  media: i2c: ov7251: Add orientation and rotation controls
  media: i2c: ov7251: Move the strobe registers out of the mode tables
  media: i2c: ov7251: Add strobe output enable control
  media: ipu-bridge: Add a 90 degree rotation quirk for Surface Book 2

 drivers/media/i2c/ov7251.c           | 203 ++++++++++++++++++++++++-----------
 drivers/media/pci/intel/ipu-bridge.c |  22 ++++
 2 files changed, 161 insertions(+), 64 deletions(-)

-- 
2.53.0

