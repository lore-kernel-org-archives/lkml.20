Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794593788;
	b=lE5NhsroUOPrbecXRBzz4Dk7i8V4ZONXjlIoZuyuhwW6XrkO8P/YCl578N8yf1g/31x0
	 r61t+GVRowVYtnFeSNEbD5NpWmGASsh1M9aMYbukAVN4enIQfhDLhAj0zN5MJbwuE0fBq
	 3W0umI/72r9wKzUZqu/BS98PWJsFolzgWCkdEYtRCW0wugVrdqGS9ZnuiW5pVQ/LpyzCE
	 xBvv1JFpWHMt2i0OxCD1Sut83oAjHaRpAcHy0AS9m0i/fangFJZnkr8fBRRpQJ3v+zBqJ
	 sT5fOG864KbH03Oyr6kNfM/LPfmFGNGHd6vE5v1amkZOcPNPKzpGknWLJTd2GrSxlCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794593788;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=oxIUXRDR3VHKEO2P92xQzhy3CnEvQwGENDIYhuLNbVE=;
	b=Weu6utuCKtrPwbbKg1coAzmRgE7S+TznWrQEHWoY31V59QJ0k5v2+24jTLGhIDXtE5D8
	 8FEZ8B5NPTbHcnzikN79TFvZORwFT9B/UuZEUCw/Dh5b7vsSGlTfcZi/WiG00hMogLeLg
	 1Ygmqmr2Eh9M/t/V8q1vQV2OycGOCsscR90tVdkYgGXPC4mnyf2Hs8ahwaYnqkmMuAOn8
	 xdg/1uSzTjs0zUIUsgKN4u8yWcdZ5G7u3bfaMZDeN0f2jmGTsBX6/5svp9j74KYWC2RiM
	 gVLtxNpvgT/jaT1pahkXF6O/Aiw5rMznny9y0609lrStGzsBUJZyj00cQvj4s8Nbeow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Pbvrz0Yg;
	arc=none smtp.remote-ip=209.85.210.52
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFE20606F1ED
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:16:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EFE20606F1ED
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Pbvrz0Yg
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-86288992de5so1577606a34.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 10:16:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794593787; x=1795198587; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oxIUXRDR3VHKEO2P92xQzhy3CnEvQwGENDIYhuLNbVE=;
        b=Pbvrz0YgTrrO87KNDBtFt3OyI3gwckz+r1eIm6PryuLI9Hvv0yt0+a+aXswSsioDMB
         Q3kj/8v13rT4mJ/eecWAj2v/te/tybeAMDYREbwpK8Y4pwWEfNcb9t6LBIzIsTbQkIGP
         OzBCJaIX3jwAUfL2vZloIiOrjTdQoXH7U+s8HpEe7K9UQRlWiLTeitUOzNoGeBMOZP4u
         GItgtuO45lU+WY08ayua5Nq6UovgbAhiQC8rVM1VpD9RV/xGDZC+5ev2uXGSy7ptzX54
         iWe4txzeu3kcbSuiKZqPcBG5oB1cmJgQmKxD5baudPuvneBVWQ2JIU9EjnmDIwaN5wjz
         YSjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794593787; x=1795198587;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oxIUXRDR3VHKEO2P92xQzhy3CnEvQwGENDIYhuLNbVE=;
        b=o+irFwN8inZs4rNaoOnjpQNtlAyZBJ2Ui+qV1vXWyF5x7cBcvnQ52XKLd54DE4W38t
         qv44FZLHagris+aM5smnt2m9LYCQeosRWQHUTfSF9EhJgGfu7STeez6641fooUn9zQ99
         LcILoAtWHCWiGTBxQju3Fle1cg7I80QvVLE9Xd1Z4LJBkkSvac2OsPWhMJVy6UPS6wVT
         R/fU8SDLJhOTiXnTjD7IBamtfaWxyo3XF5bmuV1ot9+0P/OjzahzRlL8FYvR9PVr4HGG
         bhTfn2+sUPh9XstYj2eMQkwMskXuStLJt4EHqF7ikG24rSgT15F6vSnLdRxruSihg3rK
         6QMQ==
X-Forwarded-Encrypted: i=1; AL+hErHQlF9SWqxEj/rvclsxTsNHCv6afEWuTOxf/j6mQIsFApAbcEU/C9982MwNw0VGfQuxmuOm0pfguaEB/lY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+eRcOtfj8bZB86/IfkrtjOiE+zG9GBd3sHt5qJgRzsL9gTi72G
	FL0bcf7AZBTNQm5xxrf5Al/CVo04nv+f1MuChIDqQhLlaD3JXLmgsPuieKKnvWAd
X-Gm-Gg: AYBFou2DsVsfnjRO+nAuuKPYcttZOUJmlza7nKd4GcUjhxzsMdCb+cxrEor2UpSbh8p
	SVx5CcCafDEF92p2xa+iKV1aA/9iTBCYYSGKXa8XyGx68mFepPC50TDe5u1kT2xWSlHRQw7EfWb
	7UAurJs1p/SQhsRTDXqToQPq1WxiQWlPhCKCXClLM6gKPe94cH43TPMoC54m+oPFdRM8DbEzBMO
	xDnjNoFZVJfi/jh48nOx+KiVZG5PN4lGTpYpfuZMgMConCmTdC9+LtGyFOpwhTbyhV7jM6Qt2Od
	G9ymvCiUdAwooFNjuLBBHAXdDhJLWZ9OkRDZe4EyHaIUM8/ZcOcuJ+F2XdJN5Kc3SQG78rutN2L
	fzlTmAocaHwFM1qDjyuT+cs4Zk96jzNaFVYmVIdZqO9PYR73oWgX7gCajW4COVFhxD1KH8KJN3A
	d5XaDKFl0opuV6ml3TKnqWyye3bRvMkg5pXj9PNhY8zxgULV+c+SCpvhhr8awiCaKuuAIv3h5U8
	sDGSfTulh4gMkjzmT45Ke6TJSL4tNlFYS6qHw1bxJJ9OimhykaasdojRln0yYT2Us/kZ4OhpACN
	gIt22h0nMQ18W7hU5p3jQst4F/31inbJTjFD4jOeML1S6+sQ+klMXJHyg5HUJYcuUqFHbhlNeWB
	S0kfJnfRwWuFLAcd31HlJsGAwN6GitiTMY6RgjO6gLOuubVzigeXNGvZlyiP4kQDDYDAKYrbxyV
	89tt4zd7esT/Js71MCR4ZvkUmx5PTN+ia4JLvvaONYmGb0SwS18QA=
X-Received: by 2002:a05:6830:7183:b0:861:5924:c305 with SMTP id 46e09a7af769-8628980c4abmr1694581a34.3.1794593786906;
        Fri, 13 Nov 2026 10:16:26 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8628817d979sm3253414a34.22.2026.11.13.10.16.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:16:23 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 13 Nov 2026 11:15:01 -0700
Subject: [PATCH v4 45/58] mtd: rawnand: sh_flctl: retain chip state across
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
Message-Id: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-45-556b1d7c6221@gmail.com>
References: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
In-Reply-To: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
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

