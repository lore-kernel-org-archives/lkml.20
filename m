Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794351975;
	b=3qe7hOiHfvlU0gByabMOwZy7ikuhILKyJSoy9cXGSfjQVTE1eHva49RkhAS3RcUeToMF
	 kBqOefPICXULoGZ+7mRr+LDyRQ46ax6Xxez5XicOz5FRJR3MmneJ5PezGX2+xkyzb+1yJ
	 cD0musEJu/5tE3GxGa0en8e23+jIxsDYQjCbeFokuf4zkR7hG5eAVHEfceItLCueSC2Vv
	 /OHs6toFXiA9tae/SnRhKEZFWMOaQvUeEEX7pzFqMcl9JpKR8IwxCWcZFcdHNwZKAZCna
	 bvHn6LG1xAl8pcSIQbLcv/Ims0g1Cl68l6jLNlpeq+ofbWD5CRGDIyWrHuTBiAxbiSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794351975;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=x/pvyTEDDINaCH2/Plef7rmiayj2JRdx93dQs90JIcQ=;
	b=RMTSs7ghhFwILB/GevZ467EpARZcekhA4ofRPKDZfUyoJndRuCTp5xaKlWpEi1QQd7X4
	 poIBC4IHWZJAUU8+LyrFuG4LQ7kwfr4SkkVgCzxd0t30Bcx74ey2b6aMfHD8h+VLl53nX
	 AkfZHe6Xmi2ctry2q4UIL4idteEZACnYpAh5sK/7lN0wbc8yuhb2yYOGU0s9TMS3aVD9C
	 f7f+Kmai5zqpEfjsoiU5Oab0LD9JuYAm27HGlEM4XpyVaaGiT1gm/vUMkfeoci2m+2UbT
	 BHmuj/laJyHiVXJWpDei5CufSrL8SX2jufp83T+5RvJn+xijtjpFEpppg0rVXUFh35Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JYtpHh50;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 049B0606A321
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 23:06:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 049B0606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JYtpHh50
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-4922dbcee23so1506015f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 15:06:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794351972; x=1794956772; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=x/pvyTEDDINaCH2/Plef7rmiayj2JRdx93dQs90JIcQ=;
        b=JYtpHh50jVlNZ9WITT6KjHyD/eQCT43momtC/hJgRqDwFDaAX+OGK5oMi9xNeIRoC6
         5bjceO/QaqrQLty+BBADLbWKm3Zju53S5bq0HNQAL1EQCud+F3fOlhEe9BfNJxHJoZ4P
         iC0yaQyA1i/ywWyryYlECV3EgXIsyvFxwr/FXMmxEocDRhQngdViK/wMkVXIFm0QWtBu
         cslXVq/IbzZL3cKVNfne+CO4KxKWzQAxgiF89wFxR5g1ApSka0Wj4HQxHwCeH1Caul9o
         P6LR8hIZV2Ov4sqhTRjGGmPp6qK3IX3pe0SJ/6z1LAbNl4z2QNfXTnojhxbtpA97ZOqZ
         7HYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794351972; x=1794956772;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x/pvyTEDDINaCH2/Plef7rmiayj2JRdx93dQs90JIcQ=;
        b=ysShwR8eeqMLHCKTI/aCxxiEpb/B5kkHLFsykUmgH0CgNAXQUlRoS2Ros5XTSHGv/s
         8VaCR0azY1PR+LLfKBl6oWnsCYGcJUeevn4hKiq0P6WsZlNDEvo43+1SjxGKve7U9mWZ
         Uq/09JZTJKESaDSrk+eFiLr56mA0grfp8ju5ZLc6RnZ49xc8LDFMcXfSQ5F8TW6Uvkp4
         8OB/EdMaqT9dvRKUb8DWmFBg4Ofj5a3x2Lc7CuXSIWN+Txulx0Ay8dz1x50g2IaNSKjO
         xUsei7uEOMe5K79G1KBhIm2PQW43E+hcFQQoOQq9AzR1wNdMOpqA6FxBpYI+dJoFyNSN
         Fg7A==
X-Forwarded-Encrypted: i=1; AL+hErHcjJee7MVCr+JluPwvQpcwogyZruaAdW3tyEid2xeR8BM2kzgXOVyGXxGyOGMBpW3aAlw00kje971I+Ds=@vger.kernel.org
X-Gm-Message-State: APuU4Z8vFXkeHwG6RqrcGTD8JSMD1nqUMUNG/+0vZWWb8gC3G2fUy8Si
	RPIJaYhUNTnabQLBFzUGaJnI8gYFbFn13enhSR5/CIbQ2NvI1RHk5iM=
