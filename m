Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794446944;
	b=ZbzWlX3iZpTAEy42qQwsssApAr9ey0S0iQXya8lZpmRVRYXAWKInnN1CJkVuao6Ua2RL
	 s0Ir6rcUeX5JOh3I0wQU71Q1vluQ3Ixv4mRgWaxf3lnVxHX50S2eTerjbqwoA3SgfaJWA
	 dhF9agt3G30ItVuRE2DFWWMaX1UuT/U5RI/Vg8nPxIjAQXnEBpzzdE/vHkC6p8rI17Zy3
	 GC2a2i8MBOooNKMarXEfxHQ/VfmtZOmhwk/kknx9CfnW4pqIWIA9twzBmnDo4DzAy6Zry
	 +FjdZR0BEC9Ft/Nx0we1yuFC7hZja3OxO+bl9jOpEE/Oj0QeAU2Vo8qzmv+M8AKOZTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794446944;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=aL3SdYEEyAHQY3wjEITl3iA3pxg0pSYQTXWfqffrDSw=;
	b=qO56wDnJ5Ztpg+OU1mSsO+SZ1FraScG/CRnGHYfIdpzyvzlrwZUzU+ZowlSIJquAKC5N
	 BZeuM1SwjJAvjQb6YRDPx7O95cx987vX5kghx3tbP32/+8Lboon5uSSDMmW5QrYtrBLDs
	 +XjSggrLh3IzW9QkZNw3E81LyhxgZEFYJovPrB+BP1Z+X3rhBiO/dysC40tSJyRQ1X81q
	 2UccVoUmuo8r/Gy03qRQjByfRv1tO2nI05if2ot1Z2Wcz8J8l0Gtb9tvX7dKyjCQVYlPx
	 VNB0SIrtYgO60iWHuBSl+t5kRxaR9VP+j6UqiXJ4npjnCGRbuSQ+5oz11Ca3mIGuXfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=O32vOBh8;
	arc=none smtp.remote-ip=209.85.167.179
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40996606D142
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 01:29:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40996606D142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=O32vOBh8
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-4b28d7c729fso2411152b6e.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 17:29:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794446943; x=1795051743; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aL3SdYEEyAHQY3wjEITl3iA3pxg0pSYQTXWfqffrDSw=;
        b=O32vOBh8lZ6k+KkPxfYtGa/sa+7ZICvoc3BxVReJ1byxqt6m4bEWgR8Bi3xclYGGOR
         X1RdtZkyOW3kktf8ultlCoO1FTgQpgHvte3Watr0m7ztk8wmSvAtbhUq4J7ip3LBgvn2
         qNrVNMdPU3MtmL65USXY1t4/mInfB2S7KBomI2LxNJYrAMf+1B2LCkuLBdJ1k7d17Ni4
         t3wiB8G/5UZ+hOwm8egyJ2Pcg6pdSrYiFCVBSOMaiW5VvtxO12gt6ijUYyJmlZwIFeHe
         7vLWYN/1j9+2WkLIDhrfAzwhVfDD9yyy2fDEtB+btEO5PDOjt9eKCRqSKCDKfaDEfHFs
         kAbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794446943; x=1795051743;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aL3SdYEEyAHQY3wjEITl3iA3pxg0pSYQTXWfqffrDSw=;
        b=xjrmqVfrGGt17e/tys1RuS86NSQEO9WErwJPmkx4vE5+iUnpZ+sTwaaoFR3cwVLjpv
         GD9g99CrQG7r1bloTcD8ycE6dm/PUbTho7D7gEccHrf4g1y19vn9ih1HV5MEyR9xCrns
         Bol4wUIo/Jx+wQVOt2/7JPKgUMQr/p7nM+oKfGCsFtv2fN0sS/B98pea9hyMqMgYNrwW
         UPflYQorvPRheI2WNQeuQUhxaKPMyoNxcHlkPRT2CfqF5wUi9QjhdA2CPAEuxsseNI9X
         zYIsL/XPj3zj2IXYKV3Fgirs74WlOZbj4XVrIonXICNasSU1Sbgb1uamw+NQOwErLyCV
         sRDA==
X-Forwarded-Encrypted: i=1; AL+hErGnmgnZhtySdY1OSArWbKC5sphtL92Fgl8ZyfOClW/g2cxG681BvlHqHyHO1GhXEyKGPh+kiICo9utDz7s=@vger.kernel.org
X-Gm-Message-State: APuU4Z9JBaBJoi6T6r8m5kD1nTyZSCuc0dLZGiFFg8yqY5+rUhnace86
	920w0RMDeLhmh2CGmpMtlXq3NCXBzHsqBhH4OKUPW99PqE3OalovXI9w
