Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794593737;
	b=BSt1QTUp3TbrOVt0ADs0u8fMfrFqlYgC6zDg6iaOxXYoRVM7Q3hX9PInR5+EJr3ABcs8
	 1TlUlHXM7jPsO+fUCZlLLmAUgbnbuBv8WoMG64Zi9zKLK73UyNUN4wOCjl2LFbM0Fpj+y
	 +1c2//vnvBdLlne/Y1dJc1/MBQK/epuWmIzXx2eQsn7hjK8e5oeW8Efu4i2ANEZsZqCAq
	 ccvkFTuVc+1Jtmv4mfXwrXY82UJEVr8/8uMQaqWKu0Gvx1lpkC7D8xpfbJw720PD+hDzD
	 qaDvqM50er2P2xZHv8Pis+An7cCyOxenwRJELn/XyrSfu8O6Jt2PxpksVKlmTTjUTCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794593737;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=FraXL6TvEduJvf5AaveEnMU+FvEiUNO/y+vqECKLnSg=;
	b=ZhNOaq43YEkzkl4/+5krejmepVBt6TAFDMkf57UxSV0CuQH1S4TOKGgLhPZjYJAnrLgd
	 Ntmb8l+gN/HNAThS1ULYteffurB8Z5+O1VpVT3xqL9Cds8v4OywJ8qDH+6BaFt70EsEhP
	 K8QrGStZZNiGQZ2whDndUE2EWcYe+I/04pfqYss/Zb/d+hf11X3dDgLOi06IWFGj+Kv09
	 XctNdQ62cHwNYAR2ckQ0aWvIrRDe589hRWa9dh2LDB0e7Sc7d0tLgTD9a6W/HMinjXf7d
	 yo62WeMigaEMGoWw0UPAMzSHqKhAiIMuD8I65w0CWG/6HbL3EsJPMfTopfLyXBy7GTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=X6Cptu0N;
	arc=none smtp.remote-ip=209.85.161.41
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9036B60A6F65
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:15:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9036B60A6F65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=X6Cptu0N
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-6de2f213b7aso493664eaf.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 10:15:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794593736; x=1795198536; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FraXL6TvEduJvf5AaveEnMU+FvEiUNO/y+vqECKLnSg=;
        b=X6Cptu0N1LwCrIq2BHT1xC7JjbKE7mWqeHjJPQCE7GqEphBb2vcCHTVk3Ye6kpyYmw
         wimbPJ2d8j51pcwF9wB6xgJ/Cd78nbu2HtdTURAdBsxIAFtYt7QCMefpSQa4b6BLv2ci
         AjXsaZgDC6UqvOPpfsCB7xNTnVKIvObGslqkpKPyVMHZ5Rt8EXzAG4CG7m4qX4idViSf
         +A36gzzuGxZDj37j3z0TtBQnbQkpeKlTPxIGGD2YrTSDY2MXOLCu1Z+aL6yeiMmBMe2U
         o0xQEswYDSjOIfJzzbKcjStDD8vm5VAfjgYdsW+/k60cYCa1Xc0RAu0v1qlTnbMGLGyL
         Aw5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794593736; x=1795198536;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FraXL6TvEduJvf5AaveEnMU+FvEiUNO/y+vqECKLnSg=;
        b=QJDklLSgUYIWnvfW2uX4WHjYWtb1niL/WXdXiTIWU/zcjByHD527HVfk0xgR6C75mE
         WO/C7JYL0NyVYcwgV7C8xYXXx3wsEc3RyUZylxXnvfHkk4oyL+h8FDmM6bpinSs3zF1U
         0K+VUY/7/8SveA0lheMf8xNs1SHpue52+CcaECYrqsNCTjbA35DBh5mqsVPSQawWUDHy
         CrCzLfs/owTXJyFhhDEs5o7Jx+dxKFUIgDHcqtLO58E7sD6qQkS9brEQlBqAbWZXTmSk
         2x+V75YcllxUlGawpLtEi0g6Gdp4lvL/Iua5bLkOHHVc1Ma2hY9mklrViUjptJqLPvi5
         b3ww==
X-Forwarded-Encrypted: i=1; AL+hErFgeW3ml9jUEajOizcj7q7gOMdiYuP954dDL1mhTlbbzPyVtdiG3m15UFNNqLu9fX9agI4HklssH09UZos=@vger.kernel.org
X-Gm-Message-State: APuU4Z8XP/hYQKBc5/Dg2jpK1cpsyZzLjLMu1/nfpBYuoIjeSqFAFOt8
	5a+aI7H+8jtsk9Ruz6KBUzLsK4D7fqBJyacDTftfjnaMtIToHCaEbm68EKSBAfuW
