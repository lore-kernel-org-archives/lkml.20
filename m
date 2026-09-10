Received: from b224-5.smtp-out.eu-central-1.amazonses.com (b224-5.smtp-out.eu-central-1.amazonses.com [69.169.224.5])
	(using TLSv1.2 with cipher AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CF0B484235
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 11:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=69.169.224.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789040008; cv=none; b=F5EzHAtTqCbE86gRyBHDIB507nclemf+g+TVfjU2EAXp/kJoCNSOkGEEsbVLkFlAEbU7PncN/wYWOqjfDjuh/HkZzMk1fSbY0gHfxsfekJqets8WLKaZmVnUp9Q1gmdpMU5EIc6LD1h3lsdFXAF/XHQcHXgVNzjxY0iZiwRdbJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789040008; c=relaxed/simple;
	bh=gU+TosqF0bmNRmsn9m+cbxl0ah+pcAiVRzQfc5xFUoI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Dm++yo63ADSnS52FT7p9o5Yt8u8cHyD/YvDI4bI6ezXMWOT9pBPi1Kuye77mUuKwJHxEJg3pDDK3THqZ/asXCgLNmKeFg0uiFPXGpKsOaU5qB8uB4lyXUBsyZNavOlfcwMNZsnBLmpfmoPxwRhW3Ksqv0TN2OhRgmgm4YQqiKv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sagnik.me; spf=pass smtp.mailfrom=mailer.sagnik.me; dkim=pass (2048-bit key) header.d=sagnik.me header.i=@sagnik.me header.b=qRUbXAh2; dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b=S5jf2uWe; arc=none smtp.client-ip=69.169.224.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sagnik.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailer.sagnik.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sagnik.me header.i=@sagnik.me header.b="qRUbXAh2";
	dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b="S5jf2uWe"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hi6pntjfnmhxrdkbpi4sl3ndfqswqs3i; d=sagnik.me; t=1789040003;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Transfer-Encoding;
	bh=gU+TosqF0bmNRmsn9m+cbxl0ah+pcAiVRzQfc5xFUoI=;
	b=qRUbXAh2X0f+DDinEefav43TE67elGf1HnusH7qJpcXuh4NTNE/gTvANWG4Pa6z5
	5c45KDU2kuizYrcaqFNTfrcpEHgjOBNuFvB2b5ukcr86Ns9yNr4NAQXqpkLIzZynk4e
	/GuCrRwsdm7y/zhs9nyxbpveHM39PcSJTySG/fRofbeFwOWsGWbkBHLkZmJXm1J+sp9
	Fj88fjrPsVCaw9K8PgcRNj5aLllwZoNddG0ZugIK/afwry7sdb0yiaQP7Hf4R/3MMJ/
	a6+hqvgf+4jhUmaA3lPNDVVAu2TU9YuUDKcO98kNNJl4I2BdH4hoqOUAxzoUQZHiGxB
	DQLyFD4m4Q==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=sokbgaaqhfgd6qjht2wmdajpuuanpimv; d=amazonses.com; t=1789040003;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Feedback-ID;
	bh=gU+TosqF0bmNRmsn9m+cbxl0ah+pcAiVRzQfc5xFUoI=;
	b=S5jf2uWeUej6tj1l06lHggDCo8vY+YHmqUkTCAOBowju0eI9sZ2OXy2kmqgih+6l
	I0bOyz5/cwi/kBrpJfPW6fFJZWNUbGCY//ypo0oEEP0f8BldRh9wHj0jQBxJzDzILtI
	e296s5L+myPiRv4jbjMduZUFSh/Py4G6UMkUFvt0=
From: Sagnik Sasmal <sagnik@sagnik.me>
To: miquel.raynal@bootlin.com
Cc: richard@nod.at, vigneshr@ti.com, tudor.ambarus@linaro.org, 
	mikhail.kshevetskiy@iopsys.eu, linux-mtd@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: [PATCH] mtd: spinand: Do not update the QE bit on devices without one
Date: Thu, 10 Sep 2026 11:33:23 +0000
Message-ID: <010701a08b180a21-f4b7e929-ff1c-494e-99ec-c563bf7c92f4-000000@eu-central-1.amazonses.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
Feedback-ID: ::1.eu-central-1.PI0qW2sOnv0WHLkqY53RTxXQVzstwFEIoB04n7YZrig=:AmazonSES
X-SES-Outgoing: 2026.09.10-69.169.224.5

Commit be0b86c648bf ("mtd: spinand: Gather all the bus interface
steps in one single function") moved quad-enable setup into
spinand_configure_chip(). The new code only determines whether quad
mode is needed when SPINAND_HAS_QE_BIT is set, but calls
spinand_init_quad_enable() unconditionally. This clears configuration
register bit 0 on devices without a QE bit.

That bit is not universally a QE bit. On the Winbond W25N02KV it is
H-DIS, which disables the active-low HOLD function. Clearing H-DIS
enables HOLD during single and dual I/O operations. If IO3 is not kept
high, the flash can pause a command and ignore clock and data.

H-DIS is not restored by the FFh reset command, allowing the incorrect
state to survive an SoC warm reboot while the flash remains powered.

Before the refactoring, spinand_init_quad_enable() returned without
touching the configuration register when SPINAND_HAS_QE_BIT was not
set. Restore that behavior.

The regression was reproduced on a Jio JIDU6401 with an MT7986 SoC and
a W25N02KV. With Linux 6.18.44, sysupgrade failed and the following warm
reboot hung in BL2. With this change applied, both sysupgrade and warm
reboot completed successfully.

Fixes: be0b86c648bf ("mtd: spinand: Gather all the bus interface steps in one single function")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Sagnik Sasmal <sagnik@sagnik.me>
---
 drivers/mtd/nand/spi/core.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index 8bf9301f25e7..89e9f5410cfa 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -281,6 +281,9 @@ static int spinand_init_cfg_cache(struct spinand_device *spinand)
 static int spinand_init_quad_enable(struct spinand_device *spinand,
 				    bool enable)
 {
+	if (!(spinand->flags & SPINAND_HAS_QE_BIT))
+		return 0;
+
 	return spinand_upd_cfg(spinand, CFG_QUAD_ENABLE,
 			       enable ? CFG_QUAD_ENABLE : 0);
 }
-- 
2.53.0

