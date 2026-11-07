Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794072408;
	b=kgpTv7FrYP2n/YPSadndiaYKVqCwxfEdgDjyAN8r92Qmyf4LGUcMAQGwQeKvh8LydL3X
	 RL4swpUu6RwQHWruwT0nKQT/YoSHxGqD7IsMzWdQboLPycnuZjc4lllbninyNaLWH5+pJ
	 VbDZ3uuHUJEUMPztvP5foLqfbDPA2U8rSMwQSOvFJv+i8hORhXSCjs/IoyFZu9IW+IScC
	 Llz3FQLTUgDrv9VXEjxvgqghy+FZa87oLStyJcYsBut9nczHpdHJVyhRYK4hDQv7ga3JN
	 lzVYx4H4Z4RJiSxzp5YyvGRktW5E8tSoy9hZ6A38WIMVWRqR3d6EtYPmtSk6TMtPeIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794072408;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=XV6wxG2nZJByfpNN3e1VBlwYw+pc47/AaJqMCpAEg68=;
	b=dzt2LRTkLIhm4ank7qzRtRHfOsgvduf28PQr6fFa/UH8FZ6TYIyA/pLciadVIf33iLLi
	 IFiyPqXF/rpqRzvVcvdmjL+uwe3ykpqaBX/7pl5rU8NJ8eRM5rPg/35onkbnBGG0fuqsa
	 Gn1N1jrjqsB0d6h51Nv1kA0A4kE7s4VbJGBVWn4oGefid+Nu4ciQs7oT9bWUFBcQXdmLR
	 FXmj5ojQ//tfYV92rFiUFa6xUGzGv7ovdfAGAodeIee7osy5fFYtMRYw1kCNtmbAlr6W0
	 Wc+XqDfHBmHrv977+bl1MWlyGt0k5Is2GSmDvwBce0eiosoKe1XXLb52aDV57YlJwHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Nt4jcXCR;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BE1F606A32C
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 17:26:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6BE1F606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Nt4jcXCR
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a210470b49so11133265e9.2
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 09:26:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794072407; x=1794677207; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XV6wxG2nZJByfpNN3e1VBlwYw+pc47/AaJqMCpAEg68=;
        b=Nt4jcXCR2I5OQQRcrsTp1xOTUSgtpm9qChh0o8i0Z7Z1IcUMe62Pm0pozzy61U7GKf
         ycXgJlSOOZG5y6y2XcMXLMMfzJPw5moNZA/UYfKoMusMeDT9fnI4+Aq2RnNEhtk71nzw
         VdjUTV3pyKOhah/b4fa8Wg+eazW1hJNWju9LI5mz/iOrEjhJYVTbTEiUcO0hvR/JCqtw
         K/Lv+4mhCrdWOqR98i6CguXtkyhOfEyZQaipQwg5ZzQxZo58WGDT83k5jdMHEMLveNWm
         woIZhU47y6W4rOFx+y89Z6oF0ZPWwa//3+Gvu22lFhtabzU1t3EgfdKSrgFjoEs/XGeb
         QvjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794072407; x=1794677207;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XV6wxG2nZJByfpNN3e1VBlwYw+pc47/AaJqMCpAEg68=;
        b=Ot9h5qy8ovX3wjaN8C0WSA7qrzd6W9nQ/Ki/Bz+NzKQGBtjYJEbCnabSX5cqJAvodc
         z3X29rt2/qToe/GBCDCVnIi4gmSC9eOLD0nWxXChAZB1Sf76k7iGg0q7+NrZ8IbBSS5y
         QH/97oNW07XErjlktn9jDn40OQjSsfctQEnlLkAr4XWV0sdcdWXNr3OiCTVohzkxFk6C
         G1vvOvbmckZs8xv+d61IQLVLX1704N+6o4FXLAiYyUXKigSlUrCrQ24jIh8gGGLrcPPU
         nwBjQ0UezJxBlalB6Hc0LSDOwc3H+E91yIY9+wCpADVYbFZClmIumfKiU5rmOsLpq56a
         Dlsw==
X-Forwarded-Encrypted: i=1; AKwUvBxho3J8at+e3J69NvBh4Qbl6bkqeaRyYi9yXVb2DQ5HpaCP4RB7584AbIHRoTSBKszA2Gnk/qS+Kd3Mk10=@vger.kernel.org
X-Gm-Message-State: APuU4Z/z+J9BDa5kxTFq/306Czs0xm1g+AXJ7XUw4y7BGSKSKeP9AwZW
	v+qOBcnrrGTFml4Obr7mptuFRkLjxns80o3D9uUcEJ9thlcQX7m/OWw=
