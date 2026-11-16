Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794810646;
	b=hTRp6JY4ocZLn02yRZ7td7Yf3XUHvvb4oevteeS4YkkwoERsPxogpiTt3HGbMgCuxVQ0
	 NRa8IkvLtzc9WsXbbEtiGWN3k1muxCTAWz/+hfCtwgkCrWBued3aY/E+FdzQuTjW2oIb3
	 c6MVxvB0kaLCQicvRH+SWRd4j2gcDg6q+IRf6bjnmaLIebJgl+psAuX8p8eQWHei4+QAs
	 0p8AWQHcOW5uCCy9LE58OD5BYKAkANozrJwph5BtVeNixQf4Hy1osWKKbSARGl1r9lkz8
	 OT+Qm7bucXJjSHO8tpadWxwpNYf5iRABFQjuLdXaYkeEpYHmoZvFBSSmSTbBDL2gmBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794810646;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=kNGcaHU4xg09YyH3FdGk4qxS8on/P7E4zZCMCqu0z3c=;
	b=M7BUXOnAfsVhiZsTEej2DoruOhJ5bhJlaNpeK7aTepgqYghU7hGvvbHXb+zpQU5MwWD8
	 2nktKYaH9Ct8UiT28ni1Oah3ec7ZyyDj0JX+Y9LB7EzlpnvqMbYk9Ku0w5WDFhclmyYrk
	 n2JjSYJmhI0Z3yKdFuqdk4ti6Jk0HBhQ4QBuDJs/BFtNHr7mdsqe3AyqD5imKxoP/w2KM
	 XPKU2McevFHquMja4sK/Rfwy7UJ5G7ngOYnaB6MPDry6hwuoPhsxUlLPbiagL8uDqzb+N
	 ihBUbBHMteTuDeEjZtZgNcyaf8ysxJoA/NIz2V0v1Rl/MAuiZoTxyEqruTG7gjwR3UA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=j9fqAAD6;
	arc=none smtp.remote-ip=209.85.161.42
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1466606D959
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 06:30:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1466606D959
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=j9fqAAD6
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-6ddef424972so3560372eaf.3
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 22:30:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794810645; x=1795415445; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kNGcaHU4xg09YyH3FdGk4qxS8on/P7E4zZCMCqu0z3c=;
        b=j9fqAAD6iDZ6l926iJgr/r2dhlpG0ej5XpH2L++JXSrDSW3+G5OEpLG8igfjFPNqs7
         9FOiufs9tFxGmqSLmK5qgI8YZP7xdbEWFnn/yWWGzZdu7NKTDfd5XJ+rkBePDL3qLaOG
         IBcMK74DcWvL0mt7d85r/5BhAqAiE1E0DgvGdbkfw+N/IEwcLKF1yIAV7FXL3NG+Z4vv
         +lRH3wlb7LF00rM+/4KsRVXuAb3QlT2jdt6eC1X61xVP+brQhsrTo7ycvPdmPvoEMdkK
         AMwIPEllXdc1R5h+fxpu6kFzF5xeXSpVOmbn8iVTo/s41BVm8OpUBNBXsFongmxvPCRi
         hh5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794810645; x=1795415445;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kNGcaHU4xg09YyH3FdGk4qxS8on/P7E4zZCMCqu0z3c=;
        b=AlUvResdckSAZ7IPTeqFgH+znKO4ihev7Hxhqe6n1uPA8k7saHSapn2B3wi/cqqc2m
         c8dfkMbi9g01UhJuPAcDniDAZbBjHAN2nZu80HYYXI2sxIGn8yiMC7JaLQ4cNrFrI9pL
         zt8a1NZWaUCnjct8VX2BI9cyWWcAwrsxSUMFL//efCU7zlqVCCEXhu7V1mwtABe6bY/J
         7q/Q5kqinunp++F/+hsLLDDJmPu/1JuY8gRDFx7oGtx/63NhG5cjHhzs6nqMFaSpSFyh
         gqJXRpPllXgXkiXYL3rjP4uXSDS63Iks4aCJg1t6ygVhQ9bKTMzhhVeQVq8G9FTF7JBv
         XoTQ==
X-Forwarded-Encrypted: i=1; AL+hErFM0NFGQdxtuAnDtz29yoNqq0rHxIdzBfVsFd4Ke+ObMUEXEwz6rT9WE7C2c6fKmNYJGDJFYQQAv2+VIFA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+hEOisEwBdERHoFJluPeoj0v28L2sxfygZtReMzWQwvu8UvKLe
	qgKawczIVRlCUWHkdIoOBJfxkxjLCiUPRh8te6YUva5Ll4dC3q3pX0dhZRKCXk2r
