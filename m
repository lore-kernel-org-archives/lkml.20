Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50CA342AFAA
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 10:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788343894; cv=none; b=DJk4LEKK3w0Zqzn6L2rDUOSbQRmRiwHfzO7RTkOSNSNaGKkGZlcppR0iBbIwFD8On8Diufpnr5zYs5ZLjwxx34JjkAHdlQy7CloNGrr1cbEVdncY8unzaC/oLD5jfcBe2tMDJtyCJwd4V9jHcfsLCI5qyawTklgGhgl44fZPSTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788343894; c=relaxed/simple;
	bh=QMrav2+9ybfX5GPSz+vybqujK13g3lwndAAEXHSVXdM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Mm7LVnySkKI7JOnmhRcSl+1RjgsUflw81BFcWLcyowBjaYohL0QIp5vj+1zEUGOikcAnjNOry2zedJu29bCKiIDJkCm0kZkfQlwvQf1RxtoA41tYDIbZMk4Y2x1GVSGxAdQab12ClU8XO0z+2h07ZlJ9ZInfQ5mB//iXnTMQtf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b4aEAI+4; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b4aEAI+4"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-49b0d78a801so6439025e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 03:11:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788343890; x=1788948690; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=91cnZApvNoI+zKze1q0BxdhUppHXuOBLM133qnSfj40=;
        b=b4aEAI+4n4L46HaKJ6U5dYuwNRUTY54OvpvmiHLh8af/1OfErRA92dLpogtROJ2OyO
         IF3eX1SjtuIW/XCd+jkfB0S4Kl6UnnoV3C3ALbjxcx/eAy+PwGEQN3rkjm3WfdwFl3DN
         Qou5Gdyb3pIo7L2V/d3+FFyTkV2f+VjYqFwIeEWbqZS5sfn5AsrbhAkBQ/1vMpzv5TAf
         P9bJmZ8L4j6hA6PVFsz1S5kW6xDzJJshqpJr2+gJs4XkY0JlstDThEmq7mEWRqMTvWWa
         igD4SQBNVMj8aBzGFuGxoCLNz/xbxhhYvYHbdYzeKpe+CUzO/6we8pWZBJAa2UxVoSPa
         Febw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788343890; x=1788948690;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=91cnZApvNoI+zKze1q0BxdhUppHXuOBLM133qnSfj40=;
        b=OLxF0510EhD52X368DM9HXZ1Lt+GcRAkIIJ5IIhDO0i2Hg/H7wKkt4X8PMcBQrHxET
         MGQiA2iY2uRPYchvriFwnAN6wf7bIbakIYaVpTmeEyO3MSudaxN6IoO6J6WWG54cfn3H
         QJLC3ktfzLsu5uAcS6TSPbELh/Y/Q0ZIQsfLl4LJ7gqNXTa0yi/5oVBjQUBUYti59zz0
         WVli8R0h8qvMTqK2PJ6oT4KD2eK3noHKzKa/5NvBIGCQaA6RRZnjeXk037+owviB0gVI
         3ZVu56NHZCYOghe3N9SG524JKU2ZjmOgg21PZNOoOumyndJr2AyMW+KLeUVoWdznqyal
         Qm7A==
X-Forwarded-Encrypted: i=1; AHgh+Ro4szqWObz0V+1ohz7b3io4JTend+Fa0pqeo1irWHtKedH8E0seqX/A/8BJncLcaXvVp+xg70uYWCkhgWw=@vger.kernel.org
X-Gm-Message-State: AFuF++kcGuIETIc6Or1VR67kAgwFz6HIOLHJPoF/NiT15GCCmJMpq2+k
	m7uqY6ZXOp2Fjw99475b3abLli2idl+bJNokvpGAPZrm/UUiL3wc7K/9
