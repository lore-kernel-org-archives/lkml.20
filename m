Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794803251;
	b=U44B6R3XmAjtEeMfU9BOSFuOD2ky4w1norqcoGzimHQcPt95LJ4pQPFoqb5bNENUu4yo
	 5TGQKZBMNh/Eg5Y8HP+3fb/kP6dXb0WRXldiCSLuHM6B6KS3IbXcQphsYl5p9Cunu/GFp
	 ypo+pOQuqLHyIfV+xsBw6yBaZx2e696G+x8o9h5N3eMAIwBPnqQx5FbYtZXbHeoB5BjFr
	 p6UsVbDyVRjFYTXTXrQ70oZSIVVdqcdZ/FucffxBczT6dQrNWpJTMMdrcUFTcyi6cKUdi
	 8tbyrPYnnuplZz9fNTxySSETVCK3RW2lJcI/wxlx32E4NftMApSBlYZQL4UaZiGnkiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794803251;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=L+vPKyAW8x8lk/lFIW4uRVkXgnzau8sRMCBsKJVkefc=;
	b=k48/v2r+jlHfw51NdlUvnH58l26LoN2iLML7IrSvU19fLqbdG0zchJtCTvPJ+OXWRJYA
	 DZYbadEaG0C5nmQgleJbJQWs8kK185CqhKZEG7vNWh3FXvhnIeggdWBC8IbYLSnc/GGNU
	 JwDkddrqvnFKqJDlXL0nIKuOeIDjwXB8EAkX3vP/SiStG2XCBczXmC6mcQSNgV1URetWf
	 KRUQK+6h7ygcr3Ymfiawg97BHMySPB+kyz/TKhm8Gahpn9WjCiJDVftazWID06iy/msxK
	 KxidCNfRlbwpNcncVRnHScQZuihW8w/sWrP2fRQXj+Q8C0TgFA31BTRRvrDhWJvKNRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R2LUE6NO;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F038606A31F
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 04:27:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F038606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R2LUE6NO
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-37986eb6fa2so3543608eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 20:27:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794803250; x=1795408050; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L+vPKyAW8x8lk/lFIW4uRVkXgnzau8sRMCBsKJVkefc=;
        b=R2LUE6NOj4PZSAUa2sdCAI45rv1OltN3TLI3chKU6BluHY9ktO6yP/9H6ftZTIJt8Z
         oWF86MvvH7aocEe7Mt4yOqk4qLLHvsWGJUYe+8oTlpm17kLUjiBvZFKILB7lfsUmKSiB
         qFKh/uHXmATEuCk46iisRKEL3c6XrFQGN1LxSfgrkpBkfa+CAeVfgHC/FWUC/TMrRUDI
         vofYfkeED2kzh5G4fBCpANSSyG7KatgaYbvNJAx6l4VM+Ltm6kFzYQFgVGWkmkCzjcKS
         CSgOs5R8+LIdsKsGdiyecYd5dYKDA4SuJJhpIWOYGFzLqZYauFBayn/WSVTtqLdME+Qp
         04nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794803250; x=1795408050;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=L+vPKyAW8x8lk/lFIW4uRVkXgnzau8sRMCBsKJVkefc=;
        b=PDdCjScBC2XtmVQpnmQdbz1K9ruXpds1GUBxnuTFndY2JhkyAtdPC1anBKCGqxkdve
         gLderztbqbDW7yIvSb2Jq+sO1TLtZbGbRJg++3B13KgpjVR4GK9aGrI42oAsMWzyvLAp
         F7uj7tRSaMEGHQj7DHayvs8CZ7wL1VWgG/TGRtD2GpOl2aHBBS14vZP0XvMng0cZJwX4
         6C3pEpYEy+4ZvyM+6MF6AUptJM/JFaBpVH3nGJTzfcDQnFCRk6lV5I0u12gTPhI+2+jP
         L7rW3wm+5pNoEXkhhR96FnWHatuUKNR80R5PRD3E0GhW/cuMKnqIt5nfDZSgjaGZ4B56
         KCtg==
X-Forwarded-Encrypted: i=1; AL+hErG2W4Rnpa5ed3JMCQejggkYCMJu3z/YKOcyoEKJdsdP/Tk4TBatVW8wm+Ie7y7ChFGY3JRKWzWGRLuMV30=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Z/r/0QgiAKz/5QZMP7yv5S8kF2FcTXBWZ8CRtVwEv9S6FYDd0
	2aVgaxgPMRdxkC8LGhwwTaWCSHKHueabPokqE5o8SaXvUYCur2J8owEy
