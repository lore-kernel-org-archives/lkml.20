Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793904930;
	b=4McW+xVkf3iI959yrEMylDTmOSw+Q3qhLOXGqaiZt9haEOECh2Kz15X+XYRRIqzSw0cz
	 BOHSzjLPNNTW0flUIq2X16b3Au6y2kn+Fa3oCG1NMJLqQ9hCZSSmGVQmMA3MPwL5UiWy1
	 KEHbDOKvneYCtGPIFGHlSgLdiPEpf5ZT9HBWRxcaaKtoKcbqfGdkt9KJurTLAj08qZRbs
	 2ibuNVH+gQY4Tvukk3TAndMeMJ4C1J0odgYqq/9pUnxBjLSHM5GgNN8PGLqW/GqVy9Y/A
	 yOVzDwB4PApD0YBMRpUNlRZxxc3JzYT3aQQGGUbKfvdIbHdzoBPhKambfJ1YsTSGaEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793904930;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=UMvD0QNhuIqJcyOdighp/tGvQpuMow4V22PsckR2fAU=;
	b=M0tkuSN2AMs6Mt0bYxInBXH3KYczSB1URj23DevboD7ANZpmkZpkf/D2dWSY0pq/xaFF
	 mx4mpyBRaD4Cj0j4G23IG95y6lG7vg2hOLbtNW6CcmeN2BVNjZ1i0Vhne5xvJTLEn8DQw
	 Td5R3sMDgeZhECihZiHJPrVyDuSJN6nRTJRvM9ML0FM7ZtFhGwVQRhsCZd9XX3fXbdYMA
	 OKVIP5EI+um0uRQHe/Pn3Qk5R/cxMlHhdxtJNLzpqQyGwcct06e50215Wwx4fpZjXIfdR
	 CNYU4VCqEgv8ogyEQBlEOyRdYYTHaLwutPyscbyL4JzqKukq43pAFfmja9BurLQNVIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QaZPAS+w;
	arc=none smtp.remote-ip=209.85.161.52
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E184606A31B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 18:55:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E184606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QaZPAS+w
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-716b58a4365so1412066eaf.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 10:55:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793904929; x=1794509729; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=UMvD0QNhuIqJcyOdighp/tGvQpuMow4V22PsckR2fAU=;
        b=QaZPAS+w2Z/FsyBIht6nzijeZpPDsMsE/ZKbAhGySweRfJGUebJklPpSu4J27qdU7Q
         cvtJy2oTbcijfHzXjhvlqR2aMINXTGtd1IiZ7PobdjoJnHssg+tPVXFGaDpgS4W31jD1
         eLj6iePJiQ/O3o0tHMCgCMpDDxhYDskDBXJAMIJl/0lcsE8rSJEUweDwty3FhiVX1F/q
         PqRbRQBnC9LKJ+5rCD2jw6PRHSvprV9gM4IiewOSIwO+ZAMSBjqtSDNkBwYLKsBZeG2z
         WMBcJocY3YdUmOTjqPbT9MkHG3/HseT0pQMOCN0MWLFjox2CenV1vx989BMxKtxoAeCM
         g+dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793904929; x=1794509729;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=UMvD0QNhuIqJcyOdighp/tGvQpuMow4V22PsckR2fAU=;
        b=fOGLB2Dafmd/NnBQf0uLMb0zh1qMyum5qqK1GbEfnXXBs1NPNhB/TBkIpe/KD0oAB+
         prr9IUftF+OuHd5nRh4bFL1Wkbbagb6xM8xb+Wr/5499TF6UpdxEXNX5eEhMGucNAD4j
         sGkh4Jws0V7x45/oPpA7Tn5WbAoulgSH7WCoBo2qngP7ho/jrVSHJ7ysyhcrOqt/cFCH
         UyQYg5woB1bSrqEqQ8vWx4YuVsA85CckBKZdsa/fPpi3OPsf/VB93yHNQySjKOOqbMp8
         4bpbhiOznov080FLICs7pxAJ+sBYG0WPbLK4geNVSE2Z/AskNndT5UzQkunPXjVbiuom
         50gw==
X-Forwarded-Encrypted: i=1; AKwUvBzsWteUgRswJjF4Ie1X+jnmGJudxq0g33kRTRNJsxZ3hXoTXp2QlSrWk7y7nD+Bh87GK6C9ruopyhILmoY=@vger.kernel.org
X-Gm-Message-State: APuU4Z80G1TYGzD5y0SJzrl/fpkwkeVwk7nym0ltO6SwXFWcdsZaziRL
	3FzvLKB8bTqH6gtKN2D9BJIsk1y2bF72SVR9DMgdKm4rrBzPd8vnY1OQ
