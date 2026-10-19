Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF31F4C7B2B
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 14:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792421054; cv=none; b=uT64QEuPFc3xmpRilEoJQg6AcMu/Cy0H4Du/jm7LVHUzfAdUcnJYwI2N/XlfshPfEw2bfdcaquGQXEYEEEexdYuxkzDUxuX0sL5e0YjKYax7nl0myQBiWNT43wJ8EQ8JlX32ZvwjZ8nIVjFUXzj8XjLJ+E3eCZmQvnM2YSSIA/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792421054; c=relaxed/simple;
	bh=a9qUpHSrVbpwYKSd6ylV0Jh4XUZfn8tQ8ofbyzD6pN0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=PqnGxYR4S6ikid0zMFe99RfU3lnn0VhLCAnw83QdjZfFikAaPExNzXrBiV325AE3WHJkjQ1K4+2i42irMsB8fAANJyLlPTjnpp63wcS03DC526SWBq5HBcvcip8Ii+AksF2F4eITUbHqLzy+BtxCxl8D912FjCSLfx0ZPDLorFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=bv56tb87; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="bv56tb87"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 08138C5CD59;
	Mon, 19 Oct 2026 14:45:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D140660582;
	Mon, 19 Oct 2026 14:44:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3432010328C00;
	Mon, 19 Oct 2026 16:44:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792421045; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=Pe3ZWwtYKswZmK4MHa4IzVwtiUbu38EtFJGOtnMqhtk=;
	b=bv56tb87jHVu4cNGJdEKZ+ARP66prMN3hq2UmSswBN/qbRo6aSslgGZlU0G6/9N78wk5V0
	ksAj3O3OznxJRS1xkE2JqBzqbC6UOx8P8YrS1xxWn0K3nFYTF50jWzCZ+HSYEW5EJTDXtX
	SJ95G6khL8iQcgWFUlNB/RcVO61iLUvFwKjeko+nxVGZx1zvXrDlXAn333ZIgF5L+ek6NA
	ROLHnmPk9QzbZuQ1lYW90qtJ82IBEct3ALB4sFhyMt1YkDGge0pr26ghkLdwCpjJP3ID8W
	qmLbeUAHS7ndFKPo3PLsttXEcIdD0vR8JB5HyY83/5xeY5VkqRzzjruIn5hvAQ==
From: Paul Louvel <paul.louvel@bootlin.com>
Subject: [PATCH v7 0/3] Add Renesas RZ/N1x EDAC driver
Date: Mon, 19 Oct 2026 16:43:24 +0200
Message-Id: <20261019-paul-v7-3-rc1-edac-v7-0-84c76c6d7595@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5XQTWrDMBAF4KsEr6syo39n1XuULqSR1KikcbAT0
 xJ890oJFAe7hSwH5n3zmEszxD7HodluLk0fxzzk7lAG87RpaOcO75HlUOaGA9fQomZHd96z0TD
 BekIWgyOGSZo2tTqRMk0JHvuY8tcVfX27zcPZf0Q6Valu7PJw6vrv69UR696/B0ZkwAIIbS23g
 nv34rvutM+HZ+o+q3cLc/ln2ICPwpBEh/YuXPuNfN7ArCK8IEkpiyAwQIoPNahhTyhBo8ZItGw
 gZg24WEVEQZQVaMkJ6Z14qEEN+2BBSac8Wlg2kPMGdhWRBZFa6kIYctQuEfWLIIBaRVRByiccJ
 OTS00oTPUNw/Re6IDxh0IknI4O/R6Zp+gEe6umm2AIAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792421040; l=5031;
 i=paul.louvel@bootlin.com; s=20260313; h=from:subject:message-id;
 bh=a9qUpHSrVbpwYKSd6ylV0Jh4XUZfn8tQ8ofbyzD6pN0=;
 b=3eYKCEkZmc6rkZFyLA8w/aoQ++497fxN9zWG+xmRV4QY+apJ5EZaniCsbqK6Gq1Z9UvtfkGpi
 NJCCQ6frY1wDjsqBMxoare1BuiI+ajgLxfiwdWpw2xvYTiqc8KmBYYg
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
Changes in v7:
- Patch 2: fixed weird formatting of cdns_ddr_ctrl_of_match.
- Patch 3: did not sync trailers added in v5. Added Reviewed-By of Rob Herring.
- Link to v6: https://patch.msgid.link/20261013-paul-v7-3-rc1-edac-v6-0-2f1d6f2f74db@bootlin.com

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
 drivers/edac/cadence_edac.c                        | 379 +++++++++++++++++++++
 6 files changed, 467 insertions(+)
---
base-commit: d9f39b2c0579f313d14954a9ec584511c543aab5
change-id: 20260916-paul-v7-3-rc1-edac-1f479f96fc57

Best regards,
--  
Paul Louvel, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

