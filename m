Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793012336;
	b=hJVMaPF7/AFINUu5huLRPGutqXOCF8ikgHNBIKoEKdZhsStEv1QvICq2wAHbuuvqDOBH
	 VRSIlIhnu4ec0u/9Cj6nKv58nbe5HZ+WnkAKmgVXDqu2EOuPY5uVhh7+xHaXUSVMiZakf
	 GL1RdLdd85s3Z26pCUtehskiPF5s/WWeGv3jFaqJSjRXU1hfDH0qMcWNlwZXfYW5eX8Ug
	 p05Yly4NzzLRKs0v2YUXXN8T+2TPwywtjeVNAok/vKWhalAqNAi54QmvvIXftgIN/AG7M
	 bJerG6D8Fz3xyUWsWxJoItLSHre+8r6yANOzi0c/xlIUjbY1keF7R/zZaG9/H1CcsQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793012336;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=vezHkgKxa5aSAGJP+0pUQzA7f5XIE1RfIdhUHTPJYR8=;
	b=mo3zrXLty6kwaw3+E4SVFhpJfosO6D/sMkXvKtf5EvMu2dQjZTGk3Z9JNVNtGPd9Ng9o
	 FudZbcoYDyDEyhT8kcJFznulXh7Hv66px2cYoVoNXTkCitRYi23rx4b8kP6nMOZE/7SPY
	 JQmr4fprKNe7ULr0Ae6Xu4dIfu3YTmkhVzBbI2zH7zU7cYQezT3HfzA/4Ze6iEDf0BuLs
	 /5HX+T7RqCAEZ5kXiuefByVRq1M2HjhiV8PAowPjVvNTTu1/IZGsI2u3IEoVWSxJbAPg8
	 zBalrgiDEdQtYkQuppZ68VPHVHxipmQW5X/seC5Tp0CzVuuKaGQjfkEvxD8UfKP4wIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=fo1s26nv;
	arc=none smtp.remote-ip=209.85.216.50
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43A41606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 10:58:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43A41606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=fo1s26nv
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3ada4c06b7bso1333746a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 03:58:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793012334; x=1793617134; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vezHkgKxa5aSAGJP+0pUQzA7f5XIE1RfIdhUHTPJYR8=;
        b=fo1s26nvP/PmGVTkn/+XmokW4HyUmCiUUXRkdboa1TqMP9nXOZmAxK/FguNmh8HOZB
         mOXELec9yx7HirZ1kRZEiKELzbh/y1HAJHnEPXwc5xqHiyA9zgso4jS9JcLwokPar+Q0
         o+r139YHMXTI5GqcXBGVDUQF9vqj0XR22MspbhiZMfC/B/Ig78Rn2G380oYC+RE6wP/Z
         XA1+UWBezbYLxX14mkU4YjwwOYY8WzEwf+dNYrniOJfwwxt6i7Uhej9zi4+81IwqQGhk
         M3EvP9UHE0jlcIbnFHdcKb1hKwQHVBk30UYk2+dHsvIKwe3wGux/3K0uXVrVcoFbuPeI
         zPiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793012334; x=1793617134;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vezHkgKxa5aSAGJP+0pUQzA7f5XIE1RfIdhUHTPJYR8=;
        b=YfP1Eh6yw80mp8ROYvsQrYBSHSWzmXWqUjPp/d6mPm6u58V2+QfqxHDgBIhG9qu0p2
         iR2T/ghvMrRi7zArrGi2gpxmiw10iObafsuyMF003ojOsOk6s3swHmGWJFr9mG7z3h+Q
         lSt98opUqsG3c9sYDfueNn85VA2Kmo5e4zwfj2oDFKg6UfbD3ZPQhWxiOVXOSC/X6B+o
         Xi4ihFBazHwOZ2kpi2UjY6pjaFamzelcZVLfbs3dMNdVzLdNRBi+xbwCujOXcTBUE98z
         WJmiJ2CCWZuX9aMJN4gQqy6kC1+8eccYFAE1kK1Le6prrzuvYf0FSMcRyelru7uQjrbV
         CnKQ==
