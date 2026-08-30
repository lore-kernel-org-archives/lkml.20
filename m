Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9571F3A48E4;
	Sun, 30 Aug 2026 14:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788099175; cv=none; b=cMl/kGL+Y5BRZN0+NRM1UHusL72lXEn5sfSxa6werDkebxraaOT0Y/1r0JUDi9MRBjhfAocbrELZqvug3nFFTjxEV4jrcVhfmSxU3Vut4kcXDeIWYuYL0X4a1RMiooMyO1sdvGEdMK5eFpsFNKmfaWEMX97hJLffwftUJTtCX3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788099175; c=relaxed/simple;
	bh=m1owQV5nsD5mBsPs31Tw04uXfiqrnjto2hDfNOynI4E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lOUTGeq8WmCAYjk7XhPo98uC9KJDO8isiipL4KzgpOvwVKTwJVYOQNDVkgys51uY1JrxgDf3dETRqJbxmJo0U35+BPQOyx0TmfrFiEhKfKGXkFu6cUkJ1Upe1WU4Ml7mnJKyLhTideydRMrAYAvYBrTD/yXsBAQGXSjHHgxicZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [111.196.241.250])
	by APP-03 (Coremail) with SMTP id rQCowAAXGzldOpRq8ZabBg--.27486S2;
	Sun, 30 Aug 2026 22:12:46 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Michael Zhang <zhangyi@everest-semi.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH] ASoC: es8375: make register initialization fallible
Date: Sun, 30 Aug 2026 22:12:43 +0800
Message-ID: <20260830141243.31984-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowAAXGzldOpRq8ZabBg--.27486S2
X-Coremail-Antispam: 1UD129KBjvJXoWxKF48Xw45Wr4fuFWfuw17Wrg_yoW3XF45pF
	9IvFn09r4Fqr4fXFn8tr4UWFy5KrySqF1ay347Kw12vrWqyr1xKF1YyayxZF9IyrZrXF4U
	JayUAayUWr48ZF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkK14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVWxJr
	0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7CjxVAaw2AFwI0_
	JF0_Jw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67
	AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIY
	rxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14
	v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWx
	JwCI42IY6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcSsGvfC2KfnxnUUI43ZEXa7VUjZNVP
	UUUUU==
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/

ES8375 initialization and bias transitions discard register access
errors. Component probe can therefore succeed after partial
initialization, and resume cannot distinguish an invalid reset-state
read from a valid state.

Express the initialization writes as one ordered regmap sequence while
preserving the reset delay, propagate the probe and bias errors, and
return the complete initialization or replay result from resume. Resume
retains the ASoC best-effort state and does not power the codec back
down on failure.

This RFC asks how a hardware-specific initialization helper shared by
probe and deferred resume should handle transport errors.

The regmap configuration keeps these as individual writes. Probe has an
effective error consumer and can fail fast, while deferred resume
continues after the callback. Should resume instead attempt the
remaining writes and report the first error?

The shared component resume reporting contract is discussed at:

https://lore.kernel.org/all/20260825085239.82282-1-pengpeng@iscas.ac.cn/

Fixes: de2b3119f9f7 ("ASoC: codecs: add support for ES8375")
Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 sound/soc/codecs/es8375.c | 115 +++++++++++++++++++++++++++-------------------
 1 file changed, 67 insertions(+), 48 deletions(-)

diff --git a/sound/soc/codecs/es8375.c b/sound/soc/codecs/es8375.c
index e8747bc24433f..5bdc83f8a939c 100644
--- a/sound/soc/codecs/es8375.c
+++ b/sound/soc/codecs/es8375.c
@@ -455,12 +455,19 @@ static int es8375_set_bias_level(struct snd_soc_component *component,
 			dev_err(component->dev, "unable to prepare mclk\n");
 			return  ret;
 		}
-		regmap_write(es8375->regmap, ES8375_CSM1, 0xA6);
+		ret = regmap_write(es8375->regmap, ES8375_CSM1, 0xA6);
+		if (ret) {
+			clk_disable_unprepare(es8375->mclk);
+			return ret;
+		}
 		break;
 	case SND_SOC_BIAS_PREPARE:
 		break;
 	case SND_SOC_BIAS_STANDBY:
