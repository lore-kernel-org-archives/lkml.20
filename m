Received: from mail-pj2-f40.google.com (mail-pj2-f40.google.com [74.125.227.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5C3240F729
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 06:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790662361; cv=none; b=QiDo/Ax65ONaWdGbne2qRbwGSGPMejsUOzEoFKzjWe/HMOzCGXahGTtzzAFZznFVvCTnvK2sPkdxZnkOxFz+OjAObKfe6Icsw6qTGHFKSyGm92K/wrhzkyVtMWrl1TQ4prPsiqlAbG30xudDxkaSK4b/quLeg5spP/UDj+RvFbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790662361; c=relaxed/simple;
	bh=aSG/mO+jjXy45DeBDmnxfrUgXQ0xO63nqGm5LAkitdI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dVq1rxXE0lmRUpAtl7S/irj1nKMqh6336WvnoBojSL9RVl6KwVcC1Hx04/VEVOoVPQO0GIBzCZnnhFWSPuuTRAdZ4OfcHErO/1IfpOh6o8AGwcdNh4qq5RhtOCNohQKT+brBFWTXspGoztbVb1/wTviNxwkUR0uusRfkfWqFfsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p99eujxE; arc=none smtp.client-ip=74.125.227.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p99eujxE"
Received: by mail-pj2-f40.google.com with SMTP id 98e67ed59e1d1-3a0d2c37b0bso1294299a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 23:12:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790662359; x=1791267159; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k60ENxxvKqkmqFX3C6HWvuRoh61RAwKi/dliyQ5+2AI=;
        b=p99eujxEUtjukjm+1wHMbyE7M/ObGIXDRWiXEBvkf6hhTxNC1MGsAj4wA+tApB7yW6
         7KjPGrnh0OKyVudCzIZ5oB1FyOOcrL5e9JPcfBlFmWJPqptoA9RoJov1oNmBSglsJqDC
         M5yC5UwUH/NMrcPZOwH02eCxO7tp375bnzfb8zKI974wzTJ6Ifh4jT3KPp7k7lTmz4vp
         TzCBjU2G+vAexqgjsgHTDiPQYpW39fSmX05pNFU+pcShliBb6dYY456w1r1HO6fm7QhI
         v5pgnarJy5kKJhSY1cBuB5/x5oyoKJqxteUt20UX3EXb1/Sgi43eJDgInfC5/bb8/OO9
         Rj6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790662359; x=1791267159;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=k60ENxxvKqkmqFX3C6HWvuRoh61RAwKi/dliyQ5+2AI=;
        b=LeKLiOhtUcHiEp7FgMQHX99nRXFcrJ5lxxA3IoB5E4scNl3tk6k9ZL7ygS0fIAsj7e
         olIgzXLTuyRhww+PZRMMvCYpBCEdmtsm2VWW/f6ClwZPEX4Mah4TvdowLwVjRnB5OpdX
         cRUCanp+WKX5KB4QREcNzvC9S6BtPYywKGWMqWlpaS08UfNM0u/+qzVqusmmT1E6fCjO
         gQ2Iq4H94UyKcwaZVCXz6Ae/1/xXzWP80vK5pMLwydF8pP2LKvHpnvOKa6ZM26CPIPzm
         ML1bh83C9n14ay8yuYH86ddpqQ6XHheQubzEDAebOH9CkEp3pbjAM73MyrVtRCg3mXmX
         O5Ug==
X-Forwarded-Encrypted: i=1; AKwUvBwxbRO4Qhj9jO+uo4p+gxPXIhff3GmSja0qrFzZohvpSZp49wMJpc5RqQhb0s88WAWFpwpqR4ds/svmPCA=@vger.kernel.org
X-Gm-Message-State: AFq9FYLjop6Mr5Ge44Syewhelr7RDEh7sPVnubCaAb2Eoq6zIByko5Bu
	XTCtiDo/6Peqj9dY4toTubKgRbI2rN3meE10YP+KPAAcpIVmbA3UsbNS
X-Gm-Gg: AYBFou0cGw40h9O4flgIt90V4si/saSSUqnQ2zvudROvNvkX/gPsaF/z8QmDJXNE+vG
	jdqCtzTQz3kdkqC8aC38e03bFkD4G4V7fiwgULX/HudLeW6rnFPiCyfWjGWfX9MYA3x51SLtC7z
	LLQ1uFkcZ0JdJWuZApbrUBsr5n2lqqUXexLRMO0/kgsCO2jXZZW9O0SeHwPeR3Oqsy4c3VJM5FN
	wpOFOzm0xJm5EOwV05Cbi8EQ1yj4PWtf+BJGz0eOW+oRhBnP6R0/sPwn5YRTRIW2n1h40SBenwQ
	b3+XoSA3ew1dS1PrVXhOpkAR7F71Z74wZayMCmAprBr3gU/JKjtXfVDpvCvWM83X7EJ6hRgyWWf
	8gfzpP0SHAABo8q2YE/H8QO4EhM+ORmdqswQxS1wtfcle5WB0jnR104i6osG28AIuj226K2CnpF
	o9m0VxS91XlxWKcEYkxeGB78kdNC6ry2lZjtWemN53OT49YV9FffR96z8sxj6VWIbzR7WzgYI2F
	pXtxWlfcq2M33w1vMu3lxy4jXU28JcMIBTW2gdhb4ZGcHqj3y6kvNsLZH1ksyGklW5HoMEcvKC+
	Gqr8lUErYmOSvA==
X-Received: by 2002:a17:90b:2b45:b0:3a0:8a03:2a2d with SMTP id 98e67ed59e1d1-3a098d35687mr13123807a91.29.1790662359209;
        Mon, 28 Sep 2026 23:12:39 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a498726d63sm3280965a91.17.2026.09.28.23.12.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 23:12:38 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Darren Ye <darren.ye@mediatek.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	cassiogabrielcontato@gmail.com,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Cyril Chao <Cyril.Chao@mediatek.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 09/10] ASoC: mediatek: mt8196: propagate I2S clock errors
Date: Tue, 29 Sep 2026 13:11:20 +0700
Message-ID: <20260929061121.124001-10-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260929061121.124001-1-phucduc.bui@gmail.com>
References: <20260929061121.124001-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Propagate errors from APLL and MCK clock operations in the DAPM event
callbacks instead of always returning success.

Fixes: 65a195132669 ("ASoC: mediatek: mt8196: support I2S in platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8196/mt8196-dai-i2s.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/sound/soc/mediatek/mt8196/mt8196-dai-i2s.c b/sound/soc/mediatek/mt8196/mt8196-dai-i2s.c
index ef5cde0ba829..adebf75629be 100644
--- a/sound/soc/mediatek/mt8196/mt8196-dai-i2s.c
+++ b/sound/soc/mediatek/mt8196/mt8196-dai-i2s.c
@@ -985,27 +985,30 @@ static int mtk_apll_event(struct snd_soc_dapm_widget *w,
 {
 	struct snd_soc_component *cmpnt = snd_soc_dapm_to_component(w->dapm);
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
+	int ret;
 
 	dev_dbg(cmpnt->dev, "name %s, event 0x%x\n", w->name, event);
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
 		if (strcmp(w->name, APLL1_W_NAME) == 0)
-			mt8196_apll1_enable(afe);
+			ret = mt8196_apll1_enable(afe);
 		else
-			mt8196_apll2_enable(afe);
+			ret = mt8196_apll2_enable(afe);
 		break;
 	case SND_SOC_DAPM_POST_PMD:
 		if (strcmp(w->name, APLL1_W_NAME) == 0)
 			mt8196_apll1_disable(afe);
 		else
 			mt8196_apll2_disable(afe);
+		ret = 0;
 		break;
 	default:
+		ret = 0;
 		break;
 	}
 
-	return 0;
+	return ret;
 }
 
 static int mtk_mclk_en_event(struct snd_soc_dapm_widget *w,
@@ -1015,6 +1018,7 @@ static int mtk_mclk_en_event(struct snd_soc_dapm_widget *w,
 	struct snd_soc_component *cmpnt = snd_soc_dapm_to_component(w->dapm);
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
 	struct mtk_afe_i2s_priv *i2s_priv;
+	int ret;
 
 	dev_dbg(cmpnt->dev, "name %s, event 0x%x\n", w->name, event);
 
@@ -1025,17 +1029,18 @@ static int mtk_mclk_en_event(struct snd_soc_dapm_widget *w,
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
-		mt8196_mck_enable(afe, i2s_priv->mclk_id, i2s_priv->mclk_rate);
+		ret = mt8196_mck_enable(afe, i2s_priv->mclk_id, i2s_priv->mclk_rate);
 		break;
 	case SND_SOC_DAPM_POST_PMD:
 		i2s_priv->mclk_rate = 0;
-		mt8196_mck_disable(afe, i2s_priv->mclk_id);
+		ret = mt8196_mck_disable(afe, i2s_priv->mclk_id);
 		break;
 	default:
+		ret = 0;
 		break;
 	}
 
-	return 0;
+	return ret;
 }
 
 static const struct snd_soc_dapm_widget mtk_dai_i2s_widgets[] = {
-- 
2.43.0