X-Gm-Gg: AR+sD12qVb7sVQJws7k3OGU0wSUBr4pYdnXMpSg2wW9Qzdm5/bxWPJeJJavaP5FXqHS
	xCliSOgv+oKeX72mfte45jsSvoJOeCjvIibbwQZKKW9ll7BhbO/OSRs+yRsoKfIZWrnueBhnAQv
	7uQdLS0M2kjyRc+2WVNk59++BZo9qZ9hax5n6geQDPpiIXmQoJo24124WBTJ+D5G5sMDv7KoePJ
	Ejx5ovk3cbM8auAqTNANkduKPchbm/AXQ2mYEiwxL/RkIiMqxNwDjTO9aI2mu1KHs9tgJySWxik
	8kUin2Qndgcsm7QZzYJGmlyIXJRpZCjT/TbwAfOJrw70hJ4G+S2qGmvvQskzMqfApeXDJ995h3O
	vK9hLnUHx9jrqa0jhN5+7akmH1v8Uai/zIk25BtjYP13Jd9WfYIrQzQiEP/6QH2iHA9Rba2XZid
	H108NKto35YFHrH/FZ+ttjj7Tg+8f1M1mjaOz4e7osVR/VWPMrc8OFyVJ+RmaAItBcjle+YNoeO
	MIhKpkGpu3tAIce
X-Received: by 2002:a05:600c:6992:b0:49a:a101:4157 with SMTP id 5b1f17b1804b1-49ce58034admr69502135e9.7.1788343889339;
        Wed, 02 Sep 2026 03:11:29 -0700 (PDT)
Received: from cachyos ([196.77.120.180])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce47885b1sm57294265e9.14.2026.09.02.03.11.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 03:11:28 -0700 (PDT)
From: =?UTF-8?q?Isma=C3=AFl=20Bahloul?= <i.bahloul01@gmail.com>
To: linux-sound@vger.kernel.org
Cc: linux-usb@vger.kernel.org,
	alsa-devel@alsa-project.org,
	perex@perex.cz,
	tiwai@suse.com,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Isma=C3=AFl=20Bahloul?= <i.bahloul01@gmail.com>
Subject: [RFC PATCH v3 0/4] ALSA: usb: add RME Babyface Pro FS driver (proprietary mode)
Date: Wed,  2 Sep 2026 11:11:13 +0100
Message-ID: <20260902101117.11671-1-i.bahloul01@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

Changes since v2 (thanks Takashi for the review):

 - Removed the Reported-by/Closes tags from the commits (they belong on
   follow-up fixes to an applied patch, not a fresh submission).
 - Added the missing SPDX tag to the babyfacepro/Makefile.
 - Converted all comments to plain ASCII (the fancy unicode dashes,
   arrows and separators are gone).
 - Named the control-transfer timeout (BF_CTL_TIMEOUT) instead of the
   magic 1000.
 - Defined the crosspoint L/R register offsets (BF_CROSS_L/R_FIRST/LAST)
   instead of the hard-coded 4..23 loop bounds.
 - Factored the per-transaction flag-cycle write into
   bf_vendor_write_cycle(), used in bf_crosspoint_clear_cross().
 - Switched the PCM format from S24_LE to S32_LE with 24 msbits: the
   device word is copied as-is (24 valid bits left-justified), no byte
   shifting.  A standard, simpler format for user-space.
 - Rewrote the playback-frames clamp comment (the logic is unchanged:
   never read past appl_ptr) and added a big-picture comment above
   babyface_stream_work() explaining the stream_users / stream_work
   model.

I'm sending this as an RFC for a driver I've been working on for the
RME Babyface Pro FS in its proprietary USB mode (VID 0x2a39, PID
0x3fc0). In that mode the PCM stream runs on interrupt endpoints
(interface 5, ep 0x01 OUT / 0x82 IN) instead of the class-compliant
isochronous path, so it can't be handled as a quirk on top of
snd-usb-audio. It needs a standalone driver, and I modeled it on
snd-usb-caiaq, which is the existing in-tree precedent for
interrupt-based USB audio streaming. The driver is hardware-validated
on a real unit and the code is checkpatch, sparse and W=1 clean.

