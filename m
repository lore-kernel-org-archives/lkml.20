Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794566285;
	b=bdn1I/9ocXDw2Dt8Dekdqk//OdWOugac9eyWpi5a8uX3W2QEuozFN2RLSm4+CW7H3EeR
	 GdaQfWNXZlrHEomgrwHmvQDNVaZhsT8rO3r7+LcPaS1fUMrAHPYm6VFfjINF81Zj94bRJ
	 N48pw93OkHWjZDg7oM1cMULLfhuIbsDoyFODCYo2D8M+BMXES5ENQ107CjG6Pt8XPuICy
	 4Z7lX5v4e50xKwNNPpI9DowYp2U21JqT8cG9eMSFbA8F622S1iDnijUfZIsFFFzmwd7tC
	 d7JwMv9qUUpiV9aKGQC8wALxS6Y3GEBHYbJy41TR+QXrb2LgwPB/Yh5ewlyxRvXxL0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794566285;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Mb8tlnodrofCrSAqZEvoJQbBu1LG0AIHx4hhl5dhBKA=;
	b=5q48Gl3zX5IW2nQOQShTTFVWwxVGmwf9MQ4M3xvxcl57G24K+OMOFou3Iv59X8G9O8kl
	 uLIvm4VIxnklo/QziWOtQIUwUTZ4ct3IJB3Cps0f4dp8GIIZ7WWGp8MR9coKBhrwQE/NF
	 rG5SnTbg6RTLicJoLf7Qt3FTUSPI47/dZKbIsA5XiQlHAineiU7SmikVeLUcXMIJjS7PY
	 8/GW4Fe24rTyBJcU9VQzh0txPDh7L0/0yAaw5rVMRbzf+cJFED59WoqV+cbSOOwIkd0KU
	 1FXTO0aXUueKZDaoU9BLMmtnuq+rJRtIAwVRlTO1u63d9EuPFr8ERL+vpsr6nFzgm/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OXJ+j4YP;
	arc=none smtp.remote-ip=209.85.215.169
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0C1C606A894
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 10:38:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0C1C606A894
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OXJ+j4YP
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cdb684859cbso914862a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 02:38:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794566284; x=1795171084; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mb8tlnodrofCrSAqZEvoJQbBu1LG0AIHx4hhl5dhBKA=;
        b=OXJ+j4YPEzROMci4/6WBbpm5mmIBZilGdKCSUh9S4IzpYLnyzdiArHKawdZV8Q3iAB
         ArnfdARK2ycY73RC8AYJjwpVIKZUnzce6gdsuNIpgcRCPgm3XLWC2IEjQgkBM55q9MQr
         HYZPZJwykMZHx4xRWn5bvQEJNwGkRb34r04ttFN50X/7XkxfwwdOl6czUeDfLMNRUfIs
         XSiEpHzhl2r3jKtzdjAvPe2ywW9lFPEQf9zvJa+oFcme8SCkYbumhyG6ydX1m3E4s/2A
         vQVy6F7qwAonKxQHUTmW3PWTIv3FkP6s/Igs0z1Qyzv/wDOfCSSoroSfZWE7HwH2rKV2
         x/jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794566284; x=1795171084;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Mb8tlnodrofCrSAqZEvoJQbBu1LG0AIHx4hhl5dhBKA=;
        b=e63ENr+2vCq945StGEMOJm7irjtEL5F2nnA3h1gUfOnQUPV6LsBDUd5vl11eDJhBYK
         V5kwnqBgAP7rVsBo+5nYhoqa8SVD8xh5RrIDHHBJ49j0VDBC+/Wzzej5jeECTU77bPST
         tksBK+zGRspwvBqEixsyEA4lSnwYO5BDR5m+iHaGgmNHuEcuOhCVU53GNuGv2NXZpenJ
         I1yskXlGNEcQWysFgFGUO5hcjsAXwNHXWCGFz5a/mo7HGSk93czkkb8POhDrFLm5JY2o
         66hliHB2pR8c+hN+wBLlZGQ5PWc+p2oJwqBnNVvpQbfmxOxd4eBap59YWKcML9UjHjF8
         FZGg==
X-Forwarded-Encrypted: i=1; AL+hErGObKsjO5pQRfw4ct4ZmKvOWTiYoRnj5HYh8ARxxElT0FoET45Qi1b+kAzCl5ZjHg0yekgZNje+kSMBQHE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9xYRYu3W7RITK82NTfZ72NfO8wjoxrDWoYBM0KJORw2DwBRqiC
	QGVJ9TH9g72XnQwlMSdSVTR4B1NDSkb8jawgnqWymf2f47bbCxBzp428
