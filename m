Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793898779;
	b=YG9U64ybVAQ2Xly167YIaSvOotRAheleb8mK+z9uceDoT607a/sTo0TmXlkV3rpVAk6A
	 etDGWDioz4KwYig3jIrgcBsXcOhkVf4PNmiAxvXdWzSxyzDQo781nfIW+CZMf6G/xMwrj
	 nlsYZ8ko+SliBK8PbO8P4YXYRHN6SSTF3GiP53HW5wmJ0U9kvOUc7n0yO2mD8LLvfgcjU
	 lFxrmj1BBazYiqtiJyB99yQ/CDAUuWmPhx3xuZ+iAVpcm+aTDhAmMNTe1LaPqEJKsDftk
	 A55XckDdCULD3hl8mZSLUBFU7rGk2UVQpnxOR/C5HTwSu/cDXt6v949AWeTqHnpRwpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793898779;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=eavNaDX6RIZNrQjZVF94tYLxdb7VwfBrEfcmK23egqg=;
	b=i8yZhK75h9NokjVq4NtVATLec4Ti5ZlMsVVSSVrVyZa93l1M9cIrCL7rijKyhvGz0PWw
	 LCdiCiPJqTqsMfNajV02CF8lyuM7HqTmpcESbUvKH4iwNk+uKLH7iGWxx2DnSFjBrYnVs
	 VmM2FSHcbHLWFSZ7lCIBNY1Asj3sewtl9E6NZobZK+1pUfb+JogDld12a/JdFvbKAnQym
	 5UlXwzalBlUGpyk9czGCjG9JkI/d2ShRzehJ3elq6nHMwFZjTuOFc+VrtWGLaiC1IkMQE
	 fYm39XvY4gjoeFznxQo9uSVqXURY8TUptZw3MBuvIvReTU1khpPBW9U7SjOQ70XntMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=E1FcOr8Q;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32D8D606D821
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 17:12:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32D8D606D821
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=E1FcOr8Q
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id D77FE4E409D1;
	Thu,  5 Nov 2026 17:12:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A64505FF43;
	Thu,  5 Nov 2026 17:12:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7DEDD10329289;
	Thu,  5 Nov 2026 18:12:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793898776; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=eavNaDX6RIZNrQjZVF94tYLxdb7VwfBrEfcmK23egqg=;
	b=E1FcOr8Q7cyVmUeRX5Hkju6/kQttDjE4GnpiEwm3/3VzWvc6Z5FwJE3EhMbshf50fohqON
	44XGD3I3dwXL3YrSAZqQzFRaJsct9BtxnCgzIPcmt9qzEWoEwRnhwllRbKD0MqTtzSwU9/
	np9EFGi7XJHbto19Flk1SCpr1ISedQ+H+eQQ1aUmtKbhqA3GD/iWt6HPLnYHSNXtKB8Tir
	feEqsIIC1WUNIaKs/B7j6je9cXiyMIUvM7IKVPpsK5P2xzV3XsqjmJwRLS0zH44C/VmWyO
	AIwtas7rthTuzlZFoEqarTHxvdjuTu0FkueYvAlcVfNmccS/cZDld5sgbfFJEg==
From: Paul Cercueil <paul.cercueil@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Paul Cercueil <paul.cercueil@bootlin.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 06/12] mtd: nand: mtk: Remove #ifdef guards for PM related functions
Date: Thu,  5 Nov 2026 18:11:52 +0100
Message-ID: <20261105171158.399247-7-paul.cercueil@bootlin.com>
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
Cc: Matthias Brugger <matthias.bgg@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-mediatek@lists.infradead.org

 drivers/mtd/nand/ecc-mtk.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/ecc-mtk.c b/drivers/mtd/nand/ecc-mtk.c
index 66f0985ef7cd..6f210ba935ad 100644
--- a/drivers/mtd/nand/ecc-mtk.c
+++ b/drivers/mtd/nand/ecc-mtk.c
@@ -588,7 +588,6 @@ static int mtk_ecc_probe(struct platform_device *pdev)
 	return 0;
 }
 
-#ifdef CONFIG_PM_SLEEP
 static int mtk_ecc_suspend(struct device *dev)
 {
 	struct mtk_ecc *ecc = dev_get_drvdata(dev);
@@ -612,8 +611,7 @@ static int mtk_ecc_resume(struct device *dev)
 	return 0;
 }
 
-static SIMPLE_DEV_PM_OPS(mtk_ecc_pm_ops, mtk_ecc_suspend, mtk_ecc_resume);
-#endif
+static DEFINE_SIMPLE_DEV_PM_OPS(mtk_ecc_pm_ops, mtk_ecc_suspend, mtk_ecc_resume);
 
 MODULE_DEVICE_TABLE(of, mtk_ecc_dt_match);
 
@@ -622,9 +620,7 @@ static struct platform_driver mtk_ecc_driver = {
 	.driver = {
 		.name  = "mtk-ecc",
 		.of_match_table = mtk_ecc_dt_match,
-#ifdef CONFIG_PM_SLEEP
-		.pm = &mtk_ecc_pm_ops,
-#endif
+		.pm = pm_sleep_ptr(&mtk_ecc_pm_ops),
 	},
 };
 
-- 
2.47.3

