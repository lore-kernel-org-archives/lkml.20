Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794566277;
	b=FvOC0ycq8BIwuI1F1SYHIaw1mN47SUWNHWfHkQCeZFyMvABhKgAouWK1M4nX96cCXUgw
	 QpPYs0y28868HBufKqj6452DLCw2WpuRMLL2r8/kg8R1kYrV5E+PSRkXY+DWe0yLTIb2P
	 s9SDXvVzUon2hUUOs2uez7ZC1BVqi0aynnl28mwb/mDLCvpKrorH5Zmdjxlida6h6I9k4
	 M7K558o7xqpmLIKPVG9t00GSCttFDQ9jA35AqRKL/taX2aiYp4ROfKxW4XkIWn5IvfZCD
	 lGPzBJ2DaX+3BO5Xj5Sx8BPh37b5zvOGt1ccmER+ZqYaXSlQkPIDyMcuK/Mq90GXxaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794566277;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=0q3RmALjF/bvDrFsLW6GlXC44FE9KFMVqpsZYQovitI=;
	b=Ame1jEzr9LtLHG8+c1pbM9MrecyX+ubXduY3Fje3pNqUQTni/Do7/m42yeihS7vDKEKS
	 pmrx6RoPuQJU2I51BwXeY7WsI+SxK0SGwEVpOMWtN5wpWXfbOlv1QTWxiCZhTB+NrXHID
	 gL8DPfbqp/iWwq2SuCVIFuVIbBQCX7dbpRr7D6iqICjOaJPOnEwULWxR5kGrw9PxW62D4
	 PH7GbLkP5LslZ/sthPBR3fQnSZiCZHDHbKekBEofrauSGdWE8TaGFJRb61q1zkNGSKj/u
	 wTEb/9iOwZSaTTQYEhHTUk78HC9VUqvwsFaS+brysZKcRAv2KBtTu6S7psb61vX9Pvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=e2WnIjX0;
	arc=none smtp.remote-ip=209.85.210.174
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04FC0606A321
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 10:37:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 04FC0606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=e2WnIjX0
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-89d6bd67045so379553b3a.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 02:37:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794566276; x=1795171076; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0q3RmALjF/bvDrFsLW6GlXC44FE9KFMVqpsZYQovitI=;
        b=e2WnIjX0L/uaDrA8lDs4m5wrhQjwIodzFg1NmphQM+jxOjr5jw0+fy5OcxlP/Vku8/
         wspc5rQNLXOBVwnhS4pKHBzEGPXHO0N/Bi1zOtPNCYBScjw5SRgqNhsh+I2TDKPKWOzb
         qmo00VSHrrE8znHmzMclufDTKDPl7ScPaVYnRzd378HcUQK/cjBW0vbCGgijuMrnNocg
         Qv/Dau/iqQd7om001B6rSUKIzVSpnjtaUMb77W7c6ex0NVMlW3LHxF2Yjl2LeSaWkPLb
         rTwOq7c3bZiRn+KaVaRtM+x4WxqeO+wS/yfOWK5muuEbz7EdrN0ywzr3hH09/CXEiBgU
         0AHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794566276; x=1795171076;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0q3RmALjF/bvDrFsLW6GlXC44FE9KFMVqpsZYQovitI=;
        b=rz7/uX4CBjnWjQ5/A87IHjOwjhgbKL+u8/Gv4RLc7PC9CYEbqK1QZe7krpZ0B15gc0
         hPD6UhYPd+FxC4ihyk+z11XpWvGcOTm9BAJWjnRkhs9hXB30jAu/4mg+s0DaMcLoUMMq
         tQZNu2qipmuxMVM+oOqT6MEBQ1rmllUK6NXpFRW/IoWU1jDLQKwbSybht9HtbAcfZHeR
         Uw3nVImdx1ls5LwxM1aA87ukKDzMbCvpBsIq8/UYVDpR0NtskZKWQvYzEDoJxWQPUGyi
         dERDlERzDIHsxhao5k8p5LVALM5G2AwryHV2qBBhZwIN96mWXX+Iu9DziXPjS6O35FNU
         +Okg==
X-Forwarded-Encrypted: i=1; AL+hErFJ8ogWFOWXRqJoSFkaJDwfBzI3rkrtNJODEMr0+mrA02tic54FRZnbRAAcGNXxEEr/APlBCU9f2R79lfo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+aXfQGdtbH0d13MaYuYBIUJy7mIfo0pccIqeifbRoFxFJdXwHP
	IH6/pF0zY5s4r6DvjecUtZnrGTK/q/Dox/2p5bFP0Pql/Nu3vnPEb6ll
X-Gm-Gg: AYBFou1s+jklZMIy39ciC7XnvmmBem7LNLwavO508F6ebow9NJtssvy4zYCpTeF7kut
	fam+0zqmHhYphWWwe8SgQSpwNA9OpyP5ryvvSPk7ICK2D/WOG2/c02dPztnTGk3J1Iaruaa8LQ6
	+lnFox9SA1afEOPM4E4RIEcymrKQtlf2OYGc/IY+9g7ybHdWdn3PsQpKiyn+X4nOj8/CK3vDLnH
	40VRDS/AOtpoi3TWjSdZ70PMZNj1Re5EKTMkFQJUclDumKpjOe5VWJl6JieBZJwFrgrPgeKOLCr
	OIXI6jeUoIEe/OrcLlMh6UVY4Rr0K5y0thQV5i5h0L4F5lcehBjNGAG04IGpDZm1L8AJgSwhrCh
	HqnYyUfvO2Z0mr2ub1OMdfsJx+lpHzhP9RKKKZvQYKkixc7WRxeFY3IeuLLl0DaNpvJeFJAL/tD
	WvVeahAGppxLYrxJhOjEDWJwxQpAZ3yuJyAR345CAVTn+ALoNKThpomkyS2DGrjQHWn6QzWQGvF
	S7gZTnEruKyRfyJ5y2IiEgUGx5KsYHeHy5rLTX7yMam0zbhf/0lvvS//xzZT2k5e5v04QcT2mOu
	5l9NhMhCibC3nHA6Yyqx7JSa9wUq3qh74NaKoq6s7LgUT9yzfuEwIPdNcUsqTEF8I5KbX36P7I0
	rXGbh7dYc2BXw76a7ZWUmdusHMgEkWsysoVeYfJVd7PHn
X-Received: by 2002:a05:6a00:886:b0:8a0:2d72:17c3 with SMTP id d2e1a72fcca58-8beb619fbe8mr1640146b3a.15.1794566276302;
        Fri, 13 Nov 2026 02:37:56 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed12a8682sm890955b3a.10.2026.11.13.02.37.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 02:37:54 -0800 (PST)
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
Subject: [PATCH 1/2] ASoC: atmel-classd: Simplify probe error handling
Date: Fri, 13 Nov 2026 17:37:26 +0700
Message-ID: <20261113103727.30449-2-phucduc.bui@gmail.com>
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

Use dev_err_probe() for clock acquisition to suppress probe deferral
logs and remove the unnecessary cleanup label, as all resources are
managed by devm.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/atmel/atmel-classd.c | 29 ++++++++++-------------------
 1 file changed, 10 insertions(+), 19 deletions(-)

diff --git a/sound/soc/atmel/atmel-classd.c b/sound/soc/atmel/atmel-classd.c
index 6693bdcbb8f5..117c8e400184 100644
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
@@ -593,29 +589,24 @@ static int atmel_classd_probe(struct platform_device *pdev)
 
 	/* register sound card */
 	card = devm_kzalloc(dev, sizeof(*card), GFP_KERNEL);
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