X-Gm-Gg: AYBFou129uMlXE7xNPCrrovtACkfX0APQ44bTWpiJ8mUq+oUaGC8iFHvNdnjLWjBOKJ
	DrikvU+n3hEJSws0mx3EKAa6wbCd5PJzbpzZpif9APgO1GRxOuwR05HvM45/fqSwm3JHtOGm9PL
	9Vc7zpqw7kMzH7o3kXulcE5gNn7VIEC7FwFfnPGXHxqGDy3xKykVsDxD1NveP0Gu1qAWaIByZpk
	ZzLFUsDmwiVEYtk596hEEtmos4/R9nG+V0vhbKQc1qoz808o6WUZJmb/qEuT7ZqIXHdIe/3MGpz
	NfelC7XAbxR/Qz8tBRq3U8wKsrj4Ys78/YsukqArXA4pIEbokT51VFT9SljLyjZF4mMWQnVCuKo
	Qmc0fHJ6NC2WS/spbKen+wGyJcbYkC5jbnfVV4XhSNBL8mBIkmhZfuZKtohDAlvQyKF0k8JCQbd
	KKDh9PO4INggOyABspYgtSBKIGLZ/yZ20IwiYdkQo6yWriYC+IaHGnw40p7jzGd7mHDQrkgu6mk
	K01+nvW6hQ9DCZ7eeANUWDinqT3xZgTH+6aF7UiwCoJbIElXOkeFhxCljPLQIxuN59J5D+87r73
	OzjnSvplhOIFgrVBWlQxMW6WkfQttguRkSOOVadFht/csvpHqXgkdWB7CIqLkqkOYSJMhbNav1k
	+FGubh4XkHLmk32YgkMWmudYYPuh0uzZ219YOCka4VaPGDsJ6cBDTHJ8BAwyvjy5w3T7AZr5JqA
	MB4DPd96smIiiGrlO2TLeyeGyJtpp+pCPZxfTk5mI6I15q0oNe2EwmFQ==
X-Received: by 2002:a05:6820:c5ce:20b0:6f7:7a4a:9d7b with SMTP id 006d021491bc7-716e790c1c8mr291036eaf.41.1793904929156;
        Thu, 05 Nov 2026 10:55:29 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-716e99465dbsm115897eaf.0.2026.11.05.10.55.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 10:55:28 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH v10 00/26] mtd: rawnand: sunxi: fix transfers and support
 randomized OOB
Date: Thu, 05 Nov 2026 11:55:16 -0700
Message-Id: <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-0-dca1f6ed29a8@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5XSzWrDMAwA4FcpPs/D8r932nuMHfyjtB5tMpI0t
 JS+++wOtpBcUjAYCfFJyL6RAfuMA3nb3UiPUx5y15YA2MuOxINv90hzKgnCGdfMAqPDOZzyWK7
 2kmnr20QnbFPX064L9Oiv3XmkE1AUADIBi9FFUrDvHpt8eXT6+PyNi/SFcax6rTjkYez662OUC
 Wrd003LYVRqYZXwIH1y7/uTz8fX2J1IbTrxf9YxuZnlhQ3AmZGN9NGbJSvmrNvMisJaYWNgwYO
 SK1bOWOCbWVmX4LUMmJzkfLUENWfFZlYV1iQDwIz2ullNq+fs9t3qwvImMCsbZEbBkjV/LLAnW
 FNYlUQTtU88+RVr56zazNr6ZMFLa6EJiHbJujlrNrOufjDNZWQOBaKas/f7/QehJgYopwMAAA=
 =
X-Change-ID: 20260810-submit-sunxi-nand-vendor-oob-layout-v1-e3114d10cc9c
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 James Hilliard <james.hilliard1@gmail.com>
Cc: Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>, 
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev, 
 devicetree@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.15.2

Patches 1-24 address the existing driver independently of the Allwinner
randomized-OOB format in patches 25-26. Please review and apply that prefix
regardless of whether the format extension is accepted. Supported geometries
keep their existing on-flash ECC layout, bad-block-marker representation
and raw callbacks.

Patches 1-3 prepare the shared paths: centralize OOB handling, share the
NORMAL-command chunk-size calculation, and remove duplicate chip setup
immediately before core page commands. The DMA writer retains its early
setup because it accesses controller registers before program-begin.

