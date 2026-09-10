Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C0934908B2
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 12:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789045130; cv=none; b=DyjTe7rKmrzrVaCmqMfpV+jGOfq1KeFU6ebrXeUwqUKup/UOT7aTflXz8zmXMk9dAQnlI7Gt7pYYYO2jJvOKctYHFbcCykQGW14vv8RT7q/fRfZaGWT0aiNxVaPys63Nnb6FD4x7MowtC7wC1i/BVm6KMg08RpWHucKD8uuMnL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789045130; c=relaxed/simple;
	bh=L2LE+CaRB/r8u7ksh8vaBEGwU4XGfFxUrv1E4QN5LbI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l40bD3msSLIhEXsgjPtriFHQQR/NOAujbJON9E52BK00STDq+XRxUq8BcFNAJK/sN/79jARvpQ0QLKx1rPqzB7o/yEGLWahI0/aycHjR74lj1s5D0Jh2Oln9m2aYeMo688l9hYT9DyJj6bgf85QeowzawLvKXDFDWQ1NjWykeVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZijXHL49; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZijXHL49"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccd78e6eso1126813a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 05:58:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789045126; x=1789649926; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PGiDmxTKSnaxUwBF7nwBu69cnzbPnmVOgMWHLivqaTs=;
        b=ZijXHL493SAwG8pbxmPvAaTdsYslEMrAGHVASctHIx4v0Ma2NUaWDGTjDRW1oYgJQ8
         Gz5zVZn6bNBfZhBM1raKicpEDOOIq6z95lMcqivaoUXjhwlquC0WGBz7fIOgVm/PF1Ms
         6BjxRmqJ9U/x9IT9rt6DKG3pieinWVgCCUXeQDD/G824s8eYg+bzGe6M2ODNW59InNNU
         OuH979xmwWk6EqI9weG0HjHuHH7e79NjB9E9Dn6RXLTWiDIpaNCKjaozCmElUhS1nbYc
         6R2U4AlaBzlMp6GxKvsd0LE2Ns0BQYpxIMnuxmLtkYC9DwxMy1/gnEy1rEyO4gyYDMW3
         ALsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789045126; x=1789649926;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PGiDmxTKSnaxUwBF7nwBu69cnzbPnmVOgMWHLivqaTs=;
        b=PRERFTlDCo4pjYss8CnCfX3pQdWPWUnVb30q9999tPdpjTta3RybdR8BIYK90oMm6R
         N8CuARA5kskinklG3EKmgyiHHb/neWaaSwCTdIVE8PpN5ii569v/A/IeFZseAfVyBC0W
         Txpfsp3B4FLIdI4Aq4vWKh7a6/IqAIh/OzGNjHgoGZeGNWN81YVmsBW83MCXLCyM9kX/
         li0jOIks0NxfLcCJcvbnS3dUsz8RBw4VjhhKI+MOZ31Wyym62Fd7L7wXJXRF3jmRW/my
         flwdScm/OqfdFz5UaSBnPDwxy28yYGTT0E+0QGVkuOwYy+PH6ho1XcWybvbw/D7tRXSL
         kvTw==
X-Forwarded-Encrypted: i=1; AKwUvBw7TeJlIfO1ecB5BrLlviZqldZY4kUf41LkESvVlPBs/K/r6hEz6TfwxRxHS32FzZgUlO+Kmao/pvSGSgI=@vger.kernel.org
X-Gm-Message-State: AFuF++klQ93GsOOMQEFzG713hBaJS3PvNzRMMBRoSSNBefNOh3MOprqR
	GYqTH2MoTSp32ysE8qY1AMJ7QNrBwMFi1oAS+uvHVujK+WJtA82AtKlL
