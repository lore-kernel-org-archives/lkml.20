Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A329451DDEF
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 18:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789755820; cv=none; b=SF2mFGdfuZhsejG1G9La2aKPfpB9s6/TXtmnb3Orx1OS/6y9Rq1OLCo+xxc1ACLbahs4usUWTzG8O4+FacSSwXkpG4zTs/1MRe/afjJR4GIhoLvU7+DVGMk+vTQ/KO0gsdDxrRGVx3ghqonIrfiJq8P3p7LA4XeUDsm/yQz6huk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789755820; c=relaxed/simple;
	bh=v/H++FNwCXvE9e9UXtvV6NdOMpDh/T4C8hTrkmjjaac=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=mIjkUyZv0OX/wO4usR3e9ZfiomFZy/FTL+iJQzbYs81TKkK32VsKYdXZEvKchQqsg/lxBhM/PQpO32XOMLVyA2imQYuJ9F/FDBbSPCTVG0CmgkGC+fk5UD5q6dKuGYgF8BC/nxzOZct2id3YpOvQ2eIKAc8R3ejSHX9X60F0eko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=asseily.com; spf=pass smtp.mailfrom=asseily.com; dkim=pass (2048-bit key) header.d=asseily.com header.i=@asseily.com header.b=DBAEPK2b; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=asseily.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asseily.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asseily.com header.i=@asseily.com header.b="DBAEPK2b"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ccf3ca626so5312785e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 11:23:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=asseily.com; s=google; t=1789755815; x=1790360615; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Mb8NdrCNaMg83pBKGqqjDeigcqXFOnQgVzA4kAdgSHY=;
        b=DBAEPK2b019b4dHmIRGKC7r4VPO2crGKVMCnWhSyNx0BF3FRrsyhCNvE2V89s4DvFc
         vom7AZWl40VbAqEx8iMYiMvoYReKYWRLBYAPS0kyiMBjjFqLT8Mt9Kj5OL/oVFjLPbjD
         lbxoeMAAy56lL3ueUMTVGmsOYf1PGP5LBLIpxpLKv39T/LQMTlphQpmjbM6RbENvnDLQ
         0lFhT3kfbIOfAtMUO0M/ew8+Jb1gOSNVDr/Kf7Sc4Uoj2m6barRyxljyBf3vYnaDO3YQ
         sxOn6c7v9qhjIiJ3MoJ5vMdI5TyG/vBdObBkbMi76tUks36+DHkwHq6uwmqFUYqWeanV
         rlPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789755815; x=1790360615;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mb8NdrCNaMg83pBKGqqjDeigcqXFOnQgVzA4kAdgSHY=;
        b=FkxUCqUCTM2E3lOOf4EYRQa7WMoxTKovzhHQGPoLypZNYr21d3cMUPb+0NdXjKrWuv
         qfe6jkfJA1nvRwCf89MYwNy/GSeXzXKeklexRglTlI9GElOgNJgLW51YHj1xyUiF05UV
         YWTHSzAisYXQ6gLDCFDA6vJriQ5qlyaN0lHkaDJTO7NXF+BbIVBzcm2KSCuJe32ZqHKf
         XuCe/E2URvJSaXAyN/zgGNh0PACWZ+WYIKEMJUY+vh70GdXnk2YIXLjdk74E+KPMrkw8
         FFLRlHzPzO1+R10d5+UjDNT4rAvu+sZW0jus7YsPx60H4PN2NZTrpLiowponMna4FTuX
         IOWA==
X-Forwarded-Encrypted: i=1; AKwUvBwk5qwMQmkFvtZKBp7T/VpGDP0htulnyRx0wA9hnlLMZneW8N8LEyGYIAR931eCl67LNcMPXtIFGphK+uk=@vger.kernel.org
X-Gm-Message-State: AFuF++n3kw3sZOCRQ7tRoL+2ENC8h2sGCPhL1TcDpo11XItKd61UCl4K
	p1ioQO8zOQVDxVRBvwkr00hoGMes8R60713DL0knGNpSP7bEJQmxf9PZGeDEQetvXrg=
X-Gm-Gg: AYBFou3eWXKXWdHPu83J2K5LtFxAkaQzuOeCA/1esOo64EHfAbqqYpSeueFYOYqirat
	seEL8BXuRHk8cK1zohzkcgQpkY3vVvFv9hpPFuvSrCDmxcLzBLKf2wDnx+VqaMOrpRE5A5eMulh
	SzTMB8xyD9zV5bwuKYiSIGYmOP6HE/4jOVS4Uzqye+5Geca5VTWrXbMA4rN+rg0kamR0krCGPde
	QhMg9tij3EPLhiHtVieOf68VU0qUsahA7opQbFtwxSF5OFyG0+YWKOpLJ9B/JPWRxHKAwXvlRzn
	LsZvOGyWx5+JbDhxO4Sbvlo2DdddJADBEp6i5g1A0APZWyc57QMDJ8ZCcXBy2D7a6iLpG2JkgK3
	pFe0k4VItwEEMpORSG1PpL8L31ahCxhIGxJMTr9Xcj2/OnD/4pGRNg0gw6fMjfw0xNnW4/+2Kmy
	Ha5HzI8d6VL0oM3W0Uoyh4EGKl+3q2reLKuAdntJZk9LRXICXNFq1CUvdqerWFGsfk2RbwPDeJd
	A4HdIHMRnQoTA==