Patches 4-21 fix the ECC step limit, logical-step lengths, read and write
errors, completion reuse, pattern handling, duplicate program confirms,
small-page read commands, DMA user-data bank limits, split address cycles,
clock setup errors and direct buffer transfer counts. They also skip
unavailable NAND children and complete all chip scans before registering
MTD devices. H616 abort recovery performs the AHB reset before releasing
the DMA mapping. Unexpected reset errors block further I/O and are returned
to the caller. Each fix explains its triggering condition independently of
the format work.

Patches 22-24 then reduce repeated ECC-status reads, extra-OOB column
changes and user-data length-register accesses. The pattern and transfer
fixes precede these optimizations so their correctness can be reviewed
without the caching and fast-path changes.

Here, "user data" means ECC-protected metadata in OOB, not the page's main
data. PIO reuses hardware slot zero for each logical ECC step; DMA can
transfer several steps at once. The patches distinguish logical steps,
hardware slots and packed register offsets, and explain their triggering
conditions independently of the format work that prompted the review.

The IRQ fix retains timeout-only disable_irq() and explains both the
forced-threaded PREEMPT_RT race and the unbounded cleanup/no-priority-
inheritance tradeoff. The small-page fix is limited to read-side
repositioning within existing geometry restrictions. DMA batching preserves
the installed OOB layout rather than capping its allocation.

For devices provisioned with the Allwinner normal-page format, support is
required compatibility with existing flash contents, not a preference for
another layout. Its bad-block marker is randomized: applying the existing
plain-marker compensation can make normal OOB reads and bad-block scans
interpret good blocks as bad. Switching formats is not a transparent
kernel upgrade.

Patch 25 documents the opt-in binding; patch 26 implements the format
through separate OOB callbacks and an attach helper. Its geometry,
page-wide classification and contiguous parity reads stay together.
Without the property, existing format selection and callbacks are unchanged.

The accompanying TLA+ models and validation material, including their
assumptions and coverage limits, are available at:
https://github.com/jameshilliard/linux-h616-nand-tla

Assisted-by: Codex:gpt-6-astra
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Changes in v10:
- Require resets and reset-names for H616 in a binding patch before the
  DMA-abort recovery change.
- Reset the H616 data path after DMA aborts. Require and exercise its
  exclusive AHB reset at probe and reset before releasing the DMA mapping.
  Propagate unexpected reset errors and reject further commands after
  failed recovery.
- Group shared-path preparation before the existing-driver fixes, followed
  by register-access optimizations and the opt-in format support.
- Share buffer command sizing between reads and writes, and use those
  boundaries when decoding a randomized tail spanning multiple commands.
  Keep the decoder correction in the format patch.
- Skip unavailable NAND child nodes before claiming chip selects.
- Scan all chips before publishing MTD devices, with separate registration
  bookkeeping for partial scan and registration failures.
- Limit direct buffer transfers to 1024 bytes per command, independently
  of the advertised SRAM size, and share the limit with the parser.
- Send every address cycle in parser-split instructions, using the subop
  count independently of its start offset.
- Propagate chip clock setup failures before installing timing registers
  or issuing commands, and update the cached rate only on success.
- Carry Sebastian Andrzej Siewior's Reviewed-by for the IRQ lifetime fix.
- Link to v9: https://patch.msgid.link/20261017-submit-sunxi-nand-vendor-oob-layout-v1-v9-0-b624c09e3ee5@gmail.com

Changes in v9:
- Add an independent fix rejecting pages that exceed the controller's ECC
  step limit, as reported by Sashiko. Keep it after the initial refactor and
  retain the final ECC step size when validating explicit or maximized ECC.
- Add missing Reported-by and report links for the IRQ lifetime,
  small-page read and DMA user-data batching fixes.
- Make the existing PIO and DMA OOB-read branches explicit in the initial
  refactor, preserving their transfer ordering and error handling.
- Add a cached pattern-ID accessor with status caching, so the Allwinner
  format can request pattern IDs without duplicating the shared reader's
  register-read conditions.
- Clarify OOB callback indices, buffer and ECC-cache lifetimes, and why
  an empty pending-event mask completes the IRQ timeout recheck.
- Explain packed parity placement and byte-based erased-page classification
  as Allwinner format compatibility rules, distinct from hardware limits.
- Link to v8: https://patch.msgid.link/20261015-submit-sunxi-nand-vendor-oob-layout-v1-v8-0-8ba4881fbee8@gmail.com

Changes in v8:
- Add a separate fix for the pre-existing zero-pattern overwrite reported
  by Sashiko. Preserve synthesized data and OOB in the existing-format
  read path without treating zero chunks as erased.
