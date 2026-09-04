Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2211E3FCB37
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 21:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788557020; cv=none; b=CpbouitKmQ7kJ8kfnE/zE53NLpsM9bkneXfkAP93Arl7VaKiq+XDu64JKltgvwL1rmKzpjKpe/5kayDlOHxu82FhpWmWYRjSUFM7acEMDr4ExT3JGQ2zSAfOzUzMFurk0rLV+o448hkSGvef43SsskRTR8FafC6RdAHvlO9142I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788557020; c=relaxed/simple;
	bh=Dat22XcEtkNthp4y9uxCdEhxOsVUqkKHl6Dkr6hi1yk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=XyYQpc9KEOrqQc25qvNaolAKQfPS/1xksP5mtkczyfeSk6uXJ5NuIyMTgfAlhS0buFN19mRLKS03VTC+Tgm37mcmIokn9BA0FKhbkTElOQ/hXhwyZxyeaki2DkzIEO2+NqaFk1KtT1Mm/pJqWZg/nWOYTHhkaFOp3EL0fEDgQpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xeljq/9J; arc=none smtp.client-ip=209.85.161.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xeljq/9J"
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-6b613d3e19dso1741058eaf.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 14:23:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788557015; x=1789161815; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=4PTtIkVinTEtahlfN7FKi4R1ua5dA2ivK/7V+ltLqrA=;
        b=Xeljq/9JLA5dnba+Qd8N0cFQva+K6NjFBGmWQ+YrdfZ5ZXB1NqSDrmtDt4k0if5GTM
         Oz6YnwJRuF1bpAkPgb3Y+HpmV3+zDsFd2UWn7zrl23iJHnppNBPsIEn8Zftz5KgnE+Mm
         KjmNc7kJ2YWERwmYeT6Yp/PkvLvA82CmU+QJlglJZDwW+MoRjsz2WOk//yu2a3jZeUAO
         KUqHVA3jtR00dc7EsWqfeaitZl+dZVEb/lZl1aHCX2CaGF05fRB3PVIns5vuqGYs/ZHI
         WvTzyf6Tif1U0tBj6IwHDT3fE3UK+9FYlSlCCivi6HEptvyRhK9TsCLSpITp2blr8q/Q
         fUPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788557015; x=1789161815;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4PTtIkVinTEtahlfN7FKi4R1ua5dA2ivK/7V+ltLqrA=;
        b=c/p5VgTfiO+jEUQR3HNJyzn9rt9gZICGh4OqDE+j4T/DkEOX+mc2HnFmPUhcAkQ6DM
         kUp00yDFTYnKDPZyvBQNdQZFsc7zUj7seZ3/J49hEfWxAYkjPIinLL9jF3qrm4083RYr
         HPBv8+yzegODIub0xnrOmNWLwrqStWWrGywqiJws8kRNW7/Jk7ZN3dI9b92sI5JA2bRG
         JPZoDQyleQjDdR5RaasGvyKe9lJTlKK56W/fD3eKsKNsLa4oe+a7E8tQG+vH0zoGMQis
         QEsbrTZ7KjwQll1azRKfq9MrsetRVqSVYnQzqV/DRLkLUPH48Jqeo8vlUo3v0ekPTeUQ
         v9Jg==
X-Forwarded-Encrypted: i=1; AKwUvBzOeUWnNtyKwwDlegw0v3ee2Q9tJrwEUW5OOK40B2mGT/kd/LRT8v+GxUMuUGmyV7GgVG+z2OMQ4QyL1YM=@vger.kernel.org
X-Gm-Message-State: AFuF++nuI/B+95pNSf+DLIMFzaYWf+FzaLT/Ip0PEJocKg0Z85S+0Ain
	Ae0lOXsuDU0pndx0170DS2UwrxqhB7+vnKARR6hBDSTeSaFwoONiLC6m
X-Gm-Gg: AYBFou0Ww9hT9LcYjVY3GcbxyImBqs0rwkbw2FCZa0Iu87FkuFmVUJpieOCW4zCRuTU
	YOXNthLImqK5UiW1mYkc2zNlSB7gSKq/hwCkGaH7F9CJcH/vJB+CraOtlGeK9XOk5sxOSapQqob
	vlgJyQnFdJMD3ThJJaWGmVypbASThkUUWDmAaNyblIBO9kUbue3Q2vIq7iaZQt6yq4IlelI8hHS
	ut6nuMIoajDiQv1s0Ghh5upu/Nf8J2OgEuP3NeQUVQeJkjmyzM5/WzLBXqGGTM3MaXmGF7wX4qH
	XDovY264xtfkz4NHmQrAjYljdGJHBoXwEnsPiTWMhVDlsiwJdNafGwAiYNp+l93oK2CXhxRUL01
	AbijIOgFEH5bhjQXq/cqq1LapaWUoAWK4uHW0S55/yutHnIvXDcqTwezs0qX6en6tOqcYCgbaKN
	wxP51u22qpicKqYRJhL+vyuW8L1embZzaWaohx7RNJJgh+nk0eDUPXJFsP0SflEpFJHueFLWJGR
	U0uA/QqloGg1bjno63dDwGtSloXEoS4GBpi6FhZyk4DdAjty3BR34v5k98LZqXL2A6pvoRB8XtF
	5T+8d61uUuwgRkbtcimAjxB0l0jGYeLxvehlXRPQJCdM2NjUz/XOrFwePOXB8FmA4kuSxdI4Aqw
	0tnWuCYbzKkuPIaT3qGc=
