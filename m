Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794364125;
	b=sHkGyMFfVvkqwWRxMdrlIfB4O0to2EiQEmSlhzLc+X21t4S8tijPOiWn48Iuimz69w7C
	 T0kAvWk3DUu3PZdD47scccxjCOokQ+fE0vcucqNpXrI9THb3XMwKfm4nLtq/+sSGGNsBm
	 GXDvXd5Yht0R6FlDq1CjbQSamC/lim/kdLdDhU9PMVyS8Lp7D3Kz0nsU8OXpoa596ATM6
	 UpsGu0Piz7ENv92gv3iCAw+jgXJ+Iy6JVZBLGMvmpLU9jySRDlbNwqZPVc3cihZE43IQz
	 oQEb9vxfCNJ3qzgkNvXeQ39x20qrDxDLf1ZTZJknBOgGCB7Fb8nhFUm5xJIH/qq1aEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794364125;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=RO0TWmyr4SlK4vnJ9oWPCyNZsIrR50vQnWfFlV2WEBE=;
	b=WMj4+IKtf8C+XR/2CQ+DnSfJMPj8bhkxYHwXEzKazVYzfxEO+X8CraVUOvaxr0RItJuA
	 wK62pgrEhrRJhK3bo3WS2MeLwM06j3x13WskSxhrsnLYViUaJEJtcPFmILYyoo8mU2X7V
	 z92hNMaoHzHQuggS/0skywvcvMa7XP5iJJ2RKPhg5c1z+DZ8mV4pT2kDbqrdDcamcn2fk
	 ZSWRR0CAkMEOz6Rh+WionmwRbSfFoS7EFTmm7OPgEJJCnq9Ml9eATt+onJbXTrTu+OTBC
	 2IR3G2IuqiUvHRKcv2QWvJlePR7I+RyXfBxjYpcLokNx+HoxXzmiEyseeZlo7q11IEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="ubOKQ2/D";
	arc=none smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17883606A331
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 02:28:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17883606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ubOKQ2/D
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-15dd124bbe7so3785598c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 18:28:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794364124; x=1794968924; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RO0TWmyr4SlK4vnJ9oWPCyNZsIrR50vQnWfFlV2WEBE=;
        b=ubOKQ2/DOarFo+yXs3ZdYkKzOayNrnSS+hm6eZWzlAYlMdSo5AMumLxOJhztgJLxzr
         GQg7MYBhySHxasGAWdPP9Flcmxy0xkATn3kloXOJn8/VNN+3J/r6+VArTgmy7xPha91M
         JPGbufTQ4RqqXiPnPQeZg4EK0iHEveoZxS2LlUWHPsPWqhpW9pbgAVP1BBsN9ypFYGpv
         CXzNhxCCsmrN5DM66c0XCjr6IGQp98rB3sVUjc8QV2mSjqnNdsUKiQeYdRroTax51Zbf
         1bIXtVNrCv239NAkCc9lJ8gULxN3j81dpYgsbajGn7s7QfKx7r0IGRXBSWYTA7hps9Ig
         D9vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794364124; x=1794968924;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RO0TWmyr4SlK4vnJ9oWPCyNZsIrR50vQnWfFlV2WEBE=;
        b=RLxC2WoNpwCNhIbtU3hDx7HVuzbuJCA5pjOVd5LknBnygfwxTd7X/ZiW24bAxw094R
         FtpTbIkUpL43XzKJL3zMbKua4AM1otHOCyumU21kkphVQY0YQmauJkNUQamwXgW673Ck
         b0kNz2yEhM72uhn/nZImpdtJ8qr53pfNXIY1U3Y7LMOVc6c6jad7zcYk0S9Nx5ydmYRm
         /yb9L3nDOpBqWnpvoTD8CnVkKLUzF9AEc/mTg2DCJs1PbkuIs6rUGu/QhqDz4MCRw8bg
         FkSOfHOOvv2sox81/PDSu13hAY/U4wdzcvE43aUcgQVPbrnX5QzPk0VRguvEDQCF+YZt
         58YA==
X-Forwarded-Encrypted: i=1; AL+hErE8b49jsmxQm7pKSrNfqCuuzf8wY1AeH+18SmkAJN2y/kP8ciEqFwJIiG3ZfW3WCkWGF9U5lWkcAzL5NFA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Bog6Fhek7uGoConaGRw2hlHjvn1uBqtzNbERVV27IEZS7wEHS
	oLnDUWeLpmTZDT6JzEL6kDRAbTVzbEloYXNgzTNh/J69jftvjCnTUveF
