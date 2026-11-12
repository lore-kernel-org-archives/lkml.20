Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794446964;
	b=ZYJieEQ4cZSUFCN8iLe9QLbDcvXzd19v4256F0ZOcIdHnx24XcI4KJ0eiUah/huzTuuc
	 fbbcoK5mlwezagFxD0QSiPzfN7LQuA4bcAeS13dSYxRF/QQpuSp9fZ5u8MpaZSwlRl5q0
	 SW+wLMi81+AVD4Q8eqruBjzeEq/6nObA7muaeTiijpLfh4fFvGFxK6nMvE+lVsS58WE7d
	 7SoKIT9/mEGZ62ksRiXP1SWFV0QMXTnNouFsReHCYHV0tB3bqCHPxEy/AOZAPjQ1yupe1
	 rmbPrVXcjsZ6SpPfs31MgEnuxNTxXz0AtaOhcXnF5Ik7PTnhCxHqL9HylotdAxWL5Tw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794446964;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=oxIUXRDR3VHKEO2P92xQzhy3CnEvQwGENDIYhuLNbVE=;
	b=HLdwe7M/6bXHj7QhyODQeWIaUe6TT5Cu0Ifoi7arjVu1sEJTMftX0vBZcibHP2N3s/lA
	 DJvqAsRCqgVFr3rDPFHR4j/C0B+7+gke8AI7ADyXTq0ex3FeJ5TB+M6gqxQ03e+D535dl
	 0a75DKzRMyCI0nCfwRDvwFcjSrWkOZQiPpbpYROE1NgxraUgJeWIIcdvQ5CdozDNgPSMF
	 EX//d/9QG492qaZ0c4XF5ozwomREHYNNuHoDtrGbGhyXIOl9wNqYdeh4a8V/xuR9Q1Eds
	 EfpY8CtV1RZD0vwgSqbLP7Mkh6vuBYCdjrUk8UpGDnikBWPcwnef6JTDOBhJeF1UEDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iSmPy7nk;
	arc=none smtp.remote-ip=209.85.167.171
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFE816071AE5
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 01:29:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BFE816071AE5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iSmPy7nk
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-4f699fe49b3so2449810b6e.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 17:29:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794446963; x=1795051763; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oxIUXRDR3VHKEO2P92xQzhy3CnEvQwGENDIYhuLNbVE=;
        b=iSmPy7nkItA2GOtIAfG6Gkz+CDz/HXk+/WUiK7WecvbnwIpLYm8w8MzyYaHDHadRlA
         /UeS/QfRT3ejMGOYXFzwyLwlNa6FdDn+Qi24K/wMS5yCOx/y7RMXad+yN9JA+t4g/xau
         OcZIgOedU2f1JBXSYjIc9zlv6MxgNU0cYAL1CNdATByCpCPQIsHzgPoYc1L9L2oz77Wi
         UmzFVLMP9Fw4lEJURrGeF1i1SnWD3nPvoNCAn1Y/Vj6W1ZcDkWq0KQ811zrQOCk7yoWm
         ihvWodpZSvAAbJ7/bPbuMBKX1GIKzIJq2a/WitzPYkyE5nU3/bT2e5XCDRcfVBSQ/xRW
         8SSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794446963; x=1795051763;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oxIUXRDR3VHKEO2P92xQzhy3CnEvQwGENDIYhuLNbVE=;
        b=lEIvBxtgMy4dKkOhvv+dyjiF2V4NgIILcIddKjpT3JELWSX221Y5FIX1yqA+e120Ei
         3SaS4r2uLJ1JDQs0EhpCSDH2Dx5iSNfJYMmyCjKC7L0mawxIYnofpTrGL9oxP/KkVivt
         ajl2dPEnzwNIcSwUCN9oLRhZLrQsHuw4Oy3w+J4ZTpw68YbrxNJUxbScugBGUtr9XTpv
         b0UylHfwdedgjxzqWF42ZNFZE0Of3yp2HVZRbtGkRvSo0DMOE+P6LE+u9Ex0/In7wjbX
         FNHJb7qVxB9doJOtRlHUWVvcjgBCCP7gxqpyNBp/5b0HY9y9iTuY8+PtbeW4j/9YTILw
         23Ag==
X-Forwarded-Encrypted: i=1; AL+hErGmBcHWT1TJOI6X7maYVhrSmE9MrHjXIBtrNQEpAteNU7DVmdxiM+AFp48MmWpTyjGswcvEksQZsrsfzz4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+dH9uIXeLRPY0NGNzC6mRMaihKP1Yi958ca1v6DPjkGHoYd+Xo
	YcREIqZ5yhbclhnTH6qM9P5rQrf43y9jXCwZJvQ8rH53W/VzHRx7/Q/h
