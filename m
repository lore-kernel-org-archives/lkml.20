Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793898774;
	b=L1TVBIEucVv9Q01Ef6KoLtbYYk2O5PxIuOKxa6N1pYjA4rRCN4Z0yViWDvx52FgbhOiv
	 wsTWhnckUleyux3HsJQjiCwteiN3rdxiph5F0C30NP0Ggm+w87OoG8uuAtGFPgJlIN3w5
	 NhBDwroJ+2nYr3sPwObr8UW7qlRyosrf1rh/bROoqE/B0+XNiutP5PHZ7JVJkKAXA5maM
	 JaOdJ8hcw/7uDjm0O5Kp3FNFwGt3jjeddy0o8bGzHVKJmCOIAT3cpQuXlIyZXfSi858qI
	 84u/Jf867psR3tr5OC0skIJm2bkalaT4ygZ0dqsvZOqmfWbtdfNtnjte9ChLT5bscRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793898774;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=qtWc1kJS3qAw3VXAtfG98YEe7kRkAnppPQTfXKEnMWg=;
	b=BObl4X8WNW+NNlxZLnk3GtRrRgtcdArLEWBYl+0z4oXKRuYjB4n7PXPhiy28adU6veY3
	 ZyQ+cUQL+7VNHB2AOndnzMyx67Z76yJdU5s8diMCjsWow/aejkqbH2SqYzqUqVF/JBdJl
	 K0TqwaE0F2DfQ0CPrgMZYudl6JgYp+nQQe+BHk03qjqbck5gKjR13cYuq4HK5txdtjrxq
	 13ejYVvTF3fnFThWaECtJ2Bl4eFSlTAJTEOY5sccRnKwpJXQW8h19GZIonpt30EcFM/4P
	 4duI/fIjzxPgSFBjJpAmRgBq+ekvwt8eoOAUpe+JLZ0TrkRXtA0rFP83xeVrlJNG4fQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=gY0Gycnv;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 669BD606D80D
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 17:12:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 669BD606D80D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=gY0Gycnv
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 421141A0C32;
	Thu,  5 Nov 2026 17:12:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 102725FF43;
	Thu,  5 Nov 2026 17:12:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AF216103292AE;
	Thu,  5 Nov 2026 18:12:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793898770; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=qtWc1kJS3qAw3VXAtfG98YEe7kRkAnppPQTfXKEnMWg=;
	b=gY0Gycnv68zkHNSmvGn2h5HvvF87OsYVoRhsvnjzOpfuSCf5uKE47d5BB8YtKkBMD5tyNG
	tqaAo6unRDTP0yh0KAc3dLpHG/KJQZvebtr6LTsu7CnOYt41Vhy7kGLSDnS6DR8xt9f3RF
	wo+Pogp5l2T8gVR3H7eSA1a5x8bJN2CnDVx3T0LsmIfKOOanWZcOyu6D/HRzesUYKxl6Ct
	ox4c6FIuL3itBCCveHXG/9TIX2xRJKSkimqjc0Pf90CLIPFdy5+7uEzE5KEzQlFQsE1aEq
	kVWRF9FKT3Y0TCMLrT5FM5nRVyKeBQ0V66fOD/QW9obW4KL/O5cp6ebbTxlmoA==
From: Paul Cercueil <paul.cercueil@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Paul Cercueil <paul.cercueil@bootlin.com>
Subject: [PATCH 01/12] mtd: Remove #ifdef guards for PM related functions
Date: Thu,  5 Nov 2026 18:11:47 +0100
Message-ID: <20261105171158.399247-2-paul.cercueil@bootlin.com>
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

