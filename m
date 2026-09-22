Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88C3554EEA4
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 16:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790092899; cv=none; b=AVabUEbD56BhxQUew+U/OkstTD5IvzxAsSYv4GVp9nmq9y8BzoDztF8WuA1YPsWifhJUk7S3VOGH/juVmrKDlLyyPjuYMHKdfSNn3sO6OLqBPqFR36T31kZxThn3eJgJe5WmWsM8p6c3wE0kDMRAB6DgJeSISkig+HrnJ+Hu/js=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790092899; c=relaxed/simple;
	bh=USKlfavDbggOjZS2/SFDHhmHPla3alh2Tu6lzPN+798=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=b1YuM5z1rbUwWnS/thUT01bKi0xzqztHekwpBcNGVv1bo+GiXUbtbL+iPKlkmrKJbwVrDRxxVnj1k8UNKUS1crgY4v1rNdyBYKn08nviTc01OEnK38n7z1iWF785h36S/ecHg1uzLWc9bBCMLjNBx/W2mqTpreWBntBX42m6J+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=NOiDVEfd; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="NOiDVEfd"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843c3ee4cfso57853f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 09:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790092895; x=1790697695; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W5u7/CkWfak8RB/d8dqpu9NxHBzNm4GVmQxeKd8aK80=;
        b=NOiDVEfdUQZTEqAvvq9zsRXRJEIYCjjIc3xqpW3h2FZp8PdiLvMK9bWEwOzLUshliR
         +rPuQTJQcGwlxNu/s/1aVSwqsZQKNu83AdcoGWGVDxK8Xa0DTSNxC3UvNWXEv3I1X3KY
         QcHnNO5eftVfMSmcr9IY7iBNmnBO+3XQcc8ZIvQ9gcyNNGU4e0vQ5P2r6rRLqfAqDS9U
         Y+11fkXxJQxUaGL1AHK7pYE70we0Fk1NSckiZjMK/Y6pghwBZcTZ4laLZzD/pte6xaAB
         0xgbzADmGhYTk9krLPTMAs9t+pwEnkHZl9H1XWE+jeWUuE8U67tmWNQ1HAUArW7bZHNJ
         NMnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790092895; x=1790697695;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W5u7/CkWfak8RB/d8dqpu9NxHBzNm4GVmQxeKd8aK80=;
        b=ZC+IKPBStg2PlQmeRvbsAfmbjdwLqFBevocw12GBpfaMjW18cIC20jeRpod0Jxa3lh
         j3RF0U3qYERsZxuSslPHSuEmk2m9QLJBHPMP08e0MJ/OGC5Va7F14lNlHjJuFXupnfkh
         nysjumzRFus9wHYAK8uwNuVKc3MMC/dGB5r2vDrZ67+jTrCPOVnowBW83slSjyw+GgqM
         gOjpppENXjtHyOtSvcQlRmjoDM5PXNR59jyN6NaCOJfdHdhxL5H4uj3MkjJm1uPT42LY
         ub/nrKGrHVMAfMdpJqLkcWRrKaIMYpfESPHUVi26CktJYQRkxJ6M6VU8eDKRkKGyKisL
         qGMg==
X-Forwarded-Encrypted: i=1; AKwUvBxwB95kWkVaeKSgLsGIw+FDI7EDoxLiA3JWcZAyQEo39OLIM9nKfZjo6h0C5YTR5OQ0BWzgSPUW7j9XCVQ=@vger.kernel.org
X-Gm-Message-State: AFuF++nwBszb+eZvzsFLG/+HYFqJHvkji57gQOA1GYriZaVRfSQNXu6D
	+i2W7twNnrnwU/erXvg9dr4Yz2Bwp7Y+kIoZ+pqwa+D+g85ek4ODjr1JPyOT+g1zEbI=
X-Gm-Gg: AYBFou30rf8TZFjDVXl/k3hOD+XH/8PtncR9bOZPAhO6+Ze8wCsFNJi3pj+NP9Cwn5q
	kTVpn6PQrPbhzgvqzyC/buNcveX9Wpw4K28XSeMb6KVFvQ8AHpzqATWshPwhDH5BFWTXJNPn8PU
	DrO21Z+0JvdX7ExtjDALxiIv+jqXVm8riW14m/ZVkDOcSXKskQuvxyrAeSdW407mRvUWWqjlF1l
	Q5tBf1ALFNZhnH1BPSLWswp7PLb7CkPlFPZ9bj5zwxW1cS+DESr95rQ4voFDd70pG53yFHSWJbL
	DNq6LZAoCpZx3ARiSVvl0dp+r8KInCnqf7mwSlUTX6uZJemb98kiz9I4Brl3NrnxaRJEmBnFkL6
	cxN9ckGfodRn0K8dw7/hmtaEjKro0tIif/q6yPkT5BVh4jr4yJ4zkzFxdwTb2r9mtBz2vnACyr2
	hhq4az0ObF+zXBa+yCWKWblHEFENUZEDsf2GMjXs4/LzW2Sjpk754A7qtccg77V/Z9xA==
