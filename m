Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793638431;
	b=GaWv8ckhTWNdfRKOTr+Acgy1D50b0jxL/XsY7JRSQ43orNY1IQJFFa0aPBWKTE0DjZDc
	 Uez+Ni3UBrrGzhAbj+MTH/KJPkUec8ixx9zKEitvsX7fg6aqKsF2Ut2oiDqVwn21nCpIu
	 D7OxsDZ6DGqIYBi6qY8BJdJa+tzs+q+TwT/1erEu0I61rmVEJtOS7bjjdmZau6/dVJ9ik
	 wRi6OEIW2NP/d8zO6BPbRdiv/90IFYoELJpGVk5OW/QM+n5JoPp8/jI6zM2m4lVAqUE0F
	 EI16FtKXeZ6P8YKKprorJnap3O6Si/19krZAj+B0WI0cCdXu/7TYHmZHui4RrazduLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793638431;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=FKqv7bnNQX/8zEXTN67qa4Cr1S0J70BOR+pXSxfvYfo=;
	b=xMq40ywdoF7DbO3qj3KFeJKpzzQb1NwNECxtMhnQfy68KF9DLx61vDsaRRuA21t02biY
	 NCxk8K0zt6M+Fz22bUxNHChhgL0FgCxVX00ZyER9kJoJVmPNcTepoMH/cJ7q0WLE1jVU+
	 GkH6Hk0bo/5CDwSkPCPjOdea9ft8WpcLng/1Aagnx1+SKiwI5re6oHtL1pOXfAVU4d8NS
	 m4op6YKsKau5HuNxwuSsPJToBFPRTfJwqxHMcTWufHFZ+J+eEXOQo8yCKubjgF/O69Oti
	 brOV2unFz8vM7JogVfwSbDM7hAR8jhAgri6GlyN/B96+d/rg+bv2Q6asJu+dEPHklug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z4kHbyed;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C79786079910
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 16:53:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C79786079910
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z4kHbyed
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48df4f540ebso1476032f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 08:53:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793638429; x=1794243229; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FKqv7bnNQX/8zEXTN67qa4Cr1S0J70BOR+pXSxfvYfo=;
        b=Z4kHbyed13kOoAAH+vY0vunbCucbOvrgv/juqfz5g3DiN/noLQKXsg8JROEDofrtZO
         i0g/iUlWDLkUcju3Q9Lqs1cVkCGSiMLWZGnfBAIKqz+9kSI1J74KDjUJ4hEsXDOrbF2h
         /7QlVOX6/NHBhb3EoQ1fo/kPDfuEp40hRmxOkyPveP0fY5zdp0Kz3wn1Hyd9mQH0UKGh
         7SYOx7H00GPl8pYv0mNBVOTNEIDko8WKW3H/p0Umm02HDbTihxNBS9Hdh9ze+n7+t9+1
         r+TbMkkdNl7AOphF/uls/joLz+bamY/B4BG/7ld60QPsv9Ph/dDK3k7iQo0r4RbM4f4i
         LehA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793638429; x=1794243229;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FKqv7bnNQX/8zEXTN67qa4Cr1S0J70BOR+pXSxfvYfo=;
        b=Q0AiALG1K59qFKQO9OsXhlVCxHooIqWU4UA0FoAwmXyRkQLtramBQJMN/ADwz3ssLm
         or6cGifpWAYmP5w1UPeDpZcWiSbLuHiV19Y6969T91r6lYqkn813x67c16CsB+qFkAZP
         jjWaxPZy9wxoU6kykuUqo1mnuV6ekOl1eAp6X1qPKGg8n6cr35W39Euo8MjidP1hE23F
         oQ2//+h+xWMIzt50Z5Y+md0Kg7Fe3Xs3atGHB0+uolyjT6eSpR026DhBF7rUHM8atDSI
         WSdxcdEM9UNG7Tz4jNErxUi1KGx52/lVlYMokC46UQ3QmqJuyqNjWZaLeYS4dh/49jaG
         TVdA==