X-Gm-Gg: AYBFou2fMiCRmid1oaZsBbFRx8DYtnX2hmDXJ+2xUKehf2ZmIrQcwJvp1kGqTkExFGE
	NO7BSBKXa9wxValbdtTSIcBfKXAZfnXIwfEC+jSzyAaQT176S4kxZBLgp+CaI8i1zGh7/L3a8xU
	13ZEHwEMBgJnTk4xFYDmwLRdoJv3eRCU+n71wwZCHPhsotkvjbWy1ZA7vl8yHzv4jh+tvWOYPlJ
	rcKS6qWYHcmXUgTN3/FBwNrLdFbaHVx0WvIXEPyAp1E/XqG8DfmSB26uhV36tJCYnJgn4tm8rWW
	T9wiapTVOlqgJtWnVKveYS6ZIdH2dgG9NUGryDF84kaiEPrYA/LUyx/CCeiUmpuAO4LCpyhKFg2
	qXUCSnnBZkYgREUx4rzo2mbrzwiBIrP1PvUomYDhQKJelnUcHcU88o5tJ7aQHQEBKfC+d2D8kKH
	kl6gpIMV3xZr50FLfJ/LTTpDePR357XjyLK0XP+UHA6PQW+G9SJRW/FqPBPgbbgyJLt3n1DgtX5
	vzW2HDn6ZAGcRQ38TDFbiGhM8Nx2Lkb0jGe5jay9ju/XgMgOxxcXvLYxBE564xr+C80GbsXYlSx
	uOvVDITGn4csFpC+w2rtM7aJ36A8
X-Received: by 2002:a05:6000:4013:b0:48e:d27:bef2 with SMTP id ffacd0b85a97d-499c77414eemr523745f8f.21.1794351972234;
        Tue, 10 Nov 2026 15:06:12 -0800 (PST)
Received: from localhost.localdomain ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49842f2a1f9sm7568795f8f.15.2026.11.10.15.06.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 15:06:11 -0800 (PST)
From: Tristan Madani <tristmd@gmail.com>
X-Google-Original-From: Tristan Madani <tristan@talencesecurity.com>
To: Oder Chiou <oder_chiou@realtek.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org,
	stable@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Tristan Madani <tristan@talencesecurity.com>
Subject: [PATCH v3] ASoC: rt5659: fix teardown order and stale state across card rebind
Date: Tue, 10 Nov 2026 23:06:03 +0000
Message-ID: <20261110230603.2110759-1-tristan@talencesecurity.com>
X-Mailer: git-send-email 2.47.3
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

The cleanup in rt5659_remove() does not reset hs_jack, jack_type, or
the component pointer, and does not mark the regmap cache dirty after
the codec reset.  On card rebind this leaves a dangling hs_jack pointer
and causes regmap_update_bits() to skip re-programming jack-detection
registers because the cache still holds the pre-reset values.

Only clear headset detection state via rt5659_headset_detect() for
JD3-mode jacks.  In HDA header mode the SAR, 4BTN_IL, and IL_IRQ
registers are set up once during I2C probe by
rt5659_intel_hd_header_probe_setup() and are not re-enabled on card
rebind, so clearing them in remove would leave mic detection disabled
after the next bind.

Reset the HDA IRQ polarity bits in RT5659_IRQ_CTRL_1 and
RT5659_IRQ_CTRL_2 to their unplugged defaults before marking the
regmap cache dirty.  Without this, regcache_sync() on rebind restores
plugged-in polarity while hda_hp_plugged and hda_mic_plugged are
false, so the polarity-flip logic in
rt5659_jack_detect_intel_hd_header() never fires and subsequent
plug/unplug events do not generate an interrupt.

If the I2C device unbinds without a card bound, rt5659_remove() is
never called and the IRQ keeps queuing jack_detect_work until devres
frees the private data.  Register a devm action to disable the IRQ
and cancel the delayed work on any I2C teardown path.

Consolidate the IRQ disable and work cancellation into a shared helper
that always sets irq_disabled, so that rt5659_remove(),
rt5659_i2c_shutdown(), and the devm action all follow the same path
and cannot double-disable the interrupt line.

Store the I2C client pointer in rt5659_priv so all paths can
reference it directly.

Fixes: d3cb2de2479b ("ASoC: rt5659: add rt5659 codec driver")
Cc: stable@vger.kernel.org
Signed-off-by: Tristan Madani <tristan@talencesecurity.com>
---
v3: Consolidate IRQ disable and work cancellation into a shared helper
    (rt5659_disable_irq_and_cancel_work) called from all three teardown
    paths (remove, shutdown, devm action).  The helper sets irq_disabled
    in every path, preventing a double disable_irq if shutdown fires
    before the devm action.  Add regcache_sync in probe so the cache is
    resynchronised on card rebind.
v2: https://lore.kernel.org/linux-sound/20261107153543.6912-1-tristan@talencesecurity.com/
v1: https://lore.kernel.org/linux-sound/20261105145204.5614-1-tristan@talencesecurity.com/
 sound/soc/codecs/rt5659.c | 50 +++++++++++++++++++++++++++++++++------
 sound/soc/codecs/rt5659.h |  1 +
 2 files changed, 44 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/rt5659.c b/sound/soc/codecs/rt5659.c