X-Gm-Gg: AYBFou1pO51LoDyJ1u53FIexM3IFKPcRt7ZgtXo9Trx/zGsIwbhm6Hk6b7R4XmZSseK
	7WsGGaeop7TrMyHPr1ZLSkR2yGFTfBXg2RhtdqM4SmdGD1x5j3Tz9+mt9yeyqbREnOH+GkzUR6U
	HutxWh6V22GtS3gPQ+I74845ajap1dSLlpV3G47uPKH3BG2XA+ZV3cEqHKs5NTpFMX2dulmoUMF
	XmJNoInASMH5hWP4ja1m/xwdb19JJeOn8s4r38Wud49EtNzF1mMtJp+181hs2LRWDhAZyqV4Jmz
	TYz9aGXjzuFRNEdT4tEF5jenO5VTXv5Vep2Rdwt/THMOwchztKx2sbVMDKPepAgmKyTm569kjM6
	4Tslw4M3yzVAd73FRHod3OxdTHc9d4jx5LZbnhV8H4+U8mEVNcNwkxV3U6LKePNBeYnMfpLnxHt
	tfvvMWGoheOwMr2MxjId2CUrCe/PkOGt8ZzpmC2lk26ZdlMDisL3Q4UCNpmZ1F2g35ckVLB2g30
	ccvZrlb4GyRGXXUnkoScWBJXBm4GEP11yS0gLyolbX4k/Ai/6fLRIWrN1lL2jc1YbSqEJXAmzUh
	XXcQE4qZHRphwLAgeo+jD//PYPI+rPj+nDb6/MXLC5vbvE9Y+vrv50sVUiWpegdJbG/A/uhb3ss
	CBsrCQkS7rVEffZ4E4aWzaNUM2g91Uk4QDVIehgmAWLWxJQcnwLyiwPAs2I0VpE+c/zo=
X-Received: by 2002:a05:701b:2219:b0:1b2:4378:3545 with SMTP id a92af1059eb24-1b3c0304417mr926808c88.21.1794364123831;
        Tue, 10 Nov 2026 18:28:43 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b4b90csm10054285c88.14.2026.11.10.18.28.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 18:28:43 -0800 (PST)
From: phucduc.bui@gmail.com
To: Maxim Kochetkov <fido_max@inbox.ru>,
	Andrew Jackson <Andrew.Jackson@arm.com>,
	Mark Brown <broonie@kernel.org>,
	Xingyu Wu <xingyu.wu@starfivetech.com>
Cc: Tim Bird <tim.bird@sony.com>,
	Yuri Zaporozhets <yuriz@vodafonemail.de>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v3 5/6] ASoC: dwc: Propagate optional IRQ lookup errors
Date: Wed, 11 Nov 2026 09:27:30 +0700
Message-ID: <20261111022731.8243-6-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261111022731.8243-1-phucduc.bui@gmail.com>
References: <20261111022731.8243-1-phucduc.bui@gmail.com>
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

platform_get_irq_optional() can return errors other than
-EPROBE_DEFER. Propagate these errors instead of silently
continuing, while treating -ENXIO as the absence of an IRQ.

Use dev_err_probe() to report IRQ lookup failures and ensure
the reset is asserted when IRQ lookup fails.

Fixes: 564db8b8da8d ("ASoC: dwc: Propagate -EPROBE_DEFER from IRQ lookup")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v3:
 - Ensure the reset is asserted when IRQ lookup fails, 
   as suggested by Sashiko.
 - Add a Fixes tag

 sound/soc/dwc/dwc-i2s.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/sound/soc/dwc/dwc-i2s.c b/sound/soc/dwc/dwc-i2s.c
index b0d3413c27d2..55a5dca7b79f 100644
--- a/sound/soc/dwc/dwc-i2s.c
+++ b/sound/soc/dwc/dwc-i2s.c
@@ -961,8 +961,10 @@ static int dw_i2s_probe(struct platform_device *pdev)
 	}
 
 	irq = platform_get_irq_optional(pdev, 0);
-	if (irq == -EPROBE_DEFER)
-		return irq;
+	if (irq < 0 && irq != -ENXIO) {
+		ret = dev_err_probe(&pdev->dev, irq, "failed to get IRQ\n");
+		goto err_assert_reset;
+	}
 	if (irq > 0) {
 		ret = devm_request_irq(&pdev->dev, irq, i2s_irq_handler, 0,
 				pdev->name, dev);
-- 
2.43.0

