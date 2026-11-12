Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794464285;
	b=dpJsx+5T+5xYzVKwkQ052BLJXSl/UePkN5ESpT6OeZyU8AAzNpZUK1JlxczdEGlRS75G
	 P80fMJ0889uHCqMeItXB64pBo4hrr0t1IC3mPYlW8SEl2a/DDl2JGF63npJaGt9gynkzs
	 anR/lArvvYnXkiEG5jqcD+22IR6Y8yeir86zjvDie2prfRA2i9iQuhhTtPOhPXDaJm5Z4
	 89aVx4Ux106Tmz794NasQVeEYCeb4la2CdEQVETR3XM9PLwyoHtkechZZJkf/Y2StXKQf
	 p6S0AekXAqOHih0pxPix9YOQmzzmAAox8DY1QWfLpEcm+6+R8QUuO4eWuJzOZCcReaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794464285;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=/MIwZSnhApfikm80S9HZrGcLf+++ffdILf8yJv3pCLw=;
	b=p1vwXlkD3HmWxHXPydDK94RqXQbTfaSeWc6Jw/kmxKdbxIAPCNZlXYiSB/U5ZdeD7PQm
	 EyHP7U5LF/UhNHjAV0sKdzxrS/Tej7FSnFUZtRKqjD4yAs3RvNcyFiTX95uozVS951AZf
	 jejOpF89FxGhoapO+XiiZZmnz8PQVcejUkO9UrgzX7AkGqJyz1VFmMDXwm/bgPFyIZgyj
	 VooYUEdpNcPVkvQtXquD1IPrfd49iVUoUKgoQiM8NSqMm1JXX4Tqo9HknXoDn1nkhUNMw
	 xFO0ZOfnRTUEpVIeCom1ADn92IdU4Lfe50tbeO6WtgaIE6wUv2m4Fp9P/AcC6Ta/Gug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qXDgBWS7;
	arc=none smtp.remote-ip=209.85.160.172
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14601606A8AA
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 06:18:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14601606A8AA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qXDgBWS7
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-535179e995bso43028231cf.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 22:18:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794464284; x=1795069084; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/MIwZSnhApfikm80S9HZrGcLf+++ffdILf8yJv3pCLw=;
        b=qXDgBWS7iiuYaUU6CLz7LDkIhvYowwhHNaWI9iXy8JrJGb9ldHuxdU2L8/Xd83dI2e
         L1O44EcNrPJynRbi0VNR5iVSGPK6mYhGVnm/cSzohp2cXjo8wmDzozoUMQQj3XqCXaCI
         kI4BcCM8xK0SaJOZTxNcryAhfPh9BId8skiADnMnjJeNPhTajKDXsioIWVwL2HuMbBID
         2yeVxBtVBalZf0Y26eP7pUXKme/+cFDbvTh3PBMaodKyG7o7Tc+c27zoOSnS5A6gYy6K
         qQvvuJjg29rNBEM1MEIoE1Rp7ACq6X6LnerASqrI39UgEfzV1/+meSSj/AzXDW5co4eD
         QaGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794464284; x=1795069084;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/MIwZSnhApfikm80S9HZrGcLf+++ffdILf8yJv3pCLw=;
        b=166sBSCAp3w8Ru8nwzV2BszES7VxIdGX2/PMx0kaQX2SshPqEZAFnx4TtHQ7lmQkhJ
         ihwOtSjuc9PvVvSUC0odAXpg2ob6V2NHHHbQ5NWQGJgFHe0iUfv9sFMPcfiWCWi0TDRh
         rizvLlA9pWULeSqEc8eEcSava8vlH4wF1Xis99BuDdGC4QfydOBLsPy6jADoC2zLkSuq
         oALyBn6AF8q+2M46ZYLnr1FvpFR7yPyGMZmE4lKouOBOdFuRD6V/6reurGiA7Wxr9p63
         ZsBXPBqLKBhFOleCYkHk/DGsbsGnbGiH2Hs+T2BAX8GsAig+kVdrWv1TKGDmt3fhOpIb
         S0lg==
X-Forwarded-Encrypted: i=1; AL+hErHghjuqEJgQ+Dhv/CCWdLJVMhYojAwRskdfPk7XfE9eqSiyjUEvtYuot8l+t0fwCqYEwcNuIVCbIcRoU2s=@vger.kernel.org
X-Gm-Message-State: APuU4Z86EgbaMWuXhr3N7sYn8vpZ6V+8wUxm/eIpCk21Rcc99v4sjLFE
	k+/UdpAZOshZgQXK8HLZ6YVnEhrQpkietzwCbJkvwxd6DucgGJ4x2WE=
