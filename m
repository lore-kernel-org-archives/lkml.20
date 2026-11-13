Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794593742;
	b=AM5EWq/dIM1L1Jt1dHS2ZOWqbZejHfXd6y3YO7nQxrarJxm8lrpOzxg3UtFt1AzGr9LN
	 /L/ithdY1hbA+Ph1NvwSMBG1KwypAs/cgn5BS8/aY32SijSt/q15ujnuETtgTfbi34NXZ
	 rHt5HrgBorNKHEk5IaamiY7fqllLQOjFWFrb1E9FENpIGiSqabBesBhVdKjqIWlgkP9S6
	 rt5Af7JW203XxmLYDMDm+aUcjnsvcE74AKP7lBjD19AfYk5HaIEgI7syMmT1HZiEMSTjX
	 JFmR6bVLYFXZYviMNRqH+VPlwj7QWq8t5AVzgjF4g7Dvu3APb/INiWImP0nmBWhp4oA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794593742;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=sOcp5PUW3iZJSNOaYwXsbQQhGYFmUNK81o+FfUFfPJw=;
	b=GNxgGUD+qfFmAYE2Gjpx9N21CKPwSQvqe0slHwru5P5AXCFGisZm9yLto+3N5gL4NpLI
	 +Vm/hm3mIBYFVBSbzmcp0ERcuxJQMKiFhtKULKsD/mA7PRghv6F186q0HUgHTnjsu4QK3
	 OBxSEXD28Y+nF0PmdoTqPZESA11+x1db6exaU2Prklng6lWBWBGZ9leH2Kny6S77twxeO
	 +M6lDy3xyljduROQocokPTDMLE0LY3JD4iYprijekbME5P87FrQcOKvi8tyGTWz+wdvLw
	 SmqZ0svlj3tVw7PWW7WCT4uGs5J/aXpwMAfqu7wz3lunvIWlWj+7UbgLwbwd0RG/tkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lHJBCgXC;
	arc=none smtp.remote-ip=209.85.210.51
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87467607E870
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:15:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87467607E870
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lHJBCgXC
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-7f48c750afcso1590194a34.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 10:15:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794593741; x=1795198541; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sOcp5PUW3iZJSNOaYwXsbQQhGYFmUNK81o+FfUFfPJw=;
        b=lHJBCgXC6BU6PIUMW/SenpD+LMQGxGImN0gY8N0h0nEQg57kRycSR0nVAvw67NVkRt
         GxI7HTThUi5fXqFIE9PmGFqgPNJo6w/75sGUNvuOB9HqTKITVIj6GPb4OxPBTvRyRth4
         mG1W/pu4h+ue8GhQy7fhjZvHkUn+Gd3b/tSkqWea4TM5SswKyFyAMMtzgldUipKqzitB
         jKIELDmse99kLRo/PpXaZ16fppgM3v8qtdloltgTyUHYS9wL0ms/PBjn2dsi5qIL1iyT
         rkxyYY7A/ZTwEFPec6RO+Wj6FjQtS7shI92B3nfwyQCtBuYeKCsG55xYfJgZ8zcceyj/
         D8ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794593741; x=1795198541;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sOcp5PUW3iZJSNOaYwXsbQQhGYFmUNK81o+FfUFfPJw=;
        b=LZVdySITQU+EOhoEYcOr/WyfgCDN6tnMJW2FbMMYDKe7ukKHKBTYhzebMEGa8qW6lp
         cWE4HXYnOw13xGlwWsEOJ582v/GfXBMTFAcrK8V2VAIcjGWTQi9MZGL9SYFQoIpRYHp0
         vPeDPGHaQJCaomSRrl2b8udJGQBSrQRxBHXzOsuLHG77/DgrBublE2OCNpgYO/ZzCWIo
         s+f8/1xJ8gEC2SMueEcA4oNVRMCvLSinT970JSuDt5Az1GG98U1tSKg+S9pLS38A69qH
         kFq4uWRzwzHfJTQhFtnDVFywyJXpRZhafBHNvwcPSThwX3RPNQAzNX1aXgUCFvWoZCIm
         /xEg==
X-Forwarded-Encrypted: i=1; AL+hErENnKwjU5AHIbkrgGJYLMDLMMpnFBGFk5mvE9S7lfb79JFPhnWxNUbSXrpRFUxFwFsqvxZgXuMjnD+4C4s=@vger.kernel.org
X-Gm-Message-State: APuU4Z+HRtjTklIJLkyWrnXxYRGY9I6yZgKLeh1hcGRGOJEyIxUbEjJn
	0jlEbQJ/U3O37i/kiO6Wf+F2WPbGOLXJdd4cl33/uzlmevPJp0sPOLPcz+UKL7IA