X-Gm-Gg: AYBFou2B5r1cG68KtxRjDsmlIY2/Dt8/8B86JzO8B13UbzrMjbHQCFYQpnvCC6I1C6c
	+i3B/wq1RY3aTuip7QEtpFq6NAL3GDUfn7e2TTFlD8WU3qrPz7Uv2CiHO/nlbskRV4riH+16oUX
	tmLVnGLbKwYNj6ePVJJpwoTb2PwsbQHleZUU/2twzJPvcsVWf2A4LGPyYoALceBRc8JDdLTxAcz
	mPDf2geFOkxacagEP4cT/voMeu5dX+emPr1MxIkmQEa6QFbyEGgfvssTf1I/ExDBeUKEF/VuFrZ
	9HstfkRDNKWOXMQXgEgOBekyMzCx+gGdChK1nax4Rgk/IBhR31bAS1tyeuPx7b6rmXJBt4BGrKL
	qO5PcadwOW5K/f2izQF1OKXw93r8pxiLepbqCavnL3dtwYwntqtLIsrgIh+GciMnvAc+ts9OoT2
	VL1SkxrecsqlAQAqNay7FTOHb5dKQffJOBSFy1goLiUKQGo4BUEJXUyrGpniF72wXnXdKxAtCqd
	klkW6WTMN7SI88DBTXvgebmw5GYAgVA/r4L1JARdGsqK3Wpb7ZyDZKXRxusqVniYsuaa70LhFpd
	mHK7wqruWuqHpzmPKdgzSCGOWmyPwIjYthxLCfoX6+ktvrNPGuWXbFk7TCJz7CiykIhwEx3E0me
	Iw84e5aY5u5oHhzeAwTPiozDjCsPA7cPZytfSYy3lCoLo6clro9NZBC3ygGTWxPUmNYXaE96Mu4
	EqLpSBM2BvyKo2p439RYD2kuUHs1LeX0uKEXgm2qHjPT1DNDtAY2E=
X-Received: by 2002:a05:6820:55c9:20b0:70b:8307:9bd9 with SMTP id 006d021491bc7-71ab518ad5fmr1331750eaf.78.1794593736452;
        Fri, 13 Nov 2026 10:15:36 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8628817d979sm3253414a34.22.2026.11.13.10.15.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:15:35 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 13 Nov 2026 11:14:33 -0700
Subject: [PATCH v4 17/58] mtd: rawnand: rockchip: retain chips across
 controller removal
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
Message-Id: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-17-556b1d7c6221@gmail.com>
References: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
In-Reply-To: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>, 
 Heiko Stuebner <heiko@sntech.de>, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, 
 Yifeng Zhao <yifeng.zhao@rock-chips.com>
X-Mailer: b4 0.15.2

Keep chip metadata and controller storage alive for retained MTD
handles. Disconnect each chip after unregistering it and before
releasing transfer buffers or clocks. This also lets unregister
notifiers finish using those buffers before hardware teardown. Free chip
metadata on the final MTD put.

Run NAND cleanup during disconnection; the final core-owned put only
releases retained allocation and layout data.

Fixes: 058e0e847d54 ("mtd: rawnand: rockchip: NFC driver for RK3308, RK2928 and others")
Cc: Heiko Stuebner <heiko@sntech.de>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-rockchip@lists.infradead.org
Cc: Yifeng Zhao <yifeng.zhao@rock-chips.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/rockchip-nand-controller.c | 41 +++++++++++++++++--------
 1 file changed, 28 insertions(+), 13 deletions(-)

diff --git a/drivers/mtd/nand/raw/rockchip-nand-controller.c b/drivers/mtd/nand/raw/rockchip-nand-controller.c
index 1e56e5e41f79..1616c9335e38 100644
--- a/drivers/mtd/nand/raw/rockchip-nand-controller.c
+++ b/drivers/mtd/nand/raw/rockchip-nand-controller.c
@@ -1134,8 +1134,7 @@ static int rk_nfc_nand_chip_init(struct device *dev, struct rk_nfc *nfc,
 		return -EINVAL;
 	}
 
-	rknand = devm_kzalloc(dev, struct_size(rknand, sels, nsels),
-			      GFP_KERNEL);
+	rknand = kzalloc(struct_size(rknand, sels, nsels), GFP_KERNEL);
 	if (!rknand)
 		return -ENOMEM;
 