- Place the fix after pattern-ID selection and update the later status
  caching conversion to use the same pattern check. Keep the initial
  refactor behavior-preserving and the Allwinner format callbacks unchanged.
- Recheck the remaining command/DMA events after draining a timed-out
  handler, as suggested by Sebastian Andrzej Siewior. Accept completion
  during cleanup and balance IRQ disabling even when the recheck succeeds.
- Link to v7: https://patch.msgid.link/20261014-submit-sunxi-nand-vendor-oob-layout-v1-v7-0-5d3fc6ad2da1@gmail.com

Changes in v7:
- Put a behavior-preserving OOB refactor first, the correctness fixes next,
  register-access optimizations after them, and the binding and Allwinner
  format last. Keep 16 patches with no external prerequisites.
- Keep logical-step length, read recovery, IRQ lifetime, write failures,
  pattern IDs and DMA limits independently reviewable. Correct pattern-ID
  selection before introducing per-transfer status caching.
- Update both DMA callers with the protected-OOB helper contract in the
  logical-step length fix, before the later batching change.
- Isolate format policy behind its own callbacks and one opt-in attach
  path. Fold packed H6/H616 geometry and contiguous parity reads into the
  final patch, leaving existing format callbacks unchanged.
- Use scrambled_plain_bbm_oob for the existing scrambled profile and
  allwinner_oob for the firmware profile. Keep shared randomizer helpers
  generic and name the H6-generation spare predicate after H6.
- Clarify protected-OOB terminology, logical/hardware indices, transfer
  failures and the limited small-page read scope. Explain the RT timeout
  mechanism and disable_irq() tradeoff discussed with Miquel Raynal.
- Explain installed-format compatibility and that the spare check re-encodes
  ECC-decoded protected OOB rather than rereading physical bytes.
- Drop the standalone OOB-helper renaming cleanup and explicit stable Cc
  trailers; retain Fixes tags and Conor Dooley's binding Acked-by.
- Rebase onto current MTD nand/next.
- Link to v6: https://patch.msgid.link/20260914-submit-sunxi-nand-vendor-oob-layout-v1-v6-0-2fb084fe0751@gmail.com

Changes in v6:
- retain the bank-sized first DMA batch, but transfer later logical steps
  individually to avoid PAGE_OP's absolute internally generated main columns
- keep ECC exception mode enabled for randomized reads on all supported
  controllers, using the shared physical-pattern classifier
- classify uniform-pattern steps even when hardware suppresses their ECC
  errors; skip their correction counters and preserve decoded buffers unless
  the page-wide zero override or vendor spare predicate accepts the page
- Link to v5: https://patch.msgid.link/20260913-submit-sunxi-nand-vendor-oob-layout-v1-v5-0-7d711076a6f7@gmail.com

Changes in v5:
- add a separate small-page command-handling fix: use READ0/READ1/READOOB
  with the page address for rereads and normal OOB access, and select PIO
  instead of the large-page DMA sequencer
- keep physical reread errors visible, preserve the OOB cursor and retain
  the existing ECC geometry requirements, including rejection of 512+16
  with controller ECC
- group the small-page fix and the DMA register-bank fix with the opening
  fixes, ahead of cleanups, bindings, format support and optimizations
- make the DMA register-bank fix independent of randomized-OOB support
  and the later register-access optimizations
- Link to v4: https://patch.msgid.link/20260912-submit-sunxi-nand-vendor-oob-layout-v1-v4-0-4a64bed94229@gmail.com

Changes in v4:
- prepend an independent fix for completion reuse and IRQ timeout races:
  initialize the completion once, finish IRQ register updates before
  signalling success, and drain timed-out handlers before clearing their
  interrupt state
- add a separate fix for aggregate protected-user-data register overflow
  by splitting DMA transfers into bounded batches, retaining the existing
  OOB layout, ECC offsets and DMA support
- distinguish logical page steps from batch-local hardware slots, retain
  page-wide ECC accounting and avoid retrying partially transferred writes
- Link to v3: https://patch.msgid.link/20260909-submit-sunxi-nand-vendor-oob-layout-v1-v3-0-838cb0ba1547@gmail.com

Changes in v3:
- add a prerequisite fix for the logical OOB length used by PIO transfers
- clarify logical ECC steps versus hardware slots and share protected-OOB
  register indexing
- select the controller-specific vendor spare-byte erased-page check from
  the SoC capabilities, only in randomized-OOB mode and without rereading
  the main data
