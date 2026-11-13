Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794594386;
	b=3RgDv4kbZ8VPBXY+6dgFAbm61h6jawlZm9n2Zx+bO8pOGMlxPA3rwLaaMthuqm+bkC0+
	 LcUJO8qydth/R0LxRMCF2Iv2/QmWTnIUJOE0QnsWutWGN8vCN9OY0vvYF/7HBO+azMAEP
	 0WQa/Zor71U8oK+R6BY+BQ9lycKWQYI3yQidfgzIcViepG+NgTDFhqcGVlTbKXgDrlo/o
	 ef1K0XWaEvpPTCV5DQQaVQPaeizHxec4QWCOXWxNv/w1qvcm6VDyBKEc91oa1qtCPMp74
	 E/yhr8a+7+qlpeLHtsC92Uty7VYbGvZ/moFuYHx//B02ivhvBEyJRhe81uTmKPsa9ug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794594386;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-ID:References:In-Reply-To:To:Cc:X-Mailer;
	bh=8Cb6dPwlg8+ZzGFvLTcZ7w9Luh7P7DOy/2x5a6GHxCk=;
	b=Y4yN6n81RsR0ootfTJK3e4WRuHnc/TcpalKgEpXRo2uOz+O69w8enojkrqlSpcmT0doL
	 CdWYdiCOY3+J6Qc1kwd++gk4Wbpa+yMIqZYq81g8wbVMTgtCuOLweEUxGWo0kyDSmVQwy
	 tiRD+XpcsfaHh2OQ0wPIC7s/lqSzUg/furRCFELasy6YHUyz67/8J8j0+K6TLL1VbwpAI
	 D+RAifLL1XyWkn3FKW5pnvzT3prgC3LhSvOIQKiEl7JX65mKlh69F9CZ98rFNtUskFkiK
	 35/errlZCEJ1Q8Jm8L1/Rg9k+9wTUPJvaYPjQfR51L6iGAtUbLMYnHL5p7n4c7PDVlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yqise65u;
	arc=none smtp.remote-ip=209.85.160.41
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 079CF606FE9F
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:26:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 079CF606FE9F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yqise65u
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-4a71d0c4233so1204206fac.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 10:26:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794594385; x=1795199185; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8Cb6dPwlg8+ZzGFvLTcZ7w9Luh7P7DOy/2x5a6GHxCk=;
        b=yqise65u3Iw3mSrkHlW1KDG2dVzXdKEvSElEQbJxVkdVQtHQlsqxsTYoZrLXVUhjom
         SrmvTASrdBREVCRcB97PmqEODfx4A/PIkpqPsbNtOCo1b07jBBHaZDEIOfQqPYL0HFpm
         Djsi9ppPATqrdGvA1dV4/4k8TYLTQ87qt5/y4NM68kRbBqA5S7zhP2KO+5j4RbZGLDEh
         g9STSFlXt0mExsPlO6yxEEEcKJoK38fx9HRJAelnf8FHkKaoDqlB734KFS4vMq7yMpDL
         MnxYXDDHmlHsJlGTBrkbca+iHfDu7XcCS4qg4QTSm3ifKpRF37RJjfYC/wIzOZSSxeVt
         QqRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794594385; x=1795199185;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8Cb6dPwlg8+ZzGFvLTcZ7w9Luh7P7DOy/2x5a6GHxCk=;
        b=OtzeEJJ6ekju/wJcL24K4j+n7basd7pG3r3kFhJE/Y7QfmSdNWRkzzPZwd9Jbw1rc9
         YljKo9TTzAEtHucjOUUd/GmqsGe29i1YjSwGuJtpOHs8jLa56rMjoMiQIHA/h8ZU1EIf
         m3kNYfhr4iaQeU1GG2oJaaO+0wVHIEMl3OWxEIxf4XaX/7FB7PXTtNNlEMqCuZ5NpLx/
         LDAJCDQXmXkW7dL72LPiAozGN+K9G9ybh6kiPHyDsu2sWs3fD2kIn07MfN4RYrJTKhiU
         7gC/xeSUAS20qiSmfQrudEisrWSImSHVuW4yXH2Ze22B5BF6REQJ59sisffY9GjGY0X7
         LZXA==
X-Forwarded-Encrypted: i=1; AL+hErEOPrggALrtbbyisf7J0Z2vZagT11S0BLbS5dpyrKmz+4tyWdq9MG0/Umz4wX5CraUR3GiGYew8HjZQHoM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+JTPKYSMASXpjLL0VbxsuETXz4XqVElmwp/4TdAVqxOs6foyiL
	yZRXoiiG/e8u3BgG5M907L0cXusA2HvRNOoUX7E1FOsK4731CGNjIudI
