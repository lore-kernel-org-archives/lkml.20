Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794810643;
	b=t0eBO7219QE5dZO6NoiuBriBtPn+skv9GVe7ayVc43I9jvYl/jORkU7ewSt/L263k6Ac
	 UnkI1jncwVF+HbQxiGzuklI29KCOiILMHYxeOPyj76NSg6AjknmGer8oWtzG5WA8Uhdgk
	 /fK3CfGkHsZod+HmwyGIBVEMqIWerUCrDiTbIu5ljl63Zle9vSX7G12YgcxdPMJIo+zB1
	 UV8xznXkiTJBm3PUOPImG6RKR9dZHS6/PmMFVaQIasX9UqR4pkazEM4Djwc4p6OyeptjA
	 aTxoYRoK5o8HfJTcG/Ih5eFrRLPDTliU5BkOzzSGMhIICcF/l6Ng1ATEXATzZ+W72YA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794810643;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=bjOPI+nS6OY4/J1CJwhYrkDcrP31GfwK700MsRJ05II=;
	b=oDOz9zMOeOJKkniKjdr2obwPihJHaBo50Kjwp60e/0BPh7V4kwXd4yUdOl/OPbjuIMxX
	 Z6BOqWDFyn5WnIAHrWrUiiXeFYTLQVrUq2SKDdSkAKbmqnkedThqD0NWID+vL0VRIBmVH
	 sCy1qd3FxSthFcHlSqllNSn77CVy9++928LVWNVEfXMnRjBTl0h31uUPftbsdWFM+hNWm
	 plcn4rCGrSwFZ9m4FPXYfSddcPMMLMiR6nBLhEada2OcbOqSr53XKBV9wxJOLozhrnyOz
	 RJp1DuupVeAtL8Ty+lkX630PigCFnbX/hlLFo40Wxkh5i/qMyhM0DKb9Tj5lQLS39/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=v8vubYBM;
	arc=none smtp.remote-ip=209.85.161.46
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B9BF606C23B
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 06:30:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B9BF606C23B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=v8vubYBM
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-6b8e2d8df4fso2693213eaf.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 22:30:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794810641; x=1795415441; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bjOPI+nS6OY4/J1CJwhYrkDcrP31GfwK700MsRJ05II=;
        b=v8vubYBMsiODGvEPMmm4L9s10OBO71U9bM6kriB17KkxnY5ccyz6RgzJFhl1YBisyq
         ovg0YMCXtkwmWv3dd/RoHBeu9OEgexYBAiyqHtRY2TC6jiMGIwuH5jS5ZWg96E2LWecI
         T+pYK0kufjFFPo4AZfC7Jwjg48KWTQh031JXWuR3OMx5gFq8C98eGa4zjlcHDCMDhM9z
         t0AahMMYkWC0li66+WJNBl1CSoPeQ1f4kBEmxLWoOnXYyh4Zljy+Dk1d9nDArna0tQPW
         oG+UTLs+Hmttmx12W/n7qJqyUOCrqjMT12ziHmw6XrwQxUhsOhwmygIFhhUm7gb/H4pb
         W09A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794810641; x=1795415441;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bjOPI+nS6OY4/J1CJwhYrkDcrP31GfwK700MsRJ05II=;
        b=ycx3VYiwvCOu/csOuFYMsIRe9xOZKSxP7payLrOWxuc6cy3ykYLo5XRCgk0XCl7ag3
         xU5e6c1FjVxUtHG3WPFCGK9T/dTHE+uWkcsNhckIfO/VO9rUVeDWhqDds5fNqr+nZMLZ
         haAkpGbhtE/QxuuBGGrArn0jdOol9Mb4RCA6A2hdwZ2GFg5K+KxrO7ciPxN1RWT7Vdl8
         ApLE59kB34OFFHywtzUXGWATxbf2FFwwe0L5j+JjJbJdy7D2ad7WHnI5soOZp0ptEtbp
         UiMqjYCy61eqzu5nFREGRncxEwnDZqZ6AoYrKGGYGYpVJwjsc8mJu2dlPtV/70SiIE5N
         fymw==
X-Forwarded-Encrypted: i=1; AL+hErF3bA8oPv3NkvhxY/FwRue29ZqvdS69tbV7dbPyHx4DaKu8Yu8YnC7YsEUf5UDznTsMwYZI+Ibx14/9sFg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8pWeTn199LBsg7RGcI1BG99dIbkKMoNKOzgHf5FmJScehfZI5p
	pFvk32YPAgL35gMehoB/L2yoNpG3rGOBjsAxvUsMfmogQ1yjOunfK6dw
X-Gm-Gg: AYBFou1LB4R7XGHgtHG619a4EgvtLA7ibyoglklxngXG6yowe4D5p5H8dyBPnoYPeFL
	yiDZlBQ6DvwdMyonZHL/NMElJyX/goWX0E2N0eTbE92EEUbmuXPmBlLIRVnVJCIgruyXoEJaMUJ
	PPunY9Jghl+1lumHp7b9jenWtRxKKaU24q2IjcZDMy49xbbU344dhRrnZmtvpDHMm4X14eTTrGE
	5SNhGHsCKxxhmPvPLBdpSrNd1zkmKmKzvbKiOEoK6dqjbIQRdI+Gkdpv/O1q1+Prvpv9Yj6LcY6
	d8v4RLr4RPNkUoVXvNMoYcfdRTWR8KXAMpP7YPOhWsMAHgphYuSKOqaSCJdh2duAahALPy63C9k
	pk9UhhRHAyQWy8tFm6jK47aMk23jEC7rDWKh9XtpI7fijXs7SHeSQJ6i+5mfVjCMZR75aW9a1xA
	YTPg3B+GZp5fAD450kcngRTi9xsj4e1OioYqLB7ByTKryVkCKRmfttifsMPk5yVKOtyXOWJmW0B
	MQUJnQMsTp+avmunVHEl3Nt+nOrAM1yqb9RgAY6g5wtaChXj4r2kU9A+s4scb/Ct8q53H1u38WK
	uzUVIiO98hLZAQz2RMNgmTgin6zNnbCPXUTJ8gNUhaEErPdBVBvdy3JrLauKlfOIL0FOvYNmzdP
	5+M4VeR3rUyrOUrt8YSlMZYfSeOnyYE1+r1l58QLY0E0TLva+JXbPJs4m7F6cBEOmxQ5AqIqoK6
	Gzu+VMS441HLZz+ajwO4CuN4B+MSVeelZ8oWczM0K8ZY6uAxkJgmI=
X-Received: by 2002:a05:6820:7081:10b0:713:da3b:938f with SMTP id 006d021491bc7-71ab510964fmr5048738eaf.50.1794810641546;
        Sun, 15 Nov 2026 22:30:41 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab42c41e9sm7994558eaf.6.2026.11.15.22.30.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:30:41 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 23:30:01 -0700
Subject: [PATCH v5 46/58] mtd: rawnand: lpc32xx_slc: retain chip state
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
Message-Id: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-46-cbc49c5c5e74@gmail.com>
References: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
In-Reply-To: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>, 
 linux-arm-kernel@lists.infradead.org, 
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
 Vladimir Zapolskiy <vz@mleia.com>
X-Mailer: b4 0.17-dev

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

