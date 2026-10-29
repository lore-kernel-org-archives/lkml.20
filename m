Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793260965;
	b=SQJTSbCDtUcIol4z8NIreRnDgdWAvf/tof0PNGFyfJ4nrbOzaZlshKrSRIWmWvNsxVaV
	 tsLinJVf/CYUdb6h3mUuDAjUYc3i6cKg8WhqcEJ7iIApqsuZsR0giAymanE6Pf+ajUWPc
	 oyyhVjkL1jDeIw7SLGTmCpSULZZxaRxvQg/rKVXnfaw+NURb4JYv8OnlLnTWt6jMrS4fN
	 woRVpoULwBHMCST0s1RXJhZf8nP9cvmlOGU65KzH28zggdzg6lJOuNW758MBWRE0ajvMV
	 NfPz2Pkx4VM3v6/pHFeBHb7tn31AAXW6RN5hydIlsf0nm26HtmYiZqUZWaM6Rkz2aeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793260965;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=dJeUddLpTK/3Vwe9+17wPlJ6y+ymPCAlV137W+snCk0=;
	b=Rb2ms3RElS3bJ4LIx3nMcEX6NobR1M302Y5QUaBo6OVYT/DBx4ZkR6WY1NdruSumnw59
	 +oM89i1tJiL+lC2hOR9tumh1x7B0CK0Os01AgTb8MYfjJhcXK8cUKj8OpXhB4YPaR2+L2
	 eKRmfApjaKWAzuRYoznkqBmUAH/rU7+sOFpH2WxOSbOZJCGHrI/JuT/pdGoXg57yBt2Ee
	 bR8hw7NyWgLRd9gAnNyzjYw8IncnLKR1xT+0mIwRtgEJ1Wi9ChWiKe47h5y1il6WE0XrM
	 R+WhwPB86wK73xriERO8Hi+t8ShhtXU9HYCX7i2vN9jzW/oJqtI6gQbPMr9O+zyyy7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DiJUUdtG;
	arc=none smtp.remote-ip=209.85.215.182
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DD9C606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 08:02:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9DD9C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DiJUUdtG
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cc52c1b8286so259993a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 01:02:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793260964; x=1793865764; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dJeUddLpTK/3Vwe9+17wPlJ6y+ymPCAlV137W+snCk0=;
        b=DiJUUdtG4RRtVrXbyTKHAELPehfTmFdqFQ0VLNljoFsOKqH5REk8SLKO5rASkfRekl
         mPIG6sTtvOZjdQrQt1q67Nhbh47Whq8W2Ys7vKTeWPrcGeBIaVp/7hksNzxcKqwUEHtw
         DYvA0OUSwvI+0YmSRJhxVPq25YdMV9FWFsZ2EKd8ckouIUgFvISmIhshMHpU9M4+AwIA
         B4Ul9AlpI+GpKHuFaeefj7czDzFNqTp1EwP2CHZz3VIVpKMMM///NNNruw9z3LELcskF
         SQEUs9gEkRoerPH3Im6CW6JWcFmdvn3WEnAbgrt6QSvuagMpwxhCQoId6Pajdee05Ofo
         Rx6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793260964; x=1793865764;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dJeUddLpTK/3Vwe9+17wPlJ6y+ymPCAlV137W+snCk0=;
        b=r5BOdy1+WU0kRtRxSU9CkRnU8K96CVFxk3dudRXTzlCTVYaC5dPBvJWRtNCtUVzVzv
         ArfnD1gGEsyUjpSsOJmcPW6XfZtXulcN7IhDL/quXxEJTfaxF9MNjtdoFaV52tu550/f
         b0UHd6m2Kgib4sT7qmvTzipDQOOk1iA+5fzMKpNOpn4LdRm2zVa9dX0TPHMXkzofcidp
         dHaa63WsaBvbQGF77MYT2uTmtA0993nOrQg3EvvUdwEy6Y99VhSjZvhTys3F0EtdpAHP
         7lyBbsHflXDTqs0N6bXQGKo+N0g8yPfUNgH6NS+IOJEYpthfz+JyW3bk0XkXSJ90Ewwk
         i9Fg==