X-Received: by 2002:a05:600c:4712:b0:49f:dd10:3c71 with SMTP id 5b1f17b1804b1-49fdd103ccfmr22007895e9.11.1790092894693;
        Tue, 22 Sep 2026 09:01:34 -0700 (PDT)
Received: from [127.0.1.1] ([151.42.87.32])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48862786dc2sm6118020f8f.25.2026.09.22.09.01.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 09:01:34 -0700 (PDT)
From: Valerio Setti <vsetti@baylibre.com>
Date: Tue, 22 Sep 2026 18:00:48 +0200
Subject: [PATCH v3 3/7] ASoC: meson: aiu-encoder-i2s: ensure clk divider
 gets disabled in hw_free
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-audin-v3-3-a760312c076c@baylibre.com>
References: <20260922-audin-v3-0-a760312c076c@baylibre.com>
In-Reply-To: <20260922-audin-v3-0-a760312c076c@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Valerio Setti <vsetti@baylibre.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2122; i=vsetti@baylibre.com;
 h=from:subject:message-id; bh=USKlfavDbggOjZS2/SFDHhmHPla3alh2Tu6lzPN+798=;
 b=owGbwMvMwCV2z3ty7kUrRgbG02pJDFmblkWdmnXxyuvtO2XuTbfN/OPOpc69WvCaZKdG3trCh
 X+fBTvN7ihlYRDjYpAVU2RhmX7vd0Gp2kPjhJMFMHNYmUCGMHBxCsBEnvgzMnxcnvHv4du5jDnP
 fC67L/cK+Dm3Y5n1XwnnU2u1VnLGMakyMty8rJ5w66gVU3VHIuuk3+mXLvuFbFboLfCUYa9tWNz
 TzQAA
X-Developer-Key: i=vsetti@baylibre.com; a=openpgp;
 fpr=0497DEFB707526E13360C970DE4B936DD13A0100

A recent Sashiko review [1] on this code revealed the following problem:

  If a user opens both streams so snd_soc_dai_active(dai) evaluates to 2,
  and explicitly calls SNDRV_PCM_IOCTL_HW_FREE before closing them,
  snd_soc_dai_active(dai) remains 2. This skips disabling the clock
  divider.
  When the streams are subsequently closed, the ALSA core skips invoking
  hw_free again because the state was already changed to
  SNDRV_PCM_STATE_OPEN. This would leave the clock divider permanently
  enabled, potentially draining battery or blocking system suspend.

This commit resolves this problem by using the 'clk_enabled' field of
'struct gx_stream'. In particular when 'hw_free()' is called on a stream
the code check what is the status of the other stream and then only if
both are off the clock divider is disabled.

[1]: https://lore.kernel.org/all/20260917212019.4ECE61F00893@smtp.kernel.org/

Signed-off-by: Valerio Setti <vsetti@baylibre.com>
---
 sound/soc/meson/aiu-encoder-i2s.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/sound/soc/meson/aiu-encoder-i2s.c b/sound/soc/meson/aiu-encoder-i2s.c
index 58dce9f08c9d..70ea39c77b32 100644
--- a/sound/soc/meson/aiu-encoder-i2s.c
+++ b/sound/soc/meson/aiu-encoder-i2s.c
@@ -219,16 +219,14 @@ static int aiu_encoder_i2s_hw_free(struct snd_pcm_substream *substream,
 				   struct snd_soc_dai *dai)
 {
 	struct gx_stream *ts = snd_soc_dai_get_dma_data(dai, substream);
+	struct gx_stream *other = snd_soc_dai_dma_data_get(dai, !substream->stream);
 	struct snd_soc_component *component = dai->component;
 
-	/*
-	 * If this is the last substream being closed then disable the i2s
-	 * clock divider.
-	 */
-	if (snd_soc_dai_active(dai) <= 1)
-		aiu_encoder_i2s_divider_enable(component, 0);
-
 	if (ts->clk_enabled) {
+		/* Disable the clk divider only if also the other stream is not using it */
+		if (!other || !other->clk_enabled)
+			aiu_encoder_i2s_divider_enable(component, false);
+
 		clk_disable_unprepare(ts->iface->mclk);
 		ts->clk_enabled = false;
 	}

-- 
2.47.3

