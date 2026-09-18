Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C85805172DE
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 13:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789738852; cv=none; b=jBD86voG9U8i3qqMq9uSaoyqYJUQ9KF90x69p01h6sIh9LvvvipwWRUkdckUZzUTnX/eQbwVYMUw0LArkiQN9pBsY4YBM7/8co0oGKCG0FGQMe/uZGV7JJjAszCBlink5rgPTJgDeXrXhp4prw2KY6WbWrTcddOH18xch8UGHDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789738852; c=relaxed/simple;
	bh=irQHW0C4GyDEHDwrxx67A3iFMFX666gydmDN+38lJvc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RzHB25/3u2JURyui1p+KoQdo0ja2Ua4jz9mWctj26uWuK4qXLm9ooTK1/sd/B9tl6pP7AScOlUlTKvmaSlJh3lm0T0PfzY3eQtH+d+ze4Qa1fyPYl0OJxxEk4nY5G93uFp6XZETsufNXjjuIwOmV0LrxsekZAN3biIwPPAjzF50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jar6CboQ; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jar6CboQ"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-396ccd5cf03so743883a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 06:40:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789738850; x=1790343650; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=84KmttxwxJZo38Fsi4kV8h//UiHGZgZirQkHOuGC9Ho=;
        b=jar6CboQzXpkHfcMO37J0dtKTMakL/wbIWhqLOo0iah53Xzp6OrBT1bdcUiB1IakC+
         QLIn4CECdOrnTlhkm3l2ocnw9yrqh2eAZlGUPSK+JJELCAHIbh+n0RHuDU+vHUU+ILlN
         5Tsvew/LbYpLfZIpZDD38cYFoUx1ps4NbC/hpf8bN2yIQybZROm7PoVgUIs8T805D0SG
         VKeBw9zZZruDyq5Zi9Vhr5v5B6yPMA/rBFzuDWVuJIUV3uwD6vZf+iOPxgJ3uKEh5GRI
         apVbDbLdZYtsipI6zC/NL+XOeVrFLuYUProEneSHhOx/8BQkSkhhpFVELw/5e3TcGp06
         YcMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789738850; x=1790343650;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=84KmttxwxJZo38Fsi4kV8h//UiHGZgZirQkHOuGC9Ho=;
        b=o7JmC6t+vVEbHrfrzVvBB3OcSCKFwN78LVCJKsES5RdHVTzU9KZN1+K5taXxz11hli
         aGYkh6Csc+AWOlCGCMyRmupglXWkDQ/lA2aUklHk9FX55FyRJKh899VZIHZ/znrTc/p5
         7ZaRXLQ0z+mAtqWkHBSq2ngkftvcdtymo3L++MSvivApPmNWNNrCu/8vrjx29wRccwbS
         ZBBUsl9eANy1dXUDBIAGTSbNp7wLxHJFjP0nTMBVBmVr/Yj9OStucinsL40Py1esrORS
         XqIiVJE359pGhTnaS66yxLM40+a08fBHcXlQHwUQIC0zlvO4bz7ncl3/5NGu3cKkmenG
         RGxw==
X-Forwarded-Encrypted: i=1; AKwUvBx9yLI2ZmWHvmrXaOe0xtv1ubTc5Zy1glKX972p1xddklY/OojTdO9s8CsglOYxRIOPNNZgp7hsYI93BPo=@vger.kernel.org
X-Gm-Message-State: AFuF++m5KVgN2pJtyAFkV0IrhcRXNZtT1FhjMVXuHzMTmfc9xeSnqKyY
	IvfzFnqnBjYg2bauhyiNzcHqIoeB4of+yVcHutCbQrO6mSnNfpzdbSd+
X-Gm-Gg: AYBFou16CMCUa3ahc8uGKzYmShA0joPVgvAgyS/VNe2dBK0rCxopSq2zXazjNH+NLxj
	hFebBu0W+FoihgijyLI5rqonBNdye8NEUoG9chuFpvkvrh1R1tKBJkrHEqLOICvO2GBMHhp7mWn
	yjh69BTadBcIQe+LqkUMQxBxZNmEK6GdjorrU+nGtoruuwP5aQW2JJtfondGxGysyp8N7sZZE3M
	/47iVlNap/9/R/AlqbXRLYlUgk36HzbHdeV1hnolQT9ODZ47zAYKrtqTe5kGUV1Iq/0s/SBeS6i
	U3BZpgGSE6MdTgrZPcCSBuQFEUy7tFnhYZCsAgJzK5iJfnlnGtrwKOozOcCD28P8GgZBDtaCtBI
	MuCfnbWI3YhBymL6KsTLXbTujm8yYDk0bF7jkvZXKvYD3jFomtPdX50Xo0Z5tCoSRzCR4UbPu2A
	O1AU5IJrOxeO8arujXgFAcqlI6s24snx2PF/poA0aX6KRCdem8LcKNifOfhMLDQSm5HBOVWZAcH
	2RVbkPdNhGOGvZpjjxtkjvVFWGxUD+6K809kuAfUYRgLnMot8c2sBoL8KBZyftjRspP3xFDga99
	KNpZvYhP5TmtXTuh5nk3p21n