index 68f7d5673e190..1b61323fc7ed6 100644
--- a/sound/soc/codecs/rt5659.c
+++ b/sound/soc/codecs/rt5659.c
@@ -3660,6 +3660,21 @@ static int rt5659_set_bias_level(struct snd_soc_component *component,
 	return 0;
 }
 
+static void rt5659_disable_irq_and_cancel_work(struct rt5659_priv *rt5659)
+{
+	if (rt5659->irq_acquired && !rt5659->irq_disabled) {
+		disable_irq(rt5659->i2c->irq);
+		rt5659->irq_disabled = true;
+	}
+	if (rt5659->jack_detect_work_inited)
+		cancel_delayed_work_sync(&rt5659->jack_detect_work);
+}
+
+static void rt5659_i2c_disable_irq_and_cancel_work(void *data)
+{
+	rt5659_disable_irq_and_cancel_work(data);
+}
+
 static int rt5659_probe(struct snd_soc_component *component)
 {
 	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
@@ -3667,8 +3682,10 @@ static int rt5659_probe(struct snd_soc_component *component)
 
 	rt5659->component = component;
 
+	regcache_sync(rt5659->regmap);
+
 	if (rt5659->irq_disabled) {
-		enable_irq(to_i2c_client(component->dev)->irq);
+		enable_irq(rt5659->i2c->irq);
 		rt5659->irq_disabled = false;
 	}
 
@@ -3689,17 +3706,28 @@ static int rt5659_probe(struct snd_soc_component *component)
 static void rt5659_remove(struct snd_soc_component *component)
 {
 	struct rt5659_priv *rt5659 = snd_soc_component_get_drvdata(component);
-	struct i2c_client *i2c = to_i2c_client(component->dev);
 
-	if (rt5659->irq_acquired) {
-		disable_irq(i2c->irq);
-		rt5659->irq_disabled = true;
+	rt5659_disable_irq_and_cancel_work(rt5659);
+
+	if (rt5659->jack_type && rt5659->pdata.jd_src == RT5659_JD3)
+		rt5659_headset_detect(component, 0);
+
+	rt5659->hs_jack = NULL;
+	rt5659->jack_type = 0;
+	rt5659->hda_hp_plugged = false;
+	rt5659->hda_mic_plugged = false;
+
+	if (rt5659->pdata.jd_src == RT5659_JD_HDA_HEADER) {
+		regmap_update_bits(rt5659->regmap, RT5659_IRQ_CTRL_1,
+				   0x10, 0x10);
+		regmap_update_bits(rt5659->regmap, RT5659_IRQ_CTRL_2,
+				   0x2, 0x0);
 	}
 
-	if (rt5659->jack_detect_work_inited)
-		cancel_delayed_work_sync(&rt5659->jack_detect_work);
+	rt5659->component = NULL;
 
 	regmap_write(rt5659->regmap, RT5659_RESET, 0);
+	regcache_mark_dirty(rt5659->regmap);
 }
 
 #ifdef CONFIG_PM
@@ -4328,6 +4356,13 @@ static int rt5659_i2c_probe(struct i2c_client *i2c)
 				   RT5659_GP1_PIN_MASK, RT5659_GP1_PIN_IRQ);
 	}
 
+	rt5659->i2c = i2c;
+	ret = devm_add_action_or_reset(&i2c->dev,
+				      rt5659_i2c_disable_irq_and_cancel_work,
+				      rt5659);
+	if (ret)
+		return ret;
+
 	return devm_snd_soc_register_component(&i2c->dev,
 			&soc_component_dev_rt5659,
 			rt5659_dai, ARRAY_SIZE(rt5659_dai));
@@ -4337,6 +4372,7 @@ static void rt5659_i2c_shutdown(struct i2c_client *client)
 {
 	struct rt5659_priv *rt5659 = i2c_get_clientdata(client);
 
+	rt5659_disable_irq_and_cancel_work(rt5659);
 	regmap_write(rt5659->regmap, RT5659_RESET, 0);
 }
 
diff --git a/sound/soc/codecs/rt5659.h b/sound/soc/codecs/rt5659.h
index e10b3844501b9..1118e6ab1887d 100644
--- a/sound/soc/codecs/rt5659.h
+++ b/sound/soc/codecs/rt5659.h
@@ -1793,6 +1793,7 @@ struct rt5659_priv {
 	struct snd_soc_component *component;
 	struct rt5659_platform_data pdata;
 	struct regmap *regmap;
+	struct i2c_client *i2c;
 	struct gpio_desc *gpiod_ldo1_en;
 	struct gpio_desc *gpiod_reset;
 	struct snd_soc_jack *hs_jack;
-- 
2.47.3

