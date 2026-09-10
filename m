Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C33C33993
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 00:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789000016; cv=none; b=gReH6ENpbknZIIgjr8NQqanMDEPd1++9PKqSnkFDhCtM2D+RuSRmQK+tHABAv65dNIGO6kcFlTxReAbgJK5xRCYGidrMT4pom1DRSY9aoz23nlTcXzmkL+nE7yaGJDpqyrP2cfW4+fOhVvvqsLXRVjZgjHs9hWDa8SIr6KCyCRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789000016; c=relaxed/simple;
	bh=RIXKv16Aru2M4tQKU6z+MhEDUZYJPpqno6Opxuayn9w=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Px+PpKddm5/yTx94qoSMuFpsdO5DrxtKoG4YXxjgaxIEW36PsdWw2joNu+Rird7I9G3GYAfP8qVwXBVz6wOwfcypg7q7cqxmzLNzPadRPIN/KZU5C2v6KXTPt7Vw0Wlz8wqX1TPlUm7OvlpZIdZk+w2z3mYI5+5/rWCCIEyuzn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=exXOmIyz; arc=none smtp.client-ip=209.85.161.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="exXOmIyz"
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-6aa9606ddadso4532829eaf.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 17:26:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789000013; x=1789604813; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3Jdgkq5Uq5n6rA9cD2yXMgC3ZncV0Yws6KPpBDh5fU4=;
        b=exXOmIyztcKWzJGzp3tQ8v3EVbu4f/Obb2rYbZvcnErrMXBJyqn5jeTP2OJBc13Bsc
         zIkhFl8yGZaigUdLD18o8YiwoB1K0tXhmVkg1MiWzpjudBw2GlxUhp5NN/iCeiIMX/1j
         S9A+oi7HKibC0JxothZG/xA9Bk2aYTl+CP0DY/nmw7PVeKjdlm6aMO1JkJ8QPZy5eyCQ
         lCV5IBT2T1FtPY6/nJY+/zhXvBiuzgoJKJDgSjJ3rnf3ZZye1DDX/B5uiFJrSvEAKH1Z
         PRvg4Dj4pX7d4QVPTJZTvRD/L0uR8oklNEimbNGuEhZ/2IbxytTagtoe+LAm86SRQAV/
         vuRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789000013; x=1789604813;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3Jdgkq5Uq5n6rA9cD2yXMgC3ZncV0Yws6KPpBDh5fU4=;
        b=co/42yAUXt/1pY9aH6Y9Aeaw/VKNEH2+GBdlfsuzYi8pqyZDXxXkOM9ID1ILHszLny
         KV9yO10oLXiFu3bBjNl5UTic2Pc4/4xaJTv6fjwUEzarrsSkQbDvKlml4aeYV4Siq8OE
         NikRkek4tIbsphrpBaz/QQCP8QdKrShmfFiqpiaZGxZi0T7HjSmOBZ3O9DvT/bc9suBR
         Ynykkc3eyc8lPIOOs63ejLFoCp5vVl12vym0uNyzDqCNyWaVq8Yf/0e/Wq38kTfPTMPd
         0pTPEEbz7SjHFza/ZUjfgARn959O8gsiG333nqKUI/fNdvr/Oi0+jam6u2Ovdvw9aHPl
         bZXw==
X-Forwarded-Encrypted: i=1; AKwUvBzT0akCgGDV65ni7TuXZyFuNBUKMpeDlMtGLsEd7dgRXsuAeNnieWi7xHCY+2b4uL+nr/AIZCOwDwf3qHI=@vger.kernel.org
X-Gm-Message-State: AFuF++meAQYrWFYGelv9C2G6ypojTnmQZeR4277UM8cGMLTmu5tQz2IH
	Dx0k/DRxR3nhKAT9h1PXHzUtf9cj64z7WkhESmQrC9QfBLUDaQMvoM3D