X-Gm-Gg: AYBFou0K6iD3ijG4LRT92NNk+dBZrk3T75vBV77iIgyEacx4bsfXlzvVjGvFxSy07k0
	GHVFsXpB3v16jpvB0dA3Z6rUGm17IUXO/AdLhLmIUCGlmiikYyoiGBJbLgeWae1LABMvJ7jVK59
	Auw70xC3qayX1tgPC29d2p7v2t9E4dCgDuZH0ESEFVWz6aBYdY9gS5ZS7NxJzXVDhI17LWy9YIL
	bL2D00bhasf/WeObMdlQ9irD0jRYFpS1NTwKPsh4HOOiFDXg6jIf3I9ute/Ob0QHFx9+/J6dAC9
	306q16M1uNeuiPXeR2N663Y+RpCjTAOIYOP9Fc6cnNZ+MwcSWK+0fN7IjYJKXFv5zyGvVrzfX8l
	QU8Sebt0OFExRbjKnfYEJ3LLqfT6qL0Tw9uwm8BotAUdf12dQre242DVjDNK40Lf/9+DVICOinC
	X7hAyj/12yFd8bnpW2kvwKbem65qFHhdV/7TSLLVoGmzPGEnkCbwTIuPQEpZjD4nQ/po/PQEefR
	W4aKdRMPsFoxN9Qb94hVGdOtkwZ2ihHRGI8v1mLEqRVurqvSc1wIOpizy5NBt3qhLB7FaHzFSIq
	/F2/KK9ByW8nuJ/qMBuhcN5jsFXCESxuppBiGgnbRqMvGvsoBvgpoOCCguKEslXxefCf5MwbCEU
	MT7kHxabmvYgxSENR8d8bRjFpRP5wrOL0XzOVKUGPzO+6aqF5r/JkaghuNwG2BwVR/6qyK41wZT
	UWr0K9mQHTP7iEtyAmHxIsfEymBONkXwaOW8ZLbbVeFZp6d9W+ZBU=
X-Received: by 2002:a05:6830:7188:b0:861:56d1:a00c with SMTP id 46e09a7af769-8628972cba8mr2936125a34.1.1794593741461;
        Fri, 13 Nov 2026 10:15:41 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8628817d979sm3253414a34.22.2026.11.13.10.15.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:15:40 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 13 Nov 2026 11:14:38 -0700
Subject: [PATCH v4 22/58] mtd: rawnand: pasemi: retain open-handle state on
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
Message-Id: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-22-556b1d7c6221@gmail.com>
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

Release the LPC region and NAND mapping after disconnection.

Run NAND cleanup during disconnection; the final core-owned put only
releases retained allocation and layout data.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/pasemi_nand.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/nand/raw/pasemi_nand.c b/drivers/mtd/nand/raw/pasemi_nand.c
index b497e84636c1..0a2d5e5bae07 100644
--- a/drivers/mtd/nand/raw/pasemi_nand.c
+++ b/drivers/mtd/nand/raw/pasemi_nand.c
@@ -122,8 +122,10 @@ static int pasemi_nand_probe(struct platform_device *ofdev)
 	chip = &ddata->chip;
 	controller = &ddata->controller;
 
+	err = devm_nand_controller_init(dev, controller, ddata);
+	if (err)
+		return err;
 	controller->ops = &pasemi_ops;
-	nand_controller_init(controller);
 	chip->controller = controller;
 
 	pasemi_nand_mtd = nand_to_mtd(chip);
@@ -136,7 +138,7 @@ static int pasemi_nand_probe(struct platform_device *ofdev)
 
 	if (!chip->legacy.IO_ADDR_R) {
 		err = -EIO;
-		goto out_mtd;
+		goto out;
 	}
 
 	pdev = pci_get_device(PCI_VENDOR_ID_PASEMI, 0xa008, NULL);
@@ -174,10 +176,15 @@ static int pasemi_nand_probe(struct platform_device *ofdev)
 	if (err)
 		goto out_lpc;
 
+	err = nand_set_lifetime(chip, NULL);
+	if (err)
+		goto out_cleanup_nand;
 	if (mtd_device_register(pasemi_nand_mtd, NULL, 0)) {
 		dev_err(dev, "Unable to register MTD device\n");
 		err = -ENODEV;
-		goto out_cleanup_nand;
+		nand_disconnect(chip);
+		mtd_put_master(pasemi_nand_mtd);
+		goto out_lpc;
 	}
 
 	dev_info(dev, "PA Semi NAND flash at %pR, control at I/O %x\n", &res,
@@ -191,8 +198,6 @@ static int pasemi_nand_probe(struct platform_device *ofdev)
 	release_region(ddata->lpcctl, 4);
  out_ior:
 	iounmap(chip->legacy.IO_ADDR_R);
- out_mtd:
-	kfree(ddata);
  out:
 	return err;
 }
@@ -210,14 +215,13 @@ static void pasemi_nand_remove(struct platform_device *ofdev)
 	/* Release resources, unregister device */
 	ret = mtd_device_unregister(pasemi_nand_mtd);
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
 
 	release_region(ddata->lpcctl, 4);
 
 	iounmap(chip->legacy.IO_ADDR_R);
 
-	/* Free the MTD device structure */
-	kfree(ddata);
+	mtd_put_master(pasemi_nand_mtd);
 }
 
 static const struct of_device_id pasemi_nand_match[] =

-- 
2.53.0

