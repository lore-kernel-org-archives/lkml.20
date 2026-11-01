Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793543440;
	b=Q8qx6bkzzhAB90r8S/DPhmKxw/M69Q+pM1AkOeKwuSGY5Tkwc1F2j6KR9BPIZlPj1BzJ
	 2EdMQxHsKzniQwsN2DtXrTIH9JHrz4g0o9xk+U3fcgPICQwpsuRRKC6rCyylCI2xmdqEN
	 M1GwxNavy8VTx7F5Yro0AUdkLnnHGqCAsgT7p1jBNVpmSDBZQNC3W+BQ9C6L5gfK8D3i2
	 jNi0gg40TULAA/aCgxIsYlUHmEEbkmH3NrxgxTy7u+aMwU+XKYS2tEvf5IpIj+kdzhNlK
	 akMtk/EY9M0HBDX/jWJ/slNtwACfyZxWGw1P9/aH/7tfKoGpO4AV9U7ne7HeZdRaGiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793543440;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=tmzM1He6Zcm6h21veWQ/ul9U4i6SIDSSoe6SFpMsROk=;
	b=i5KTWVWu7VhSIaTmKuqtaVK9e+hwlmPZD+MqNlPBnS5ONMr8gAVrrbohAKl57gHzIEah
	 4K+9AFA9wcwY7r6kJNTm/Bw9NSEFiWFAKQsHNy4GcbnnbE0GNZ0JlTsLMp+czgbjO2Ln9
	 8S6cMeWW3kFTpKzOX+mOKEGWbs49P/Kbur5bscM3JCdU2DMTdO3hytwZTKlhrF+hMIBuK
	 tHRYnamFU2d5qoH5YsaFD94ldFkarCydO4D5y71/OGTjecVjgJosEU2d/L5twfPwb8Sxp
	 nM+Ui/Ukh/OYtDd1z6csXsUzhikVfN/IP8YEXncJmDtHUkdrHiPcjYBKtaapzVq//Dw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=A+M1Wa+n;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24182606A33D
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 14:30:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24182606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=A+M1Wa+n
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a208d93758so23315005e9.3
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 06:30:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793543438; x=1794148238; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tmzM1He6Zcm6h21veWQ/ul9U4i6SIDSSoe6SFpMsROk=;
        b=A+M1Wa+n9o6Ai1aDy5wIuMQ1Qwkbm9uj6N1YCs0axvyRq7zp/S7yNcm1HxCpeoriTL
         zUnYBMuGWUzpBFYEOgmnCb2zGtGGMm4c3BdODeDl8X5kDIkr8cVgmGz4ByekK/bl8pVN
         jlsUoSoWe6slMLaDpSMbNHI8j5mIKBjQ6BkqKzfBSLey/wSh7FU9UI9b95ZHUH1etdy/
         gmxHgT2czUkR0YvQiOTmKJeGoE0uOyNvbRzDjQEeUVphq/ar6VwmK3kJMVb70OaOpU32
         mybNpWC2JN/pg42L6iPUBn0HyZFEBy/p5s49JO7MKlLwA5sMzpr+XG6ZOdTC42GQg0h7
         iYmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793543438; x=1794148238;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tmzM1He6Zcm6h21veWQ/ul9U4i6SIDSSoe6SFpMsROk=;
        b=VI9oyk65sbrD3hJegiJIzuGkYIyjDlrHOknk1VnekCNqzCJN0DuCVAIk47FkI2Z/aR
         ooNRYgiYEDVF3KvnDJuh0iv1Va2p/57Dw08OL97Y5nEGPV/hrTAbaJclRmECi6ejsgOW
         NdfjoAPCDGpB6umtZ3whybg7r694k2t6DbHxamwvBFF/u89dQoYT17qVA4GfPPMUCyuG
         DhUEbvOYlNLYa+LaSQc4VSbNJP44IeoS9twboU3Ud+iuocPUIFg1IwoKCsikPwVQ9OOT
         Ougvsoas1XhyAqc8JcGS6pUVxkDVv+6X0lSUJhgzvYo32JopouZygBDm+sH++9taJk7Z
         7AZQ==
X-Forwarded-Encrypted: i=1; AKwUvBza1MdT4OMM8MpyJowm/9yGCjPQQwG2Vm+UtFX3W60fvH/dDxZ8LeApoq3fD7NLFUaVVLQIxHUAyOmDKS0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJB9KaGJnjx56wceM3bgeh5DZyAlYOHfDKhB9JwrexB9Z7rhVhF
	Ft1JXmiNBavIm5HM3blFg9vmLZjMF6aTGdKh/qmZ2xH5rhjyY5M/q/yN
