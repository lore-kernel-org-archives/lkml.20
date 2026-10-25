Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792940038;
	b=w/GzyA9ZnYyD/pZ9oOIF307Q+EfaMTHSKnmH7lisMXSfh91PC8K7O8uD9y/NrkLTitCa
	 4RLMSOaWWJO0rKsgZmx+WNEN8IezpZKL87zuwWhdWwQY93Apolcz8iERXIscwZ7Cl2zrp
	 JxrqTbQt3SWFO0pZbmHIQa/VSfY16YkCetTfXUoliU09S6BIsPthLHx+rb/aBAb0KRSml
	 CW7568P97s2pYbXcCzUEUJGmhoBgMcahRHAjb9rylai/fVqUUJh+GvC3n+TIyhkS6SsqP
	 XQ44a6XhAPGSTMVrx99Zhy5c+2TYtqDrUII/nwJvuYqMHUeqwI/SHbEqJRT0X3RTuHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792940038;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=6Mom18zR7SoPUqXE9gnzIAbV9IHm5NPCzb9VJVi+Is8=;
	b=HmKemxvD7kpUdtmLf+8TvtBhKCkTFL/buCASNqB243U2pBVsYTLPTOhOHx+Lm9ZnXS4W
	 K0gFtg7SHF2pd1+oBM1EoGVXDG+39t7cxoQZJ3l7lWeeWZpRK80Ym+5LsjPW9l770EXYK
	 +qLh8TW/HxDLiGFi8Dm8NzR9mu4aZxqg0gfelGSuDNVsZNkKoWBT0HfVkJOQ83P1KKIEZ
	 v66sOM50XruJK1lKfFrtz2eeCb4LQYW77/9wInGm4kedbfCojK6AuIMbeJG1QE3bi7e0A
	 I8R2x0/Acv5tJNuzUJhZsHpelvAmGqBVhgsB2V2FD+qMc3N7kx7nWZ/JFnVZQBiHdrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=KOgjbhA6;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68A51606A32E
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 14:53:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68A51606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=KOgjbhA6
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48afcd7ba9bso1188501f8f.3
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 07:53:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792940037; x=1793544837; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6Mom18zR7SoPUqXE9gnzIAbV9IHm5NPCzb9VJVi+Is8=;
        b=KOgjbhA6K/o5voVjgsil0QuJV98aIIrN1blNN1fB95Ej5DhKLlAy64XOHuJDD3L7gX
         pkeOUO00OX3pa1eeiPSeIwsCE+QKO61LdkkY4RlAhw8gJgZ7eliGhdWNK/HHcgjTObAL
         m7O11Vv7oh8FjiCGmUN5ikyV0fLbCjTYLpwIkKBXSkwt4bkLSZR9wcWaYJBrbWkfjfLk
         Z1GtHHRSdxQD1EafHWsGqVmMqtSM3r8P4lMr5IFMB65QwI04jLsX7+vF19Pd9q/zOqAG
         SZ8QUqYRW7nc85FNUGw9OMLHQZUQll0PB5DnEVPiEBdddKbvsiZ1V5jjtcYjoYW571qw
         5XQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792940037; x=1793544837;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6Mom18zR7SoPUqXE9gnzIAbV9IHm5NPCzb9VJVi+Is8=;
        b=RxmsX79Z5dm2nNYcBKMeW4I8kOWnYnWInvLqU7IJBSrAYwwq+cmY22PcuCEW5PsiOB
         7yr40q/xR+5KyU+Kj/DjUH1W7Tvizacxicux+z+M+e8WSmKjhfPiXtQ0gIWHXhZSJduq
         n8w0DgEdQHOmrrZeAY9gLWUcJBQEMFdrP26Zf/cyp0XOhTjkME/Xg+z0nPCYwSpPP5FW
         Ak/Wa+TswNgqcQrG++J2odek1XgRv6vhfqLJzLRhbJwLUrKN/DTTMegupf8ZdUX6X19D
         qGa5CuwO7FDJZ1m/6/TKTTk8Omu1fyi/hwOzaK/6X7gbsU95/6H/DorsD5hy0vuktQRj
         pXcQ==
X-Forwarded-Encrypted: i=1; AKwUvBwvLeR0+qSsVarymrCpg6sZdwyyRlIxu1m1OWRtsXqsQOSm+8aXbWcXv/O2MeyawQb4l8NXUrvp2a0RWAE=@vger.kernel.org
X-Gm-Message-State: AFq9FYIN/XbdCeavaCWRubkbioTAXeluu3SmdqswDjXFGvjibWBzi0uY
	+N0nD54SeOTd3RUh/VlDubvtRn0xUqY8COwmqmmqL//PZrgOQzspiSAC