X-Gm-Gg: AYBFou1LyPVBSRKvxLgrGV9Eh4zxU0pL3fL7iqlp2K+DvoHvPV+v4rUXrFL6+IiHAwo
	ECpzHCiGQFuNph2itP+gM7a7qx4Hsxm3PQLVT7LdqQwF/2x/L+R8Erhcyr+kBnFdsW+mpqokQXZ
	p8ATdf7RQB2JAI0d9i6ruRzAsWav/GG4sda+RWPXBAwJX81ailC/pOa624xgBnjg2ll/WsMwCkK
	S3rJkKENvtLHaVxVpP/Dg7ahSSRZyUf5mk7V5C3fI/pKxPphbPBQ7Uur7qOS80xG/lxrj3PA8fc
	PLIDcOacvrerI0+w2azqM3pYKoMdN8r1CZ8TB5lO5oi+4dCAgxTv3a97DEa1+DM0qXskqriJprV
	WAc6jplu0sBEbFz3pWPW/kUY46buTIUTWgG+Qw78TBRngwTEXkjz1c3AJ7+Hu7Lkd0BaA+OLS32
	NfUuVHOh1SwHbTjqCAJy1Ec6pjruJf9QDsjXoJLWVH43SFgTlgDACw2L9InJKfwzxcsiXerIqW3
	0zDr9Ee9IDgdrUwC6f0itKG5zEJlP1AA2UEhbzg/cRPudXO5axUjQgFQesF1eE1JCNdC+mYTIaG
	n7qnIk0uW6H31DPkXUhkMvzfPb5CvAE+XROaz72o6G0xM+2/xsQ4HkJPVUoXfQZlT+lK46Ohldu
	pMtFgDVUlKwQXN1fFgBUUns3Z3emi16PE0ZAHUTbS
X-Received: by 2002:a05:6820:3405:10b0:6b7:8415:d797 with SMTP id 006d021491bc7-6b78415d88cmr13815338eaf.66.1789000013189;
        Wed, 09 Sep 2026 17:26:53 -0700 (PDT)
Received: from [127.0.1.1] (184-96-151-165.hlrn.qwest.net. [184.96.151.165])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7fe2fbf5db8sm10182789a34.25.2026.09.09.17.26.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 17:26:52 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH v12 0/2] mfd: add X-Powers AC200 support
Date: Wed, 09 Sep 2026 18:26:49 -0600
Message-Id: <20260909-submit-ac200-mfd-v12-0-a44d6bc30a4f@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4XOTU7DMBAF4KtUXmM0HmJ73BX3QCz82xqRBCXBa
 lXl7jgFqVEbieUbzXxvLmyMQ44j2+8ubIglj7nvahD4tGP+aLtD5DnUAUNABSQEH79dmyduPQL
 wNgVOzgYVwEQkyerZ1xBTPl3Nt/ffXG8+op8WZ9k45nHqh/O1tMhl748Hc+NPle8TD+fOttnzI
 niRHLhLViSSghzS66G1+fPZ9y1biopaUVufFlUBL51Ag54a8wDo/wBdAXKgkpRom6DvAboBBnA
 DoAqgtaA0giPr7wGzBl42AFMB5XQMqMmQeQAErAW1IQioRJKIkYJHF5oHQqwJvUWISkgKwQSvk
 zJ2Tczz/AO9vlxwVwIAAA==
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
and Andre Przywara, retaining their sign-off chain:

  https://github.com/jernejsk/linux-1/commits/opi3-eth/

Public documentation is linked from https://linux-sunxi.org/AC200.

Assisted-by: Codex:gpt-6-astra
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
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

---
James Hilliard (2):
      dt-bindings: mfd: x-powers: Add AC200
      mfd: ac200: Add X-Powers AC200 support

 .../devicetree/bindings/mfd/x-powers,ac200.yaml    | 168 +++++++++++++++
 MAINTAINERS                                        |   8 +
 drivers/mfd/Kconfig                                |  14 ++
 drivers/mfd/Makefile                               |   1 +
 drivers/mfd/ac200.c                                | 231 +++++++++++++++++++++
 5 files changed, 422 insertions(+)
---
base-commit: b07adc1a304c7ca9ac25a01051561538757363c9
change-id: 20260811-submit-ac200-mfd-8bad6d09e285

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

