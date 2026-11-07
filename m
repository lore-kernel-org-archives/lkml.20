Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794067835;
	b=y0OEB0HDmHCpj/wsLJQ2cC/PYO2XAmZAD/9Xvxj34X992AhzSOx4e9KbEKq0HEJbJmYx
	 v9hUlOihXHii35nHPggUJx04WbIi2Ytwn54amxU3ku59kUgVX6rgVAmtLRFUnYWXQaBJu
	 gv7fFHwhqAXIA8NU7YNz75aaxWX8iZnLhNhwbuD/YE6swq5kGnIpcrmSy6yGkDcFncsgN
	 NuiZO/BaokRWSqVBKOnoD3JKn+IngGwfDUL1DkQAY7JGe+wzUt0BcJDZzfE3WQx80fZXZ
	 PzJThI7Hoq+rdrLkyeUHL9SlA36V5yJAZaQfVw4cuNVPOUaa0WNSLGo5KodfCxrbuZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794067835;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=uwEFi79yypw+F9MqhNVtBH7gc48f9U5WRmKQQsYkJH4=;
	b=a344NYS85Z2L9UQCZHvvkzphposuu0up6HErMQJf5dCRzSoKknogrSo6j4laVn1wu3kv
	 urzkl8HdDsN+0oVi0c3PG61F8igNPcsLGp3IafhMORkP+KO9uEB2Qam4G7Yh5J3Jt4CJi
	 FS9k29KFPpgD5IVW9dA3UOscguWoWxdykJE53AixPkhb0UyZryt3vAlgfV3IN7ysHh+mo
	 COs/cY8vGs07QV1uAWFoWz6/OOjg2Ob52Mz3RYovh2zygZnxhRnw2fdYCxAWhlT7164Ey
	 DOEjpjCHOSlfX9k7TvOIfc+twt5nyNpU1lhYAsxBJE7LpEYpXi2VrMsbBkEfArywQEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pjkWoDCD;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68051606EEA5
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 16:10:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68051606EEA5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pjkWoDCD
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a214af2076so11084005e9.0
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 08:10:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794067834; x=1794672634; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uwEFi79yypw+F9MqhNVtBH7gc48f9U5WRmKQQsYkJH4=;
        b=pjkWoDCDj8VX4ohntZKjDf/i/q+6xa7iNdoahxM6ivfkd1kw2eckcpGLG004ts1z0v
         /bHKOQ7ZelZJuU+Io1ttXStvxlyJsUBSIwPQqSoiqBoB5tsFwAF7OgmyY7fseiECNtgL
         d9RKg6GJpENwRRMMdcylAvhS2GhfnYep32ROez5BbxPqs1d7jadZXUiCNFCNax2uUkqZ
         Bx890MLHVuMSqZKfG3KXwQytf6AhNu670ShFG3jCqSwwGhq/Li9psRQUOxx7vvRUEnNY
         LjDqn3hr2Rd7YI7ml4Ig7tJndN30gH+4Gw4/fiSuDV4G1C674myIAoL3NBBzJA+e60Br
         3Lzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794067834; x=1794672634;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uwEFi79yypw+F9MqhNVtBH7gc48f9U5WRmKQQsYkJH4=;
        b=0umm7vzIsd05Wofy+yzeUOr2Zw+e9B/3l0PWdlXBqWrkI/+g1Xu5ZzYH07SUo0dcXJ
         Zfn1SZtVQ614dzq2T6LwHwAVf4swRtXf9r6v42woNZUGc67ZlI9L1+BLwWsAydWEAozZ
         /DRWg7MbFO3QHieiVvwOwZ2nWo4uBMAu/ceJjzuwDHldDn9/VbAbKNrTMPaY/OCwzHhE
         yzBFC8QG1aXH5yemIWePJunP87dGI2U5FuclMN3mcTenbQ/rEGAQ9ITcMQ0LKbi5VJOY
         uags2Opv4I3YlqVfMA0KBejgG3DELY7B8x3BjIg+boTz+Xjd/zncQ6kFuN/05dndzXxs
         RB+g==
X-Forwarded-Encrypted: i=1; AKwUvByMCPfAcVP+1Ax+MP9qisiZ+7kwVFXe3g4nZqWik7mOTyAJR7WzhqoeDo78uj4nxisjDN3jKrdXvv6GnZY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8WfulhaB8DYpdybdd0bjS8qdgo+6V63OuYGS6S21bRcYUiyhZG
	sAZlSm3GcDzv0Eql7J2FZTc6jchmba/9+TgxIVryt7hRty2Wml63Jf4=
X-Gm-Gg: AYBFou38FzELDUo0robbsQ3cuaD4h92UpaZIi+SvoBRdiQba9U6mevhV0WmWcZdsMlI
	+6Sd1eiossrbvGCnY9vdwipGm19cJFB2hjYnYplSD+x+5HyHtAfde3Og8qHb44wDhKXA5b8ZwLy
	5FD0Er3pCscYiLDudqNtT2225ormtsJo78qBWyKoEPVA535xTD05geXPiYxBCb7+LXKzsKwaDrz
	Erv8Q8mabONowM/mWTWMkWm0aK5QjsoYPvdH2ynkX+ZeOzb4uPVcaOJQVziSk9lQYEDPqAmmXCG
	SmmMtObfcalvHqP2DyAqnmvNSewXL2eiLegct4aFgOsdKYRRhqJf6rk3KaQfu6q56NnI1O86nSV
	zlM/cxBDrYYy/HTTFVoXBZTNWlOaZQ2IrhKDzGvs5aF5CXzmtHh1hgYDymhUgk7TEf17CnWgklw
	+pP2LtOmIRjpXkB+hK/eSNIhQgIM2MsfnY6+AEvViMQwyne2TfW/WSjwdO2AC9jsBPYh7kta6OM
	gN3mThrppAxKS8yDRib5M+mwnIQ4yvFpNHFD4JcajP3AgrJ/caEL378+mkYZtyFIyNHkdELIvCP
	7GyeBPdVmJe6I2H9m/NQbxcIF9AQcnNiENsbZg==
