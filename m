Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794446958;
	b=1ttXzDs55AJH3hAZbbbQXfJ7QqNsJQzK3aExwaXaA69xfXMBz6YjVC23E68SdtBbMDuI
	 JL/ZZAA7AFYUA4OcqC/AgXw6RtovRc7zy5jWW4duqKkmfA3CuBWY+qwVMDILOPIJ8Dwpd
	 BXoq3F0T7KnToTMP1hLWbeyTcat31U6EpNIKZIpT5oBSl/Muu/qpvC+lSXv8AJFqsonT/
	 4SYbQQMj9AxcW2tWo+WeB20hikEY7n7kaTL/AudwqMH3+/NBaOY11ei3DnEKOOh8rYJ/v
	 HY/Fz1Epcb5DXxwQN+BMZKvWXNjJNMzfxi4tR5maCDQDgqxhm5vOYy940S4Z4L0vhgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794446958;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=gCbMn0D+0n67m7o+Cui6cZhy98vOvyTriDiAzIEEDOs=;
	b=fDeUkorRZfcCHyHrK5gS0iWgSncrb+Ji5ehMqLD/pJNk+C07x3tkvVOWvsclcwwb7MbW
	 fLN1S/YkepkIxroOvYZHRhJ1GANeuvMwrMZqRsv6R5S0LQ1F59YA1qy315cIvFhCfy6k3
	 vGZo0/zWoxH1HN9EwdZRoUmXN7uuRXp6pkK0rThS+SCpBhN+Ts9iHzRrmQnrNulhsUXKw
	 1tSE2itQ+9AlYqpMHkgTJGlSr4+9dwZhNlJflXuwitBiICIGjTlbam1QrMb6Nicq/t2a1
	 WZZ7EA53NSKr7WR4UjH8ZBTz4nVl+3aPVOZn1QI3maAXrdiry2RHjP/x0lpMDUpV90Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dHp8sJKy;
	arc=none smtp.remote-ip=209.85.167.180
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF3966070228
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 01:29:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF3966070228
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dHp8sJKy
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-56431524c22so1318211b6e.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 17:29:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794446957; x=1795051757; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gCbMn0D+0n67m7o+Cui6cZhy98vOvyTriDiAzIEEDOs=;
        b=dHp8sJKyzf1x4/cT8XF1XOGcefZyUB87xMPg/7X9yh+hh7wde/MCzpHmkCygmWMCOq
         A+wvGrmGaEMRsG53eyH/Gn8r60XYgtWR+4TR6UKgFsaS1aSePIiV3Pramax7u+U9VEzM
         t1tsc0wmmkV8cPTcpmvT0SgiA3MEMErsBNF+h9pN4uYzWXf+3JLBzhkt3hnbW2UJeUmK
         Ba+Dw+A+Pq1PMT3VHKY+fe3kvVSbW1TDydw9V3fNPJxg1eiBB7GlxEi61nzv6Ia6Wwag
         lhwmaaMbQCYJl4OQkAlm+PBnrIAEq3eI4De1K7vWCUdEJT/IrrZOSeYv7dM/X8jEoezp
         0b3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794446957; x=1795051757;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gCbMn0D+0n67m7o+Cui6cZhy98vOvyTriDiAzIEEDOs=;
        b=tFm+rlf4gC3Y0PbQRO2smEzy6aLdMoMFHMls1NExJrqceZFxyQPiV/fzOtL8Ivd7yU
         7j0axj3BggpPR1kwYeCOP2npxOWUxvM9zKZIMxepPHWs9FTDBldM+xFzVrD4L9WoX0eY
         KrQWprbztk1R3DtNim57ugMyTC3GaMQHR0ndtU3UB7xTO/pM99MzdQmSxMe0k9cP8pqm
         zd+AraeR1uSh99IluS6DERE/acTVdMUexjhc19WK8mhbQNJlUY4VDpH4Bgy1lbeGZMxC
         E5HBcQjeG4hntZUf0SY8/1jZPrULwnuJ0IMo9iJRFICevu/WNrN24X5ZHdvAzaQa9DVG
         ilYg==
X-Forwarded-Encrypted: i=1; AL+hErHSTh3iFQ4GTxfiht3fT0izBg4SNqRFzkBCY62xkMkdWw6p6e2TZ6FUXvVT+MXLDF2Dk/ftQLMRXvU4xX4=@vger.kernel.org
X-Gm-Message-State: APuU4Z87kheG7vuydGhaqSgb6zxmAcQeVpYF1aBjsWXWrDF7g3eLn0kc
	WX+DXd8n+m47E/vvjsC0bW/1jkPLGkSCOcvs0AQHMz4dwkNN39rxnlLJMePQlJrz
