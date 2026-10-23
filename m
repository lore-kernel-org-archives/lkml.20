Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792746146;
	b=C7Tie2AKTG/0C9Bo6WD6ddb6oDNWIz65XbU09OqOu0mfOLGH76IpSXxnaZzecbH09kzP
	 89Ipbg5BB6r708duyVuENM0HXyyDs3cUIkvcSY8iea3W9P9GQ+5tvf5MfU+KpsF6BU0Wq
	 Jhhdo/9sbc37cH6yhpe7jVyWLgVJ7fMzsYu2/Th61wOiGx1hYrHthSofkodtP8Q6uWzDd
	 46zYPxVdeKe7A6eCpCT7zuR7X2oVjDT29L+kd7TPLgB1G+bkEHXMxMWT6hgwYLoPSXajk
	 K7IGvRbs2+LtmKO6L637rbg7E/ZUH+hfBBE7FX/uXXzMllO5Osasv32enoTQP3dGQuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792746146;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=rrzU6xvBCcHujCvF/VvuDLHpw1TTpw9Mc5E/XkPjkfw=;
	b=pApTQB9JZWurlbZ/XekLJq6HBIk120+4J8wf9rrrHZIwgzkk+kmZCod0jBbVCiyTSVNN
	 vRTdjBnY0J7oc4pBk19USIQU3weZ07wVVEsScKvssjN/7MJIBnXseZymvYI+XqXYVamtN
	 l8MqaTSrYd/M+F2NCyxjDvGZMYp1zXJapF4oD4wOSQ3C5phVjUi8Y+2hLq6jDBoBKOtF3
	 1w6D4J3N/b1UoUvL1E+RIzCqoDiQ9BvKi8D0qUfMZdZS6JpUKrNSZg2017N0ARtyqjmsW
	 u4dho2MUQ4qO2vjcOs3cQDX7hN9IgbtnKtRYH5Q6qLFuqJ//59qQuOdbvWF0eFLkYUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=aQN87F7M;
	arc=none smtp.remote-ip=209.85.216.47
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 300A4606A31F
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 09:02:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 300A4606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=aQN87F7M
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-398b3c37877so398079a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 02:02:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792746145; x=1793350945; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rrzU6xvBCcHujCvF/VvuDLHpw1TTpw9Mc5E/XkPjkfw=;
        b=aQN87F7MQXRuh3GwO/JJUv+xzm+iQmpKgKGXLKrC/XUjBwb5KuA0fQDSImDKCU/eqT
         tlfM4ZYc5GWQWz6ea+lOF8xTa5o6nXtipx0rdBo7lkkUjP18IlACKFgd2cKqCg0RTJP9
         vLla4zrzGH4bnKvdoGCzn3bY8BWL+6hmdSG72MIZXP+XoYnrQnya7UUeZEjRmrt0bbXl
         XEnJrXiREBht5TTa8AQw9UIPmU5WRMAFgLF3rqdQNmg0d9xEkYOHsvz/8Hq8hVBgXZ5/
         gyKK1NVD/jAtzhx0DCTpFEFESuW84NIipz1r4WUq8paypK1Y3A5ez9WfeMRj7nJiYfO7
         +d5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792746145; x=1793350945;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rrzU6xvBCcHujCvF/VvuDLHpw1TTpw9Mc5E/XkPjkfw=;
        b=0CtaGy7ILjwPbNzXlB/e+MIMqY3XenOgI2+pJoSudaYg1pxyB6k6AvXJoBkqMuVOZp
         Iyyzid7p+xInMsdo7xDais8Z8afNtKQdltPYGBfQOMkgZViPOeIUB9vE3BFT0tvOqqng
         K8qxfHF4Cg1GtmzzWzFWBSRSRgkUttvyGu3TY3fT5ztzL+Pajj24cwAZGi/8/5PNqMQQ
         RU1fKG5km8XkVxu11Z69+y62TGNV5U9m/aLcd/De+jWRPZh6GpHQWdy6uGwlziObMjiX
         8o8tf8jXr9n505hnmPdzKQbebFkvus6rWnQHfOJIdt7NEAMV3uXyF417zzfgHQCCwjh/
         yQAA==
