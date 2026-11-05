Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793898784;
	b=MktsBImg89FbTmJR5+4sDyEQK801cnUao47uZHSCHCR54pG3ptE5Al3uC7bzcEJk/6Vn
	 NgqPxBt6gr7q3vq3QkqBA2oF65boVW8CAqyMWzLpMOFT5Cf2vanCxj/nsJan2Bv9NrQQl
	 j10YmYNNGZVxtMvFbpy/LtDTltuSHI0L6Ct77nPEWj4hEgoGiBcpRKD1UMO0THhqA4Kp1
	 5ix80dhIQ2E3Uym2MlEDMpAX3OmX0MHcRswWrpZ0O1zxLkSzA/Mf/CXBJlOspnBynnMVJ
	 rGiC0Nqn1vbQkf2ydk08MZMoHXYt4UjgVhOlxmkNnHdFnI+cvaenmhNhBKMJsJEruKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793898784;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=DGDDOafteCMnF/ED0u4XiZ/iqjUu/LT48qOf6yq6+BI=;
	b=4a1JsQPT6hhUMQvdVsRJWzt8DulfYKwmlZsTy14beFW/cAmYbNAjZ2K3XmILg2zM/uRJ
	 mzCeUmJdjQc3/DRb4HogOOeR0+l/oU2HrMXtt27+HcNaJss9ZJXB8/lbeKaxPRm+85rbK
	 6gjS7fG6mkXA9p+Ym+zcqhHDEv5VEUTBFh4XG3NNRtrarS9fUPyDlWoasDzaDuHMGSRV9
	 4NXOxGmf1Peo9hrGnQyWIBn53Bofkm86rADz8zd3tdK9WXk1kfQESM+XHuqmp/yLHkhCl
	 v5A1z+4lnDi9Pademx1l9IxoicTyV2sN6GfgBIms7ZveormEPTS7gtasE3gfOYkSGAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=D9AaXb3G;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3647606A328
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 17:13:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3647606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=D9AaXb3G
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id EA767C69162;
	Thu,  5 Nov 2026 17:13:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B7E5E5FF43;
	Thu,  5 Nov 2026 17:13:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7E184103292AE;
	Thu,  5 Nov 2026 18:12:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793898780; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=DGDDOafteCMnF/ED0u4XiZ/iqjUu/LT48qOf6yq6+BI=;
	b=D9AaXb3GEmJffqpxhMdigP2MrhMV+4y/PaOcSxHluBgFTsp/8WclWOX5pqBFWxkb4hF8nF
	MUaeAsDD1kydpPBfEKItIROcIa4BxTk05H3Y3ges6dJJcwGPjNj/Ebo+sTBaa0IT0fs+QG
	+2cB4R6fTjLh8Qa/8hz2Cu29X2pNzXjyf055SDqSXJ7VXc+WIgfaHMyUF/Too0CVfHVfKU
	uglDid8cXNJrGAf/kYkfIvTA+ZlLHNSW0C3yODI4F1GiyixBAOAogdk+Ykc4Ml4JfAoQXw
	K7F8DGo9TWUXCu06zA3IlGpQRp19VFXLMdFlC4dqkXgfVm/fAwyqXQmsYrN6hg==
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
Subject: [PATCH 09/12] mtd: rawnand: mtk: Remove #ifdef guards for PM related functions
Date: Thu,  5 Nov 2026 18:11:55 +0100
Message-ID: <20261105171158.399247-10-paul.cercueil@bootlin.com>
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

