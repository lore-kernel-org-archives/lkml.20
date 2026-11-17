Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794908296;
	b=eXyzb7uR2BeQi6tEQFHClINyVTvM0DnY0Ys843/2GkwVU7fdACKHKb4kSTeZSTAQykE4
	 jUAl0/QAtRjpq3GKPMW6eIhOawTV+PHiuzQRdO0NoX90rDxltd0KoNAg1dr4/MUkhSOcr
	 I/5iR3uVKpI21ByvdHhg0+PurdM/UhqWl8E+ZkjAxZBAg0x1H/X3voJwzR6KmMhI72m5d
	 jv7oeNke7VPuHg8CvHUKsb0CWrH5TGon5Qor+zixAeTwarbld5onuXlJCbNzWO39DEOLY
	 ftae3s2XUkMPF47nO8MvkBah+3n3IiRmOwYIWEaejqJ5QYjV3QSTc7fRTwW3hNEhxKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794908296;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=apAmpkE0yUB9HriZqVB6582NZhDT2GNuBD9sC7CKYDY=;
	b=In7LsJ6HXe75q+8LSlvsERAnkYZiN2vETR5zL1pPYitDls0DqxhCgnPNkmrcu2xmDZDr
	 2GPz/15KnEWuI5ZSu7jVt17h0zrDQl3r6Jf4/827c5o8UK/G1ej5FoN4ld3kZxz3IUO/B
	 7HHK5n0JI2YtenKya02CNjYc2mvFx8Qdqj3lhQnta9Pxjt5NtbLXyhz4DzOItJMRxZdnJ
	 7QmZw2vnEl7Qs2TLdi84ZJYIABe+YvLTZhHmqhvWgfOHU1bYzHaHY3Fqq8nBudP/2HlJz
	 bVKKuhWB0RRxxY56DeMPhlNrzcZDKUfhfxXOSWkr+RML4u5aa29TpjM165aa2E4m+Dw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=dm8csNeb;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A943606A88A
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 09:38:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A943606A88A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=dm8csNeb
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 6AC2BC4EDB9;
	Tue, 17 Nov 2026 09:38:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1BBE45FC81;
	Tue, 17 Nov 2026 09:38:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 51D1211BC112B;
	Tue, 17 Nov 2026 10:38:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794908294; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=apAmpkE0yUB9HriZqVB6582NZhDT2GNuBD9sC7CKYDY=;
	b=dm8csNebFJOd9Vy0aaq5g2ibRA41Au40Uy/n6aKWvAtDssTcccvAtNYGjIcDATI8R9e3q2
	E7x1kfAs1Q4z+XncYvhJduXnR4bNRAjlQAuJJPn1lD4YbGoI50kcZRWTT1QMwo4FcVRBhm
	cbti09cZsxIwsFnvtl2taX1jo0InUVmNzd822m5ajvLS/t6wBXor+MpjSlO1DD+fSmLI/0
	6jd7niRNfkUA5tqkZ7AfTlyriBTde9SKfmHxiVPWmuflybC1uOY4kEW494Hj+JfxRQVVLT
	HOTLds8xCTOCyA75S2qE7Gm7u2dySXh71XVx8/Fm8Vbe7QVCheKbR6jJF5IS/A==
From: Paul Cercueil <paul.cercueil@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Paul Cercueil <paul.cercueil@bootlin.com>
Subject: [PATCH v2 07/12] mtd: rawnand: fsmc: Remove #ifdef guards for PM related functions
Date: Tue, 17 Nov 2026 10:37:45 +0100
Message-ID: <20261117093751.14988-8-paul.cercueil@bootlin.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261117093751.14988-1-paul.cercueil@bootlin.com>
References: <20261117093751.14988-1-paul.cercueil@bootlin.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Use the new PM macros for the suspend and resume functions to be
automatically dropped by the compiler when CONFIG_PM or
CONFIG_PM_SLEEP are disabled, without having to use #ifdef guards.

This has the advantage of always compiling these functions in,
independently of any Kconfig option. Thanks to that, bugs and other
regressions are subsequently easier to catch.

Signed-off-by: Paul Cercueil <paul.cercueil@bootlin.com>
---

v2: No change
---
 drivers/mtd/nand/raw/fsmc_nand.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/fsmc_nand.c b/drivers/mtd/nand/raw/fsmc_nand.c
index 837c23c63aeb..56ab42ee9e7d 100644
--- a/drivers/mtd/nand/raw/fsmc_nand.c
+++ b/drivers/mtd/nand/raw/fsmc_nand.c
@@ -1186,7 +1186,6 @@ static void fsmc_nand_remove(struct platform_device *pdev)
 	}
 }
 
-#ifdef CONFIG_PM_SLEEP
 static int fsmc_nand_suspend(struct device *dev)
 {
 	struct fsmc_nand_data *host = dev_get_drvdata(dev);
@@ -1215,9 +1214,8 @@ static int fsmc_nand_resume(struct device *dev)
 
 	return 0;
 }
-#endif
 
-static SIMPLE_DEV_PM_OPS(fsmc_nand_pm_ops, fsmc_nand_suspend, fsmc_nand_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(fsmc_nand_pm_ops, fsmc_nand_suspend, fsmc_nand_resume);
 
 static const struct of_device_id fsmc_nand_id_table[] = {
 	{ .compatible = "st,spear600-fsmc-nand" },
@@ -1231,7 +1229,7 @@ static struct platform_driver fsmc_nand_driver = {
 	.driver = {
 		.name = "fsmc-nand",
 		.of_match_table = fsmc_nand_id_table,
-		.pm = &fsmc_nand_pm_ops,
+		.pm = pm_sleep_ptr(&fsmc_nand_pm_ops),
 	},
 };
 
-- 
2.47.3

