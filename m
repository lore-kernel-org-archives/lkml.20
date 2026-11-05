Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793898778;
	b=DreIL9lEtocTeMa4lazSjaZj+5W/aVddPDGd2nJkcPnEoVJVveIG5CHIgVTeNAGAuMHs
	 JNNObEbvY1/x6gdjKu7IaVuryWojCvNq2dSpuxuGm9LIRTRsYPDAD3ApeIFkkuzIirG10
	 /Q3L682tSajk1vzYNLD6QsNJnvmCGWQh46+nxDR0nWvJEd56sWa/Ce916poBs3DHk+IGW
	 bnlKcArptqqqsc1dxrnQkVPv9TveiPWrFnXCeKw2EHM8WtTL0OI71E+T7jsRhpv3U/PS+
	 Juh36LtyPJcdVth5Hi/wKTZPWB2Uyr9UuJd4jjBuSybCGRzDewgOKqdW7roBQyXP76A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793898778;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=meKomacjCgDHDujcj43Gx3nzO9N+WR5rogxiQaTOISk=;
	b=RDEVCWSz5JO1/p1CeLBmZJaWesOyleDS65UuKYWc1BvKqi66TTmGUXiIIld//w3AgxGL
	 s79hnmKGwqxacengQs0NEkzzXMl+h4mejtO35bsQMWMHXT6+T4X7WHB1bI74Q/2v+Smby
	 gfSrXIhTGTmKSGHbL3geZsNsD0LLrFsaofOJoVwM0P3ycHZ/HST6ejwc6XcVFZErAhkW6
	 EFIpgbqqtaHm+iy40sStFiiR/w7Aqf/Gs64bGf0FF8eWrYxH1Mcg2tXtmZp9xI3h/VgOx
	 pkdVsCJYU0R8OCQBAM0bOng2WLqsL0psCvSBq81Sr27GTLWQ8OS6W9YGLV6ow+xnMTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=mRkciElr;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CF35606EEB0
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 17:12:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7CF35606EEB0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=mRkciElr
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id D856E4E40944;
	Thu,  5 Nov 2026 17:12:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A74E15FF43;
	Thu,  5 Nov 2026 17:12:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 46C2A103292AB;
	Thu,  5 Nov 2026 18:12:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793898775; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=meKomacjCgDHDujcj43Gx3nzO9N+WR5rogxiQaTOISk=;
	b=mRkciElrqKClJNr6/SQrGIDSQ2XVqodvghCXjUYu6D+iaY5WKW0asQqeA5GF6MLOYiQlwp
	Gpui83w3OtKoa0cDtnFoaVKlovL7kpst8TG0zrvJ/qiGosz2DzSKz36stWTHCNEGKoX7pC
	ydyKRPx6LaXBofMWYpDlL2iJIqPlzc2DmhYTLMchQUk+/gYFwxWgpw6zfe7JmkKDFzt0dS
	GmkJv7UmC0EfZGdy7vgeeHd3aiZcKnyMT003UblPFk14he03bqaymJpLEqgC8pBn2SgXDn
	soNXn7FrcP89PWp2BxDrKHwDxER2bD7svMyFfhZl/YKznBovOOjhjQwCEPU+Kw==
From: Paul Cercueil <paul.cercueil@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Paul Cercueil <paul.cercueil@bootlin.com>
Subject: [PATCH 05/12] mtd: maps: pxa2xx: Remove #ifdef guards for PM related functions
Date: Thu,  5 Nov 2026 18:11:51 +0100
Message-ID: <20261105171158.399247-6-paul.cercueil@bootlin.com>
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
 drivers/mtd/maps/pxa2xx-flash.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/mtd/maps/pxa2xx-flash.c b/drivers/mtd/maps/pxa2xx-flash.c
index bc303a9909d4..15f7fa3548cb 100644
--- a/drivers/mtd/maps/pxa2xx-flash.c
+++ b/drivers/mtd/maps/pxa2xx-flash.c
@@ -111,7 +111,6 @@ static void pxa2xx_flash_remove(struct platform_device *dev)
 	kfree(info);
 }
 
-#ifdef CONFIG_PM
 static void pxa2xx_flash_shutdown(struct platform_device *dev)
 {
 	struct pxa2xx_flash_info *info = platform_get_drvdata(dev);
@@ -119,9 +118,6 @@ static void pxa2xx_flash_shutdown(struct platform_device *dev)
 	if (info && mtd_suspend(info->mtd) == 0)
 		mtd_resume(info->mtd);
 }
-#else
-#define pxa2xx_flash_shutdown NULL
-#endif
 
 static struct platform_driver pxa2xx_flash_driver = {
 	.driver = {
@@ -129,7 +125,7 @@ static struct platform_driver pxa2xx_flash_driver = {
 	},
 	.probe		= pxa2xx_flash_probe,
 	.remove		= pxa2xx_flash_remove,
-	.shutdown	= pxa2xx_flash_shutdown,
+	.shutdown	= pm_ptr(pxa2xx_flash_shutdown),
 };
 
 module_platform_driver(pxa2xx_flash_driver);
-- 
2.47.3

