Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794593790;
	b=hswkkibuxlSkg845vH0OcVzw4BIFBHeyy++AP2LMXCIiNneg82ozecnbf0RKm/OGyzX8
	 C8ZJWXi0CrzhfagbxBc+3kUK36USwYW/jzC6PDX0cAuGa6ZcGEh0k676nyCVSP8Dktol6
	 /4IdMv8zhybQpIe6zfYivqTH69SZdFbu/uQd5Wd/EvbOKk6eAf2LGLPEsotKnPoczbPow
	 7DZafZXSckbdM7b/EqMDC1aMTk8pWPdw/1m3LLzzeoGdXq21ziMZChSAYTkYOWDNHE8Oj
	 oG3sozPSHmMuAw4RIFDwh3uVeSdRdJi+UOlVKgggHFEZYSQxO8ugb+i2fmWctbv9zrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794593790;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=bjOPI+nS6OY4/J1CJwhYrkDcrP31GfwK700MsRJ05II=;
	b=ZOMOoLECpzNWsOKBAzpcD9cOzy9jrp+Y1GiC7TJTli14J8MiAil9VXHawQi7+jPd2xlt
	 tYr1mYjj8oEwP6zNUuqq05gyM+dj5NzqssVxqteA95+5pKXW/UQNAru1NWflwq145aHGf
	 6Ln01GTvFtIFvifxINdgVLI6i/ZaWMDYxoYDXVC8bSE7umbgTyJTChMrW0+TJfkfSakMO
	 wKma5+Hv9Htb0BXrKnrPoyAXfvWU1IA9rnfkLHHoZqjptQCEcwMbyTLm+fmSz5Jk9j9hO
	 s7cRgGkWm64RMDixX5dYiy4rMHSdoxgX0rBPqtvl3nSicIg/CnDRtneqW82FBVfcxfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DBmGDNlz;
	arc=none smtp.remote-ip=209.85.210.54
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F1DE606F1F7
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:16:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F1DE606F1F7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DBmGDNlz
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-86288992de5so1577641a34.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 10:16:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794593789; x=1795198589; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bjOPI+nS6OY4/J1CJwhYrkDcrP31GfwK700MsRJ05II=;
        b=DBmGDNlzMG+ATU+KKkERGhlAke7/bNUSXlj57TA8IFUjTT6XHKdPO3KZVQI9EleiaU
         J0MVZ4Xm/2FsYTr34UJSswA8rN3IEdnhGr57kVAAaKUkbnqvsx6j4WaU9TBSotBWKYpo
         7M2WBxrguQ19bIOKjRnk/0pl1ZlRI2t/nG3rm7USpiTqQ8LbSKTeqqILIFrhzBrOQGLZ
         j/N8CPuZOPiT6xdhPYgh7KNHJyxgDZtTM5KflKkNpb8/2LJAIxzwa5LrvqVMih9unvmN
         ms1pP/wpudVZ/1/uQHKHlABTQi/J0DZ8GG4sWh97yDZUPUxY7gt6zTsFaFzb0b32GF52
         dmMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794593789; x=1795198589;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bjOPI+nS6OY4/J1CJwhYrkDcrP31GfwK700MsRJ05II=;
        b=GYhEU5nG2WlBW5A5sLjlww6iA4gRjgZWbV3SrIWkuE0SW5tMrkJ/ak9jYGLXx907xZ
         qxnbeAsOTBZ9sR9rKkMmjV2qPtGyLw820RJY69qtsd3Bqwg51m2noI90bkXwNpec9IUv
         pFvtkYIlCZSLcwmX1PO0T3xYPXAG+sS/tygiFtxd2uF3RiejybOTakLt63aRrs/27zft
         GITj4Tt+0z5l+ean2twWkCRhcXbfCdvs3Sttanm7ND5SyJ/HA6O+GdJwnFqFqHveLN76
         Eh2XGCwu61j8h8v3gmx2KB357+AH0jPDlOX446005LyyepUxRvKNxCw5+xTKXSuRkWnY
         iAog==
X-Forwarded-Encrypted: i=1; AL+hErHJoESOczFTSR0xh4N/kvxOo/leION2uCdLIHSJc65PQL3aO2OGle6jYcRYNV+tHA5ISf1rgVIE3pqRiSA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ELi5lz6rVLAQMJoPw6lspRFUti7hNoFb0vsKcMA5pAoP9dy2D
	+TFtR7eig1humGpe/GTIJhWyo7SgtQQxjHgpqDal6f8EOwtCRoqT6D6SIu3kTTts
