Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 845E0459AD9
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 19:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791056531; cv=none; b=Al7DD7PFIIQDX9vRFol98tA8z3q6IuKnluyvGH4fKWDeIMhC6wWjjvY0C/S4+uGyIZ0LxyzghQB665QYIrYgIhRZYSGOdEV0fc15X4Ao12e7GSCqHVYJ/2mTU5tWkX/cQGE51YKymdbNe9u6X3Q5sKwj5zvYcKjNooTxKK0F9mE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791056531; c=relaxed/simple;
	bh=/iDGyIPoKrBXhqTX+xBXowT9bq0uWZA7SUBkTYlzxzo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=qSZJlu3Eh7KpRGFSyTbfa3I5w2qCj7Qu7MZF9b6KEWwvDalj+U1HuQr8M1Ft8Q/n7SJpqwf1KoNlmhvrjcJSYBVEO45pA1Fk+WBBYmr3mCNBCtNV0hP5eMmDaYGxutiX6NGygpGKNL+qIwOEwT3CHrlZkvc0fcmphsiARufURjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JUqy0wM2; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JUqy0wM2"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ffe281cb1so4942855e9.1
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 12:42:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791056527; x=1791661327; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7tsAe5aIFshgubUUdqgrKg7NfoQD6aHl738yHlYnd58=;
        b=JUqy0wM22EJH7h1+TWQbq11h/xHpLjegnNb+zKSu7rrvdG+OQVImeejv2J/Yl1QHvC
         ILq+V9McDdGrAO3kTr2SUF097rbt1TG/hahE3CnriioNDrT9WBpRbGs/SSl70yK9hcAv
         CuWZSoMr3b8H9cdVRe3TblYFz1aN0INEUfDFNjwY96az9+aI4aGnNXgFHdaVLUO71AcI
         c7GomFgbngzOKqlPeGiOXEtqA6OOxcN0Mu94+ZxdPZe44+vxS3qqMZNa9lK0rk4djttP
         QDw6TqRhV3qxCrqXnpbgkgi1iqD+WHsbGNjjMl1gfU/Mk6qd9RPVqZvrdJTreRspc4wf
         z1Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791056527; x=1791661327;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7tsAe5aIFshgubUUdqgrKg7NfoQD6aHl738yHlYnd58=;
        b=X/5aXoUbiuzI2wU1RXht7BvvY4Z5vXGbJSNcEHtr/v/sWj1dRLwPUSwqWVVmO+AbF8
         2DCOS3cMcjw36zDI5GtiCvR/A6r5Zb+IGkJQAlIYonU2RqWZyBr/XV04czkpfXAuvRSN
         lE14Y/bB8jIIzjj6b4DL2AR28O4eXi2LW3SW1uhR4/G91Kvjie+A0uze4dmpTyJ9wxi1
         3x5rZteOQIDjG3M+6Fjw5CEYr8f2XcbvEEZRfUeIHhViFHPccBpNx9kgW7DezyiDBBsD
         9uRjuSTYs71KJnW419ZPrMGlrXJkPQ3hyyoH6dP43OV9hl5OE/UJCSPNd4QeWQHDXPiT
         yZpw==
X-Forwarded-Encrypted: i=1; AKwUvByHxRQDYoxybZKEDQzSBLIGIzBolOt2RWzn+d9P5fhGq734+8yCwnQnc3SI/ZJL7RHF7h+FjUfouMnvX78=@vger.kernel.org
X-Gm-Message-State: AFuF++k9G0x3IBCdgb8kg5zy90FuJKCUf3/x8cfALK/cXNcoWC3mDMh2
	XGzfY5HeHFZrNMMqf+CHEL8NHds9xWzcf80yFVT4nsVkj5TzE0ZQu/4q
