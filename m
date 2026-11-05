Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793891777;
	b=BiUF2t5P6s5fWin85EGKwsIK1rj1UzyHmmceHm8E6f/7QVv+XexgGbuWGVisoJZ/ai9/
	 s8pSz/aox3ePrMqa1hLHHK0IpFsdmMZqXeXIMv9i3jpfVEYJnRp2HBXROU/B2SwH3x5W4
	 L7uzu73c/UuPF6r233wewAIhoE4Iq5uv4FFUHKVn2Eg3dgFJsVfXhWHSH1cPoUtzz4dzX
	 tzdkfozI1BwO3bVKpdhv85ci5DQA5daP/tCRApkk+81+WzyCfmC04UJOuKLIG4XLCHoLK
	 Qs8A8hmy33ssNKGi4mxZdCCk5mCCqaa9rFqIAJQkK4YJUvlmkpJSc4n7eP/XM/00c2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793891777;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=brlEe7n5YmVtP+PzOtmThrNjzY6rvyClkX0L0c5JoWs=;
	b=YtX9VytUU7zLzF6L6z7BJkZBn3RvyfwJIxpHAJzvLzr6QphPRnxXFterfNhhcniytZ3l
	 CwRsfZsV6zYxFdiU8K3wmSFmqGvS7/z65mrBYm3ym7s/e2pOujx5aIoaUbdc9rrOBYCNt
	 8bRWYIOO70UswkEq31j/kaT6Svibw6Rh1l/dcqBH1YP2rFJk0/s+3sAd8NWZyfs+yR+Cj
	 17u3usqTZzpohhlPRq1dpGdZdph07Xq5iJP/WaBe1p1TIEObIOfGDuIMChEWPSWqiqOQ7
	 gFbEPNxEBtgMj5iN7lOAiN8tyyu/pqA9dWIIGKDaoxN3FGvp+0YRZzn7JwSnSH+VK0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lQFEA4PZ;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A290F606A326
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 15:16:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A290F606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lQFEA4PZ
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-36a0f27c9f4so3736118eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 07:16:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793891776; x=1794496576; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=brlEe7n5YmVtP+PzOtmThrNjzY6rvyClkX0L0c5JoWs=;
        b=lQFEA4PZlYH5Jkw3E6h/kn+kYuy3a6d2AdeepN2Bc+ItWJC9AtkbjtW9MW/lwOyt6q
         y2O0BdmOANt532dFsElev2f9Wx8BxOCjcu/CGh3EXsDJB2vyVWDI3QuhWrFZwQFBrPnO
         uUsmBsACJbzCTk+qBV+vzvjE8q05ftJWtj/qPOp+q9LaV+G+UpLlVTZM+tINCMBIifkL
         aIC28mXGLMUpY5FeO2P/f8SUXhH8hw5HIeyelDx+5ld89xDzG7ZkA4cn957EdBYWyvSS
         fwjbctKnq6LrgkKFiQIZA4733cNXkNqzw5E5ccCt3EkNi1x7VuHOveq13a9AhoUrZuey
         t+4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793891776; x=1794496576;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=brlEe7n5YmVtP+PzOtmThrNjzY6rvyClkX0L0c5JoWs=;
        b=ZvmJo4zcQQa2e8Oa2AzpdqPlG6C3jAzzhZjpS7O4su7L9xzdG/ZtOwuN71QTaSvApH
         0ou23y9uyD4LMMGOYo1wSnpiITBOavQtfAKWyaMQgBBtuNlyUN+qO+8V5VbbqL4CFxHv
         stjaDTXpRaEkR91RinlC8Wf7dbelpEUeQJhg5Z9/j9p6o0lJOGCTdUVJoKBjn4CBWPNy
         O1TQlUCRbeGX1sFmfM1MPqxBuuRzBWRRCT2bAk1/RAYmdf/gcbpMqxQxyz74jaMXAFuA
         j+zW0mHu3y3f99SYosYE9flCsVuNfMwoNIhhofJxefbe8TGZNC5JcXu2WmMlx7Ww5isQ
         a9/w==
X-Forwarded-Encrypted: i=1; AKwUvBz60FPaqnYkgU9O8gb6IHlbeGxsNRpqWkCZglwKJhvcfroVKl4qenNJqMnLJDUYWcKmFoyLsHpgXQMOfxc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/HqCRqDJLefmROfRE3BLQVdTIH+vUSFqnB103eFW16mBoZsDYY
	4CV+Ar1HHsJV85/jtlmPUoOT1FUBI1gUvThIJpXqHis1Ssy3kFxeEflr8pdjLWs18I8=