X-Received: by 2002:a05:6820:618:b0:6b5:ec3f:4981 with SMTP id 006d021491bc7-6b71fe45f4bmr3369775eaf.28.1788557015327;
        Fri, 04 Sep 2026 14:23:35 -0700 (PDT)
Received: from [127.0.1.1] (184-96-151-165.hlrn.qwest.net. [184.96.151.165])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b6dbedc6fasm4492259eaf.3.2026.09.04.14.23.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 14:23:34 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH v2 0/3] mtd: rawnand: sunxi: support the Allwinner
 randomized OOB format
Date: Fri, 04 Sep 2026 15:22:10 -0600
Message-Id: <20260904-submit-sunxi-nand-vendor-oob-layout-v1-v2-0-b12074f4aca7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5WOQQqDMBBFryJZd0qiVrSr3qO4iMlUp2hSkhgU8
 e6N9gSFgc+Dz/uzMY+O0LN7tjGHkTxZkyC/ZEwN0vQIpBOznOcVrwUHP3cThRRmITDSaIhotHV
 gbQejXO0cIArAQohSC65Uo1iSfRy+aDmHnu2Pk+mNKhz2ozGQD9at5ydRHL2/R9NxKKuivhVSl
 FI3j36SNF6VnVi77/sXCzwag+4AAAA=
X-Change-ID: 20260810-submit-sunxi-nand-vendor-oob-layout-v1-e3114d10cc9c
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

The sunxi NAND driver applies page randomization from its normal
hardware-ECC page callbacks. Each page starts from a page-dependent seed.
When protected OOB bytes are transferred separately, the driver uses
precomputed randomizer states advanced according to the ECC step size.
Erased-page detection and its physical-data fallback also live in these
callbacks. Randomization is therefore part of the driver's hardware-ECC
page format rather than an independent MTD access mode. MTD_OPS_RAW
continues to bypass both ECC and randomization and exposes physical main
and OOB bytes.

The mainline format compensates the bad block marker before writes and
after reads so that it remains plain on flash. On H6 and H616 it also
fills the OOB space left after ECC with protected user data. Allwinner
NAND firmware instead leaves the marker in the randomizer data stream
and, on H6 and H616, uses a fixed protected user-data placement. These
choices produce incompatible physical OOB layouts.

The Allwinner BSP implementations for the SoCs covered by the two older
mainline compatibles (sun4i, sun5i, sun7i, sun8iw3 and sun8iw5) likewise
pass their protected user-data words to the controller unchanged while
page randomization is enabled. Their 128-entry seed tables match mainline,
and those controllers have the same fixed four-byte-per-step user-data
layout, so only the marker handling differs on those generations.

Add allwinner,randomized-oob to select the firmware's normal-page format
for the configured controller hardware-ECC geometry. The property marks
the NAND as requiring scrambling for normal hardware-ECC transfers, omits
the marker compensation, and selects the controller-specific protected
user-data placement. H6 and H616 use four protected bytes per 1 KiB ECC
step, capped at 16 bytes, with the complete protected region placed before
the first ECC step. Older controllers keep their already matching fixed
user-data placement. Assuming the standard ECC geometry is configured to
match the media, these choices make normal reads and writes compatible with
BSP-derived images.

The property does not change the per-operation raw-access behavior. Raw
accesses continue to return the physical representation, including a
randomized marker when that is what the firmware format stores. A physical
marker cannot be both plain and compatible with firmware which stores it
randomized. Normalizing only the marker in MTD_OPS_RAW would make the result
non-physical, while enabling full-page de-randomization would make it a
decoded access rather than a raw one. Preserving both the firmware format
and existing raw semantics therefore requires raw access to expose the
randomized physical marker.

The raw-NAND core's bad-block and flash-BBT paths remain on decoded
accesses: nand_block_bad() uses ecc.read_oob(), OOB scans use
MTD_OPS_PLACE_OOB, and BBT data reads use mtd_read(). They therefore receive
the logical marker and BBT contents through the hardware-ECC/randomizer
path.

When the property is absent, retain the existing mainline marker handling
and H6/H616 maximized OOB layout.

Tested on an H616 board with a Toshiba TC58NVG1S3H NAND using matching
Linux and U-Boot implementations. Linux initialized the NAND, SPL and
U-Boot cold-booted from it, U-Boot loaded the FIT from UBI, and Linux
attached the same UBI with 2004 good PEBs, two bad PEBs and no corrupted
PEBs. A target-timed 64 MiB read through /dev/mtd6 completed without
reported ECC, timeout or I/O errors.

Validation completed with strict checkpatch, dt_binding_check and an
arm64 W=1 object build.

Assisted-by: OpenAI Codex (gpt-5.6-sol, max)
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
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
James Hilliard (3):
      dt-bindings: mtd: sunxi: Add randomized OOB flag
      mtd: rawnand: sunxi: support randomized OOB formats
      mtd: rawnand: sunxi: select the packed H6/H616 OOB layout

 .../bindings/mtd/allwinner,sun4i-a10-nand.yaml     | 10 ++++
 drivers/mtd/nand/raw/sunxi_nand.c                  | 56 ++++++++++++++++++----
 2 files changed, 56 insertions(+), 10 deletions(-)
---
base-commit: def559a215699aa2f2d8ef98f30156b9d562a154
change-id: 20260810-submit-sunxi-nand-vendor-oob-layout-v1-e3114d10cc9c

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

