Received: from mail-wr2-f14.google.com (mail-wr2-f14.google.com [74.125.225.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87A0F2DA75A
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 03:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789701218; cv=none; b=m1fDmubjqngix4eR3ztx5sp/A8LBC5tLQ0zx2Ag6/zBDi8IJXqCYGU11GmSm1ey7Lq/LYcuw8IknYQZlJi6Q/VBOeULk3kl1iYZcjx72J88KX2Nv6p1CTKkY8wFfYIoMibUys8r/ta4UFAMZ7qcR3hjNHFYARFd1rXN6Rr+AvPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789701218; c=relaxed/simple;
	bh=RSIfMu4wCoulZII4j/zvunaywJNldCRpZP68oXdBimY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=dGwbdR8zMdbNjScGs2xNjInqDsJEkoihYgoYuULo2mp06RKyP9Ga+dcXP3nUS4j0mBrPf1fF1ztmbbc5fA2vR04jHEtphrCZNW6+gzEQmGQSYZSnSIBd0Czn+WDGYQ1v26iCEYaLNbOuaEDlvlBuJAl3njR4zNfHRn1YrCRaCYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=asseily.com; spf=pass smtp.mailfrom=asseily.com; dkim=pass (2048-bit key) header.d=asseily.com header.i=@asseily.com header.b=S2/bmeEi; arc=none smtp.client-ip=74.125.225.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=asseily.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asseily.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asseily.com header.i=@asseily.com header.b="S2/bmeEi"
Received: by mail-wr2-f14.google.com with SMTP id ffacd0b85a97d-482f6350f88so98268f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 20:13:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=asseily.com; s=google; t=1789701211; x=1790306011; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=e7MmBJ9KD6j1ai4ogzajarS0sODSAWVEZipahpG/Kyg=;
        b=S2/bmeEiwhpGkdP1XS9l4SWPW6BeYf0+dmvNkxgHbL8PO/c0WlF1lPLT7/Flt39w+S
         jWLnwQWBOmFmoFRvHcYiYrFczGI50/9gVdc1/+WUpOpcjrHrzzzIUy2GAEzzEdDoYa1Z
         s4LS0cXTjopgs4YN5G+gfByeJPXC7lMJOH1HMayd8qRrWHR0KDqV3kXaYYnAHu8kP9Pz
         wf8cjFPKUHKN4msAx7gjqMEkEPGBFBQKRbPl5ygrP4ZnC/qWh4JkqJPIJqgqGrSyysxB
         9TS47sC/J14kOQxF4aoZ8uWEySCQxS0d3yf5QKZVF1qSmsAOS5soH73kl9QMYJceMhVl
         vuNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789701211; x=1790306011;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e7MmBJ9KD6j1ai4ogzajarS0sODSAWVEZipahpG/Kyg=;
        b=2uQHvrY1+211uM25WWq3VShBR7c2wNV1cOdwETVgkZu85BAUv61GV9+CXstP6gXgRx
         gBDoIZKTFp2u/+HzccQytPq08SzaBu62RWwNPAnu42FEnzY1WWRLSi/glrcht+Wk3luM
         rnqa8SC2y62pfm/PfBwWrLNo9mqMa9unJcU+DscnrwmRwQGNEHL3vxp4M7CpEPoYSHvX
         k+qlEvyh2ORdA1I4UQm3eonG8OK4UblQPvQHcez56fYUyi6g4sS8pDQvbVeNK8/c4CZv
         +sbnzq3rWCLfVEHbq7Awtm20BYaQQjxFwWx0lJG/RBR9jWZ8OQe1swRWBltRf79XxCxp
         qx2w==
X-Forwarded-Encrypted: i=1; AKwUvBx/2AJUC3xhpKHHTcYxzMnpkRrXJONTACwwaWxiKqaLKBKYflwJcd715IzmGZ1Gd71K73VFIpIOkfe0aEA=@vger.kernel.org
X-Gm-Message-State: AFuF++kFCCVbe1zReekP9cvNNZB6AyQP4zJ8g9G3HCzlVDoGTvKVLaNy
	vtv1qAUAuoSrE/8bA22JRLJSm/ugLFKnZpi4DgCVXwAHc13nnxoZW5N3ukBvD85ZsyQ=
X-Gm-Gg: AYBFou1LCZoO9UrfmR/o481mgdgzLGKOwYkLk9Q/YeSPm4Wm+oG+Hk9INGbLRqscxZI
	IZ08PZ2GbL25rlXp9W41pdWnOVYr7knGtXth82OCcitx6+hXWHzw2hrqVeGvkUZTMt6cPO6B1Nu
	xU3Xz7lrzcxkCDM60hsXKJFKn0X5GG21RSRLcexClecgRSnQm4nViNANuT1dn+N6LjHUXxs29QJ
	PocfZZx3DDpuGIKhHXuHOb7gtQ4vc22cOmte2YBboAbmQsBQoHe94zryHx2fS3yEMGKvVSgMes4
	c6FEfdj3fW21LQdOmszmAu5nW7BrbEA1vOV7NT3CN7+blTMyTs4hkmKvvcGkE7F1sKrZJByAowV
	3FLW+6LPrDzyKyL5FIBUgsyUlsyLZ5UXya971+NlexgtB9hbVH9e6NDoT9aPQ0E29wamWsnntyk
	CcEuLl7LcejfuJ+CmygX9cQxAnfNfUBSgoo83ufHl4YYmMRMUlwqA8z4+9S6y2CIIVcoDpXkAlu
	wHLDLKTGpnDVQ==
X-Received: by 2002:a05:600c:1989:b0:49c:e42b:a4ac with SMTP id 5b1f17b1804b1-49fc5714d14mr10129515e9.11.1789701211417;
        Thu, 17 Sep 2026 20:13:31 -0700 (PDT)
Received: from Behemoth.triland.local ([178.135.16.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc79bdc35sm14533685e9.0.2026.09.17.20.13.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 20:13:30 -0700 (PDT)
From: Karl Asseily <karl@asseily.com>
To: broonie@kernel.org,
	lgirdwood@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Karl Asseily <karl@asseily.com>
Subject: [PATCH v3 0/4] ASoC: add ESS Technology ES9039Q2M codec driver
Date: Fri, 18 Sep 2026 06:13:22 +0300
Message-Id: <20260918031326.68542-1-karl@asseily.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds support for the ESS Technology ES9039Q2M, a 32-bit
two-channel audio DAC with an asynchronous sample rate converter,
controlled over I2C. The part also has a hardware mode strapped by
HW0/HW1/HW2 with no control bus at all; this driver implements the
software mode that MODE = GND selects.

Two things about the part shape the driver:

 - Selecting an input format takes two registers, not one. INPUT_SEL
   chooses the port; SYS MODE CONFIG enables the matching decoder, and at
   reset only ENABLE_TDM_DECODE is set. Selecting DoP without also
   enabling ENABLE_DOP_DECODE leaves the part hunting for a marker with
   the marker decoder switched off, so it finds nothing and mutes. The
   driver writes both.

 - Several registers have non-zero reserved defaults - register 88 reads
   0xb8 at reset - so every write is read-modify-write.

The programmable FIR coefficient controls are write-only by design.
PROG_COEFF_OUT is documented as a coefficient readback but is not a RAM
read port: it returns the last coefficient written, whatever address is
selected in PROG_COEFF_ADDR. Measured with the driver out of the path,
five sequences, ten reads, all returning the same value. A get() built on
that register would return something with the shape of data and none of
its meaning, so there is none.

Every control has been verified against the silicon rather than against
the driver's own read-back - written through ALSA, then read over raw I2C
- and DSD, DoP and S/PDIF input are all implemented and tested on
hardware.

ESS Technology has no bindings in the tree today, so the series also adds
the vendor prefix, taken from the company's domain esstech.com.

Link to v1: https://lore.kernel.org/r/20260820062626.39218-1-karl@asseily.com
Link to v2: https://lore.kernel.org/r/20260821043859.171871-1-karl@asseily.com

Changes in v3:

 - Fix the MCLK selection introduced in v2. hw_params() called
   clk_set_rate() for 256 * FS unconditionally, which is above the part's
   50 MHz MCLK maximum for any rate over 192 kHz, and the rate the clock
   settled on was never re-checked against that ceiling. The ratio is now
   taken from the highest that fits.

 - Decide 64FS mode from the MCLK/FS ratio in use rather than from a rate
   threshold. The 128 * FS floor was applied even in 64FS mode, where the
   datasheet asks for 64 * FS, so the 768 kHz this driver advertises in
   SNDRV_PCM_RATE_8000_768000 could never be reached - 128 * 768000 is
   98.304 MHz. Register 0[6] is keyed to the ratio, not the rate: 384 kHz
   from 24.576 MHz needs it as much as 768 kHz from 49.152 MHz does. The
   asynchronous floor is also strictly greater than 130 * FS now, as
   Table 7 note 1 has it.

 - The mute and DoP controls moved their shadow state before the I2C
   write and left it moved if the write failed. Both short-circuit on "no
   change", so a retry with the same value was a no-op and the control
   stayed permanently at odds with the register. They now restore the old
   value on failure.

 - Enable the datapath at component probe. SYSTEM_CONFIG[1] is clear at
   reset, so in software mode the analogue output was dead until
   something outside the driver set that bit. Written after the mute and
   never before it.

 - Add system suspend and resume. Where a board feeds the part a
   free-running oscillator, nothing in the system can gate its clock and
   it stayed fully clocked through suspend; suspend now clears
   ENABLE_DAC_CLK and resume resynchronises the cache. Resume mutes
   first, because regcache_sync() walks registers in ascending address
   order and would otherwise restore DAC_MODE in register 0 long before
   the mute in register 86, on any board that removes the part's
   supplies.

 - Remove board-specific references from the comments - measurement
   attributions, dates, and two pointers at a repository outside the
   tree. No functional change.

 - Note on what is and is not tested: everything at 176.4 kHz and below
   runs on the board this driver was written for. The paths above it are
   derived from the datasheet and not measured - that board feeds the
   part a fixed 24.576 MHz oscillator as a clock consumer and cannot
   reach them.

Changes in v2:

 - Accept SND_SOC_DAIFMT_CBP_CFP rather than requiring CBC_CFC. v1
   rejected every provider mode but consumer, which was one board's choice
   written into the driver. CBP_CFP now programs PCM_MASTER_MODE,
   hw_params() calls clk_set_rate() to pull MCLK to a multiple of the
   sample rate where the clock allows it, and the datasheet's two MCLK
   floors are applied separately - 128 x Fs synchronous, 130 x Fs
   asynchronous - instead of 130 x Fs unconditionally, which had been
   refusing 192 kHz on synchronous boards that can carry it.

 - ES9039_DECODE_MASK did not cover ENABLE_SPDIF_DECODE. hw_params() uses
   that mask to enable one decoder and clear the rest, so the S/PDIF
   decoder stayed enabled alongside whichever decoder was selected.

 - mute_stream() and the "Master Playback Switch" control both wrote
   ES9039_DAC_MUTE and overwrote each other. Each now records its own
   intent and the register is written from the union of the two.

 - The DoP control returns -EBUSY while a stream is open rather than
   half-applying a change hw_params() will not re-run, and both halves of
   automatic DoP detection go through one helper under a mutex, so
   AUTO_INPUT_SEL and ENABLE_DOP_DECODE can no longer disagree.

 - Status controls use the symbolic source-bit names rather than bare
   BIT() values. Doing so found a bug: "Clock Fault" read bit 7 of
   register 235, which is reserved, rather than BCK_WS_FAIL_SOURCE in
   register 234, and could never have reported a fault.

 - The volume put() raises VOLUME_HOLD around the pair of channel writes
   and drops it afterwards, which is what the bit is for. A stereo change
   previously left the channels briefly at different levels.

 - Rename the vendor prefix from "ess" to "esstech", after Krzysztof
   Kozlowski pointed out that ESS Technology's domain is esstech.com. The
   binding file, its $id and the compatible string follow.

 - The harmonic correction controls keep their names rather than gaining a
   "Volume" suffix. The justification in the comment was wrong - TLV data
   is not what decides - but they cancel distortion rather than set a
   level, so the name stands and the comment now says why.

 - Style: the header block is one C++ comment, and the "return ret ? ret :
   1" ternaries are plain conditionals.

 - Add the Assisted-by tag that
   Documentation/process/coding-assistants.rst asks for, which v1 omitted.
   This driver was developed with AI assistance. The board it was written
   against, the register-level measurements quoted above, and the
   responsibility for what is in it, are mine.

v2 has had a run on the board the driver was written for.

Karl Asseily (4):
  dt-bindings: vendor-prefixes: add ESS Technology
  ASoC: dt-bindings: add ESS Technology ES9039Q2M
  ASoC: es9039q2m: add ESS Technology ES9039Q2M codec driver
  MAINTAINERS: add entry for the ES9039Q2M codec driver

 .../bindings/sound/esstech,es9039q2m.yaml     |   61 +
 .../devicetree/bindings/vendor-prefixes.yaml  |    2 +
 MAINTAINERS                                   |    7 +
 sound/soc/codecs/Kconfig                      |   14 +
 sound/soc/codecs/Makefile                     |    2 +
 sound/soc/codecs/es9039q2m.c                  | 1831 +++++++++++++++++
 6 files changed, 1917 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/esstech,es9039q2m.yaml
 create mode 100644 sound/soc/codecs/es9039q2m.c

-- 
2.34.1

