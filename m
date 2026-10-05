Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF08E47FAE1;
	Mon,  5 Oct 2026 12:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791204634; cv=none; b=kXNRv7DKbj5WubyzLDpsc+dA2r7bKXOZJhqu1PdkfYCq1KrgJI/wEdOsZjNBby4H0hS8N/IJ1qT081vYXXQRLXpYIeFahMN7NZhlxLDy8f+wNkhRw86d9+7Wjiej3cHoh8yoq5OxLbIxC/Sl2TDRsLX8ZNx98E23iQ2nsV6gCp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791204634; c=relaxed/simple;
	bh=PLtvOz9VJuOXMvS7z5C15tnldSxsZEREX64v8VYcty0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=qoiCAbM3Ue7oVo3l0+V0VAIi09sAlrc9bJDUoQmmi3zZX7cpy7szVn+OWWStYpdfeuWsVGB8/wZAaDa56Wwh+0s4a7t0zskqdMyRNwXWyKAvEuL63S8A7HRsHvJzun3Lz//128oz5hI8sTrSqYkK9MgqVG98Fgl//dnhc3mPGYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=SZOA5A1o; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="SZOA5A1o"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 1F4FD4E410A6;
	Mon,  5 Oct 2026 12:50:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DA92A601A5;
	Mon,  5 Oct 2026 12:50:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DF7E010330731;
	Mon,  5 Oct 2026 14:50:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791204624; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=P0rw6J6Ue0d4JDDg+MYCxIcOBl5T7NsLZ5PGtYmNLCs=;
	b=SZOA5A1oHXeyHp82yHPAU9LEZxAQKRkdrojJQpLcWfEYcNzW+JYH40Tw+JCuIP8wh9aqGE
	u/c+BQ5+ewLF91Pbpz+H/JpLA8/C6wpwMJPAMu72G19hbvS6tOtOI4X0CIqcw3nBQTPZ9m
	mAq+iiPrlrT+AqM3D0/gHWpOnXW8ebhMn07UKka9lUzRrWeb+3k0xJdVzNPPqKqABdNFPF
	bvtbP6sNju4wYi8Q4ZpKma1scYvj4vF9x8cMnEI1zDHZoit+B+z9Pqw/hbw2IQhi8NVcNo
	uSjDC9lyfYAfSo4PhI6OjSwTPjTmcajdI4R+NanqOJQSEPNrMhLuFQpGPtCU4w==
From: Paul Louvel <paul.louvel@bootlin.com>
Subject: [PATCH v5 0/3] Add Renesas RZ/N1x EDAC driver
Date: Mon, 05 Oct 2026 14:49:21 +0200
Message-Id: <20261005-paul-v7-3-rc1-edac-v5-0-140a0f124bc0@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5WOzU7DMBAGX6XyGSOv13/hxHsgDvbGpkYlqZI0A
 lV5d+z2kqoBqcdP2pmdMxvjkOPIXnZnNsQ5j7nvytBPO0Z7331EntuymRTSiAYMP/rTgc+WIx8
 IeGw9cUjKNqkxibRlBTwOMeXvi/Tt/brHU/iMNFVTvdjnceqHn8vXGerdvw9m4IK3Ao1z0qEM/
 jX0/XTI3TP1X9V3haX6E7YiRLSkwIO7gWvfLNcFdlMiiyRp7UAgtCLFhwoqHAiUMGAgEt0X4Kp
 A4qYEi0Q7BEceVfD4UEGFQ+uEVl4HcOK+QK0L3KZEFYkyyhSFJU/NrWRZll9+wgy8TgIAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791204619; l=3873;
 i=paul.louvel@bootlin.com; s=20260313; h=from:subject:message-id;
 bh=PLtvOz9VJuOXMvS7z5C15tnldSxsZEREX64v8VYcty0=;
 b=+SLFnqcxv9Qxaj5ouw0gxoOwV/T6vgJhcxL1d9o92ONv20RdWp/ZWiUWsFbpG4h9JbwkN3Hrk
 agUXQPoCrxNBixc7H9TDqL55xwJGOhtbP9NJTR1TgMXXNSBgTGPheMP
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
 drivers/edac/cadence_edac.c                        | 399 +++++++++++++++++++++
 6 files changed, 487 insertions(+)
---
base-commit: d9f39b2c0579f313d14954a9ec584511c543aab5
change-id: 20260916-paul-v7-3-rc1-edac-1f479f96fc57

Best regards,
--  
Paul Louvel, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

