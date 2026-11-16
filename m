Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794810651;
	b=Cu6ib1Os/0yDGDIDHi7ud5KcaKZrbQUDda/uzMTKgbSHzfWBHZa/JVszw1+d4IFBe6q0
	 6T0mMs5wSsiuXfB/3/l9RVeSLbkWn/bcFLi544/VX2NfTiAmsI/xD52c5cC+QFP/u8LQ4
	 tOOa4oKVLlnAUVWLmKVKs64ZvLVMqUHDjZPkVLG92lLMKdm/8WGFLNSHznblxNRPac0Im
	 ZRLTHIs3zkxUdsXDLA60jWBJRQCLyl1kfZRlJKbHN5J9ou1labPRd7GdrogDXHFfxH2n6
	 ijVcNeHXlMZIxP23s1ctLNvsGsa9EFQuWxDN752VFyNDxo6m4VCKLmUEsR+v3Ts44LA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794810651;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=8Cb6dPwlg8+ZzGFvLTcZ7w9Luh7P7DOy/2x5a6GHxCk=;
	b=v9y1yjQnStwLIixQQuE4QVOCXGZHBt/dYK7LATfAK3ZmUtRttKRwlyaiHU2vLWoQqH2O
	 5NSF6hnT25XA/ufzQdZA3XsZ8UTN51PL/8YFhYeCiF6yWKSYuZ9T5OfaxslXsBOewhJw2
	 gQOxWDTOHPAj6Kj4TWgdeo+257EM07aDK+BQxLhbXuMXknqfeSQvNFP4TYd2Yx9I7m+d2
	 yTs8LmULVUBZappGqfYX8a7C23GaCSTKSff/fiucu04vWf01B8lfQl+CwsAn1lupwY1Ea
	 ruxLPgr/oxeZnWFx+4mTVGqHqDrSJhcuevY5mKi4tDfS97cVcAbPxb6L8wDB7hnRbTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=te3l8JpJ;
	arc=none smtp.remote-ip=209.85.161.45
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B76B7606AEDD
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 06:30:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B76B7606AEDD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=te3l8JpJ
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-6aa9606ddadso2737998eaf.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 22:30:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794810649; x=1795415449; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8Cb6dPwlg8+ZzGFvLTcZ7w9Luh7P7DOy/2x5a6GHxCk=;
        b=te3l8JpJboKYLrpFgdWkcklM30hXFmZ5yeuZCCAjnAiYaz7lpeuZ2vXS1QZTRZN0yZ
         nNKoytV8uk377+fx3qDilBvmIs0a6YhP65H6zDbOcYOZM+ahFlStwnCTnLAK7Vn4QSN2
         mldc+4aPPoigbsyKGF5/ooBEcbFLzLXwbHrhpPzbsIjDqYNm6f+YlG7cx7RUOY4sW/u+
         BFsamg01SNvabIOgs5bmpEXZWqnCmiYe1fuTCZjnhPUPZx5OAMJxG3nfa2IJ8Z6BqOFO
         OZxiAXj8NCBx/J5Cf9NAMiMG4kaHEzT6hvOHfk3V3c84Rf+u7oBw7foGw3+UIS8EpcpH
         nnKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794810649; x=1795415449;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8Cb6dPwlg8+ZzGFvLTcZ7w9Luh7P7DOy/2x5a6GHxCk=;
        b=aLCoKjU7q9PXeLSco49hgSrVrLqR4TMOkGsrVzxVjLe6lF2f/ml3xjJFpyshueQ3hV
         4vcAqXOFffxC18htd1rC7YGhlWhDAY16wS3csVN3aN9qBYvHZ/mRLZh4t4BYTSntWS3E
         xN589qrxQqIjqX+jqtHMg79oDKV2yRNWVQNoBadsWb2GcLhYiWhG+BrNZ/V9oVMV1h9N
         BDKVlcGvbUTRoXE0t4C1//LiNcIM3w1EzjPeDylKwfL/4MKdSvG+9oWIUHMwKIVbVADN
         gFRraPj7oWhW+SeN5nxoITHx6J4plpR3PPxJjSvedtSYLWCvoY2UbRpG7esW6VHJSoQS
         7ziA==
X-Forwarded-Encrypted: i=1; AL+hErGUVO9nIFWYmqhO2wFMpQP1FBeZXLCrLjKNktUsTzW0H92p/c1bM6hDnftXS2IQeMAPQw0v/HiFZwG7KvI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/AkCZwta2jPcV2Rj+wWUMIN6zrAqHMfpp1AkxRs0tv2CKMnz/a
	8aGZGtbvZtWIwt5mOUH1KL8ykCHwxAw3URrV+2N49f4h4kJnp0hlTGHW
X-Gm-Gg: AYBFou13qObBhIkAVMVQDbPLxvVo6R21DQbIvPvTQFpN3TRTcDXHCTCj1InEtvlk1h9
	+Y53d/dB5nl+wF1TT/Mr65gpY9NyMO/A4ttHCaKDVvL0MwOYpaOljlrpDee9uMM8SEsEDtkcCyI
	K8MT+D/2fKy6aj3V26bAO5uLSPyG/6iQaKuxsmGJ2zO9uwi4bZTDfyw+Kok9EKe//tlvwBbLJN5
	fQlc2TD/x4qcNU+uj/O3pTCxgRjeuwwTSDM2iU4XHFdkhMp48kvhSbSAFupXmezAn6qoBtMDOFz
	j2EyaJ4CBb3CmKPXOEENhPaQauTXacoq90xzstHzgirUFMenASl5+Ry1IxDsiOxjp00c2WNH0bu
	6eKlDwztk7WqKXsdIBsjrE8MedHIKOKWod/G/z8m3beitWHOJ560iCu5/cq44yCVUxUdUUEAEYw
	ZVqqRZFLTk/+j2pDsOWSn31O23BBKgDE1tSaSYSxiAwOJF3lizxDp0P3gaTSyFCQycMg9feOwql
	wuyaF3Ic2LAeAfS5e0UZz6byCaUV5TFGw0gJ3H2vvM0V9Qd+uaNgcDXwsx30k/9vFq1iFOsAoEl
	bmcXa91+JO7KxElcaXMs4UUNVJBub4AV89MnzO65UeG1F2c6p9ksLRTq/sekiAd7QcDLa9tiDuQ
	tM3pIlXJoSSeMwKGZbN/BaTzAtPoigFSbCA2gVLLc8DLUExCyaCa5Y1kBkmg/LJtGME0iBEx1eW
	pexLN2t0DhsOangRqjPJ17lRXePv1yH8Est0Nkz+d3CIks8xsRzGU=
X-Received: by 2002:a05:6820:f006:b0:70a:4053:52d0 with SMTP id 006d021491bc7-71ab4cdde61mr6740625eaf.12.1794810649580;
        Sun, 15 Nov 2026 22:30:49 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab42c41e9sm7994558eaf.6.2026.11.15.22.30.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:30:48 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 23:30:08 -0700
Subject: [PATCH v5 53/58] mtd: rawnand: fsl_elbc: retain chip state across
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
Message-Id: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-53-cbc49c5c5e74@gmail.com>
References: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
In-Reply-To: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.17-dev

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

