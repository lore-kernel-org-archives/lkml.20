Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1B0F37F72F;
	Thu, 24 Sep 2026 14:13:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790259194; cv=none; b=LVRlpcPVAN23Vkqf0idAnUTwA3mdJ5wniS7uEvxZOZbl/Zitx4pKTtfNAzFWywxN6Uoxrtq4aRR/XPnmDSYuoTl5wUDQiFYtfJKcfWt06ovTqE75V2uT0qJr+m2lOqbdEK8SgjxuL8v/d5uB+TV7aCztTw/ouSKdYlW1JBkh+Wk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790259194; c=relaxed/simple;
	bh=H7S9QBybBOV/orKznzXfZsxie+wZHaKwCvOd8EHwrR4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=tIBD8eMSWVSvbw9RWOTusSUyaYKMWdMWXu3G2/AwGa3oBzYdw/Wqq6VsFKWS7vGNpSn+vjn375dy+HPVxyEDmk3x4nJwzAuT/vL76mMHQbMB04Evjh2okeEgwQKkzLCdsogOwTI7ulVbTykg/qDI32g+dl1cspgiaKq2us75U0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=TpvRZZcA; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="TpvRZZcA"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 371941A1002;
	Thu, 24 Sep 2026 14:13:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id F110460341;
	Thu, 24 Sep 2026 14:13:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A9E99103294AA;
	Thu, 24 Sep 2026 16:13:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790259188; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=cfSxVFfxQcjeZ+4V26PUzPWciO76dhK//kR7ut/JjGY=;
	b=TpvRZZcAg0p8cCby9QOhCW7mZc9wUqYuovTju9j974G+Eck7NLcF90ObHDRai39w/sqwA/
	bEVhG/KS+OA3CKIUM+Mq+pI0ZGAaFOU4x2vhF0ExhcmrjkidbTfwIgQeKt9pCNWDzsxCe5
	ygr+gLy8ob7SkQMk6XyP7ESMVfhAtzYB8DIobB/Iy5Bqy0ML3uyevKL0MyVew0Jzdal1nw
	Zduu7QYorvGV18UtPJj76YoK9FVKN7ckeQ3CAtm54YVCteI+8LBDOENwzT72bGEVQj05ru
	eqvfxyLf5Q2uFBSSAkPXBQbc9ZmV7bMZPwbqXtlAOab+qTgXTRqv9Kq4CLslVg==
From: Paul Louvel <paul.louvel@bootlin.com>
Subject: [PATCH v3 0/3] Add Renesas RZ/N1x EDAC driver
Date: Thu, 24 Sep 2026 16:12:46 +0200
Message-Id: <20260924-paul-v7-3-rc1-edac-v3-0-bd8054a5b180@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5WOQU7DMBBFr1J5jZHHk9gOK+6BWNiTMTUqceWkU
 asqdyduN60oSCy/NO/NO4uRS+JRvGzOovCcxpSHdeDTRtDWDx8sU79uoZU2qgMj9/6wk7OVKAu
 B5N6ThNjYLnYmUmvFCu4Lx3S8SN/er3s8hE+mqZrqxTaNUy6ny9cZ6t2fD2aQSvYKjXPaoQ7+N
 eQ87dLwTPmr+q6wbn6FrQqMlhrw4O7g2jfr2wL7UKJXSWxbBwqhV5H/VVDhQNAoAwaY6GcB3hR
 ofCjBVdI6BEcem+DxXrIsyzf5Zq2AzAEAAA==
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
 "Paul Louvel (Schneider Electric)" <paul.louvel@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790259185; l=2289;
 i=paul.louvel@bootlin.com; s=20260313; h=from:subject:message-id;
 bh=H7S9QBybBOV/orKznzXfZsxie+wZHaKwCvOd8EHwrR4=;
 b=elkDcHIFRYVjxXQLFBf26dM2znn+8XYvZZjNjaCQwijy2oTaB7F0A5TSBQcAZtFSOtKl8CoQq
 GGrFpi0ois+DEPBZ/ppcmF2lvZmdIHW+EMqNf/hS0RFnqP3+afeIaOj
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

 .../devicetree/bindings/edac/cdns,ddr-edac.yaml    |  62 ++++
 MAINTAINERS                                        |   7 +
 arch/arm/boot/dts/renesas/r9a06g032.dtsi           |  10 +
 drivers/edac/Kconfig                               |  10 +
 drivers/edac/Makefile                              |   1 +
 drivers/edac/cadence_edac.c                        | 342 +++++++++++++++++++++
 6 files changed, 432 insertions(+)
---
base-commit: d9f39b2c0579f313d14954a9ec584511c543aab5
change-id: 20260916-paul-v7-3-rc1-edac-1f479f96fc57

Best regards,
--  
Paul Louvel, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

