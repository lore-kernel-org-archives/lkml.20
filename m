Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794296705;
	b=g/g6Wy3foT1Y1YlAPbeANBMy4SCnzOwbr4nsK5SwjJu4dxKN92eyLOcuWjnFfVXrqV+r
	 0Zbbh58vTfl5yC2fgimR/JJyufJsdMdgWihmItKdRITs+PA4PT87XCJ2LrZYMOSU3zMxQ
	 3VF1Dnkq4saQow3QSLH4WGyvBnlrlNeE3wGQxpnylGHjEfvB3qr42SEywm4UkHTEzD4va
	 DBqSPE6qHQj4oVjusJdv3wkAiujEC7f0w+fpNhVXyn187gi3VLWfKSff6mKLtuxnj7/fF
	 kUWkxt3SX9wNKRdU7DjHt2vLBQBuztk9RJTHCrReORd7Oc3SL5W3XeG8tbsjX7XF+Rw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794296705;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=CjDWnM22Q/K7vI6+OfH7WDfHobDgdF+mnz7wU6JjdMs=;
	b=or31YOp+XqcVm4WKeDdyKZLg87jfEfStpxlFyXibubzf7ye5JHVL9Xr1eEfXDO4Jswhd
	 O03Lu23qH8TDbt5CWLT81Aqueoem9maZBhCiM1YA8tg4gDVE5QNL5jet0LKKn+Bskxd/b
	 aoSjFJaXWuRFHGbG4rPAJO66C1EVZf4xLQsUd7FZ1FJI/sHiFu7EQuHIMhgRB9IsUGoDe
	 06Z9HBt8EcZe4izaNTiosRVVcrEo9c7kkcqwCQ2zdzYNnd+VEG11Oot97APl1iR6WOfHT
	 h2WMZvTBborpm2QN4prnNzDHASbfrcU+fPv2bApQn8T0VbRAyXlCXEUKJbWp1c44RGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dxsocedS;
	arc=none smtp.remote-ip=209.85.167.170
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A0696070211
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 07:45:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A0696070211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dxsocedS
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-4b28d9537bcso1203000b6e.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 23:45:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794296704; x=1794901504; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CjDWnM22Q/K7vI6+OfH7WDfHobDgdF+mnz7wU6JjdMs=;
        b=dxsocedS6Hh1lIn3sRv1fe4qhTmis9Lgzbdim4sr5SQeIGtY9pxxW8y7fzV21G9QCV
         0te7yiRXM3gKDycZlvZR3EdyImxNKRNBQCgLyZJAOxKsKdZqxm9d7al4mBhY/hQmukxC
         gLVyxKOTlFS2CYrRtN1RNUwn44YI4DMvLScxnnY4TzvnFNLwvjr5Lu8oODsAo3NS7A/D
         FP0XSHTQXMTD+gKsVbPgqm/TsCWMee0exBJV1/va+8af8+QMqJsfsaSKVJgYcJq+SqEl
         KOJoEYFSGgSIK9NDdq79D3Kz/xOHOlxoTo7Ym8qfopZhkgloMCF3xSHbdmCkGMxeAQIZ
         DGdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794296704; x=1794901504;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CjDWnM22Q/K7vI6+OfH7WDfHobDgdF+mnz7wU6JjdMs=;
        b=DwCkMME5fD04sLsRkASkZR3ic9Tc8ZZ8UZf5K5npN3KFhzawcQJG84P8m3+ARgkxsB
         4FyDLU7zmPNgC8wdgIQUnGVomjxenTR42A+8ASPAu4gixtNBJqe10owNOx5RrhNKQHkk
         H/Ob4vra5xbVQogAOLy+zHTwm2k75QFBLTy7+CifrJJjCCnmWYbvmopqYCHnH1CS3/0+
         BSv2zhINZoaxwTDIiKywVCFTb2Icno5aH9BGhGNWgbycNqXdjImanrZSsnPazEwDSmJl
         N1/rIlOtzzp3nvd7rjgbTTkv/b5OiNsYleOfBJueUXoCfu//hYWizerj1IOAZZEjJOeu
         3IEw==
