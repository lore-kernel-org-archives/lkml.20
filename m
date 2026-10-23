Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792746163;
	b=Famikh7mKfdW4cv4OWdinCCa/cfYPz0F1dRQeWPRay/YWgKsPKmLX2b25+7ZG29ixTQ4
	 i4Q4mBUDG9kfsFHmVyYU/Ry3rC83jAZzeElGhjYcZBJMy5gRlOkUvGNCF1Rnq8sAGtbnP
	 ziu3ZYniBhjSidLXf26RbvZeYW8VfXTj3W66xKFwjXknnJa6KlwtRi7ikf9mvjrg+XGWj
	 kuX0Fw2W9OrVfJBDWSgeyHGz6v4DyPWEsFr/Yld7PWG3aEyy3pFVMq3M38zTKudJKqRG5
	 FP3Q4C4trkmJV7SQQDtft6q1/dLqQt/VqsLQY46Qcx87TorHPN62avwF3gq8e/G0dwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792746163;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=agdWtGTqVZs9lIBi8wfg6ELa628UVzetqPDjgzfZ6W4=;
	b=oZXv2d5EsXpTTF/YA7V/1qINTHZJfyMexI1V4nxKrLKs4PmX2BiAkRoj4tgn2EFmoChF
	 MzKwLJlKidnDlVb1ndRbs1twy0mG4V1jle8aOIgvNztEMjC8XcCGS5rfOibGIBstoUIpG
	 Z6UwChxsh9uPHRW/DSwmfZPutq3vjelxjPTqS+QPXKGRKHRmoMiacI0+lOnj4UG4iUrPM
	 LLt7GUwVnkKNbb02eHVgWlcNWLPvTir9B7CN78+w+gbdBqg9aRdwkIfMO6U9ntDdCOj3V
	 4Lj94PrZBuszuImpFz5QmoJLX1mRdWPSeffmdNbWvD/VFAHhea0+79SfbxU3cN5CxeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=b7wnwYCI;
	arc=none smtp.remote-ip=209.85.216.47
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A6CF60A2604
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 09:02:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A6CF60A2604
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=b7wnwYCI
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3ab60ff4273so592729a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 02:02:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792746163; x=1793350963; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=agdWtGTqVZs9lIBi8wfg6ELa628UVzetqPDjgzfZ6W4=;
        b=b7wnwYCISV5tMCUmMUh1jEHCj6pOcSBKzr+GaRaCtllmc9ia5vB6dIT9DACa+iuTwn
         qjg0eQloOSzXBYSxh2gX8X9vmbrKutm27jGM+4TfTvTExb9Ewlg6+nAb6HCzNgrvyFqV
         lRFl0Dx8PE2d4hk4BP2pS/1lDr9O2cIp/hxq2kQJsZ954z2G0uDVSkXbYZemaIzpGTYJ
         vROYcRL4QD0fVIATCvGn4ycS4Q1pLMCCXo+JO8RcxZ1idHcJz3i+pJY0KhukhUSkOhLp
         CWtncSlvNJzEAJRyFa1wAsW1UwEaAzG0rzS7lE2QqUROCdRCmFrMIRb5QKMhbg3l8Bq4
         L/UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792746163; x=1793350963;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=agdWtGTqVZs9lIBi8wfg6ELa628UVzetqPDjgzfZ6W4=;
        b=qnBfjiyAaxewbpQHioW0tAMxWkT5RE17VQucbK3BT7dPDOXR4omZ69tT+2ByNeoqcj
         VKetegcaFc0D4XpfBaarNCgknMKmWL5G7HFIKeOoLviOQcU9lJevTXoXOhqthOupZRKe
         Elqxxc9llnziha/2a5G537nxWyo0x8haMbN66q1Z3jmbHMhU62N30J6l41PZu/F/9fIm
         e1G2x6VCVYgV+va75IhgSM9CqTQuVG7GCATktFHcsRO+C/yR35cBffT4TQaVCKgjfZpf
         ZFvPmw7lsV2KUhhczFipyMsF/ekTuvqFEA8AVttXF3sVqaGweShi1iwcZ2WZRy8J9VNc
         CeOQ==
X-Forwarded-Encrypted: i=1; AKwUvBwH4TDDHIKCmWYuVx/zGyLhRK2a7Xl7wFQ+xZypN9f2fKgh5P3qnA+wyPAiVeG/FjuozWiJgff1UhGgoV8=@vger.kernel.org
X-Gm-Message-State: AFq9FYK4Kgve0ALzkZfRLrIPLfrjAm79AtsH5XLyo5MZ4pHttu0nY9qh
	C8oR2fEkGnP3poro3SZ8tjWdwLGDNO2rC/Zxg5PgSjXafoFfuEXOWTXx