X-Gm-Gg: AYBFou02BUiaDIU/bf4z6tFiM3WYgl//g3MWErN/uI5d+3xDXv7k056YosROUd3qseu
	6VqGu5fzA1DvoT0KuNBsAh+8zL0V8nn6PKRtkedDk+EzXxhizWOh5rFnFBVtwlnGz5gDxmh5sks
	4vFQMP1PM+bUdOsHrU/6BcMX4ZojiWdfL+lYh3n6SQDlyhvxKUuohVnyW8q/DXTzPWQ4NPv/2hN
	Ssnn3XM75ZE2tYXlft1tq0+HBZ915tpPvM1OXO/s1COurWhObuUfi4yL9QEpXS2yOju5jztb++G
	1d3ancSa5BzEIvMUus+XnKhUG1H8XBVMvWOZvLVbshyCRyThcwwaRwNGNV3AbxYGuW36L+xRjTX
	J9Km3hpShWdhVHcd8OsbN419WZVae/7UeOw6NDasl0613rYHOz0EdHiZtlM0632s77ZeVLBs9QH
	JU2CmphwMFTJrcz/XTE1aNcpOuumnMeeAa71lSLuh+em7xcqeEvRks29mEXSRx0Fy87H6YGlrKD
	iIZUTYJdMS2FkTY3gPnFlSIaCRhFB5OVvrD7826MBPnhcbMlhmvy+YE2wpV3cpv0T5UHanCY/M6
	jsQpgz/qn6DgrExozO0bF78FPjpILtQhPEgiwwQoRX8bqFloTB6w3L2IcthIY956KSPJsrofz+p
	Qiq5+SzMuy3JvzyjDb7RK2pPGoOrIXKsIZsUHPRXYC2iGJmA5gIeKTooA8Uo2uvhTgfQL2sk2SU
	59d4aju0bKJAVS0BWzkCT/FJVup9QWdc2AzrG/SRKNGvvx9hNBpzc=
X-Received: by 2002:a05:6830:2692:b0:862:87a3:b32 with SMTP id 46e09a7af769-862898c0477mr1690072a34.17.1794593789300;
        Fri, 13 Nov 2026 10:16:29 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8628817d979sm3253414a34.22.2026.11.13.10.16.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:16:27 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 13 Nov 2026 11:15:02 -0700
Subject: [PATCH v4 46/58] mtd: rawnand: lpc32xx_slc: retain chip state
 across removal
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
Message-Id: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-46-556b1d7c6221@gmail.com>
References: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
In-Reply-To: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>, 
 linux-arm-kernel@lists.infradead.org, 
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
 Vladimir Zapolskiy <vz@mleia.com>
X-Mailer: b4 0.15.2

Drain chip operations before releasing DMA and changing the controller
and write-protect signals. Retain the embedded NAND chip and controller
until the final MTD reference releases their metadata.

Run NAND cleanup during disconnection; the final core-owned put only
releases retained allocation and layout data.

Cc: linux-arm-kernel@lists.infradead.org
Cc: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
Cc: Vladimir Zapolskiy <vz@mleia.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/lpc32xx_slc.c | 22 +++++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/raw/lpc32xx_slc.c b/drivers/mtd/nand/raw/lpc32xx_slc.c
index f75ae484ce86..85472c3d4a40 100644
--- a/drivers/mtd/nand/raw/lpc32xx_slc.c
+++ b/drivers/mtd/nand/raw/lpc32xx_slc.c
@@ -829,9 +829,14 @@ static int lpc32xx_nand_probe(struct platform_device *pdev)
 	int res;
 
 	/* Allocate memory for the device structure (and zero it) */
-	host = devm_kzalloc(&pdev->dev, sizeof(*host), GFP_KERNEL);
+	host = kzalloc_obj(*host);
 	if (!host)
 		return -ENOMEM;
+	chip = &host->nand_chip;
+	chip->controller = &chip->legacy.dummy_controller;
+	res = devm_nand_controller_init(&pdev->dev, chip->controller, host);
+	if (res)
+		return res;
 
 	host->io_base = devm_platform_get_and_ioremap_resource(pdev, 0, &rc);
 	if (IS_ERR(host->io_base))
@@ -862,7 +867,7 @@ static int lpc32xx_nand_probe(struct platform_device *pdev)
 	mtd = nand_to_mtd(chip);
 	nand_set_controller_data(chip, host);
 	nand_set_flash_node(chip, pdev->dev.of_node);
-	mtd->owner = THIS_MODULE;
+
 	mtd->parent_dev = &pdev->dev;
 
 	/* Get NAND clock */
@@ -915,10 +920,16 @@ static int lpc32xx_nand_probe(struct platform_device *pdev)
 		goto release_dma;
 
 	mtd->name = "nxp_lpc3220_slc";
-	res = mtd_device_register(mtd, host->ncfg->parts,
-				  host->ncfg->num_parts);
+	res = nand_set_lifetime(chip, NULL);
 	if (res)
 		goto cleanup_nand;
+	res = mtd_device_register(mtd, host->ncfg->parts,
+				  host->ncfg->num_parts);
+	if (res) {
+		nand_disconnect(chip);
+		mtd_put_master(mtd);
+		goto release_dma;
+	}
 
 	return 0;
 
@@ -944,7 +955,7 @@ static void lpc32xx_nand_remove(struct platform_device *pdev)
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
 	dma_release_channel(host->dma_chan);
 
 	/* Force CE high */
@@ -953,6 +964,7 @@ static void lpc32xx_nand_remove(struct platform_device *pdev)
 	writel(tmp, SLC_CTRL(host->io_base));
 
 	lpc32xx_wp_enable(host);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 static int lpc32xx_nand_resume(struct platform_device *pdev)

-- 
2.53.0