The vendor protocol (control requests, register map, front-panel
readback) was reverse-engineered from Windows USB captures and
verified bit by bit on hardware. The capture analysis, the calibrated
laws, and a userspace reference implementation live in the sibling
TuxMix repo (https://github.com/ismail-bahloul/TuxMix). This driver is
the kernel side of that effort.

What's included:

 - Interrupt-URB PCM streaming, full-duplex, 2-12 channels, S24_LE,
   9 sample rates from 32 to 192 kHz across 3 USB bandwidth classes.
 - ALSA mixer: 6 output masters and mutes, the 6x14 crosspoint routing
   matrix, 4 mic/instrument preamp gains with phantom power and PAD,
   pitch/varispeed, loopback, and a few device-specific toggles
   (AN 1>2, input link, MS processor, DIM, width, FX send).
 - Front-panel emulation. The unit has no onboard DSP for its own
   panel, so the host mirrors TotalMix's role: it translates physical
   wheel/button events into mixer writes and exposes the decoded panel
   state as read-only ALSA controls.
 - A hardware 3-band plus low-cut parametric EQ for the 4 analog-input
   strips, computed in fixed-point (no FPU use) and uploaded as
   coefficient blocks.
 - Mixer-state persistence across interface re-probes and system
   suspend/resume, because the firmware has no state readback of its
   own.

Validation: a full-duplex sweep across the whole rate x period matrix
with a signal-integrity tap, start/stop stress (30 cycles), mixer-state
restore across an interface unbind/rebind, and a mid-stream disconnect.
All of that runs through the automated regression suite kept in the
driver's development tree.

Known limitations, stated up front:

 - USB autosuspend is not supported yet. I disable it explicitly
   (usb_disable_autosuspend at probe, balanced at disconnect) rather
   than ship something untested. The front-panel poll and keepalive
   work items run continuously, and nothing pairs usb_autopm_get/put
   around the stream, so an autosuspend request could race a live
   stream. S3 suspend/resume works and is tested. Full autosuspend
   (pausing the panel/keepalive work plus autopm pairing) is a
   follow-up.
 - A few protocol items aren't fully pinned down, but they don't affect
   the shipped controls; the relevant paths are hardware-verified. They
   are documented as open in PROTOCOL.md: the preamp readback index
   semantics (0x003F vs 0x0000), a width strip-ownership edge case, and
   the exact high-frequency warping of the EQ coefficient computation
   versus TotalMix's curve.
 - The latency profile is selected at load time via the frames_per_urb
   and nurbs module params. Default is 256 frames/URB, matching
   TotalMix's 256-sample buffer; frames_per_urb=16 nurbs=16 gives a
   0.33 ms monitoring-grade floor. Changing profile currently means a
   module reload. A runtime reconfiguration (like RME's own Fireface
   USB Settings panel) is a post-merge follow-up.

This is an RFC. I'm mainly after feedback on the interrupt-URB PCM
design, the control naming and topology, the subdirectory layout
(sound/usb/babyfacepro/), and the two-file structure.

Per your note that splitting would help review, I've submitted this as
a 4-patch series instead of one big patch. Each patch builds on its own
(verified in-tree against linux-next):

 - [1/4] core driver + PCM streaming (control surface stubbed)
 - [2/4] the ALSA mixer (masters, crosspoints, gains, flags)
 - [3/4] the front-panel poll + controls
 - [4/4] the hardware DSP EQ

The control surface in [1/4] is stubbed (not shipped as written) purely
so the module links at each step; the final patch lands at the complete
driver. Happy to re-cut the boundaries if you'd prefer a different
granularity.

Disclosure: the reverse-engineering (decoding the Windows USB
captures, magic packets, and the hardware/front-panel behavior) and
the substantial portions of the kernel implementation were written
with heavy assistance from an AI coding assistant (DeepSeek V4 Flash,
credited per patch as Assisted-by). The code was additionally re-
reviewed by a separate AI pass for correctness and security issues.
All of it was then verified by hand on real hardware; the human
author remains responsible for the result via Signed-off-by.

Thanks for reading,
Ismaïl

Ismaïl Bahloul (4):
  ALSA: usb: add RME Babyface Pro FS driver (proprietary mode) - core +
    PCM
  ALSA: usb: babyface-pro: add the mixer control surface
  ALSA: usb: babyface-pro: add the front-panel poll + controls
  ALSA: usb: babyface-pro: add the hardware DSP EQ

 MAINTAINERS                             |    6 +
 sound/usb/Kconfig                       |   18 +
 sound/usb/Makefile                      |    2 +-
 sound/usb/babyfacepro/Makefile          |    3 +
 sound/usb/babyfacepro/babyfacepro-ctl.c | 2853 +++++++++++++++++++++++
 sound/usb/babyfacepro/babyfacepro.c     | 1488 ++++++++++++
 sound/usb/babyfacepro/babyfacepro.h     |  402 ++++
 7 files changed, 4771 insertions(+), 1 deletion(-)
 create mode 100644 sound/usb/babyfacepro/Makefile
 create mode 100644 sound/usb/babyfacepro/babyfacepro-ctl.c
 create mode 100644 sound/usb/babyfacepro/babyfacepro.c
 create mode 100644 sound/usb/babyfacepro/babyfacepro.h

-- 
2.55.0