X-Gm-Gg: AYBFou2v1uOhyiktmFhc/EOF5ItuPHPW5pK7aTdLlsBbp7W2NBtno/9+5ioRE9OJ9RV
	cjX52bidGeBt/gQNIH/SzPx+JzJxEoKHc+t0Ohw9ZU3fa9iSjg5Dtk2EwKKJKOrOtzKsLXI5t1G
	tZ3450bq12A9mNVRDvbErHy23vWHP1nFBuw70SdzT6uIttIquB9JD0wBdYn+M35GeWhrzdbOwos
	VFqf5BXXS9spu4q54UslKWGTGSZGHStExpAXbr9fvYWgWD9YP+5QujcIinUnPl3OMR49Nlr5PAK
	z03/9qx8tWGyTE4PjdFswihUjGD9pSx9Luu8RTRDdQjzFm2deSsLgNtcDg0nzmp5zmoe0WAzMpj
	KBEvWe/WiB8xHXUwccZym3nFq3tjZhLmFP9AX0CsavBCHZ7iUoywn89qOYPa7l9EUnmAc0URdzP
	WD3JR7g9WiG/tQ0dtfI/arnN/xT1hURD8m48Im3cqNPXTQNyq3T7K0SZF01ljxFlEflOA0C4nun
	JGg4G2197BNsIqXfwN9Y3mqUhqbla2gkg7g7QK+WoE/yv9Xp1jSVfzgrw52/mgb5rgjpe9OegL8
	/vMEmkuLWcgtKFPO+IS7zB0s76vYRXnAd99RIRQre3dsqwMt28jDL1UDh4TknQKQZSLbQss=
X-Received: by 2002:a05:6000:615:b0:48d:f855:d1e0 with SMTP id ffacd0b85a97d-48e3eba976cmr8372603f8f.57.1792940036702;
        Sun, 25 Oct 2026 07:53:56 -0700 (PDT)
Received: from romain-ThinkPad-P14s-Gen-5-AMD.tail433d9c.ts.net ([2001:861:39c2:e340:4c3:3a00:d533:9d50])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebcb9cesm10986471f8f.27.2026.10.25.07.53.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 07:53:56 -0700 (PDT)
From: Romain TISSERAND <romain.tisserand@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Oder Chiou <oder_chiou@realtek.com>,
	Animesh Agarwal <animeshagarwal28@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] ASoC: codecs: rt5631: Enable the optional MCLK
Date: Sun, 25 Oct 2026 15:53:54 +0100
Message-ID: <20261025145354.3476371-3-romain.tisserand@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261025145354.3476371-1-romain.tisserand@gmail.com>
References: <20261025145354.3476371-1-romain.tisserand@gmail.com>
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

When the RT5631 master clock comes from a SoC clock output, nothing in
the codec driver keeps it running, and the clock framework turns it off
at boot as an unused clock.

Get an optional "mclk" clock and enable it while the codec is active,
from the PREPARE bias level, as rt5616 does. The rate is left to the
CPU DAI.

On the GPD XD (RK3288) MCLK is i2s0_clkout, a mux between the I2S clock
and a 12 MHz oscillator. Handed to simple-audio-card instead, it is set
to the stream rate before the CPU DAI sets the I2S clock, so for
12.288 MHz the mux picks the oscillator and audio plays at the wrong
pitch. Held by the codec, it follows the I2S clock.

Signed-off-by: Romain TISSERAND <romain.tisserand@gmail.com>
---
 sound/soc/codecs/rt5631.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/rt5631.c b/sound/soc/codecs/rt5631.c
index f97fd24e42..82d5e8b9c8 100644
--- a/sound/soc/codecs/rt5631.c
+++ b/sound/soc/codecs/rt5631.c
@@ -11,6 +11,7 @@
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/init.h>
+#include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/pm.h>
 #include <linux/i2c.h>
@@ -27,6 +28,7 @@
 
 struct rt5631_priv {
 	struct regmap *regmap;
+	struct clk *mclk;
 	int codec_version;
 	int master;
 	int sysclk;
@@ -1536,10 +1538,19 @@ static int rt5631_set_bias_level(struct snd_soc_component *component,
 {
 	struct rt5631_priv *rt5631 = snd_soc_component_get_drvdata(component);
 	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
+	int ret;
 
 	switch (level) {
-	case SND_SOC_BIAS_ON:
 	case SND_SOC_BIAS_PREPARE:
+		if (snd_soc_dapm_get_bias_level(dapm) == SND_SOC_BIAS_ON) {
+			clk_disable_unprepare(rt5631->mclk);
+		} else {
+			ret = clk_prepare_enable(rt5631->mclk);
+			if (ret)
+				return ret;
+		}
+		fallthrough;
+	case SND_SOC_BIAS_ON:
 		snd_soc_component_update_bits(component, RT5631_PWR_MANAG_ADD2,
 			RT5631_PWR_MICBIAS1_VOL | RT5631_PWR_MICBIAS2_VOL,
 			RT5631_PWR_MICBIAS1_VOL | RT5631_PWR_MICBIAS2_VOL);
@@ -1579,6 +1590,10 @@ static int rt5631_probe(struct snd_soc_component *component)
 	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	unsigned int val;
 
+	rt5631->mclk = devm_clk_get_optional(component->dev, "mclk");
+	if (IS_ERR(rt5631->mclk))
+		return PTR_ERR(rt5631->mclk);
+
 	val = rt5631_read_index(component, RT5631_ADDA_MIXER_INTL_REG3);
 	if (val & 0x0002)
 		rt5631->codec_version = 1;
-- 
2.43.0

