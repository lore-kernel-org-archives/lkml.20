Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73EA843C7DF;
	Fri, 28 Aug 2026 11:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787916871; cv=none; b=VJTw2XHXidKRsnFhy1vccfw9DbxGZzR6B/mRUTdKs//eD4SypqaCOlLtVs4QmIC+DAFzl95LvbaVvP49YRDyYxwrlPDFjIDizY4yt/5u5Q/rEWCKRMj8ncrBn5ZXaU8ulN2wXpzmoVQ7l2ty4cVXq+AWQZMpHk+Wm/qlUlEttfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787916871; c=relaxed/simple;
	bh=+AFHfwdAE3DWpDrb/6rhDH7zpQe21zQknzY8C9EzhW0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OEefLDyyVmb52DKj2kqGEt1WIJpZyFdtUJVCditwAO65jTWdg/jDdzTPwlEpi9jQIEHSl9vCtw6f6tFikdNHQKr2v5qYouMm+vy3/kRU/Kjwn2iH9ePXUffT2GcHcH17XOXadrPg540Ugcd7xcCtt32rBGlnKuKWasOV6R3FU94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [111.196.241.250])
	by APP-01 (Coremail) with SMTP id qwCowACnfPA6cpFqpPm9Bg--.43118S12;
	Fri, 28 Aug 2026 19:34:20 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>
Cc: Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Baojun Xu <baojun.xu@ti.com>,
	Sen Wang <sen@ti.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 10/20] ASoC: tlv320aic3x: Propagate power restoration errors
Date: Fri, 28 Aug 2026 19:34:05 +0800
Message-ID: <20260828113416.47061-11-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260828113416.47061-1-pengpeng@iscas.ac.cn>
References: <20260828113416.47061-1-pengpeng@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qwCowACnfPA6cpFqpPm9Bg--.43118S12
X-Coremail-Antispam: 1UD129KBjvJXoWxZFW3WFyxJr1xAF17trWUurg_yoW5tr47pF
	ZaqrZ8tw1vvF4SgF45t3WrZ3WfXr9ayF1rA347Kw18Zrn8Ar9Ygr18tr1avFyDJry8GrZx
	uw1jqw1UCF13KaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUmS14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
	kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
	z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F
	4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq
	3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7
	IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4U
	M4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2
	kIc2xKxwCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkE
	bVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67
	AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVW8JVW5JwCI
	42IY6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF
	4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBI
	daVFxhVjvjDU0xZFpf9x0JUhNVPUUUUU=
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/

aic3x_set_power() ignores the model-specific bypassed register sequence
and cache replay, while aic3x_set_bias_level() ignores the helper
result.  A failed OFF-to-STANDBY transition can therefore be reported as
successful with power set.

Check both register restore operations, return the device to reset,
cache-only and supplies-off state on failure, and propagate power-on and
power-off results from the DAPM bias callback.

The issue was identified via static analysis and manually reviewed.

Fixes: 2a6fedec195b ("ASoC: tlv320aic3x: Convert to direct regmap API usage")
Fixes: 733a763dd8b3 ("ASoC: tlv320aic3x: Fix class-D initialization for tlv320aic3007")

Assisted-by: LLM
Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 sound/soc/codecs/tlv320aic3x.c | 36 +++++++++++++++++++++++++++-------
 1 file changed, 29 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/tlv320aic3x.c b/sound/soc/codecs/tlv320aic3x.c
index b38393a8130f..b5ef59169dbe 100644
--- a/sound/soc/codecs/tlv320aic3x.c
+++ b/sound/soc/codecs/tlv320aic3x.c
@@ -1416,13 +1416,19 @@ static int aic3x_set_power(struct snd_soc_component *component, int power)
 			gpiod_set_value(aic3x->gpio_reset, 0);
 		}
 
-		if (aic3x->model == AIC3X_MODEL_3007)
-			regmap_multi_reg_write_bypassed(aic3x->regmap, aic3007_class_d,
-							ARRAY_SIZE(aic3007_class_d));
+		if (aic3x->model == AIC3X_MODEL_3007) {
+			ret = regmap_multi_reg_write_bypassed(aic3x->regmap,
+							      aic3007_class_d,
+							      ARRAY_SIZE(aic3007_class_d));
+			if (ret)
+				goto err_power_off;
+		}
 
 		/* Sync reg_cache with the hardware */
 		regcache_cache_only(aic3x->regmap, false);
-		regcache_sync(aic3x->regmap);
+		ret = regcache_sync(aic3x->regmap);
+		if (ret)
+			goto err_power_off;
 
 		/* Rewrite paired PLL D registers in case cached sync skipped
 		 * writing one of them and thus caused other one also not
@@ -1457,6 +1463,17 @@ static int aic3x_set_power(struct snd_soc_component *component, int power)
 	}
 out:
 	return ret;
+
+err_power_off:
+	if (aic3x->gpio_reset)
+		gpiod_set_value(aic3x->gpio_reset, 1);
+	regcache_cache_only(aic3x->regmap, true);
+	regcache_mark_dirty(aic3x->regmap);
+	aic3x->power = 0;
+	regulator_bulk_disable(ARRAY_SIZE(aic3x->supplies),
+			       aic3x->supplies);
+
+	return ret;
 }
 
 static int aic3x_set_bias_level(struct snd_soc_component *component,
@@ -1464,6 +1481,7 @@ static int aic3x_set_bias_level(struct snd_soc_component *component,
 {
 	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	struct aic3x_priv *aic3x = snd_soc_component_get_drvdata(component);
+	int ret;
 
 	switch (level) {
 	case SND_SOC_BIAS_ON:
@@ -1477,8 +1495,12 @@ static int aic3x_set_bias_level(struct snd_soc_component *component,
 		}
 		break;
 	case SND_SOC_BIAS_STANDBY:
-		if (!aic3x->power)
-			aic3x_set_power(component, 1);
+		if (!aic3x->power) {
+			ret = aic3x_set_power(component, 1);
+			if (ret)
+				return ret;
+		}
+
 		if (snd_soc_dapm_get_bias_level(dapm) == SND_SOC_BIAS_PREPARE &&
 		    aic3x->master) {
 			/* disable pll */
@@ -1488,7 +1510,7 @@ static int aic3x_set_bias_level(struct snd_soc_component *component,
 		break;
 	case SND_SOC_BIAS_OFF:
 		if (aic3x->power)
-			aic3x_set_power(component, 0);
+			return aic3x_set_power(component, 0);
 		break;
 	}
 
-- 
2.43.0

