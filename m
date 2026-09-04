Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9BAB4CA78C
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 17:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788542360; cv=none; b=N2oc9XLQXr+O0keDdu/J7xZAG8RH8Me/gQyow2HP/q7zzh0+hjBkotKtiIPdpL0No9FJN1RQK7O0CQcH3gg4esfmAGPPuINOQmX6lXroFnbevZKyijc34YQyQtIBda8nV0XPTYh8KmcZXrZd8lF1WJmwceVa3H13XB+5EtQvUVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788542360; c=relaxed/simple;
	bh=ocmP2VBEbHYs3L9ItkLY3t5Z18WB/tiEB9K3ipsPNm8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fYSI05HixaOGvnhjxebZ7uwn+w/904FFrKUHB8Sp7260Yr5i3TXuOPdWM8BuGv9K4Ut9a5KD4859jsLYkYbBBxwqUtWFwPVuHPUmg6vNALww870i9jGC3MT+4DpEB6Sm1qXuPK0tQu73DZ0zCZhalQSfXtgPT4aIs/op41/GSqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=TyS/AJgC; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="TyS/AJgC"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id DE4224E41514;
	Fri,  4 Sep 2026 17:19:16 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B313C6057F;
	Fri,  4 Sep 2026 17:19:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DD99211C78158;
	Fri,  4 Sep 2026 19:19:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788542351; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=pxzw5jV2DX8wn6S1wpOhBSXoMQmbhVGev9o9A9dgFvE=;
	b=TyS/AJgC8WXX1L6J+0nbHn09yeX7DOiLNLdV88NtmU7M5lP5Ms8WRMKt84wsxy4LRLyS2G
	VbZwf5qiA8mBUlXN5pEMYZ/RfNZVWGHW5ZE6TqYRGB5xFBiw/eWXhmnnbyd3vjILcY/zK4
	og7yKKY2mLETBshbvvXzNHTR2YrGIItLHU4dZpJcEfj23r0avP17/zxLx/ozwT+z0TOlu+
	jjw/AzYcJHiNxqys4pB/15f1BtiiFpsKCZYPHFNqHeb+s20s58APXbo7Ax0m+gcdWcTsR9
	JBd10bz1dDObxu+iM351Lf4mRiQSYthA/9ZYoa28avUHNAI3s5yz/5D1V+TGiQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 04 Sep 2026 19:18:55 +0200
Subject: [PATCH v6 02/26] mtd: spi-nor: Garbage collection during sfdp
 parsing
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-winbond-v7-1-spi-nor-jv-cleanup-v6-2-bdb282f42a47@bootlin.com>
References: <20260904-winbond-v7-1-spi-nor-jv-cleanup-v6-0-bdb282f42a47@bootlin.com>
In-Reply-To: <20260904-winbond-v7-1-spi-nor-jv-cleanup-v6-0-bdb282f42a47@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

SFDP parsing works as follows:
1- The header is read then parsed
2- If correct, the sfdp structure and the sfdp content table are
   allocated then filled
3- The mandatory BFPT table is parsed
4- The optional tables are then parsed as well

Any failure in steps 1-3 leads to an error and an early return. The
failure is not always fatal though, since the deprecated will fallback
to the non SFDP definition (in the ID table, for legacy chips). In this
case, the devm_ memory allocations for the SFDP table structure and
table will remain in memory for the lifetime of the device but will
never ever be accessed anymore (since they are incorrect). In this case,
we shall free the memory manually since the device is not going out of
scope anytime soon.

The assignation of nor->sfdp is also cleared in case of failure, to
avoid carrying a dangling pointer upon partial failure. This is
particularly important since the presence of valid SFDP support is
checked using the following condition: `if (!nor->sfdp)`.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---

This change is particularly useful for the next patches which generalize
the fact that SFDP parsing will be attempted on legacy chips not
manually advertizing dual/quad/octal capabilities. I don't think it is
relevant to backport it.
---
 drivers/mtd/spi-nor/sfdp.c | 28 +++++++++++++++++++---------
 1 file changed, 19 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
index cc403ae97a83..24e4d07b18c9 100644
--- a/drivers/mtd/spi-nor/sfdp.c
+++ b/drivers/mtd/spi-nor/sfdp.c
@@ -1539,7 +1539,7 @@ int spi_nor_parse_sfdp(struct spi_nor *nor)
 					psize, param_headers);
 		if (err < 0) {
 			dev_dbg(dev, "failed to read SFDP parameter headers\n");
-			goto exit;
+			goto free_param_headers;
 		}
 	}
 
@@ -1567,7 +1567,7 @@ int spi_nor_parse_sfdp(struct spi_nor *nor)
 	sfdp = devm_kzalloc(dev, sizeof(*sfdp), GFP_KERNEL);
 	if (!sfdp) {
 		err = -ENOMEM;
-		goto exit;
+		goto free_param_headers;
 	}
 
 	/*
@@ -1581,16 +1581,13 @@ int spi_nor_parse_sfdp(struct spi_nor *nor)
 				    sizeof(*sfdp->dwords), GFP_KERNEL);
 	if (!sfdp->dwords) {
 		err = -ENOMEM;
-		devm_kfree(dev, sfdp);
-		goto exit;
+		goto free_sfdp;
 	}
 
 	err = spi_nor_read_sfdp(nor, 0, sfdp_size, sfdp->dwords);
 	if (err < 0) {
 		dev_dbg(dev, "failed to read SFDP data\n");
-		devm_kfree(dev, sfdp->dwords);
-		devm_kfree(dev, sfdp);
-		goto exit;
+		goto free_dwords;
 	}
 
 	nor->sfdp = sfdp;
@@ -1612,7 +1609,7 @@ int spi_nor_parse_sfdp(struct spi_nor *nor)
 
 	err = spi_nor_parse_bfpt(nor, bfpt_header);
 	if (err)
-		goto exit;
+		goto clear_sfdp_ptr;
 
 	/* Parse optional parameter tables. */
 	for (i = 0; i < header.nph; i++) {
@@ -1659,7 +1656,20 @@ int spi_nor_parse_sfdp(struct spi_nor *nor)
 	}
 
 	err = spi_nor_post_sfdp_fixups(nor);
-exit:
+	if (err)
+		goto clear_sfdp_ptr;
+
+	kfree(param_headers);
+
+	return 0;
+
+clear_sfdp_ptr:
+	nor->sfdp = NULL;
+free_dwords:
+	devm_kfree(dev, sfdp->dwords);
+free_sfdp:
+	devm_kfree(dev, sfdp);
+free_param_headers:
 	kfree(param_headers);
 	if (err)
 		memcpy(nor->params, &params, sizeof(*nor->params));

-- 
2.54.0

