Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30B28368D4D
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 04:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790915980; cv=none; b=HO+gZwmXsvyJXnSuWHnmrZh3pipBKFYjVooBpp7fYgnN1DFC5UVu7xAXFhA9DGC6KjpoxEM4FP9q5cCL1FI41MT1GnKu2Or1ImdrDZVwJxJaoqm+GYnE5EzFYT2Z7QdbdJlgSONZ7PY6Q9tg+Sx+x6mNahO+u1usrRo+nYBFcDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790915980; c=relaxed/simple;
	bh=sHTb4JE8cIH2Q0cATefrZPIo6U7t2jgutMNmqVUqelI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GnDOunHt6lRIa+QAIYb6XvP6/KrvHWXQa7QoqcBALhIWmWASTYvCKACRafW2gJ+FSJCO3p+8XkK8+Nzwn+xoQH6Runf+u7S+MlStHd17WY4Faw4rSJYGFxBkvup5qWCJsy9zkd3ze5Fd/hRZ0z53vxKfvM6QX/T7yAiz/UesBwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mSImcZ0q; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mSImcZ0q"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2db1ca069c8so35097555ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 21:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790915978; x=1791520778; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QDkTuoIx7co8Z+KTX/+/iuusl+fatSzZsp7l8WaBTtc=;
        b=mSImcZ0qTx3oh4CAgwfKY00io8GL5/hZ0e9aR7g7tXVvid+Cya56V8NGWKrc9TzwYz
         FIZqkaCg0kzwPuF4343jUh3GCoqdCmbEMg+A716yoA0wvsYCAogxRA68Oh6MHVYtHJzP
         MEjI6+xzr3XjpUvni+ShKGFikD540xZWE9whcUMFpT5fZIs+8EvfU3KUb+DFJhdM74A7
         yR4IBAvGs+meSh8R0ZENzp4NSOVfW4lar8p2uwVdVFGM34pJ7dNo+YNhp3s+zC3Jncdh
         WXYk9YkdCZtqRhhgrQjNm/8wGDKKLXKTL8oGBw5ZI2mjCbUxhLUcdgQoHl0efIa8tuc6
         vhwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790915978; x=1791520778;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QDkTuoIx7co8Z+KTX/+/iuusl+fatSzZsp7l8WaBTtc=;
        b=hQPIozsJc2Vz/59fOEnQoUwwEob/YADdB+MQBcL4E3gYvANyH8JiuwVcKdTcp2+JHO
         kZtM4JumixUFZtYYZMm+0RBgfjLWeoGW6oSHThJgyIT8EigwPYG9xN3sWpu6h8MweE7Y
         cwG+eTX/fNfN48XUralt4MUpW7bqce016+N3l4m0xq/8WDrXsEYAWborQNMGR2no1a7y
         AvGJq9tNM63YgGm8oprSzsMQJzMsuiHxp+q+47jtsE9LAJLRFCtc+cEPZ5xN+8F0Kalk
         cLC0pSAki7fKVpMVLwAHUfr1BaV6cJ5NIt1klAWqe7IHpL8bL1Z6E7evSgKUg9uN7cCW
         lOcg==
X-Forwarded-Encrypted: i=1; AKwUvBy1V36LfMPO88YnxCIInvy52K4OYnIE+gqzVROwW+OA2GqsJi5HKf5z1EWTD0KT/G632v/EQ5m0AKJcOpU=@vger.kernel.org
X-Gm-Message-State: AFq9FYIY9R8KMv39bo/efNiw3oTtJ5lWqhpJNQ4xDpJk/zOw4yeMMGLr
	m4JcwdpB72P9ePVDhkQ44BV42g4Gj1boEJBbiEujH3gRLyqrXtSyyMt8
X-Gm-Gg: AYBFou2xWxCkMGV5gmX9RWOMajJNEHSAKdTjdkOoCdcjF4pk3w8P7BdH76HOPjuRdrQ
	FnRlxQowxNv+S7Uzi1cbraIcs3Sb9zXsD7TMo6z+NrpiqwmSqzTNunkh/W3k+KhO+FQL5yRmSAR
	NmwYR66JfhHzkVFaGclFfxPXEuG9XGcAzw1w1ZJ1yUL39Qz+0Q6ahWuyi8w1/SaV1eNJMDkCRaN
	JkFPsODlWKMJxhBgRujtASADsO0nYkes5mj/icDTPKL70e6ebyf07EoLDlntaB3+00UWQ7Hu7WK
	KwrKCjZhxStnJUOZafRryZqYHnjntrvmYOksc9pbGUV1upj5vtwADoDk0ANfjXVWWUkv8mjX/qQ
	oXdBqkzwLP8nsvx2TRn1fxb/sNNF+MUt1txpU8HkIv/ds8RKytCbndZmcQ++uc05aEG88YZFL/s
	+G57tXRihKaZecZZ46jnWkv7GhjQJXL+pmcxr+Bg2k8F6GRU+hJF3z38cAfd3spNIFU43zhQP/9
	aOHrmnwOPvga6go12Htm35ZQ6NDEcC2FT7bXGpuOklh5gPHd6daJCqtcemYK38guIbFx0spYQ0f
	T1W18tAi6MleyA==
X-Received: by 2002:a17:902:e892:b0:2e2:f2f9:b1f9 with SMTP id d9443c01a7336-2e49b7f3714mr12668385ad.44.1790915978480;
        Thu, 01 Oct 2026 21:39:38 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e49f67c413sm3713985ad.20.2026.10.01.21.39.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 21:39:38 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Andrei Simion <andrei.simion@microchip.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
	Cyrille Pitchen <cyrille.pitchen@atmel.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 4/5] ASoC: atmel-i2s: use dev_err_probe() for pclk errors
Date: Fri,  2 Oct 2026 11:38:55 +0700
Message-ID: <20261002043856.97295-5-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261002043856.97295-1-phucduc.bui@gmail.com>
References: <20261002043856.97295-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Use dev_err_probe() when obtaining clocks to avoid redundant error
messages, particularly for probe deferral.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/atmel/atmel-i2s.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/sound/soc/atmel/atmel-i2s.c b/sound/soc/atmel/atmel-i2s.c
index 6ca230f8adc8..9b651eb4f0a4 100644
--- a/sound/soc/atmel/atmel-i2s.c
+++ b/sound/soc/atmel/atmel-i2s.c
@@ -662,12 +662,9 @@ static int atmel_i2s_probe(struct platform_device *pdev)
 
 	/* Get the peripheral clock. */
 	dev->pclk = devm_clk_get(&pdev->dev, "pclk");
-	if (IS_ERR(dev->pclk)) {
-		err = PTR_ERR(dev->pclk);
-		dev_err(&pdev->dev,
-			"failed to get the peripheral clock: %d\n", err);
-		return err;
-	}
+	if (IS_ERR(dev->pclk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(dev->pclk),
+				     "failed to get the peripheral clock\n");
 
 	/* Get audio clock to generate the I2S Master Clock (I2S_MCK) */
 	dev->gclk = devm_clk_get_optional(&pdev->dev, "gclk");
-- 
2.43.0

