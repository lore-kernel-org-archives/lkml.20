Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAE1F556BA9
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 16:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791995241; cv=none; b=VTHGHD1+bpLj3UIkpSuwXOpitxJIShcc+iyhvz/hV123uyUPS5iIJLQGYY8yT1HQEkE4hPhk/eIsByGb/1lc2NILea5PGlQ5Wyg8Edp+fkV+qf3xaU2sdJE4noojXpVFgMfYWZ+0FD38XNsOpWGzgYe+jySscuiIR0HEkIXiVWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791995241; c=relaxed/simple;
	bh=sBCaTY8ARBNUaW4lgyS60NrEr1RpU3oh4aQ5QCBZ51o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XoxIBJOQ/n/MfWFjM0g5FNU+9Otx60zNW5P86gWBK7xqx9L/Xb5jUi/AFTzOM3FZkCS/vTcxkQvFZbKS6PM7EQeCXwg1NPuu7ZgEYVmIqQpQJsoWMTFYVwH64ZUO1XVTxY49KDFgacQQNboU9w+ZChrdp9vugtbjfZqEYltBSl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YB7bwpYH; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YB7bwpYH"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48c45111bebso2696452f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 09:27:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791995238; x=1792600038; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bm2vsVus2jrRRF0UKZkM8VLcFn0B4q9e6VlpkqoMQi4=;
        b=YB7bwpYHddw4imUY5XgbW7eeGNA/zweZ2qmTaR2gPxm2uE3WiLGNJmrvZHYS8Qo55f
         vw8j/WIlUyWElSg6Cx/UcyogvpuJacGf38HQ2ok8SqR7Q1T0kJKw488PDz2dWMOMnIqt
         QoSXfP4HuRuSB5ttWO1ZmuphjmBj8Sz1fk8OyvbEOEGonnhehqCfYsv8DaT+KDP5XnyM
         6rJKRvSD6AcC47FfVAqKnck6MzR8v8sMHvNIlff0maBNB940Hw5O/vqc45LxBm0foRZa
         KtJCWtBKazc05FrL8acIgfSzXSz7/IF39B/6nC4u/Ia1snoDJoYjz9CdK7kWQN9CNs7r
         Hemg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791995238; x=1792600038;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Bm2vsVus2jrRRF0UKZkM8VLcFn0B4q9e6VlpkqoMQi4=;
        b=m2bDmxeH/vyqd7R9eDLB1qosAzXw5WZrVUUqvOIYgsL6PBWpIjg4RXTm4fdB5709/W
         kZffSfBMtMz50NlR9nBxSnNNSLiLx2Wk5OT6uJOTM/8rHq4TWkmNIiCfWNeJewbSq+G4
         uzfMyerP5nTN2sg+FmZTmKkqPaTFED9gWd6EJHTOTJVPPIoqRGDQBdO/on8DphZcNRQZ
         fY8XaztZjhokZBBJ3nPTaCmxr/KvBr3RKzgOqbsEeTOoALH0aUUVwUA8B5AfzWyphtmZ
         /2wBv0MW48w0A+v8Pm1JV2HWyOEgKevSBP1ACNPv5ucJvoT1Sp2Y6yCPnh+LuTeGMeWg
         KGhw==
X-Forwarded-Encrypted: i=1; AKwUvBw2bustfDzUUXjQnDjqiIdGIpq44riBU3v2yODV08mWQ8G4YPCHEKQczgNjhhTfEr8UDw97Z+p3ugvfXVw=@vger.kernel.org
X-Gm-Message-State: AFq9FYL/nFjfNA5drlDo55y0GLAjleh34C9E16ZJDSnLjO1GjuqzWG7k
	HQEexQt8WCIE7TcxcVzTyI6GWTzbGJS63pDhVx97Mb9x+kgYszQmEP0b
