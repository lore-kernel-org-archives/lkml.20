Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794446960;
	b=U3sCzXfF5IIk97umtIuHw4Ri+8XD0GLLHVtTVppnwJiVu+c2DoM0MdrkVV1EiRiY2P4G
	 Ib7L7YiD5StWZDAkqEgBQDd2+CA9UzYfsjFglg1QsB33TTKg8DdVtG0xGmRMQmIKWUYtS
	 Ov7kcjGRHyzHHQc9zSJnPS1ZjslybJQfjjcQDH4P1SdizV9178cZ8YUafPD7ObQfrJ5+v
	 YTRduW1YTv3/cxJelihFfNzCe0Lpm92eCDnms1VqvIIuihG3u3kK+WZPMM4oBmes746ED
	 OgFc0uwZgBeL3Q5f3skNf1VnNVFylgsG7ZFQhW/gVzEP5Y5xRX4whm3cmcMtQlqPMbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794446960;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=bjOPI+nS6OY4/J1CJwhYrkDcrP31GfwK700MsRJ05II=;
	b=zLdxeA18QRcoL6oKZ54T8M23iJIUjzhJo4GQeQpp3XNoZ+UQ4Oy3SBVsnjbr6zbcmG39
	 P0M1WCkfh8JtFmvATP55Wtlu56orJqaISEjm7XuK5AlN5smcCimcDAErH/jIaudDJydBX
	 ywYRU7FJcYiMONhinjoxZTo+ma8Ucaz2MOXvp0tWQo0WdOWh6p7QIQ6xAHkHwq5mROT6a
	 T/YrSd3TpFfyNCqNqwKJk1P2BHfa6G2yxSpUS3BoI9q5qK9xNc2+USagVYH0NHp36pPWd
	 0g+WEpMmAOLh8E5qD9NvO6kovOVmBTeu4NBYzxbTjNZ/mv4N5gSYHltvszeMX3VmyKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zwMwx9h6;
	arc=none smtp.remote-ip=209.85.160.54
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0F246070DE1
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 01:29:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0F246070DE1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zwMwx9h6
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-4932b13c4ccso2052372fac.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 17:29:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794446959; x=1795051759; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bjOPI+nS6OY4/J1CJwhYrkDcrP31GfwK700MsRJ05II=;
        b=zwMwx9h6biOPPFPgSrOmGCX6OZqlv4JREp6KErtI2MT6nLfJqVZFC71QIiaPoJAyMq
         RnlT8s3qQeTr/eptnU4EyDmf5W3XofxL72p8jRdIGnLnvJc1VZopFVptumpnqu3EyjgW
         7Nv66QIhI3qKvjq/zgeD7i/IsH5QmfHEjooS2rzeZ/mWUbiyrM0m2tlzSeTs9CgXhGEk
         m0IYPLi7vsdpP36CLWL/XTGkMmLMBtMI7XK49p+vlzsl97tE/Uk3exvTLqjQIJm6Y4NY
         aCjil2OIifEgZTpIxK873Gs51NYSKk36N9hTc+TsQGiE3akrYjW/pFA6yiojnl8EyZmk
         /3Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794446959; x=1795051759;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bjOPI+nS6OY4/J1CJwhYrkDcrP31GfwK700MsRJ05II=;
        b=hqXoIi/KzL6GJLijNNnWXVR8kEKcvB5L7IcroJRGcGLyOcm8Ph9BgtiQ0S6avp2RjX
         XGa0HwEbbFXEK2wmnt98uwZNfZxQGvAfGXa/FNpACOkb7SPTqj1a71RHfqtX9kRsh/wZ
         lrSVDBDdM8OdBnu+rlh9ICRFi47pVS3ToMJS2YWsaepMCPFxcAAegWeaitU38FouIAmf
         Vbcyom308znAHUwBbFr7bffdoy2mPUVbXXYG4y89GugU/PY/nTAfcHrhHTP1+oXRT0ID
         7cI8bYU9BW/eOv3zBvWq1zBsL8QPqDqiJvsJcPFZlrEuv5N3vYmtM8DXPQayb4xg+zxB
         Qwkw==
X-Forwarded-Encrypted: i=1; AL+hErHTNlchNqtfFivBl6hzPHijXQ5IwwcvSUOGnQDRNYlXZ7VUvjEfT++sSx0JE/uE0S+QCM/cUbjQQ+VOchg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+tBaEMsJGBb8TRQ03rJl45JS/H0WB31OWgJTk4vd87L++3IRJr
	1O5Mt1y/a71cBqTDEAFfUfgNiEt/rfsOKhTX5o6kqMbEodu+r5Uo+6uY
X-Gm-Gg: AYBFou0mfhAamCScts2VcM4odsb59dJ7jixBPhCyZ83Kx3nWWUYV+oH0Z0OfIikoKLY
	bpDHWATnG5LSXIm7vARQxtbg20LLUFhzjOysFF9er/vWLNfj94BLLjlqlksBdLp0VKtsS8ZX2Zz
	i0OqWT31WBCZcLhfQGtdQ9n8sgo8iym2xQaZRnEG5KHDhP8wVhnGtj0kSZXh3nAEdxsdEF3Q4z2
	9BVFmcm9H3K0BPAoIj7eSdKEDVlZKX1Q/b65wpjw75QsW4wZaWG/EGR7nwU1TPXRxq+KIJHpEHr
	Tz55GX9GqdTEmLOCg3y+bkJwME+4TdRyYCfnvrTQjRvHPQzglA4ZMO30a8HbFlm+B3orGhMXZmc
	8IgFC68dpJY1aHkEHpdgq7K3E9TFym+KXKmPiCj+bTuLuhoqKWNljim5pPN/G5ljm4H8aJ7HkVS
	y9TrZyZy+mfZYdN/7YNx7XaWqLCyJTcouQtt18sGVaSPecBTf46VjpdVUbgVJLMk5BxkQWQyBDN
	gkbG0yKs+tNgm5cviDXK3K0w8RWO3C9ycc+2kb0IIZPDpDLvhWLEx3mQLKuHnFn3h0jfOjRj+Ia
	sFFTCGuKhGhpeOS5c5K3yQc9gSvclkGbkHY95K4Lp30p2CwaF0823RaykgFWeweAzlPmyxjhbC9
	e9ucL1cvV0e2bXbd/SDLpFZ1OinKvdqYw7c8yh7G3tE5ZJel6VcDJP8PvH6aLisIwsplxxlXRvH
	P+YeIMjkuB17wdOmK0GPJa+WFE4ssL1XqQA/VZK1TLVxcO6JhAhV3f
X-Received: by 2002:a05:6808:1a0a:b0:564:3b0b:fc11 with SMTP id 5614622812f47-56b961931efmr3867926b6e.19.1794446958924;
        Wed, 11 Nov 2026 17:29:18 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905738049sm6823481b6e.10.2026.11.11.17.29.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 17:29:18 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 11 Nov 2026 18:28:25 -0700
Subject: [PATCH v3 46/58] mtd: rawnand: lpc32xx_slc: retain chip state
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
Message-Id: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-46-ce537999741d@gmail.com>
References: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
In-Reply-To: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
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

