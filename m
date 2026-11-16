Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794810620;
	b=gN4HSzXZs7aQqEInXkszzXHCKo4l8avyNU/O7/NHY3wtrxC75+3wWA5+mYMtZcC+8PDk
	 akxNoIZf+mzndfv8O3yQzjE8W/BFYXb9DeZkij5Xr1c2j407PLvcdBh/rajraxyGn933s
	 lA+ZUD79q2GELy3LoF+Qc+VfjTxItc9Mu7VCz/cwz4TeOHhgJIkQ6ZqgeCR0/O77fh8CP
	 bvEO9cTbFXoH0jEUSH2ZKKD8rfhjqUZYBTlPdSSMJKnVTeQsVCwMqoltxZJLWxuIGyCSQ
	 +z3JvztkYFAVP+D66Wsx6y7gyKOHwVJjXIUIqm4eVHQgUx6oG7OQGGMX/IOv91T7d/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794810620;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=zRAO/+Dfdvj39T/d3HsXbcwOfS2WRbpSEM9ReQOXCqc=;
	b=w+LXBiqdpp786sOrh5yiQTszgOz8mUyiC/AMzota/l17pP78i++NpxFBjKg5ojLGrG5l
	 IEUu4zHXDsJPUrLjokSmx70vF6yMFLAwhg0DPLw/MOCoVgMRRRsGjijFAITx9vmRkYySW
	 9ujCe52GwI/gYnVEa404gm9DxI810V7xIjLzNCo8yP7UtiN5ykq3eGEb4N8PwmYu53NlE
	 VV/9qF3i3n3Q9xt+MIvaMdXx60vkvBS2gR3lRbUEqA4Zo5ULDNMvN+FWva9GR8XvAph2N
	 yuwuG/a8m0PDKlqHeDXtqBWNNQCt7eT18hcB6YhJwPgbWDOXiXnq+/n0gH0MTC/wRlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PSfdMndN;
	arc=none smtp.remote-ip=209.85.161.41
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AD81606A896
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 06:30:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9AD81606A896
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PSfdMndN
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-71ae5389c00so642678eaf.2
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 22:30:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794810618; x=1795415418; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zRAO/+Dfdvj39T/d3HsXbcwOfS2WRbpSEM9ReQOXCqc=;
        b=PSfdMndNBKL6yY1gLo3V6y7TBpfrHneOVTaGFPMDs7e7OoRoiUPWjR4eSob13P4H4B
         kl3zPNhyqjOj+9Crec+lgwKk9DqKnaT97ivhPnt4pUgaQ+t+I1bx64U+rjjvC+73w3on
         3r2Rn+lhznN/4VlNTUPfnyXIDxLxBgUK7vW9XmfnDsF4NV3L/ZtcHEghQKI/d3rd9z1a
         i01zcPsuBOM5rS+VTki21ENTQl0CNEOK5BGNwBNkIMyy2LOnrJhHCmU90XY3ZBk0WwP5
         WM/tQbp9/wlCy0vj0mI8yLQvcJi5/Ys66N84U9+MIJoZhkfDvrqaOkTJbK38pI5aHqAY
         YRhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794810618; x=1795415418;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zRAO/+Dfdvj39T/d3HsXbcwOfS2WRbpSEM9ReQOXCqc=;
        b=h2EgcruULCEH0cag5p75pFwDvT/OPxZsjSD7/GAZC4m8rpWuHTeGi2hr5sfswNrsTH
         ES7FO2GAYhSAy1Gp0xxkiBZVaDDu1bUlnEih6mHuP5uVZsarOZhhCqTjwTyaT0RG/Wdi
         Z5eJ4IzoKCI5GIOW5cnzwhJEi22DhtoMc0sT8zRHuY5pE3ieLi3dMTnwwyQDxQk44sVQ
         RgJdx3Wev4GXfqCyx6ZzNtsB95+pMroxCQC+ykYsmPXI2vtFeMT+LG3MwuSi6MTwXzMZ
         KJAE/zsvrG4zgd9JM4VJeHv+k7CFJS7XY/Uw73Z78TulhG86Wg21+WG4zQ6e2Xd29cbc
         JN5A==
X-Forwarded-Encrypted: i=1; AL+hErETNDYEsBUoR7kF23NtqTSYZUeiGYGmJL1od0uzYeARyvGfvysceeg3KKialtlCJuSbk7JA1ggU1WhtHYs=@vger.kernel.org
X-Gm-Message-State: APuU4Z8mOoLcmISme/rlAKO3ysordeaq0KsR/2Dy9xljKF8kmh8vnVII
	uJySl+cP9ZHwOzEg8A4YZTGJI0uGJ7woOXP+Hlq/NtUzDF89cXFjACGkFtPLbQeD