X-Gm-Gg: AYBFou3UN3l2q8wpmAHfZKn101zkck/thbZa0CO0Q1u/aaXrtL9G9MwTB8S8tOpeADj
	NPh0SROck1KJN/6nDuZdieXD5C2uhOax5EmbAgsemNwORb/0sRvBCMRWpSkBsoaXt/bEtYZW8ZC
	hDgP4F6yLJxk+n/uUOiOH27Y3chKey1UyMQjfEyJ6UFYIn0X0JOWfMrJnJHr04SV5ZblbzhImqk
	eL4+DPhUnHpAfJjhyyO32DYgjiLVN1r+j8pkPsvcXzbGwdAGU3N9ffGZ0UIlWBTSwFiN0VM2uIK
	Z7YMxggPX+9xW5C+BRJtg3AkCR52Hrqq0N2lj3VZBUnSmfMl0UaJoaIIhZAHBsdRWYz2JWjr6vZ
	05s1DlUvIUfICVrut6edgkVdMt3NSKIvvZltfwH1BLaZLkUsxQ9CBgfM3ml1wqnW6s7OHaQTT0I
	eYIbAbx23Y5rvDbwakVvEmqDDIYj//kdTV+WyA+OZnCdpRHQAiojgx2ZlUiW6EDsIsac5yeju2Y
	+en1DDO8wMb33YJMN3ObjbuZAxIBL909oB1kKQQXAWRJ5teh/Q0oPCCu/ZiA7nIQVc9axqH8+94
	1if0mbLI4F4c9Jtrb/34FZemY44n8gYRLLPbeoAsb5R+4iU5hDdTCxOBYjRHbV7QAs3pI965+JQ
	V+YXf9m+P2yzrpk7hicpD9PY59Sq4Htz/8lD1pSX4iN5DBo9drUFiqU1jqTatFxFOcsEKx8QfDT
	mn3zuGjWC0BVktaP/8FsaSDsqBvU6qXfIlE1tEfVq9p9i0QttVsA0=
X-Received: by 2002:a05:6870:c2a8:b0:4ad:8d9f:98a3 with SMTP id 586e51a60fabf-4afdf4ee823mr2826842fac.35.1794594384902;
        Fri, 13 Nov 2026 10:26:24 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4afe2011c25sm1887061fac.2.2026.11.13.10.26.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:26:22 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 13 Nov 2026 11:15:09 -0700
Subject: [PATCH v4 53/58] mtd: rawnand: fsl_elbc: retain chip state across
 removal
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-53-556b1d7c6221@gmail.com>
References: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
In-Reply-To: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

Keep a reference to the shared FCM controller for each scanned chip,
including chips retained after unbind. Count active banks separately so
a new binding cannot reuse controller state still owned by old MTD
handles.

Unregister and drain the chip before unmapping its chip-select window.
Run NAND cleanup before releasing the hardware. The NAND core releases
chip storage and the shared controller reference after the final MTD put.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/fsl_elbc_nand.c | 54 +++++++++++++++++++++---------------
 1 file changed, 31 insertions(+), 23 deletions(-)

diff --git a/drivers/mtd/nand/raw/fsl_elbc_nand.c b/drivers/mtd/nand/raw/fsl_elbc_nand.c
index 6216ffea4324..f1034b70f717 100644
--- a/drivers/mtd/nand/raw/fsl_elbc_nand.c
+++ b/drivers/mtd/nand/raw/fsl_elbc_nand.c
@@ -837,23 +837,22 @@ static const struct nand_controller_ops fsl_elbc_controller_ops = {
 	.attach_chip = fsl_elbc_attach_chip,
 };
 
-static int fsl_elbc_chip_remove(struct fsl_elbc_mtd *priv)
+static DEFINE_MUTEX(fsl_elbc_nand_mutex);
+
+static void fsl_elbc_chip_remove(struct fsl_elbc_mtd *priv)
 {
 	struct fsl_elbc_fcm_ctrl *elbc_fcm_ctrl = priv->ctrl->nand;
-	struct mtd_info *mtd = nand_to_mtd(&priv->chip);
-
-	kfree(mtd->name);
 
 	if (priv->vbase)
 		iounmap(priv->vbase);
 
+	guard(mutex)(&fsl_elbc_nand_mutex);
 	elbc_fcm_ctrl->chips[priv->bank] = NULL;
-	kfree(priv);
-	return 0;
+	if (!--elbc_fcm_ctrl->counter)
+		priv->ctrl->nand = NULL;
+	nand_storage_put(&elbc_fcm_ctrl->controller.storage);
 }
 