X-Received: by 2002:a05:600c:6211:b0:49c:fa20:cbfb with SMTP id 5b1f17b1804b1-49fc5728f84mr42145935e9.18.1789755814501;
        Fri, 18 Sep 2026 11:23:34 -0700 (PDT)
Received: from Behemoth.triland.local ([178.135.16.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcd0735c9sm12159755e9.6.2026.09.18.11.23.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 11:23:33 -0700 (PDT)
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
Subject: [PATCH v4 0/4] ASoC: add ESS Technology ES9039Q2M codec driver
Date: Fri, 18 Sep 2026 21:23:13 +0300
Message-Id: <20260918182317.143223-1-karl@asseily.com>
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
Link to v3: https://lore.kernel.org/r/20260918031326.68542-1-karl@asseily.com

Changes in v4:

 - Describe the part's four supply inputs in the binding, and require them.
   Rob Herring and the sashiko reviewer both raised this on v3. AVDD, VCCA,
   AVCC_DAC1 and AVCC_DAC2 are all nominally 3.3 V. DVDD deliberately gets
   no property: the part's 1.2 V digital rail is generated on chip and that
   pin wants a decoupling capacitor, not a regulator. As sashiko noted,
   adding required supplies after the fact would break device trees written
   against the first schema, so they go in now.

 - The driver gets those supplies and enables them in the order the
   datasheet gives - figure 22: AVDD, VCCA about 200 us later, then the two
   output-stage references, reversed on the way down. They are enabled one
   at a time rather than with regulator_bulk_enable(), which makes no
   ordering guarantee; the bulk API is still used to get them, where order
   does not matter. The datasheet states no settling time between the last
   supply and the first register access, so none is invented.

 - Resume re-uploads the programmable FIR coefficient RAM. Mark Brown
   asked on v3 how the coefficient upload survives a suspend that powers
   the part down, and it did not. The RAM is write-only - PROG_COEFF_OUT
   returns the last coefficient written rather than the addressed one, as
   patch 3 describes - so regmap cannot cache it and nothing else in the
   system holds a copy. A board that keeps the part powered loses nothing,
   but one that removes the supplies came back with the RAM undefined
   while regcache_sync() had just restored the filter selection from the
   cache, which would point the interpolator at whatever the RAM powered
   up holding. The driver now keeps a shadow of the last upload for each
   stage and replays it after the sync. Stages never written have no
   shadow and keep the part's own defaults.

 - Serialise the coefficient upload. Splitting the upload loop into a
   helper for the above made it visible that both FIR controls drive the
   same address, data and write-enable registers with nothing ordering
   them, so two concurrent uploads could interleave into each other's RAM.
   The upload now runs under the driver mutex, which orders the two
   controls against each other and against resume. The write-enable stays
   a per-coefficient strobe, which is the sequence the datasheet gives.

 - The multi-register controls read the whole field, modified it and wrote
   it back. ES9039_AUTOMUTE_TIME spans registers 124-125 while
   MUTE_RAMP_TO_GND is bit 3 of register 125 and has a control of its own,
   and the ALSA put path holds card->controls_rwsem for read, so two
   controls really can run at once and a change to that neighbouring bit
   could be lost between the read and the write-back. Each register is now
   updated through regmap_update_bits(), inside regmap's own lock and
   touching no bit outside the field's mask.

 - The volume control raises VOLUME_HOLD, lets the generic handler write
   both channels and drops it again, but took no lock. Two callers
   interleaving would let the second write its volumes after the first had
   already dropped the hold, which is the torn stereo update the bit
   exists to prevent. It now holds the driver mutex across the sequence.

 - Collect Krzysztof Kozlowski's Acked-by on patch 1 and Reviewed-by on
   patch 2, both given on v2 and both missing from v3 through my error.
   Note that patch 2 has changed since he read it - the supplies above -
   so the Reviewed-by is carried rather than re-earned.

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

v4 has had a run on the board the driver was written for.

Karl Asseily (4):
  dt-bindings: vendor-prefixes: add ESS Technology
  ASoC: dt-bindings: add ESS Technology ES9039Q2M
  ASoC: es9039q2m: add ESS Technology ES9039Q2M codec driver
  MAINTAINERS: add entry for the ES9039Q2M codec driver

 .../bindings/sound/esstech,es9039q2m.yaml     |   94 +
 .../devicetree/bindings/vendor-prefixes.yaml  |    2 +
 MAINTAINERS                                   |    7 +
 sound/soc/codecs/Kconfig                      |   14 +
 sound/soc/codecs/Makefile                     |    2 +
 sound/soc/codecs/es9039q2m.c                  | 2008 +++++++++++++++++
 6 files changed, 2127 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/esstech,es9039q2m.yaml
 create mode 100644 sound/soc/codecs/es9039q2m.c

-- 
2.34.1

