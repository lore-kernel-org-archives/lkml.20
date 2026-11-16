Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794810624;
	b=xmBwi+EK6KYZsm3POuoPtwxEhqT7s7dOGkpoBisaPd4Flo2+2lq4KRiv59nhnP28WdZH
	 BegopHT462hMvu96cVNbd3cWkBVBAvKZs00oi5mey40vgek86KeY2HlQh1PVD8N9u5QeW
	 BpfBrGDrzYBMBb/xfnAiJO8bIwAStIm4f0HS05DEKtEYvejMu4RZb1L0l4z/M1Lph2KuQ
	 XuodbNRodapdSdMQmd3Ubu7bcqokTZIPP17o8oBqplQYC/HEEPZAAkuNNFSWElWyCQl3v
	 6fEbUAAtiwnn8tYrThpAUdtoofukkbbs4ISExmqVPDxPxyNivai5PyQL4oUdqP5Xm4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794810624;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=xUF+yT0AtjJjyJAPAQ/XnxMMvvBmRCaUT+DgkHs882I=;
	b=fMc7Wp4co8gOHjNyX/iFowKP5DUiiqyFFvcW/MwzclBN/rjOvUjFk0IDU/bEdoPko+ZW
	 oDa1zG3AEapiSX8GYDBwbRBRpeHzWcq4SretF45DxYKkUSGSOrv/EVHnDnR81XpBfubet
	 PG5nb/fHFfzZspyqwS/Wz8G1TJ7IByfp+m5gfN5X81lwALZeBhOiNg/PWOJdX/Oqdhce0
	 SNZpx5FepDwpeCXg2tUn2MPykbP5kC/ucsH+G0MBxD3gFI1iysBgrrSha9tsqZyePpcCK
	 Cr33Pw5SnLRI4RJ16yecvq51EBMDcV2b1OmeG4klwr5DZAnXDxn3Z0STRn84WrzjxiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=i39H3alr;
	arc=none smtp.remote-ip=209.85.161.42
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AED4A60A6F41
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 06:30:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AED4A60A6F41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=i39H3alr
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-6e560e00a86so2627291eaf.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 22:30:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794810623; x=1795415423; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xUF+yT0AtjJjyJAPAQ/XnxMMvvBmRCaUT+DgkHs882I=;
        b=i39H3alrAX2RFlrloDeHJJvSuJULWxVnlJxpBvukZTGRzXYrP8kucCOxNrUo1QNK0o
         sR0/5wGqff/QrHgnxl/9I+fe1BUjDcMClxhthn5LnbWdeHoy3/MkeAnIIvhyLdaj9DeG
         9FGLraE+r29Ff+KXPat7sIvTTMc8cT3RuTFLF1dGo5XRxkcUjuYsngswsbvFoLNdmdHF
         JbI9lsoXH7asCVWKlt/M3avmA5PegxRXQu9VQPhw1DvdPVQaOgyUlSZJ/TRQoz3VYLkK
         GquP03Grw+aRu4d5uQjoufRyMWIFa9+3tdWwhsUETFwVjmNL4bzldWrny+Ik4bkzEiHe
         u2DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794810623; x=1795415423;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xUF+yT0AtjJjyJAPAQ/XnxMMvvBmRCaUT+DgkHs882I=;
        b=UVZ+6qjiwS9AzgztJukjCc9gTjeCn26bVmAIqd+XXiZHfrnbJbICU87Jxc5n2eFP65
         A5MntqEGaV0RDliTk4aN6O8sN+SW5wMt5r2kO1S85IH6suLjpTXudugV7bBHRxZVlZl8
         2QZW8wZGtzYR/y2yue6KNkW/1FMRJIk50UW5LflEvUeR1SbVuVsV+FjmW55mFuWOK+1a
         RqI09Tlg6a51vmt/biBxAbJs1Mje77qvfLMALfM69ptqrXRRvR7RuhP28CozkmKtVdw6
         TQZrC70/qhRDo4MXrrGmgSoWG2f1SyCZpnmZIJxldw9Get09UBX/BPHJGPztlDEjpQVb
         kkPg==
X-Forwarded-Encrypted: i=1; AL+hErEgMtos1xsmyb8/BaiWCxKM7jDygTliPH66orNsW568UP93jCYnGl31ktN6258yrTgiIy+vtjjkSY7hY8c=@vger.kernel.org
X-Gm-Message-State: APuU4Z94+uU4w/bJqWFM7MIzgGSsNZglSyyFhdgwvuiWc66qUyhi0CmQ
	VGPhX2Ykf3u5blF4NCzIKMzmIwluWnwKzmuA1xtm4/Fqqpqdr3kgowWa
X-Gm-Gg: AYBFou35MFf+9JzAJ/WmnJaYYibUX/q2b7h5jaOMFuG/KTIX60QH57/z8+ZjaJZrYh8
	hWREI2Z7NGv1ZOW2AZ6xR/B0hZpRYhDHSc8oZ3ty9+iOt3Ue8MyDvpViqW8kdL+Bn2Klc6DwfVX
	nRWBwxh/ho/0aOB1PJw17RFXRhmGVSbNucU+G1Cz5mNPHw966z9bChQeuWHS9CDvbrGimtC6Sw2
	2FR/ErEqPu291gNK4HxJzNpkqZMEYHyiEDNBaOkcgdBW1SIeOvUJutgHMK8aeAVs+DITaqUHaSI
	0cTtOvqFLQ3Rt+ZUaqlnm1J696PQyZUme7/IB7DuIqyakb4AJpI4yxBr+Xg5czar/woI6em6Pm6
	78eH4SnbLrgRXij3XqJFO3irj0nOpK5Sc3EcfN6Y2qj7ix75+AbXujo+mT9UM2AX0imxnj1EAM4
	kgnTSrKckZ5dQkMoF+lCSbDAVp+zE0lSgsUE0M3poHPmJeWf8gZSHVay5jxf34516PdNgiPb9vW
	jkfWxHnHO/py9x/R0/7N4b1xktUxaCIiE9QBpzkzfP3zfEA3DTLx0MgqoedtDgqMbgkRdtCaovE
	235jUtNuUiEKulM/EPV2uBryMEea80tpLzWF7oFeQd8/Kl8QEUZsPIOWFuwu4/aTK5bU9JcsYAl
	VhNm4og4OEE/pYZf0lfapbipnZg5wuuABtLx3t0SVdf+w7rBxBxg6LnQeHWY/bDDxxfYWL8eDXD
	ID5dRcM+C1WyBz8J7vfbgcGFsIkE4NHXBJsuv+yxIK7CPgmJz7pSE=