X-Gm-Gg: AYBFou0sQKGXD9tYcBHbRO2eMQF/O6nWAgDM+rWw6vAUQ7Gd1mTH3bmhFs3hNqxqyoJ
	JzmFBXVM2DPGs8FYiMlINGhwUkGyiaULWprSVp0BX7wbPY3ZheRDGn2DdBH1ECXWabCRjxltUZV
	LOFwMiH3MiAfKNiENntAN7l8Lz9+PS4IKmFTWUFLEAd8wo8/4pLiKgd4dHkIxoGJ0db4Y6ea6Hb
	fcXmg88Py/QAGbrgFJhuFHVVD1+g5EMpqYJ0V3MgqFZOnopQaLTNW/6VGlTt89ZA7MlEOe9Yrey
	iPaFkeb8TUnr1BxBdRtago1cnvvnbBhfrNRWco4WKg55qt5pVXRy9D5A0AwMBbJPkGwnLc6wCll
	2H2CPAkY0wEqzmk7yEJRYOQ4oOFgu55zTgdT3cJ4ZR4+YTkTh5PJy4yB+0GggNaSs0m9gi7Lr8J
	+K6FyyKE6m2cKpjKOtYBevpKQlfBsciG6AEOz5dHQ03JSOSGG+kDWCVLTnEtPlsDeOE3AW+Dksg
	nC1ip97d0EsWrQ7TThcCanzHoFBPhW8eGC8h+OkyarGyMOaTgxyWZV6EWIi6jK8gP2LwIH2KwlK
	3wRCZKnCkhM+iOfBIAY0c7KiqIyfvtajgn4H9kcub87a8D2Ptx7e/l3Y6bZsse9m3dy2/shYhDC
	7K1B8zC5RzXaAe4+nmh0uL9jwlDuZTrZJcJ7JrCQ+H47eNGKRErK1KyJgKqhlMC4wzGsRFUnlTC
	stg5to5XLfAwcjfQO35ThPtjv5Vnd82Ney/2gbnAmHc8apELuPT2TC
X-Received: by 2002:a05:6808:11c6:b0:4c2:5ac:7f9e with SMTP id 5614622812f47-56b975048c8mr3616841b6e.43.1794446956842;
        Wed, 11 Nov 2026 17:29:16 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905738049sm6823481b6e.10.2026.11.11.17.29.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 17:29:16 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 11 Nov 2026 18:28:23 -0700
Subject: [PATCH v3 44/58] mtd: rawnand: davinci: retain chip state across
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
Message-Id: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-44-ce537999741d@gmail.com>
References: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
In-Reply-To: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

Disconnect the chip before releasing the shared four-bit ECC engine.
Run NAND cleanup while the driver is bound, and retain chip and
controller allocations while MTD references remain.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/davinci_nand.c | 24 +++++++++++++++++-------
 1 file changed, 17 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/raw/davinci_nand.c b/drivers/mtd/nand/raw/davinci_nand.c
index 17c6fa73f4c3..40291db1fda5 100644
--- a/drivers/mtd/nand/raw/davinci_nand.c
+++ b/drivers/mtd/nand/raw/davinci_nand.c
@@ -919,9 +919,12 @@ static int nand_davinci_probe(struct platform_device *pdev)
 	if (pdata->core_chipsel > 3)
 		return -ENODEV;
 
-	info = devm_kzalloc(&pdev->dev, sizeof(*info), GFP_KERNEL);
+	info = kzalloc_obj(*info);
 	if (!info)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(&pdev->dev, &info->controller, info);
+	if (ret)
+		return ret;
 
 	platform_set_drvdata(pdev, info);
 
@@ -986,7 +989,6 @@ static int nand_davinci_probe(struct platform_device *pdev)
 	spin_unlock_irq(&davinci_nand_lock);
 
 	/* Scan to find existence of the device(s) */
-	nand_controller_init(&info->controller);
 	info->controller.ops = &davinci_nand_controller_ops;
 	info->chip.controller = &info->controller;
 	ret = nand_scan(&info->chip, pdata->mask_chipsel ? 2 : 1);
@@ -995,12 +997,18 @@ static int nand_davinci_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	ret = nand_set_lifetime(&info->chip, NULL);
+	if (ret)
+		goto err_cleanup_nand;
 	if (pdata->parts)
 		ret = mtd_device_register(mtd, pdata->parts, pdata->nr_parts);
 	else
 		ret = mtd_device_register(mtd, NULL, 0);
-	if (ret < 0)
-		goto err_cleanup_nand;
+	if (ret < 0) {
+		nand_disconnect(&info->chip);
+		mtd_put_master(mtd);
+		return ret;
+	}
 
 	val = davinci_nand_readl(info, NRCSR_OFFSET);
 	dev_info(&pdev->dev, "controller rev. %d.%d\n",
@@ -1020,14 +1028,16 @@ static void nand_davinci_remove(struct platform_device *pdev)
 	struct nand_chip *chip = &info->chip;
 	int ret;
 
+	ret = mtd_device_unregister(nand_to_mtd(chip));
+	WARN_ON(ret);
+	nand_disconnect(chip);
+
 	spin_lock_irq(&davinci_nand_lock);
 	if (chip->ecc.placement == NAND_ECC_PLACEMENT_INTERLEAVED)
 		ecc4_busy = false;
 	spin_unlock_irq(&davinci_nand_lock);
 
-	ret = mtd_device_unregister(nand_to_mtd(chip));
-	WARN_ON(ret);
-	nand_cleanup(chip);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 static struct platform_driver nand_davinci_driver = {

-- 
2.53.0