X-Forwarded-Encrypted: i=1; AKwUvBxaakfnav+MynmXX1u/4kE++TFzKJhEufHLl9sGnVAKJPD+wnwZzDlLzYGy2Yb9Yy3y+K1t3a/oLstrCOU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/AuarXK/nVM2lnZTrGUamlKbSFI1QEdwOLk/yJC0rmMNNS6PSa
	SxoLobq4KgQ2JDwm3PtBDTGV2R7JXhnFRhqMuqfPYYzZ5UiWam/j0+oc5Chu
X-Gm-Gg: AYBFou2r7aaovE5MKEreHv6NyP38Otyc2apGTTWNHbyHDYA3U417527MRjhnAu2skao
	U30FgCs8YpkSWZWE+gBxI3IBuibhB72FA7nBb9VoRVdJwmADXrvzN8Fan6ban2bD+TpPFqJS5CA
	CIqdc/sZt2x2JBJXRE2+rUkl0ZJKUU4t5zrfFDNXhOSFp73nZa5415CuitRprEblgVoY2KsPQB4
	mMUx/NEpn+xrEMmPgAkxpitFaExe8oYYv8E6nudD/7eJXKBliCxiHuA1UviCjbgUZ8VhkG2VX3i
	h4lYpxuBLb87BvmuLWy1EUGhZ57tFTik6/jF0c2vCx7LfAHYNnNtsBdABznMHgPINV8FgVIxlFC
	Mnw/uMtXvjxPDkfiwfNJxk1ZavptK+2blfXYRMWpu4gbjFMNdxph96D8E2fxJ89HFymO88w0N2Y
	GiUdiRfGj9A+4LhUhxiTi4UTUp3SII6XcPsRQ7RP2BeoURfNYc/PsPuyql4vDDx5lrTbAEvcPd4
	132Ca5xb7jVRxZOa4N+JcYa4fXVvOwsuZ5p80u27CjcdUEzmXiR5jQm+vQOrHQm1gzq/QohCg==
X-Received: by 2002:a5d:5d09:0:b0:48e:76ab:7900 with SMTP id ffacd0b85a97d-48e76ab7eefmr16659618f8f.17.1793638429213;
        Mon, 02 Nov 2026 08:53:49 -0800 (PST)
Received: from debian.. ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b8e5f4sm21479385f8f.40.2026.11.02.08.53.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 08:53:48 -0800 (PST)
From: Tristan Madani <tristmd@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Charles Keepax <ckeepax@opensource.cirrus.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Bard Liao <bardliao@realtek.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Jorge Eduardo Candelaria <jorge.candelaria@ti.com>,
	Margarita Olaya Cabrera <magi.olaya@ti.com>,
	Misael Lopez Cruz <misael.lopez@ti.com>,
	patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	tristan@talencesecurity.com
Subject: [PATCH v6 2/4] ASoC: rt5659: cancel jack_detect_work on component removal
Date: Mon,  2 Nov 2026 16:53:38 +0000
Message-ID: <20261102165340.1558853-3-tristmd@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261102165340.1558853-1-tristmd@gmail.com>
References: <20261102165340.1558853-1-tristmd@gmail.com>
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

rt5659_remove() resets the codec via regmap_write() but does not cancel
the pending jack_detect_work. Since the IRQ is registered with
devm_request_threaded_irq(), it remains active until after the component
remove callback returns.  The IRQ handler (rt5659_irq) schedules
jack_detect_work, so a late interrupt can queue work that runs against a
reset codec.

Track successful IRQ acquisition with a flag so that disable_irq()
only quiesces a line this driver actually owns.  Guard the
cancel_delayed_work_sync() call with a flag that tracks whether the
work was initialized, since INIT_DELAYED_WORK is only called for
specific jd_src configurations (JD3, JD_HDA_HEADER) and cancelling
an uninitialized work is undefined behavior.

On component remove, disable the IRQ to synchronize with any running
handler and prevent new enqueues, then drain the residual
jack_detect_work synchronously before resetting the hardware.  On the
next component probe (card rebind), re-enable the IRQ to restore jack
detection.