X-Forwarded-Encrypted: i=1; AKwUvBx1B2Ug4fQViTfaKAbiLZ/EY4VjAh4f9pGalQAl6sP7NBJZEjayA4q7Tnj/7XKIKbVKcS2IHgXbGVLXD2A=@vger.kernel.org
X-Gm-Message-State: AFq9FYJCkkW7xQXyFQv2fR3e1A7dDKzxezODFN/zKfAuqtcH/5zrBlSO
	tylQxJ/Qtam1oLfJkndruF4XZ5yIN4JPsFrI5t+SsQ7Jpkr976seZc8N
X-Gm-Gg: AYBFou1ZxEshmr9EjYtBXTp2cHBMTkddPNETFPE4//mFmVyQ0W/zgRplFeDkrAJzG0g
	DGJh/XcHgBJJO0AQSxm3qOLYCHmoM+ilSkLyuyrOjfxKmlIcx1SjVPomDt8vvvtoh/DGD0I+lqt
	YnPUTMQ4XhmEXb0SbMTIFjhQPs1DJHtLZdcLaxc2dYyp7iGZvkwR2ZKKDmI8tVhilRrA6HBkAAz
	ZXtLsAXYEouVM1IXQegFdooB2evs6pROf0301k3qSvdZH/0OJdX3oKwEe0kbB18Rg+TUxFwtxMT
	lR6/wnmaNy9K+Z76e1B2uaAgLYz4OukZpaJdNm/Hd2ByrPKBffnG7GhSInPWTGGqQV2fwe4tt83
	czy7sqfNJpzuyzAQcaOi8duIlxyDFgAarIIR9NIpjsHrPtEjna2S+chYTOVSBL8qJSGbxKtp23D
	VRUK3ErvCw464UFN+TBzgLn1KCts0CVjpkNysfVXA8/vaVXjFM42x7vlvkpsEhB2A1jcUyIOpte
	9ej4vLVHmKyv1ls0F5gwOWP1TVpxYTalsBKgutTWi0ypaEbl6u8AYcRj0/LsdLJ3wl319W1tNAE
	4YpkxJYIaO/ce/nXlpDLB4OCxGxSffjWHVOrKQ4OMiv/R0CLZCV6+24C4NbHMhYv0BI3ZrHoWQF
	AjpzBQ/aXl73P4FxocqInRCchWoxgmARcyFtN6qrE8HUa93NX/dT+rXmcZKed0RzFhY4=
X-Received: by 2002:a05:6a20:7f94:b0:3e2:b995:fcb with SMTP id adf61e73a8af0-3e9139661bbmr1248751637.1.1793260963991;
        Thu, 29 Oct 2026 01:02:43 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd8ccc682d8sm5059547a12.18.2026.10.29.01.02.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 01:02:43 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	=?UTF-8?q?Pawe=C5=82=20Anikiel?= <pan@semihalf.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 2/3] ASoC: google: Propagate platform_get_irq() errors
Date: Thu, 29 Oct 2026 15:01:42 +0700
Message-ID: <20261029080143.12304-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261029080143.12304-1-phucduc.bui@gmail.com>
References: <20261029080143.12304-1-phucduc.bui@gmail.com>
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

platform_get_irq() may return errors other than -ENXIO, including
-EPROBE_DEFER. Return the original error code instead of replacing
it with -ENXIO.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/google/chv3-i2s.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/google/chv3-i2s.c b/sound/soc/google/chv3-i2s.c
index 6353b2a079cd..ebc352bd9e9b 100644
--- a/sound/soc/google/chv3-i2s.c
+++ b/sound/soc/google/chv3-i2s.c
@@ -303,7 +303,7 @@ static int chv3_i2s_probe(struct platform_device *pdev)
 
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0)
-		return -ENXIO;
+		return irq;
 	res = devm_request_irq(i2s->dev, irq, chv3_i2s_isr, 0, "chv3-i2s", i2s);
 	if (res)
 		return res;
-- 
2.43.0

