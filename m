Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794821072;
	b=zzxhAGW8eCxejwflPRlvgK7A9ElHqQwzkY3N7WYRrENZ9JmfGDolwaQ2KrfOcTAp1bza
	 EzaAlu7P6AmhDi9AkAgjXjAJLZPBVRxMb01LZZQYdLXJ5xArzASxGWWfw+nn0S2S0/Y0Q
	 uLHvQOzN1qISadj4ggHUU85JL6rBoqIsQdrN7izpMgw2WGxinWwzEpeQzK79LYwOJdWeL
	 xYlbW8rR8qTgcpilN/MFf2bPPkPTV1CSkGUS+AjUI2MlJXQhFw0zy38tEnEZHeaKzBw3O
	 U6rZhdv1l8ano+pmgDDvc69giIzUU54CRT93xF6aFWz8NTDGCO5F6rwdUUamRxoDZag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794821072;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=GxMkERKJmX/L9djyDc07wmpOjUjv26OkhX/qedLHuEo=;
	b=xcLX+P88xzVlQPb3LWPX5lulrcksgng8NtqKD77rwKcVWCHvQc1qY+hqvjg8ymK3i/Ps
	 AAkl1RnwNqGE1zbLtY8QbdfaxFV3ZQm22p902Ay750blnnJqTu/xtlgJXGkdTX4RJETBN
	 JiYLlYzrTiHIvVEtLcbWiHrvTNi/YTWHESf+zyoXVnCCrC1VuFBZOUVRwD+jUg7q6lz4j
	 IF0tSWw6leAKaqQHWXEGPuq3Jo6zfC9nnmKnQJ/mIhdvxl5yKP04gXQKwqzOsGhGTH0Eh
	 WB1hRgIbzX0I6T5FIcjEETCw1T+bcpUhv4vS8bdvkStcIDkho31iIm9AwJVPBacyKJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=w5TQZv6b;
	arc=none smtp.remote-ip=209.85.216.51
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BF24606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 09:24:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3BF24606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=w5TQZv6b
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3b0e0e65adbso1474430a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 01:24:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794821071; x=1795425871; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GxMkERKJmX/L9djyDc07wmpOjUjv26OkhX/qedLHuEo=;
        b=w5TQZv6bsjLSNbXl2UuN7Zz3w6jxJSxACzi6VHaFEopvJshU+ZE/GtvF/oKwaBDwqn
         LcSz5N+EyC8sA8TeI9SX5pR6vDdocRF+l36aCz3jORKV6i3mR8MAZrHgk8cqcJ0Q36E4
         Aoq65Pp2cyExFNweTWWsCA5w6VTfRSl31KYdS9kHfW18qOkVSf4hcMrXU18hDAmolW2J
         2rOf3dqUvA4ZCrmVf5s9MI2IOd85e4PqBa6awZWv8mqZVUFGAIhaFU4yoLRYFo/ED/Mw
         7yWk3u2lP6cNZE0Na0noKBY0zURj9JHYCMHtlTPhzwrye0/cT8k6P7NcBNQAd6bBcwAH
         6Ytw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794821071; x=1795425871;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GxMkERKJmX/L9djyDc07wmpOjUjv26OkhX/qedLHuEo=;
        b=nDeG3r4Nl+E+7v0DGYaGHL3HlU0lCAIqotvj8kJP7FCSVf8uL9pFm9fjuDW1gp4yPa
         1H/vlwizxncsTd1OivVpKzOU2I71GomS3oYlFWwcnmA7Rq4vI7TGc3G/gRDMoyqHG+6N
         fLDPTH3/3dmAzxsnWdfqDDjI+pe9Hgr+beQS3c9S24tNJxICTDjKtdkOAe1YupWiSn4U
         MQvZSfyzblHV/wBlD/QUYAdUQ9ku+JU6Z0S51t5NpoWtFUUUOHF1h4nSQva2O9x32ot2
         BTTQQL8sKXVXF4rxDS5TX6fiBESMyjZH6ah/U9ouoG7N/YY6RYbS8s6nJPhaluSf5o78
         54Zw==