X-Gm-Gg: AYBFou2Z+xbXMsvCGjsP7blmH53HoajYSZSyPkkPKETrlgq9aZ1UyGc/6DFs4H2yZYS
	hQlPkJK9sLRex6VBQyhpqY7vWbIXMxh89zdi2U0GtVR0Iq1OowEXg1GGYA93h8RhZEoIhfLh7Fh
	2LRJB39a7k/7Uqv+XPyVE3/HRimLIdbpA4gTXEAN0VuH/zQGOWy/6K+z5BClKpaWBIXPH0wNps4
	SSjO73mVnp/562mHUbiRbHl3mCnjh4usbT9VjMtqqyFtn/1Lb7D377ixDiTQB/L+f4FUG9nb65r
	pkYxzW1QkIwx9jgn4UOLNVfv2W7mFgkSFMHkWxQ5h5Os0FLMYsZDbm0g0TZW2K7Ya5IW33P1PO8
	6CUjzMg9G0SQ8T5i+YHx6ezjJEG36mPfhzqGRZRmCnH5+bVKtMsqv8Y7OKq88INW2D1f4yLLJkq
	nsITb6wIWrFJc31p6UQRftDPOgTdXZRvvZfWQRFpBHH2M3WbOSRXQR6WIjX2ibr4jz2tQ/Z3OSW
	3X8PNzyPubkEsP624gFBTwZUg==
X-Received: by 2002:adf:f94e:0:b0:487:1256:ab80 with SMTP id ffacd0b85a97d-48dbad0d4fcmr24273401f8f.57.1791995237877;
        Wed, 14 Oct 2026 09:27:17 -0700 (PDT)
Received: from localhost.localdomain ([188.190.249.216])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0aaabc3sm13076890f8f.16.2026.10.14.09.27.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 09:27:17 -0700 (PDT)
From: Vladyslav Tymoshchuk <tvlad744@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Zhang Jiaxi <Z1529105815@outlook.com>,
	Johan Hovold <johan@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Vladyslav Tymoshchuk <tvlad744@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH 3/3] ASoC: qcom: q6asm-dai: wrap the position of a full ring to 0
Date: Wed, 14 Oct 2026 19:27:02 +0300
Message-ID: <20261014162703.10172-4-tvlad744@gmail.com>
X-Mailer: git-send-email 2.45.1.windows.1
In-Reply-To: <20261014162703.10172-1-tvlad744@gmail.com>
References: <20261014162703.10172-1-tvlad744@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 44432315444c ("ASoC: qcom: q6asm-dai: use q6asm_get_hw_pointer")
took the position from the number of period buffers the DSP has
returned in the current lap, 1..periods, and reports one frame less
than that, as q6apm-dai does.

One frame short, a playback stream whose application stops feeding it
never reaches the stop threshold: the DSP returns the last queued
buffer, the position stops at appl_ptr - 1 and no period interrupt
comes any more, so ALSA never detects the underrun, the stream stays
RUNNING and drain only ends on its timeout. On capture, the last frame
of each period is held back until the next one.

Before that commit the position wrapped to 0 at the end of the ring.
Do that again, as for q6apm-dai.

Fixes: 44432315444c ("ASoC: qcom: q6asm-dai: use q6asm_get_hw_pointer")
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Vladyslav Tymoshchuk <tvlad744@gmail.com>
---
Compile-tested only: I have no Q6ASM hardware (sdm845, sm8250 RB5...).
A test on such a board would be welcome. The hw pointer of q6asm is not
reset on a new prepare either (the same as patch 2 for q6apm); I left
that alone as I cannot test the q6asm prepare paths.

 sound/soc/qcom/qdsp6/q6asm-dai.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6asm-dai.c b/sound/soc/qcom/qdsp6/q6asm-dai.c
index cd4f82bb8cc7..4261c3048c36 100644
--- a/sound/soc/qcom/qdsp6/q6asm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6asm-dai.c
@@ -485,11 +485,10 @@ static snd_pcm_uframes_t q6asm_dai_pointer(struct snd_soc_component *component,
 	struct q6asm_dai_rtd *prtd = runtime->private_data;
 	snd_pcm_uframes_t ptr;
 
-	ptr = q6asm_get_hw_pointer(prtd->audio_client, substream->stream) * runtime->period_size;
-	if (ptr)
-		return ptr - 1;
+	/* a full lap of period buffers is the start of the ring again */
+	ptr = q6asm_get_hw_pointer(prtd->audio_client, substream->stream) % runtime->periods;
 
-	return 0;
+	return ptr * runtime->period_size;
 }
 
 static int q6asm_dai_hw_params(struct snd_soc_component *component,
-- 
2.43.0

