Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793898787;
	b=gs5nGA9NidjknUCXsVdfF6DLHe3rIU2LPVsd1CbWah3SCpIl/j8SZw5Ht7njX/K0EIYM
	 WDIawYgzW8oSZdFkBschXujll3crAcko0GILP2rA5h3XRubCJhBtuwLZ06xRQE2+UGpzh
	 boc1DIKhd1E0RUTzwIoHwMFyWz2M1RZJofhatS8etdr9sn4k5oq8aHxeg7ji5p/8xaDAb
	 dtSRhlLwSOHKNg/uYzyUCLQKT9wiZgiFyjKFWIeFP89GzoAMS4cH8CvplLX4mzRGLDPBu
	 zGtX6mE6SzLZKD+nyYIxBZqHX5ThWEk5esXa7LoPNFeWGhYGv27I2IiPBKF3UCjIJCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793898787;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=OOkUYu1EZFnPCSGQBZwoGTH7xYgEpMmagU9IyZl2dKc=;
	b=pniyZQ0FyDthFozWI3mdqTk8kWdTUFGyKY7ws4YbJX0mC+srQkOTjUNCYIWrmRVb9sYI
	 Dy/7CjCI17r4i8Y4mwOQoN1DmdZMIFn9MGcoV3X7yh2fILHTMys9+CpR1twHFW1bqArCb
	 9AvqCcXXHHoLLFSybNZfkLt+fgevG+lrhA3ndkbPaJbMKV9HXzhuUcfJbGfBeoRJ3gsV5
	 qRbCl17oxf9G8+kOi/tRZLmTwkBElhdhuOdNcEHwkZrOWQj9irJgHcl6O7f15t0LdI+7z
	 A2/i12+e7jgcCE7rAeIW5Y51XmOQShzZvVAJgPrSiavo31gkE2baRAmWU5NcTYFeDlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=A07nps1E;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65B2E6083624
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 17:13:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65B2E6083624
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=A07nps1E
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 459D5C69165
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 17:13:04 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 17C715FF43;
	Thu,  5 Nov 2026 17:13:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AC6EE103292A4;
	Thu,  5 Nov 2026 18:13:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793898784; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=OOkUYu1EZFnPCSGQBZwoGTH7xYgEpMmagU9IyZl2dKc=;
	b=A07nps1E0mP9e9t0U1Y6lQBMgP97pa+gyCzCTqhQxMJc0S59QgCUweplqNxhr4nf5WeprE
	wc4s/juz2pD2bEhUCmPzr6Lj4idz9NWjk1++VbEzjiRL4iolwPqBVJUuaXNr23xbmH79RS
	mlNTdgFPlwl0IPh/LwNJmRzbULZ8U32IAAkNaEuz6qJX1lWr5vaHMZ6qaeWN2gm0nCt//t
	Go+AoPnfiuOxDZuGOSs6X1hd4xeyVCkatYHmjubyrzR4WACJcUlxO1Ap0mrJf2ip8QR+RQ
	OpeEaPKEzR0Pm8v4sc1uOhqMLMtEtaLAHv3SESdkxbHyRUIJsTPCe7GqDjLTGQ==
From: Paul Cercueil <paul.cercueil@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Paul Cercueil <paul.cercueil@bootlin.com>
Subject: [PATCH 12/12] mtd: rawnand: txx9ndfmc: Remove #ifdef guards for PM related functions
Date: Thu,  5 Nov 2026 18:11:58 +0100
Message-ID: <20261105171158.399247-13-paul.cercueil@bootlin.com>
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