X-Gm-Gg: AYBFou0XY/fk7Qio43JaHxaC+UFJ5KRBAQNbNywuIHiYUOcyYa98AwFKr8/nj5QNPcw
	HwFEo7ErH6VEBBBUCMy4ScGsNidgsZN2ARDqe0skBqJeY+e1z/ZjgDyVOO3jXiv0ROPMy4RgzFL
	4VfJhYQQpnyRuszajeSsDhZMy1b8WiF1o5ivPOxMn6UVIPpwi2UTQu79L9PITxRqrXrfMoaKFdG
	WsC5+DcMlAn4OedkSLAF23wfTMLSJikE/zvXp7Bp0rk3viwsmi9p9q+NiDKakHAR2qQ9ffiz7fk
	82/8Uhs3WLJglKCadFAfaLDMKjUC5umNIO9Yb22CtR6UroLzww+erQV108HjOc+nXcCgXDJjSx1
	oFd/5SInykAunhAnIucz2m0hKDA4vpCkbzEPRUgmwUqVQhcE2frZmXo41PwNBOmziU2SWKHirbR
	7aqjZY/U3i8fuKcPC8lbbVihLO0UqDEBnnbAUN1gSG22u5wsHdQi7/ZjdznX3Zn68T38OI3L0CF
	wPzbfPKs5PtOtvca0KyCvYaLeHdnTtyCYojSzBNeFMW/Y1W3nDVSs1+2CiMc3ZgBUwlWWPd20sZ
	73DYKeWumJYE/etIkq773ez9RPLjI73ZVLUGtMrZ5KrX62tB+DVMJVSdqDQHeGtLwgJwirVOz27
	ATsRRaNlbpBVNIDu/IZeX7wlau67aE0+Orq9uqbB56ZYS
X-Received: by 2002:a05:7300:d584:b0:36f:3da8:dbc8 with SMTP id 5a478bee46e88-379679dfadamr9965275eec.31.1794803249582;
        Sun, 15 Nov 2026 20:27:29 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795591f4f8sm30053500eec.13.2026.11.15.20.27.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 20:27:29 -0800 (PST)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Andrei Simion <andrei.simion@microchip.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 1/2] ASoC: atmel-classd: Simplify probe error handling
Date: Mon, 16 Nov 2026 11:26:32 +0700
Message-ID: <20261116042633.497423-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261116042633.497423-1-phucduc.bui@gmail.com>
References: <20261116042633.497423-1-phucduc.bui@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Use dev_err_probe() for clock acquisition and regmap initialization
to suppress probe deferral logs and simplify error handling.

Also remove the unnecessary cleanup label, as all resources are
managed by devm.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Change in v2:
 - Use dev_err_probe() for devm_regmap_init_mmio() error handling.

 sound/soc/atmel/atmel-classd.c | 37 ++++++++++++----------------------
 1 file changed, 13 insertions(+), 24 deletions(-)

diff --git a/sound/soc/atmel/atmel-classd.c b/sound/soc/atmel/atmel-classd.c
index 746e6bbbf423..59490e9effab 100644
--- a/sound/soc/atmel/atmel-classd.c
+++ b/sound/soc/atmel/atmel-classd.c
@@ -547,18 +547,14 @@ static int atmel_classd_probe(struct platform_device *pdev)
 		return dd->irq;
 
 	dd->pclk = devm_clk_get(dev, "pclk");
-	if (IS_ERR(dd->pclk)) {
-		ret = PTR_ERR(dd->pclk);
-		dev_err(dev, "failed to get peripheral clock: %d\n", ret);
-		return ret;
-	}
+	if (IS_ERR(dd->pclk))
+		return dev_err_probe(dev, PTR_ERR(dd->pclk),
+				     "failed to get peripheral clock\n");
 
 	dd->gclk = devm_clk_get(dev, "gclk");
-	if (IS_ERR(dd->gclk)) {
-		ret = PTR_ERR(dd->gclk);
-		dev_err(dev, "failed to get GCK clock: %d\n", ret);
-		return ret;
-	}
+	if (IS_ERR(dd->gclk))
+		return dev_err_probe(dev, PTR_ERR(dd->gclk),
+				     "failed to get GCK clock\n");
 
 	io_base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
 	if (IS_ERR(io_base))
@@ -569,11 +565,9 @@ static int atmel_classd_probe(struct platform_device *pdev)
 
 	dd->regmap = devm_regmap_init_mmio(dev, io_base,
 					&atmel_classd_regmap_config);
-	if (IS_ERR(dd->regmap)) {
-		ret = PTR_ERR(dd->regmap);
-		dev_err(dev, "failed to init register map: %d\n", ret);
-		return ret;
-	}
+	if (IS_ERR(dd->regmap))
+		return dev_err_probe(dev, PTR_ERR(dd->regmap),
+				     "failed to init register map\n");
 
 	ret = devm_snd_soc_register_component(dev,
 					&atmel_classd_cpu_dai_component,
@@ -593,29 +587,24 @@ static int atmel_classd_probe(struct platform_device *pdev)
 
 	/* register sound card */
 	card = devm_kzalloc_obj(dev, *card);
-	if (!card) {
-		ret = -ENOMEM;
-		goto unregister_codec;
-	}
+	if (!card)
+		return -ENOMEM;
 
 	snd_soc_card_set_drvdata(card, dd);
 
 	ret = atmel_classd_asoc_card_init(dev, card);
 	if (ret) {
 		dev_err(dev, "failed to init sound card\n");
-		goto unregister_codec;
+		return ret;
 	}
 
 	ret = devm_snd_soc_register_card(dev, card);
 	if (ret) {
 		dev_err(dev, "failed to register sound card: %d\n", ret);
-		goto unregister_codec;
+		return ret;
 	}
 
 	return 0;
-
-unregister_codec:
-	return ret;
 }
 
 static struct platform_driver atmel_classd_driver = {
-- 
2.43.0