- retain hardware-decoded data and protected OOB on other ECC failures
  for bad-block and BBT pattern scans (reported by Miquel Raynal)
- retain a bad marker and ECC failure for all-zero physical pages, and
  disable the ECC exception for the vendor format
- share page classification between PIO and DMA, reading complete pages
  for randomized-format subpage requests
- propagate OOB read errors and defer randomized-format ECC accounting
  until those reads have succeeded
- propagate read/program setup, column-change and buffer-transfer errors,
  including extra OOB; stop failed writes and disable ECC and randomization
- discard partial DMA ECC statistics before retrying in PIO, and keep
  correction counts separate from successful OOB-transfer status
- select the current hardware step's pattern ID instead of slot zero
- avoid a second program confirm after an OOB-only write
- avoid redundant column changes before writing extra OOB bytes
- reject oversized ECC steps in randomized-OOB mode before the core can
  fall back to software ECC
- combine adjacent parity and trailing OOB reads in randomized-OOB mode
- remove duplicate chip setup immediately before core page commands
- program each packed DMA user-data length register once per operation,
  and write PIO slot zero directly without read-modify-write
- reuse pattern IDs and packed error counters within a DMA read, while
  refreshing the snapshot after every PIO ECC operation
- Link to v2: https://patch.msgid.link/20260904-submit-sunxi-nand-vendor-oob-layout-v1-v2-0-b12074f4aca7@gmail.com

Changes in v2:
- rebase on the current MTD nand/next branch
- retain the merged protected-OOB allocation, BBM reservation and
  stack-buffer fixes
- clarify that randomization is part of the normal hardware-ECC page
  format while MTD_OPS_RAW continues to expose physical bytes
- explain why a BSP-compatible BBM remains randomized in physical raw data
- document the decoded bad-block and flash-BBT access paths
- reject the firmware OOB format with software or disabled ECC
- document the BSP page-format compatibility contract and the
  older-controller format audit
- Link to v1: https://patch.msgid.link/20260810-submit-sunxi-nand-vendor-oob-layout-v1-v1-0-463853a14ad9@gmail.com

---
James Hilliard (26):
      mtd: rawnand: sunxi: centralize OOB handling
      mtd: rawnand: sunxi: share the buffer transfer chunk size
      mtd: rawnand: sunxi: avoid duplicate chip setup before page commands
      mtd: rawnand: sunxi: reject pages exceeding the ECC step limit
      mtd: rawnand: sunxi: use the logical step's OOB length in PIO
      mtd: rawnand: sunxi: propagate page-setup and erased-check errors
      mtd: rawnand: sunxi: drain interrupts before reusing the completion
      mtd: rawnand: sunxi: stop failed program operations and disable ECC
      mtd: rawnand: sunxi: select the pattern ID for the current ECC step
      mtd: rawnand: sunxi: preserve synthesized zero-pattern data and OOB
      mtd: rawnand: sunxi: propagate buffer and column transfer errors
      mtd: rawnand: sunxi: avoid a second program confirm for OOB writes
      mtd: rawnand: sunxi: use page reads to reposition small-page NAND
      mtd: rawnand: sunxi: bound DMA batches by the user-data register bank
      mtd: rawnand: sunxi: send all address cycles in split operations
      mtd: rawnand: sunxi: propagate chip clock setup errors
      mtd: rawnand: sunxi: limit buffer transfers to the command byte count
      mtd: rawnand: sunxi: skip unavailable NAND child nodes
      mtd: rawnand: sunxi: scan all chips before registering MTD devices
      dt-bindings: mtd: sunxi: require the H616 AHB reset
      mtd: rawnand: sunxi: reset the H616 data path after DMA aborts
      mtd: rawnand: sunxi: reuse ECC status within each transfer
      mtd: rawnand: sunxi: avoid redundant column changes for extra OOB
      mtd: rawnand: sunxi: reduce user-data length register accesses
      dt-bindings: mtd: sunxi: Add randomized OOB flag
      mtd: rawnand: sunxi: support the Allwinner randomized OOB format

 .../bindings/mtd/allwinner,sun4i-a10-nand.yaml     |   13 +
 drivers/mtd/nand/raw/sunxi_nand.c                  | 1713 ++++++++++++++------
 2 files changed, 1229 insertions(+), 497 deletions(-)
---
base-commit: 30daaf3e7897b4a8d9b72e5b0c86dd6e2a4d7d85
change-id: 20260810-submit-sunxi-nand-vendor-oob-layout-v1-e3114d10cc9c

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

