Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73B3C3FC5A1;
	Tue, 13 Oct 2026 10:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791888332; cv=none; b=Lc6FxZIopK9By2EviCCPCMHz3WLdtublOCK2cPks02jvLPbhZ2PfTeNWp6Yuog+PHgBZVsrLcUGV64INGMDcukDQhYFViBSlUNNYeFw938VORKjHy7PlN930klozwS08oaAPNXp7LuYSpqYnRNAMACQ9GDywRl0FEqdW3ubE1X0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791888332; c=relaxed/simple;
	bh=73no7mk5zY0fT9RmHVWdNYH+hEaQpHWWjUrSfrrunLA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=fJkMDDkrLUaK/wrOZhcSWamRlO+zF6b4RlVPoFjXB0QKSJVs9obHFyP/qP4lqDj8SH/QVBU4MRR+tf/CzzMQJG9UL97KEdaBsqF62pif3w1LMdizZ1Dlah/s1ZNTpaaDr/WmM53NhNN0pOesqQ2ZdXdhx6WiQjMHDv3rgZ8s474=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=PSxp7+h2; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="PSxp7+h2"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id CDEA24E4120A;
	Tue, 13 Oct 2026 10:45:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9069F60362;
	Tue, 13 Oct 2026 10:45:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8317711D70DB1;
	Tue, 13 Oct 2026 12:45:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791888326; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=XZK57Ew8RtsB4VB6YRRGpa0+57nwvbdU6CuWfPyEudA=;
	b=PSxp7+h25CGTjoeUV9H+L+tGXjpzpK9HwdWakYwv2PBWq/9Nr6JMumNTMyAbctoR0KItim
	K0dupXMIkwhqctBG+SreVqiX+CoNq6+svtahxarOYGi3uxC9CHicKZuZZjqS43httUTtJx
	q9VcimuMfKeFIEL+VK33C6b4YnLTpTNlKpa5/HQcQxwlx2Z3ooIzHyCSl6YgvUev9BHnKR
	1JRXm5eVm29eCBUXOnUh114a9MydBS/0viRCr/72XlcQOqC9YAhXVaxKWWuoSbW3UH9Fag
	FWdQ0TbnAhdtXDUzsSadzQspoPvVuvkO8kXWCCSh1q47oMQAjRUzClf81jLapg==
From: Paul Louvel <paul.louvel@bootlin.com>
Subject: [PATCH v6 0/3] Add Renesas RZ/N1x EDAC driver
Date: Tue, 13 Oct 2026 12:44:57 +0200
Message-Id: <20261013-paul-v7-3-rc1-edac-v6-0-2f1d6f2f74db@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5WQy07DMBAAf6XKGaNdv9MT/4E42BubGpWkStIIV
 OXfsVsJBRKQelxpZ3a0l2oIfQpDtd9dqj5MaUhdmwf9sKvo4NrXwFKT54oD11CjZid3PrLJMMF
 6QhYaRwyjNHWsdSRlqgye+hDTx1X6/HKbh7N/CzQWU9k4pGHs+s/r1QnL3r8HJmTAGhDaWm4F9
 +7Jd914TO0jde/Fd4O5/BM24IMwJNGh/QGXvokvC8ymhGdJVMoiCGwghrsKCuwJJWjUGIjWBWJ
 RwMWmRGSJsgItOSG9E3cVFNg3FpR0yqOFdYFcFthNicwSqaXOCkOO6rVEfUsQQG1KVJbkTziIy
 KWnXyXzPH8BbZwWfJMCAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791888321; l=4772;
 i=paul.louvel@bootlin.com; s=20260313; h=from:subject:message-id;
 bh=73no7mk5zY0fT9RmHVWdNYH+hEaQpHWWjUrSfrrunLA=;
 b=lNqhsb2xp9E1y/aOuVEhW+R0PxZEeCGTJLYN6vTYyPFiElj4A1cu1GYNwbrhSwk2oN/FnWSbv
 Xyb30laJ/54CZ4jApcoyJvjVOCjeQIBMUvVHfXq1hCtDw2adB4y84Iv
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
Changes in v6:

- Patch 2:

  - Sorted the includes alphabetically. I have also ran a check with
    IWYU and, after careful checking, there is no superfluous header.

  - cdns_get_mem_sz() helper inlined into cnds_setup_mc().

  - Debugfs helpers built unconditionally with no-op stubs if debugfs is
    not selected.

  - Port command channel error reporting removed since it does not
    belong to an EDAC driver.

  - Removed useless comments.

  - Renamed macro prefix to CDNS_* instead of CDNS_DDR_*. Also indented
    all the macros definition at the same level.

  - Dropped cnds_ prefix to the private structure.

  - Shortened interrupt unmasking into a single macro to shorten line
    column length.

  - OR'ing flags to detect type of errors in irq handler.

- Link to v5: https://patch.msgid.link/20261005-paul-v7-3-rc1-edac-v5-0-140a0f124bc0@bootlin.com

Changes in v5:

- Patch 1:

    - Reworded commit title.

    - Dropped unused label.

    - Switch to plain flow scalar for description.

    Note: keeping cdns,ddr-edac compatible after Krzysztof's comment.

- Patch 2:

    - Setup IRQ after allocating and registering the device to EDAC
      core.

    - Explicitly free the interrupt line with devm_free_irq() to avoid
      any UAF before releasing MC.

- Link to v4: https://patch.msgid.link/20260928-paul-v7-3-rc1-edac-v4-0-4646a5b7cac9@bootlin.com

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
      dt-bindings: edac: cdns,ddr-edac: add Cadence DDR EDAC
      EDAC/cadence: Add Cadence DDR EDAC driver
      ARM: dts: renesas: r9a06g032: add EDAC node

 .../devicetree/bindings/edac/cdns,ddr-edac.yaml    |  61 ++++
 MAINTAINERS                                        |   7 +
 arch/arm/boot/dts/renesas/r9a06g032.dtsi           |   9 +
 drivers/edac/Kconfig                               |  10 +
 drivers/edac/Makefile                              |   1 +
 drivers/edac/cadence_edac.c                        | 377 +++++++++++++++++++++
 6 files changed, 465 insertions(+)
---
base-commit: d9f39b2c0579f313d14954a9ec584511c543aab5
change-id: 20260916-paul-v7-3-rc1-edac-1f479f96fc57

Best regards,
--  
Paul Louvel, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

