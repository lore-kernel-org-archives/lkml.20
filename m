Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794446934;
	b=VQJEDm1tMzOwPXcKcoV1p0GjRUCbaYhU4XJXoQr5fQHJfSFw1LdFz+gHEN0Wufi3gTkA
	 TafBRgutaq6U8UbSdSJzNnO0TyhftoBQ9Zrlxn4ycLv9sm1x0smXXM3qhu20YyBl5dgu0
	 nyTpknACG6QWqBarPR08OKFH+wG/Z7ZoNDZJ7SdnhU69CM3lMZdXoZl07t5fFAdMuD+YJ
	 t0b6aEA+/oAMJOXe19TV9na+I/JhaPiIdbYHqqfi31U6/G4fjpp4VtmZw4pet9n8Uhik+
	 IVCKwJIEu2AHAQ0GT2xb0TyIuGTOY8GBsRbUIpfTZ6dDcZQHYm7QnEU0Nbh2q9v12Yw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794446934;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=FraXL6TvEduJvf5AaveEnMU+FvEiUNO/y+vqECKLnSg=;
	b=RpUQbFLf9YkypiXl4mDSzD+BqbULk1BzSZXh8UfrY4RaGTYgNnI6N1e0WfwIVEX/sFH+
	 qXXj4XYBeK6ZYJQ1g16O2Zyua9GfwLsFFDm9jJrFzB66xP4sOAJnVnUD2KJtC+wo4ut0l
	 1MwOH8Ij8+Y/0Bp0lBGKV7bg2LI+Dg7YGDHkzuHUs1LrWksoPxH9bnXcgBjI+UkEsKhRV
	 XD/WYiKLkQv1T60fWax5oPE/d+pnZVozYrT3Al/N5+g4QC4v2AjwGpcRIVsuC393Jyojz
	 DDByf5d0nf5JjGl0bdoDn22tsOoI27S8eIQR/ZB/CxSRvPnPW6uxTCokeem2589uXqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=As7bdELi;
	arc=none smtp.remote-ip=209.85.167.177
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 901B9606E10D
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 01:28:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 901B9606E10D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=As7bdELi
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-53ec92375d2so1479137b6e.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 17:28:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794446932; x=1795051732; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FraXL6TvEduJvf5AaveEnMU+FvEiUNO/y+vqECKLnSg=;
        b=As7bdELi9YdTCPsGa4KMFMJ/a0q5FOkHGP9R6cUJgyUt85DcWMs2iQZ2RkqyJ5A7Wc
         D2qUgTiuUKJr575Aw08v3kKPBWmZ0YMNPwAeQRN5paRGSVgg6D9ifH8llH9FhNiwP9YB
         KcsNaik2uZI9YfuPdzoFOvYowndQmNO2d98lXth5RHZZHg9V2DuQL/Y/Iu4pVtkyQYK7
         FT4zMg2rCAfLQ3Scrt5YmZ/EyakO8fse4wsOkXolcboBc3ZhzD7y+nFtY1pv/FAqL/jM
         X1c5OIIY1IHuVXD4v+hvPdBt/GzMZdWthRjhziR66I/Gg5LXg6VZAnckbArvAkM4r9+D
         cH4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794446932; x=1795051732;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FraXL6TvEduJvf5AaveEnMU+FvEiUNO/y+vqECKLnSg=;
        b=Ojcdy9ii26oyejzcu9/iYKVlO3yMlpP5pC7CzlGTAajJxL43H7OKwcSaLIW+GHbcn1
         xxjLHvwWEyp7m9ISgBUY7RNNBGYTkcdbXGv8hMiaflGKnVjpOUszs12VZ1TNvOwPtX4S
         +MGo2AvWdNeEj3uBUMwgfUC3/6MtXlifWcT2f2ua/AgVMi1UIl+1ZG/vjdFnaerfIJnt
         aVWQez0QH3pUiggbVdsYVcNy3PZtr4EJjLEwnQIHdCADz4AN2C2iqnXBsM4yVdafqHLS
         B1UTZyiEEI3X091XaR73qwNhU4AyID8WdihuWKMVVdfMjP/PxblVKyA4LH4rgB5/JjrI
         n6fg==
X-Forwarded-Encrypted: i=1; AL+hErGxgCzlgQVCnlcjiyXtvDg/X4KkhnCWwiMrIfLFrN/NqXKtKpSAHPjb0PRr4Wymyzi9qtaF/rYoIjW1khM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+raK0vnnIYR+0RiOhN0TTsCZJps/PPrvNZtm165AOpRbcHAdt5
	XDLwoPx3pID7H5yUwy6jIXN0vQJ2cqnCen1EJ7jTi/kFyv3phTc+2cwu
X-Gm-Gg: AYBFou1LTKanszW3ry/q+Ku6H+Fc5P5AJS704Rpe+fYm7PiA37T+vgUsEGJ5k0vnTVQ
	yzC1pJ42+6zgGEWe2Wx9xFxqgGduUTesDFLnCmBZiRqb/gkDnZtW1iMwC0rpHyXUvOMRTyvBqqD
	HMvDzHV7o3DkwsebIgRysilKQ+HBKiaBQuVO6SDyKRDphypFY1FQTAQ2RQWJvWmNWLPi3chxUYs
	8LBDAbLEPmjYHA/t/e+anOSENP3KeF5gbW6x4VArKVV4MPfKxPKX+5B7KIYM54S7JWQzZeGjqqd
	tRbAsG79tgQME8Vh6oxJ/dGmeJt3PfnOZpqPA9nUkkO68Axa9awm1lW7HgmbfSp7XYOGu+DLHD7
	LpnfPgCRd1AG6fRwBP435XNGQ1WwLhA1MxcD8mLIxUwzNidnJ79s2kmZe9Qi2fSgjrsxxzEyg5U
	2lvO485YP/CAYCDew7/O1OpKH38DzmGx5W7l2HePulwvVv1baqZ3mC3LVXtxtTNVjqVyQ8ig7IA
	jat1CVzKEqt2ogzQLbz0Ts2Q5daunXWNLYpswzRpC/UD0Lt1twmCNCOGSwrqOmpHbNInukKdjq6
	N0RuRjbG67TDdE92HCpGPTHPKWWI7OcBPuV9IfOmHe23eBnQqCJ8+HZ7jIH64xA6Mvk5oKL8Jxn
	/xMPpdkhxRbEumtppW1VaheTowz9/QVcFCRkoeFv5ChzLtOmgfZiD9PgEyi7wVcqPUmvd9gB/C+
	wbtW82Fe+WRVRYdZwxktUeFZAyC4eFlc7VK4Mn0/2lX8az27hq0jmOPHKkp0wUkLQ1daLB8gs64
	w==
X-Received: by 2002:a05:6808:1924:b0:4d6:92b3:5c8d with SMTP id 5614622812f47-56b98d27ee0mr4382489b6e.67.1794446927783;
        Wed, 11 Nov 2026 17:28:47 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905738049sm6823481b6e.10.2026.11.11.17.28.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 17:28:47 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 11 Nov 2026 18:27:56 -0700
Subject: [PATCH v3 17/58] mtd: rawnand: rockchip: retain chips across
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
Message-Id: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-17-ce537999741d@gmail.com>
References: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
In-Reply-To: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
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