X-Gm-Gg: AYBFou3cA1vuwJo0rUE2o0ttFqLzEbBemX3FBt7KCsg8LCSUApKk21Eny/zur7+84JL
	CCJfkiWl/VEaHd0JaIu8C3aHrfPQsiwdkUmJlVXjL2pP55L5nkUG5JpqCKo4oFmrhBYm/3xA6km
	mVjd0+5tbl3jpA0ZydLoA8hWwBDfSK5M8Cn37giYpOrLNiTpWC6q+MbNtMmS/ljFZrOoccCBjcW
	2VBdS0CxLnLDGlP8nv2nWhffXDGyY8QltMUjc6IBQpHUTLHP/hs8e6pluhNVim0fbjQAcGu3DQO
	yvAyoJ8rRrGXaVAvYlKccKFblmNSKbRwqwFRkC10KBgxH3+eKiB2/3FS+dwTaliT+7wU1RE86Rv
	CkzXjb3+dUKVxgSEuMEvZYwUpVM9D0cgTRPEvNT4GneRWizJWnASVoU7U1GqE0nySufnFWy7Smk
	Be+sEcXHrr/CZRN00oIAds3+t6Akyl+O/4hfSNJh07YQ4MkanIb1NlNrkeR7pYqKD8XwrCeKemE
	yd2NdrL7irmLfqrvH8RU8kAyuaMOXzTvdcjSjAnfo91mckUogGv2X6McGadK12rB80TE3z8HqGD
	pjy5eIe71E1GiErY0MP+kjQDm1ORnMQa7eWxAYB+f13GuVgRN4ki9XGbfh+EFwwfmaY0hWXrfd+
	C+gPxe/VM+7ch8Mb1ijra69v0YNv9szkC1tyWK5FIvayY
X-Received: by 2002:a05:6a21:687:b0:3e0:d032:31c3 with SMTP id adf61e73a8af0-3f7a7ac97ebmr1933929637.46.1794566283860;
        Fri, 13 Nov 2026 02:38:03 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed12a8682sm890955b3a.10.2026.11.13.02.37.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 02:38:02 -0800 (PST)
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
Subject: [PATCH 2/2] ASoC: atmel-classd: Enable pclk during probe
Date: Fri, 13 Nov 2026 17:37:27 +0700
Message-ID: <20261113103727.30449-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261113103727.30449-1-phucduc.bui@gmail.com>
References: <20261113103727.30449-1-phucduc.bui@gmail.com>
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

The peripheral clock is enabled in the startup callback but never
disabled, causing its enable reference count to increase on each
startup and preventing the clock from being gated.

Use devm_clk_get_enabled() to enable pclk once during probe and
automatically disable it on device removal.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/atmel/atmel-classd.c | 15 +++------------
 1 file changed, 3 insertions(+), 12 deletions(-)

diff --git a/sound/soc/atmel/atmel-classd.c b/sound/soc/atmel/atmel-classd.c
index 117c8e400184..b6d815804e33 100644
--- a/sound/soc/atmel/atmel-classd.c
+++ b/sound/soc/atmel/atmel-classd.c
@@ -122,19 +122,10 @@ static int atmel_classd_cpu_dai_startup(struct snd_pcm_substream *substream,
 {
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct atmel_classd *dd = snd_soc_card_get_drvdata(rtd->card);
-	int err;
 
 	regmap_write(dd->regmap, CLASSD_THR, 0x0);
 
-	err = clk_prepare_enable(dd->pclk);
-	if (err)
-		return err;
-	err = clk_prepare_enable(dd->gclk);
-	if (err) {
-		clk_disable_unprepare(dd->pclk);
-		return err;
-	}
-	return 0;
+	return clk_prepare_enable(dd->gclk);
 }
 
 /* platform */
@@ -546,10 +537,10 @@ static int atmel_classd_probe(struct platform_device *pdev)
 	if (dd->irq < 0)
 		return dd->irq;
 
-	dd->pclk = devm_clk_get(dev, "pclk");
+	dd->pclk = devm_clk_get_enabled(dev, "pclk");
 	if (IS_ERR(dd->pclk))
 		return dev_err_probe(dev, PTR_ERR(dd->pclk),
-				     "failed to get peripheral clock\n");
+				     "failed to get/enable peripheral clock\n");
 
 	dd->gclk = devm_clk_get(dev, "gclk");
 	if (IS_ERR(dd->gclk))
-- 
2.43.0

