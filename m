Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794593771;
	b=TYZvQ37XO6WOBEnT+1mhH8pRdtqsk/HkBhvjT93YFDrLFwlui970DbO199NrhN/71+Vl
	 3Ic8xxOg+gyJqezDMy3DKGrRmRwPrbhrt/vF4Ki6FS28860u/tTMHPvMpQVTusYxD5sk3
	 Gekyo0l/TcSjCv7WT5Ir4hgO+6YWqzY/jBTlQcwjOd+A4BjO5KYcK2KrU4lgNNYn02eV7
	 Spkzg8FDeVkZ1jcTqzyRsLXJA6uOFsnSIeYVaKdOVpS+u4KsxbQMkOuxNXW3RlPVMVEK8
	 Twjvr7wkSRn4ZPp84NuYa7Dtp7WkkAlUW2jPZ/eUClCBfoytgOf6y0QKukPMcZA8P2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794593771;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=go3DmRJz0ufN3WhmP9omN//0ezXGoCBxRhZGr7MYk8U=;
	b=AZTg+kGMBosf5BuwkmxMMZrlbqfXNKXtFOO382HLUVeu2bDCHcpnWoQZHVzfZvc2pax4
	 8rlQycV5EeWY7GQNKR/t1bXrborVazahVu2PZkXCtPc64lZgBLVihikPtlG4aurLMLv5h
	 z26Sxh+NlWqJv8r4XQxrTsb73YVlRxo8oKDZXPjqwDM25Fw7qCPzSLC4e5HPDwNtHH+HJ
	 CFCmzklRFYgIUeV/gI/NAq/yRo+qYUCa9q5iP9BCZ3j3Vs87DZknQLzInePJcXnYomXFz
	 wPjNjzfBdfpKr6FO+W+Qd9xoMEYlfF+R8BNeao4w20W+XW8finNbW974CswWdCSsc6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Gbi97oS8;
	arc=none smtp.remote-ip=209.85.210.43
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A072606B205
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:16:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A072606B205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Gbi97oS8
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-7f84a55e31aso1525507a34.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 10:16:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794593770; x=1795198570; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=go3DmRJz0ufN3WhmP9omN//0ezXGoCBxRhZGr7MYk8U=;
        b=Gbi97oS8po5tcYjqc0hDBLK3f1AJyCflBjpwv+hWrtjhlCvz7C9l/9WGFDkxYLaQhw
         T6sR8QSmdzhsu9MzN+NEYvtfj/40Xw1eV1CDkOGGEX6EKvxLCIwIv1JmiRIMApIlD02G
         g3FPG94WqG1ba7+MIPjhFrAFgYPiIlp1ag/tzy5OaTqKOhoheleV577gM0Qe+ZCGw/UY
         c04sqB4nRQONPJ/RtUwi65PUT+t2kAKfFN4T97hrm0DJzIA0uDqNuf+iWmvttjC1CTfv
         7FZeYw8KRO/B1yOuMipfrfA9isfT6I2FQ51WfJ+qWpOzsjFHguR5UJkuVQ3O7yPpSJQ0
         tKkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794593770; x=1795198570;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=go3DmRJz0ufN3WhmP9omN//0ezXGoCBxRhZGr7MYk8U=;
        b=opZlM0zanBCwxPPWMcdzBXc32CZi+zYCvXShgPAOIDgnI8+zOp2IINNX2gOOVcUG48
         DdNaaRw2HnNLj+VOrJWlFKAnJMmvs9XqrgfpJvNnqpXIyOFvlZ8IIvjuNAmyimFxDeiG
         2/km387L7wNCO3WWgodq81bQVoTZE6uvifDMwEhm//03zn3nH9KeomuAm+Pc8o1GIuok
         0Xim0c9Dm42aBlLXRUUxvM2eiFhyUI/27LQVNqhmTro7b6nguVxuQadMfMpsaj5RgCxZ
         qBtSNjYO30fvUgxAFBai7LZ9lPeafB+7bxOlN+bCEzcKms3raApB/EMFypIYm/Rz7F2A
         LAtA==
X-Forwarded-Encrypted: i=1; AL+hErEbXTOYjmJWqht/FwMzVeSoss26l6yVynNhRb7nEfrZC06qN+bx2d164KQDlA5w7GG99W1UDstVmap8Pxk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+JSRwhH3FaNbQSiOiTlRTZG8IZ5J2GL3iJzOWcOl0MqN/R54qd
	aoQ5ut42yPDyPikpKrgWhnPU/OB+5VUUNp0VpaATwUA+dl9vZ3gup0n+pYrl5/AV