X-Gm-Gg: AYBFou1Z3vibJP3pLAbVATR7+zUztXXsI+9L62kwiRjrA5WnM2E38/6D5GH0WuIzaF3
	C4WzId/sWw+OqzMRGymZrWG8GTKYDJKDB0Vh3Kvkh0gHWwRMa73OH6OFCxTbo95ABM/z5GyxQ8Y
	EbLrDZvkdVULwr2nU9WBqyAUMtAr1RtFAko9cRPTkiAMUV0mcJnwJcABdHj7kFAWQxaDEerqvch
	x56ilLpagcg+WY30J+wkazMYXM85ldGadtpVD4n+e15K1mYnm57/GyBgnpJhro5RE9FW6SGiThO
	Tomgzfpe4wvhj0IGE5vtU/PsM1Ts0ecarKtfZ782WVey+N5HSZBwb/YBSFKmUHQmsLm9kFf5SD+
	/EDsnzxhMWLrhjmNvOe/emv4Cz8kyYyNWB1cxBA37nOrHPw5aT6STfBrKbkrISOJ/GlAFlZmtsn
	MEIxvaQ4+ma/0yFIJh8HTtUMPpeFHJkIi7YCOC8REvbegYLEcc3AQcbPGxfP7YHSeyg+sT91nTt
	ERg/e0QEzQjzx1fXJV+6TRk/4DpUL2lWkm2vJZuq3aycCyFp2eLKWXqpOX1iRRnLlFCCBfIsGfO
	1AFdL5pJLLSutJ3koOJVUTWPFQ==
X-Received: by 2002:a17:90b:5485:b0:395:8124:ac53 with SMTP id 98e67ed59e1d1-39d77a1d83bmr3896223a91.6.1789045126242;
        Thu, 10 Sep 2026 05:58:46 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d7e77b1afsm4891592a91.5.2026.09.10.05.58.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 05:58:45 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Cyril Chao <Cyril.Chao@mediatek.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Dan Carpenter <error27@gmail.com>,
	cassiogabrielcontato@gmail.com,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 10/13] ASoC: mediatek: mt8189: Propagate MCLK errors
Date: Thu, 10 Sep 2026 19:57:39 +0700
Message-ID: <20260910125742.150902-11-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260910125742.150902-1-phucduc.bui@gmail.com>
References: <20260910125742.150902-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

mtk_mclk_en_event() currently ignores errors returned by the MCK
enable and disable functions.

Propagate these errors.

Fixes: 7eb153585598 ("ASoC: mediatek: mt8189: add platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8189/mt8189-dai-i2s.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/sound/soc/mediatek/mt8189/mt8189-dai-i2s.c b/sound/soc/mediatek/mt8189/mt8189-dai-i2s.c
index 4826ee250d70..f20dbb410223 100644
--- a/sound/soc/mediatek/mt8189/mt8189-dai-i2s.c
+++ b/sound/soc/mediatek/mt8189/mt8189-dai-i2s.c
@@ -519,6 +519,7 @@ static int mtk_mclk_en_event(struct snd_soc_dapm_widget *w,
 	struct snd_soc_component *cmpnt = snd_soc_dapm_to_component(w->dapm);
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
 	struct mtk_afe_i2s_priv *i2s_priv;
+	int ret = 0;
 
 	dev_dbg(cmpnt->dev, "%s(), name %s, event 0x%x\n",
 		__func__, w->name, event);
@@ -529,17 +530,17 @@ static int mtk_mclk_en_event(struct snd_soc_dapm_widget *w,
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
-		mt8189_mck_enable(afe, i2s_priv->mclk_id, i2s_priv->mclk_rate);
+		ret = mt8189_mck_enable(afe, i2s_priv->mclk_id, i2s_priv->mclk_rate);
 		break;
 	case SND_SOC_DAPM_POST_PMD:
 		i2s_priv->mclk_rate = 0;
-		mt8189_mck_disable(afe, i2s_priv->mclk_id);
+		ret = mt8189_mck_disable(afe, i2s_priv->mclk_id);
 		break;
 	default:
 		break;
 	}
 
-	return 0;
+	return ret;
 }
 
 static const struct snd_soc_dapm_widget mtk_dai_i2s_widgets[] = {
-- 
2.43.0