X-Gm-Gg: AYBFou1WBSh8zO1tzHUMF7HwCf7HmXBSwyPsM3ri2llD1WPnZfD1ZIz95ByxRYBkGSi
	eKPnF5LIaZp3uR5wqGzRcSdAlZbxaIvSEI/RreHskXJgWMYGxD1pZsu1PtfStxJIuULVAoPGVwF
	7TZvvIAQLihMH6+f3cGJyygqg8Y5y82f8wsS5Of7PCpmXpZk1ILSiN+jCunLC6gGfC2Vk17ohVt
	qC2CBfzhe1fHm755NhEur9ypSrg+3O7i/BfGtvC55OYMJACKOkXtFNlLBcLnsFTQbzl6IsYlNg9
	49OsMSlMxKExCmpGyLl5zdP0fI31KS9Mqpusr4HgeYvAZg+hsxtmvitWOSH/j+eNaORdKdOtXGh
	ds6Z5Y5EfioRBVeTF7dTIOdHi7MZ40wc+mJDugsKxeueH0JztOngr9Aagxzl6UK2JzHbka/cStc
	unDpgtwj/wXtB9ldPq2zi1srFfdjFq4fCp9ylLGGj12UF5mukyf18Fl1JeNpS4kVNc3LXVkb60o
	0dvONvHpftwCXq814TEgLZjBOd0OTAC4ukmjJVbvJv5kqBLWKKKB2XLCm1DLUZqbEUEIqmDDiT5
	KDXgZNodwpI4KOFspcn15u6v
X-Received: by 2002:a05:600c:8b88:b0:4a0:258a:b25c with SMTP id 5b1f17b1804b1-4a0276abde3mr103801915e9.29.1791056526607;
        Sat, 03 Oct 2026 12:42:06 -0700 (PDT)
