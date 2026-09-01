Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0991F4746AD
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 09:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788253634; cv=none; b=n++6Wt+E0ZSagrpSJD/MS8yhoLLgjB5nsSpPX9qs/YUBmlFZzafgvojvnwbmhKRGwIU/Gi8DResoI38pcK2jpoGq3t9AmS1usT1f7B9DLnictTxg5uaIBNK5GbDo2WA1C8z9pz8lK8zgjKi9eWtV+b2dPZIGWJj42gTmtStzzgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788253634; c=relaxed/simple;
	bh=KWS0qVrGpOsvoNy7qxR7gT9hQp3vkI+YvKFFNlJfdf8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=qFc6ShXbO1jluODgGquX17SlaiyiM0rIDWKPnnAjklzrnq188C9670B7GD7FJclt7BkkKsZCqv1mo1/ZRzGTpFGKJ8bZxcEJajCBgonurBzRf51uELfxhkLI9L0pdTa366g9O1xagJAJ1cMgkPXgFJr47KdVX47vVtRNv8WRSW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mpSnkIhN; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mpSnkIhN"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-482f9309813so616297f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 02:07:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788253627; x=1788858427; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c6JVpdNX+i8hXfN4+EjgY57DVGT9gcshxSwIwwCoROE=;
        b=mpSnkIhNzcQJrLMIZXVBeWY3STrqr/fpvL+fa/cbqFRltT8Jk2i5DJJcR8fZ2o9w8f
         sPscbWrh3sbjzr0kRxdIw6qH7Js0QdSszDRq8EGhnqfKB22ukqhuhDNLMsHJeu07vQrf
         ydG43rEh5ReLDJ0aTp44FXdmjmOrHR32u8f60YkatmPuGq8d38FCJz1q6YXngaDZ8vpQ
         oZRMlPZn3GtGloBm1R9ywwu/7GZUGaOMJjr+HVRUnoMV68YtHw4avsLJ+GFfHAjig9qp
         Pc4KGsukUuB4iKS40rJgEDEsoMydHZG/bjwBMMuNY5bEzwmui6p5EexEhgxB2VcTIUTz
         nyAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788253627; x=1788858427;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=c6JVpdNX+i8hXfN4+EjgY57DVGT9gcshxSwIwwCoROE=;
        b=RcJeId/NRxQQL3u2Z1NXA48a61TB0sMVKRXeenEKxXgKqkrUVhrJZalA2gLAkdMEjz
         njsOYskiP5MSkct173NTeFgYw4g+rEMXvTs7osyp/n0WngW6c8pKFFRPNQtDlW3wANgv
         YyqhsJYi34HJ641oFBJEbEITjBca93aDQXmM7YT/w8l5DzD5EN/OEd7THeCpEKK9f9xb
         U4t5VTioYI+sLPVUkBcp+fweolrG11lM+3DFADDgawrCz16DRrXrDjbzoskyJS9PkvEH
         fs0y0yJiHY6rteV3Of+zs03eqTyxUqQMQMWYX++mjzmVLsgCXZbivUPIPI2rKAusqN9E
         DIdg==
X-Forwarded-Encrypted: i=1; AKwUvBwEELAae84iAxjFZxbpuM8dgtc9lBPGwFgwp2/ih13knjWtgKwZ3/cgx5aFalFtLw2lcdQXqHBU8CoJ1ms=@vger.kernel.org
X-Gm-Message-State: AFuF++k9nQUJXXhjVviYzKPfrKCj4WwZ3RZxgQ2ko9AS6d7Sbzc8Gjiv
	xNYA+d5VcZM/e4TM5NESaHt7Uf7P0pNbexdbFgrYci1BdCCezhfcvLzm
