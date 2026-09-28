Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D78D746EF6A;
	Mon, 28 Sep 2026 10:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790592372; cv=none; b=OOyR5mch+1Jf/cW3b9Q94eQMhl7isz/plgBH/REOfCZa3RB6TsLhCO5KZtHSWCROkT9mCQAL+Dg6VVhDbqA8LHX/8ee5L6b9YbpQV7caZuX6EotiAOvzDnpHOMT68iQT283NTfXaYQwninrClh7M3giNta0haFsQ2dxq7FI26Q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790592372; c=relaxed/simple;
	bh=eQgQ7YQ7UmWVyd47COQWsNSE8eUIQeRl/q0KumbVqE4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=X5IuRIGyx29du6XaZEKz6tm8ynMEuDX6B7sobFY0FDZSuVSAkLld9TRyfWMb2CBADUCnv0xqSgkkV+KnO3ecnbSbJsEwyX0OPVZ6VLDPZeKxWh0ydYvvOgqFCtyIrPaibcdSo0NRXPv84S7UaOHzaUxempCFeIjWz7S8zXSZqpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=RdHA5sYS; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="RdHA5sYS"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 1A5104E41094;
	Mon, 28 Sep 2026 10:46:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DA35A601BD;
	Mon, 28 Sep 2026 10:46:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DE786102F1ECF;
	Mon, 28 Sep 2026 12:46:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790592365; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=EezuqqWjWGyczBWMy/SW4LsHLd3FjeQixBx7OfSF15U=;
	b=RdHA5sYS0X5L2eprQh6Xpry+OHRAvO3VTG+3jg14s0/WIwtIpXIYGSWg58XQedKAAOX49i
	z9SyMK91jeMsmEY4CTrFDEAZ+Cii5FmR7TY7DEzZDhuWF6LJuVphWcnq8z9wFpqd/Ye5u7
	zkV4R/4qZ+gsLXqqojB/tc/vDWqq2jVLV0FwMWaVku5LZaCsoKrPf9eRbfsc64x7WruKE8
	bBEdLJV1+dWU48aIQCPp02SSHf8OpBlH2JE2eM4wDgDmP5jtEDLFf4pyBHriQIVcP+cXNQ
	2jPqcpgqnHCY0kt3BfdJ8ewJdD3Nf8rei3DO0jBFokPde9VJMHHSE9IDzOXZuA==
From: Paul Louvel <paul.louvel@bootlin.com>
Subject: [PATCH v4 0/3] Add Renesas RZ/N1x EDAC driver
Date: Mon, 28 Sep 2026 12:45:46 +0200
Message-Id: <20260928-paul-v7-3-rc1-edac-v4-0-4646a5b7cac9@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5WOzU7DMBAGX6XyGSOv13/pifdAHOy1TY1KUiVpB
 Kry7tjtpRUFqcdP2pmdE5vSWNLEtpsTG9NSpjL0dainDaOd798TL7FuJoU0ogPDD/6454vlyEc
 CnqInDlnZLncmk7asgocx5fJ1lr6+XfZ0DB+J5mZqF7syzcP4ff66QLv798ECXPAo0DgnHcrgX
 8IwzPvSP9Pw2XwXWKo/YStCQksKPLgbuPUt8rrA3pXIKslaOxAIUeT0UEGDA4ESBgwkot8FeFU
 g8a4Eq0Q7BEceVfD4UEGDQ3RCK68DOHFbsK7rDwGJeWQJAgAA
X-Change-ID: 20260916-paul-v7-3-rc1-edac-1f479f96fc57
To: Borislav Petkov <bp@alien8.de>, Tony Luck <tony.luck@intel.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-edac@vger.kernel.org, devicetree@vger.kernel.org, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Herve Codina <herve.codina@bootlin.com>, 
 "Paul Louvel (Schneider Electric)" <paul.louvel@bootlin.com>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790592361; l=3351;
 i=paul.louvel@bootlin.com; s=20260313; h=from:subject:message-id;
 bh=eQgQ7YQ7UmWVyd47COQWsNSE8eUIQeRl/q0KumbVqE4=;
 b=se92g3Cavs/+obYgiz66ubB1UsPJttZRU5kMTaB/5ebxgsBuFcLZJJdEchlzEok+cJ495krpE
 0xjCRaL4BXmBxuGDnYUJ8ZnQwkJV4fHPXZtTpRX0EXh4n4JFAOhKaJF