-static DEFINE_MUTEX(fsl_elbc_nand_mutex);
-
 static int fsl_elbc_nand_probe(struct platform_device *pdev)
 {
 	struct fsl_lbc_regs __iomem *lbc;
@@ -867,6 +866,7 @@ static int fsl_elbc_nand_probe(struct platform_device *pdev)
 	struct device *dev;
 	struct device_node *node = pdev->dev.of_node;
 	struct mtd_info *mtd;
+	const char *name;
 
 	if (!fsl_lbc_ctrl_dev || !fsl_lbc_ctrl_dev->regs)
 		return dev_err_probe(&pdev->dev, -EPROBE_DEFER, "lbc_ctrl_dev missing\n");
@@ -904,21 +904,25 @@ static int fsl_elbc_nand_probe(struct platform_device *pdev)
 		elbc_fcm_ctrl = kzalloc_obj(*elbc_fcm_ctrl);
 		if (!elbc_fcm_ctrl) {
 			mutex_unlock(&fsl_elbc_nand_mutex);
-			ret = -ENOMEM;
-			goto err;
+			kfree(priv);
+			return -ENOMEM;
 		}
-		elbc_fcm_ctrl->counter++;
+		nand_storage_init(&elbc_fcm_ctrl->controller.storage, elbc_fcm_ctrl);
 
 		nand_controller_init(&elbc_fcm_ctrl->controller);
 		fsl_lbc_ctrl_dev->nand = elbc_fcm_ctrl;
 	} else {
 		elbc_fcm_ctrl = fsl_lbc_ctrl_dev->nand;
+		nand_storage_get(&elbc_fcm_ctrl->controller.storage);
 	}
+	elbc_fcm_ctrl->counter++;
 	mutex_unlock(&fsl_elbc_nand_mutex);
 
 	elbc_fcm_ctrl->chips[bank] = priv;
 	priv->bank = bank;
 	priv->ctrl = fsl_lbc_ctrl_dev;
+	priv->chip.controller = &elbc_fcm_ctrl->controller;
+	nand_set_controller_data(&priv->chip, priv);
 	priv->dev = &pdev->dev;
 	dev_set_drvdata(priv->dev, priv);
 
@@ -945,11 +949,21 @@ static int fsl_elbc_nand_probe(struct platform_device *pdev)
 	if (ret)
 		goto err;
 
+	name = mtd->name;
+	ret = nand_set_lifetime(&priv->chip, priv);
+	if (ret)
+		goto cleanup_nand;
+	kfree(name);
+
 	/* First look for RedBoot table or partitions on the command
 	 * line, these take precedence over device tree information */
 	ret = mtd_device_parse_register(mtd, part_probe_types, NULL, NULL, 0);
-	if (ret)
-		goto cleanup_nand;
+	if (ret) {
+		nand_disconnect(&priv->chip);
+		fsl_elbc_chip_remove(priv);
+		mtd_put_master(mtd);
+		return ret;
+	}
 
 	pr_info("eLBC NAND device at 0x%llx, bank %d\n",
 		(unsigned long long)res.start, priv->bank);
@@ -959,32 +973,26 @@ static int fsl_elbc_nand_probe(struct platform_device *pdev)
 cleanup_nand:
 	nand_cleanup(&priv->chip);
 err:
+	kfree(nand_to_mtd(&priv->chip)->name);
 	fsl_elbc_chip_remove(priv);
+	kfree(priv);
 
 	return ret;
 }
 
 static void fsl_elbc_nand_remove(struct platform_device *pdev)
 {
-	struct fsl_elbc_fcm_ctrl *elbc_fcm_ctrl = fsl_lbc_ctrl_dev->nand;
 	struct fsl_elbc_mtd *priv = dev_get_drvdata(&pdev->dev);
 	struct nand_chip *chip = &priv->chip;
 	int ret;
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
 
 	fsl_elbc_chip_remove(priv);
 
-	mutex_lock(&fsl_elbc_nand_mutex);
-	elbc_fcm_ctrl->counter--;
-	if (!elbc_fcm_ctrl->counter) {
-		fsl_lbc_ctrl_dev->nand = NULL;
-		kfree(elbc_fcm_ctrl);
-	}
-	mutex_unlock(&fsl_elbc_nand_mutex);
-
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 static const struct of_device_id fsl_elbc_nand_match[] = {

-- 
2.53.0

