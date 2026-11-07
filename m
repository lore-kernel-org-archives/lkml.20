Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794056825;
	b=o3aaipl6FO20LfN5mdYKxK0iTac3QHswNNYvWys1tkPXvuAqnyvKX8O2VIJKtOt2C5d0
	 YB3uqn4C+PWtTbZSrArCrI1O5+6JjH5zfXm63+ZIWx+REckdG8DbmfHOCKhE9WPw5r1F8
	 pC43WGib9nePvNL2teKPq7zPjqCNZ7u+WrAIyP+hkjX0eAupTgFnd4kJHmhYN4sJX/D3N
	 TxtUqlh0fJ13hV/IME4ON8vQPlrJ5NOueER7jotgpkHRLEDJlbgLE+ImbggszpOP0uvgV
	 MIRc5twNW2olMiHqyuj58Enxj/DeHBjie3ckcCb9m1pIolY1wMLdCgUS4N2BBu/Tx3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794056825;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=61Rzp6o+z7DbcxgwTRzElpmwApTyzJgIDqvPIvaYaus=;
	b=OVHvanHYPl6DWmjhjHqH22o/V9+ij5tkwdnKZcoo4LR/rWKSxvGzTnhKvwQ2Jf730cvq
	 FzpV36qiHZHtuk5wf9yN1AeOt5qy1DAxzDKHauTn1U0EmAHuqp4zDluOwth6D0kj5bfkr
	 Tm97pfQgmqYs/JLHdmscmG0yl8CP9qTmwLJQOvJdTbf+iIrD74XViRT5u1pRLsfpTrnQh
	 jA1wfgc4gueNjTUvPwXwfkfzStYP33PcQ1K1H4s+mbrzpW5BJHMRzZ9+NGLY+46hKzvkX
	 zJVeX/LkzUS3ecC5WdN8NPGZnWfVK7ztlmZ6JlLFWDPft+4Ic1fVGr1QJ/+JD1m0fQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tu6lqaHc;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8FD8606A326
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 13:07:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8FD8606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tu6lqaHc
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a208d93758so15949325e9.3
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 05:07:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794056823; x=1794661623; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=61Rzp6o+z7DbcxgwTRzElpmwApTyzJgIDqvPIvaYaus=;
        b=tu6lqaHcLt2g7SX8faDpQ3dOYQP+QezLCsfEHldu9X5qEHP2EsbIJrZtamC2k2ZouT
         e4je1KJzbsDcwUgt3SsrIIWDDI09exBzNlLM/p4ROCPKzMjpVxJgBJL+cvdzPndQi7HA
         hYjrdq+1Zy1nmtO30V4/mRIcXAPMrbvyybhbywl9cvu/ZLRzA0WNW2TyZRVN1VDWI2VF
         ZWPsnj/Yk3KsKNKiU/WBHOEx02zudjrBAcdEZSES58psQW+fX8IaED4B5enxj0cVcvLi
         PfEoODFY4vCOz2FA01d9e8dn27zF1dCu6EYzJ6W20bhNLSgRc35SCWASqp+gPt5IdX02
         B09w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794056823; x=1794661623;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=61Rzp6o+z7DbcxgwTRzElpmwApTyzJgIDqvPIvaYaus=;
        b=aMHm+HljHd2WfFgg2XqkmjwH0A3iuwrkbXMaGBHyaK6aDB5DvnlH6UjXV+4kZcwqhJ
         xbE+h1g8uldhC1oetUuC539OHrWVVIONhgDYJ8t5w2ZHik5GwwENqvTPAFxU45+Kvg4p
         kKbRKuLqKYQdM5Iftfq+rWENE1qeWygRmXwjZKvBz3Vd7yyjtvGJdzS9UsdXf5ceFGvF
         NUuh+9vDQLy+dZwtL9F3NTxXIdb/0LluRW+ZNR3AmwlNEYfWC7jIG+jat5ba+QvA8FpX
         JThnNeGChJwFjD29VBJY87iuuYRwei1zywVmVVTBrRFnYwQ3ayC3ENOCQ0vXUNotWY8F
         soVQ==
X-Forwarded-Encrypted: i=1; AKwUvBwzl2uWMjRocrRombeF11JL8XKpUqNWPO0FR4PGAQYxunDKyLBl20okgxpmW6qUg75/vQupgn6oD7lVIWA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+PE+zS5AEUEtMjyJcmFd6Osa5h1X5YcVTkjFGDpvctWjjgFA4D
	Q8TU4Xccp4sBxz6wCZVNdpbwkvOxy46HySMpLYG0rNtb3oa151Cu2M0=
