Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794446949;
	b=IMoIVMSalu9oZtT74rMWSuEPxxyLQS+OxqXGysXmqA1AxBOiV34wQxOxBB+/67ldDloc
	 FBDLbQtknxXmdSxENqjE2K+Kwfc/sr8pr2MW7PxqHzMJRQRsU1ASP3FSEi5+nv+8TmA4W
	 f1ABDxOxyAS+KlERZIH4n8IMUnfVR9pDWs+rQ56O5Kq19ZNgc8jqtmcWMgewskp1ev5z0
	 U1TgG2FR9T5Z4OZu03Btpw3bodXVwuoZyrl7VE0WykM7irKkSPasNjl5DkDaZgGoLra1l
	 XF7ex8eyxHSV2/ceAOyMZapPUTCi7oIFG0gBzU5zubB9eekOI2YgQivSWonevSs1/WQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794446949;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=tdquIJI5TFIgyn6qHtFYCE5BS2Ylwfdjlp7GjhPPIPA=;
	b=1xOZKVNIcioMOCx+0imse+VpeSkL5lqkXHwPQZ+lsz/z3xuP+OWPKhpQ9z4oC4YUI4NY
	 NclXlV6v5/s1E7ng5ilRDElN8QcSIkVRMJVMD8s50UllH57fmAO2onKncTcu080AqpQ6c
	 e6SA3UTjIypr4eUnRJ3rmOFLCEhOrTAhr9tS3NBckDAPXUaMOEKq3K37REmNtfHueOVrj
	 0vKCvLe40R9536klnImuZ4WwiwseqiYB9y9RWeTOr4x34gcECSPe9qMvIF2nJFmY6sORp
	 lyCkH4sJvvpoKeq54rYXZ5oYKJiNZIpGJssgqOfmEwGD8jTgoYW9kzroHl9OsWZTYBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o6ZSAYPN;
	arc=none smtp.remote-ip=209.85.167.172
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 718F7606DDEA
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 01:29:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 718F7606DDEA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o6ZSAYPN
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-53a448f86e0so2102497b6e.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 17:29:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794446948; x=1795051748; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tdquIJI5TFIgyn6qHtFYCE5BS2Ylwfdjlp7GjhPPIPA=;
        b=o6ZSAYPNGK836IMvjQEYZsFjytcTCekqgRbx5Hgl9EyHRpmPCaPFueHc7t3ZlMHP4K
         DGujrHlc/Y8OjjvA4eeO+TeRayCHx8yVTF2i7VywfewpZC9DTBJO/FIXJO/8BwoF/zvj
         vYegwYx9y2rp4NfuZ3zp0iefDf0t70nWA5GlRl5lEW3aQ/Kk0CinasvD+/0mXRP9ZG6P
         eYMvdQwu8CTAHtm4yMC8hSGfaCNLTC1MdmJAxKRNqEaQ2pB1fVNit//n6dyhT6NFoGtC
         9nuu8z5e6HfSfVfYnmwPd1AlpmEUNZ9+7i64JLip7Fyt22lA9oXoA6eY/hOP+NXpi3qj
         XBzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794446948; x=1795051748;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tdquIJI5TFIgyn6qHtFYCE5BS2Ylwfdjlp7GjhPPIPA=;
        b=Nmqq1E7aMYfsrgaasCcgTpTzxqwTGHQtA6dBxAqkzduQiIUhD3z8PCC+AVDZ/PXbFA
         seBq5phnSENY6JLXV2SF+8scWOGb86P5aVk8k1mP5SNyfGovjH80J9IyHRUnELlnlQWm
         Q9uEVpNi7zu8LLm27R4ZJ7NBwmn7ATTI+1ZSgVLNHjZpQxc0D8WLR1AkAq1VF8lqlU/7
         A5kIGKcSTXEhxE4qPqOHtt80MIaTxBPRNYPtaVYYoJYWLPj3dyZdMq3UowWUx7cVVPKN
         pwf3SIKguMSzIt6V9HzCa54LeIwT/LgjA7KLjV9zdNgvJAT9GDGTNo+lrcbAin6er+lM
         A1Hg==