X-Gm-Gg: AYBFou2pPC+51wA9iyXNQ3cwr8AbobFMyP8VkLChQpwJKRD4hIs/OMpL+d+VVCIm7Qk
	ocezrQflp7dJEklo3g+HP8Ey6ySkoLomfuRRJUsjQSYuImO8zPwtCemrWZxN7/WKdGLALHiCVEg
	mcprEVihLIfyifLkrIK5+aTr9H1q4327f+lL7z9buaDRSp396Gy8mXMqQ/01ciCb7jYG9FHKUZt
	dt1r/ogcBcYpzpsXFwIkZiwPYpPpE/8ur4TpeB43Cb1TOBuPaEQdhxun96hn4oDx45sRTrdK/yO
	mAwDxHt3Q2RjSqtBxycfX6KyeIPg57tH2+AsWWXq03Oiqiv8agb3FAvhM9zGiTZgrrmeDceCrBi
	ooI/vGsgXbgeCi5LUuWEX6A1Z3ahVRJkJnhCd/0akxFX8ltecd6thhfagwFCe4l6vRdGFfR/NCP
	uAIuAQfCZxWHL7kzb3SpQFidfxC2wWOjNBVDxye+eGi6OrxUsalzPdymVrbG83RUhOn4f0plWpw
	ZxzQXaAYDMafuqFnT+/iSdCXTT/hIawXEzpbplzWXSv+3vVdCy+CSfUlwU1vetACBK7HwcEV5RQ
	676IXBFfHnjNAZh9vtmKm+mPru9CVLrbfJeshnWO9eP6aN3j0ZOqElrAOX7V3JFuM81y2vuaG11
	BooB7HR5OaFoRg7gve5GEmWgsfsbAEXwb7Vh5ZKGmuDYhzvtpRvz6cjYRHWJWz7E35hh/TBU0XO
	qwKDlVqrXLM+YL1A1SbLkMHXypBiUOxdaxU+U4yLDLztHthtQ3g7Q=
X-Received: by 2002:a05:6820:718c:b0:6f9:59ee:cfb7 with SMTP id 006d021491bc7-71ab4f91762mr6030827eaf.23.1794810644630;
        Sun, 15 Nov 2026 22:30:44 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab42c41e9sm7994558eaf.6.2026.11.15.22.30.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:30:44 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 23:30:04 -0700
Subject: [PATCH v5 49/58] mtd: rawnand: txx9ndfmc: retain chip state across
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
Message-Id: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-49-cbc49c5c5e74@gmail.com>
References: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
In-Reply-To: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.17-dev

Retain each chip and its shared controller while MTD references remain.
Unregister and disconnect before dropping driver ownership, and check
MTD registration failure without publishing partially initialized chip
slots.

Run NAND cleanup during disconnection; the final core-owned put only
releases retained allocation and layout data.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/txx9ndfmc.c | 39 ++++++++++++++++++++++++++++++---------
 1 file changed, 30 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/nand/raw/txx9ndfmc.c b/drivers/mtd/nand/raw/txx9ndfmc.c
index 6fd6e530c38b..bd0cc30ab820 100644
--- a/drivers/mtd/nand/raw/txx9ndfmc.c
+++ b/drivers/mtd/nand/raw/txx9ndfmc.c
@@ -276,17 +276,28 @@ static const struct nand_controller_ops txx9ndfmc_controller_ops = {
 	.attach_chip = txx9ndfmc_attach_chip,
 };
 
+static void txx9ndfmc_chip_release(struct nand_chip *chip)
+{
+	struct txx9ndfmc_priv *priv = nand_get_controller_data(chip);
+
+	kfree(priv->mtdname);
+	kfree(priv);
+}
+
 static int txx9ndfmc_probe(struct platform_device *dev)
 {
 	struct txx9ndfmc_platform_data *plat = dev_get_platdata(&dev->dev);
 	int hold, spw;
-	int i;
+	int i, ret;
 	struct txx9ndfmc_drvdata *drvdata;
 	unsigned long gbusclk = plat->gbus_clock;
 
-	drvdata = devm_kzalloc(&dev->dev, sizeof(*drvdata), GFP_KERNEL);
+	drvdata = kzalloc_obj(*drvdata);
 	if (!drvdata)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(&dev->dev, &drvdata->controller, drvdata);
+	if (ret)
+		return ret;
 	drvdata->base = devm_platform_ioremap_resource(dev, 0);
 	if (IS_ERR(drvdata->base))
 		return PTR_ERR(drvdata->base);
@@ -306,7 +317,6 @@ static int txx9ndfmc_probe(struct platform_device *dev)
 	dev_info(&dev->dev, "CLK:%ldMHz HOLD:%d SPW:%d\n",
 		 (gbusclk + 500000) / 1000000, hold, spw);
 
-	nand_controller_init(&drvdata->controller);
 	drvdata->controller.ops = &txx9ndfmc_controller_ops;
 
 	platform_set_drvdata(dev, drvdata);
@@ -361,7 +371,20 @@ static int txx9ndfmc_probe(struct platform_device *dev)
 		}
 		mtd->name = txx9_priv->mtdname;
 
-		mtd_device_register(mtd, NULL, 0);
+		ret = nand_set_lifetime(chip, txx9_priv);
+		if (ret) {
+			nand_cleanup(chip);
+			txx9ndfmc_chip_release(chip);
+			continue;
+		}
+		kfree(txx9_priv->mtdname);
+		txx9_priv->mtdname = NULL;
+		ret = mtd_device_register(mtd, NULL, 0);
+		if (ret) {
+			nand_disconnect(chip);
+			mtd_put_master(mtd);
+			continue;
+		}
 		drvdata->mtds[i] = mtd;
 	}
 
@@ -376,18 +399,16 @@ static void txx9ndfmc_remove(struct platform_device *dev)
 	for (i = 0; i < MAX_TXX9NDFMC_DEV; i++) {
 		struct mtd_info *mtd = drvdata->mtds[i];
 		struct nand_chip *chip;
-		struct txx9ndfmc_priv *txx9_priv;
 
 		if (!mtd)
 			continue;
 		chip = mtd_to_nand(mtd);
-		txx9_priv = nand_get_controller_data(chip);
 
 		ret = mtd_device_unregister(nand_to_mtd(chip));
 		WARN_ON(ret);
-		nand_cleanup(chip);
-		kfree(txx9_priv->mtdname);
-		kfree(txx9_priv);
+		nand_disconnect(chip);
+		drvdata->mtds[i] = NULL;
+		mtd_put_master(mtd);
 	}
 }
 

-- 
2.53.0

