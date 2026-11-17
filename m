Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794908306;
	b=KOm0P+9y50Vg7DTusAF5ZkYI2eVeGkCp5Gve5MujPr66/qLaJ333Gs2Yk1J61/P0XaVv
	 CBMoOpE5RdKnhDqUtVNPipU13F4dTdV/ttDUvJx9DuF3ZtfLhEURIMaQYKNUbdvxQRWYH
	 f7anTm55htJsVIcfcaQQdz/KR9DYP4I7otS28kAXFvw1chNkHqZpXQnN0NvuISOTaq2Ml
	 GN60rndsoZ06EozedpGrUIToWMvAzWRm3fCHaYcpe1OrwFE/nDLuqWP2RaVWkVcWFVWD/
	 fHkpmjQPVltZxvXoYeinqqfEU6btksUdwgHCodgm8/IO3XUmZXUkLFu4V1d9eRM7YdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794908306;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=doiWoBjdny1ljjzKEq5yZ9l1HgmsVW3my1hbvOjJh0A=;
	b=DKhR0WAWYznvJSKE9bhCKduDlw5mMeMxsVYgAj3inh5nPZUdt+RtuhpG8uBSes4OtfZc
	 MYAxCUt5ujRlQJxIdh05F57bHdterjVVlFXQIChFsn1IjnrxR39ug8CWSuHnLXXoATZ9d
	 qetzir9QOhfQaU/VXXt+QxnyO8oKppKGnFPZoBlrZ4ToziYEHHVNFrXJCMjoFl7yenlLA
	 6VmFT+FQZqfY5gpRfoMsrgytnJvGS61UAQACSd4Y3q17YpR8BvaASDuI23ci2iTFaw57c
	 0H+D6A7WbR/0hirrnWXYUF0gg86UH5JZJlOQJ8fH5zU+aEZ2Xj+FX/20aum27lgjTLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=oshs2VVF;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FC79606A339
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 09:38:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8FC79606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=oshs2VVF
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 7207EC4EDBC
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 09:38:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2365F5FC81;
	Tue, 17 Nov 2026 09:38:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5206C11BC0B8F;
	Tue, 17 Nov 2026 10:38:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794908303; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=doiWoBjdny1ljjzKEq5yZ9l1HgmsVW3my1hbvOjJh0A=;
	b=oshs2VVFbKko1cnziwCjIxtOgZGmi/40wvJzVJJkEj5I5QvMJZspa9WvlXh1lrkH5F45lF
	UramDTADpThRZhivCv7uQrerTnoTI9nNCJVEw5LnJXwAOjs/bil8yMJZN3FgrAmtQNgU/c
	RmVO6sRlZZu2ppPlnIOX7H/X7EpOUDV9teht2BUN1XN7SUQL3UYP4qpLalI2gYZ6Y7kb2Y
	d/sR8CzSOrGOAnvElTa8uCtIRnZVYunSdY8fBbxXAM3qYqrsnao7CebCtooRvGnuv++pdb
	Zj4fhQu6jMHOLnuxUZRNd9KNtNNHCCatnaLYw72KOCTF4UdUA8dHbAUZsRSwJg==
From: Paul Cercueil <paul.cercueil@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Paul Cercueil <paul.cercueil@bootlin.com>
Subject: [PATCH v2 12/12] mtd: rawnand: txx9ndfmc: Remove #ifdef guards for PM related functions
Date: Tue, 17 Nov 2026 10:37:50 +0100
Message-ID: <20261117093751.14988-13-paul.cercueil@bootlin.com>
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
 drivers/mtd/nand/raw/txx9ndfmc.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/raw/txx9ndfmc.c b/drivers/mtd/nand/raw/txx9ndfmc.c
index 4cc6e91dbc23..9dc624957a3c 100644
--- a/drivers/mtd/nand/raw/txx9ndfmc.c
+++ b/drivers/mtd/nand/raw/txx9ndfmc.c
@@ -391,21 +391,17 @@ static void txx9ndfmc_remove(struct platform_device *dev)
 	}
 }
 
-#ifdef CONFIG_PM
 static int txx9ndfmc_resume(struct platform_device *dev)
 {
 	if (platform_get_drvdata(dev))
 		txx9ndfmc_initialize(dev);
 	return 0;
 }
-#else
-#define txx9ndfmc_resume NULL
-#endif
 
 static struct platform_driver txx9ndfmc_driver = {
 	.probe		= txx9ndfmc_probe,
 	.remove		= txx9ndfmc_remove,
-	.resume		= txx9ndfmc_resume,
+	.resume		= pm_ptr(txx9ndfmc_resume),
 	.driver		= {
 		.name	= "txx9ndfmc",
 	},
-- 
2.47.3

