Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794594381;
	b=db3vk2zLDwl3gyKcuiJ6Miyn99igp4VXfr7gWtThx7aAiNBkxN8JS/jXnh3LfPhy4j6x
	 XivH6nBcwC6mWRzak/GMSlmlJEH3ixtRBFjetHLT/AkYOcowAyvlS0682svwZY/MaSVSY
	 vEggN2ZLVXO0vpncl5NTISvWFHIs3qzfN3UExh6wg2uD1y2oLjdB+Ex0Ab0FUlKjA5Koz
	 /aBbOz1jeg6PJG++7EvCAijO5wmBCd+yMjwtGs304DK/L6wP100YcqbW3fNOC8giFKa5w
	 jbDuF+P4pZi/fS2Aj5ONYUq7XOwnPRCGRiu8m7BQXkk+wmfPtHfnnCq7Y3FvULtZ0Jg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794594381;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-ID:References:In-Reply-To:To:Cc:X-Mailer;
	bh=rHHK5IlRceC0uwPwNH8P6BMu8ODgdw/BdFt3DrIJLXE=;
	b=E5bS1zmJmD/scuV6dZHMB+j1xJskqjLzydtHzrfkMwM9uLCwXXsCqPk67ztROxmJEUB8
	 G6ssjK4n7StZpYyYUJ2QmnRb1a2SriNoAaNKWGx4Bgaw4ijekh2ra+b7dsUc5gBRHzCuS
	 RfyuMnUjG+q/hlKtBu22/ySQDRrg8OkEGjum5eD0+qGAmooYRmjPB3ZvR6jiJgUBWvlun
	 Z/nyDilq99JAHonb4MnocinAi1r5dTv/b3tH7Uik2vohmLsoxxEodiYuP8Fh+2lJMBoJ5
	 AnsyOkv91ok24qHcBC4eIbFOxKCAw+Fm/DZ1RuLbUbLoybmqvD/Jt5eGx7+sZ9i51GA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XtLZLBvJ;
	arc=none smtp.remote-ip=209.85.160.47
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8C5A606A895
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:26:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8C5A606A895
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XtLZLBvJ
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-48e94879f02so419246fac.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 10:26:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794594380; x=1795199180; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rHHK5IlRceC0uwPwNH8P6BMu8ODgdw/BdFt3DrIJLXE=;
        b=XtLZLBvJqQ2tJm+M+xUVEndRxIsDg+z+ZWjE2dqprAFm0kMuEV6tfy2FVwr9JgsUOe
         00/ups4udQMtfO48+ub7tg5YlEGze/NswAyymoaZEULZ818/lKnG9TG5oc5/mJxMpDne
         Lr8H4Ocm7RIsPyLO8xjU6HGHr4azbDKc5jUCycSabBtRD0zJL+VJVWHBl75EgSaJJb7/
         eb1VvMexexCADjeWuDibQIKx7qkSPVb8/IZ9FB/5kJpuHAxhip6dOJPKKJaXnpABZj4F
         NLl8i+VsA9Z8mtpv2e9MH9GPa3NSJUOtlkrfV2qXpWZzv9V9Ub8wHdosDYYVaupn/evR
         k12g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794594380; x=1795199180;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rHHK5IlRceC0uwPwNH8P6BMu8ODgdw/BdFt3DrIJLXE=;
        b=Vnj3ZjTTq1mT61cl3+2t1CRAUT1mugico4bAE0gbiJsa9/RCUXKKaquEa335fKJ64q
         xA7uCbQWVScSx9kDi7E96sa+24Ee3XydMWsbLK194UmjnE5ttqwKxMfmcxCN0Shk8SYC
         0vkmNucwOWKNstA++7ZGS4r73gL2irzVnlciin5166kSiut+t9IGViG4JuDAXLHQgQv8
         FKT9Z1/YtZSKsfLTT5Pi65ytX0fDS8f66kkvzExFYwUIyGXV1oLCOuMsPn+4s5y2SPu1
         xyr/jjvM1qZ+7GwUUM/wpu4FDgZCP0lypydz/HTVndFFSnlI1ufz6wOxaN9TGkhefJ0h
         qBDA==
X-Forwarded-Encrypted: i=1; AL+hErFaoQ25HpHPA6lH8psf0YfEIUiuKNtLrSZTeuJTq2T4lmnvPz+KFv6A0Z40yITnc35es8JUsTfxAxWr8Js=@vger.kernel.org
X-Gm-Message-State: APuU4Z+uMZA0FEf9hoJfEESaIckqHEj409JlfZbqHyjsGo3L2UKwW/Pc
	P0ezziHGm9fo4cJizzPGOQUp8q58jfzE3I+8MfNZgfC0TgypgLCxpTPZ
