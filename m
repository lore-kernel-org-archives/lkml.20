Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794593778;
	b=dYhZcESEtskEyDbugUWczYBpSWtxlwSKfzGXOMr8CI6DKny5xOqJYCdpwoiQkAsb1ct9
	 sdUfD4MJD5x2uQvOLcWe9ZQGg9Wc4139yNwxtnY0AFZKvxBt/fUO0XmSGw4X2ley1oKAz
	 0rXl+Rsuy8Y6z54o4Ltjyz6oCEE9xOYg3uJ7m9vCAqDPe5kp0J6vZFVRYg5BdfOG4ZrRm
	 DrOAHMx0tfDpOPgf3WjOJBCGqhI24RkmnLTKXkGwsptNIfoBdHAMAUsR+CYptmyn20L5Z
	 Y87dnxJo99GsiCMbWazohhVf3pQRZQxfLIuLbnahWHJ/pyJtvMmeIK+bm32fsHDxW0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794593778;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=cPYf6hAVCpQUew2+XnRE+2ErB2I0G1vs/wGjfQG7r+A=;
	b=3kJjg+DDDkhRQeXi+2F2/0hP4XkzWahd2agZt5UVEl5LaXtwF2fLbhf50deN48d0pKem
	 ojDV5wc0TftEfhv715u305sjxKRnP28JgGd40MCaR0wseWbWaH15b8193TnQRYat7cOtg
	 xNuf7afOFMsB6YnOtHBEebt/m2ipDJQOOE1A/aG7IGS3EFy3/wxedWNn31vQq9jZxdbrS
	 U4TvLNWmKC7NTaPEcrFPhNqW9RE9KwFDhtd7mPD14v4SCY9Sg+FL4+K2Icwz6t+QFVqqI
	 47b0VBZdZ+nrOgmH80a5T50sqDUp7fDkJEb6XNM3MewO2Dys+wd3LuZqo8GKH38fupw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gjsk1ij+;
	arc=none smtp.remote-ip=209.85.210.53
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E81DB60A3825
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:16:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E81DB60A3825
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gjsk1ij+
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-8490a7d6696so1580886a34.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 10:16:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794593777; x=1795198577; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cPYf6hAVCpQUew2+XnRE+2ErB2I0G1vs/wGjfQG7r+A=;
        b=gjsk1ij+TMXehC6idcCFSaAmIE4QZkpthjx1TmCgF70w4d4JMLkwZobwuAC+RLkRLn
         DgZZTPjsBk70CiiL5c+DrmT7kekaOsf24gkixesUkjxJYwjaQD8HCtEz6x28s7hox5NM
         igCCXQeMrYsGoYrvDC26e3H8Y5SBb6hKxmp1Qws6Q2vFsPFFqLThA5efjyKkAFfb4QN4
         IQmbsuNxNg7Q9kTqzsSOfn+kL5vhJoO76O/2pP6NmGfyl+DqqSWKntjx8ekDZehNAwrm
         /55fwPZHxW23wiep42tb8TzenYqP5QFHrRp8lWU5J/0f9q/vZniOxzSJ0/ueq3k3mITm
         98jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794593777; x=1795198577;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cPYf6hAVCpQUew2+XnRE+2ErB2I0G1vs/wGjfQG7r+A=;
        b=jB3lP455sBVFZAQtlx7Ai5ygYJCLib0MrGHPAYN7OqXI5clmQa+14e5Nzg88qlfh4b
         Nkg7CfJ9Gt7cAeD5dpNAmcST+e4XTp6xQLxMY4ug3DMyAeUTbQMnUDXXMoRblOZ1vHqf
         AVpsRoes0xln9xN3wmYG1U4bMXpYniJXmfPIFoe3Rr9F9mRePOlpVvQyG80Femd61jEV
         UomPSBDgcewjzYI4msdk1sig345C2P5+UU9y07Tz4+jnOJlzdBErsAXAWApZ3Ob7NL0u
         Zscao9YOHOzAIsb80vDDFOp68RgEdBn0WTTNdNOwCCs2m26Mc8TWMK8Taq7EAe0P62UJ
         gS9g==
X-Forwarded-Encrypted: i=1; AL+hErFgPQHpCpe5/B8O26ATviHSGpn6wX9eNiceCQpizzAx6xohGpm4i+1sql911HM0a+XFBIUmDo0SOIf0R2s=@vger.kernel.org
X-Gm-Message-State: APuU4Z9yUCvSGJZdpCQ8kgInZ+NIG5NBKKsL2kOsu24h1swJqqwiEhdi
	g7y9LRJ48178Eu/3MuYg7uZkLGXRBcp3uFTTwxYlmOjXcvyTAlR85w0BgHi1HxKO
X-Gm-Gg: AYBFou3iqiMe4h/t2y0ZP4L+pKrFxMVE3bIVSrk3wsLSVgs4Dpu+HpRYDxi5SVzteRP
	WcYFA5tozlRHjtaadXI7wgima1g2mg65yWYOLgDZfmHIA8gqtuDRvzObo0Sg2KoDPIzgLqeoDlm
	ZU+wESy2rcuEqQoxLxwL6xZHy2hTvnV1muETELM9P/x2VLedQuRddMQKa6Asx2YJo3UopcFh2kf
	5pyLacnusjUKpifKbHqdms6LuIo1iE1Xc26jy7BvYb0kPjqAldNBwH54NaxFT3ZGjJcxnRGWeJF
	J1N8Z1zLECttR5Zj+pJBiCdUVxlY72681Oao+DgXKFoyJk/c7HVsn21l9zjQBlR/xeggwAADkUD
	qAEe9g78/P6HDDghKG7zM+F/uuzTw5RLhk7asQo0XjINxSlKaganr04rj6Sx4igXRnHTte8jULO
	hh3P1WFu3RE/1YmoyqRAl26FzORdazv5pSJftytw3NYtluq6QDS+cMEIdpgKh1TC0Rtt8aryuvq
	R9LPrirx1IiJUFjsJdEQRhZ/QO03ZyUyQ6Oe+gJFxbyV15pxjP9mfN2LIsa6th1q3+0FB9E1zIK
	+W6UgVgXtF6GscaTMgFNvIRQ1pJFK7/YNajorawD73KImezcu0tsDSSDGX7FQbxzoHLBQfltSFd
	wf6lwVIFI0QlPJbILpc0oBPuJvdHisQI1NLpNHTptOBU1z5nQyb2tH5QKGVoC1QoTKzoZFUxn+n
	DyzQHPDj5LyW4OhTVY2vCwdA2CA1sw7mY3cSnLL40z0WaLXUk/wF0=
X-Received: by 2002:a05:6830:3491:b0:829:2866:3106 with SMTP id 46e09a7af769-8628989b101mr2619090a34.21.1794593776899;
        Fri, 13 Nov 2026 10:16:16 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8628817d979sm3253414a34.22.2026.11.13.10.16.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:16:16 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 13 Nov 2026 11:14:55 -0700
Subject: [PATCH v4 39/58] mtd: rawnand: qcom: retain open-handle state on
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
Message-Id: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-39-556b1d7c6221@gmail.com>
References: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
In-Reply-To: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
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