X-Gm-Gg: AYBFou0XXwW4K3+ZNvLION4T2YLkbmCvJ3ybQjTPrOTCHMBHpn9OpxxMByGKO+X/92Y
	1j1PEmarCoNxydVZM5KS6eTFHdO3pdN0U/0160Y789Akg6GGmTY+xnbf+WWLqDbnfftTf7MQqOK
	AFVQ8nIjXJHFU6yQZwwMg87oK+M+Ceg6AiHXZpUAa0qEuecRUWMWTd8jME0IocLIPIFcP9/xZgL
	yDq9rFs9cYymFJuFp4gz+9iQmpSVx/ERG/32bac8oOD2e8Xl8ATui2cKmUmh5VYrVHRXhlOEfjP
	Fzmm59enE9+6x0i2r4wmaiCnikCWpqcm6fCB5zS3/PAccrMDCQ1LifF7qzrSbRJXH16aKPkAhcd
	hQjCq2xzqsaKm//yEJ63xPPNmBylRs4aIYmhu2ss4dCwCmvAOS2A7czMkDhyyHJGKDayvef7MIR
	+R1Q5IpjpGO4G4Z65MKxgHt/NhAplN3QUopik6kn/U9a7/+6wCTAujN6Y+vaeJfqM3DBKVUwgp6
	+R9/ig/Jak126z1LUusxby5HdI+FSf7VvfUR7QY2V7QHMI/vepo6H3MrBER/+F7fZqboNfHbb2r
	tPjhLklHnLjvFCl6M2CFQPePZNjOAXcygNGWl+a7b+7je5K+dKchXOwcpqlunDLlY8926j6NQhl
	KA5wawKtYM/yflilRKzePUvWh3Y+l2C4z3FzRaBdb/n/szQ==
X-Received: by 2002:a05:600c:4752:b0:4a1:9661:14b5 with SMTP id 5b1f17b1804b1-4ac18e5d4d0mr184744515e9.29.1793543438534;
        Sun, 01 Nov 2026 06:30:38 -0800 (PST)
Received: from romain-ThinkPad-P14s-Gen-5-AMD.tail433d9c.ts.net ([2001:861:39c2:e340:849f:a468:4121:a85])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abe7706516sm138430595e9.0.2026.11.01.06.30.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 06:30:38 -0800 (PST)
From: Romain TISSERAND <romain.tisserand@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Oder Chiou <oder_chiou@realtek.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Animesh Agarwal <animeshagarwal28@gmail.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sashiko-reviews@lists.linux.dev
Subject: [PATCH v2 2/2] ASoC: codecs: rt5631: Enable the optional MCLK
Date: Sun,  1 Nov 2026 15:30:35 +0100
Message-ID: <20261101143035.880469-3-romain.tisserand@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261101143035.880469-1-romain.tisserand@gmail.com>
References: <20261101143035.880469-1-romain.tisserand@gmail.com>
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

When the RT5631 master clock comes from a SoC clock output, nothing in
the codec driver keeps it running, and the clock framework turns it off
at boot as an unused clock.

Get an optional "mclk" clock in the I2C probe and enable it while the
codec is active, from the PREPARE bias level, as rt5616 does. The rate
is left to the CPU DAI.

On the GPD XD (RK3288) MCLK is i2s0_clkout, a mux between the I2S clock
and a 12 MHz oscillator. Handed to simple-audio-card instead, it is set
to the stream rate before the CPU DAI sets the I2S clock, so for
12.288 MHz the mux picks the oscillator and audio plays at the wrong
pitch. Held by the codec, it follows the I2S clock.

Signed-off-by: Romain TISSERAND <romain.tisserand@gmail.com>
---
 sound/soc/codecs/rt5631.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/rt5631.c b/sound/soc/codecs/rt5631.c
index f97fd24e42..d523d6d3a2 100644
--- a/sound/soc/codecs/rt5631.c
+++ b/sound/soc/codecs/rt5631.c
@@ -11,6 +11,7 @@
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/init.h>
+#include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/pm.h>
 #include <linux/i2c.h>
@@ -27,6 +28,7 @@
 
 struct rt5631_priv {
 	struct regmap *regmap;
+	struct clk *mclk;
 	int codec_version;
 	int master;
 	int sysclk;
@@ -1536,10 +1538,19 @@ static int rt5631_set_bias_level(struct snd_soc_component *component,
 {
 	struct rt5631_priv *rt5631 = snd_soc_component_get_drvdata(component);
 	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
+	int ret;
 
 	switch (level) {
-	case SND_SOC_BIAS_ON:
 	case SND_SOC_BIAS_PREPARE:
+		if (snd_soc_dapm_get_bias_level(dapm) == SND_SOC_BIAS_ON) {
+			clk_disable_unprepare(rt5631->mclk);
+		} else {
+			ret = clk_prepare_enable(rt5631->mclk);
+			if (ret)
+				return ret;
+		}
+		fallthrough;
+	case SND_SOC_BIAS_ON:
 		snd_soc_component_update_bits(component, RT5631_PWR_MANAG_ADD2,
 			RT5631_PWR_MICBIAS1_VOL | RT5631_PWR_MICBIAS2_VOL,
 			RT5631_PWR_MICBIAS1_VOL | RT5631_PWR_MICBIAS2_VOL);
@@ -1726,6 +1737,11 @@ static int rt5631_i2c_probe(struct i2c_client *i2c)
 	if (IS_ERR(rt5631->regmap))
 		return PTR_ERR(rt5631->regmap);
 
+	rt5631->mclk = devm_clk_get_optional(&i2c->dev, "mclk");
+	if (IS_ERR(rt5631->mclk))
+		return dev_err_probe(&i2c->dev, PTR_ERR(rt5631->mclk),
+				     "failed to get the mclk clock\n");
+
 	ret = devm_snd_soc_register_component(&i2c->dev,
 			&soc_component_dev_rt5631,
 			rt5631_dai, ARRAY_SIZE(rt5631_dai));
-- 
2.43.0

