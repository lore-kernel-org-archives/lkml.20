Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794821080;
	b=EzzEDcY2fPvIWbsrTvKf5WiUUzu8gB6UILVfQuXedyErlax8zlnuTYYcUsaa98NE8hrI
	 HMUmaWeQT6oZpH3Ia3oT47RYV1ZUmW7Hs1V5e+wwgKKJ1gNUY8VnMrZJzK8fBbgLAwd8Q
	 DnnishJ8VCrL4Mt04eU6ftGLoKcb03Msz/ZoE+Btdhkew48w3rldDYbcyUdnpvm1cOoNH
	 +qR5clxaYKWdUqRnQP9RnDWJ5LdqxooT1eBbbOOR7c16rKSAd8yoF8MaLsxIUmdCmoQTI
	 c0EBmWe71HQtbcguFiMw1rsmwDnEJJwVhaRG78htYZsCFXS1k5sYbN/kmOwsueBSdaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794821080;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=XBl6SSviqpQOksI/O76xGkK2rzDNjLeiKDxI3tZWuYQ=;
	b=plvarbNJGt1WtMvU+JjkqlsUw2Us8yERRM/YeXCZlWdhkwjfGsFUpRJkUaAQ3GhVWIjn
	 /tuUu2zAMYmKcWH8N883DxFoyVeGLPf322/L/nzgbB4zDL3gFK4TvG5TxasnRsOep3g4Q
	 nYykqIXvs0A+nnRiTGjcYGwsmZTaq2osxg0LFTzTwdVfTOMhZOCER51u336h6quPM4ZgB
	 mw1USWbTOl6zZt+kA7LrIZzoSIhUXF/+okcS0TU2pyXSrjdmCPbaASClbcQHpG/9OCUv6
	 0LhcoN5pXmMlw84q+I9kPreQbNHFpuHlIdtiYQ6bZYr7VAD1r2raSCDbxGFx7K7kpPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SuolmalW;
	arc=none smtp.remote-ip=209.85.216.54
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71990606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 09:24:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71990606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SuolmalW
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3b08a162d4bso1708127a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 01:24:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794821079; x=1795425879; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XBl6SSviqpQOksI/O76xGkK2rzDNjLeiKDxI3tZWuYQ=;
        b=SuolmalW6iv1mAhR8LZKmrFTcEC62Y3yMvpvS2G5mTr8q74VK4ZYvVf0zaLg/Qjzhz
         lpC9DbZrAAEH0AMuyZxdbP+HT0nczDIKcxRjiE+25IY6AXyewsMrwK80XMAoAEoG64sB
         LBRCNfJX0sqbq+9+q4md9b4rZKiwVwJGVauLQmJOkAuYvg0BCWFGreiDk92JwGgbpzDJ
         TGhgOqZw590ovoSL0Xdp7n/uiSO8XBAAHqyj5nMcbhH+Q9kF41wYcTFkneBGxtQ34SbS
         SuWav31sdpzZzK6fywOop1fVjaZgWohzSP6kZVqXd60mOLUcjaUw34JFQI85lO1i/som
         y7Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794821079; x=1795425879;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XBl6SSviqpQOksI/O76xGkK2rzDNjLeiKDxI3tZWuYQ=;
        b=P53zMm2fHAGLAC1kod79pNkLxAVZPuyGel37i+ms6ScD+m08RTfDckL+yUssXdQ6yB
         9RrIjdrPv9yPab7TsEe7PxibptXVi2Nl6IFb6sM2jZFijjuG9pM1pnnt4a/2eIstUuUu
         aMYLIB84Mlm0JONLX4ft6SKKa6Dc7H1eQVXAJxJu7MYOl2SKWCHGOD4i0OQF7j7AuXko
         QN4LXkumFrdlSnaWKxp0XnybVI/jiUPc8g4FFzJsX+fm3292PV0eTSEzu4hosDSFeIxs
         vbt0u67JtEKER164pFiHPx1OOJD5OYrX9sPgB3I4wn7GWyc5551mW5J0GmpMNh/bj0U6
         eltQ==
X-Forwarded-Encrypted: i=1; AL+hErHrTZ0ubw5jBGT8KyrETpSQFlFqtDwmUUUsyyLmYVGhnCy5MXJ7PpmtMrhc33xSsbmIkqmn7y3Bar2TjBQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9J1UKaK0TVJmH/N3hDI4M4W9FmhhIANukEEqEG3suLaOoPjK8k
	PllMSFEOlxmtCLxVAptVu1tQ0mGnF3vamK2dhAFTBFCtLqAzA6Cltwcx
