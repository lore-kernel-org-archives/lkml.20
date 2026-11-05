Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793898781;
	b=HjVZNPkgx6SFWT+oyJ75Zzh6fuUsdfLMM5liuZRDkjGx0fAMQfkW8fUJfAAbsvvLTK81
	 NMkp6ZRBF2CryXUH/PDKcZ7JWcU4dMFXvwwnwhoJffno2xQzsa8KiAkZq2OGEWXFjQOGV
	 YnJWznBAVncCOH3rAp5YXxNGBSmlxo1y8wBORDIwV+2h4Gw0rB7pDgfRxdPjordn02XA2
	 w59ZBTJBohvRnmvSahmVHeAvab+DOpqVCbYlIMhPiG4iBiRQen2KxxRSpZayIHMjuGMfq
	 DfRfumY4rx+B8ruGVQKBsJFymhADyAOP/gqLbnaL8/2e2Dw70Hj6X1jQ5vXeerHYN3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793898781;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=EMExV65ZcIsZykQBDtBRoQToWRb7jCYng9HkBlA05ok=;
	b=SU4lbB/CCrRYGvMN3z6lEWCoroaMLdoMXSt+Grzl1KU3mXTMbu3pMfrDHKp6llP26z3Q
	 s7vWjo+Lt7vmPUKUR+Fvn5KOuOhIe6WD97bePMMWz+hI8bRv9MbPrlswyukbNhn9V21vX
	 gUS8O/KaN2uGHi2CmziCi2/HWlFylqRzjLB+xi86IAj9Ci8wHd5sI4Ao9NG0xiNMfwEuF
	 jRHO9o/dR9dY7GH68y9e49D89vu00dyva2/LUqN09Lkt1CBCqic/P1HMw5lcJqhn6/tYo
	 o1d9ezDviQDVA5SK3I4u/d/gA2lT9YMeKy5pGhZsqIFnd6LJlzj5vSV/FJHjcQeyyXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=oD69Pc5g;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFAD76082BD8
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 17:13:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EFAD76082BD8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=oD69Pc5g
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id D0F281A0D96
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 17:12:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A059F5FF43;
	Thu,  5 Nov 2026 17:12:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 63A49103292A4;
	Thu,  5 Nov 2026 18:12:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793898779; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=EMExV65ZcIsZykQBDtBRoQToWRb7jCYng9HkBlA05ok=;
	b=oD69Pc5gzE17OwKPSp6eXxMTrEZYoS36gFroRX0ztRiLiJalonYJk2K+sAgZj4KgIRXRhT
	pwcO8fcyiR3Jrg81zDNqIwfy3xwAtpgAm3+foleDY9cJUa+6IsfKrkZc39fgRbFAWJE4y5
	Ao9lWRw3iw+u+Qy38AzkWL+0UJMWeCOvolCAFCitLtQLU8C7boUMHWG9pNHomMflt/fnPw
	2rnOmPGeSZgjk7tk9AXvJYTk5IZa72uEDS3d7lXETvhqH1RmBod/qGbYegbBdAWFA2bRwU
	vPOCcflEO1eDJdEEETllJlL54SfeipRK4WtiaNDs+UfBWXhii6E+UV++SlizzA==
From: Paul Cercueil <paul.cercueil@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Paul Cercueil <paul.cercueil@bootlin.com>
Subject: [PATCH 08/12] mtd: rawnand: hisi504: Remove #ifdef guards for PM related functions
Date: Thu,  5 Nov 2026 18:11:54 +0100
Message-ID: <20261105171158.399247-9-paul.cercueil@bootlin.com>
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
 drivers/mtd/nand/raw/hisi504_nand.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/hisi504_nand.c b/drivers/mtd/nand/raw/hisi504_nand.c
index d97270ec1185..511d133ea936 100644
--- a/drivers/mtd/nand/raw/hisi504_nand.c
+++ b/drivers/mtd/nand/raw/hisi504_nand.c
@@ -809,7 +809,6 @@ static void hisi_nfc_remove(struct platform_device *pdev)
 	nand_cleanup(chip);
 }
 
-#ifdef CONFIG_PM_SLEEP
 static int hisi_nfc_suspend(struct device *dev)
 {
 	struct hinfc_host *host = dev_get_drvdata(dev);
@@ -842,8 +841,8 @@ static int hisi_nfc_resume(struct device *dev)
 
 	return 0;
 }
-#endif
-static SIMPLE_DEV_PM_OPS(hisi_nfc_pm_ops, hisi_nfc_suspend, hisi_nfc_resume);
+
+static DEFINE_SIMPLE_DEV_PM_OPS(hisi_nfc_pm_ops, hisi_nfc_suspend, hisi_nfc_resume);
 
 static const struct of_device_id nfc_id_table[] = {
 	{ .compatible = "hisilicon,504-nfc" },
@@ -855,7 +854,7 @@ static struct platform_driver hisi_nfc_driver = {
 	.driver = {
 		.name  = "hisi_nand",
 		.of_match_table = nfc_id_table,
-		.pm = &hisi_nfc_pm_ops,
+		.pm = pm_sleep_ptr(&hisi_nfc_pm_ops),
 	},
 	.probe		= hisi_nfc_probe,
 	.remove		= hisi_nfc_remove,
-- 
2.47.3