X-Gm-Gg: AYBFou0tw+HhNQf/U2y44f3n2PF+fVnDBuBT1JCyc5/GqaKrm/xZeanjKRmGwu3DD3Y
	0Jsl7XOAP4kH2BIhpEHjfJo9pic6HdRkCB05WzfGk1+4xxvJjPQNMn/pi0Q2eggleRbDYlobj6S
	Ohn3ZiNGoPKjFgUkky3W5yqG8LnGSuYmp8TW7ZAb1ghnuWfdPHu9X5RxubLiBC9JPXaBoMN4HPE
	cFDpEflVfOY0T9LPO7Y74dp7skfNl+P1Gi/X1APfhXoyeIT2NEaZJzJnX5BJkhXvX94+dp6+bH2
	1Pn3uXMmroYQNK8HED+s03MwTzQRf/A3jinrhdFn+3Ew9+kf0cPnCkRh6TFLPP8PgB5nxws5R5f
	jfep2XSqnu+4fip6PNytsoYz264OAuL6k/k5DrlrItDupz1w6f0pQiaHkSCKILuESgZqmj6IiDS
	ejgrccT5g8w3R1dTJ2ZejFzJAAJBVKBa0zsjASjarsmbBkvxAXCioWanVBgLdBfnPpjan1mKN3k
	SRy0NVnTNVpVg0xlY21PtWzYCmp/89GAw2gOKRtzzdyTyo8kzzbHe5OzNqk8lgJfLAyJ82mNQ+O
	5I0vaF0PGKF5rAo=
X-Received: by 2002:a05:600c:6384:b0:4a1:d537:1c8d with SMTP id 5b1f17b1804b1-4b6dea6a00cmr108689285e9.19.1794072406654;
        Sat, 07 Nov 2026 09:26:46 -0800 (PST)
Received: from localhost.localdomain ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d3d60e78sm10471054f8f.1.2026.11.07.09.26.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 09:26:46 -0800 (PST)
From: Tristan Madani <tristmd@gmail.com>
To: Oder Chiou <oder_chiou@realtek.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Bard Liao <bardliao@realtek.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	tristan@talencesecurity.com
Subject: [PATCH v3] ASoC: rt5668: fix teardown order and stale state across card rebind
Date: Sat,  7 Nov 2026 17:26:37 +0000
Message-ID: <20261107172637.2729867-1-tristmd@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261107130651.2059891-1-tristan@talencesecurity.com>
References: <20261107130651.2059891-1-tristan@talencesecurity.com>
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

From: Tristan Madani <tristan@talencesecurity.com>

The cleanup in rt5668_remove() does not reset hs_jack, jack_type, or
the component pointer, and does not mark the regmap cache dirty after
the codec reset.  On card rebind this leaves a dangling hs_jack pointer
and causes regmap_update_bits() to skip re-programming jack-detection
registers because the cache still holds the pre-reset values.

Additionally, headset detection registers from a previous session
remain cached after the hardware reset.  regcache_sync() on rebind
restores this stale state, which can leave the SAR source on button
mode.  Clear the headset state by calling rt5668_headset_detect(0)
before the codec reset.

If the I2C device unbinds without a card bound, rt5668_remove() is
never called and the IRQ keeps queuing jack_detect_work and
jd_check_work until devres frees the private data.  Register a devm
action to disable the IRQ, set irq_disabled, and cancel both delayed
works on any I2C teardown path.

Consolidate the IRQ disable and work cancellation into the devm
helper and call it from rt5668_remove() and rt5668_i2c_shutdown()
as well, so every path goes through the same sequence and
irq_disabled stays consistent.  This prevents an unbalanced
disable_irq() when multiple teardown paths run in succession.

Store the I2C client pointer in rt5668_priv so all paths can
reference it directly.

Fixes: d59fb2856223 ("ASoC: rt5668: add rt5668B codec driver")
Cc: stable@vger.kernel.org
Signed-off-by: Tristan Madani <tristan@talencesecurity.com>
---
Changes in v3:
  - Set irq_disabled in the devm teardown helper and call it from
    rt5668_remove() and rt5668_i2c_shutdown() to prevent double
    disable_irq() when multiple teardown paths run
