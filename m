Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794446934;
	b=RNDd4xFW7++IjsnmJ9puU8xDr4QO00GHAjJt3tezfxBwma0PpZ4X5pwflo7XQrTdkwur
	 bq9hhdtW0EQDtzG9QRtqhmOVG0xlzK8no8R2+HMnGrgHGVKZIUzY1L1d133Q1+bOLExgn
	 2Mbr71NFw1x1Do5zNGgoRGzzpbZb+KzJn0OhwxAIzEgn35uQ14m+RRfj1L8Q7MFI1if0D
	 6Mz/ezqtrqft2y40m6SN8IoONLWhpEpypF8dL0iI6jxOUfm0lz8h064lyIQBLWYwarmA4
	 9DFEt9jiqJGFlFAitaaUwqfaZFmcyGVILypMd9SHw82oLQ1J/OndeKJayE2PF0YdU+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794446934;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=sOcp5PUW3iZJSNOaYwXsbQQhGYFmUNK81o+FfUFfPJw=;
	b=n3HLafUWiKI4ta1KDJ+DDG44bgV+jKNyxdIdC8DnYp0MPUUMS/3QGMISb1T4sShJxF42
	 FL8tVRulYwvyih9smgb+P5DH+ZQoeQZuIp/b20IKlPgtIvTCbP7f93QkEPb4XfsIkZRhj
	 LKqA0gUkxz7ernY/uRCH85NrXDMfjYaCLx/2BzUQIGpB8TEaquDlp9VRskQrpYp4+SjgI
	 DlXpjk+hsA8aG5LbcNfQbBbkhpJ16Q1exNUWDnW+Z49/gFJVaJljCBk+vK5PomVOtv1Xg
	 7459YMr2QQNZHMQNxB5dV8snCuRQoxAYb5cYTiWrIrxHYf5IyXP15rNucsKv3VeSPvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pUnGHX6a;
	arc=none smtp.remote-ip=209.85.167.175
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BA58606E11A
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 01:28:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7BA58606E11A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pUnGHX6a
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-55e0090c580so1223169b6e.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 17:28:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794446933; x=1795051733; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sOcp5PUW3iZJSNOaYwXsbQQhGYFmUNK81o+FfUFfPJw=;
        b=pUnGHX6aPdo9LKdBUuu/SnNQPYHc/z41EFcQnLSbwLyi3OD9CgpYwRW4pcUWcd5ahh
         LqQiGlt5togXqyWDN/rrGNhRxMZkx8AcBXlEIr5PzBNe3DtJr5xjyLmGpGIGlXdOEOIh
         W5z2SM5E0/OcY9Ns64m6bp5XDX7PUahi0UCpYcojqsjG06+SFyuLGJUQyGsat52ESJc0
         wpSFaeR0JXD+1AxMsaaNjmVSWf9acq2/92mIt8ApheHzOzwY3tSqRzoG8FIXtYDbGa3T
         Imzfo35ktngInnWVthJ/pHNkKUSxrP0dpF4i6e2qz49u8yqVIWGKNwswyGySkzb6aF9k
         AW9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794446933; x=1795051733;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sOcp5PUW3iZJSNOaYwXsbQQhGYFmUNK81o+FfUFfPJw=;
        b=Kg9XQZfU2ZQH1FZl5m3+OZmzwdfbpvlPow1WKp5bawO+kNMplMoCHEJpckqwVBRuUr
         U1d0ghfaOOALPVEDJXZXe4IjBIsuxEYYCGfElwXQcrLa6OF2qr4kr/uSwQ6RH2LlUPxV
         nl9/gdwsUX8e2WuJXURiFT4OB42FsLa3sDZbAe0BKLkUAWDn9dNK2VPFJxOpTyWWg1rL
         pdJE6VBwkAurNlL3fRYzWpiCb55t4K1vG6a2xr6xlvgeKEBIItguMzGLYurWxkiuOSXd
         5iYt9AMSqCNKFm27R1VKDwXNvVLZnenEE0JUoNsnxF9bBoLW5EEksRfiDWBKow3pr07N
         TB2Q==
X-Forwarded-Encrypted: i=1; AL+hErEnCKujwMGiOLy4OBgNlNq/QFcKfslwpD68hiVxB/oVh6hT/yDeKJPNFfDy+WA2Jh+z9V0CydTDUwAqz2g=@vger.kernel.org
X-Gm-Message-State: APuU4Z9OEsLvFpx86aQoeQ05NkW2yk5ElkcWK+RVPsKqWBBULgBxX4gT
	7C2kdlPHRFeFLrqvdnz3g86YQwHzB+QuTbno10rs2YY2kRFV1B/7nK4Y4HAZivWr
X-Gm-Gg: AYBFou2NGRouhmhoPOBYbJY3mtDsDPGyjzRkIy06LE7YNi7H63H88degaGmW1kxK0vO
	PvYGrOm3og1BdOpZViMluSG89ex5UBOmlvfUL2C7KquFwaVvebhFq9eS0GbeZDqDGYGd9L0yoow
	N/zMPkuCVz7OzK7dkd7GDDzded0G6jL/nYcys8XAeb37dZfPH9t63YiAjYxDYaegGpD8wh7pz2Y
	6EYS5cC9ZEKYnFeeTqg64O1BVrlLHlvTC3cyGDCpoR3YajxmUw/WXZbrKLJb17iDtgck6YbfmcH
	0VKpubmZ/mZRU8GwkH3IAEx1mLmC1fvdTfOCc+T76Dc325LtTTjshQGlJQbHUNJQwH3QwGWOUbx
	dSi9g9Ir6/F/bAbuXqhiF3EzC3JRnq9JlBcZEFUsK6LanUTXh7SuRErOWIM8do0bd1dbsUM6j6P
	eeBkiYaq0pYq65T4TionKYb/2g81NczHg7WwmcSDtVXxYE0BxTyQvsSfM0Ev8zMkDGTGfVCJ+do
	nc0t0gpOQwY6nDy1wfki92kLBgHEYgupG2cvtQTwNy98IoWMKiYTFPoTQcAP6CZLRda6OJqgqwX
	+xx5ySjVPkyCoy3mTEVAQT0MHndT0X1MtwLFNZXygxQSJeqAw5D0B4/PQFCfDnF+MXfOTc44KSG
	70XbVsAVwyoVQ2QldGh2z81am1qNOBfyWQISseRqFHYiLXNLogvog2pWKpG4+e65YFw0kmL591G
	n7oD/tJgIxhX8/IKu2cDJ/UrUoT6N7NjWdLIIIpHcydTCrdXC9foo9
X-Received: by 2002:a05:6808:138c:b0:4d6:90f3:74ae with SMTP id 5614622812f47-56b97710a5amr3991934b6e.46.1794446933274;
        Wed, 11 Nov 2026 17:28:53 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905738049sm6823481b6e.10.2026.11.11.17.28.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 17:28:52 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 11 Nov 2026 18:28:01 -0700
Subject: [PATCH v3 22/58] mtd: rawnand: pasemi: retain open-handle state on
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
Message-Id: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-22-ce537999741d@gmail.com>
References: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
In-Reply-To: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
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

