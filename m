Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794908295;
	b=DJsSbEugr96KMkmhnzgh8K+RfdyD7UEVNtB9dN9TqBh7kIGUzi8MTuNm2GarezbiTbbZ
	 mIczB82jvrAQvdUqoNP2QYqEVHu1cjysv0eq2sfRJfIB7fBBTFPgsaWbeGmpYuvHvYrUT
	 MsRzrDD2i7MaMVWJBFjxOOollt08k5Vm6tGEOAsoR6cMjj2aoeI0MB0PflSSlix02ivRf
	 rLWIwTcVatcSOMq5vC3im3G2h24jVoaV5MOHTHfXDpWkJUYi9KjfPmMDHY8FyH8S17VZm
	 MXFLsr51J7PYfBqq5tRcNqIYFRWlqi/xoyadw4PcwLFc26ZRAwy7y56EAjNaK0O5Ilw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794908295;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=/RD6QcqfT8lVqNV9ZoXFSMLkdbPS8XDfq1YdC5eCrLI=;
	b=ccGxHgk/jZHVAJh/CT8YTk2osRSJCV1Z+Vy9SXff2f4W5KFe/dzoTuFEPHQaeGzLyNoA
	 uHfnWVzjWqpEi5MRE4lk/gPRhbkVFEYdQ6cXQf6V8L7TCZtpVVyTEjz1wnPCbfWT3KCgo
	 kfDq+GuMI6+uV1DyxBaNBrC0I6x2GIyofXd0eUUEwgJNFDqUD7wRaw8sihIOUGhMLDs/w
	 Nw8KgyMdaJ9BPvWH+eQcNTBomsYpw6sibg36UoZh6KMyo9QQ5vXaQpyYd4sNvz4U1NS0O
	 Fyk8n9RaAZL4mfHvQ35eG+cWSb7LEllw7gsmldJwSH7PWJ3XlRG1Gasxn+ZAEBEFXOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b="I4Nk4L/h";
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B5F7606A8A1
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 09:38:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B5F7606A8A1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=I4Nk4L/h
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 185661A158C;
	Tue, 17 Nov 2026 09:38:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D93D15FC81;
	Tue, 17 Nov 2026 09:38:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5B5CC11BC0C04;
	Tue, 17 Nov 2026 10:38:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794908292; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=/RD6QcqfT8lVqNV9ZoXFSMLkdbPS8XDfq1YdC5eCrLI=;
	b=I4Nk4L/h2QpDBJLYY5gLsTTTDYv8Ivf8x6rjV60TsXh7rfHxs3zA7ug4gmIjNLdvE+JEKA
	aSRecseI3/KOo1rgfOKTno22PqQh0ez73DNgz4ClEnRjil5Ijj+fqnB4y8yIlFHcZctn2y
	SF8SR6sgV5Nr4cKNJ7xEJGEIVv3LbVAv/iEYcc+WjOR/nL025qEotPChW2HzTl/P5YVFuz
	bAdvDU9oGaMSyWU7uTa25E8YIY6z29HjgMGeH2/vZ0BJDY4Jy638rg6tWjcHPEArqLS8Gf
	OKdChEujc8+zzrKtjVDcHt2xGJkWuOYVpADTs2tsyHln7gcNtmpHi1ZYfSClXQ==
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
Subject: [PATCH v2 06/12] mtd: nand: mtk: Remove #ifdef guards for PM related functions
Date: Tue, 17 Nov 2026 10:37:44 +0100
Message-ID: <20261117093751.14988-7-paul.cercueil@bootlin.com>
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
Cc: Matthias Brugger <matthias.bgg@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-mediatek@lists.infradead.org

v2: No change
---
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