X-Forwarded-Encrypted: i=1; AL+hErFuTzoS+LBOFMin572ZNcIoHk9e15buOngQh8TM3S87kyGlsA6yFKEwc3r3bMTVKF68yfyhA/e0V81kJy4=@vger.kernel.org
X-Gm-Message-State: APuU4Z85x+cc0bzCyRpPO7EffgdBgz++Nj3GfXEdKN7I1c1CXURLJVcM
	cW/uviDBS4rIpQ9uvj3yjMz/avMG3Z/KJV0xM1KVbmT2NuFtjm42eJcD
X-Gm-Gg: AYBFou1TjXbklJb/X5FDVqr/tKJEecLZ/AAWBiMUx7N3yTyTvNAXKyZN1CVk1cIWuFT
	WyVV+KgCwhGUJL52rP7V4MYIRSoenOjZz+8UAH66KvLlkzAhMd6qJ5SfPTkVyZGjZTeXmR4dggK
	RC1iKiPAzCWUe99z8qKjiwn8ZCgEfyQXRn7KK//mVuUpK2BQkCm4MRW5KEISN9oPDeXgAHe+E27
	MTAXRlMQIsmkzdG7cxSJQtTWAyDWwv31fx4PljQo6L39Rae3wCVlR0fL1zWxfVsFAsStkgrkjaz
	ElZGzyr4oHWuHTaJgUH73Pv3LvJugKdb7hjcTDYJXxPSdvCDQv01ontN9aRyZ7ipcnHSBztkA2D
	4I6VOD5DIdgUe41Dp3FJllIrjeVXgpFfB8iGS87E20oJH4jHR/snMhrptg5BxNSca8P79agdtU2
	azXSA5lZtBtxjUeAe6yAwTtPwznjKq5i4aVlDejiTgsTqqDiktAKEOKvrygGZ7jBigR+gGRt1yw
	w6WlOTNHbo/euyWN9yMA5TapPVLipnFQInTFGP3mUNE0DNAo8gQFPB5hi8gOspucImr472vayS1
	soooji+lkMLIQTxEwKirzxyn04cEATzTGRx9bjhbjnNKnmUps4xT/HdUy4sQKj0S982LTSJBgRu
	/bz+hvL1EltaGOluWC6BPuEMUaG8N29FYEJAYjkpk2fJ2FgYlU/TlcVEwGftJG5RCkc1brInID6
	GLcP2eLCIVmvxQ+BHkAzvLqBka2Yh5iEjz69yFORIucIae9ZNiaT2sqE5gE/j9Ri05HhZB45qTz
	g==
X-Received: by 2002:a05:6808:1246:b0:4bb:ac05:9ebf with SMTP id 5614622812f47-56b961950cfmr3423531b6e.14.1794446948425;
        Wed, 11 Nov 2026 17:29:08 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905738049sm6823481b6e.10.2026.11.11.17.29.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 17:29:07 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 11 Nov 2026 18:28:15 -0700
Subject: [PATCH v3 36/58] mtd: rawnand: renesas: retain open-handle state
 on removal
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
Message-Id: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-36-ce537999741d@gmail.com>
References: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
In-Reply-To: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>, 
 linux-renesas-soc@vger.kernel.org
X-Mailer: b4 0.15.2

Keep chip metadata and controller storage alive until the final MTD
reference is released. Unregister and disconnect each published chip
before releasing the resources used by its hardware operations.

Disconnect all chips before dropping runtime PM and transfer buffers.

Run NAND cleanup during disconnection; the final core-owned put only
releases retained allocation and layout data.

Cc: linux-renesas-soc@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/renesas-nand-controller.c | 35 +++++++++++++++++---------
 1 file changed, 23 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/nand/raw/renesas-nand-controller.c b/drivers/mtd/nand/raw/renesas-nand-controller.c
index 135cdb67a472..8a2a55007148 100644
--- a/drivers/mtd/nand/raw/renesas-nand-controller.c
+++ b/drivers/mtd/nand/raw/renesas-nand-controller.c
@@ -1217,8 +1217,7 @@ static int rnandc_chip_init(struct rnandc *rnandc, struct device_node *np)
 	}
 
 	/* Alloc the driver's NAND chip structure */