-		regmap_write(es8375->regmap, ES8375_CSM1, 0x96);
+		ret = regmap_write(es8375->regmap, ES8375_CSM1, 0x96);
+		if (ret)
+			return ret;
+
 		clk_disable_unprepare(es8375->mclk);
 		break;
 	case SND_SOC_BIAS_OFF:
@@ -521,46 +528,56 @@ static struct snd_soc_dai_driver es8375_dai = {
 	.symmetric_rate = 1,
 };
 
-static void es8375_init(struct snd_soc_component *component)
+static const struct reg_sequence es8375_init_sequence[] = {
+	{ ES8375_CLK_MGR10, 0x95 },
+	{ ES8375_CLK_MGR3, 0x48 },
+	{ ES8375_DIV_SPKCLK, 0x18 },
+	{ ES8375_CLK_MGR4, 0x02 },
+	{ ES8375_CLK_MGR5, 0x05 },
+	{ ES8375_CSM1, 0x82 },
+	{ ES8375_VMID_CHARGE2, 0x20 },
+	{ ES8375_VMID_CHARGE3, 0x20 },
+	{ ES8375_DAC_CAL, 0x28 },
+	{ ES8375_ANALOG_SPK1, 0xFC },
+	{ ES8375_ANALOG_SPK2, 0xE0 },
+	{ ES8375_VMID_SEL, 0xFE },
+	{ ES8375_ANALOG1, 0xB8 },
+	{ ES8375_SYS_CTRL2, 0x03 },
+	{ ES8375_CLK_MGR2, 0x16 },
+	{ ES8375_RESET1, 0x00, 80000 },
+	{ ES8375_CLK_MGR3, 0x00 },
+	{ ES8375_CSM1, 0x86 },
+	{ ES8375_CLK_MGR4, 0x0B },
+	{ ES8375_CLK_MGR5, 0x00 },
+	{ ES8375_CLK_MGR6, 0x31 },
+	{ ES8375_CLK_MGR7, 0x11 },
+	{ ES8375_CLK_MGR8, 0x1F },
+	{ ES8375_CLK_MGR9, 0x00 },
+	{ ES8375_ADC_OSR_GAIN, 0x1F },
+	{ ES8375_ADC2, 0x00 },
+	{ ES8375_DAC2, 0x00 },
+	{ ES8375_DAC_OTP, 0x88 },
+	{ ES8375_ANALOG_SPK2, 0xE7 },
+	{ ES8375_ANALOG2, 0xF0 },
+	{ ES8375_ANALOG3, 0x40 },
+	{ ES8375_CLK_MGR2, 0xFE },
+};
+
+static int es8375_init(struct snd_soc_component *component)
 {
 	struct es8375_priv *es8375 = snd_soc_component_get_drvdata(component);
+	int ret;
 
-	regmap_write(es8375->regmap, ES8375_CLK_MGR10, 0x95);
-	regmap_write(es8375->regmap, ES8375_CLK_MGR3, 0x48);
-	regmap_write(es8375->regmap, ES8375_DIV_SPKCLK, 0x18);
-	regmap_write(es8375->regmap, ES8375_CLK_MGR4, 0x02);
-	regmap_write(es8375->regmap, ES8375_CLK_MGR5, 0x05);
-	regmap_write(es8375->regmap, ES8375_CSM1, 0x82);
-	regmap_write(es8375->regmap, ES8375_VMID_CHARGE2, 0x20);
-	regmap_write(es8375->regmap, ES8375_VMID_CHARGE3, 0x20);
-	regmap_write(es8375->regmap, ES8375_DAC_CAL, 0x28);
-	regmap_write(es8375->regmap, ES8375_ANALOG_SPK1, 0xFC);
-	regmap_write(es8375->regmap, ES8375_ANALOG_SPK2, 0xE0);
-	regmap_write(es8375->regmap, ES8375_VMID_SEL, 0xFE);
-	regmap_write(es8375->regmap, ES8375_ANALOG1, 0xB8);
-	regmap_write(es8375->regmap, ES8375_SYS_CTRL2, 0x03);
-	regmap_write(es8375->regmap, ES8375_CLK_MGR2, 0x16);
-	regmap_write(es8375->regmap, ES8375_RESET1, 0x00);
-	msleep(80);
-	regmap_write(es8375->regmap, ES8375_CLK_MGR3, 0x00);
-	regmap_write(es8375->regmap, ES8375_CSM1, 0x86);
-	regmap_write(es8375->regmap, ES8375_CLK_MGR4, 0x0B);
-	regmap_write(es8375->regmap, ES8375_CLK_MGR5, 0x00);
-	regmap_write(es8375->regmap, ES8375_CLK_MGR6, 0x31);
-	regmap_write(es8375->regmap, ES8375_CLK_MGR7, 0x11);
-	regmap_write(es8375->regmap, ES8375_CLK_MGR8, 0x1F);
-	regmap_write(es8375->regmap, ES8375_CLK_MGR9, 0x00);
-	regmap_write(es8375->regmap, ES8375_ADC_OSR_GAIN, 0x1F);
-	regmap_write(es8375->regmap, ES8375_ADC2, 0x00);
-	regmap_write(es8375->regmap, ES8375_DAC2, 0x00);
-	regmap_write(es8375->regmap, ES8375_DAC_OTP, 0x88);
-	regmap_write(es8375->regmap, ES8375_ANALOG_SPK2, 0xE7);
-	regmap_write(es8375->regmap, ES8375_ANALOG2, 0xF0);
-	regmap_write(es8375->regmap, ES8375_ANALOG3, 0x40);
-	regmap_write(es8375->regmap, ES8375_CLK_MGR2, 0xFE);
-
-	regmap_update_bits(es8375->regmap, ES8375_SDP, 0x40, 0x40);
-	regmap_update_bits(es8375->regmap, ES8375_SDP2, 0x20, 0x20);
+	ret = regmap_multi_reg_write(es8375->regmap, es8375_init_sequence,
+				     ARRAY_SIZE(es8375_init_sequence));
+	if (ret)
+		return ret;
+
+	ret = regmap_update_bits(es8375->regmap, ES8375_SDP, 0x40, 0x40);
+	if (ret)
+		return ret;
+
+	return regmap_update_bits(es8375->regmap, ES8375_SDP2, 0x20, 0x20);
 }
 
 static int es8375_suspend(struct snd_soc_component *component)