X-Gm-Gg: AYBFou3sMS4Tzi6Z8v0NktYOKMtZGLb14sIVhTRQi87FfneoTOIOXTx8a8uoUx6DvFT
	mrSOqKndREofqFELw0poAKyQ6AAFY8YNJkCz/wgE3CqUyODMgQlZjUuYzUE9tlC+82y0yiSdd8a
	infVZ8LmShYpVG38uVQtypbVjm40T/mffm4rRjW6u5olXx2yw9nFpXqZLdiGPR7MN2wRDUw7ni4
	ABMbpuCy9vCyOhiroaRjZoLpcXpKFvcXRgJ2UQQ8/p6tM+aGF5tm7ioJWtXDUppFWB0ooaf9/LP
	4Id8oXNlzE56PMtQvU0q0THHcyIzuDof0pv/LgVULcRnXQ7QEMF/a1ygXul5pnx9JCoagifc73i
	nyAFBeiV9HVpc9ErUkrKuXF5zwTOaXRNzVSzfjKHWdHnNobIRlGMYIlmPiKHk4HWTl8luA334Hz
	py/u4wC7H/ne59FhipHlUvTPpMWvVJDVAqtRVUY4Zou4TotMhDFupgq71P2WsEiBhdqSLeBAX4z
	PDCWhWVHRtnPK4nwlKuR/w+4mYWWI9TEXC5kIDlJe3bAE2N1vTHkhHwR0yTC+hr/w+8v7GgYuim
	YJcd4qmq4o7u/Ubwi65AYpiwNHP5I+zdnIH6Qtog1+p6rgvKUxxW2ueDSSKSIm3nv3WQGFBsqQz
	tp4bC8tnTRf1XRRq1LWtlVM07oHLPKjiSMJIMwiWuPOnuT3qs
X-Received: by 2002:a05:7301:4306:b0:369:44b3:99c0 with SMTP id 5a478bee46e88-36a42340c9bmr27998581eec.8.1793891775413;
        Thu, 05 Nov 2026 07:16:15 -0800 (PST)