X-Received: by 2002:a05:600c:3e0e:b0:4a7:8fe8:130c with SMTP id 5b1f17b1804b1-4b6df9be2a8mr99966095e9.28.1794067833456;
        Sat, 07 Nov 2026 08:10:33 -0800 (PST)
Received: from localhost.localdomain ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7e326b7afsm77532595e9.2.2026.11.07.08.10.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 08:10:33 -0800 (PST)
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
	Tristan Madani <tristan@talencesecurity.com>
Subject: [PATCH v2] ASoC: rt5668: fix teardown order and stale state across card rebind
Date: Sat,  7 Nov 2026 16:10:24 +0000
Message-ID: <20261107161024.1233587-1-tristmd@gmail.com>
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

From: Tristan Madani <tristan@talencesecurity.com>

The cleanup in rt5668_remove() does not reset hs_jack, jack_type, or
the component pointer, and does not mark the regmap cache dirty after
the codec reset.  On card rebind this leaves a dangling hs_jack pointer
and causes regmap_update_bits() to skip re-programming jack-detection
registers because the cache still holds the pre-reset values.

Additionally, SAR and button-detection registers from a previous
headset session remain cached after the hardware reset.
regcache_sync() on rebind restores this stale state while jack_type
is zero, leaving the SAR source on button mode.  Clear the headset
state by calling rt5668_headset_detect(component, 0) before the
codec reset.

If the I2C device unbinds without a card bound, rt5668_remove() is
never called and the IRQ keeps queuing jack_detect_work until devres
frees the private data.  Register a devm action to disable the IRQ
and cancel both delayed works on any I2C teardown path.  Guard
disable_irq() in rt5668_i2c_shutdown() with the irq_disabled flag
to avoid an unbalanced disable when rt5668_remove() already ran.

Store the I2C client pointer in rt5668_priv so all paths can
reference it directly.

Fixes: d59fb2856223 ("ASoC: rt5668: add rt5668B codec driver")
Cc: stable@vger.kernel.org
Signed-off-by: Tristan Madani <tristan@talencesecurity.com>
---
Changes in v2:
- Clear SAR/button register state via rt5668_headset_detect(component, 0)
  before codec reset to prevent stale detection state on rebind
- Guard disable_irq() in rt5668_i2c_shutdown() with irq_disabled flag to
  avoid unbalanced disable when rt5668_remove() already ran
 sound/soc/codecs/rt5668.c | 38 +++++++++++++++++++++++++++++++++++---
 1 file changed, 35 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/rt5668.c b/sound/soc/codecs/rt5668.c
index 29d70802a046a..c8aeaf25a7fd8 100644
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
@@ -2213,14 +2214,26 @@ static int rt5668_set_bias_level(struct snd_soc_component *component,
 	return 0;
 }
 
+static void rt5668_i2c_disable_irq_and_cancel_work(void *data)
+{
+	struct rt5668_priv *rt5668 = data;
+
+	if (rt5668->irq_acquired && !rt5668->irq_disabled)
+		disable_irq(rt5668->i2c->irq);
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
 
@@ -2230,17 +2243,24 @@ static int rt5668_probe(struct snd_soc_component *component)
 static void rt5668_remove(struct snd_soc_component *component)
 {
 	struct rt5668_priv *rt5668 = snd_soc_component_get_drvdata(component);
-	struct i2c_client *i2c = to_i2c_client(component->dev);
 
 	if (rt5668->irq_acquired) {
-		disable_irq(i2c->irq);
+		disable_irq(rt5668->i2c->irq);
 		rt5668->irq_disabled = true;
 	}
 
 	cancel_delayed_work_sync(&rt5668->jack_detect_work);
 	cancel_delayed_work_sync(&rt5668->jd_check_work);
 
+	if (rt5668->jack_type)
+		rt5668_headset_detect(component, 0);
+
+	rt5668->hs_jack = NULL;
+	rt5668->jack_type = 0;
+	rt5668->component = NULL;
+
 	rt5668_reset(rt5668->regmap);
+	regcache_mark_dirty(rt5668->regmap);
 }
 
 #ifdef CONFIG_PM
@@ -2576,6 +2596,13 @@ static int rt5668_i2c_probe(struct i2c_client *i2c)
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
@@ -2584,6 +2611,11 @@ static void rt5668_i2c_shutdown(struct i2c_client *client)
 {
 	struct rt5668_priv *rt5668 = i2c_get_clientdata(client);
 
+	if (rt5668->irq_acquired && !rt5668->irq_disabled)
+		disable_irq(client->irq);
+	cancel_delayed_work_sync(&rt5668->jack_detect_work);
+	cancel_delayed_work_sync(&rt5668->jd_check_work);
+
 	rt5668_reset(rt5668->regmap);
 }
 
-- 
2.47.3

