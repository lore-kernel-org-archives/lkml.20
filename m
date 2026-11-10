Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794296681;
	b=orTJ44SYc5/s8OjvNIFAntbJGyp2XF5RnB1KDP2XMN6EypcsF6OcNrdQfBHO00E8TTA3
	 Z7bPKk5jEbjrYUd7ZZs1bWdZLeGBsWNn2bpEOFsfTmFc+i+NeLIUiKAhrRghYUuFCjVsg
	 8iDx2n5rjW6hspfVPcmuAW2LJCRCN6Ce43ABt3bKeid9+NPrhFAVvdqjB0hbA61n4LF7y
	 r20YMXRiJZYHxvOQzRS/6TG/168x21kumVvUEzl8iHW42OMUkahUKJbDd7V1bLHZK0MkV
	 2yNMbW9EPFWHE9QR2MZqS42NwOG5n//L316hWTecEaXEbmogqVR6yCRGVDhca+z6Npg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794296681;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=NnAS6WOgFuGwDjvtZJG6FbzuORG3Gs7qMjpBKDa9+4A=;
	b=c5TyHWiEuNkvCjrEJxPZtQdKJZ/Ez614L/3dtpiAG+DhvUQjVlbzSa1RY5yIcqcxNFMv
	 /YL9D1g4l95Ob+S+Ik3OAiEaubkTm8DahtDivj4PBcYOF27d0vYZSP6Oqs+NlFuIGRwo3
	 UslATN5VkQ2GN9G8FUzARaqWrfmw5/KYnbxWjWRj9qp2fT5HV++faHiear5kyBR0zrCh6
	 +SC6tinxMD/MAndh/IpWyucvJBWMKqr8dOK04FyOMOWwOyDomSFMdkdNp9mTPVw7oQebz
	 Ea2Di0OOYFgnwYkch1ajoNu8zQZPDkUE6YVjX7xCNIDYiKJlbgZJQLlrWpkcFLoP/gg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gLBVU7yz;
	arc=none smtp.remote-ip=209.85.167.179
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D149860A6F71
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 07:44:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D149860A6F71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gLBVU7yz
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-4f14642adb4so957744b6e.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 23:44:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794296680; x=1794901480; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NnAS6WOgFuGwDjvtZJG6FbzuORG3Gs7qMjpBKDa9+4A=;
        b=gLBVU7yzvChQYI0lSCaHNFEDsC8KT4efooklX/VVDZTF9G0kiAZ1RSVavwLils8bmu
         PhGlEmzjfciCAmyRqUhKar1wfIQMN93Uy1A9KMg0eMH8iS+/MIjNHnO7u6ijN5FMZgb3
         Qi9u/c1/tZxly36tII9RU/eeMM8oZqUChic4Bp4cSi7SQXg2iq43kAerh1KtO4CeFudI
         qUFNAgw5P8bIpPe1kRFITy3OJo74TjlX5DXQx7pr6U0+f8fgvrzqNzBEzHQm2gJq3lS0
         TZZ1Ak/+MaSG0LY3uazFndzaCzn3RREb5vxOmABJMURJsBw34s1f+mi51imbldxPDOea
         z4Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794296680; x=1794901480;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NnAS6WOgFuGwDjvtZJG6FbzuORG3Gs7qMjpBKDa9+4A=;
        b=fzMZgaJM8xfj9axBCMUQGzoEg0z5TtdI8XSm2WIS8ixKCOyF56oGJEFz7gqmCiu4BM
         1TmiugQka+U0fWd1mdv+ufIbNUDvo6MpW4mJODlCHo26Q9Bzm1v0XOKCvQoneTVrVTY1
         xq7h+7PRHZjGONNPCfS9lmBKiF2hOkzWBR2C96DcljNnuLrFZ3442ivPDNTNgoTcX9SB
         wVVymfW0ztb3VN3S7mWeOjjIep99zYrDuYF39CsctbFW0DxVJwl4N2aFkmyRYZjWeiCp
         ELjf7lta3mkZb8Rxrzvxc1LhpdRrhCOCzvEiykiqD6aK18RKPgau+aabH9K1jNvim+UN
         UaIg==
X-Forwarded-Encrypted: i=1; AL+hErFC94z7ac3UCboPzsjE30EBqds5p9C8OCZNHecMelIbwTZWBnMtpNqJdqnbUVgr5LXTxDFex2tDwrS1w8M=@vger.kernel.org
X-Gm-Message-State: APuU4Z+T5Phztfsw4EmQyC8xn7EGDLILKmdHhMTOfiJBflDlyldPrqKr
	5kwZfJIsd7AqsaEJlynWIHVfHggA8Z2Z6zWbjtv4oWODSL9Y6GwTdsAi
