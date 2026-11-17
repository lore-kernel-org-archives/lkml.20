Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794908288;
	b=ACALDRHfP6VvPam9Q2EEq12BsjpCTlGN+KTnH8BxNgU0VvtfuoMw0UFaR/KB/TGcninb
	 dO1fOGhqIdmWpDWNE8a/uDGLVUyiHwuLrQh3PTaaV9uDOiPAC1ojTK+BbCsX2U5LWDzF2
	 zEO3p4Jmyb6++f2fFXazd7rrP9ISlrluIcQRmWrMvxrVhFsKXBjlFj8sWFcSImZ0mKhii
	 PWIbRVIF6m/gyTNss6ajH6E4MSlJmd+qQ30utkGG+QrEv4H9AsR9tyMFf0QgJcCMpg5Dk
	 08M5uA8ooj+sUGDLur7jU0FS4/RbY0b6fY7MT80/cIQ3sC3vUoKpvYzxx+gF/UBXP5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794908288;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=iZd/PZUoFdKhBeyeAbEydYh49ajApffNHjJPJHfCAaM=;
	b=Ptx5S12RgzmI/L55IueNT96aGp1u16UNguweXYWbqZewq/fBDJJ7bT9fg1jxAMwDlkVc
	 GmswvBlpG/BYHdJ6PTPbAIn9M3lM0E5HQddEVh2u/bdTI+9IpEhnyFlosDGqbzaIZKEOW
	 ENjpOkDKt8IdYlmpm9xZvKHnHo3Ijsg8droYRbOfHL81wyhe+rMegPnIkk1qw+qkTM1G9
	 WTJSJkNnaVXeQS+Y7g3q/Okf+6AU454C/a5d8J7f59ud5XBOfZct65J9Ft5bnOpZKz7+e
	 g1IH18wHTwzLT7KJBo75GuQf1naJ5VbykQ4krbcyhfHNcy5gtC8gYrYORNYNPvyqVFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=TvTdlOzJ;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA175606A323
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 09:38:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA175606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=TvTdlOzJ
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 4CEB71A159D;
	Tue, 17 Nov 2026 09:38:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 22B4D5FC81;
	Tue, 17 Nov 2026 09:38:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 78E9411BC0B8F;
	Tue, 17 Nov 2026 10:38:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794908285; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=iZd/PZUoFdKhBeyeAbEydYh49ajApffNHjJPJHfCAaM=;
	b=TvTdlOzJgF7IQydOgcx59uFP25FsZSevvWPR2gRuWD2VoWw7ey2c+KDkFLVm3We2WrXQh9
	havnkPK02DfeDn1cO6rsVclawX2fTcBf66AWUHOQ/4k5WOTgnQWx7BG1olimeVAtj5J768
	VKgI/s3XLXsFwmS/aqrPOaLhjUndqYxuJYvEWI1k9yRMa9oSF+V4o352uL2FqDCE0t6SR3
	TqCTL7hstrCI9pTMfPdBmtezs7X45r15fdWaB+uqo09qDjA+p2pvidL6EaJ9svDxIGgjUp
	/fNH6c9tNopC6nM7dvf5wmy5XZSpJ4dD8GYUu4jD+lDbnC27mMeGCuIOUvSaJQ==
From: Paul Cercueil <paul.cercueil@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Paul Cercueil <paul.cercueil@bootlin.com>
Subject: [PATCH v2 01/12] mtd: Remove #ifdef guards for PM related functions
Date: Tue, 17 Nov 2026 10:37:39 +0100
Message-ID: <20261117093751.14988-2-paul.cercueil@bootlin.com>
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
 drivers/mtd/mtdcore.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 82b1e6392b16..037fe292867b 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -40,8 +40,6 @@
 
 struct backing_dev_info *mtd_bdi;
 
-#ifdef CONFIG_PM_SLEEP
-
 static int mtd_cls_suspend(struct device *dev)
 {
 	struct mtd_info *mtd = dev_get_drvdata(dev);
@@ -58,15 +56,11 @@ static int mtd_cls_resume(struct device *dev)
 	return 0;
 }
 
-static SIMPLE_DEV_PM_OPS(mtd_cls_pm_ops, mtd_cls_suspend, mtd_cls_resume);
-#define MTD_CLS_PM_OPS (&mtd_cls_pm_ops)
-#else
-#define MTD_CLS_PM_OPS NULL
-#endif
+static DEFINE_SIMPLE_DEV_PM_OPS(mtd_cls_pm_ops, mtd_cls_suspend, mtd_cls_resume);
 
 static struct class mtd_class = {
 	.name = "mtd",
-	.pm = MTD_CLS_PM_OPS,
+	.pm = pm_sleep_ptr(&mtd_cls_pm_ops),
 };
 
 static DEFINE_IDR(mtd_idr);
-- 
2.47.3