X-Forwarded-Encrypted: i=1; AKwUvBw+UoZxnjolXkDI4uDySlFrlK4HQwtdk5FJLjK83nkSlUZF/SPf6e2xxo9Q8k+TyaroGicm3uyeVCZrRFk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKIm2RlUWlkbAS4UZPO9/yeSeWX9QQ89benToxOZIVr2yemCxGh
	cbGVomeJChGLJgiCTmO2JjlpR8C2r4C84gqP9ngsQLN+tDWyfPpEd/i0
X-Gm-Gg: AYBFou3mFtDNZyMhvBezi9ZsxR1fxyc+UMkTPbv9pYYAdXqt5FAJGAdDQ2BRIxXCRmE
	1ZfOwqNoFRMWaTypp9P+PqphSkQdOUjpEExmkS1ASkEqpPZPyoAhGuhyXqzC+q/DntHsnc4jvBp
	1JzQxcv9ZRdVjaMVJsFpvpyNzdvthV8gNPdS3Ia/cPb3/fxUgyqJBzmXuaimHA1zoBPXYLpa792
	yQPerZhdi9NjoydWNDEgU21YniGgKRd2DDs6TKCUHz+wfR7aTuJpAcmdK+fv3QLECb826V/TT+h
	pZb20N/wUR+N1kTCGp5ICmwH50eRbFFVY8Wm5ML1HDytOX2fewIRZVo7382hsEyw1JWTfWuckgp
	t7hRwNVrZRq+5TP67Q5C3ZKVq5L1jQdt+RPX2e2IMuzeUX66z+aa0XpakLSCGFnt/A3OHiUry8U
	7Jmy7Het9HFX8wTJBKY8aQ2YYmWN3uWhj/RSvDlcvw/DTfHB97PBOxZ/wBiXylR8aMjQc5yKaJK
	HIQ1ftxxi3InUNQ9imQyR7LhwDy8GvG3xfzRmZwKHR0m24O4WY4e4AioZTnUNqekOBneQJWtEVp
	cxEHHnb2a5FdZPvn6/hA2dcYBhpq9ur/N+KytK6R29pCZBZKjsBREh2ddEi5lu3plKJU3xU=
X-Received: by 2002:a17:90b:5185:b0:3a4:6e84:e7d8 with SMTP id 98e67ed59e1d1-3adce0e0160mr1401612a91.54.1792746145402;
        Fri, 23 Oct 2026 02:02:25 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adca62e477sm2718306a91.2.2026.10.23.02.02.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 02:02:24 -0700 (PDT)
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
Subject: [PATCH 1/4] ASoC: codec: cs4341: Handle hw_params return value
Date: Fri, 23 Oct 2026 16:01:54 +0700
Message-ID: <20261023090157.518032-2-phucduc.bui@gmail.com>
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
 sound/soc/codecs/cs4341.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/cs4341.c b/sound/soc/codecs/cs4341.c
index 74544c58a415..be0ab0b128cd 100644
--- a/sound/soc/codecs/cs4341.c
+++ b/sound/soc/codecs/cs4341.c
@@ -83,6 +83,7 @@ static int cs4341_hw_params(struct snd_pcm_substream *substream,
 	struct cs4341_priv *cs4341 = snd_soc_component_get_drvdata(component);
 	unsigned int mode = 0;
 	int b24 = 0;
+	int ret;
 
 	switch (params_format(params)) {
 	case SNDRV_PCM_FORMAT_S24_LE:
@@ -112,8 +113,17 @@ static int cs4341_hw_params(struct snd_pcm_substream *substream,
 		return -EINVAL;
 	}
 
-	return snd_soc_component_update_bits(component, CS4341_REG_MODE2,
-					     CS4341_MODE2_DIF, mode);
+	ret = snd_soc_component_update_bits(component, CS4341_REG_MODE2,
+					    CS4341_MODE2_DIF, mode);
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
 
 static int cs4341_mute(struct snd_soc_dai *dai, int mute, int direction)
-- 
2.43.0

