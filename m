Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D63EE5678EC
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 16:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790094887; cv=none; b=bmZzle7BleZLtifoPv8dvkEZT7nflI2uzx1pYhPPIGY3ry51sRHbSmzXVOBrDtvI51Vb40HaYmwSlx21ygJOR002lzCr8nQjP9d8wWpVtFJ7qAl+3j0ySkIDtWPoCGwaqSV9yBhFO5f+gjunDCDjYLpfXb/pulYrQDHS9uT55gY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790094887; c=relaxed/simple;
	bh=p0Hg9vo8WqRv9cgp08CP8Ox04rt997i6YjbkGrvr+eU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Zn4dTawvah0aSiAiJTrcMaYsnaH2+xmFWsM+knWh+nB9/F9R8X8d3JxnIi2Jxr95MKFPQA1vQFVntGj74t7FdMUsL3+j842Dl9IWPGdMBSKSx1oE713fqesY6jgWXh7z3Rh692R9c2DGJvtW+Sl+iWYTLzK7jl9LnjvbpX9Wl7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R/8wWlbJ; arc=none smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R/8wWlbJ"
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-8121458be2dso40880a34.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 09:34:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790094884; x=1790699684; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=dHxDHdcrr+OPOjnfS14OYLfhc1nlgKQw+MzCCUzeoAs=;
        b=R/8wWlbJMdKISta37RlKy1+STbeyEEcImnDMPHCH1VVJVBtl3pgeWhzbyYfVazZWmN
         /5oz8Lzpwq9KpKLLf+wemih5ft0cDO0RklIDb7DIIg8uxAp/WV4FZskRDaPUmZfkI1Jx
         f8IIsCr+xs5DPq47dVajThMG+Uaw9Dy2K/KR6yk0cna3eFtXNQ8chb8Q4K9wdok+J/Cr
         CjO/+1gOtdESdkznVcMWH/lJUi1TMkkQnmfxfXkYZjhCy4ZK9VbEUP4dXAtcKnw1fb0f
         92Mhz+tPy4PRWmtXVimWtMpm+Cx254ckzJLnUuwpMFP2ftBNfp7G0rwZ4e6nezg/6kaH
         5vAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790094884; x=1790699684;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dHxDHdcrr+OPOjnfS14OYLfhc1nlgKQw+MzCCUzeoAs=;
        b=sX3WOD1l6w5E9Ki6csUVRQ057hZKS2RUIRO5DH+s+CFnsGu+UcFLKSYro1S6guHpa6
         VOTC4/oKRzpiQI++DRhJn9p8NG+EV/4gcXxPapO1BnpEIL0kDpzzZIXuu51a3Rl8XepI
         Gz48AGLbuYq4pwYFjcfviG28tKCtjAASkMJeONqwWSvB8WedvuS3rP8++aTVdol8LwyO
         NxxYJ8uIf54DeyCoeCz29/6/j7eDwVZ5vfqrvH1u+9f82Ib2x4idYlQ3glwdk47vKaSE
         aO6tbWc9Y5IPwTPOdqGqGaVt3Rnrvilk2VfYm/1CSXAhE3FKrBcYCdA5/fEyiT6cSbA/
         CEVA==
X-Forwarded-Encrypted: i=1; AKwUvBxmQgsKuHx7sjL2TGG2f0A2IroePhTKa1MbCodT9sOxpxxSwlU6Ti4J4EbBLgdydiT3nIhnwY6gUymWhZU=@vger.kernel.org
X-Gm-Message-State: AFuF++nPhd6GxmsLbob6LzHQvPf+g46IRURCbWrVDP1wYyJKzR1BGzFO
	GV9H/xIlBiev/wBZvUE8uwMvYdS57KIR3UJnrrCiH1A81WEJw64Eh3gl
X-Gm-Gg: AYBFou2dQ2Wby6rgFrKaSl7wRvLflymaWhgA7YoTc9LUdriOw1+I4PQQmcmy4rNZHaI
	or0nxZIWWyJKn2bccfSmbrLuO76BnkUXQ8KCberZ488+k5mtZg1gAo5Z79CIL43bIhXSEXaPsJD
	xBXVzCt95xJQtzr3iWoiAkRNX4BEvHHOmv9oZqX4VvudvjwxuKjcctx38+UfhXcp/ANaU49xE8c
	lJ+X+ynlxT12aPRbUS6ZUkIBqVAqn+cMmDien6dKzFM5uj1CJFCrXh4WqBDTCaqFpFk7z3w5jJq
	ygQYH5XctkvigfM1WO2T5f1BS3qdF5L0Q++aDzaa5VmpKC3uVw702Jxw62vMxY3Nnpwo+AuhNoP
	RoeXoEc+ZdalZY9RqVv7k7C1LPYTkGyneLSvYMv+IrJMaHK6tvnWR/MYfYThB5juGBHHHxSU6UY
	o8dbMXnQJRUSEClUXv+Fmyp9ib22FIx+QL9Mdx1r3CzapNcjRXqpMd0F4srRlqWU882RUgYkT0Z
	UpypIX5Rhy34xA09Y/jd4OdwyxP1jQKZ9hjUa0K/09NUH6sybh7ZFkpm9G7d5r6GP9J80XGtgTV
	mnHHW75ccUcazcpAIp/s7ZIoknocoJy2csXmeRID3XdF9csX3MIc6fVX23hbWr5gPkOjenl3UOP
	d5c3nJrrCTn3wIGyqH42QiQ==