Changes in v2:
  - Clear headset detection state via rt5668_headset_detect(0) before
    codec reset to prevent stale SAR/button state on rebind
  - Guard disable_irq() in rt5668_i2c_shutdown() with irq_disabled
    flag to avoid unbalanced disable

 sound/soc/codecs/rt5668.c | 41 +++++++++++++++++++++++++++++++--------
 1 file changed, 33 insertions(+), 8 deletions(-)

diff --git a/sound/soc/codecs/rt5668.c b/sound/soc/codecs/rt5668.c
index 29d70802a046a..5bfe5d9546925 100644
--- a/sound/soc/codecs/rt5668.c
+++ b/sound/soc/codecs/rt5668.c
@@ -45,6 +45,7 @@ struct rt5668_priv {
 	struct rt5668_platform_data pdata;
 	struct gpio_desc *ldo1_en;
 	struct regmap *regmap;
+	struct i2c_client *i2c;
 	struct snd_soc_jack *hs_jack;
 	struct regulator_bulk_data supplies[RT5668_NUM_SUPPLIES];
 	struct delayed_work jack_detect_work;
@@ -2213,14 +2214,28 @@ static int rt5668_set_bias_level(struct snd_soc_component *component,
 	return 0;
 }
 
+static void rt5668_i2c_disable_irq_and_cancel_work(void *data)
+{
+	struct rt5668_priv *rt5668 = data;
+
+	if (rt5668->irq_acquired && !rt5668->irq_disabled) {
+		disable_irq(rt5668->i2c->irq);
+		rt5668->irq_disabled = true;
+	}
+	cancel_delayed_work_sync(&rt5668->jack_detect_work);
+	cancel_delayed_work_sync(&rt5668->jd_check_work);
+}
+
 static int rt5668_probe(struct snd_soc_component *component)
 {
 	struct rt5668_priv *rt5668 = snd_soc_component_get_drvdata(component);
 
 	rt5668->component = component;
 
+	regcache_sync(rt5668->regmap);
+
 	if (rt5668->irq_disabled) {
-		enable_irq(to_i2c_client(component->dev)->irq);
+		enable_irq(rt5668->i2c->irq);
 		rt5668->irq_disabled = false;
 	}
 
@@ -2230,17 +2245,18 @@ static int rt5668_probe(struct snd_soc_component *component)
 static void rt5668_remove(struct snd_soc_component *component)
 {
 	struct rt5668_priv *rt5668 = snd_soc_component_get_drvdata(component);
-	struct i2c_client *i2c = to_i2c_client(component->dev);
 
-	if (rt5668->irq_acquired) {
-		disable_irq(i2c->irq);
-		rt5668->irq_disabled = true;
-	}
+	rt5668_i2c_disable_irq_and_cancel_work(rt5668);
 
-	cancel_delayed_work_sync(&rt5668->jack_detect_work);
-	cancel_delayed_work_sync(&rt5668->jd_check_work);
+	if (rt5668->jack_type)
+		rt5668_headset_detect(component, 0);
+
+	rt5668->hs_jack = NULL;
+	rt5668->jack_type = 0;
+	rt5668->component = NULL;
 
 	rt5668_reset(rt5668->regmap);
+	regcache_mark_dirty(rt5668->regmap);
 }
 
 #ifdef CONFIG_PM
@@ -2576,6 +2592,13 @@ static int rt5668_i2c_probe(struct i2c_client *i2c)
 			rt5668->irq_acquired = true;
 	}
 
+	rt5668->i2c = i2c;
+	ret = devm_add_action_or_reset(&i2c->dev,
+				      rt5668_i2c_disable_irq_and_cancel_work,
+				      rt5668);
+	if (ret)
+		return ret;
+
 	return devm_snd_soc_register_component(&i2c->dev, &soc_component_dev_rt5668,
 			rt5668_dai, ARRAY_SIZE(rt5668_dai));
 }
@@ -2584,6 +2607,8 @@ static void rt5668_i2c_shutdown(struct i2c_client *client)
 {
 	struct rt5668_priv *rt5668 = i2c_get_clientdata(client);
 
+	rt5668_i2c_disable_irq_and_cancel_work(rt5668);
+
 	rt5668_reset(rt5668->regmap);
 }
 
-- 
2.47.3