X-Gm-Gg: AYBFou16BzDLPxflV6uyGgdenQoMRDKEEmGu++sR5PlhS1e4G17KsEidZbGmWfgC2Tv
	cKdcJ9LtCviRM9ajM4n7ZLCZmPOnsStuQ493SsPvmaEunD7PwMQejLE5W0yH97x9OA0fTwLbtIc
	a7osB3ARzvX1JMTmEO9g0pqC58oU4WT2pjymd1zF1dtgVCIGb0gZ15gmpHkM8WAep4l8pob1AvC
	KhZEcO5Ilu2Ctr34/lb0hWPvI6KeoJyE1LlpHvKDu4n2RNdj4MeRixtj580HmE06nyGHVAJkHr1
	o4V/ffFsalGqAg+kEHABVAXbE4pst0QHNks/7qDdAm71T/pxtMGqRt/S5IJs1nQXN4bOuQ8Mvxr
	u3oquE2P85b9/FcK3u6ubNZegXyUxlSU1qvsuTJOk5qIpoc8mnXt3YRzxk3RDCBI50znukQlgJe
	oEMajE2oYsaocpNpNiNwnG66uo34xNyLpvONLTBD16+B1anG6ZvQPmMPk4763n7O0n8DDmJEO33
	WSjCP5EOkx8kN9HletlBSqihjnXstqedk8FvSczy9W/7vU2BneeLZ0uHpSWM7fHrytcgfmUv5p0
	R02CJxQKqNuSh0w56WWmKEWg5AmFrJqqsAxwnstiIaD9434FXQFAkCADml+W8iRO5/g/B/61
X-Received: by 2002:a17:90b:3888:b0:3aa:fdad:7d6e with SMTP id 98e67ed59e1d1-3adce7a7df6mr1346546a91.10.1792746162054;
        Fri, 23 Oct 2026 02:02:42 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adca62e477sm2718306a91.2.2026.10.23.02.02.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 02:02:41 -0700 (PDT)
From: phucduc.bui@gmail.com
To: David Rhodes <david.rhodes@cirrus.com>,
	Mark Brown <broonie@kernel.org>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Stephan Gerhold <stephan@gerhold.net>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Wentao Liang <vulab@iscas.ac.cn>,
	HyeongJun An <sammiee5311@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 4/4] ASoC: codecs: wm8994: Handle hw_params return value
Date: Fri, 23 Oct 2026 16:01:57 +0700
Message-ID: <20261023090157.518032-5-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261023090157.518032-1-phucduc.bui@gmail.com>
References: <20261023090157.518032-1-phucduc.bui@gmail.com>
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

snd_soc_component_update_bits() may return 1 when the register value
changes, but ASoC only marks the DAI hw_params as done when .hw_params()
returns 0.

Propagate negative errors and return 0 on success.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/wm8994.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm8994.c b/sound/soc/codecs/wm8994.c
index c65a7769a9d2..6cda0aa4c3be 100644
--- a/sound/soc/codecs/wm8994.c
+++ b/sound/soc/codecs/wm8994.c
@@ -3093,6 +3093,7 @@ static int wm8994_aif3_hw_params(struct snd_pcm_substream *substream,
 	struct wm8994 *control = wm8994->wm8994;
 	int aif1_reg;
 	int aif1 = 0;
+	int ret;
 
 	switch (dai->id) {
 	case 3:
@@ -3125,7 +3126,16 @@ static int wm8994_aif3_hw_params(struct snd_pcm_substream *substream,
 		return -EINVAL;
 	}
 
-	return snd_soc_component_update_bits(component, aif1_reg, WM8994_AIF1_WL_MASK, aif1);
+	ret = snd_soc_component_update_bits(component, aif1_reg, WM8994_AIF1_WL_MASK, aif1);
+	if (ret < 0)
+		return ret;
+
+	/*
+	 * ASoC only marks the DAI hw_params as done when .hw_params() returns 0.
+	 * Since snd_soc_component_update_bits() may return 1, explicitly
+	 * return 0 to ensure the DAI is correctly marked.
+	 */
+	return 0;
 }
 
 static int wm8994_aif_mute(struct snd_soc_dai *codec_dai, int mute,
-- 
2.43.0

