Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794296721;
	b=F9TRC8FDnDGlv65dr8z5IRpQq0x4wX3plz0dZGfCD0Ur75NRgG9n/bqS77T0saUnhnYg
	 YdAvl3fwJqjXyT1mdqktRjMGJUzWcsNJ0pQ999OvZ150GqVPTvFnzsGD/4TsHTU3kf9js
	 bF3teGk5beciRAVPLLq3VQ4pBMn4dQR+RD/gLC1xPBdnMQXXd1vgvTnJubSV4XTQWTfIQ
	 ohf3IdTEXxObi42TbjZm/Gmf6I7bGFaIF/twj0E2UqrBTqFfMq0+dhbZZR56k8AcXGRZM
	 bUyKMdXko6sQ5a1QJ4X11eg0uZH9m+Vy8yAE7r9clv8pAFu/WPACWrRzF4WNBButlZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794296721;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=zd1KEiVioYI8oN7Z1XXsuI+JrCDYdIglHkXO7xk8gJ0=;
	b=gX6AKR1WpPO8/BKoY9bIVvqUdPqc+trcHtTb53gswwUn3iRSAWNhZ48qVJ+XYC+1i+4D
	 g8fwO6b23PSNlGp3qQd/IXa/JxfzYOp2Rs5lwc3HmF/5kfvZrOu/wTs8P3ITr9vWJKXAM
	 WvgRKjqIqCaCApBI/lrCj5VLmaofX6dSpQtQ83deePIotkyAR9qm+2MEPx3zj5ravPMWP
	 Q5gMOcoTbamN8Ew8sOckFESm3AjWFy9c0x0a9pdXwE7TUkTpSUdgbuqM18PRInUD7itVr
	 by94j0TnSPNuwkKrLPgz4Stmy7qyEjfzRqYTEk62miV/y5FHG1cgOfjGIe16j0MuJSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="KX5RYU/B";
	arc=none smtp.remote-ip=209.85.160.43
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DD1F6075540
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 07:45:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3DD1F6075540
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KX5RYU/B
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-4adba7b3399so697887fac.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 23:45:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794296720; x=1794901520; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zd1KEiVioYI8oN7Z1XXsuI+JrCDYdIglHkXO7xk8gJ0=;
        b=KX5RYU/BNbNLCR+06wIS60ftD5/lboTMoSly0C6vZRIu1gWVp5o8ooCINQSvil3ycq
         cWYQl24HpavR3wrurhu+DZNi8vmO8pbBx3oxtprAQ7UVtMV48ASNYNjdraOQnYRwFP0g
         qprfwSLB8C8L/dB+aLeaKSW/8oKHjPDSnOMRJuDQ/Gd1aWCIrfdia7HmhlIxJsZWkU1K
         WG0D6If0PtiJ2IDKUekkZmYzjAJtMawC6I/j8n06BvfHXvPCuYSpkogjOx8ZA2Bewlez
         n8t2RcpacI2Dohd+YnKgj8R/hd4nhbkGtBLBnGDBoJFmsxOK+BXFB7qwTnoXZPhyHyVT
         3UWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794296720; x=1794901520;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zd1KEiVioYI8oN7Z1XXsuI+JrCDYdIglHkXO7xk8gJ0=;
        b=XXt6NZSQM1Q1YMhU0B6rwnE+ZNQ3QkSVOrqMOxW/Tys53Ee3AAZpvIqQidTF1fPKq4
         NXfaNp+EvFJr+HOQeZ/RYN6aVClTKi3tTGt3ys0Ar7u1cZdP+MlxnSRCzvIaVJrFldyE
         lZr3M3rweaMGZjUNv407TvZvlTziq0E2rEZ8dH5iTHquVsBU2d4nfdSRcnImI0K27i75
         rTitxwJgAP6/BEEHHtuVqCMOFDnXJ0xPmkphcoMotBHnZICWpLiBSl+qtixLbzOIc01K
         6uyMyqw/d2KoVskc15PA//TZc4tykEZxiF4cWPXzF5w2dOzoJdm2h4PTnk8NkLPGxURe
         NCTQ==
