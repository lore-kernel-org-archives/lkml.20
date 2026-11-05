Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793898776;
	b=lMU0Qo1Tdu3DybjyqCDbookBBUi3ZbIbAsBYJQdvW5d7X6NcJLSrsx1NjWYCMIFQxh69
	 gP0Z2QAD0wC/p74SJZR2vG1lekaxcmGeDyN/2o9e2AAdRENQNuDjI942/CAsII4XwN6/8
	 eiwkeCcrcHw4cWzC5cWSumRXc3wO8GIpIbcTXiujfKoLaSyNsbdN0Zu3957+6/pvCCF3X
	 tg+Kg76fmLbtou3dIRlvGLjfYHhaBXEvDqhFvb6s3jJVvH6kjwvTyVRFe6CSWO/HMsySw
	 RliPMg9VqTogboGHL09FyH3KcBpd0xLxDmpbOcDsB8rjmMuLqElZ2MJFkCdvXDbXqVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793898776;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=QWW8sGSbKCZTYcbVkYjb60ZAYK6JjPCcx3vUHcTIU+g=;
	b=RR1TRSFrW/dx+EMrDAEkrQhJgjkmWdAMnv7zPz8Gjm9enh1zlqxFL5qZCTG/+jdt3rf6
	 PfFngN+UQvPUMmTue6+lvUTGFIMRKIHgnZyyvdZsYp6ZtCc+jG/YCq+WZOdjPurPfAVJe
	 zZmGluMA0UZo7ZB5vwm0lQW9hpcr0H/uJJ35uP+0ntTT7yig0y6Wro+p1fCfNDk+RQFUz
	 UAItlWGj9z/r+m2aes5F8og/0HoRQTMHeEY5LCjnvLxvBZLuuWndZNnLjOvpNvp7qIcC+
	 OH0VNpYtqcV03ZwBGCJ79B1csenBR2Xz2qwq5GtLVTWoSTzOvUoxuOyAbPzc8cLBT9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=L3FyNOMQ;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED3B2606A334
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 17:12:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED3B2606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=L3FyNOMQ
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id A14281A0C32;
	Thu,  5 Nov 2026 17:12:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 787325FF43;
	Thu,  5 Nov 2026 17:12:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 51F2410329258;
	Thu,  5 Nov 2026 18:12:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793898774; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=QWW8sGSbKCZTYcbVkYjb60ZAYK6JjPCcx3vUHcTIU+g=;
	b=L3FyNOMQAnqkOuPDe1XsOpZiC1yFpS+l8BnlA77ufcPjPWhsRtBYTkTM70y9VBeAESF/WI
	U0j7iJoq6bc29v4HLQr+/+WKOc0QGBLd+guhar5/KXeYMJJ6PdwdPpQYVQJtckEeVpPQI/
	5v7KBcMchc/FEfu9aEIF5YS/2uke+7PTeuu22okqkKlP5OA8i5RPUxPDdqzxHxYyWqbVT+
	xS1jbpt9cl9eSeAsfUj9kYKI4aw48Ae/flt+w77VPltvtpPrE/iPuzztmNqJDHv9o2m1Xr
	NvCCRtNrUqiLiPorvrZT00mTxB9qr2cgDLzwwXv6bjHFJNymMsH0jmNbCF+/4g==
From: Paul Cercueil <paul.cercueil@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Paul Cercueil <paul.cercueil@bootlin.com>
Subject: [PATCH 04/12] mtd: physmap: Remove #ifdef guards for PM related functions
Date: Thu,  5 Nov 2026 18:11:50 +0100
Message-ID: <20261105171158.399247-5-paul.cercueil@bootlin.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261105171158.399247-1-paul.cercueil@bootlin.com>
References: <20261105171158.399247-1-paul.cercueil@bootlin.com>
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
 drivers/mtd/maps/physmap-core.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/mtd/maps/physmap-core.c b/drivers/mtd/maps/physmap-core.c
index dcda7685fc99..afda90fc23ee 100644
--- a/drivers/mtd/maps/physmap-core.c
+++ b/drivers/mtd/maps/physmap-core.c
@@ -600,7 +600,6 @@ static int physmap_flash_probe(struct platform_device *dev)
 	return err;
 }
 
-#ifdef CONFIG_PM
 static void physmap_flash_shutdown(struct platform_device *dev)
 {
 	struct physmap_flash_info *info = platform_get_drvdata(dev);
@@ -610,14 +609,11 @@ static void physmap_flash_shutdown(struct platform_device *dev)
 		if (mtd_suspend(info->mtds[i]) == 0)
 			mtd_resume(info->mtds[i]);
 }
-#else
-#define physmap_flash_shutdown NULL
-#endif
 
 static struct platform_driver physmap_flash_driver = {
 	.probe		= physmap_flash_probe,
 	.remove		= physmap_flash_remove,
-	.shutdown	= physmap_flash_shutdown,
+	.shutdown	= pm_ptr(physmap_flash_shutdown),
 	.driver		= {
 		.name	= "physmap-flash",
 		.of_match_table = of_flash_match,
-- 
2.47.3