X-Forwarded-Encrypted: i=1; AKwUvByHpfsruvvxw42KgXNgQSr+SyJaHU4h2yzz005hl48cFO30xCMsDNcgqyp/F+SnBxX12MXi5eC1YdRnqpk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKr02qAB9CMuJ64s447ZEO1t+nYEs3dGqCfg/9vTe7tNudHIkqT
	KpNvxIAthAym9yEtM0QrR8T4KslaaqJoGnxTjHKO5d9Us0r3wQD4EUL4
X-Gm-Gg: AYBFou02/oUblK8d8C9eLsC+2NVO/ejdpmxkDw6LvIk6plofLJDJbVFPpOImxxeTSM2
	3Jf/t+vc0HHZXpLFAuw7mbnESJeFHoAkKyLeT7PLQwBaVMnLODPPLTb3SnL2NYODs6NgzHGUzw7
	9X7MQcqGxY12m0qr1QxAl/aQ9xs17t96YJ2gf/CQtX+p3TNnw30bZGLkEOlc9CDXF6vHtrYSbUP
	ssXliMwSaoY7ZVMNLGli6yJF23lXrQpDjYn+sb2BxbJ3R842CDSM4fHjftm0vJuWud/kgQpJlTd
	9342NGIoqYmfq/aDoTnwX9dZlJZE6eGUcukvDrF7d7nBCaEfFHTVCF2+CBDpfXZP49k4M8xOKhb
	sS7JKwL90Xjz6ZYOdJK/zlmKnv6Qnmyk9kzwOEisk1+zqh0IJqhoTpcyfpUaTcpCvvdiVxpyz/p
	/KZjCFqC4gLxPah4LSmyCQDzLbfuO2qckfTyIGjJY1poI+fhA8gVtimGH+b2HVuDoBwSuaRgFNi
	Rmqx676Cat9cTTj2DMAPP1FeZYhZNUZpyUP7XhHuKTRbwKAV0LGEtuySb6r5teGhQEPKXMi6jgu
	PcicAhriviulLdoht815udMtilJxFr3HhHS7z5rtQhLp2xr1vSKK4x/juE6q/McRJHAgkS0=
X-Received: by 2002:a17:90b:5105:b0:3aa:f875:3385 with SMTP id 98e67ed59e1d1-3adeae71da8mr5438840a91.26.1793012334567;
        Mon, 26 Oct 2026 03:58:54 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebadfa82sm7980768a91.8.2026.10.26.03.58.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 03:58:54 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-sound@vger.kernel.org,
	Russell King <rmk+kernel@armlinux.org.uk>,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 1/5] ASoC: kirkwood: kirkwood-i2s: Fix error handling for resource mapping
Date: Mon, 26 Oct 2026 17:58:31 +0700
Message-ID: <20261026105835.19052-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261026105835.19052-1-phucduc.bui@gmail.com>
References: <20261026105835.19052-1-phucduc.bui@gmail.com>
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

Return the actual error code from devm_platform_ioremap_resource_byname()
instead of always returning -ENOMEM when resource mapping fails.

This preserves the original error code, allowing callers to identify
the actual cause of the failure.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/kirkwood/kirkwood-i2s.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/kirkwood/kirkwood-i2s.c b/sound/soc/kirkwood/kirkwood-i2s.c
index 739a819d8494..cf4327101b96 100644
--- a/sound/soc/kirkwood/kirkwood-i2s.c
+++ b/sound/soc/kirkwood/kirkwood-i2s.c
@@ -59,11 +59,11 @@ static int armada_38x_i2s_init_quirk(struct platform_device *pdev,
 
 	priv->pll_config = devm_platform_ioremap_resource_byname(pdev, "pll_regs");
 	if (IS_ERR(priv->pll_config))
-		return -ENOMEM;
+		return PTR_ERR(priv->pll_config);
 
 	priv->soc_control = devm_platform_ioremap_resource_byname(pdev, "soc_ctrl");
 	if (IS_ERR(priv->soc_control))
-		return -ENOMEM;
+		return PTR_ERR(priv->soc_control);
 
 	/* Select one of exceptive modes: I2S or S/PDIF */
 	reg_val = readl(priv->soc_control);
-- 
2.43.0

