Received: from mail-oa2-f12.google.com (mail-oa2-f12.google.com [74.125.231.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 912D532470E
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 03:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789354899; cv=none; b=i7ox742cfD6D06+NkXbay8/xZex+vJDR1mmDhsWiiQ5WlTKKMY6HXvNj8C8utYGqv8J3Xr6+J4PzEkkQRITAf4H9SM8I4K6SGd/rgqYxEnJYJL9YAS0CYoVp9u5SV3nWRRniL3HAIoCGJBQqwiWr2Cw0ZL56oVelAQ2De5aNlfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789354899; c=relaxed/simple;
	bh=Pi6YDXOmrmzc3kuI0rj21OMihyFbVdTsdDqZvaKEQ6U=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=lz+keG7LvjzixKYOHrzatUqSETKb+7TORR3yrDtrzQQCGh4Ech/345Ke+eFIZa/NSwtFxZ0xo3zyioY1JvlarXHctI3QnPVxMVjBX3JiT2kF+61VrJmbKW6b4vVQA9w7t13CVjV0LwXb5JC5Xkdy4/a3R7KzQ5j7VLBkp3RmM14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ISktQbGC; arc=none smtp.client-ip=74.125.231.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ISktQbGC"
Received: by mail-oa2-f12.google.com with SMTP id 586e51a60fabf-466cc9b2f02so393554fac.1
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 20:01:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789354896; x=1789959696; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=jnEXefFLpaIksM6/IH6BmftoOS/Z3PWT+GpaSS3SKPo=;
        b=ISktQbGCwERh+dbq2+JNjpq0jOYb78qqna1qBP4ocQfhfnqUDCYmvoJ6sUlNZLPIH8
         1O0wFbOLJQhr71IJEb0K1ugmsI9phV0EI+fx4+SrJjLxRUMLl8jNp9mbUdBjlKhrAwFm
         j5nFySI17vx8EWZVN18n+LGc9j7msgQCXATgbtO/t9e7CuiYiGNK8NEICvLm3AvZGapU
         76zIU2Nsxtiex3+TYETGAbat5g0uqa9QY+x9qshetpTukche4mF4WWrZn/qQflfqylzU
         0Y89Qa54ogNom6WMHgtgRSa4qU76eT8iRVgYOohKsMT2Th/UCryj2oetJTWfoXtbLvjN
         7sHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789354896; x=1789959696;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jnEXefFLpaIksM6/IH6BmftoOS/Z3PWT+GpaSS3SKPo=;
        b=TbfFNgJMgQRdqv+8H+8h28w2KrbwczDhBuAcmKmtBpzmFOp+nrtzIkIo0ooRW/tJgC
         O+MSKGjziBD91JYRZVfLA8i81MBROH+JfdaQgwpnyx0CSsJGZ2VFaejJ10obs0KNvjk3
         yr2y7CxbyeDycohWSK32/N51yez31wFsEV4mChkMEIiMVC2lLLhu9T9sIpb7CQIoxHYV
         mtlK0O7xdC//bihC6pod5Mo/OjFoJkP71nfuQkp+unGlps3DooYmzDzf2C5xrbZob5ap
         FYvLyBZBJK+7BON1E79WpJKJNP+uMUAvkFLz4XoiXkaAUpLRuvUnYpy9ugLgGDGhIQjH
         6XpA==
X-Forwarded-Encrypted: i=1; AKwUvBxpTDoyqqC3ImjIa+g3dYxG9cpHcVxwOWjp+aQyiOO5puPq64/FTYD9O5bSko0yyLcy2Us3stj14KfkaXo=@vger.kernel.org
X-Gm-Message-State: AFuF++nCW/QfohfEsG1+kyErd9BfXVqHec4KGWDrf823giAVP9K9L8my
	ZT5v1RZUlrCzr0E9NjFCT4lHPpxtIeNza7VkWeh10+yFDi7dqeT3Maf5
X-Gm-Gg: AYBFou0RRBgklhPjuUZbIZEOI2nXaDSgKJbustjlYwCTMxVe/0MEIqG9xlEJ4ii6YiW
	pRlPhDUWIna6y1cYKBmbF5vNo4hYsygKG6oB49eC7VBRACMBiwWQRL3G2sgRdeuPnBAFZ3TBFfk
	kblERhnq7JkMDTFNhFEiTZUo4y783BFsNocF4aFTJU3PiZ3lv8bsQHQKGYC/wQHQs1WhXKsIAnk
	yQJzd4mS/gFMewYJO7dRHQLz2mW+29Sw7GIY1+pFxyio41jruOIu8cjwd7OLCQsERn5JBoP2P7+
	6px/D6HBfeOk+IgnCrfvaZ3dKJ65boJc8DrOh32zaEXZmFM1CxvotxfjdH9DVlqHx2Lusege5Zy
	q85MKNL9zbe15jcsNVYgnddXeJD3LLGPtBInJP2U7PIj7TaMQSoOK3CLc6i0krzoxotSRt9zR3c
	KGFeEJUreJubuOs+PGJgrzlGqmT2Vld02uP79I3mmAzRYCpbg6JY3DbLalK96l7jHwpRDROtAUe
	kjA5dEvnBG8KC1lZwRxLEgzCefmtmXMUFFFBapV/FiBiGasA1HC63ZVUo6i/We6tB596AxS9h1p
	FRT5zBpWUQV+a+s5O1NeCbIB4OSmzYnmLYMZuy1fmEdDiBBtI71VQ+biF1Xqme46Oanlkf/sOuj
	gXtknnXf5ByHXyJg5r88m26lmK1i0Nw==
X-Received: by 2002:a05:6830:2a8a:b0:806:24fd:7c10 with SMTP id 46e09a7af769-80884cc9d67mr340575a34.7.1789354896400;
        Sun, 13 Sep 2026 20:01:36 -0700 (PDT)
Received: from [127.0.1.1] (184-96-157-145.hlrn.qwest.net. [184.96.157.145])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-803f60feba1sm10619014a34.13.2026.09.13.20.01.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 20:01:35 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH v5 00/18] mtd: rawnand: sunxi: support the Allwinner
 randomized OOB format
Date: Sun, 13 Sep 2026 21:01:06 -0600
Message-Id: <20260913-submit-sunxi-nand-vendor-oob-layout-v1-v5-0-7d711076a6f7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5XQz2oDIRAG8FcJnmtxdHazm1Pfo/Qw/kliyWrRj
 SSEffdqemjaXrYgDB8Mv0/mxrJL3mW229xYcsVnH0MN3dOGmSOFg+Pe1sykkL0YQPB81pOf6wg
 XzwMFy4sLNiYeo+YnusbzzAtwpwDQgjBmNKxiH8nt/eVe9Pr2lav07szc9LZx9HmO6Xr/SYG29
 +/S+gTHXg2dIkCy48thIn96NnFirbTIb3YUuJqVldUgxRb3SIa2v1n1yI6rWVXZQQ1GC03Q4R8
 WH1iQq1lsR6AetbMjSvnjCMuyfAIJbfDy8wEAAA==
X-Change-ID: 20260810-submit-sunxi-nand-vendor-oob-layout-v1-e3114d10cc9c
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Brian Norris <computersforpeace@gmail.com>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.15.2

Allwinner NAND firmware leaves the bad-block marker in the randomizer
data stream. On H6/H616 it also places all protected user data before the
first ECC step. These choices differ from the mainline format, which
keeps the physical marker plain and maximizes the H6/H616 user-data area.

Add allwinner,randomized-oob to select the firmware format for the
configured hardware-ECC geometry. Older controllers keep their fixed
four-byte-per-step user-data layout; H6/H616 use four bytes per 1 KiB
step, capped at 16 bytes, packed before the first ECC step. Without the
property, retain the existing marker handling and OOB layout.

Normal hardware-ECC accesses use the controller randomizer. MTD_OPS_RAW
continues to bypass both ECC and randomization and expose physical data
and OOB, including randomized markers stored by firmware.

Address the ECC-error paths as well. In randomized-OOB mode, use the
controller-specific vendor spare-byte erased-page heuristic on the
protected user data from the original hardware read. Older controllers
use exact erased-spare checks, including their first-page and page-127
signatures; H616 requires byte zero and at least nine of ten spare bytes
to be 0xff. Accepted erased pages return all-0xff data and OOB without a
raw reread. An all-zero physical page instead returns a bad marker and
an ECC failure.

Other ECC failures retain the original decoded data and protected OOB for
bad-block and flash-BBT pattern scans. PIO and DMA share this page-wide
classification, including randomized-format subpage reads. Plain-marker
mode keeps its existing physical erased-chunk check.

Start with fixes for interrupt/completion ordering, PIO OOB lengths,
per-step pattern IDs, read/write error handling, duplicate OOB program
confirms and the extra-OOB cursor. Follow these with the small-page
command fix and the DMA register-bank fix, then the OOB-helper cleanup,
binding and randomized-format support.

Use page-addressed reads to reposition small-page NAND in hardware-ECC
read paths, retaining transport errors and the existing geometry checks.
Select PIO for those pages because the DMA sequencer uses large-page
random-column commands. Large-page DMA and the on-flash layout are unchanged.

Bound H6/H616 DMA batches by the 128-byte user-data register bank.
Keep the existing default OOB allocation and ECC offsets, reusing hardware
slots across batches instead of changing the format or falling back to PIO.
Preserve page-wide ECC accounting and a single final program confirm.
All of these fixes apply without the randomized-OOB property.

Finish with optimizations to combine contiguous unprotected OOB reads and
reduce repeated chip setup and register accesses without changing the
page format.

Assisted-by: Codex:gpt-6-astra
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
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

To: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>
To: Vignesh Raghavendra <vigneshr@ti.com>
To: Chen-Yu Tsai <wens@kernel.org>
To: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Samuel Holland <samuel@sholland.org>
To: Richard Genoud <richard.genoud@bootlin.com>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Maxime Ripard <mripard@kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
To: Boris Brezillon <bbrezillon@kernel.org>
To: Brian Norris <computersforpeace@gmail.com>
Cc: linux-mtd@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-sunxi@lists.linux.dev
Cc: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org

---
James Hilliard (18):
      mtd: rawnand: sunxi: drain interrupts before reusing the completion
      mtd: rawnand: sunxi: use the logical step's OOB length in PIO
      mtd: rawnand: sunxi: propagate page-setup and erased-check errors
      mtd: rawnand: sunxi: stop failed program operations and disable ECC
      mtd: rawnand: sunxi: select the pattern ID for the current ECC step
      mtd: rawnand: sunxi: propagate buffer and column transfer errors
      mtd: rawnand: sunxi: avoid a second program confirm for OOB writes
      mtd: rawnand: sunxi: avoid redundant column changes for extra OOB
      mtd: rawnand: sunxi: use page reads to reposition small-page NAND
      mtd: rawnand: sunxi: bound DMA batches by the user-data register bank
      mtd: rawnand: sunxi: clarify OOB register and step handling
      dt-bindings: mtd: sunxi: Add randomized OOB flag
      mtd: rawnand: sunxi: support randomized OOB formats
      mtd: rawnand: sunxi: select the packed H6/H616 OOB layout
      mtd: rawnand: sunxi: combine contiguous unprotected OOB reads
      mtd: rawnand: sunxi: avoid duplicate chip setup before page commands
      mtd: rawnand: sunxi: reduce user-data length register accesses
      mtd: rawnand: sunxi: reuse ECC status within each DMA read

 .../bindings/mtd/allwinner,sun4i-a10-nand.yaml     |   10 +
 drivers/mtd/nand/raw/sunxi_nand.c                  | 1168 ++++++++++++++------
 2 files changed, 836 insertions(+), 342 deletions(-)
---
base-commit: 7e874b1750a40f3dc9a629aeb72eba09c77f77e9
change-id: 20260810-submit-sunxi-nand-vendor-oob-layout-v1-e3114d10cc9c

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