Fixes: d3cb2de2479b ("ASoC: rt5659: add rt5659 codec driver")
Cc: stable@vger.kernel.org
Signed-off-by: Tristan Madani <tristan@talencesecurity.com>
---
 sound/soc/codecs/rt5659.c | 20 +++++++++++++++++++-
 sound/soc/codecs/rt5659.h |  3 +++
 2 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/rt5659.c b/sound/soc/codecs/rt5659.c
index af8051fa69f89..68f7d5673e190 100644
--- a/sound/soc/codecs/rt5659.c
+++ b/sound/soc/codecs/rt5659.c
@@ -3667,6 +3667,11 @@ static int rt5659_probe(struct snd_soc_component *component)
 
 	rt5659->component = component;
 
+	if (rt5659->irq_disabled) {
+		enable_irq(to_i2c_client(component->dev)->irq);
+		rt5659->irq_disabled = false;
+	}
+
 	switch (rt5659->pdata.jd_src) {
 	case RT5659_JD_HDA_HEADER:
 		break;
@@ -3684,6 +3689,15 @@ static int rt5659_probe(struct snd_soc_component *component)
 static void rt5659_remove(struct snd_soc_component *component)
 {
 	struct rt5659_priv *rt5659 = snd_soc_component_get_drvdata(component);
+	struct i2c_client *i2c = to_i2c_client(component->dev);
+
+	if (rt5659->irq_acquired) {
+		disable_irq(i2c->irq);
+		rt5659->irq_disabled = true;
+	}
+
+	if (rt5659->jack_detect_work_inited)
+		cancel_delayed_work_sync(&rt5659->jack_detect_work);
 
 	regmap_write(rt5659->regmap, RT5659_RESET, 0);
 }
@@ -4283,6 +4297,7 @@ static int rt5659_i2c_probe(struct i2c_client *i2c)
 		regmap_write(rt5659->regmap, RT5659_IRQ_CTRL_2, 0x0040);
 		INIT_DELAYED_WORK(&rt5659->jack_detect_work,
 			rt5659_jack_detect_work);
+		rt5659->jack_detect_work_inited = true;
 		break;
 	case RT5659_JD_HDA_HEADER:
 		regmap_write(rt5659->regmap, RT5659_GPIO_CTRL_3, 0x8000);
@@ -4292,6 +4307,7 @@ static int rt5659_i2c_probe(struct i2c_client *i2c)
 		regmap_write(rt5659->regmap, RT5659_IRQ_CTRL_1,  0x0040);
 		INIT_DELAYED_WORK(&rt5659->jack_detect_work,
 			rt5659_jack_detect_intel_hd_header);
+		rt5659->jack_detect_work_inited = true;
 		rt5659_intel_hd_header_probe_setup(rt5659);
 		break;
 	default:
@@ -4302,7 +4318,9 @@ static int rt5659_i2c_probe(struct i2c_client *i2c)
 		ret = devm_request_threaded_irq(&i2c->dev, i2c->irq, NULL,
 			rt5659_irq, IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING
 			| IRQF_ONESHOT, "rt5659", rt5659);
-		if (ret)
+		if (!ret)
+			rt5659->irq_acquired = true;
+		else
 			dev_err(&i2c->dev, "Failed to request IRQ: %d\n", ret);
 
 		/* Enable IRQ output for GPIO1 pin any way */
diff --git a/sound/soc/codecs/rt5659.h b/sound/soc/codecs/rt5659.h
index b49fd8baf4e7e..e10b3844501b9 100644
--- a/sound/soc/codecs/rt5659.h
+++ b/sound/soc/codecs/rt5659.h
@@ -1813,6 +1813,9 @@ struct rt5659_priv {
 	int jack_type;
 	bool hda_hp_plugged;
 	bool hda_mic_plugged;
+	bool irq_acquired;
+	bool irq_disabled;
+	bool jack_detect_work_inited;
 };
 
 int rt5659_set_jack_detect(struct snd_soc_component *component,
-- 
2.47.3