@@ -570,6 +587,7 @@ static int es8375_suspend(struct snd_soc_component *component)
 	regmap_write(es8375->regmap, ES8375_CSM1, 0x96);
 	regcache_cache_only(es8375->regmap, true);
 	regcache_mark_dirty(es8375->regmap);
+
 	return 0;
 }
 
@@ -577,20 +595,23 @@ static int es8375_resume(struct snd_soc_component *component)
 {
 	struct es8375_priv *es8375 = snd_soc_component_get_drvdata(component);
 	unsigned int reg;
+	int ret;
 
 	regcache_cache_only(es8375->regmap, false);
 	regcache_cache_bypass(es8375->regmap, true);
-	regmap_read(es8375->regmap, ES8375_CLK_MGR2, &reg);
+	ret = regmap_read(es8375->regmap, ES8375_CLK_MGR2, &reg);
 	regcache_cache_bypass(es8375->regmap, false);
+	if (ret)
+		return ret;
 
 	if (reg == 0x00)
-		es8375_init(component);
+		ret = es8375_init(component);
 	else
-		es8375_set_bias_level(component, SND_SOC_BIAS_ON);
-
-	regcache_sync(es8375->regmap);
+		ret = es8375_set_bias_level(component, SND_SOC_BIAS_ON);
+	if (ret)
+		return ret;
 
-	return 0;
+	return regcache_sync(es8375->regmap);
 }
 
 static int es8375_codec_probe(struct snd_soc_component *component)
@@ -599,9 +620,7 @@ static int es8375_codec_probe(struct snd_soc_component *component)
 
 	es8375->mastermode = 0;
 
-	es8375_init(component);
-
-	return 0;
+	return es8375_init(component);
 }
 
 static bool es8375_writeable_register(struct device *dev, unsigned int reg)

base-commit: 32b4e6b134c62e14291206da331891e99e2fb63d
-- 
2.50.1

