Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794908290;
	b=cOTyNJBd3VgfhvVjr0hqUt68tHGbHoJxC9vHYkrRZQJjictsmk9Xudf0x2mYOweZYnYv
	 ogfxD1mu99oohF4zZyNKWAXzc0hmHwtrFFZqX/yIkEVKcNdU6lnf+sS2IeCq08Z2CSOAY
	 w535YGSH151wax58iy02rxEgcSVxpbFUnQeUz44yuY1MRD/0LmpjSlL8/hFzuCxPu2j1I
	 sci7gkGkCvcbsn19o24HH7tUitzBazzsUu0X/yq2nMGmuSmd9/+849RtIwS37y2Mb0OYD
	 k9gNGrbwOai/qZEDN9XkrFWETZHc5hl/j8L4jzxWJ0S2wDhuXXuUqmIf9yLrTx6WMHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794908290;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=jYzpQG4guVr73jaAY4k71MmViNWdI3Qkw+kWHlSxdUQ=;
	b=VJ5IrjFOXKikXc/V90H6ryPTsxOMrus5FkHWoLhFIaACZqYQbL3NZ3FI7IOvnEKWMwpp
	 aSZ23b5yFHrZqmz3YnpRYPMPZbyDWOQQTRO1ySGusg19+WdeoOclYQ8plAuzgMXwnTSEN
	 Gzk+pZGouDswujY9UXdMJJGP9gZHPYS++wlwJXtk28nUU480SCqkRdq77gy977QI9bX6x
	 P4kOyCyM7FIeNWAlrdin5C+iLRBj+yru4mfoT+FTJ5of4x6eMGh98OIpO823TWzi2KkfF
	 H3pML3ZKyb4A5e7fFRY/aU1H5Ug/hOg+na6qqMBBxpobe1kNwMKNSihg5XKUH1VtQDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=XyR6ygMv;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DC4F606A33E
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 09:38:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5DC4F606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=XyR6ygMv
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 01D064E41146;
	Tue, 17 Nov 2026 09:38:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C3C9D5FC81;
	Tue, 17 Nov 2026 09:38:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DE00711BC0C04;
	Tue, 17 Nov 2026 10:38:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794908286; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=jYzpQG4guVr73jaAY4k71MmViNWdI3Qkw+kWHlSxdUQ=;
	b=XyR6ygMvMWK4oLJuBuJjNcGVc8XGDAs25P183bZZBbakAeed9AAz0wi3ALKkK7wFDSJFa5
	lSg3tBgm9AtzffsLdnf2FFa9Rarc91IDd/hjneO6pEy+2utS7k2FpfgcderzD9CGOFLg03
	dFYaOH2JgYq2xKh+9SijDwl+ZxEnOfcScoIBn6aFiqkDVK9OhO0DQrA/leOr+/ddZVhsIo
	MXEwMLR1Tj4V7mbYEh34w+vf2SZm/4jNUqgV/LDkaqNr+T3GZRERAu+mzEMbAji+tw+BcX
	f5iBroT0tXvP9UsLSMBpKbjgxfVe731ijDqT13xwr140NjPPut8HaQmQmefAag==
From: Paul Cercueil <paul.cercueil@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Paul Cercueil <paul.cercueil@bootlin.com>,
	Stefan Agner <stefan@agner.ch>
Subject: [PATCH v2 02/12] mtd: rawnand: vf610: Remove #ifdef guards for PM related functions
Date: Tue, 17 Nov 2026 10:37:40 +0100
Message-ID: <20261117093751.14988-3-paul.cercueil@bootlin.com>
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
Cc: Stefan Agner <stefan@agner.ch>

v2: No change
---
 drivers/mtd/nand/raw/vf610_nfc.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/vf610_nfc.c b/drivers/mtd/nand/raw/vf610_nfc.c
index 9940681810cf..d785c3d28e51 100644
--- a/drivers/mtd/nand/raw/vf610_nfc.c
+++ b/drivers/mtd/nand/raw/vf610_nfc.c
@@ -906,7 +906,6 @@ static void vf610_nfc_remove(struct platform_device *pdev)
 	nand_cleanup(chip);
 }
 
-#ifdef CONFIG_PM_SLEEP
 static int vf610_nfc_suspend(struct device *dev)
 {
 	struct vf610_nfc *nfc = dev_get_drvdata(dev);
@@ -928,15 +927,14 @@ static int vf610_nfc_resume(struct device *dev)
 	vf610_nfc_init_controller(nfc);
 	return 0;
 }
-#endif
 
-static SIMPLE_DEV_PM_OPS(vf610_nfc_pm_ops, vf610_nfc_suspend, vf610_nfc_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(vf610_nfc_pm_ops, vf610_nfc_suspend, vf610_nfc_resume);
 
 static struct platform_driver vf610_nfc_driver = {
 	.driver		= {
 		.name	= DRV_NAME,
 		.of_match_table = vf610_nfc_dt_ids,
-		.pm	= &vf610_nfc_pm_ops,
+		.pm	= pm_sleep_ptr(&vf610_nfc_pm_ops),
 	},
 	.probe		= vf610_nfc_probe,
 	.remove		= vf610_nfc_remove,
-- 
2.47.3

