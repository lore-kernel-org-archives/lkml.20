Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794810607;
	b=dteIvvpD4wJVZEwt4nM/koBaJcyOx6HVX78UKdSWtsQcapgWPqXvHD7QLvOCaGRUoRkv
	 mIXZG6cJaWdVIRKiYMgp0GD5vQ4srllDjVPVUBQXGqohGyHFiZOCUCtqBRRVTQWS+fvvF
	 FdLa7j4KfIzxNCIS64KMtIClrv1CAK1g05h4q1ROp0zVPhi4Yx60pVrd4G5PSaKcgcBFg
	 GQ38rTCL6peMlT6dV22vgDia3lK8ecIEBlsn1uHMQ89oO2dhWnfM6HuG8bk6waJUCNJ+o
	 4SnsJkseUBO0E8y4abf90emr3/jnlmNwmT76l7gNFPRgaBsKddobRX/bYgWKjlmukMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794810607;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=FraXL6TvEduJvf5AaveEnMU+FvEiUNO/y+vqECKLnSg=;
	b=FOQmNH6bOjakaQ3uidIh02fGcuCrY/4OogUPcJK6ZdOTboK40mmp1cf2Ut/UgnxA6zuw
	 zqM+l5FYs0BE7BO/qx3vWaiouQOVD7AKCYRX6ARSDfcJK0AsxWEI2hQSQGnaOAZo7E/5G
	 u5eLa8noLlxP2YFz2L27sNdUTSYfXfxjcQ3q4VYxUbMpxbuLl7zd/hhNiNv+Bm2QUE+f4
	 AMPMpibXrND+L+Gu9VL+QgtNL+s470fjLjDsVqYUqjO6iTCC+Y7I10h7+F39Yld/39Ir/
	 OhpbphrFl3+v5ogWJsFg0e4UFOFEsJcJ34TZug8laztDxDJGI9M2K4lN2s6QBGoyasw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rOKrcNDS;
	arc=none smtp.remote-ip=209.85.161.43
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61C28606A8A3
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 06:30:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 61C28606A8A3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rOKrcNDS
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-706113e92f9so2430909eaf.2
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 22:30:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794810606; x=1795415406; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FraXL6TvEduJvf5AaveEnMU+FvEiUNO/y+vqECKLnSg=;
        b=rOKrcNDSsCWS+K/o7qLoCtsVNAfxIVx8mlaCvp0Y8TVN18yf4F38uKjrukY3uatUUy
         6QxovAI0yWkHyom1L4xvV25h9Jzuir0uXYvFSLmmzeq+MeoWu0xnnOeVMAljl0yEMUOA
         9cgvWKiL5hLGCoUP9LignpgFp27OVRnZ9M81bgxrd+eD11FJDejFOH2QAKs36gTt285H
         5GY+jfopuF+YuzW/QXLr3oFHdNG1o5EM7Xyt22LZOaiYO3HT8nrWMOcgYk6DD/qOSCNj
         dhF3aza6CQ9G5Y1uATEp3Jgr/bv+MP65OM6bJBZ3sYF6o6buSifpm+bV/DSZQoP7jYR/
         VksQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794810606; x=1795415406;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FraXL6TvEduJvf5AaveEnMU+FvEiUNO/y+vqECKLnSg=;
        b=ztTY3f2uhi3qLSR+LWd4XAioYr5h+TJUOcXy0JLlIm/QBxJktbDGmdReA6spRCOVw0
         1KXzRLIJFybMowgr0G0Ltg6La5DJfPtdHi73khxYGhUnW3jzledYH7JfFDN5dTB4Vmh+
         2Njl9VSOAYWF9KP0JusFAODEevephF3FyNEfUsYOcSbBEEOwh5ETKm1OycsWK7KCcYWq
         ozzO8cEEe18Tcdwvqu4wnqzx8dewPbUde2FpoxUJvK8b96QIanOB79F8VYHLS6gFMzVe
         YMOTGRqoGXOyt0nmIIpJZDJTySQJQ7MrYgdxjMVodzZPMyXxQD4Mp1FZh9CgLAVi+xu7
         7w7w==
X-Forwarded-Encrypted: i=1; AL+hErHzwj9p/KqIOmJp44YRO9rbxgByYK9vxKIliciB8nk3d2hwIyH3zCMlWEmV0msU4SELrV9t7OPWSoF/crc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ZMRgwx0Q/h/7Sp3WksTjUz/YWdlZkoAkNUSbcBv6p2jIef1hS
	i3BEHdCGT+UhzLYS4deH3IPXTqB3KroSxKv2olcZ5PNiiJfwc3gfAVph
X-Gm-Gg: AYBFou1yssdYaWR3gBMRxC7lBOiYvm7aNPQarNdGu2Cp0xBiWl2KaAriYs+3sJDefLh
	cVCfbE60jQusQYgF2YCIdmkTqL0ialtkVGaWV+VUUoCOUnD+nIyKYLDc2TPgq2GeJ+KV6S6cLVq
	PpYfd+JOplk73Rt1+nEMyhl2UAQrk28TimUdRy+/YTGGaNv8TnvO/0iU/DN7CSZDL+E/xNtHoFH
	hHYMBnX9/EJ/cCE/YF61uYCcggvNHzTYXYntzIlaTPBeMNyCzRVFxeazzMojkEg1YLmGg/KiDnb
	DzBhxvAd+WuD2J/ltw3lqJ3M2WLmTtCxwIvNNf3OXTjTZp9+zUFRDcUwPMHd9do3LpMIuTZ26cZ
	R7Oj7JjEFOlyZWXKXnKJIcZ83BgsYOadv0mYL+sRP4uLTkrSz5Fsgmg+7PYegTr60zXCQYsma1h
	PqyYh25Rr6TuLUrMmCPEdollkHfzDsr6lUQKjKlKfAXWZV+47/X7dWTNi343tayhLYvAcWHqfeM
	Xq6N8CflZvBRVii4wJfTndXCAJ2vP770UtQRLKmvAej6RDPg3IAezRSyfSwF11vlqY862njeOfa
	gB9W3bukBIuoYZdMqAEmwBur3fAVQXAFBVHHy1oBiuT4BlTuzpxZPBoxIDsR9AWhVSE0zKNvz+Z
	riHVXpozHxBjXNsdv/wSNp86qyegMrmgyHiSK6st2ckl7uZWUqeG2vznZrf604/tlB9S3W+p3SH
	/mOtBmrPTqvuUK43bmSxzH+Nm461OMtuupvyd/X4J+rd1hwTh+iVM=
X-Received: by 2002:a05:6820:339c:20b0:71a:f228:3222 with SMTP id 006d021491bc7-71af22833b7mr1068015eaf.77.1794810606340;
        Sun, 15 Nov 2026 22:30:06 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab42c41e9sm7994558eaf.6.2026.11.15.22.30.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:30:05 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 23:29:32 -0700
Subject: [PATCH v5 17/58] mtd: rawnand: rockchip: retain chips across
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
Message-Id: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-17-cbc49c5c5e74@gmail.com>
References: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
In-Reply-To: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>, 
 Heiko Stuebner <heiko@sntech.de>, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, 
 Yifeng Zhao <yifeng.zhao@rock-chips.com>
X-Mailer: b4 0.17-dev

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

