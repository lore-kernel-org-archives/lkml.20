Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794908300;
	b=JKp6+QC3dYi5Fti21syW/fq1FjFikG0vCXKqQGr8ZoJ68Pp8WGa1tf/3G47ULp87tY4I
	 zmTKMlh/TRiQ+qkvWZTGww8/7wAgG0Hg/tSqDIA7bX5FDpCzucqN2EqHzLX8uevvOIOus
	 E91R1KlUsjG46/8Hqb+cpEludEEqNNN/LKzmaYWJ8DnUFdKS5BdYMNzDT1Btn8n79CNB6
	 Apbv2nYanCl/bTeb+aLKEd1SCVaY8wfCVGBNRx6DOvYpLpKxAgo5m0ors3QlMpgSIuhz+
	 wGHZgh4IyvNF2mEsexcRePz7Aft2l5Lh8cl0wXa5GgB3rDRlCLdmgMZnzqiH01y5j8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794908300;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=niJD0njQ1UDwvr3T+XYsWPwrBy0c6qlXpaKDdhLmAMk=;
	b=p/RuHhOUa0UmrRkraEldZXYSnAJek289RMmslhch3N2QffeeYpA5a6v+n7jvfZap9joo
	 bvrtmoejCAU2V4TsznXHJSjHt6erF/nBYUf6Htj/3htcB9Yi45UWHeLOGDP3UwC/7FJtM
	 W7Ix6WA+TuB5hNWMChHWCbeb+1UPShvGERyyRi0IT0uIYWadK51IMyRI91iwla5qSrBaD
	 u2WZmG69l86X4gCN9k2erw779lUnkb20QkqjTA3LOcPmHhWv+TaNlsug7D8+xK8vhSuts
	 xcXZWef3QFmCbJrUQoW6UCq2tPo9JpKOocARyC16tEJ0dkbToWuGYsyB0LxpqPKSI1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=gV4ssBiq;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 663C5606A888
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 09:38:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 663C5606A888
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=gV4ssBiq
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 21F001A158C;
	Tue, 17 Nov 2026 09:38:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E52805FC81;
	Tue, 17 Nov 2026 09:38:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2BAA811BC1129;
	Tue, 17 Nov 2026 10:38:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794908298; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=niJD0njQ1UDwvr3T+XYsWPwrBy0c6qlXpaKDdhLmAMk=;
	b=gV4ssBiqLDmoCoXe4SIe/bAL9n9hYqos8FqYkltwMlaPBbOoBoKvKweKGq4kJIk2LPrHoS
	QxTq4Tr7BQxbOt+1EWq72l/wdppm1KPu5tcgsipDdfYBTrTRt/cWPVs1JBYqon11EreHAa
	s6CcWSvxAbB80MaBHKcXOEqQUJTZYrD40/070WgMNEPIpE+D/ktouXwY0HpeDpBe3VhedC
	/eewolPwxLk6j840izkWrephiqyu6o/5Wx5yCm5B6fYW4WjGW8unTw3xY44q4GiAPbCEHO
	5VfYMCgAtietMz0v1JSIdMLNdukBXq67F1BpOR2aN8OWIUzDVot+m+IERxcX6Q==
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
Subject: [PATCH v2 09/12] mtd: rawnand: mtk: Remove #ifdef guards for PM related functions
Date: Tue, 17 Nov 2026 10:37:47 +0100
Message-ID: <20261117093751.14988-10-paul.cercueil@bootlin.com>
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
 drivers/mtd/nand/raw/mtk_nand.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/raw/mtk_nand.c b/drivers/mtd/nand/raw/mtk_nand.c
index c439b7814ebb..4b8451772f9b 100644
--- a/drivers/mtd/nand/raw/mtk_nand.c
+++ b/drivers/mtd/nand/raw/mtk_nand.c
@@ -1591,7 +1591,6 @@ static void mtk_nfc_remove(struct platform_device *pdev)
 	mtk_ecc_release(nfc->ecc);
 }
 
-#ifdef CONFIG_PM_SLEEP
 static int mtk_nfc_suspend(struct device *dev)
 {
 	struct mtk_nfc *nfc = dev_get_drvdata(dev);
@@ -1635,8 +1634,7 @@ static int mtk_nfc_resume(struct device *dev)
 	return 0;
 }
 
-static SIMPLE_DEV_PM_OPS(mtk_nfc_pm_ops, mtk_nfc_suspend, mtk_nfc_resume);
-#endif
+static DEFINE_SIMPLE_DEV_PM_OPS(mtk_nfc_pm_ops, mtk_nfc_suspend, mtk_nfc_resume);
 
 static struct platform_driver mtk_nfc_driver = {
 	.probe  = mtk_nfc_probe,
@@ -1644,9 +1642,7 @@ static struct platform_driver mtk_nfc_driver = {
 	.driver = {
 		.name  = MTK_NAME,
 		.of_match_table = mtk_nfc_id_table,
-#ifdef CONFIG_PM_SLEEP
-		.pm = &mtk_nfc_pm_ops,
-#endif
+		.pm = pm_sleep_ptr(&mtk_nfc_pm_ops),
 	},
 };
 
-- 
2.47.3

