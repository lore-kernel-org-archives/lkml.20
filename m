Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794593725;
	b=syjmKkxu9vr8jZaVZgtJfkFKuIJMtoKyfOCUlYX6opYKgk50pj597Nqmq7Vid2XLow+g
	 FiezJsZjn0UBm+MhxQRXnLiBDgTJB0kVriLKV064TOZ5z8i3TCmXe2G2+Tj4KixADhd+8
	 +IEk7Mbgmr/clf9y8n5cDUxn5OAqKdhmuYb/SH0QFD3I+XYzBUtFkiZUJth56q78WYQ/9
	 VwW/MyhAdQNZH4lDq1qKHM5CMzEDMTPxyfENQ45ubtNGJeJwQZkTYBJwi4oVKhl0u5DHQ
	 lIdV12ih11VR1LuBzbf+bAnzGm0X8gikH34O8IVAX6bXbAvNJonuBe7REPjFvc8leZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794593725;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=pCH6ltMRkGhTexZfJVTK7WEYzKuilKml1/PSTmzk1ak=;
	b=yjgenwIdDJbB0Y878v9mw5z9jDKeP8E88cNs7YFLabNlek4kLqMs+y6TpatJxFdCBLTZ
	 pqlvmF//7DbzcHqb5fezUh8HGXkHVo2B8QZY+pxdG0pRQTgAt/SYVCCEy2eVxzWFjMYG/
	 yOuJIo+ky3Si3RaXEXK4cKnqwof20ZS5qW8dD2ATstzWX34Q3eCw1QhEhlygyMxpnSeW+
	 3T7tUaWU1xsFAMoFyc26+jVagllNQsHxBPDjk4IE9nwGn+gtdrgFz6NG02xBLa+wyoBrM
	 bimoO0lCppfnHF8+5/lA0wVU9Yw9oU75z9FHEFexFPqbMsc7fwhQhNqg7pQRJhVqnhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="X+/3V5z8";
	arc=none smtp.remote-ip=209.85.210.54
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F301960A261B
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:15:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F301960A261B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=X+/3V5z8
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-85a5455bd3cso1378794a34.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 10:15:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794593724; x=1795198524; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pCH6ltMRkGhTexZfJVTK7WEYzKuilKml1/PSTmzk1ak=;
        b=X+/3V5z8VsIWdRAS0MhSP5Je5advv3DnQnYULAs89xoqOpDD2RJLFt76g3pLXBwsGo
         azZJjTbS9IGTF0ThTZM1rFFOINNZSV8OR8OurAUvunJYzP3b70/viBIdP6CFM4GhjdfH
         /6ZjZLwoEWACgvjFAisLkUE6D/BgpASbgVahoPCeh0w29A8y0fdEw36KDqGit4NDA5tR
         BrrcYdzQGhYeoW/W+l1380zC7ukfE9GBYXKv7U05oHgTbPDc2NdCQC/kx9Lxwpmv826L
         Wrd4fv1e6kt5U3rj/JYi+vNiTxGfhffJuJIfkIWZG8Z7pDGR35+QGWafb9VOTexCR0iq
         +wpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794593724; x=1795198524;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pCH6ltMRkGhTexZfJVTK7WEYzKuilKml1/PSTmzk1ak=;
        b=yHInfKL0P6Q9aIC+rI8uYn7EL22ltG1KYo8oNHBjT71TlQY/MjSYEHDLuSgcXsUPFD
         NvRMY8NCi/X6bS3l89O1sr8DB3gC50LHxNR3ahZijXphANdI6H219+VDvbF8wrurG2n0
         tP46myMcFHP+YxEZGHLrQt6KdGH2bJjD7c0hKuox+dVqyDtOtBLsIHz3Dr7F7A05JWA+
         5qbQhpf3HPAKbLCY2mjo5wR7DAZHRwK/9rfXqIBZSE6Oz2FfTN1jxcwWEEp4eWk9Oceu
         Anj+U6DFA7TY01/kqK8PV6Moyfn40MvoTzEhfbyfUylwyrzbXPRVRF11vTiWuQ1U+Yp5
         dizw==
X-Forwarded-Encrypted: i=1; AL+hErE0q/6rj9OtXmQsVXtagssk6N1RxJbR4Yq0r0h1etli4RnmUvupOx2JrmZvMvICv8GjguDp9qAHwwATm38=@vger.kernel.org
X-Gm-Message-State: APuU4Z9INBTqCgLZSDfUZYlJXBm9aHfAIDI/1KIXNufz+h4jmj+c3MMV
	ZDTXQ9YSnOuH6Lseps8CHwiv8BHrCdwg2k7sOwcUSZ3Ea/jOLmbfQs9u