X-Gm-Gg: AYBFou0owbSgaC1fix/pANhQjIefXWgiG5NhSUw2dvCMtJAzfX2YhS5tnwKZg/FAQOS
	rnAhRLJinqJq+KI0MwdKoRNgnZW/zzxo8uEtUeGOUjYD9lNTqtr+iKsJZfMt+bd++t3TDiXy06o
	okGQjgigy5BDwX+BYIxC2SIrvS8jxZGpOBB+vHIDHdcNAPB0vlUe/ou049X8qe22eifnw1jKcEe
	3ZkbZYdNNr6qgiJiTABH7ul0Sa7+K4EvpRYOsPo01hK25G1mz3w1GqC0i+y6FPkO4RqQqWLr2t3
	jhvBrCA3fM6aZ+U2O7D/H3BPPmGdSSOlv50xnlb/oLmzuMf9ZDZ3c/MeHah6DmN0D28CFc29aKm
	ipkZranwtL49skSC5Jx0BXjc9Jjj5L5Nxtps4B4K+2b2ioleEZRuzJZmcDBre+8WG/+d/tfcoXt
	bXF+j6olZS5dc13/oY+TCPd1zvH2mE8hlVdyufBJUswKNSzkZ9U4RwjmgLiaAc1v9TvJh+M4YEy
	9STq7wjNp0CKZtW
X-Received: by 2002:a05:6000:27c1:b0:482:de48:c445 with SMTP id ffacd0b85a97d-482f79b36d4mr46780042f8f.11.1788253626636;
        Tue, 01 Sep 2026 02:07:06 -0700 (PDT)
Received: from cachyos ([41.142.112.134])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48442d6e905sm3124471f8f.23.2026.09.01.02.07.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 02:07:05 -0700 (PDT)
From: =?UTF-8?q?Isma=C3=AFl=20Bahloul?= <i.bahloul01@gmail.com>
To: linux-sound@vger.kernel.org
Cc: linux-usb@vger.kernel.org,
	alsa-devel@alsa-project.org,
	perex@perex.cz,
	tiwai@suse.com,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Isma=C3=AFl=20Bahloul?= <i.bahloul01@gmail.com>
Subject: [RFC PATCH v2 0/4] ALSA: usb: add RME Babyface Pro FS driver (proprietary mode)
Date: Tue,  1 Sep 2026 10:06:31 +0100
Message-ID: <20260901090635.9208-1-i.bahloul01@gmail.com>
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

Changes since v1:

 - Split into a 4-patch series (core+PCM / mixer / front panel / DSP EQ),
   per Takashi's note that splitting would help review. Each patch builds
   on its own; the control surface in [1/4] is stubbed so the module
   links at every step.
 - Clarified the volume model: the system volume is PipeWire's host-side
   software gain (no hardware write), matching Windows. The only
   in-kernel volume work is the dB TLV metadata and the register-law
   mapping for the non-1 dB hardware steps.
 - Fixed the 32-bit ARM build (undefined refs to __aeabi_ldivmod /
   __aeabi_uldivmod) by switching to div_u64/div_s64/div64_s64 from
   <linux/math64.h>. Reported-by/Closes from the kernel test robot.
 - Added an Assisted-by tag disclosing LLM assistance, per your request.

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
  ALSA: usb: add RME Babyface Pro FS driver (proprietary mode) — core +
    PCM
  ALSA: usb: babyface-pro: add the mixer control surface
  ALSA: usb: babyface-pro: add the front-panel poll + controls
  ALSA: usb: babyface-pro: add the hardware DSP EQ

 MAINTAINERS                             |    6 +
 sound/usb/Kconfig                       |   18 +
 sound/usb/Makefile                      |    2 +-
 sound/usb/babyfacepro/Makefile          |    2 +
 sound/usb/babyfacepro/babyfacepro-ctl.c | 2853 +++++++++++++++++++++++
 sound/usb/babyfacepro/babyfacepro.c     | 1451 ++++++++++++
 sound/usb/babyfacepro/babyfacepro.h     |  391 ++++
 7 files changed, 4722 insertions(+), 1 deletion(-)
 create mode 100644 sound/usb/babyfacepro/Makefile
 create mode 100644 sound/usb/babyfacepro/babyfacepro-ctl.c
 create mode 100644 sound/usb/babyfacepro/babyfacepro.c
 create mode 100644 sound/usb/babyfacepro/babyfacepro.h

-- 
2.55.0