X-Received: by 2002:a17:90b:17c1:b0:398:e86b:ce14 with SMTP id 98e67ed59e1d1-39e54e3f526mr5588018a91.20.1789738849715;
        Fri, 18 Sep 2026 06:40:49 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e3617443asm13253792a91.9.2026.09.18.06.40.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 06:40:49 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	cassiogabrielcontato@gmail.com,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Jiaxin Yu <jiaxin.yu@mediatek.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 14/15] ASoC: mediatek: mt8192: Propagate errors in I2S DAI DAPM event handlers
Date: Fri, 18 Sep 2026 20:39:10 +0700
Message-ID: <20260918133912.133799-15-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260918133912.133799-1-phucduc.bui@gmail.com>
References: <20260918133912.133799-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Currently, DAPM event handlers in mt8192-dai-i2s.c ignore return values
from mt8192_afe_gpio_request(), mt8192_apll1_enable(),
mt8192_apll2_enable(), and mt8192_mck_enable(). If GPIO configuration or
clock setup fails during DAPM events, the error is silently ignored.

Fix this by checking and propagating error codes properly in all I2S DAI
DAPM event handlers.

Fixes: 2c37b4ed730b ("ASoC: mediatek: mt8192: support i2s in platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8192/mt8192-dai-i2s.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/sound/soc/mediatek/mt8192/mt8192-dai-i2s.c b/sound/soc/mediatek/mt8192/mt8192-dai-i2s.c
index 1632fc94776d..5608b534af0d 100644
--- a/sound/soc/mediatek/mt8192/mt8192-dai-i2s.c
+++ b/sound/soc/mediatek/mt8192/mt8192-dai-i2s.c
@@ -586,6 +586,7 @@ static int mtk_i2s_en_event(struct snd_soc_dapm_widget *w,
 	struct snd_soc_component *cmpnt = snd_soc_dapm_to_component(w->dapm);
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
 	struct mtk_afe_i2s_priv *i2s_priv;
+	int ret;
 
 	i2s_priv = get_i2s_priv_by_name(afe, w->name);
 
@@ -599,16 +600,17 @@ static int mtk_i2s_en_event(struct snd_soc_dapm_widget *w,
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
-		mt8192_afe_gpio_request(afe->dev, true, i2s_priv->id, 0);
+		ret = mt8192_afe_gpio_request(afe->dev, true, i2s_priv->id, 0);
 		break;
 	case SND_SOC_DAPM_POST_PMD:
-		mt8192_afe_gpio_request(afe->dev, false, i2s_priv->id, 0);
+		ret = mt8192_afe_gpio_request(afe->dev, false, i2s_priv->id, 0);
 		break;
 	default:
+		ret = 0;
 		break;
 	}
 
-	return 0;
+	return ret;
 }
 
 static int mtk_apll_event(struct snd_soc_dapm_widget *w,
@@ -617,6 +619,7 @@ static int mtk_apll_event(struct snd_soc_dapm_widget *w,
 {
 	struct snd_soc_component *cmpnt = snd_soc_dapm_to_component(w->dapm);
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
+	int ret;
 
 	dev_dbg(cmpnt->dev, "%s(), name %s, event 0x%x\n",
 		__func__, w->name, event);
@@ -624,9 +627,11 @@ static int mtk_apll_event(struct snd_soc_dapm_widget *w,
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
 		if (snd_soc_dapm_widget_name_cmp(w, APLL1_W_NAME) == 0)
-			mt8192_apll1_enable(afe);
+			ret = mt8192_apll1_enable(afe);
 		else
-			mt8192_apll2_enable(afe);
+			ret = mt8192_apll2_enable(afe);
+		if (ret)
+			return ret;
 		break;
 	case SND_SOC_DAPM_POST_PMD:
 		if (snd_soc_dapm_widget_name_cmp(w, APLL1_W_NAME) == 0)
@@ -704,6 +709,7 @@ static int mtk_mclk_en_event(struct snd_soc_dapm_widget *w,
 	struct snd_soc_component *cmpnt = snd_soc_dapm_to_component(w->dapm);
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
 	struct mtk_afe_i2s_priv *i2s_priv;
+	int ret;
 
 	dev_dbg(cmpnt->dev, "%s(), name %s, event 0x%x\n",
 		__func__, w->name, event);
@@ -716,7 +722,9 @@ static int mtk_mclk_en_event(struct snd_soc_dapm_widget *w,
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
-		mt8192_mck_enable(afe, i2s_priv->mclk_id, i2s_priv->mclk_rate);
+		ret = mt8192_mck_enable(afe, i2s_priv->mclk_id, i2s_priv->mclk_rate);
+		if (ret)
+			return ret;
 		break;
 	case SND_SOC_DAPM_POST_PMD:
 		i2s_priv->mclk_rate = 0;
-- 
2.43.0

