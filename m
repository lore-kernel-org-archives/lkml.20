Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793898784;
	b=TxV/QJesJDoVbuz4E3vYzxK9RayJt1PScU0i/3ngDrH1YBqXO4I4Z758dXs9btqYmwWC
	 7ZF9RMTlYjn/qlrE0EWT6KJgjirIAXPzHipYTYPJdrua0mPTv8iphsFuEKA0ZzSFBbsIc
	 Saa3wWJ9YCHIPia6EqijN/H6Tax+cYQfYpsdFFsRUbb+TgK8U+CNvjGU5qs0i8g8ohFmj
	 C0ZPpsJ3yroI8XPjlwTQTA/DoeMcYPpR2J+lqHSTDPiXnlCFm6f+0YaETK8Gtt7Kk8Jxn
	 U2/CQuff728HPA7yl1t6RHt09BrlypyopDq7bKLTg5xJBfRc2aK7Orf6ynpBiUNKH9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793898784;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=sqZkBteTE5w8IlEa32XJONCoO4n7XmDtTxjaXaNNFJw=;
	b=yUKu8E0Qpe7WDfJlAI/EopSGlDLuxieh3TuRgt+73dNNYO18TurXHSukXbgT4anhzAnR
	 63jjCfX1f1xh+UjKwdOL2CnNhHookot+MdJA9C7DTqtd+DLJ9cJBX5DW3HLOl7gjoXnvL
	 WDqYXvias0dT80+0+oMjr9NezfRCHgPXXT6IkQ9j+C6CmyU0XqFJm4kSahblcXMPgSpJd
	 LoLXkG8LrQqneM6qwwSAam6v0LazMJFYbKYjWr3iYqF0ouPcBYkvpDHfSwbVn6Qtp2MRi
	 AEDn5Er4CeBondV6sK7+jwR2I45tnnsNmt7TADTxKnC5/LN9M1isT/UZT2fJDN8aFXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=AFnZ7bxE;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15E546082BFA
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 17:13:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15E546082BFA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=AFnZ7bxE
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id C906F1A0D96;
	Thu,  5 Nov 2026 17:13:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9F7E25FF43;
	Thu,  5 Nov 2026 17:13:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 582BB10329289;
	Thu,  5 Nov 2026 18:13:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793898782; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=sqZkBteTE5w8IlEa32XJONCoO4n7XmDtTxjaXaNNFJw=;
	b=AFnZ7bxEtVvPPwlZt048bhc0UIxYMjkZd560LrNFT6az0LKDYkIiX+wQPF88weh2FvjCzC
	+EFA+dTZibbRIOS68sTMWNHiHbC0wJD/RQP/HOrXsdKlnnCegbEwMSBT1uW3xPbnG4s4xG
	AHdFcAntYWG55SSqqs8GbuXkNuMkE2mJcNAfEABeK/d4H6G/JQk4+dGqKw0KDfac+0ILrH
	dO127DDi12WKRYsM07GVmveqRQhz3++pmAH2lM9NEkkPf7XEw6EeazdiuknGxHwd3oT2zX
	iL6+GIxROuxIKMrPidJdtgX+9L2xo6qF8/kC8fpxCNk9GEnqAbzdL9A7Nfte6A==
From: Paul Cercueil <paul.cercueil@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Paul Cercueil <paul.cercueil@bootlin.com>
Subject: [PATCH 10/12] mtd: rawnand: omap_elm: Remove #ifdef guards for PM related functions
Date: Thu,  5 Nov 2026 18:11:56 +0100
Message-ID: <20261105171158.399247-11-paul.cercueil@bootlin.com>
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
 drivers/mtd/nand/raw/omap_elm.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/omap_elm.c b/drivers/mtd/nand/raw/omap_elm.c
index c1d19b8e6715..2e8ab20d8edb 100644
--- a/drivers/mtd/nand/raw/omap_elm.c
+++ b/drivers/mtd/nand/raw/omap_elm.c
@@ -428,7 +428,6 @@ static void elm_remove(struct platform_device *pdev)
 	pm_runtime_disable(&pdev->dev);
 }
 
-#ifdef CONFIG_PM_SLEEP
 /*
  * elm_context_save
  * saves ELM configurations to preserve them across Hardware powered-down
@@ -540,9 +539,8 @@ static int elm_resume(struct device *dev)
 	elm_context_restore(info);
 	return 0;
 }
-#endif
 
-static SIMPLE_DEV_PM_OPS(elm_pm_ops, elm_suspend, elm_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(elm_pm_ops, elm_suspend, elm_resume);
 
 #ifdef CONFIG_OF
 static const struct of_device_id elm_of_match[] = {
@@ -557,7 +555,7 @@ static struct platform_driver elm_driver = {
 	.driver	= {
 		.name	= DRIVER_NAME,
 		.of_match_table = of_match_ptr(elm_of_match),
-		.pm	= &elm_pm_ops,
+		.pm	= pm_sleep_ptr(&elm_pm_ops),
 	},
 	.probe	= elm_probe,
 	.remove = elm_remove,
-- 
2.47.3

