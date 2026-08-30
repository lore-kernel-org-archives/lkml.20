Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61E4A3B6C01;
	Sun, 30 Aug 2026 14:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788099333; cv=none; b=QPcmkwm7mYv83Pr+fqr/UCaiYtiajcJqK1SL6Ef0keoAxd/z7+o3dGCxLTg4DJXhOYYVyOeU0IEuCsXrQrjp5R0HzessvSmBiMGfeApMU5sHZ99wP2b9T+Kp/DwZKBQKJ8E45NsID6ltmu5C9MDTp2WxmkNf2E/L6dIz4CtoSjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788099333; c=relaxed/simple;
	bh=BjLaTTRa82IB/v8JATjULW2oZ05oK0WzmAPwsJrAvrY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nyRdxFZiKSk/YBuUfRJSAZzFGthS9G/dasLSopXXNNMEETPAgeqGlnliDVGmlkdZRiVYuCDSdrHUaYWoHarFjTZwe1GgG5r21k9X/jvXI7DjsCcXNfSn1UjPf8pNsKaBfYtZJIqbweB7rs2yT0HZnF9m5hCEGUKBOrGAMa7MZDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [111.196.241.250])
	by APP-03 (Coremail) with SMTP id rQCowACXnTv7OpRqPZ6bBg--.46271S2;
	Sun, 30 Aug 2026 22:15:23 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: sta32x: make power restoration transactional
Date: Sun, 30 Aug 2026 22:15:21 +0800
Message-ID: <20260830141521.33246-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowACXnTv7OpRqPZ6bBg--.46271S2
X-Coremail-Antispam: 1UD129KBjvJXoW3Xry7Xr4DXw18AFW8AFy5Arb_yoW7Zw1fpr
	WayFZ5trs2vF4fZF17tr4qqF15KrWxtr45Za42gw47ZF1DCF929r1akF42vF98GrZ0gF4U
	Xw42y3yrCa1jgaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkK14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVWxJr
	0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7CjxVAaw2AFwI0_
	JF0_Jw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67
	AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIY
	rxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14
	v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWx
	JwCI42IY6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcSsGvfC2KfnxnUUI43ZEXa7VUjZNVP
	UUUUU==
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/

sta32x_set_bias_level() enables the codec supplies, restores the
coefficient and register state, and then starts the watchdog. Register
access errors in the mute and coefficient helpers and the cache replay
are discarded, allowing DAPM to publish STANDBY for a partially restored
codec.

Propagate every operation in the local restore transaction, including
the final standby-state write. Start the watchdog only after that write
succeeds. On failure, hold reset, mark the cache dirty, disable the
supplies and report a cleanup failure while preserving the primary
error. The DAPM bias callback consumes the returned error independently
of component resume handling.

Fixes: 54dc6cabe684 ("ASoC: sta32x: preserve coefficient RAM")
Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 sound/soc/codecs/sta32x.c | 101 +++++++++++++++++++++++++++++++++++-----------
 1 file changed, 77 insertions(+), 24 deletions(-)

diff --git a/sound/soc/codecs/sta32x.c b/sound/soc/codecs/sta32x.c
index d6de739212f92..3766db457b673 100644
--- a/sound/soc/codecs/sta32x.c
+++ b/sound/soc/codecs/sta32x.c
@@ -342,27 +342,48 @@ static int sta32x_sync_coef_shadow(struct snd_soc_component *component)
 {
 	struct sta32x_priv *sta32x = snd_soc_component_get_drvdata(component);
 	unsigned int cfud;
-	int i;
+	int i, ret;
 
 	/* preserve reserved bits in STA32X_CFUD */
-	regmap_read(sta32x->regmap, STA32X_CFUD, &cfud);
+	ret = regmap_read(sta32x->regmap, STA32X_CFUD, &cfud);
+	if (ret)
+		return ret;
+
 	cfud &= 0xf0;
 
 	for (i = 0; i < STA32X_COEF_COUNT; i++) {
-		regmap_write(sta32x->regmap, STA32X_CFADDR2, i);
-		regmap_write(sta32x->regmap, STA32X_B1CF1,
-			     (sta32x->coef_shadow[i] >> 16) & 0xff);
-		regmap_write(sta32x->regmap, STA32X_B1CF2,
-			     (sta32x->coef_shadow[i] >> 8) & 0xff);
-		regmap_write(sta32x->regmap, STA32X_B1CF3,
-			     (sta32x->coef_shadow[i]) & 0xff);
+		ret = regmap_write(sta32x->regmap, STA32X_CFADDR2, i);
+		if (ret)
+			return ret;
+
+		ret = regmap_write(sta32x->regmap, STA32X_B1CF1,
+				   (sta32x->coef_shadow[i] >> 16) & 0xff);
+		if (ret)
+			return ret;
+
+		ret = regmap_write(sta32x->regmap, STA32X_B1CF2,
+				   (sta32x->coef_shadow[i] >> 8) & 0xff);
+		if (ret)
+			return ret;
+
+		ret = regmap_write(sta32x->regmap, STA32X_B1CF3,
+				   sta32x->coef_shadow[i] & 0xff);
+		if (ret)
+			return ret;
+
 		/*
 		 * chip documentation does not say if the bits are
 		 * self-clearing, so do it explicitly
 		 */
-		regmap_write(sta32x->regmap, STA32X_CFUD, cfud);
-		regmap_write(sta32x->regmap, STA32X_CFUD, cfud | 0x01);
+		ret = regmap_write(sta32x->regmap, STA32X_CFUD, cfud);
+		if (ret)
+			return ret;
+
+		ret = regmap_write(sta32x->regmap, STA32X_CFUD, cfud | 0x01);
+		if (ret)
+			return ret;
 	}
+
 	return 0;
 }
 