X-Gm-Gg: AYBFou1Lhg9cdc3sM4d5jSQy3vVCu5vJb3TQWShtT161O4Cz2fhlOUbL4+VpMXUipR1
	kNsKaQvWjKY+qd/fAnJATnrncrpuZVWLuOTcV3Dac0fp5L4RZpV1Vi0j0aS6u8OJA1/KXPZtt1Y
	6mVNmk7sA1rpPAHg5JMkdQ268n4pAToJ3cNV0ENucLq+sUwJII1JUkqRYHX0hvOXCh5g87dP4fr
	bCT/gWmpMMJqLwKS07oq8MTUu8Eniqts8qos1nlGiwdkg7Vb9ynEaXcnkjUgZ/gjsWi9hTLYj7A
	3Mpxq9odb6F1P6RW5RllIHk1vYnUtGiK61FtsDjtKRj/84Buq1x5WGwaxgqKN/ka50Z/qB/yvKA
	O9xDGcJT6ZhSBuvArJReLoL2lYD3Mbvqhcty20K7nwpRF60/CNbzxFqH66fDNi2DnfWq3Z/c8/F
	8UBpb5qkd/zlWIHps3DMPBB8uN3m3T532DnG6MZ5mWI8z9jxwhSjea/nNJylyfSfF/Yn92+t7b7
	FjiVYz3pHtEyS/pwCp94kxaleA15Q6C+HAExWbRpYutCfWHvQbrDD4guWNlr/PZnRsKGgzld7FF
	dGyFdJpNhT+PmaXjGAN7ZGA1Vdm7cb8k2w3AbDkbBmG1vn49pOU+/nasZA1uPn9jV6neahaSEFu
	OLQ1EDCZLgZD8mOXUO2KD1JPH3il467O5ZBQu8arlMUWLj+F6C8zNF1nAkcx+Xjd5aPIyWgorHq
	+KQsKzFWbaN2JHtB9NEX4Lf8tVSoKFeR9puzKsfkBmZjvIrXxdDkyL
X-Received: by 2002:a05:6808:30a4:b0:4e5:c2b4:33a4 with SMTP id 5614622812f47-56b980309bdmr4080526b6e.50.1794446957962;
        Wed, 11 Nov 2026 17:29:17 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905738049sm6823481b6e.10.2026.11.11.17.29.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 17:29:17 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 11 Nov 2026 18:28:24 -0700
Subject: [PATCH v3 45/58] mtd: rawnand: sh_flctl: retain chip state across
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
Message-Id: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-45-ce537999741d@gmail.com>
References: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
In-Reply-To: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

Unregister and disconnect the NAND chip before releasing the DMA
channel. Retain chip and controller storage until the last MTD reference
is dropped.

Run NAND cleanup during disconnection; the final core-owned put only
releases retained allocation and layout data.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sh_flctl.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/sh_flctl.c b/drivers/mtd/nand/raw/sh_flctl.c
index 36ba5b3da3a0..b230f5ef448b 100644
--- a/drivers/mtd/nand/raw/sh_flctl.c
+++ b/drivers/mtd/nand/raw/sh_flctl.c
@@ -1119,9 +1119,14 @@ static int flctl_probe(struct platform_device *pdev)
 	int ret;
 	int irq;
 
-	flctl = devm_kzalloc(&pdev->dev, sizeof(struct sh_flctl), GFP_KERNEL);
+	flctl = kzalloc_obj(*flctl);
 	if (!flctl)
 		return -ENOMEM;
+	nand = &flctl->chip;
+	nand->controller = &nand->legacy.dummy_controller;
+	ret = devm_nand_controller_init(&pdev->dev, nand->controller, flctl);
+	if (ret)
+		return ret;
 
 	flctl->reg = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
 	if (IS_ERR(flctl->reg))
@@ -1187,9 +1192,15 @@ static int flctl_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_chip;
 
-	ret = mtd_device_register(flctl_mtd, pdata->parts, pdata->nr_parts);
+	ret = nand_set_lifetime(nand, NULL);
 	if (ret)
 		goto cleanup_nand;
+	ret = mtd_device_register(flctl_mtd, pdata->parts, pdata->nr_parts);
+	if (ret) {
+		nand_disconnect(nand);
+		mtd_put_master(flctl_mtd);
+		goto err_chip;
+	}
 
 	return 0;
 
@@ -1207,11 +1218,12 @@ static void flctl_remove(struct platform_device *pdev)
 	struct nand_chip *chip = &flctl->chip;
 	int ret;
 
-	flctl_release_dma(flctl);
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
+	flctl_release_dma(flctl);
 	pm_runtime_disable(&pdev->dev);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 static struct platform_driver flctl_driver = {

-- 
2.53.0