X-Forwarded-Encrypted: i=1; AL+hErEsW79nz+RD+9Md9KTCiw2p5T7wg/sh71nnbG+h17pvMbo1oG7QzuO/jmM0SX1cCdaLtSg7jv5u9fC0jx8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/6iZ3XRcVMFLYd0JgSm11oAa3UU6BJLpky0xmstHK//S6kp/kI
	ek9pEGD533xIvc68u/69wiCmerzfrX+ubpQfVqirp5tj0/z8NZSkzbNHYD88OV7j
X-Gm-Gg: AYBFou0fv0eGOFLMsKpAvvkeX+nQab6B/Lq4uVCWwd0oyg3HBoipxgWS6C1YQutjZu/
	xXEWcXHKUvMIkxJQACnEF85ueuUzLfw/pwilgGEeDu91Ayck51TnPU9ecNj9OSY48d/DsqbsJI0
	ojEPv50v2wRbMpcAOMHn0bJ8p3iCWgrNg+nAtcEiFzx5EReF02oa+UlN29eMQNOjlUHPpgUtkW/
	RYOyWk/Wv03B7s7pDTfrR53mVHAaeOCSF1g1QPp0XqFRI1wgCd8vJL2IWMRuNd9TQqzbA1H8lAg
	6CmxVBhQ062Kg5NpP2mWu6BybJTKmaX/z7taTo61adu42VZrc2pknjMe7EFadaHfDoZ/fBGGLJp
	BFWxXM3Nkc+cu14hY5iEhhJ3d+VWwaQWPE7l0YZcWGCZHYO3gaGSkHGcBAsCzPYFClwLEqUIZfM
	y1fEUgsZqshjcdpUFRVgh0U/EVRTBd2aYKC6D34S/egTJBqLE4m4RY+hX/SJmA5WuLM82xRR/yn
	gEXQACoMR5EDbOqtI7X5KGy53t0deZadtSPlU5WfVA7mT/lnwp4O1CsH1gifQ3Wdq+4L0Usyozw
	hjvweRxEdS+iW4kdT50cSQhTgj9Eu9OTwDY2VK5nBls4LKILho498S6Zn5SowEEkFoVnk4hoccc
	Je0yUs7aXEmdeEaLuSAYC59EVbw+zQEJYsvr0XLFOFqYUsHXUD+fPNotTsaHDyCZz9dZYFyhWtQ
	NLfdBfNnxxf8iwoOoWyPfK9HJoNXt64jU7VfcnxFT80TMKrFFYt3/bsR65wwjeVqJrsSSLy3QS
X-Received: by 2002:a05:6808:4441:b0:4f4:73a9:f838 with SMTP id 5614622812f47-5683c9bbba4mr1482552b6e.22.1794296720144;
        Mon, 09 Nov 2026 23:45:20 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5690504fdb5sm1522804b6e.3.2026.11.09.23.45.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 23:45:19 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 10 Nov 2026 00:44:56 -0700
Subject: [PATCH v2 53/58] mtd: rawnand: fsl_elbc: retain chip state across
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
Message-Id: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-53-9137d08f05df@gmail.com>
References: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
In-Reply-To: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

Keep a reference to the shared FCM controller for each scanned chip,
including chips retained after unbind. Count active banks separately so
a new binding cannot reuse controller state still owned by old MTD
handles.

Unregister and drain the chip before unmapping its chip-select window.
Release NAND metadata, chip storage and the shared controller reference
only after the final MTD put.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/fsl_elbc_nand.c | 68 ++++++++++++++++++++++++------------
 1 file changed, 45 insertions(+), 23 deletions(-)

