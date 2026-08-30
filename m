Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71672175A74;
	Sun, 30 Aug 2026 14:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788099690; cv=none; b=jmMD1C4e7qOgiVkvjqCLRJilG2oabBXh1z1qUvT36miFpLcjPFsgvQW9T1PRZWnein6KlMN1K4ZxFYtOkOMdnyCBEdHJ1IlCGzxsmM34oQFL2kFnGxfc6Ud3oNsa7mcJKWULwKBX0q88nxgcISy5ItqUVde2Ve1C55YIwV2T8sA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788099690; c=relaxed/simple;
	bh=vDFygmzbUsa8gIhSRGDtcp+XSKMfMhxMXjWZPmQFcVA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kTqT05p/pDJ0RdWkrQrtQygrdgYxZ0ozwYFmvgtpjofTSLc/593M8wx2pyvtdVaZWBFxExoMcpqzLn0/SNV8mg9nbi5m3PEe8hFvxkXb2YaqPWBnu1LqhvGYkEZsSfDLeEqltDlcEEWiIFRPjmuA1ciS2T+hCMyXX6v5u/XtZn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [111.196.241.250])
	by APP-03 (Coremail) with SMTP id rQCowABncD5gPJRqAbCbBg--.48832S2;
	Sun, 30 Aug 2026 22:21:20 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Oder Chiou <oder_chiou@realtek.com>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Mark Brown <broonie@kernel.org>,
	Jack Yu <jack.yu@realtek.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: rt1015: make control calibration failures observable
Date: Sun, 30 Aug 2026 22:21:18 +0800
Message-ID: <20260830142118.36668-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowABncD5gPJRqAbCbBg--.48832S2
X-Coremail-Antispam: 1UD129KBjvJXoWxAr1rGr4ftF13ArWrtF4rAFb_yoWrKF45pF
	y5Ar1YvFWxXFs5XFs5tw1rZF1S9ryfK34ayw17Gw1IvrnxKw12gF1FgFyFvFWDWFZ8XF47
	uFW8Aa4fGr1qqaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkE14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr
	1j6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
	6xIIjxv20xvE14v26r126r1DMcIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr
	0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkF7I0En4kS14v2
	6r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrV
	AFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCI
	c40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1I6r4UMIIF0xvE2Ix0cI8IcVCY1x0267
	AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_
	Cr1lIxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUgXo
	cUUUUU=
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/

The bypass-boost control runs a hardware calibration while bypassing the
register cache. It ignores every register access and cache restore
failure, then publishes both the requested mode and calibration
completion.

Return failures from the complete calibration sequence, always restore
normal cache operation and unlock DAPM, and only publish the control
state after the calibration and final mode write both succeed. The mixer
control callback is an effective error consumer, independent of deferred
component resume.

Fixes: da145172b236 ("ASoC: rt1015: Fix DC calibration on bypass boost mode")
Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 sound/soc/codecs/rt1015.c | 81 +++++++++++++++++++++++++++++++++++++----------
 1 file changed, 65 insertions(+), 16 deletions(-)

diff --git a/sound/soc/codecs/rt1015.c b/sound/soc/codecs/rt1015.c
index ff0c08ff610e1..c6cb8d3ec0454 100644
--- a/sound/soc/codecs/rt1015.c
+++ b/sound/soc/codecs/rt1015.c
@@ -488,35 +488,72 @@ static int rt1015_bypass_boost_get(struct snd_kcontrol *kcontrol,
 	return 0;
 }
 