X-Received: by 2002:a05:6820:55c7:10b0:716:cbdc:4fa8 with SMTP id 006d021491bc7-71ab5072f16mr4223730eaf.41.1794810622672;
        Sun, 15 Nov 2026 22:30:22 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab42c41e9sm7994558eaf.6.2026.11.15.22.30.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:30:22 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 23:29:45 -0700
Subject: [PATCH v5 30/58] mtd: rawnand: pl35x: retain open-handle state on
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
Message-Id: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-30-cbc49c5c5e74@gmail.com>
References: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
In-Reply-To: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>, 
 Michal Simek <michal.simek@amd.com>
X-Mailer: b4 0.17-dev

Keep chip metadata and controller storage alive until the final MTD
reference is released. Unregister and disconnect each published chip
before releasing the resources used by its hardware operations.

Unwind chip ownership on registration failures as well as removal.

Run NAND cleanup during disconnection; the final core-owned put only
releases retained allocation and layout data.

Cc: Michal Simek <michal.simek@amd.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/pl35x-nand-controller.c | 36 ++++++++++++++++++++--------
 1 file changed, 26 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/nand/raw/pl35x-nand-controller.c b/drivers/mtd/nand/raw/pl35x-nand-controller.c
index 537387014e2a..e5d86d72faf3 100644
--- a/drivers/mtd/nand/raw/pl35x-nand-controller.c
+++ b/drivers/mtd/nand/raw/pl35x-nand-controller.c
@@ -1057,22 +1057,24 @@ static int pl35x_nand_chip_init(struct pl35x_nandc *nfc,
 	struct mtd_info *mtd;
 	int cs, ret;
 
-	plnand = devm_kzalloc(nfc->dev, sizeof(*plnand), GFP_KERNEL);
+	plnand = kzalloc_obj(*plnand);
 	if (!plnand)
 		return -ENOMEM;
 
 	ret = of_property_read_u32(np, "reg", &cs);
 	if (ret)
-		return ret;
+		goto free_chip;
 
 	if (cs >= PL35X_NAND_MAX_CS) {
 		dev_err(nfc->dev, "Wrong CS %d\n", cs);
-		return -EINVAL;
+		ret = -EINVAL;
+		goto free_chip;
 	}
 
 	if (test_and_set_bit(cs, &nfc->assigned_cs)) {
 		dev_err(nfc->dev, "Already assigned CS %d\n", cs);
-		return -EINVAL;
+		ret = -EINVAL;
+		goto free_chip;
 	}
 
 	plnand->cs = cs;
@@ -1089,23 +1091,34 @@ static int pl35x_nand_chip_init(struct pl35x_nandc *nfc,
 					   "%s", PL35X_NANDC_DRIVER_NAME);
 		if (!mtd->name) {
 			dev_err(nfc->dev, "Failed to allocate mtd->name\n");
-			return -ENOMEM;
+			ret = -ENOMEM;
+			goto free_chip;
 		}
 	}
 
 	ret = nand_scan(chip, 1);
 	if (ret)
-		return ret;
+		goto free_chip;
+	ret = nand_set_lifetime(chip, plnand);
+	if (ret) {
+		nand_cleanup(chip);
+		goto free_chip;
+	}
 
 	ret = mtd_device_register(mtd, NULL, 0);
 	if (ret) {
-		nand_cleanup(chip);
+		nand_disconnect(chip);
+		mtd_put_master(mtd);
 		return ret;
 	}
 
 	list_add_tail(&plnand->node, &nfc->chips);
 
 	return ret;
+
+free_chip:
+	kfree(plnand);
+	return ret;
 }
 
 static void pl35x_nand_chips_cleanup(struct pl35x_nandc *nfc)
@@ -1118,8 +1131,9 @@ static void pl35x_nand_chips_cleanup(struct pl35x_nandc *nfc)
 		chip = &plnand->chip;
 		ret = mtd_device_unregister(nand_to_mtd(chip));
 		WARN_ON(ret);
-		nand_cleanup(chip);
+		nand_disconnect(chip);
 		list_del(&plnand->node);
+		mtd_put_master(nand_to_mtd(chip));
 	}
 }
 
@@ -1153,12 +1167,14 @@ static int pl35x_nand_probe(struct platform_device *pdev)
 	struct pl35x_nandc *nfc;
 	int ret;
 
-	nfc = devm_kzalloc(&pdev->dev, sizeof(*nfc), GFP_KERNEL);
+	nfc = kzalloc_obj(*nfc);
 	if (!nfc)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(&pdev->dev, &nfc->controller, nfc);
+	if (ret)
+		return ret;
 
 	nfc->dev = &pdev->dev;
-	nand_controller_init(&nfc->controller);
 	nfc->controller.ops = &pl35x_nandc_ops;
 	INIT_LIST_HEAD(&nfc->chips);
 

-- 
2.53.0