X-Gm-Gg: AYBFou1XdCRZ451dDjia3ROg9I8kRahQhCM6G0JSA8dYJ9ZUSRrQc/cPjTX/VqzkSRx
	pz6x96MKklAerV4gGujZPQVj4fJl0C8maFohLDlceYxLiySuKvUXMDK+vJ/oM6rCITEN9GUF8jT
	+HBIDXjcXP8lZ3ztgiAgpekUrRkRVyoS2y3A/vz/mHQdQ21vyuLWr8UTkqfbriAB9oT3fDhelIK
	k6WvzkrPq7cWvrfRH9xFKyrw6t0vgxY0ypOdO0PijHODQJiDmFYBRDwyzkGViTd0a7VsPcB+DDc
	ftrvKau4OwiSiZEXHTIOH3we61oBOe7BTyd3usakr809B/OTMb4sq2EFlsIPutjbFFC2EXq2i/0
	BruOak4UoPIdruI6x6VyB7/s5qWrprcFLbkBtbpHDuqGcYr0v5dixA7voZT8eRfzkMxE+4ejIo7
	WTHV5yI5HicNIXhWbEYzH1NpswqsaCj5nGvbwt96NY6joPltIVpwf53+60rJynzIIq+ry/2B/Ba
	EwhgYMcn26xc0CLtV/ermkZNfkWpQLBKHzuooUJzHBPSNYpO19Z4RoXzEzfj+DTLQPT5UMGFCOA
	LELlHMs1/PhMuvP3CvmDIny4Mv8XLHYQJzxEPyxE4adINiFF2D+cZoFX3EkA6GstSGQOaaIFxXB
	0VN6GhfJa4zuTsp2Mc+LVQQxWUzUPl/Dhz43l7fI4buE1T6o0XhfMRrgchxNTGZ+RWrPaaoN70P
	4LKSfV3RlKp2azIJY+2lURgOwOfQjCXkaeIjKkPlFxBN9LPhchZU3+LL4znVzUMxjLjAKVDjgz
X-Received: by 2002:a05:6830:264b:b0:828:d647:3324 with SMTP id 46e09a7af769-8628985318amr2953908a34.13.1794593724048;
        Fri, 13 Nov 2026 10:15:24 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8628817d979sm3253414a34.22.2026.11.13.10.15.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:15:23 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 13 Nov 2026 11:14:25 -0700
Subject: [PATCH v4 09/58] mtd: rawnand: gpio: retain open-handle state on
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
Message-Id: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-9-556b1d7c6221@gmail.com>
References: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
In-Reply-To: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>, 
 David Woodhouse <David.Woodhouse@intel.com>, 
 Russell King <rmk+kernel@arm.linux.org.uk>, Mike Rapoport <rppt@kernel.org>
X-Mailer: b4 0.15.2

A retained MTD handle can outlive GPIO NAND unbind. Drain and disconnect
NAND operations before disabling the chip, and keep the chip metadata
and controller lock alive until the final MTD reference is released.
GPIO and MMIO resources are still released during unbind.

Also release scanned NAND metadata when MTD registration fails, using
retained ownership once a device could have been published.

Run NAND cleanup during disconnection; the final core-owned put only
releases retained allocation and layout data.

Fixes: aaf7ea200004 ("[MTD] [NAND] GPIO NAND flash driver")
Cc: David Woodhouse <David.Woodhouse@intel.com>
Cc: Russell King <rmk+kernel@arm.linux.org.uk>
Cc: Mike Rapoport <rppt@kernel.org>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/gpio.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/raw/gpio.c b/drivers/mtd/nand/raw/gpio.c
index d17fb2244923..2a8c44865636 100644
--- a/drivers/mtd/nand/raw/gpio.c
+++ b/drivers/mtd/nand/raw/gpio.c
@@ -273,13 +273,14 @@ static void gpio_nand_remove(struct platform_device *pdev)
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
 
 	/* Enable write protection and disable the chip */
 	if (gpiomtd->nwp && !IS_ERR(gpiomtd->nwp))
 		gpiod_set_value(gpiomtd->nwp, 0);
 	if (gpiomtd->nce && !IS_ERR(gpiomtd->nce))
 		gpiod_set_value(gpiomtd->nce, 0);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 static int gpio_nand_probe(struct platform_device *pdev)
@@ -294,9 +295,12 @@ static int gpio_nand_probe(struct platform_device *pdev)
 	if (!dev->of_node && !dev_get_platdata(dev))
 		return -EINVAL;
 
-	gpiomtd = devm_kzalloc(dev, sizeof(*gpiomtd), GFP_KERNEL);
+	gpiomtd = kzalloc_obj(*gpiomtd);
 	if (!gpiomtd)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(dev, &gpiomtd->base, gpiomtd);
+	if (ret)
+		return ret;
 
 	chip = &gpiomtd->nand_chip;
 
@@ -345,7 +349,6 @@ static int gpio_nand_probe(struct platform_device *pdev)
 		goto out_ce;
 	}
 
-	nand_controller_init(&gpiomtd->base);
 	gpiomtd->base.ops = &gpio_nand_ops;
 
 	nand_set_flash_node(chip, pdev->dev.of_node);
@@ -374,11 +377,18 @@ static int gpio_nand_probe(struct platform_device *pdev)
 
 	if (gpiomtd->plat.adjust_parts)
 		gpiomtd->plat.adjust_parts(&gpiomtd->plat, mtd->size);
+	ret = nand_set_lifetime(chip, NULL);
+	if (ret) {
+		nand_cleanup(chip);
+		goto err_wp;
+	}
 
 	ret = mtd_device_register(mtd, gpiomtd->plat.parts,
 				  gpiomtd->plat.num_parts);
 	if (!ret)
 		return 0;
+	nand_disconnect(chip);
+	mtd_put_master(mtd);
 
 err_wp:
 	if (gpiomtd->nwp && !IS_ERR(gpiomtd->nwp))

-- 
2.53.0