X-Forwarded-Encrypted: i=1; AL+hErGtotFzLnQhQq5sDBp/btGc5q/ySQ14Agv5hwI8Io3U6Gf0zyyQ+AzwyILYG3hy2G0Vq0edllpGSkggZIc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/xr2d1aP+ONNLf4RXkXvAmBY7j4Ev0vbCbfBqZW5sJISS6jBoJ
	oZ/aLgHvCB2zX7L5CSADnfcDoL33dlfJZIdoj5Wg8FZMpS07g2opZIpM0Ulc5zoc
X-Gm-Gg: AYBFou0IIlQxJ8KDbPq2BqCTETMl2iEVhqMjebH6IuDZmJ9bG7S15F+zmSq3SNcJpAe
	Rtt7o9bBxaNSfNEC+GMwG1UE/MEpPwDCX5D0EAw92B5PmHsPrZJ+aPqLNfYrqS1d/fNy4UxkDlo
	Hwa1P7NpU0uju1vJs7+Q/gSt4sZYP+BKtrx6pJxoOj0gPcO/zmbe3AIA9SBCvBxntf3mhHad2Gi
	Ky4nJQey0LbrffkcrhgfNHYaKe5s+dlu6io73+sSvb2oKd4MdxavXea5OutPKJPv/rBhVCI+FIM
	mxtih0YCkKI5bTwbiYQ9Q20fEwos0yO02H9m4k3vFGh4uOj/WIuhfHgGgvou0yFb2SRJjgIv9F+
	Q9MDFiz3i8QiZAxw2x0fQ22k8KK9gINptnZlfzPU9gLIApWXaSH75KsjZ34v2imaUZ/i++EIX7F
	s4GeZksfGN25bxqc+AbBN9BiBRwL9JCzgTHK31FXsfT/eEMsnu692xMJh+/kvrFRSMDo3smqQ3I
	LFbM+/aKalxaFfftVOWBqsl9DTR0sc9RDk1+LNsObmPCppXg8oMSNREtCqnphUM/xlfo/AzOXqJ
	4pOo4KXHs0puabJOukKeFwlRdNSxMVZ036l3O2qBu3Gz/eRKfamozgA3B9p0vDhYXPHNL8htaBL
	lVQTcBlEDo59Uqc2uLihx6dGzncjeiJB9AU6lQgdQ7fEicJz+eEg8eyK1Foe1CwX8Vdi+mHPu+a
	SanJCHOD9eoWQB/e6lBgHYKXUHkhXEL1AUfi9fvjo1WrT9Oj9x+7o=
X-Received: by 2002:a05:6808:4fcd:b0:4b8:46e3:e221 with SMTP id 5614622812f47-5687288b6ccmr1019708b6e.13.1794296704117;
        Mon, 09 Nov 2026 23:45:04 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5690504fdb5sm1522804b6e.3.2026.11.09.23.45.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 23:45:03 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 10 Nov 2026 00:44:42 -0700
Subject: [PATCH v2 39/58] mtd: rawnand: qcom: retain open-handle state on
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
Message-Id: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-39-9137d08f05df@gmail.com>
References: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
In-Reply-To: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>, linux-arm-msm@vger.kernel.org, 
 Manivannan Sadhasivam <mani@kernel.org>
X-Mailer: b4 0.15.2

Keep chip metadata and controller storage alive until the final MTD
reference is released. Unregister and disconnect each published chip
before releasing the resources used by its hardware operations.

Install lifetime ownership after scanning each chip and before any MTD
device is published. On a partial probe failure, unregister only the
published chips, then disconnect and release every initialized chip.