-static void rt1015_calibrate(struct rt1015_priv *rt1015)
+static int rt1015_calibrate(struct rt1015_priv *rt1015)
 {
 	struct snd_soc_component *component = rt1015->component;
 	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	struct regmap *regmap = rt1015->regmap;
+	int ret, sync_ret;
 
 	snd_soc_dapm_mutex_lock(dapm);
 	regcache_cache_bypass(regmap, true);
 
-	regmap_write(regmap, RT1015_CLK_DET, 0x0000);
-	regmap_write(regmap, RT1015_PWR4, 0x00B2);
-	regmap_write(regmap, RT1015_PWR_STATE_CTRL, 0x0009);
+	ret = regmap_write(regmap, RT1015_CLK_DET, 0x0000);
+	if (ret)
+		goto restore_cache;
+
+	ret = regmap_write(regmap, RT1015_PWR4, 0x00B2);
+	if (ret)
+		goto restore_cache;
+
+	ret = regmap_write(regmap, RT1015_PWR_STATE_CTRL, 0x0009);
+	if (ret)
+		goto restore_cache;
+
 	msleep(100);
-	regmap_write(regmap, RT1015_PWR_STATE_CTRL, 0x000A);
+	ret = regmap_write(regmap, RT1015_PWR_STATE_CTRL, 0x000A);
+	if (ret)
+		goto restore_cache;
+
 	msleep(100);
-	regmap_write(regmap, RT1015_PWR_STATE_CTRL, 0x000C);
+	ret = regmap_write(regmap, RT1015_PWR_STATE_CTRL, 0x000C);
+	if (ret)
+		goto restore_cache;
+
 	msleep(100);
-	regmap_write(regmap, RT1015_CLSD_INTERNAL8, 0x2028);
-	regmap_write(regmap, RT1015_CLSD_INTERNAL9, 0x0140);
-	regmap_write(regmap, RT1015_PWR_STATE_CTRL, 0x000D);
+	ret = regmap_write(regmap, RT1015_CLSD_INTERNAL8, 0x2028);
+	if (ret)
+		goto restore_cache;
+
+	ret = regmap_write(regmap, RT1015_CLSD_INTERNAL9, 0x0140);
+	if (ret)
+		goto restore_cache;
+
+	ret = regmap_write(regmap, RT1015_PWR_STATE_CTRL, 0x000D);
+	if (ret)
+		goto restore_cache;
+
 	msleep(300);
-	regmap_write(regmap, RT1015_PWR_STATE_CTRL, 0x0008);
-	regmap_write(regmap, RT1015_SYS_RST1, 0x05F5);
-	regmap_write(regmap, RT1015_CLK_DET, 0x8000);
+	ret = regmap_write(regmap, RT1015_PWR_STATE_CTRL, 0x0008);
+	if (ret)
+		goto restore_cache;
+
+	ret = regmap_write(regmap, RT1015_SYS_RST1, 0x05F5);
+	if (ret)
+		goto restore_cache;
+
+	ret = regmap_write(regmap, RT1015_CLK_DET, 0x8000);
+
+restore_cache:
 
 	regcache_cache_bypass(regmap, false);
 	regcache_mark_dirty(regmap);
-	regcache_sync(regmap);
+	sync_ret = regcache_sync(regmap);
+	if (!ret)
+		ret = sync_ret;
 	snd_soc_dapm_mutex_unlock(dapm);
+
+	return ret;
 }
 
 static int rt1015_bypass_boost_put(struct snd_kcontrol *kcontrol,
@@ -525,6 +562,8 @@ static int rt1015_bypass_boost_put(struct snd_kcontrol *kcontrol,
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct rt1015_priv *rt1015 =
 		snd_soc_component_get_drvdata(component);
+	int bypass_boost = rt1015->bypass_boost;
+	int ret;
 
 	if (rt1015->dac_is_used) {
 		dev_err(component->dev, "DAC is being used!\n");
@@ -534,13 +573,23 @@ static int rt1015_bypass_boost_put(struct snd_kcontrol *kcontrol,
 	rt1015->bypass_boost = ucontrol->value.integer.value[0];
 	if (rt1015->bypass_boost == RT1015_Bypass_Boost &&
 			!rt1015->cali_done) {
-		rt1015_calibrate(rt1015);
-		rt1015->cali_done = 1;
+		ret = rt1015_calibrate(rt1015);
+		if (ret)
+			goto restore_boost;
+
+		ret = regmap_write(rt1015->regmap, RT1015_MONO_DYNA_CTRL,
+				   0x0010);
+		if (ret)
+			goto restore_boost;
 
-		regmap_write(rt1015->regmap, RT1015_MONO_DYNA_CTRL, 0x0010);
+		rt1015->cali_done = 1;
 	}
 
 	return 0;
+
+restore_boost:
+	rt1015->bypass_boost = bypass_boost;
+	return ret;
 }
 
 static const char * const rt1015_dac_output_vol_select[] = {

base-commit: 32b4e6b134c62e14291206da331891e99e2fb63d
-- 
2.50.1