X-Received: by 2002:a05:6830:1d56:b0:808:da23:ebdc with SMTP id 46e09a7af769-81489105c08mr2131886a34.19.1790094883613;
        Tue, 22 Sep 2026 09:34:43 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-814e0a13a73sm2679320a34.0.2026.09.22.09.34.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 09:34:43 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH v13 0/2] mfd: add X-Powers AC200 support
Date: Tue, 22 Sep 2026 10:34:33 -0600
Message-Id: <20260922-submit-ac200-mfd-v13-0-8832afd2481c@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4XOwU7DMAwG4FeZcibI8ZrE4cR7IA5JnGxBdEXtq
 DZNe3fSgbRqrcTxt+zv90UMqS9pEC+bi+jTWIbSHWpQ26eNiHt/2CVZuA4EAhogpeTwHdpylD4
 igGwzSwqeDYNLSFrUs68+5XK6mW/vv7nefKR4nJxpY1+GY9efb6Wjnvb+eHB3/lT5Lks+H3xbo
 hyVHLUEGbJXmbSigPS6a335fI5dK6ai0cyotU9HU4Gog0KHkRq3AOx/gK0ABTBZa/QN20eA7oA
 DXAGoAug9GIsQyMdHwM2B7QrgKmCCTYyWHLkFoGAumBVBQSWyRkzEEQM3C0LNCbtGqEpoYnYcb
 TbOLwicE26NwEr4pmET4hZ8k+fE9Xr9AWeqR2uaAgAA
X-Change-ID: 20260811-submit-ac200-mfd-8bad6d09e285
To: Jernej Skrabec <jernej.skrabec@gmail.com>, 
 James Hilliard <james.hilliard1@gmail.com>, Lee Jones <lee@kernel.org>, 
 Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>, 
 "Jagielski, Jedrzej" <jedrzej.jagielski@intel.com>, 
 Andre Przywara <andre.przywara@arm.com>, Chen-Yu Tsai <wens@kernel.org>, 
 linux-sunxi@lists.linux.dev, mfd@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.15.2

The X-Powers AC200 is an I2C-controlled mixed-signal companion IC with a
paged register map shared by its audio, video, RTC and Fast Ethernet PHY
functions.

Add a complete binding and an MFD provider with audio codec and TV encoder
cells. Describe the audio DAI, analog supply inputs, TV encoder display
graph and optional bandgap calibration in the parent node, without
separate function nodes.

INTB is optional. When connected, pass the physical IRQ to the TV encoder
cell for shared, threaded interrupt handling. There is no DT interrupt
controller or private IRQ domain. The ASoC codec and DRM bridge drivers
remain separate subsystem work.

The PHY remains enumerated on MDIO. Its separately submitted driver uses
the x-powers,ac200 phandle, a managed device link and dev_get_regmap() for
ancillary I2C register access:

  https://patch.msgid.link/20260909-submit-acx00-of-dynamic-v1-v11-0-eb45e89ef918@gmail.com

The two series can be merged independently; AC200 Ethernet requires both.
This series is based on the MFD for-mfd-next branch.

The binding and MFD implementation adapt earlier work by Jernej Skrabec
and Andre Przywara:

  https://github.com/jernejsk/linux-1/commits/opi3-eth/

Public documentation is linked from https://linux-sunxi.org/AC200.

Assisted-by: Codex:gpt-6-astra
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v12 -> v13:
- rebase on the current MFD for-mfd-next branch
- remove Andre Przywara's inherited Signed-off-by trailer from the driver
- describe the driver as the X-Powers AC200 core driver in the header and
  module description (requested by Lee Jones)
- avoid unnecessary line wrapping by using up to 100 columns
  (requested by Lee Jones)
- Link to v12: https://patch.msgid.link/20260909-submit-ac200-mfd-v12-0-a44d6bc30a4f@gmail.com

Changes in v12:
- add Jernej Skrabec's Co-developed-by tags to the binding and driver
  while retaining the sign-off chains (requested by Conor Dooley)
- add Conor Dooley's Reviewed-by tag to the binding
- update the companion PHY reference to the submitted v11 series
- Link to v11: https://patch.msgid.link/20260907-submit-ac200-mfd-v11-0-58dd9dc7f69a@gmail.com

Changes in v11:
- fold the codec and TV encoder properties into the AC200 parent node
  while retaining separate Linux MFD cells (requested by Conor Dooley)
- describe only the optional physical INTB connection; remove the DT
  interrupt-controller properties and internal interrupt-number header
- replace the regmap IRQ controller with a shared physical IRQ resource
  for the TV encoder, omitted when INTB is not connected
- mask all sources before enabling INTB and leave per-source interrupt
  handling to the function drivers