diff --git a/drivers/mtd/nand/raw/fsl_elbc_nand.c b/drivers/mtd/nand/raw/fsl_elbc_nand.c
index c655d27bc4cc..c27e89050270 100644
--- a/drivers/mtd/nand/raw/fsl_elbc_nand.c
+++ b/drivers/mtd/nand/raw/fsl_elbc_nand.c
@@ -48,6 +48,7 @@ struct fsl_elbc_mtd {
 
 struct fsl_elbc_fcm_ctrl {
 	struct nand_controller controller;
+	struct kref refcnt;
 	struct fsl_elbc_mtd *chips[MAX_BANKS];
 
 	u8 __iomem *addr;        /* Address of assigned FCM buffer        */
@@ -837,23 +838,35 @@ static const struct nand_controller_ops fsl_elbc_controller_ops = {
 	.attach_chip = fsl_elbc_attach_chip,
 };
 
-static int fsl_elbc_chip_remove(struct fsl_elbc_mtd *priv)
+static void fsl_elbc_controller_release(struct kref *ref)
 {
-	struct fsl_elbc_fcm_ctrl *elbc_fcm_ctrl = priv->ctrl->nand;
-	struct mtd_info *mtd = nand_to_mtd(&priv->chip);
+	kfree(container_of(ref, struct fsl_elbc_fcm_ctrl, refcnt));
+}
+
+static void fsl_elbc_chip_release(struct nand_chip *chip)
+{
+	struct fsl_elbc_fcm_ctrl *ctrl;
 
-	kfree(mtd->name);
+	ctrl = container_of(chip->controller, struct fsl_elbc_fcm_ctrl, controller);
+	kfree(nand_get_controller_data(chip));
+	kref_put(&ctrl->refcnt, fsl_elbc_controller_release);
+}
+
+static DEFINE_MUTEX(fsl_elbc_nand_mutex);
+
+static void fsl_elbc_chip_remove(struct fsl_elbc_mtd *priv)
+{
+	struct fsl_elbc_fcm_ctrl *elbc_fcm_ctrl = priv->ctrl->nand;
 
 	if (priv->vbase)
 		iounmap(priv->vbase);
 
+	guard(mutex)(&fsl_elbc_nand_mutex);
 	elbc_fcm_ctrl->chips[priv->bank] = NULL;
-	kfree(priv);
-	return 0;
+	if (!--elbc_fcm_ctrl->counter)
+		priv->ctrl->nand = NULL;
 }
 
-static DEFINE_MUTEX(fsl_elbc_nand_mutex);
-
 static int fsl_elbc_nand_probe(struct platform_device *pdev)
 {
 	struct fsl_lbc_regs __iomem *lbc;
@@ -867,6 +880,7 @@ static int fsl_elbc_nand_probe(struct platform_device *pdev)
 	struct device *dev;
 	struct device_node *node = pdev->dev.of_node;
 	struct mtd_info *mtd;
+	const char *name;
 
 	if (!fsl_lbc_ctrl_dev || !fsl_lbc_ctrl_dev->regs)
 		return dev_err_probe(&pdev->dev, -EPROBE_DEFER, "lbc_ctrl_dev missing\n");
@@ -904,21 +918,25 @@ static int fsl_elbc_nand_probe(struct platform_device *pdev)
 		elbc_fcm_ctrl = kzalloc_obj(*elbc_fcm_ctrl);
 		if (!elbc_fcm_ctrl) {
 			mutex_unlock(&fsl_elbc_nand_mutex);
-			ret = -ENOMEM;
-			goto err;
+			kfree(priv);
+			return -ENOMEM;
 		}
-		elbc_fcm_ctrl->counter++;
+		kref_init(&elbc_fcm_ctrl->refcnt);
 
 		nand_controller_init(&elbc_fcm_ctrl->controller);
 		fsl_lbc_ctrl_dev->nand = elbc_fcm_ctrl;
 	} else {
 		elbc_fcm_ctrl = fsl_lbc_ctrl_dev->nand;
+		kref_get(&elbc_fcm_ctrl->refcnt);
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
 
@@ -945,11 +963,21 @@ static int fsl_elbc_nand_probe(struct platform_device *pdev)
 	if (ret)
 		goto err;
 
+	name = mtd->name;
+	ret = nand_set_release(&priv->chip, fsl_elbc_chip_release);
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
@@ -959,32 +987,26 @@ static int fsl_elbc_nand_probe(struct platform_device *pdev)
 cleanup_nand:
 	nand_cleanup(&priv->chip);
 err:
+	kfree(nand_to_mtd(&priv->chip)->name);
 	fsl_elbc_chip_remove(priv);
+	fsl_elbc_chip_release(&priv->chip);
 
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