Received: from cachyos.home (2a01cb0c82caf900a186612f304bfea5.ipv6.abo.wanadoo.fr. [2a01:cb0c:82ca:f900:a186:612f:304b:fea5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a162e867e8sm161520495e9.15.2026.10.03.12.42.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 12:42:06 -0700 (PDT)
From: =?UTF-8?q?Isma=C3=AFl=20Bahloul?= <i.bahloul01@gmail.com>
To: linux-sound@vger.kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	linux-usb@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	linux-doc@vger.kernel.org,
	=?UTF-8?q?Isma=C3=AFl=20Bahloul?= <i.bahloul01@gmail.com>
Subject: [RFC PATCH v6 0/8] ALSA: usb: add RME Babyface Pro driver (proprietary mode)
Date: Sat,  3 Oct 2026 21:41:29 +0200
Message-ID: <20261003194137.86176-1-i.bahloul01@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Takashi,

This is v6 of the RME Babyface Pro proprietary-mode driver.  The split
is the one you asked for in the v4 review and that v5 introduced: a
minimal core first, the mixer added piece by piece, suspend/resume near
the end, the front panel and the DSP EQ last, and a design document.
v6 keeps that split and folds in the work done since v5, most of it in
the stream core; it is rebased on next-20261002.

Changes since v5:

 - Stream sessions (patch 1, David Fredman).  A session now lives from
   the first prepare to the last hw_free; trigger START/STOP only
   gates the audio the URB handlers move, so an xrun restart no longer
   tears the session down.  A session start sends what the RME Windows
   driver sends (rate write, trigger pair, URBs, arm) instead of
   re-running the cold init and replaying the whole mixer state: about
   1 ms instead of about 1 s, and it waits until 50 ms have passed
   since the previous stop, since a session triggered within ~15 ms of
   the last one comes up silent.  After three consecutive bad URBs the
   handlers stop resubmitting; disconnect and suspend kill the URBs
   before cancelling the work their handlers queue; hw_params is
   refused once the device is gone; the handlers read the substream
   pointers under RCU.

 - The latency follows the application (patch 1, David Fredman).  The
   URBs are sized from the period in hw_params, two periods in flight,
   instead of a fixed 8 x 256 frames queue (42.7 ms at 48 kHz whatever
   buffer the application asked for).  While another application has
   the other direction set up it is offered the running rate and a
   period no shorter than the session's; the application that holds
   both directions may change the rate or the buffer size itself, as a
   DAW does from its settings.  The round trip through the analog path
   is now the queue, two periods, plus 66 to 184 frames, for example
   2.7 ms at a 32-frame period (64-frame buffer) and 48 kHz, where it
   was 44 ms.

 - runtime->delay (patch 1, David Fredman): the audio queued in the
   URBs plus a fixed delay for the converters and the device, per speed,
   taken from RME's own driver.  The capture figures at 96 and 192 kHz
   are estimates for the Pro FS.

 - mmap access (patch 1).  The ring the core allocates was never
   offered for mmap, so JACK, which needs it, could not open the card
   ("mmap-based access is not possible for the capture stream").  The
   URB handlers already copy to and from that ring and take the
   application's position from the shared control page, so offering
   MMAP and MMAP_VALID was enough.

 - Core fixes (patch 1): a failed probe no longer dereferences a NULL
   URB/DMA array in the unwind; a partially filled playback URB plays
   silence after the queued frames instead of the previous URB's audio.

 - Mixer (patches 2-4): a volume change no longer unmutes a muted
   output (David Fredman); the power-on default routes only the
   playback channels; the fader controls validate a value before
   narrowing it; a failed preamp write no longer leaves the cache
   claiming the new state; a re-applied DIM rebuilds its restore point.
   The saved-state list is purged after usb_deregister(), not before.

 - Front panel (patch 6): a DIM press is reported through a "DIM
   Button Press Count" control for a mixer application to act on,
   rather than the driver changing a level itself; the wheel ignores a
   muted output; the controls the panel changes (volume, gain, 48V,
   monitoring crosspoint) are notified (David Fredman for the first
   two).  The SELECT channel selection cannot be read, and the unit
   keeps one per IN pair across IN switches and power cycles, with the
   first press after an IN switch only showing it again.  v5 assumed it
   starts empty and steps from there, so SET and the wheel could act on
   a channel other than the lit one.  It is now one "Front Panel
   Selection" control per pair, which alsactl keeps across boots; a
   pair that was never told starts unknown and SET and the wheel do
   nothing on it rather than guess.  The state shared with the control
   callbacks is accessed with READ_ONCE/WRITE_ONCE, and the mixer state
   is saved at disconnect only after the poll has stopped.

 - DSP EQ (patch 7): the EQ is saved and re-uploaded across resume and
   a re-probe; an inactive band uploads a defined shared scale; the Q
   controls start at 1.0 instead of an out-of-range 0.

 - The split itself.  v5's patches 2-7 had lost the DIM restore-point
   update on a Phones volume change; it is back, in patch 4.  Resume
   now re-applies the routing flags, which v5 left out.  Phase, split
   and trim are re-applied after a re-probe from patch 3 on, where v5
   waited until patch 4.  No comment, Kconfig help text or MAINTAINERS
   entry refers to the series any more, and the MAINTAINERS entry lists
   linux-sound.

 - The frames_per_urb, nurbs, urb_frames_min and panel_poll_ms
   parameters are 0444: they are read once at probe.

 - The design document describes the current stream model, the
   period-driven URBs and the SELECT behaviour.

Every patch builds in-tree on its own against next-20261002 with W=1
and no warnings.  Run against the generated patch files, checkpatch
--strict reports no errors, four warnings and one check, all known
false positives: 'ang' (the CORDIC angle) twice and BIT() for a signed
Q27 constant in the EQ patch, and the "does MAINTAINERS need
updating?" note on the two patches that add files, which patch 1's
MAINTAINERS entry covers.

Validation, on a Babyface Pro FS with the final tree (built
out-of-tree against 7.2.8 from the same sources):

 - regress.sh --mixer-restore --disconnect-test, with the sweep at
   periods 64 to 2048 on all nine rates, passes 59/59 on a quiet
   machine; the same sweep with both streams opened for mmap access
   passes 56/56.  A first read/write run, made while I was running
   checkpatch on the same machine, had one playback xrun at 88.2 kHz
   and a 64-frame period; that point passed 12 of 12 repeats in both
   access modes.

 - Each of patches 1-7 was also loaded on its own and streamed full
   duplex (read/write at 48 kHz, mmap at 192 kHz) with no xrun and
   nothing in the kernel log; the card shows 0, 96, 119, 133, 133, 143
   and 203 controls after patches 1 to 7.

 - The real jackd 1.9.22, started with "jackd -d alsa -d hw:BabyfacePro
   -r 48000 -p 256 -n 2", fails with the mmap message on the module
   before patch 1's change and starts with it: 12 capture and 12
   playback ports, 20 s at periods of 64, 128 and 256 frames without an
   xrun, and a client's tone comes back on the card's internal playback
   tap at the expected level.  PipeWire opens the card with mmap access
   too, playback and capture together at a quantum of 256 and 48 kHz,
   with no errors.

 - The URB sizing: a single PCM session renegotiated through nine
   period/buffer configurations (64:128 to 2048:4096, including 100:200
   and 1000:3000) without an xrun, with the URB size and count chosen
   as described.  David Fredman measured it and the delay on an
   original Babyface Pro; his figures are in the PRs on the project
   page.  On the Pro FS, snd_pcm_delay() on the internal playback tap
   agrees with the model at 48 kHz to a constant 14 frames at periods
   of 64, 256 and 1024 (the tap leaves out the converters); the analog
   loopback check of the 96 and 192 kHz capture estimates has not been
   run.

 - Earlier, with v5's load-time profile (frames_per_urb=32 nurbs=8),
   two things were seen that are not understood: once a session at
   192 kHz came up with the device completing no URB (the next session
   was fine), and once the unit stopped completing URBs altogether
   until it was power-cycled - a module reload, a USB re-enumeration
   and a host reboot did not bring it back.  Neither has happened again,
   including at a 32-frame period with the period-driven sizing.  The
   default 256-frame sizing has shown neither.

Known limitations:

 - USB autosuspend is not supported; it is disabled at probe.  S3
   suspend/resume works.

 - The SELECT selection of an IN pair cannot be read from the unit.
   alsactl restores what the driver last knew, which is wrong only if
   the selection was changed while the driver was not running.

 - A few protocol details remain open (documented in the source, not
   blocking): the preamp readback index semantics, a width
   strip-ownership edge case, whether DIM's scope follows TotalMix's
   Main Out setting, and the exact high-frequency warping of the EQ
   coefficients against the vendor curve.

Disclosure: as with previous versions, the reverse-engineering and
substantial portions of the kernel implementation were written with
heavy assistance from AI coding assistants.  All of it was verified by
hand on real hardware; the human authors remain responsible for the
result via Signed-off-by.

Thanks,
Ismaïl

Ismaïl Bahloul (8):
  ALSA: usb: add RME Babyface Pro driver core (probe, PCM stream)
  ALSA: usb: babyfacepro: add output masters and crosspoint routing
  ALSA: usb: babyfacepro: add mic preamp, phantom/pad and input trim
  ALSA: usb: babyfacepro: add routing flags and varispeed pitch
  ALSA: usb: babyfacepro: add S3 suspend/resume
  ALSA: usb: babyfacepro: add the front-panel poll and controls
  ALSA: usb: babyfacepro: add the hardware DSP EQ
  Documentation: sound: add the Babyface Pro proprietary-mode design doc

 Documentation/sound/cards/babyface-pro.rst |  193 +
 Documentation/sound/cards/index.rst        |    1 +
 MAINTAINERS                                |    6 +
 sound/usb/Kconfig                          |   17 +
 sound/usb/Makefile                         |    2 +-
 sound/usb/babyfacepro/Makefile             |    4 +
 sound/usb/babyfacepro/babyfacepro-ctl.c    | 3929 ++++++++++++++++++++
 sound/usb/babyfacepro/babyfacepro.c        | 2076 +++++++++++
 sound/usb/babyfacepro/babyfacepro.h        |  579 +++
 9 files changed, 6806 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/sound/cards/babyface-pro.rst
 create mode 100644 sound/usb/babyfacepro/Makefile
 create mode 100644 sound/usb/babyfacepro/babyfacepro-ctl.c
 create mode 100644 sound/usb/babyfacepro/babyfacepro.c
 create mode 100644 sound/usb/babyfacepro/babyfacepro.h

-- 
2.56.0

