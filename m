Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794446958;
	b=EsAg7KOWXyIeQdqta1QqJMeL9RU7sMdQjtVrxMymAkHgHEOQBjF4rVDefcsa8YyGl8Tv
	 cMEQaooRYlPD7llR4rswNrTezQvCUOwT2lWJEko3/GXjjQb5aZaUWUBegjdaIzgxi/GJD
	 wo5Ls8WWDYZftWciJEAxCG7khC4pzY2yHSVlgU+NEmvY4lhPI9GjAp7VBwXzY0jjVMplj
	 K0uwPeOEiYYIERhDFj0RclkERkzdAhajc8ASijDNDdzMPCaeHHL3bXrrWW7h2Xe/GrDLW
	 gKQ6WQDVB1uD7djVVBTDhPDQHlMMyuehonuu81K3qDNefYCHi7OmXDfSe5F6bpRGSqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794446958;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=cPYf6hAVCpQUew2+XnRE+2ErB2I0G1vs/wGjfQG7r+A=;
	b=04Lm8aZP0G6mQXIozzgY/BZhjjF75nO2LaVkRecshNDd4hTKHMfjkI+i7JFUAPxqOSrM
	 JiBtXKy6jl7MwdlSQC1O6XKKl6eJgSzzMOrbgSyCjNhPbzcTneqSPAIxrZNulL2F8JDLA
	 wVyEaC8yJqqfy6/oF5tAxE80WOs8hfd8yPFpec2qMoeggURHaI3WnpsTbzT3vTAy9IdqM
	 8e2JLmvyqyMQvb9qtBwlxMD0Df1rVMX6W/tPaFynsm3Bk10jsCMrgpUONDSmNwf8OUbUy
	 RcBr2Vuf2axCeuOjHXk5SmE5UFHdYmnn3rgFMjk8k/TSTiKu0V0+ruNWSxUlEPQDvbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ip+WYdSs;
	arc=none smtp.remote-ip=209.85.167.177
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A62196070225
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 01:29:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A62196070225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ip+WYdSs
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-56431524c22so1318208b6e.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 17:29:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794446957; x=1795051757; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cPYf6hAVCpQUew2+XnRE+2ErB2I0G1vs/wGjfQG7r+A=;
        b=Ip+WYdSsIkcd/zxMOUFntq9R9feYwtD+bIiQVAoeDjNvaspm5CW8Gd+nGAYDG0gJiQ
         huMwhdC/fL4VtnU/Zl7UBvI/ZdLgVN9OR+HwrD+3yvxth4Yf3PRI2v0siiub5rjtJnlZ
         xu0/MZJqVAaP3taYDnyqflifhotLl8jz2/SAKWBmrRA6REMBJ9TGCQ0ogrGGXZ6hzItW
         HKby2IbDXLhI+vVcXo9FT5UPO5rfvul3yCUo2U7KDx9lGr565yIQntDX/xXADxU2IYWJ
         RfqiwQK7+PPOuHAkFVrV7MWiV2iWs5J7gmjt9lfwBzttJ20mIiiyorexSJ8/wcdGzPv4
         MuWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794446957; x=1795051757;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cPYf6hAVCpQUew2+XnRE+2ErB2I0G1vs/wGjfQG7r+A=;
        b=d7WFw4jLQ9lmLKjhK6yT0882Ip03oO4m5K2K3dfWdDvT9j8GidCgkisTUtnePkyZzm
         LVix8+Kbf1KAVBhCcfUE2q/cFBUAF9Y5kIo1kI6gHqKYc6gcjr5wkU2qs0BNIm3slf6y
         Vv4RrJGYzw+vq0maZssnNuZcas3Zt1IDgg/hByAdYfaiBvAcAo6ytx/+K/GPPQM1Ytqd
         12n7gPlX84XMtpNuhPsKGSp7gGlxKLKNMJgW5WPDQep1G0NfWDRxpv3an/ZuYOaqhycx
         +BXIhEyGV5AB/0qJ+4Or2QwqgaDD9h5nVU8VSG8yDp2urS6q6jdcTjWxAHn8vzl/pRNy
         b6ag==
X-Forwarded-Encrypted: i=1; AL+hErGBUc27RoXNNJul2qD0epprTbz8N5ZRBdovpYUEnLcZs4ILU8NQbl1MESBtTBGdZvmgHQ8zn+yCXPJ0DMI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9C+QRkECXIaUEjUGaYd67/VZBBWDdkWXbhRWv5x6MRGa70Ofnp
	CoMpdK5rWS45/BUsPMUkilgg27V6UqDBw5T9d7bfqxrnMhMjPDxTDuDy
