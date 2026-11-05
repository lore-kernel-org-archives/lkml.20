Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793898780;
	b=mJ8v7h9CiUVezrDi9tKHU1XVt3OA3bdBTgPiFhJpUSSBJIYgIM8KGwJ0NTkGrM+Yh8nD
	 Nq4boCeDYyEWEXwgHmdhE9mvwPIr38oKrGo+YvYK55DmqQV+IV03lCOCNn5epMpggvMeY
	 yBPvXgyPNzc5zqnGdzf2rgzE727v/PiNx/rzqReuAjbOXBhiIOIyvtpx2lO/1xZISP8VT
	 h3UjeoUVCONPdxvNCzIWfn9Zp2hxPaAHzeOjwBYiAi3Oy/zotCcGjTYY39OmMNPcMbXu2
	 UKNSp2sKlMXgq9yLU9EJxDPwlsNta8CbjB58bORu275yrgpWInA2If798C4tgq7u6Jw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793898780;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=V5kDdJozdBER4zNiEbFblzGULK1BuE7KJGYVqxyveds=;
	b=JBmu5BvC4asD/pb2GPrPCbd0ac935//9wiLga59XyoHjh6g4W6kE6fZlKTC4RM5gYehu
	 xiJrjLwOo5vozWr2iF054+ozL5iQoNusyZco4dUUKq8MTD2DcBK+cvQamSnzmKvDH5MxC
	 P8VTVA1qI+2ONNQN6pkVVD476Y6nC+Igf3fXYx3fztl5Obm3j0LzAgRNtScArQ3C8s25g
	 O4K7QY1x1SjmsII1GGRmVjW6zlKPIfwjz1ntQt2msWfVHORF03x58rRJ7MiedcbHisyTJ
	 2QeiLmfP5mSMwqupnHcPXfSE3ZQ9DUABFI76flw75Sndf6o6WORVG34Php9efzwPaLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=WAibX6K5;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0906C606D824
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 17:13:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0906C606D824
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=WAibX6K5
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id C9D8D4E40A04;
	Thu,  5 Nov 2026 17:12:58 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 99B0A5FF43;
	Thu,  5 Nov 2026 17:12:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5A4B610329258;
	Thu,  5 Nov 2026 18:12:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793898778; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=V5kDdJozdBER4zNiEbFblzGULK1BuE7KJGYVqxyveds=;
	b=WAibX6K5VuFYzcX11Zu5A56/RlxSGuUFxqyVymZh0JIF9KHEh1BD4KTuKlWIaJqdgOEDLh
	1a8t2XNzccsuN3Q5PscCcpEZwcUbDw17oalXNRLRRwLx9QT9D96zjGqEOuER+URUM1b5Of
	vdIsAuOAgfb07CwvMRix5gIfgsdb4HEcJgyBbOqQVrzVvOfkwADkBh5dyIsg4pN2Iiy8mJ
	dtFXMJRvut4SmkGqoy6UazFc1NANEe5D/3gUNWgNpo9RPLWOYu2bW+A8MvI+YGeyMXupwZ
	3cfX0QBDek7W03bbYjijBnuTRt1tr8AInBThyLRmId4Dkkklu69Ni7Tl2wfLYg==
From: Paul Cercueil <paul.cercueil@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Paul Cercueil <paul.cercueil@bootlin.com>
Subject: [PATCH 07/12] mtd: rawnand: fsmc: Remove #ifdef guards for PM related functions
Date: Thu,  5 Nov 2026 18:11:53 +0100
Message-ID: <20261105171158.399247-8-paul.cercueil@bootlin.com>
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

