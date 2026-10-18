Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14F903D5676
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 10:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792318725; cv=none; b=sDzDX1VD+2YtDXdsOgH9tZw13R5Rbq2ApblluBssgeWXJiJb4ZtYEqTUUJ7Be8ZdKN4BLu4BHnPc9vHijkXpkwGvE0U42dBxXPZiPXqfoWLu61ZSiAWJ5ouQQr1Yx9njO/KNqQ/y9+Lrehzl+H8WAiA2rEKiQb5WOOMMUHvEHfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792318725; c=relaxed/simple;
	bh=Qk2A3Ng49JvEP4XBMLZ/d8qcgAPxfwhjjFg0wL1puf4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AMmWmAKJznqF6Xw7QTlEc5KTOT/4ciYPMM52SKaJ/WZyGubg2cEegJyueFN6HCM7V56b26YogneHnJt32GphPZ7b/Jzmww0vWnUUA8DWUZDjYqYO8jK1P1TpEHyUQNheR53E9CdYUjPMtoFhoSpA0r2aLTwknb+72amZ0YzV2yU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=bsIiYVP5; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="bsIiYVP5"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48c4be28b82so926077f8f.2
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 03:18:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792318722; x=1792923522; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TQNZ6Re7mqkz64OCBvW/WYYm6ii+FqgQ5/P5td06ppY=;
        b=bsIiYVP5x/ik4LINfMEpmcTWm6xfqOS73fbtAGhtvTzY066fG9SepR+dDZpynSo7ge
         +Oq5hwW9SeA9HpOYEO1kMfwAOSRMhFU+qTXuTdAgXIQvL0kMUd9/o49B/6PhHK5yRiMA
         WlfCc77VfCwTncwr+SUvLbnUTEikhtLeQ7Z18yxDZVwm5YhP6agvVY3w6cwUStMy/JwX
         /fqSRBPM5hvyPj4c4fDaP6xqWHlsx4arLT6EZhuHCx+JKhpOXa23MT4ke5xeDYqEZt4X
         nTwJ+YefwFi9lS4arjxAPibwsOsxk3xO8Ck7zUCYGuMlt7yR2YWaUV7FTN8k1O3gRbeh
         wBYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792318722; x=1792923522;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TQNZ6Re7mqkz64OCBvW/WYYm6ii+FqgQ5/P5td06ppY=;
        b=tCxFYeF6yDuYljKSreOZgWSyROLjZEM5L3cilBrfR/UyoHOmIG7JdjrZBk8EIIekLx
         aTc8/GrQg4IA9H1mx5irano4NNW3IIGG/07lIKaZyxXJPIAz0QYw/33zTi8eG4tudEYj
         /WN9LKKzFQWFKfkI1k89IJaTieP5CYxA1CzlG9c/wGlLD722yzcaXJRyKXJNpnANhvnd
         qS+X09kFJgk62QuTqO9aE4FH/JoqcjV89gMcCeGCWRx/bBMwMDYtsxiMRIeE3GhDRPEp
         J4/ylrX0O9YPWIFFAQu+E7yKesyHnC6ljwr2oivBXz6CkusrqYCv0K7b7/bED1jJH64Z
         y4Sw==
X-Forwarded-Encrypted: i=1; AKwUvBzG/8AJJlE/zjSPZUAxmezBbakQ/Ef6DdMiCs5d4k5sGwVsVxrEg16KCSWSiBFAFKbqV674crWg3nMEbE8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLM73MY+IydtFHJl5FxuMFlnxcocdZOXc7mXSBt1CPm9quuxYNs
	q4K4Re1jxh0v6ncgKG0VO4zJGFNH/arppKhVCbrA+3dWar/NNA/If7CYV489b+IDO5E=
X-Gm-Gg: AYBFou1noYhuWHKEKlH23/dKf/KqeqXJKOD3iYAHcaLRTRbXwPIKyixFrg8cwH3ulIa
	KecgfaLS6hfx3wpm8IF72N4LtDcCH/9CRR3kWMeAB1AvMR0DEMdgOzhqFw7gCdewFfdUUAYXHIs
	DehjwARlrOTbd+2GMPw2LsfBlsp7e5y1dj0V7k8woScx6tAuewW5iJ2CJGxgWWz81EV1SE3Ektm
	0ZUswC9Bvswyt+WUjjRVIXxgYanmP2iPqUfbxEWLMcnXU4D94PfK6EBgm3Og+MoUxwLvG2XT4tg
	2wj/irJOiJqrtMdwoV6mfP2u545e6DPr1wTPAbxe2EtkAPXn5d7kPtKZStKwn63MRITVVa8a/89
	PNGFbKbH22jTQSbrkC41dOiW5En2eupMHwoidLBu6g4ZZXzLY+luqK5GXU4NOKBodNLJyZyDOKS
	GLC1OfQNtVMN9a0skUF74+OWyfpyyaU2ykKAIE5vKqnKSb9fAtOFxVJMKNxIEjVteTDNwIKZtfu
	paNCp0=
X-Received: by 2002:adf:f8d1:0:b0:487:27f9:834 with SMTP id ffacd0b85a97d-48e07faba02mr6857938f8f.41.1792318722254;
        Sun, 18 Oct 2026 03:18:42 -0700 (PDT)
Received: from [127.0.1.1] ([37.103.126.255])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4d4978sm14911507f8f.21.2026.10.18.03.18.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 03:18:41 -0700 (PDT)
From: Valerio Setti <vsetti@baylibre.com>
Date: Sun, 18 Oct 2026 12:18:00 +0200
Subject: [PATCH v5 3/7] ASoC: meson: aiu-encoder-i2s: ensure clk divider
 gets disabled in hw_free
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261018-audin-v5-3-4b8cc13a1b22@baylibre.com>
References: <20261018-audin-v5-0-4b8cc13a1b22@baylibre.com>
In-Reply-To: <20261018-audin-v5-0-4b8cc13a1b22@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2447; i=vsetti@baylibre.com;
 h=from:subject:message-id; bh=Qk2A3Ng49JvEP4XBMLZ/d8qcgAPxfwhjjFg0wL1puf4=;
 b=owGbwMvMwCV2z3ty7kUrRgbG02pJDFlX5vx+EWnIz63dfPL3z2jti6pr5KfoJl68WJOeJRBh7
 XW3dMK2jlIWBjEuBlkxRRaW6fd+F5SqPTROOFkAM4eVCWQIAxenAExE8D4jQ7ODszx/o9TVn4E6
 i0vfrDTQ/e1VIPk1T8lh9kzuRZ7HfBn+6cdnxNoXdBupWPpFRPELfb++0FJJdKV5Ydfp2K8XvYv
 ZAQ==
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

This patch is unchanged compared to v4 because, as I mentioned in my
reply [2], based on my understanding the race condition should not happen.
In case I missed some corner case please let me know and I'll be glad
to fix it.

[2]: https://lore.kernel.org/all/d90324be-c43d-4d28-9f1a-e28e437031e8@baylibre.com/
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