- pass static const MFD cell arrays directly to the core, without copying
  or filtering them by DT child nodes; share the cell initializers between
  the IRQ and no-IRQ arrays
- map the function supplies to the parent using MFD supply aliases and
  clarify that the distinct AC_LDOIN and TV_VCC inputs may share a regulator
- remove the DMA-mask workaround now that the cells have no OF nodes
- drop the binding Reviewed-by tag, which covered the earlier parent-only
  binding (requested by Conor Dooley)
- Link to v10: https://patch.msgid.link/20260906-submit-ac200-mfd-v10-0-f522e8dc2bd4@gmail.com

Changes v9 -> v10:
- combine the parent and function bindings into one complete binding patch
  (requested by Conor Dooley)
- introduce the complete MFD provider, IRQ controller and function cells in
  one driver patch, reducing the series from four patches to two
- retain the existing sign-off chains for the adapted binding and MFD work
- allow enabled codec and TV encoder nodes when INTB is not connected;
  require the parent IRQ path only when a TV encoder interrupt is declared
  or the parent advertises an interrupt controller
- add an unwired TV encoder example
- move the existing 40 ms wait before constructing and publishing the
  regmap, and clarify its origin in the vendor resume path
- use automatic platform-device IDs so MFD children from multiple AC200
  instances cannot collide
- initialize the parent's DMA mask for its non-DMA children, avoiding
  "DMA mask not set" warnings during child enumeration
- explicitly request level-low when no upstream IRQ trigger is configured
- keep INTB disabled until source masking and handler setup are complete,
  and disable it before releasing the IRQ chip on failure or removal
- narrow reset-preservation claims to avoiding a provider-initiated global
  reset; supplier unbind still tears down consumers and releases clocks
- Link to v9: https://patch.msgid.link/20260903-submit-ac200-mfd-v9-0-6b7ed278989c@gmail.com

Changes v8 -> v9:
- deassert common reset without first resetting the entire chip
- leave common reset deasserted during removal and shutdown, avoiding a
  provider-initiated chip-wide reset
  (reported by Sashiko and queried by Lee Jones)
- stop storing the regmap as unused driver data after dropping teardown
  callbacks
- describe the audio codec and TV encoder MFD children
- add the AC200 interrupt definitions and shared regmap IRQ controller
- register only enabled, DT-described codec and TV encoder function devices
- retain Jernej Skrabec and Andre Przywara's authorship and sign-off chain
  for the adapted child and MFD work
- make the base provider depend on COMMON_CLK before child support is added
- require an upstream interrupt when the parent is an interrupt controller
- credit Jernej Skrabec in the module metadata
- exercise child enumeration and parent-regmap access with temporary probes
- rebase on the current MFD for-mfd-next branch
- verify register-state preservation across supplier unbind and rebind
- Link to v8: https://patch.msgid.link/20260902-submit-ac200-mfd-v8-0-2aa06720b8ac@gmail.com

Changes v7 -> v8:
- identify the PHY series as the current regmap consumer
- describe future MFD children and the MDIO/I2C split
- store the regmap directly as driver data  (suggested by Lee Jones)
- reset the chip from the remove callback  (suggested by Lee Jones)
- drop the revision log and inherited-driver attribution  (suggested by Lee Jones)
- add Krzysztof's Reviewed-by tag to the binding
- rebase on the current MFD for-mfd-next branch
- Link to v7: https://patch.msgid.link/20260811-submit-ac200-mfd-v7-0-8b06f552a4d7@gmail.com

Changes v6 -> v7:
- drop the managed external-syscon helper and AC200 syscon registration
- leave the regmap attached to the I2C provider for direct device lookup
- reduce the MFD series from three patches to two
- Link to v6: https://patch.msgid.link/20260811-submit-ac200-mfd-v6-0-c5b1292c8498@gmail.com

Changes v5 -> v6:
- split the MFD work from the independently mergeable networking series
- rebase on the MFD for-mfd-next branch
- Link to v5: https://patch.msgid.link/20260809-submit-acx00-of-dynamic-v1-v5-0-bfa1f8518b28@gmail.com

To: Jernej Skrabec <jernej.skrabec@gmail.com>
To: James Hilliard <james.hilliard1@gmail.com>
To: Lee Jones <lee@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
Cc: linux-sunxi@lists.linux.dev
Cc: mfd@lists.linux.dev
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
James Hilliard (2):
      dt-bindings: mfd: x-powers: Add AC200
      mfd: ac200: Add X-Powers AC200 support

 .../devicetree/bindings/mfd/x-powers,ac200.yaml    | 168 ++++++++++++++++
 MAINTAINERS                                        |   8 +
 drivers/mfd/Kconfig                                |  14 ++
 drivers/mfd/Makefile                               |   1 +
 drivers/mfd/ac200.c                                | 222 +++++++++++++++++++++
 5 files changed, 413 insertions(+)
---
base-commit: 62d519c24f8373772d4fb390ba5926ebc8c17509
change-id: 20260811-submit-ac200-mfd-8bad6d09e285

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