-	rnand = devm_kzalloc(rnandc->dev, struct_size(rnand, sels, nsels),
-			     GFP_KERNEL);
+	rnand = kzalloc(struct_size(rnand, sels, nsels), GFP_KERNEL);
 	if (!rnand)
 		return -ENOMEM;
 
@@ -1229,17 +1228,19 @@ static int rnandc_chip_init(struct rnandc *rnandc, struct device_node *np)
 		ret = of_property_read_u32_index(np, "reg", i, &cs);
 		if (ret) {
 			dev_err(rnandc->dev, "Incomplete reg property (%d)\n", ret);
-			return ret;
+			goto free_chip;
 		}
 
 		if (cs >= RNANDC_CS_NUM) {
 			dev_err(rnandc->dev, "Invalid reg property (%d)\n", cs);
-			return -EINVAL;
+			ret = -EINVAL;
+			goto free_chip;
 		}
 
 		if (test_and_set_bit(cs, &rnandc->assigned_cs)) {
 			dev_err(rnandc->dev, "CS %d already assigned\n", cs);
-			return -EINVAL;
+			ret = -EINVAL;
+			goto free_chip;
 		}
 
 		/*
@@ -1257,23 +1258,29 @@ static int rnandc_chip_init(struct rnandc *rnandc, struct device_node *np)
 	mtd->parent_dev = rnandc->dev;
 	if (!mtd->name) {
 		dev_err(rnandc->dev, "Missing MTD label\n");
-		return -EINVAL;
+		ret = -EINVAL;
+		goto free_chip;
 	}
 
 	ret = nand_scan(chip, rnand->nsels);
 	if (ret) {
 		dev_err(rnandc->dev, "Failed to scan the NAND chip (%d)\n", ret);
-		return ret;
+		goto free_chip;
 	}
 
 	ret = rnandc_alloc_dma_buf(rnandc, mtd);
 	if (ret)
 		goto cleanup_nand;
 
+	ret = nand_set_lifetime(chip, container_of(chip, struct rnand_chip, chip));
+	if (ret)
+		goto cleanup_nand;
 	ret = mtd_device_register(mtd, NULL, 0);
 	if (ret) {
 		dev_err(rnandc->dev, "Failed to register MTD device (%d)\n", ret);
-		goto cleanup_nand;
+		nand_disconnect(chip);
+		mtd_put_master(mtd);
+		return ret;
 	}
 
 	list_add_tail(&rnand->node, &rnandc->chips);
@@ -1282,7 +1289,8 @@ static int rnandc_chip_init(struct rnandc *rnandc, struct device_node *np)
 
 cleanup_nand:
 	nand_cleanup(chip);
-
+free_chip:
+	kfree(rnand);
 	return ret;
 }
 
@@ -1296,8 +1304,9 @@ static void rnandc_chips_cleanup(struct rnandc *rnandc)
 		chip = &entry->chip;
 		ret = mtd_device_unregister(nand_to_mtd(chip));
 		WARN_ON(ret);
-		nand_cleanup(chip);
+		nand_disconnect(chip);
 		list_del(&entry->node);
+		mtd_put_master(nand_to_mtd(chip));
 	}
 }
 
@@ -1322,12 +1331,14 @@ static int rnandc_probe(struct platform_device *pdev)
 	struct clk *eclk;
 	int irq, ret;
 
-	rnandc = devm_kzalloc(&pdev->dev, sizeof(*rnandc), GFP_KERNEL);
+	rnandc = kzalloc_obj(*rnandc);
 	if (!rnandc)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(&pdev->dev, &rnandc->controller, rnandc);
+	if (ret)
+		return ret;
 
 	rnandc->dev = &pdev->dev;
-	nand_controller_init(&rnandc->controller);
 	rnandc->controller.ops = &rnandc_ops;
 	INIT_LIST_HEAD(&rnandc->chips);
 	init_completion(&rnandc->complete);

-- 
2.53.0