X-Gm-Gg: AYBFou0RoeDWoIEZM/+MYNwiWboEH6tSmUZAP01ioZwqVYgSkk1+p34wCD1vcimY21c
	YPeu5ZsgC+xdngAaQ5ixRcarKWZBdMLa4fGovBORxDaHnc9zD23KUwgD8yUSn3vmEGPu1agfXvk
	z3JYW9b6haF0CEgeqtICTzE8mXla5YQZDc7lOpSjf9bipdn5/Diq3YTUL8BsadPxwpffInP47xc
	Q6nH+JdNxfHjMnb3qNqx7WdOVfNxZykVH4jIMWcc5xcqvqPycU4EEjiKZxBRO4kuxVPViEx6Cym
	gWVx9pMIgqA1h+2TwdmGdCOiqHi5eh8xSNBuJIG9v1JTZkRi/fWrhgBAVZXy5dCxtS9WmqJxZXl
	NZL+fR36IA3ff5VauJVO0ohDpc6CmgDsbJCt5ImhJBequQhdhqLO+L+wx9H7bSFrwMNzQV/Tecn
	vqBBzu3EWwUtL/e98BYCQaoTp0+Lsr7IC8Y7HX/q5YfySfiibImRkvH43d7WCHpOGUWSn7vxjaN
	jP9UWjPssV48arwfBVZ4w8nnI+WcgHnpLKPBrv3J0YrHVMznHlLWuX7wpgzjV48GOajNO0cck2R
	qWuI6jryq000WejIp7l3w+dJUj2KQTnlopX7v0LsbVAsTR5tSnVXuVvWLPW6EupbvHT/MiEr2rI
	hvnn7kDgQ/fbPM7Oj85++/KskyW0HTsa1VMvCTFNvl6KtnUOTwp31Yj+cu/Wl0J6h7mAvvSHMgN
	DTrpBPcDdfyoEhvJh1M94RWn5fWyQW8jIYd0gOemH4BtjJkZbSJoT2MHK7I51KP8LxYlIcpJAT
X-Received: by 2002:a05:6830:909:b0:822:978:f7bd with SMTP id 46e09a7af769-862898b70dbmr3734047a34.28.1794593770122;
        Fri, 13 Nov 2026 10:16:10 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8628817d979sm3253414a34.22.2026.11.13.10.16.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:16:08 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 13 Nov 2026 11:14:50 -0700
Subject: [PATCH v4 34/58] mtd: rawnand: omap2: retain open-handle state on
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
Message-Id: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-34-556b1d7c6221@gmail.com>
References: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
In-Reply-To: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

Keep chip metadata and controller storage alive until the final MTD
reference is released. Unregister and disconnect each published chip
before releasing the resources used by its hardware operations.

Keep the shared GPMC lock for bound devices and separately retain each
device's allocation. Disconnected handles return before touching that
lock. Finish software BCH cleanup before releasing DMA and driver code.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/omap2.c | 25 ++++++++++++++++++-------
 1 file changed, 18 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/raw/omap2.c b/drivers/mtd/nand/raw/omap2.c
index aee7df4d768f..12a978f5f724 100644
--- a/drivers/mtd/nand/raw/omap2.c
+++ b/drivers/mtd/nand/raw/omap2.c
@@ -142,6 +142,7 @@ static u_char bch8_vector[] = {0xf3, 0xdb, 0x14, 0x16, 0x8b, 0xd2, 0xbe, 0xcc,
 static u_char bch4_vector[] = {0x00, 0x6b, 0x31, 0xdd, 0x41, 0xbc, 0x10};
 
 struct omap_nand_info {
+	struct nand_storage		storage;
 	struct nand_chip		nand;
 	struct platform_device		*pdev;
 
@@ -2218,10 +2219,12 @@ static int omap_nand_probe(struct platform_device *pdev)
 	struct device			*dev = &pdev->dev;
 	void __iomem *vaddr;
 
-	info = devm_kzalloc(&pdev->dev, sizeof(struct omap_nand_info),
-				GFP_KERNEL);
+	info = kzalloc_obj(*info);
 	if (!info)
 		return -ENOMEM;
+	err = devm_nand_storage_init(dev, &info->storage, info);
+	if (err)
+		return err;
 
 	info->pdev = pdev;
 
@@ -2282,9 +2285,16 @@ static int omap_nand_probe(struct platform_device *pdev)
 	if (err)
 		goto return_error;
 
-	err = mtd_device_register(mtd, NULL, 0);
+	err = nand_set_shared_lifetime(nand_chip, &info->storage);
 	if (err)
 		goto cleanup_nand;
+	err = mtd_device_register(mtd, NULL, 0);
+	if (err) {
+		nand_disconnect(nand_chip);
+		rawnand_sw_bch_cleanup(nand_chip);
+		mtd_put_master(mtd);
+		goto release_dma;
+	}
 
 	platform_set_drvdata(pdev, mtd);
 
@@ -2294,11 +2304,11 @@ static int omap_nand_probe(struct platform_device *pdev)
 	nand_cleanup(nand_chip);
 
 return_error:
+	rawnand_sw_bch_cleanup(nand_chip);
+release_dma:
 	if (!IS_ERR_OR_NULL(info->dma))
 		dma_release_channel(info->dma);
 
-	rawnand_sw_bch_cleanup(nand_chip);
-
 	return err;
 }
 
@@ -2308,12 +2318,13 @@ static void omap_nand_remove(struct platform_device *pdev)
 	struct nand_chip *nand_chip = mtd_to_nand(mtd);
 	struct omap_nand_info *info = mtd_to_omap(mtd);
 
+	WARN_ON(mtd_device_unregister(mtd));
+	nand_disconnect(nand_chip);
 	rawnand_sw_bch_cleanup(nand_chip);
 
 	if (info->dma)
 		dma_release_channel(info->dma);
-	WARN_ON(mtd_device_unregister(mtd));
-	nand_cleanup(nand_chip);
+	mtd_put_master(mtd);
 }
 
 static const struct of_device_id omap_nand_ids[] = {

-- 
2.53.0