Cc: linux-arm-msm@vger.kernel.org
Cc: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/qcom_nandc.c | 46 +++++++++++++++++++++++++++++----------
 1 file changed, 34 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index 978fa84f051d..2e8fc574f718 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -1903,7 +1903,6 @@ static int qcom_nandc_setup(struct qcom_nand_controller *nandc)
 {
 	u32 nand_ctrl;
 
-	nand_controller_init(&nandc->controller);
 	nandc->controller.ops = &qcom_nandc_ops;
 
 	/* kill onenand */
@@ -2010,6 +2009,11 @@ static int qcom_nand_host_parse_boot_partitions(struct qcom_nand_controller *nan
 	return 0;
 }
 
+static void qcom_nand_host_release(struct nand_chip *chip)
+{
+	kfree(to_qcom_nand_host(chip));
+}
+
 static int qcom_nand_host_init(struct qcom_nand_controller *nandc,
 			       struct qcom_nand_host *host,
 			       struct device_node *dn)
@@ -2022,13 +2026,16 @@ static int qcom_nand_host_init(struct qcom_nand_controller *nandc,
 	ret = of_property_read_u32(dn, "reg", &host->cs);
 	if (ret) {
 		dev_err(dev, "can't get chip-select\n");
-		return -ENXIO;
+		ret = -ENXIO;
+		goto free_host;
 	}
 
 	nand_set_flash_node(chip, dn);
 	mtd->name = devm_kasprintf(dev, GFP_KERNEL, "qcom_nand.%d", host->cs);
-	if (!mtd->name)
-		return -ENOMEM;
+	if (!mtd->name) {
+		ret = -ENOMEM;
+		goto free_host;
+	}
 
 	mtd->owner = THIS_MODULE;
 	mtd->dev.parent = dev;
@@ -2053,7 +2060,7 @@ static int qcom_nand_host_init(struct qcom_nand_controller *nandc,
 
 	ret = nand_scan(chip, 1);
 	if (ret)
-		return ret;
+		goto free_host;
 
 	if (nandc->props->use_codeword_fixup) {
 		ret = qcom_nand_host_parse_boot_partitions(nandc, host, dn);
@@ -2061,10 +2068,15 @@ static int qcom_nand_host_init(struct qcom_nand_controller *nandc,
 			goto err;
 	}
 
+	ret = nand_set_release(chip, qcom_nand_host_release);
+	if (ret)
+		goto err;
 	return 0;
 
 err:
 	nand_cleanup(chip);
+free_host:
+	kfree(host);
 	return ret;
 }
 
@@ -2076,15 +2088,13 @@ static int qcom_probe_nand_devices(struct qcom_nand_controller *nandc)
 	int ret = -ENODEV;
 
 	for_each_available_child_of_node_scoped(dn, child) {
-		host = devm_kzalloc(dev, sizeof(*host), GFP_KERNEL);
+		host = kzalloc_obj(*host);
 		if (!host)
 			return -ENOMEM;
 
 		ret = qcom_nand_host_init(nandc, host, child);
-		if (ret) {
-			devm_kfree(dev, host);
+		if (ret)
 			return ret;
-		}
 
 		list_add_tail(&host->node, &nandc->host_list);
 	}
@@ -2106,12 +2116,16 @@ static void qcom_nandc_cleanup_chips(struct qcom_nand_controller *nandc)
 	int ret;
 
 	list_for_each_entry_safe(host, tmp, &nandc->host_list, node) {
+		struct nand_chip *chip = &host->chip;
+		struct mtd_info *mtd = nand_to_mtd(chip);
+
 		if (host->registered) {
-			ret = mtd_device_unregister(nand_to_mtd(&host->chip));
+			ret = mtd_device_unregister(mtd);
 			WARN_ON(ret);
 		}
-		nand_cleanup(&host->chip);
+		nand_disconnect(chip);
 		list_del(&host->node);
+		mtd_put_master(mtd);
 	}
 }
 
@@ -2141,6 +2155,11 @@ static int qcom_nandc_parse_dt(struct platform_device *pdev)
 	return 0;
 }
 
+static void qcom_nandc_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct qcom_nand_controller, controller));
+}
+
 static int qcom_nandc_probe(struct platform_device *pdev)
 {
 	struct qcom_nand_controller *nandc;
@@ -2149,9 +2168,12 @@ static int qcom_nandc_probe(struct platform_device *pdev)
 	struct resource *res;
 	int ret;
 
-	nandc = devm_kzalloc(&pdev->dev, sizeof(*nandc), GFP_KERNEL);
+	nandc = kzalloc_obj(*nandc);
 	if (!nandc)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(dev, &nandc->controller, qcom_nandc_release);
+	if (ret)
+		return ret;
 
 	platform_set_drvdata(pdev, nandc);
 	nandc->dev = dev;

-- 
2.53.0