X-Gm-Gg: AYBFou0SiP0zcoL4+xF9nutl0qwHgbz+KNlKjZesjn5tJQVjfm8TlKVSZiCltVqDIYG
	b351owCsmpYOcUj7AOw51ig0DKOTb+MbTYTaYJ2xEfCCdcKVA0h9kGiLggpblCf/Yz+IE8mNxKK
	Sy+R/sirFGowrLX0m8JeHEuj8g5UCQQWQk7duJAv5icPKkdrsz0hwTx/0uvfEJjcbDcO4YsP9ea
	bzQj2eQ/bk8eOSmifZ7wX6YowwFWYXkK/PVok1DOmg5OShn35F1xdHy4EpmIRvWUOkjUi/7Dgxo
	qDIZDUwzcTw468xIGvcYpwkx0S2yi0L+qQh1mVeO1WtlWHn8xYi1q8aiVGJpwLRtdZQte1w/jJ7
	rHpZ2FVsvo4KYuG6Pl+bpbqI1h8nBWC95AxRJMCpUbVIsps0yP0e8YtMQOAsuz9PIPvb+DXJmXn
	bPDvi1OE8qOmbU9Z2a6q6ZgjWD+X8sZC0meYZT5SF+GNx1OYZeEDG4XKdlhXfsDemAipSCI0WVq
	UIGhDq8ASnuuWw5VGm7+yiTLTgt0s/+KlpPdZvzZAgPCEHKPPx6gS2BuDKcGYpvzk46NZGMdNBv
	g3Az+TGpID50rUX0jHPdkOtMgDbX/zU7erHi/chTSeHumNEVECXMb9De7RS7uMB+JaRFgr9wz7o
	i8HJb4yQtQnxpXdyccHEp0iO02y5Ixr059UqaiKRmFLxvG6WvSHM1fBSdfJio5ujEnlsm/yvDkF
	wCF9p7WdfyrTVHifThe2gapd+LtFyi456h
X-Received: by 2002:a05:620a:2257:20b0:947:b201:fad7 with SMTP id af79cd13be357-947b2022eaemr552868385a.67.1794464283900;
        Wed, 11 Nov 2026 22:18:03 -0800 (PST)
Received: from localhost.localdomain (h16.44.55.139.dynamic.ip.windstream.net. [139.55.44.16])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-947a5ac3f27sm513931985a.22.2026.11.11.22.18.02
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 22:18:02 -0800 (PST)
From: Myeonghun Pak <mhun512@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Ijae Kim <ae878000@gmail.com>,
	Trevor Wu <trevor.wu@mediatek.com>
Subject: [PATCH v2 5/5] ASoC: mediatek: mt8188: Keep the AFE IRQ within its resource lifetime
Date: Thu, 12 Nov 2026 01:17:49 -0500
Message-ID: <20261112011708-afe-v2-5-mhun512@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20261112011708-afe-v2-0-mhun512@gmail.com>
References: <20261112011708-afe-v2-0-mhun512@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The AFE IRQ handler uses afe->regmap, but its managed IRQ is requested
before the regmap is allocated. The audiosys reset earlier in probe
makes an interrupt before that point unlikely, but devres still
releases the regmap before the IRQ on probe failure and removal.

Request the IRQ after initializing the regmap and before registering
the component, so that a failed request takes the existing runtime PM
unwind and devres releases the component, the IRQ and the regmap in
that order. The driver has no remove callback, so the IRQ needs no
explicit release.

Found by a static analysis tool under development.

Fixes: bf106bf09376 ("ASoC: mediatek: mt8188: add platform driver")
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---

 sound/soc/mediatek/mt8188/mt8188-afe-pcm.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c b/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c
index d9c82cd8869e..2a27e5de9184 100644
--- a/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c
+++ b/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c
@@ -3306,11 +3306,6 @@ static int mt8188_afe_pcm_dev_probe(struct platform_device *pdev)
 	if (irq_id < 0)
 		return irq_id;
 
-	ret = devm_request_irq(dev, irq_id, mt8188_afe_irq_handler,
-			       IRQF_TRIGGER_NONE, "asys-isr", (void *)afe);
-	if (ret)
-		return ret;
-
 	/* init sub_dais */
 	INIT_LIST_HEAD(&afe->sub_dais);
 
@@ -3362,6 +3357,11 @@ static int mt8188_afe_pcm_dev_probe(struct platform_device *pdev)
 		goto err_pm_put;
 	}
 
+	ret = devm_request_irq(dev, irq_id, mt8188_afe_irq_handler,
+			       IRQF_TRIGGER_NONE, "asys-isr", afe);
+	if (ret)
+		goto err_pm_put;
+
 	/* register component */
 	ret = devm_snd_soc_register_component(dev, &mtk_afe_pcm_platform,
 					      afe->dai_drivers, afe->num_dai_drivers);
-- 
2.43.0