X-Gm-Gg: AYBFou1LZAUHfMD5SU6XXBKtK4ZUSrDz9mUpBPiVVlKCSuvtCW5QG8SR26/9TZ+Rtao
	etZH8w5LWjuBHyqsOwKkinK/3DRihswON18xX6AMvL4jvT0n5zq4mVnU5JBpvME5TR+sM0qwD31
	21MbjoYLBeCgfClDxUd8HeeMW+h0Rx6d9ueAgBy9JcKkKlqjG+s0RPqK/ObZS2YMiU6SiND2H24
	+hqO1RuXUzxD73staWh2Tuxazh5pF+SBMyDvDDWtvFVZ8MuqnFsw+IPk3rvSH0rDzT6xSTUJaBe
	OrExJyLc+arcUVTKx7WCgzZAy93rtL9qBvNCv0fEoIHWb1UENbhwFHssXHlIMxXWCznk/GOQUF1
	tUj8qDNHRxpGZQZOSEEpbGfaO2rqMPnV8YR2xbhhd6eV1AUTUs0CatKMBdkoudHtyMBUJlKTzZD
	NT9xSLCl6EzmYzeIYMF5QQTu3oXh10a+tIqDGs5OwK97vsibR40J5doZrl6SY0nBT9/N+auhUtL
	YvET5H5CuEqobgm0VsBeRm5CXFEcDcVrrFNDe2qmtnOgrjbQbuM6zPD5a8mxvXpaGKaPLuc1dEe
	C7HwYtZGewoo2wHf4tGZ+BdQPpbT5O5a5BfDFQ/1fmzMVVmDX1CMRnj3Th8io56q5meaCdO7xCP
	fyjEY9XYIjJq9ayr+DvgEqiRMOO/EbOXOc6EwJVhhN3ZloHZBdJaU2fxX5siKtoaG8An/CEqG0N
	6K1uNKHMWMX6DsdZ8WfISDHxKjLantzVKUx2RKWiIYRfX9bn6S9sJ0zRgvymJqdf6cCT4Odda+S
	XE=
X-Received: by 2002:a05:6808:c3ef:b0:4d6:92f4:d684 with SMTP id 5614622812f47-56b989191f4mr3926705b6e.63.1794446943169;
        Wed, 11 Nov 2026 17:29:03 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905738049sm6823481b6e.10.2026.11.11.17.29.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 17:29:02 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 11 Nov 2026 18:28:10 -0700
Subject: [PATCH v3 31/58] mtd: rawnand: mxc: retain open-handle state on
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
Message-Id: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-31-ce537999741d@gmail.com>
References: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
In-Reply-To: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>, 
 Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
 imx@lists.linux.dev, Pengutronix Kernel Team <kernel@pengutronix.de>, 
 linux-arm-kernel@lists.infradead.org, Sascha Hauer <s.hauer@pengutronix.de>
X-Mailer: b4 0.15.2

Keep chip metadata and controller storage alive until the final MTD
reference is released. Unregister and disconnect each published chip
before releasing the resources used by its hardware operations.

Retain the embedded legacy controller and drain I/O before clock
disable.

Run NAND cleanup during disconnection; the final core-owned put only
releases retained allocation and layout data.

Cc: Fabio Estevam <festevam@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>
Cc: imx@lists.linux.dev
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: linux-arm-kernel@lists.infradead.org
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/mxc_nand.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/mxc_nand.c b/drivers/mtd/nand/raw/mxc_nand.c
index f976cf3f7210..b68c2f13234f 100644
--- a/drivers/mtd/nand/raw/mxc_nand.c
+++ b/drivers/mtd/nand/raw/mxc_nand.c
@@ -1694,10 +1694,14 @@ static int mxcnd_probe(struct platform_device *pdev)
 	int err = 0;
 
 	/* Allocate memory for MTD device structure and private data */
-	host = devm_kzalloc(&pdev->dev, sizeof(struct mxc_nand_host),
-			GFP_KERNEL);
+	host = kzalloc_obj(*host);
 	if (!host)
 		return -ENOMEM;
+	this = &host->nand;
+	this->controller = &this->legacy.dummy_controller;
+	err = devm_nand_controller_init(&pdev->dev, this->controller, host);
+	if (err)
+		return err;
 
 	/* allocate a temporary buffer for the nand_scan_ident() */
 	host->data_buf = devm_kzalloc(&pdev->dev, PAGE_SIZE, GFP_KERNEL);
@@ -1796,9 +1800,15 @@ static int mxcnd_probe(struct platform_device *pdev)
 		goto escan;
 
 	/* Register the partitions */
-	err = mtd_device_parse_register(mtd, part_probes, NULL, NULL, 0);
+	err = nand_set_lifetime(this, NULL);
 	if (err)
 		goto cleanup_nand;
+	err = mtd_device_parse_register(mtd, part_probes, NULL, NULL, 0);
+	if (err) {
+		nand_disconnect(this);
+		mtd_put_master(mtd);
+		goto escan;
+	}
 
 	platform_set_drvdata(pdev, host);
 
@@ -1821,9 +1831,10 @@ static void mxcnd_remove(struct platform_device *pdev)
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
 	if (host->clk_act)
 		clk_disable_unprepare(host->clk);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 static struct platform_driver mxcnd_driver = {

-- 
2.53.0