X-Gm-Gg: AYBFou2X/7dn/7wo2uSXrjtFdp4ibEfg5QWiSJyzto+qXEyuMp+0AB6x2Syyh2QOQ6a
	ddbsQdSyzd8RUMrw5ZB+emY2qu3xvj2g5JlmAPu8x6+SSJMOkagebcRMfdl03EDG7RZGl8iC41v
	gqm+JY0qka55EEW5WXsMg90R/ozo7LfIArpTbXLkljcgKkE+W4ChqRaR1HKXejBVFoCxMKEyMcE
	6E3UtIxcdR7vyFabQzbz+3P6tJJP2iXqe7a8VmAdol9aW88nGnjczKMu7XhTRXnOd2NyPi5GxZn
	2SElo9SYV9s0vnExjZ20ZOjahzXBJLSn0VNriPUpzXdpD/w9zYUv+oN6+Ib2daHTdZH5nwx56N+
	/n8h9Ke1JEuxKe80KF0UrVmjv+ppA/6KtvS+r8IRwp2O5LoOH5OxSLRtEWGSrANdJSC+azJVAcQ
	R6zM5lnmX8gbgrkkbM/V2YRNKeTZuuLlDlVphRbwqXA5oVFvJrp6Zm6VoNXZRFhyolNmJIatM4h
	DVBzwQK5+zn1EA67XNqtxZu5WD09UU0cH4enRiZS7xeiXbMyYicThy2gsSdbROJ4NmuT958QrBm
	tvuLmTUqAUPMZW7B1ZW/bfgVRKEijTzjgGMZOxbOtFXQszoQuCBA5uxEd6kknS+IWbko+XhP4of
	tRZtQodmSfuvVIB4LUIL+pJSRyB/qN+v55FcRuGSLbkQYgQXhG2nK5M53U1GHtlIi0jnH7xiFiY
	Ag2TxNe4zgf8qQIIvco4rvGhuVwPMTV8LY4TvfX6CPmTKswqDAs8o=
X-Received: by 2002:a05:6808:3505:b0:531:7f68:842e with SMTP id 5614622812f47-5683c73b48dmr1413961b6e.8.1794296679771;
        Mon, 09 Nov 2026 23:44:39 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5690504fdb5sm1522804b6e.3.2026.11.09.23.44.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 23:44:39 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 10 Nov 2026 00:44:20 -0700
Subject: [PATCH v2 17/58] mtd: rawnand: rockchip: retain chips across
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
Message-Id: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-17-9137d08f05df@gmail.com>
References: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
In-Reply-To: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
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

Fixes: 058e0e847d54 ("mtd: rawnand: rockchip: NFC driver for RK3308, RK2928 and others")
Cc: Heiko Stuebner <heiko@sntech.de>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-rockchip@lists.infradead.org
Cc: Yifeng Zhao <yifeng.zhao@rock-chips.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/rockchip-nand-controller.c | 49 +++++++++++++++++++------
 1 file changed, 37 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/nand/raw/rockchip-nand-controller.c b/drivers/mtd/nand/raw/rockchip-nand-controller.c
index 9444ba02696d..aa31457390cd 100644
--- a/drivers/mtd/nand/raw/rockchip-nand-controller.c
+++ b/drivers/mtd/nand/raw/rockchip-nand-controller.c
@@ -1115,6 +1115,11 @@ static const struct nand_controller_ops rk_nfc_controller_ops = {
 	.setup_interface = rk_nfc_setup_interface,
 };
 
+static void rk_nfc_nand_release(struct nand_chip *chip)
+{
+	kfree(container_of(chip, struct rk_nfc_nand_chip, chip));
+}
+
 static int rk_nfc_nand_chip_init(struct device *dev, struct rk_nfc *nfc,
 				 struct device_node *np)
 {
@@ -1134,8 +1139,7 @@ static int rk_nfc_nand_chip_init(struct device *dev, struct rk_nfc *nfc,
 		return -EINVAL;
 	}
 
-	rknand = devm_kzalloc(dev, struct_size(rknand, sels, nsels),
-			      GFP_KERNEL);
+	rknand = kzalloc(struct_size(rknand, sels, nsels), GFP_KERNEL);
 	if (!rknand)
 		return -ENOMEM;
 
@@ -1144,17 +1148,19 @@ static int rk_nfc_nand_chip_init(struct device *dev, struct rk_nfc *nfc,
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
@@ -1179,14 +1185,15 @@ static int rk_nfc_nand_chip_init(struct device *dev, struct rk_nfc *nfc,
 
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
@@ -1197,16 +1204,26 @@ static int rk_nfc_nand_chip_init(struct device *dev, struct rk_nfc *nfc,
 		rknand->boot_ecc = ret ? chip->ecc.strength : tmp;
 	}
 
+	ret = nand_set_release(chip, rk_nfc_nand_release);
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
@@ -1219,8 +1236,9 @@ static void rk_nfc_chips_cleanup(struct rk_nfc *nfc)
 		chip = &rknand->chip;
 		ret = mtd_device_unregister(nand_to_mtd(chip));
 		WARN_ON(ret);
-		nand_cleanup(chip);
+		nand_disconnect(chip);
 		list_del(&rknand->node);
+		mtd_put_master(nand_to_mtd(chip));
 	}
 }
 
@@ -1375,17 +1393,24 @@ static const struct of_device_id rk_nfc_id_table[] = {
 };
 MODULE_DEVICE_TABLE(of, rk_nfc_id_table);
 
+static void rk_nfc_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct rk_nfc, controller));
+}
+
 static int rk_nfc_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct rk_nfc *nfc;
 	int ret, irq;
 
-	nfc = devm_kzalloc(dev, sizeof(*nfc), GFP_KERNEL);
+	nfc = kzalloc_obj(*nfc);
 	if (!nfc)
 		return -ENOMEM;
 
-	nand_controller_init(&nfc->controller);
+	ret = devm_nand_controller_init(dev, &nfc->controller, rk_nfc_release);
+	if (ret)
+		return ret;
 	INIT_LIST_HEAD(&nfc->chips);
 	nfc->controller.ops = &rk_nfc_controller_ops;
 
@@ -1449,9 +1474,9 @@ static void rk_nfc_remove(struct platform_device *pdev)
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