X-Gm-Gg: AZFdTZcHH3vF9RMBj6bROwcq/PBDKtoH3XwQBLjYGGl98tU1HzYRiAgcKiOHQR2FiSs
	Eau6MYN3DR9qOEyU1iJQrN/qafVgBdLkMwoVtzdSLfAKnw1zLKeNlN9I93cwASDiAUbrJY3s5wn
	GGU9t4aYxaAjC9qQpytyqDFSFOGTqXq1jQjbO77EqyqFfmZ8RKUQ/KobZ1Wxnqz5hYjp+yiN/gh
	ONupCO8fO90e7W1D6fA9NnqDmnaxWH/PCiw4CFyf6dGJUWOws6BBpnxU0j9VIaVSlCqu7pq5bBt
	mdFnN0gzHKjUp7nLYSdlIqFn/ShvHnzw88xHVQi7A6s+RKc4oWIHXgmqjkZYgJGYrWeoX4GV7aE
	HKeqUh6w7pFJ9yFYuYTdDp+i6vdfToxF07xHsAwly5HFi2Kp0SRn8nCQmQH1ZjCS6EX5kqznC8l
	OKhkEWj8xX3YBjL9yPIXVBYp47zdrbtX27VZFABJcCNcWRTpvSjsE1RB8D3Ih+R5jcKdKrBcjzQ
	E4kszn9tnRNEglbQHBms/MD7/CcEirZ5oVaSCXmjoEKGPwW+Kr9CIORMrTUAD5HOmsvkSM8SyUW
	CzEpkXjkS3S/Iq1S4Jzdi/obJrkOcL5pX0x2zFbgkUu7Kli43q17Mx4j74Q+U82B3oyRQyWmuuH
	sjo5Cuak5px8nHphM8PxHdv3Qi2IWwyTEBH0ZX7Utt1c+
X-Received: by 2002:a17:90b:558e:b0:3ac:9ed8:f319 with SMTP id 98e67ed59e1d1-3b1b07fec26mr8956019a91.2.1794821079320;
        Mon, 16 Nov 2026 01:24:39 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1aec43699sm15661189a91.10.2026.11.16.01.24.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 01:24:38 -0800 (PST)
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
Subject: [PATCH 2/3] ASoC: atmel: mchp-i2s-mcc: Use devm_clk_get_enabled() for pclk
Date: Mon, 16 Nov 2026 16:24:05 +0700
Message-ID: <20261116092407.514998-3-phucduc.bui@gmail.com>
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

The peripheral clock is enabled once during probe and disabled during
remove. Use devm_clk_get_enabled() to automate clock management and
remove the unnecessary remove callback.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/atmel/mchp-i2s-mcc.c | 28 ++++------------------------
 1 file changed, 4 insertions(+), 24 deletions(-)

diff --git a/sound/soc/atmel/mchp-i2s-mcc.c b/sound/soc/atmel/mchp-i2s-mcc.c
index 9d8043a85782..fe42a8c2cad3 100644
--- a/sound/soc/atmel/mchp-i2s-mcc.c
+++ b/sound/soc/atmel/mchp-i2s-mcc.c
@@ -1064,13 +1064,10 @@ static int mchp_i2s_mcc_probe(struct platform_device *pdev)
 	if (err)
 		return err;
 
-	dev->pclk = devm_clk_get(&pdev->dev, "pclk");
-	if (IS_ERR(dev->pclk)) {
-		err = PTR_ERR(dev->pclk);
-		dev_err(&pdev->dev,
-			"failed to get the peripheral clock: %d\n", err);
-		return err;
-	}
+	dev->pclk = devm_clk_get_enabled(&pdev->dev, "pclk");
+	if (IS_ERR(dev->pclk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(dev->pclk),
+				     "failed to get/enable the peripheral clock\n");
 
 	/* Get the optional generated clock */
 	dev->gclk = devm_clk_get_optional(&pdev->dev, "gclk");
@@ -1087,19 +1084,11 @@ static int mchp_i2s_mcc_probe(struct platform_device *pdev)
 	dev->regmap = regmap;
 	platform_set_drvdata(pdev, dev);
 
-	err = clk_prepare_enable(dev->pclk);
-	if (err) {
-		dev_err(&pdev->dev,
-			"failed to enable the peripheral clock: %d\n", err);
-		return err;
-	}
-
 	err = devm_snd_soc_register_component(&pdev->dev,
 					      &mchp_i2s_mcc_component,
 					      &mchp_i2s_mcc_dai, 1);
 	if (err) {
 		dev_err(&pdev->dev, "failed to register DAI: %d\n", err);
-		clk_disable_unprepare(dev->pclk);
 		return err;
 	}
 
@@ -1109,7 +1098,6 @@ static int mchp_i2s_mcc_probe(struct platform_device *pdev)
 	err = devm_snd_dmaengine_pcm_register(&pdev->dev, NULL, 0);
 	if (err) {
 		dev_err(&pdev->dev, "failed to register PCM: %d\n", err);
-		clk_disable_unprepare(dev->pclk);
 		return err;
 	}
 
@@ -1121,20 +1109,12 @@ static int mchp_i2s_mcc_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static void mchp_i2s_mcc_remove(struct platform_device *pdev)
-{
-	struct mchp_i2s_mcc_dev *dev = platform_get_drvdata(pdev);
-
-	clk_disable_unprepare(dev->pclk);
-}
-
 static struct platform_driver mchp_i2s_mcc_driver = {
 	.driver		= {
 		.name	= "mchp_i2s_mcc",
 		.of_match_table	= mchp_i2s_mcc_dt_ids,
 	},
 	.probe		= mchp_i2s_mcc_probe,
-	.remove		= mchp_i2s_mcc_remove,
 };
 module_platform_driver(mchp_i2s_mcc_driver);
 
-- 
2.43.0