@@ -1144,17 +1143,19 @@ static int rk_nfc_nand_chip_init(struct device *dev, struct rk_nfc *nfc,
 		ret = of_property_read_u32_index(np, "reg", i, &tmp);
 		if (ret) {
 			dev_err(dev, "reg property failure : %d\n", ret);
-			return ret;
+			goto free_chip;
 		}
 
 		if (tmp >= NFC_MAX_NSELS) {
 			dev_err(dev, "invalid CS: %u\n", tmp);
-			return -EINVAL;
+			ret = -EINVAL;
+			goto free_chip;
 		}
 
 		if (test_and_set_bit(tmp, &nfc->assigned_cs)) {
 			dev_err(dev, "CS %u already assigned\n", tmp);
-			return -EINVAL;
+			ret = -EINVAL;
+			goto free_chip;
 		}
 
 		rknand->sels[i] = tmp;
@@ -1174,19 +1175,20 @@ static int rk_nfc_nand_chip_init(struct device *dev, struct rk_nfc *nfc,
 	chip->ecc.engine_type = NAND_ECC_ENGINE_TYPE_ON_HOST;
 
 	mtd = nand_to_mtd(chip);
-	mtd->owner = THIS_MODULE;
+
 	mtd->parent_dev = dev;
 
 	if (!mtd->name) {
 		dev_err(nfc->dev, "NAND label property is mandatory\n");
-		return -EINVAL;
+		ret = -EINVAL;
+		goto free_chip;
 	}
 
 	mtd_set_ooblayout(mtd, &rk_nfc_ooblayout_ops);
 	rk_nfc_hw_init(nfc);
 	ret = nand_scan(chip, nsels);
 	if (ret)
-		return ret;
+		goto free_chip;
 
 	if (chip->options & NAND_IS_BOOT_MEDIUM) {
 		ret = of_property_read_u32(np, "rockchip,boot-blks", &tmp);
@@ -1197,16 +1199,26 @@ static int rk_nfc_nand_chip_init(struct device *dev, struct rk_nfc *nfc,
 		rknand->boot_ecc = ret ? chip->ecc.strength : tmp;
 	}
 
+	ret = nand_set_lifetime(chip, container_of(chip, struct rk_nfc_nand_chip, chip));
+	if (ret) {
+		nand_cleanup(chip);
+		goto free_chip;
+	}
 	ret = mtd_device_register(mtd, NULL, 0);
 	if (ret) {
 		dev_err(dev, "MTD parse partition error\n");
-		nand_cleanup(chip);
+		nand_disconnect(chip);
+		mtd_put_master(mtd);
 		return ret;
 	}
 
 	list_add_tail(&rknand->node, &nfc->chips);
 
 	return 0;
+
+free_chip:
+	kfree(rknand);
+	return ret;
 }
 
 static void rk_nfc_chips_cleanup(struct rk_nfc *nfc)
@@ -1219,8 +1231,9 @@ static void rk_nfc_chips_cleanup(struct rk_nfc *nfc)
 		chip = &rknand->chip;
 		ret = mtd_device_unregister(nand_to_mtd(chip));
 		WARN_ON(ret);
-		nand_cleanup(chip);
+		nand_disconnect(chip);
 		list_del(&rknand->node);
+		mtd_put_master(nand_to_mtd(chip));
 	}
 }
 
@@ -1381,11 +1394,13 @@ static int rk_nfc_probe(struct platform_device *pdev)
 	struct rk_nfc *nfc;
 	int ret, irq;
 
-	nfc = devm_kzalloc(dev, sizeof(*nfc), GFP_KERNEL);
+	nfc = kzalloc_obj(*nfc);
 	if (!nfc)
 		return -ENOMEM;
 
-	nand_controller_init(&nfc->controller);
+	ret = devm_nand_controller_init(dev, &nfc->controller, nfc);
+	if (ret)
+		return ret;
 	INIT_LIST_HEAD(&nfc->chips);
 	nfc->controller.ops = &rk_nfc_controller_ops;
 
@@ -1449,9 +1464,9 @@ static void rk_nfc_remove(struct platform_device *pdev)
 {
 	struct rk_nfc *nfc = platform_get_drvdata(pdev);
 
+	rk_nfc_chips_cleanup(nfc);
 	kfree(nfc->page_buf);
 	kfree(nfc->oob_buf);
-	rk_nfc_chips_cleanup(nfc);
 	rk_nfc_disable_clks(nfc);
 }
 

-- 
2.53.0