X-Gm-Gg: AYBFou3nNNb49KE7Drahzr1xJMAeZd9uTqYjPMG4lhknJF42Zi1nsFcFyRhN5GJ9+L0
	4jxKwOaJGtDLoIcR/AYPZ3+bJPac59IUoZ2p6625kLAqzzcK/RWCO2BtVDaMv5JZOUXsnM2dZ9t
	VsRtEb610+PUDrUps9DxM2uQ7hMVJHxs0fYL1PQmp7SCIXhDaMMU3GmmNhVhCHjkqaDdQhf5pRG
	PS2dGtPhT89aVHys9kqrQuqOfoZ6RwasGDN2092r72WJhpPvt48BB4zX2ATfy0Tp8hFJqukjCFP
	VOsjtv+Oc6V1QgZxpT53SbyAA2CLxwrmIdPslyp9KpzndFxNcyjUj5VKKQCtWB8UCuXmOVVfYNb
	jBYHcrIbbETHNH4BvooJPBi3MuZkp/q/AU+cEBoRsFqJLwn7xRe+DgLZWvlYR5c3XltBkQ/ZHOA
	UZSRLduPv8MMFZarNcALuHlqvUGGFlklyqThU8c2d3uYUAfdkuOGLedjqHpijeQj2IOb2GuEyM0
	wK/dcjfvCLhFCTh7FFKEx3BhrKu1gHZePi53lCnfpH6uCoQHlXeXXGuSZb8kULJDDyjLfpJ2z9c
	hMGyMNQS+3oP7qvdhAAyxwcbNkaVP9HpqO6SuKMVdKixB71jFgt66INZHOxuHHf6ZrvFQc//+5X
	yrDCM9EVZic4sLKh/G5imiABqH6mqqz7/lVglU7uBNz2u3ckACZBhfkVhj+6opRxIhQQLSVSveB
	k5w7LfpHXBYQjV2LXCpBLUSEoZ14u+t6FCp/cfT0BiGEjcXSA3HM0=
X-Received: by 2002:a05:6870:2190:b0:49e:6862:5308 with SMTP id 586e51a60fabf-4afdf4f0569mr2976775fac.62.1794594379641;
        Fri, 13 Nov 2026 10:26:19 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4afe2011c25sm1887061fac.2.2026.11.13.10.26.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:26:18 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 13 Nov 2026 11:15:07 -0700
Subject: [PATCH v4 51/58] mtd: rawnand: mpc5121: retain chip state across
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
Message-ID: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-51-556b1d7c6221@gmail.com>
References: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
In-Reply-To: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

Drain NAND access before unmapping the external chip-select registers.
Keep the embedded chip and controller alive until the final MTD
reference, and unwind scanned NAND state on unsupported geometry and
publication failure.

Run NAND cleanup during disconnection; the final core-owned put only
releases retained allocation and layout data.

Fixes: bb315f749f8c ("mtd: nand: Add MPC5121 NAND Flash Controller driver")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/mpc5121_nfc.c | 24 +++++++++++++++++-------
 1 file changed, 17 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/raw/mpc5121_nfc.c b/drivers/mtd/nand/raw/mpc5121_nfc.c
index 0aeeb6327472..42e167e1db7e 100644
--- a/drivers/mtd/nand/raw/mpc5121_nfc.c
+++ b/drivers/mtd/nand/raw/mpc5121_nfc.c
@@ -636,6 +636,13 @@ static int mpc5121_nfc_probe(struct platform_device *op)
 		return -ENXIO;
 	}
 
+	prv = kzalloc_obj(*prv);
+	if (!prv)
+		return -ENOMEM;
+	retval = devm_nand_controller_init(dev, &prv->controller, prv);
+	if (retval)
+		return retval;
+
 	regs = devm_platform_ioremap_resource(op, 0);
 	if (IS_ERR(regs))
 		return PTR_ERR(regs);
@@ -644,14 +651,9 @@ static int mpc5121_nfc_probe(struct platform_device *op)
 	if (irq < 0)
 		return irq;
 
-	prv = devm_kzalloc(dev, sizeof(*prv), GFP_KERNEL);
-	if (!prv)
-		return -ENOMEM;
-
 	chip = &prv->chip;
 	mtd = nand_to_mtd(chip);
 
-	nand_controller_init(&prv->controller);
 	prv->controller.ops = &mpc5121_nfc_ops;
 	chip->controller = &prv->controller;
 
@@ -782,19 +784,26 @@ static int mpc5121_nfc_probe(struct platform_device *op)
 	default:
 		dev_err(dev, "Unsupported NAND flash!\n");
 		retval = -ENXIO;
-		goto error;
+		goto cleanup_nand;
 	}
 
 	dev_set_drvdata(dev, mtd);
 
 	/* Register device in MTD */
+	retval = nand_set_lifetime(chip, NULL);
+	if (retval)
+		goto cleanup_nand;
 	retval = mtd_device_register(mtd, NULL, 0);
 	if (retval) {
 		dev_err(dev, "Error adding MTD device!\n");
+		nand_disconnect(chip);
+		mtd_put_master(mtd);
 		goto error;
 	}
 
 	return 0;
+cleanup_nand:
+	nand_cleanup(chip);
 error:
 	mpc5121_nfc_free(dev, mtd);
 	return retval;
@@ -808,8 +817,9 @@ static void mpc5121_nfc_remove(struct platform_device *op)
 
 	ret = mtd_device_unregister(mtd);
 	WARN_ON(ret);
-	nand_cleanup(mtd_to_nand(mtd));
+	nand_disconnect(mtd_to_nand(mtd));
 	mpc5121_nfc_free(dev, mtd);
+	mtd_put_master(mtd);
 }
 
 static const struct of_device_id mpc5121_nfc_match[] = {

-- 
2.53.0