X-Gm-Gg: AYBFou3bGTNlcK807tAz6RXlOAp476R9i+/2uYMhLLhztcb8NZ7fWxfKDaKSB0eda0Y
	YLL0R4bkx1Hq8RcRd4eS3xe6oAJTR3a2bbVwfpaXk22nOUs8rXJCtW6XwljuTuJhd7qHDmTZ56x
	gBUdvOcN31YZgunRuEB6hOWerUUGYoKk5VXCrbfOSvHK5lccjUXzr6mfQ4HqW/CNDS761UaUa+u
	J0KF0MClk6IJ7Cyg57n0Fw72McOkQNaW/jr7LcXsq/e2QCFGnUUHIpAHWVP09MFRXuaSsYZwD2w
	B0Cp37s6Lw7QfmXx66LF6CFeAUJ0kBBGJLzMtoZBJ2FpI7j3eRBy8mgGdlqQaVtbbBgCY2JY/xA
	ifORv9nW1n13RpEP+ecqo2aMTKdpxPa0alUpYPBdiVSjeTRx8jAqPmsj4Tp/TblT1eQD7a8Rhu1
	1li6loqwl7x7vDy4xMUyEqQxpuBhjFvP82DOcvltlOkWAnZMpzw/jaVbNCa7eLrB/2sK28VFnSf
	y/1VER/zRrAB1BwBuWfhCopAFbMlf9GlA9t9l73YkIkdvpZm0nBnpqJiUIWipdz1uG1ZKncN6ip
	VdMM5O4/kvincrwrBLkRtGDVaTSF
X-Received: by 2002:a05:600c:c8a:b0:4a1:f377:5c75 with SMTP id 5b1f17b1804b1-4b6e0454dbfmr92462475e9.33.1794056822953;
        Sat, 07 Nov 2026 05:07:02 -0800 (PST)
Received: from localhost.localdomain ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b76cbfa121sm48372785e9.1.2026.11.07.05.06.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 05:07:01 -0800 (PST)
From: Tristan Madani <tristmd@gmail.com>
X-Google-Original-From: Tristan Madani <tristan@talencesecurity.com>
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
Subject: [PATCH] ASoC: rt5668: fix teardown order and stale state across card rebind
Date: Sat,  7 Nov 2026 13:06:50 +0000
Message-ID: <20261107130651.2059891-1-tristan@talencesecurity.com>
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

The cleanup in rt5668_remove() does not reset hs_jack, jack_type, or
the component pointer, and does not mark the regmap cache dirty after
the codec reset.  On card rebind this leaves a dangling hs_jack pointer
and causes regmap_update_bits() to skip re-programming jack-detection
registers because the cache still holds the pre-reset values.

If the I2C device unbinds without a card bound, rt5668_remove() is
never called and the threaded IRQ keeps queuing jack_detect_work, which
self-rearms every 15 ms until devres frees the private data.
rt5668_i2c_shutdown() has the same gap: it resets the codec without
disabling the IRQ or cancelling the works.

Store the I2C client pointer in rt5668_priv so all paths can reference
it directly.  Clear stale driver state and mark the regmap cache dirty
in rt5668_remove(), and sync the cache in rt5668_probe() to restore
register values on rebind.  Register a devm action to disable the IRQ
and cancel both delayed works on any I2C teardown path.  Apply the same
cleanup in rt5668_i2c_shutdown().

Fixes: d59fb2856223 ("ASoC: rt5668: add rt5668B codec driver")
Cc: stable@vger.kernel.org
Signed-off-by: Tristan Madani <tristan@talencesecurity.com>
---
 sound/soc/codecs/rt5668.c | 35 ++++++++++++++++++++++++++++++++---
 1 file changed, 32 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/rt5668.c b/sound/soc/codecs/rt5668.c
index 29d70802a046a..2ceae9d9f40f6 100644
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
 
@@ -2230,17 +2243,21 @@ static int rt5668_probe(struct snd_soc_component *component)
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
 
+	rt5668->hs_jack = NULL;
+	rt5668->jack_type = 0;
+	rt5668->component = NULL;
+
 	rt5668_reset(rt5668->regmap);
+	regcache_mark_dirty(rt5668->regmap);
 }
 
 #ifdef CONFIG_PM
@@ -2576,6 +2593,13 @@ static int rt5668_i2c_probe(struct i2c_client *i2c)
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
@@ -2584,6 +2608,11 @@ static void rt5668_i2c_shutdown(struct i2c_client *client)
 {
 	struct rt5668_priv *rt5668 = i2c_get_clientdata(client);
 
+	if (rt5668->irq_acquired)
+		disable_irq(client->irq);
+	cancel_delayed_work_sync(&rt5668->jack_detect_work);
+	cancel_delayed_work_sync(&rt5668->jd_check_work);
+
 	rt5668_reset(rt5668->regmap);
 }
 
-- 
2.47.3

