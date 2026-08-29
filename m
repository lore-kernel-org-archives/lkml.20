Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 313F42620DE
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 10:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787997824; cv=none; b=pYofWyC5wnPMQMXIMNGy/ETOAjAdWBpAQJx8mOoyJFmbcvyM7iHG1EJVKukOWJB1MCJcyDIJMnWgpiSd3vUqUG3HG35+KghIznNsSUEUuk+VYWv40JF672ASUDIkedEDXZg+heTYqYm+fsEP8iSy6fGe48w6GolLyprT32gj+1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787997824; c=relaxed/simple;
	bh=ZJlPTeTkTl84V1BFFYQh/dfDP2K84VCKo6miLZPZcR8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=DSTSsf0X0fNVXX7j4ao+fdtcKof1Ugk/UnLmZQCSTPUYWXOGfVuQ5x5vp2t53QrjHy9jMzvVt4EXdTdfckVRbcOB75q7GHYCwil6VcTTGrqVyIlWrNuKmIvojg6d3mC7MlnRSOxlc+7F3K6/eMeB958mAZsglmkkTuzirkCYBAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AXmuo9yw; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AXmuo9yw"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4980fe6b3beso18214765e9.0
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 03:03:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787997821; x=1788602621; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u/rWH3ByeNUWPLygXnrE3S/P4geWzis3M/3IKa9BnQc=;
        b=AXmuo9yw1xi7QnralWCWWL91ao7LA5q3BMMKyzCRiOZsb1PxLivBAG/Gf8RVrCAH0S
         OImv7Z+4ptpKEkeidyjBKBZpJdv5qf7Xlsdabx3HqkWqV6fVAJ0b1LPbXZMLxY4BD7gz
         bRoX1EgARET53waQ7StTkaR3cBMOOtjQFbtZnFULMkn3nLlF+aij5aF5fYHEswgfPr2+
         2rJ/7Sf9fnlbBT189LtDC8w/vKKKqTaxSc65DM5h6p8cRnh0zRu/oTFB5hDI6k1Wdq4I
         kNBpJsx+jSAxpZFlnyV7TlK88Cotbh8OUt1hCcV/B3bZOXqQjNTctu/2NbQi4/B9eAbH
         GrYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787997821; x=1788602621;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=u/rWH3ByeNUWPLygXnrE3S/P4geWzis3M/3IKa9BnQc=;
        b=fGJcrV9RE7WlKbfasrdZK0nCxlG5RjaFCfsls2MV7EeXtZa0oLBDL5k800IPIo0l6n
         r17eedOX8dc3WbFwLKV6f0FYWnVjW32eStejPfWgtS75Mp8pBTQvEn14IfafULZiDlD0
         CB2YDIv3dqU37sitj61AKWemb6fnWjoHP2H+Bo050Fs1OL3eYk6VsteKUeSdokMYRx4L
         +/dKHh29eXHeVZPtZ9XPIj7j2Ok9JnJoMQN6E5WnALACKcGwVGVXgdFa0/jvb5DRCp8N
         rO5qQ0rxnqXY6sBN0FXmoKnlX3MgzKNaIJEwKNaqlHTF/K/5WrdnYAfsk1SBs6umzLCO
         2ErA==
X-Forwarded-Encrypted: i=1; AHgh+RrWJz5LRiR+SRVtc5+NlNty6JtUAsTzRw9NakhqoXTU6PhRtOHnQD+96f/s3DWMUFbdgB2Jiamw4h62EqY=@vger.kernel.org
X-Gm-Message-State: AFuF++k5i8kufC1fltUkvDrb3mQBw+IamLX6tIV0UOMcfB8CmybfdQEh
	J42HpWD1SbiWNp0S+p/C+8h6+p58fJGD8MhsVwoX3VOebu7n7NWNf6PN
X-Gm-Gg: AR+sD12rAfrX++tV0gCgiUWkPHjzfVwY3E/O6qwPZ2gvyONuApd0K0AbO/F9YAysBZf
	hHoQHYVBvjngkoCMATXDG/PSE+Hw0jRU8VMRj5SKbBu3J/2IIZyjO14LpgQ5B+tVFuvpFvyuNUK
	Dof9vF9NeZo9Ttsc2r61guJhkJo7qqi3iW5xSLxJuYFScCwUvN3PxmlmKVlSqcDoGGYyTsRdlSr
	WUOMcbVoeNuO0RmURwAQoQpYYvamh6iB1A8IXslCQHNaH3rp8j/cjhTQ3nRIMl5ThI3+YKPi95t
	oVmRZ7q2KgsIEmAxbMogqEBfz17gIixADOqku7HO8G6KYfiZOu8qwld2LUOhES0HC/Yk7SReND4
	V4BXiFf8127VpAi7Yg4FNbMY5a+2fA53j4S9L2Yn4G6W8erYsSyvEcRWP+G6rN03403gEj29lc/
	Y8mg0HVfKtb4ZOzxIDSMxHhyTN0fu9KuqWM7gImHNfKllKOuJyofLc7K+mw7yr6CVNbXP0t3xJG
	CVGj/vNEK4lk9PHb+aa6duBrUmh
X-Received: by 2002:a05:600c:c4a7:b0:495:5d6d:9cc1 with SMTP id 5b1f17b1804b1-49cca26ceeemr79124365e9.0.1787997821309;
        Sat, 29 Aug 2026 03:03:41 -0700 (PDT)
Received: from cachyos ([105.158.202.217])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cca1ed292sm66211735e9.8.2026.08.29.03.03.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 03:03:40 -0700 (PDT)
From: =?UTF-8?q?Isma=C3=AFl=20Bahloul?= <i.bahloul01@gmail.com>
To: linux-sound@vger.kernel.org
Cc: linux-usb@vger.kernel.org,
	alsa-devel@alsa-project.org,
	perex@perex.cz,
	tiwai@suse.com,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Isma=C3=AFl=20Bahloul?= <i.bahloul01@gmail.com>
Subject: [RFC PATCH 0/1] RME Babyface Pro FS driver (proprietary mode)
Date: Sat, 29 Aug 2026 11:03:32 +0100
Message-ID: <20260829100333.32933-1-i.bahloul01@gmail.com>
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
design, the control naming and topology, the two-file split, and
whether a subdirectory (sound/usb/babyfacepro/) is the right layout.
I sent it as a single patch (4651 lines, 7 files) because that's how a
wholesale new-driver addition is usually submitted, but I can split it
into a series if that's preferred.

Thanks for reading,
Ismaïl

Ismaïl Bahloul (1):
  ALSA: usb: add RME Babyface Pro FS driver (proprietary mode)

 MAINTAINERS                             |    6 +
 sound/usb/Kconfig                       |   18 +
 sound/usb/Makefile                      |    2 +-
 sound/usb/babyfacepro/Makefile          |    2 +
 sound/usb/babyfacepro/babyfacepro-ctl.c | 2782 +++++++++++++++++++++++
 sound/usb/babyfacepro/babyfacepro.c     | 1449 ++++++++++++
 sound/usb/babyfacepro/babyfacepro.h     |  391 ++++
 7 files changed, 4649 insertions(+), 1 deletion(-)
 create mode 100644 sound/usb/babyfacepro/Makefile
 create mode 100644 sound/usb/babyfacepro/babyfacepro-ctl.c
 create mode 100644 sound/usb/babyfacepro/babyfacepro.c
 create mode 100644 sound/usb/babyfacepro/babyfacepro.h

-- 
2.55.0

