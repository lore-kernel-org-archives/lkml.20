Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0D2B3FC5B5
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 16:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790870803; cv=none; b=fEwequhmEojF1j9fOJRUY5p8JIR5Ytrfj/S2ZurDzHRBbzqRRG7FkOrJeF+fKqq4S2KGn9xJeBk31AOB6p70/y7Q0TYCpjfF7UHjFKP65ftF+ne/Qq54co60OpqQpYPM7AQRqcRVcBGxjQRYkh9C7YXe+VduVfs8quFXhrBkDZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790870803; c=relaxed/simple;
	bh=USKlfavDbggOjZS2/SFDHhmHPla3alh2Tu6lzPN+798=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=u3VEwDTcYf99dzOtnwGnkTC11T2E2ErWJWPWTcZfk/UYOavII34sf99xFXfDOT7yvwSNccI38ABPHMl2ZHVgFwIukDfJHVUITp9dzcPlaFCyGz/oevMNXZMmDQ+VuJzKEDYVyrt+qo4vzGTVN/71mA+hX7GKImKsJuX5CaDKuxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=emmMNue7; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="emmMNue7"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-4a022e9cbebso6003395e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 09:06:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790870800; x=1791475600; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W5u7/CkWfak8RB/d8dqpu9NxHBzNm4GVmQxeKd8aK80=;
        b=emmMNue7mr8Q4OD8UNUWMKvRdT9y9pn0NfgLusUfH6LuU7Ru/FCj2ZLCm60eYRMyuh
         f4mPqINhUx2WBaVujmKzDdDIXFhRrtDiNhlLr/4mGtfWB1PIFURngGQ37Tti/ZIe8Ha2
         sqjq6TuTo/pzlgBfCXb1CVZix7ozK0lIdRVm4fidqekUyA8dPPflAijXwKJhAdhxoVxc
         w6AOEKgd7/kBnWoTz3ibhBeBs2+OdeG/rw2AwTS/I+Alj+RMK/LZWFhQuEfx216TyWp0
         x4j01aJjouftcEI+rDlCX4dcw3NnMG0efmsp58FjOUCWf3OEBS2cqK+5cqy7aHRxln0L
         uc+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790870800; x=1791475600;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W5u7/CkWfak8RB/d8dqpu9NxHBzNm4GVmQxeKd8aK80=;
        b=Hiha7CTF8oYEMIWOMZk4lRByNzhQtwS3cIX43k57duaczagflUag66GoTYICsXwRNP
         FPUA9f9q2c2npVcEykZIs8At0cfFBK7KqRAj/EMng5qWEINKJH/zpi6EAbmnCRRSfr5j
         42D/meC9Q2Uc097bRHA9qOAnUHR7RVVasEaiJSgruZp3BGIgAovFvqxhtZAC11CCoPuo
         Y8TY+HupnbOkBsdvePZqJSJ2vGrYOPqRkeJuC/0rWbupfkC67u1eOBce1AgxDsxbjKF/
         QdjMKZd1l1Jnu2QZYFYMkUpaDPpPoRJnGxFPl1QnOROhqyjBMNffrxO2axlwfnCWdaCN
         nzUg==
X-Forwarded-Encrypted: i=1; AKwUvBwGUuOKciOaGLFpz/PKwyUNYHReyxopJ1wZbqLk1seYwXDAnq0eaOvcytUtgx/fgI68P4x3vF/J4hUPkPs=@vger.kernel.org
X-Gm-Message-State: AFuF++mne8WYUD8msQUcpV2Q/wh7KnLTte/6QpBzdbbC9aEf2RpniRrb
	G/aaoyvvkgVgv3UM7Z3uSaAhsUS1I2xxa3XaCTHosShkavqcPZPDBSHi1rJRqGbR9Ko=
X-Gm-Gg: AYBFou1h31lD2QMJgvK/1skH/tiuUW5xS4lPrc3UTH4SrhI3l/auofOZb3eH99miQCY
	3K65RajeOH4wdZqhrxDp/Q4kGb6Ey+cEylc5+vYo6/WF8PyIO24j2WQzVQ2aeveKKuLChajFM+5
	SDZeZeFyOfP7qsPsYLfjnjIKtZoBc32FyAL4bV3h/rNQs4rOV2anMVOPunZUPIzQLhLOCpsGFIB
	VUaVkYaN8BB/pAwifp3kCWXxxAG+QdMP9TugCDs96Xobff1afYAGdWwzpn9uB/gQSLK5TOUbsJv
	1HqngNRr3UpY8vnGIdzHNnwLRf8bIAsZVU/3vCPzAfnCp4sMvlTMlUGch0do4oGSSp3uIttkQFT
	uSppfUwCzvw9UyF5IAnJP1FxtqQAZDHsQq6mvPmH8Vlu02fSm/SuCU1EAiO3ohKcQRUxiMCD1OJ
	8CoFbcLgM56sYAMrUcI7ENnluQhk9p1sFV8zmFZnP5X+hJ2aiECYcWa7x20qOyeVHU
X-Received: by 2002:a05:600c:470d:b0:4a0:276e:9efb with SMTP id 5b1f17b1804b1-4a0276e9f23mr1133685e9.4.1790870800021;
        Thu, 01 Oct 2026 09:06:40 -0700 (PDT)
Received: from [127.0.1.1] ([151.42.82.6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01f93ad0bsm52969705e9.4.2026.10.01.09.06.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 09:06:39 -0700 (PDT)
From: Valerio Setti <vsetti@baylibre.com>
Date: Thu, 01 Oct 2026 18:06:28 +0200
Subject: [PATCH v4 3/7] ASoC: meson: aiu-encoder-i2s: ensure clk divider
 gets disabled in hw_free
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-audin-v4-3-2476646118b5@baylibre.com>
References: <20261001-audin-v4-0-2476646118b5@baylibre.com>
In-Reply-To: <20261001-audin-v4-0-2476646118b5@baylibre.com>
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
 b=owGbwMvMwCV2z3ty7kUrRgbG02pJDFn7Wrl71S8qlvn0bxGeEN9lfjP73UHdr75XPB8q9PeJP
 Vb/M/NXRykLgxgXg6yYIgvL9Hu/C0rVHhonnCyAmcPKBDKEgYtTACbSqMPwP3Zr7cr4t3OXGOnE
 /GjefIf1tdJuvt731pMSJVp2XKiZksPwv/CLslLal9xVD8qXetZzrpPXXSg+1ydibuup3vY2vkm
 SrAA=
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