Received: from cachyos (2a01cb0c82caf900a186612f304bfea5.ipv6.abo.wanadoo.fr. [2a01:cb0c:82ca:f900:a186:612f:304b:fea5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38a6d3dsm21567087eec.7.2026.11.05.07.16.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 07:16:14 -0800 (PST)
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
Subject: [PATCH v8 0/8] ALSA: usb: add RME Babyface Pro driver (proprietary mode)
Date: Thu,  5 Nov 2026 16:15:45 +0100
Message-ID: <20261105151553.223722-1-i.bahloul01@gmail.com>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Takashi,

This is v8 of the RME Babyface Pro proprietary-mode driver.  The split
is unchanged from v5: a minimal core first, the mixer added piece by
piece, suspend/resume near the end, the front panel and the DSP EQ
last, and a design document.  The series is still based on
next-20261026, so this is a fix round, not a rebase.  It answers your
reply to v7: your three points are the first item below, and what I
did with the Sashiko findings is the second.

This is not an RFC.  Apart from the stereo split one, which a user
reported from USB captures of the vendor software, every point below
is a fix to a defect found in review of v7, or a change you asked for.
None of them changes the protocol or the control layout.

Changes since v7:

 - Your comments on v7.  The mutexes, the spinlocks, the RCU read
   sides and the PCM stream locks use guard(), scoped_guard() and
   guard(rcu) in place of paired lock and unlock calls with goto
   labels, so the driver has no manual lock handling left.  Each
   critical section covers the same code as before, and the places that
   used to jump to an unlock label now return.  The per-channel loops
   in babyface_capture_copy() and babyface_playback_copy() are one
   memcpy() of the words the frame and the stream have in common, and a
   memset() of the rest: the words are S32_LE with 24 msbits on both
   sides, so they go over as they are.  bf_seen_before() keeps the last
   eight units it saw in a fixed table (patch 6) instead of a list that
   grew with every unit; a unit pushed out by eight newer ones is taken
   for a first probe again.

 - Sashiko.  I went through its findings on v7 again.  The ones that
   hold are fixed in the items below.  Two I left alone: the control
   names, which stay as they are (see patch 3), and the module
   parameters it wants in kernel-parameters.txt, which documents the
   kernel's own; the driver's are in the Kconfig help and in patch 8.

 - Probe and stream (patch 1).  probe() returned 0 after freeing the
   card when an URB or DMA buffer allocation failed; it now returns
   -ENOMEM.  Trigger START re-checks the rate and period that prepare()
   checks, so a substream prepared before the other direction changed
   the session cannot start against stale geometry.  in_done and
   out_inflight are initialised before the URBs go out, and a URB that
   cannot be resubmitted is treated as fatal instead of waiting for a
   run of errors that a later good completion would clear.

 - Output masters (patch 2).  Every snd_ctl_new1() result is checked
   before the name is written.  The output pair switch is a mono
   switch, which is what the hardware does; it used to advertise two
   channels and ignore the second.

 - Preamp and trim (patch 3).  The same NULL checks in the trim
   controls, with trim_kctl stored only after snd_ctl_add() succeeds
   (it could be left dangling on failure).  The Boost 0x0003 commit
   value is re-sent on AN 1>2, on the input link and in the state
   replay, not only on preamp writes, so Boost no longer falls back to
   -10dBV.  The ref level is derived from the 0x17 readback at probe,
   the phantom bit is sampled under the mutex, and the unused
   bf_gain_db() is gone.  The preamp and capture control names stay as
   they are, with .index selecting the channel: the companion mixer
   and the asound.state files already reference them, and the index is
   the ALSA convention for a per-channel control.  Turning a playback
   pair's stereo split off wrote 0x1000 to both sides of its AN1/2
   crosspoint, 6 dB below what the vendor software writes for a joined
   pair, and lost the level set on that crosspoint; it now restores
   the cached crosspoint.

 - Routing flags (patch 4).  bf_state_apply_flags() used to write
   0x1000 to the AN1 and AN2 crosspoints on every probe and resume,
   even at width 0, after the default mixer had left those inputs
   muted.  The cache still said 0, so a later write of 0 returned early
   and could not mute them again.  The width replay is now guarded and
   shares one helper with the width control.  DIM, mute, the master
   controls and the front-panel wheels all derive the Phones level from
   one helper, so they no longer cancel each other.  bf_ms_put()
   restores each output block's own crosspoint, the loopback control
   notifies the pair it clears, and the enum and integer puts check
   their bounds before narrowing.

 - Suspend/resume (patch 5).  No change of its own; it inherits the
   replay fixes from patch 4.

 - Front panel (patch 6).  The MIX level is kept in dB2 instead of the
   quantised register value, so clicks below the curve's first point
   are no longer lost and a muted input comes up on the first click;
   SELECT re-seeds the level while MIX is on.  The MIX gate is no
   longer re-armed on the tick that leaves the mode, reprobe is set
   before the card becomes visible, and the panel master writers
   respect DIM.

 - EQ (patch 7).  The low-cut frequency uses div64_s64() for the
   variable divisor, so a 32-bit module does not need __divdi3 (not
   exported on ARM).  A band of type Off is identity rather than a high
   shelf, the default slope matches the value the control reports, and
   a failed strip upload is returned to the caller.

 - Documentation (patch 8).  Wording follows the one-map crosspoint
   model; no functional change.

Every patch builds in-tree on its own against next-20261026 with W=1
and no warnings.  checkpatch --strict reports no errors; the known
false positives are the same as v7 ('ang' for the CORDIC angle, and the
MAINTAINERS note on the patches that add files).

Validated on the unit with this tree:

 - regress.sh --mixer-restore --disconnect-test passes 41/41: the
   full-duplex sweep of the nine rates at periods 256 to 2048 with no
   xruns, runtime renegotiation, 30 start/stop cycles, the mixer state
   restored across an unbind/rebind, and an unbind in the middle of a
   capture.

 - The DIM/mute/volume matrix was checked on the wire with usbmon:
   DIM writes the exact 0xcb/0x0333 pair, a volume change while DIM
   is on keeps that pair, mute writes 0x3b/0x0000, unmute while DIM
   is on restores 0xcb/0x0333, and releasing DIM restores the new
   volume.

 - The probe/rebind replay was checked on the wire too: after the
   default mixer writes 0x0000 to the AN1/AN2 crosspoints, no 0x1000
   write follows, so the width block no longer unmutes the inputs.

 - The MIX-wheel arithmetic is covered by fader_selftest: a muted
   crosspoint seeds at the curve's first point, one clockwise click
   leaves mute, and two counter-clockwise clicks from the old -52 dB
   sticking point move.

 - The physical MIX-wheel gesture was checked on the unit: from a
   muted AN3 crosspoint, one clockwise click moved it to 0x0004 (the
   old code left it at 0 for the first five clicks), two clockwise and
   two counter-clockwise clicks stepped it to 0x0003, and the level
   followed the wheel in both directions.

 - The stereo split was checked through the AN1/2 digital loopback:
   with PB1 at the default crosspoint, split then join comes back at
   the level it started from (-51.5 dB before and after; it used to
   come back at -54.5 dB).

Known limitations, unchanged from v7:

 - USB autosuspend is not supported; it is disabled at probe.  S3
   suspend/resume works.

 - A few protocol details remain open (documented in the source, not
   blocking): the preamp readback index semantics, a width
   strip-ownership edge case, whether DIM's scope follows TotalMix's
   Main Out setting, and the exact high-frequency warping of the EQ
   coefficients against the vendor curve.

 - The URB size and count are load-time parameters, though the size
   follows the period the application asks for.

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

 Documentation/sound/cards/babyface-pro.rst |  218 ++
 Documentation/sound/cards/index.rst        |    1 +
 MAINTAINERS                                |    6 +
 sound/usb/Kconfig                          |   17 +
 sound/usb/Makefile                         |    2 +-
 sound/usb/babyfacepro/Makefile             |    4 +
 sound/usb/babyfacepro/babyfacepro-ctl.c    | 3946 ++++++++++++++++++++
 sound/usb/babyfacepro/babyfacepro.c        | 1943 ++++++++++
 sound/usb/babyfacepro/babyfacepro.h        |  568 +++
 9 files changed, 6704 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/sound/cards/babyface-pro.rst
 create mode 100644 sound/usb/babyfacepro/Makefile
 create mode 100644 sound/usb/babyfacepro/babyfacepro-ctl.c
 create mode 100644 sound/usb/babyfacepro/babyfacepro.c
 create mode 100644 sound/usb/babyfacepro/babyfacepro.h

-- 
2.56.0