@@ -370,15 +391,24 @@ static int sta32x_cache_sync(struct snd_soc_component *component)
 {
 	struct sta32x_priv *sta32x = snd_soc_component_get_drvdata(component);
 	unsigned int mute;
-	int rc;
+	int restore_ret, ret;
 
 	/* mute during register sync */
-	regmap_read(sta32x->regmap, STA32X_MMUTE, &mute);
-	regmap_write(sta32x->regmap, STA32X_MMUTE, mute | STA32X_MMUTE_MMUTE);
-	sta32x_sync_coef_shadow(component);
-	rc = regcache_sync(sta32x->regmap);
-	regmap_write(sta32x->regmap, STA32X_MMUTE, mute);
-	return rc;
+	ret = regmap_read(sta32x->regmap, STA32X_MMUTE, &mute);
+	if (ret)
+		return ret;
+
+	ret = regmap_write(sta32x->regmap, STA32X_MMUTE,
+			   mute | STA32X_MMUTE_MMUTE);
+	if (ret)
+		return ret;
+
+	ret = sta32x_sync_coef_shadow(component);
+	if (!ret)
+		ret = regcache_sync(sta32x->regmap);
+
+	restore_ret = regmap_write(sta32x->regmap, STA32X_MMUTE, mute);
+	return ret ?: restore_ret;
 }
 
 /* work around ESD issue where sta32x resets and loses all configuration */
@@ -794,9 +824,9 @@ static int sta32x_startup_sequence(struct sta32x_priv *sta32x)
 static int sta32x_set_bias_level(struct snd_soc_component *component,
 				 enum snd_soc_bias_level level)
 {
-	int ret;
 	struct sta32x_priv *sta32x = snd_soc_component_get_drvdata(component);
 	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
+	int cleanup_ret, ret;
 
 	dev_dbg(component->dev, "level = %d\n", level);
 	switch (level) {
@@ -820,15 +850,28 @@ static int sta32x_set_bias_level(struct snd_soc_component *component,
 				return ret;
 			}
 
-			sta32x_startup_sequence(sta32x);
-			sta32x_cache_sync(component);
+			ret = sta32x_startup_sequence(sta32x);
+			if (!ret)
+				ret = sta32x_cache_sync(component);
+			if (ret)
+				goto restore_failed;
+
+			ret = regmap_update_bits(sta32x->regmap, STA32X_CONFF,
+						 STA32X_CONFF_PWDN | STA32X_CONFF_EAPD,
+						 0);
+			if (ret)
+				goto restore_failed;
+
 			sta32x_watchdog_start(sta32x);
+			break;
 		}
 
 		/* Power down */
-		regmap_update_bits(sta32x->regmap, STA32X_CONFF,
-				   STA32X_CONFF_PWDN | STA32X_CONFF_EAPD,
-				   0);
+		ret = regmap_update_bits(sta32x->regmap, STA32X_CONFF,
+					 STA32X_CONFF_PWDN | STA32X_CONFF_EAPD,
+					 0);
+		if (ret)
+			return ret;
 
 		break;
 
@@ -846,6 +889,16 @@ static int sta32x_set_bias_level(struct snd_soc_component *component,
 		break;
 	}
 	return 0;
+
+restore_failed:
+	gpiod_set_value(sta32x->gpiod_nreset, 0);
+	regcache_mark_dirty(sta32x->regmap);
+	cleanup_ret = regulator_bulk_disable(ARRAY_SIZE(sta32x->supplies),
+					     sta32x->supplies);
+	if (cleanup_ret)
+		dev_warn(component->dev, "Failed to disable supplies: %d\n",
+			 cleanup_ret);
+	return ret;
 }
 
 static const struct snd_soc_dai_ops sta32x_dai_ops = {

base-commit: 32b4e6b134c62e14291206da331891e99e2fb63d
-- 
2.50.1