X-Forwarded-Encrypted: i=1; AL+hErGTU9/uB/bz4rxfEBJIsBG25vGF6gSXjhlLhbgQWB1XJ8zwfHMuDNf9s5LyfWUTS/276GoFdiXgqm00QVI=@vger.kernel.org
X-Gm-Message-State: APuU4Z81zhnrMHoY9Wd0AEZmWexS5NWLsgscrCizHr7pZxcvjmSau4wt
	yk8gg00DUezrASWjqqgCd+yvzLmXvBYHPtE+0xRTf9S4sNwDYYhyunll
X-Gm-Gg: AZFdTZeDTs5aicub5Td+sD2ok2gAOSGtdECFHKVLh0SQdxzxVrk4uCmX9LAviRNVt8s
	B+GYPTjxeBHvMnKg+kxvJlXbtyEXRJWfrfrIlOUp6yrMWr4CyiK9JpntNCgvEplmvTIBfSQNexo
	QcEZAiaNINLMW9C9MxtaY74T67KYcBR4BB8gvq+7Zwp5G08PXonoEyQWAi6y82eFkREwMs9S0Fw
	qVYFvP4URm+t1BqRVEupD9W5nfC5MniIqsUL6L+Eios3X52c5O3Cbye1+Ra+JTDElN7Su2SVaLb
	LIJtkjCoE3TDi/eMkwCYT1NQY9iuXrmkPxiInhwi0G0g4EtbYftmM1Dm9Sb3OJZLBsIN1lCQMG9
	m7Icrw7ODrKHXzzd9h80nJSEZX4TAfIHeXNnkwpATMEkgjDBD+PyEhNbL//NVQZwzUqOkH3F+Lf
	jLzkztxB2zShAJr6SNZ3uxgLbbfH1ge23r+/dXRcV/V/qOy9VP0KAh/z6iV5HVbqX5pZOZdBDY5
	ytbAyGhVA36RjbTtpAjUBrRR5tOUj8LhfWSMmmZvLcUUTylUBKwI1RjRIvheKaB17uZrABB8cjf
	W4Wg6eDbA61lfTCIo/UyJeqgTAthWHykGKcZVa4ykd2z+RVHxtIt2xmzG+5Vwil4rMngHr/409/
	68XA/aOtUwjAbAjVVWpt6Jon1pWmxswPc1dy0HPNUP4at
X-Received: by 2002:a17:90b:1d46:b0:3ab:f38:2b41 with SMTP id 98e67ed59e1d1-3b1b0a4dd29mr9560360a91.39.1794821071518;
        Mon, 16 Nov 2026 01:24:31 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1aec43699sm15661189a91.10.2026.11.16.01.24.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 01:24:30 -0800 (PST)
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
Subject: [PATCH 1/3] ASoC: atmel: mchp-i2s-mcc: Use devm_clk_get_optional() for gclk
Date: Mon, 16 Nov 2026 16:24:04 +0700
Message-ID: <20261116092407.514998-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261116092407.514998-1-phucduc.bui@gmail.com>
References: <20261116092407.514998-1-phucduc.bui@gmail.com>
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

The current code is unnecessarily verbose for handling an optional
clock. Use devm_clk_get_optional() to simplify it.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/atmel/mchp-i2s-mcc.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/sound/soc/atmel/mchp-i2s-mcc.c b/sound/soc/atmel/mchp-i2s-mcc.c
index cb0f3e55b05d..9d8043a85782 100644
--- a/sound/soc/atmel/mchp-i2s-mcc.c
+++ b/sound/soc/atmel/mchp-i2s-mcc.c
@@ -1073,14 +1073,10 @@ static int mchp_i2s_mcc_probe(struct platform_device *pdev)
 	}
 
 	/* Get the optional generated clock */
-	dev->gclk = devm_clk_get(&pdev->dev, "gclk");
-	if (IS_ERR(dev->gclk)) {
-		if (PTR_ERR(dev->gclk) == -EPROBE_DEFER)
-			return -EPROBE_DEFER;
-		dev_warn(&pdev->dev,
-			 "generated clock not found: %d\n", err);
-		dev->gclk = NULL;
-	}
+	dev->gclk = devm_clk_get_optional(&pdev->dev, "gclk");
+	if (IS_ERR(dev->gclk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(dev->gclk),
+				     "failed to get the generated clock\n");
 
 	dev->soc = of_device_get_match_data(&pdev->dev);
 	err = mchp_i2s_mcc_soc_data_parse(pdev, dev);
-- 
2.43.0