X-Gm-Gg: AYBFou3j0Cw5/tMPE0qgjR6USKBO9WE1DZdYmM+xLJeUiBgwYPydJ5HhYGaRZn9Y10h
	6IA78HmDHDnq3e/6LWWJSfbaGIGV1ezs0zSZUS7KPdb3hg0Z5satqCIC2o7DUAYHYGIr4DWJ9FA
	9VBr8j76G/5XkQM+LAm/G2JDHgA1/XnnhjCLucK3rL3yiNiW4My94pGjXvXOo4LXmuM4gaNxHIL
	DkllofsFLFhSYE+JhMrBZ7Y5q89ie1LQ4UHR1o0xT0xALSKoXE+MMNqez5E/L84G/xB7ufvXOdv
	w+KvY/HUAQ36tr0Nh3ImPjp+svBnODhHyHQco55wBQPrxPwejTT29NXL3TS6syy75zm5dZoJsnz
	T00wya+UjAJDIX4TUBEp3pUmlFaoTFvJoXIcSfbWc7784Q7Yq9pdK3fCevipLVfbOCFZrU+UXX+
	i/UrTGlrIPcbBm3gXw3l51SfHH3SqzLQUQEUd7lhwEfVlX4Dzg2Svoa0h4IUINhXMVVXMXG1bGD
	aBZoO08SxaOvUGbJJAlha48dL5onrWd3/NbSKCoMGRnFM/hgk2WoWLrWgOxHHEaEnHROqnet49E
	T2QHsuE5lB1LE/q20E80MjjdLor4GcmfpP4rRLBNIv52DEFYVCcIvMU4iviwVo+e8edS/Pr2P1x
	oMMbWZyYtHEW03rHaPBrfnf6khx8X3vRo5Sw6LwcaJIIIZqZlxM4A1d9NZllG5rYAJLNhjdETeY
	jvXjaJphRSBhZbuG0JY6Q/9Uuz8TH9ufV4/jJc+icR8wFSibfPYsQ=
X-Received: by 2002:a05:6820:a281:10b0:71a:fb0f:810c with SMTP id 006d021491bc7-71afb0f8686mr259594eaf.63.1794810618510;
        Sun, 15 Nov 2026 22:30:18 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab42c41e9sm7994558eaf.6.2026.11.15.22.30.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:30:18 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 23:29:41 -0700
Subject: [PATCH v5 26/58] mtd: rawnand: vf610: retain open-handle state on
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
Message-Id: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-26-cbc49c5c5e74@gmail.com>
References: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
In-Reply-To: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>, Stefan Agner <stefan@agner.ch>
X-Mailer: b4 0.17-dev

Keep chip metadata and controller storage alive until the final MTD
reference is released. Unregister and disconnect each published chip
before releasing the resources used by its hardware operations.

Keep managed register, IRQ and clock teardown after chip disconnection.

Run NAND cleanup during disconnection; the final core-owned put only
releases retained allocation and layout data.

Cc: Stefan Agner <stefan@agner.ch>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/vf610_nfc.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/raw/vf610_nfc.c b/drivers/mtd/nand/raw/vf610_nfc.c
index 57da9eab940e..16e84ade92db 100644
--- a/drivers/mtd/nand/raw/vf610_nfc.c
+++ b/drivers/mtd/nand/raw/vf610_nfc.c
@@ -813,15 +813,17 @@ static int vf610_nfc_probe(struct platform_device *pdev)
 	int err;
 	int irq;
 
-	nfc = devm_kzalloc(&pdev->dev, sizeof(*nfc), GFP_KERNEL);
+	nfc = kzalloc_obj(*nfc);
 	if (!nfc)
 		return -ENOMEM;
+	err = devm_nand_controller_init(&pdev->dev, &nfc->base, nfc);
+	if (err)
+		return err;
 
 	nfc->dev = &pdev->dev;
 	chip = &nfc->chip;
 	mtd = nand_to_mtd(chip);
 
-	mtd->owner = THIS_MODULE;
 	mtd->parent_dev = nfc->dev;
 	mtd->name = DRV_NAME;
 
@@ -873,7 +875,6 @@ static int vf610_nfc_probe(struct platform_device *pdev)
 
 	vf610_nfc_preinit_controller(nfc);
 
-	nand_controller_init(&nfc->base);
 	nfc->base.ops = &vf610_nfc_controller_ops;
 	chip->controller = &nfc->base;
 
@@ -885,9 +886,15 @@ static int vf610_nfc_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, nfc);
 
 	/* Register device in MTD */
-	err = mtd_device_register(mtd, NULL, 0);
+	err = nand_set_lifetime(chip, NULL);
 	if (err)
 		goto err_cleanup_nand;
+	err = mtd_device_register(mtd, NULL, 0);
+	if (err) {
+		nand_disconnect(chip);
+		mtd_put_master(mtd);
+		return err;
+	}
 	return 0;
 
 err_cleanup_nand:
@@ -903,7 +910,8 @@ static void vf610_nfc_remove(struct platform_device *pdev)
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 #ifdef CONFIG_PM_SLEEP

-- 
2.53.0