X-Developer-Key: i=paul.louvel@bootlin.com; a=ed25519;
 pk=eLW50NT18UAvUT5cAcYf88zNbBCZDLFXuptpyLVhVIU=
X-Last-TLS-Session-Version: TLSv1.3

The Cadence memory controller found on Renesas RZ/N1x SoCs supports ECC
with SECDED.

The memory controller found on the r9a06g032 supports at most a single
DIMM of DDR2/3, up to 2GB.

Add the EDAC driver for this memory controller, and the relevant
device-tree binding. Also add the EDAC node to the existing r9a06g032
SoC base device-tree.

Signed-off-by: Paul Louvel (Schneider Electric) <paul.louvel@bootlin.com>
---
Changes in v4:
- Patch 1 and 3: drop the RZN1 family compatible, as requested by Geert.
- Patch 2:

    - Instead of using FIELD_MODIFY macro that expect a compile-time
      constant mask, use binary operators instead. Note that the new
      code is doing exactly what FIELD_MODIFY do, minus the error if
      cdns_rmw() is not inlined.

    - Use a spinlock instead of mutex since the locked region will be
      really fast to execute. Only lock it once for two register rmw.

    - Use edac_debugfs_* facility instead of sysfs attributes. Use a
      separate "bits" and "inject" file instead of just a single file.
      This is better since clients can read the previously set syndrome.

    - Cleaned up the probe function in separate functions. Use a remove
      function instead of registering custom devm action. Use a goto for
      resources cleaning.

    - Mask all interrupts before un-registering the memory controller.

- Link to v3: https://patch.msgid.link/20260924-paul-v7-3-rc1-edac-v3-0-bd8054a5b180@bootlin.com

Changes in v3:
- Patch 2:

    - Added trailing newline to end message.

    - Forgot mutex_init() in probe...

    - Registering the MC at the end of the probe.

- Link to v2: https://patch.msgid.link/20260924-paul-v7-3-rc1-edac-v2-0-bc1406161ecc@bootlin.com

Changes in v2:
- Patch 2:

    - FIELD_MODIFY() is always called with a compile-time constant mask
      in this driver. I see no problem here.

    - Use devm_clk_get_enabled() so the driver does not need to store
      struct clk_bulk_data outside the stack space.
      Clocks are not manipulated outside of probe.

    - Introduced a mutex for rmw operations in inject_ctrl_store() sysfs
      callback. Rename drv to priv in cdns_rmw().

    - Return IRQ_NONE if the stat int register is empty.

    - I see no reason to follow Sashiko last remark on this patch.
      Is an unhandled interrupt a big deal in this case ?

- Link to v1: https://patch.msgid.link/20260924-paul-v7-3-rc1-edac-v1-0-70be37c41a18@bootlin.com

---
Paul Louvel (3):
      dt-bindings: edac: cdns,ddr-edac: add Cadence DDR EDAC binding
      EDAC/cadence: Add Cadence DDR EDAC driver
      ARM: dts: renesas: r9a06g032: add EDAC node

 .../devicetree/bindings/edac/cdns,ddr-edac.yaml    |  61 ++++
 MAINTAINERS                                        |   7 +
 arch/arm/boot/dts/renesas/r9a06g032.dtsi           |   9 +
 drivers/edac/Kconfig                               |  10 +
 drivers/edac/Makefile                              |   1 +
 drivers/edac/cadence_edac.c                        | 390 +++++++++++++++++++++
 6 files changed, 478 insertions(+)
---
base-commit: d9f39b2c0579f313d14954a9ec584511c543aab5
change-id: 20260916-paul-v7-3-rc1-edac-1f479f96fc57

Best regards,
--  
Paul Louvel, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