X-Gm-Gg: AYBFou0RHlDN2cozf5VTluqi1+bZ+jb3tXUy4gYPdlYfp23DJOGzJIU0DwQeqxGgMeV
	hVaWwoI7fkHkqPw3XNlNac7weMwEgWcUV9su5uXXg0rsBdph2xfYFeWsb5+9IE73iAUvvlpw8L6
	PLQZHHMBEmYXO2yZwr0yJ5mczU/J5p/rtyg3edLY8jTKFuNaLnYMWHrL52jFJGhwJVNQISQ7rA3
	1a0bCjcRtGn9beXe/YLnrTBQhBTdDhl5mKQlTF9HKLEpPEk9OoieQq2XuMc80rRqSpupUHEuQY5
	vXJxJtTfxNtGRZOVVh0jx6F+vngIMvl6QAriCBF0eH3jP5jaokNSSqTShyD6c01bocvOnBF7DF/
	rhHjgUk7Ss3EvUSHWyplgwIpmxIhsnEXxdxOSltA3bHrD9SJQQ03HeJ3/twqAq/rEkBDC0XskTq
	PgskRoOiwQkApzdS/iwbMhMQQLrPCbizNxXhXbKFWhzKZUnkhJ9KXjVnz0tCAO3OtfmdXJ56Fk4
	U5W6gZxEwEKVRLFdsbgfxsIL2W8WQe6csdqhmPratBa9JZDoMHeiQKeOWdDPbgMUaZ1AddQQ0KZ
	TE/USW6FDyTEZkkncK4/SOEbvCM5w+B8RMOrS1F0EYBfeDT9V78aOZikADXK6X1mA9PtUq2o95m
	jcAcJrOY1m/fUVEXdlA8sEXzHYHhjJaarP29z6b3UGkG18ocuxdcMgafqcSjiWS77pULn5HeFUt
	muY8uuW6hmTpHSK+yO5wvIuzU39CiPPBDgfFFc6nNhUfJr/E1rp6oyClLATIIonzWuWUeqyKQ3F
	Q==
X-Received: by 2002:a05:6808:1304:b0:53a:6769:c35f with SMTP id 5614622812f47-56b967c9b4fmr4139860b6e.33.1794446951849;
        Wed, 11 Nov 2026 17:29:11 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905738049sm6823481b6e.10.2026.11.11.17.29.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 17:29:11 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 11 Nov 2026 18:28:18 -0700
Subject: [PATCH v3 39/58] mtd: rawnand: qcom: retain open-handle state on
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
Message-Id: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-39-ce537999741d@gmail.com>
References: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
In-Reply-To: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>, linux-arm-msm@vger.kernel.org, 
 Manivannan Sadhasivam <mani@kernel.org>
X-Mailer: b4 0.15.2

Keep chip metadata and controller storage alive until the final MTD
reference is released. Unregister and disconnect each published chip
before releasing the resources used by its hardware operations.

Install lifetime ownership after scanning each chip and before any MTD
device is published. On a partial probe failure, unregister only the
published chips, then disconnect and release every initialized chip.

Run NAND cleanup during disconnection; the final core-owned put only
releases retained allocation and layout data.

Cc: linux-arm-msm@vger.kernel.org
Cc: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/qcom_nandc.c | 37 ++++++++++++++++++++++++-------------
 1 file changed, 24 insertions(+), 13 deletions(-)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index c2ccb999ad8d..3451687a2bf4 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -1903,7 +1903,6 @@ static int qcom_nandc_setup(struct qcom_nand_controller *nandc)
 {
 	u32 nand_ctrl;
 
-	nand_controller_init(&nandc->controller);
 	nandc->controller.ops = &qcom_nandc_ops;
 
 	/* kill onenand */
@@ -2022,15 +2021,17 @@ static int qcom_nand_host_init(struct qcom_nand_controller *nandc,
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
 
-	mtd->owner = THIS_MODULE;
 	mtd->parent_dev = dev;
 
 	/*
@@ -2053,7 +2054,7 @@ static int qcom_nand_host_init(struct qcom_nand_controller *nandc,
 
 	ret = nand_scan(chip, 1);
 	if (ret)
-		return ret;
+		goto free_host;
 
 	if (nandc->props->use_codeword_fixup) {
 		ret = qcom_nand_host_parse_boot_partitions(nandc, host, dn);
@@ -2061,10 +2062,15 @@ static int qcom_nand_host_init(struct qcom_nand_controller *nandc,
 			goto err;
 	}
 
+	ret = nand_set_lifetime(chip, to_qcom_nand_host(chip));
+	if (ret)
+		goto err;
 	return 0;
 
 err:
 	nand_cleanup(chip);
+free_host:
+	kfree(host);
 	return ret;
 }
 
@@ -2076,15 +2082,13 @@ static int qcom_probe_nand_devices(struct qcom_nand_controller *nandc)
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
@@ -2106,12 +2110,16 @@ static void qcom_nandc_cleanup_chips(struct qcom_nand_controller *nandc)
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
 
@@ -2149,9 +2157,12 @@ static int qcom_nandc_probe(struct platform_device *pdev)
 	struct resource *res;
 	int ret;
 
-	nandc = devm_kzalloc(&pdev->dev, sizeof(*nandc), GFP_KERNEL);
+	nandc = kzalloc_obj(*nandc);
 	if (!nandc)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(dev, &nandc->controller, nandc);
+	if (ret)
+		return ret;
 
 	platform_set_drvdata(pdev, nandc);
 	nandc->dev = dev;

-- 
2.53.0

