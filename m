Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EDF048F032
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 12:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791376811; cv=none; b=f17SLRejlVuY9FewQLFx3Ki9d/5db2lH9LLk7S6RKYVjkst4FLSRmswI8KGj9DXyjdJrfwJ5x0w/yfj1RTU8JW2s8FpsEKJj/3x+lYPak7gd+fbmyED2SJBjsNM2C2q1s3JcktUThnXRaBDFesxpiIV5SAg9ZBq8J4ly1dFIeBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791376811; c=relaxed/simple;
	bh=q5kb3Slwlwc0fl/bNQMM1k/M/9pq7+Hr3X7DDfLNjqc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LEkQs+4yYHoSe0LvfVq0U3o0BLvmpZrFiPhztnIcMeHMxvn0rjpLPFufswmh43eoQkJw0Wf7YRPgb9F321evRWcs2uewuRO41z4t7/hYL3AJseN8dhIdd/nSKXeioewergbAhn4cXnzx9FDzFjP4tCtxSXD/qjskwcWyAYwPAYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=syvFYw9Z; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="syvFYw9Z"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3a706146559so1499852a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 05:40:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791376800; x=1791981600; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PEY2dZJ0SUaUF0e5EfY3TFLbxPMert/9sV2HdEJuzdI=;
        b=syvFYw9ZvuALriDoaQZSQAxJnPQiHakNLvlmvI1PrTFI+RDd7QghXnIHDROdX37hv8
         nFrnaA8iCKtcjHKzYL8cEiSMoeGJgJ7WHenh5myLPXMch9HyKQDSmWdo71FgNnti2Ocu
         q8WGAuQWOL1zy9YqCxtFw4OB5+UZ2ckPe+0UhhdRuTyHGhQD9Obn1QuaRL5FXfpZlNub
         yE7zL9gWhPgKZ0SAAzg9a/akevgDuNSHOrHA8SeATw943YjChnNuNqFsNDfMAAtYkjqG
         hfHJdnVZR+f4VIY5wQL37UZIi4jt/PUbDkVoCZFlIFiwkNTsjPwMVBOLoqy+KWv37QAo
         5cSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791376800; x=1791981600;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PEY2dZJ0SUaUF0e5EfY3TFLbxPMert/9sV2HdEJuzdI=;
        b=d5trUdUz9Vvf+yA/HNCWvl3H9bUfqFpa5hrE5/eOoOBhx5y0nnpHPvWMLO9OK06M1z
         kotqTyCr/fpVp2JTI2RRGJv4rsEqXyA04pmAQQgJa14WUKGImmTyzvvp52yJmTCPihzi
         yh/acp0pLEUeqFNvvoi7Jd53DTRakzLuVMY0iWHqNU3agFP+wiFLdX5+5uciULyF7XFt
         U2F2IKFiwvdWVzfm2EflU8RX2PVrgkOCta30uAcTm8NZjztfwZ3ObzRUxN1So9k5jG8N
         O6kDScUJZ/ymrxs1V2lE42UtvEFX7EUygpbQ8WqLPDAyuhhqZy1v+fYoQYj25U+emEwd
         y/2w==
X-Forwarded-Encrypted: i=1; AKwUvBz5UWhmNBKVkzsdR73PvsuXTvgKQVGsRZcQ4VOk7kg4VQk+S/StKNODrjWzgX1ibccNDcCujGV0qO7LGS0=@vger.kernel.org
X-Gm-Message-State: AFq9FYL9XdBGMR761lDYzOzEN9XVIfvOA5d8CuxAihf8NzEy2XMA8SKs
	2QcefuZKuUB4YJ7297En8m60ciNDb2GeMuNzcg/rbXDWyXLOXJQvXAJS
X-Gm-Gg: AYBFou3pKF8ClIgDoWJuHWtT5bY8bYCXMbTl0aj1+6hDXe5EPwAkmTWttrq3XkWXeLn
	b3mF7rqR6aG+IkyiKn/DzT1g54ynAuI2S1fnlg4kXVlHbq8K2xQqMO+ycdPYVyeqi9R9dTmSMCm
	17BuXLKuu9H0AauiP7TDFdmju7i6tOviHpTQNx8QBAAySzvdxBa+YdGKgVhfKoNSgf65rxNguRc
	CZNjUoIkFTbdTnNPH0iUxgQfhW4/EqfI65suvYgEhy8aemnmj+ku5oopq8+bwqX//4M8gj3ikLj
	7U2+oL3A79WZ5nUASenlUCv3Ixo0P7MVJWCEvZfEho/DHb1datCVtyg68nIeKLyFI7LuYjjcF/A
	YtYo+SU3BiXyCmzIYpFPHod4ingtgU4QjE9IekG6Q5d6Isi43TzIs/c/J2uFNeGtYdeoTdWOVrz
	lIdhbpXO4CpKltcPt+oiWW4KJyWPfr0V0gaN1OVvt0GgjeqZ1IN4E2MLtirw0E7vN95Fbjyt0rB
	CM4PPZH1f3P9g==
X-Received: by 2002:a17:90b:3147:b0:39d:f4a8:75ef with SMTP id 98e67ed59e1d1-3a89f649784mr1968180a91.1.1791376800333;
        Wed, 07 Oct 2026 05:40:00 -0700 (PDT)
Received: from DESKTOP-NM9EKIA ([125.134.240.130])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a85436a39dsm10087459a91.9.2026.10.07.05.39.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 05:39:59 -0700 (PDT)
From: Joonhoe Kim <26rote@gmail.com>
To: srini@kernel.org,
	broonie@kernel.org,
	lgirdwood@gmail.com
Cc: perex@perex.cz,
	tiwai@suse.com,
	neil.armstrong@linaro.org,
	jonathan@marek.ca,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: codecs: wcd939x: read the SoundWire port switches per channel
Date: Wed,  7 Oct 2026 21:39:54 +0900
Message-ID: <20261007123954.1709-1-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The "HPHL/HPHR", "ADCn" and "DMICn" switches are channels of shared
SoundWire ports (ADC1-4 are channels 0-3 of the ADC_1_4 port), but
wcd939x_get_swr_port() reports a per-port flag. Once one channel of a
port is switched on, every switch on that port reads back as on:

  amixer cset name='ADC1 Switch' on   -> ADC1..ADC4 Switch all read "on"

Setting one of the others then looks like a no-op to userspace, and
"alsactl store" saves all of them as on, so a later "alsactl restore"
really enables the unused channels of the port.

Read the channel's own bit in the port's channel mask instead, drop the
now unused port_enable[] and return 0 from the put handler when the
switch does not change, as ALSA expects.

Fixes: 10f514bd172a ("ASoC: codecs: Add WCD939x Codec driver")
Link: https://lore.kernel.org/all/20251124064850.15419-6-jonathan@marek.ca/
Assisted-by: LLM
Signed-off-by: Joonhoe Kim <26rote@gmail.com>
---
Jonathan Marek posted the same read-back change in November 2025 as
part of a wcd938x/wcd939x series [1]; the discussion stayed on the wsa
patches of that series and this one was not picked up. This version also
makes the put handler report "no change", which the original did not.
wcd938x and wcd937x keep the same per-port flag.

Tested on a Lenovo TB323FU (WCD9395, two-mic capture on ADC1/ADC3).
Before: with only ADC1 switched on, ADC1-4 all read back as on, and
after "alsactl store" and "alsactl restore" the TX port's ChannelEn was
0xf during capture. With this patch: ADC1-4 read on/off/on/off and
ChannelEn is 0x5. Writing the same value again no longer sends a change
event.

[1] https://lore.kernel.org/all/20251124064850.15419-1-jonathan@marek.ca/

 sound/soc/codecs/wcd939x.c | 10 +++++++---
 sound/soc/codecs/wcd939x.h |  1 -
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/wcd939x.c b/sound/soc/codecs/wcd939x.c
index 26fe0b6313cd..2d463f062e6d 100644
--- a/sound/soc/codecs/wcd939x.c
+++ b/sound/soc/codecs/wcd939x.c
@@ -1794,8 +1794,9 @@ static int wcd939x_get_swr_port(struct snd_kcontrol *kcontrol,
 	struct wcd939x_priv *wcd939x = snd_soc_component_get_drvdata(comp);
 	struct wcd939x_sdw_priv *wcd = wcd939x->sdw_priv[mixer->shift];
 	unsigned int portidx = wcd->ch_info[mixer->reg].port_num;
+	u8 ch_mask = wcd->ch_info[mixer->reg].ch_mask;
 
-	ucontrol->value.integer.value[0] = wcd->port_enable[portidx] ? 1 : 0;
+	ucontrol->value.integer.value[0] = !!(wcd->port_config[portidx - 1].ch_mask & ch_mask);
 
 	return 0;
 }
@@ -1821,10 +1822,13 @@ static int wcd939x_set_swr_port(struct snd_kcontrol *kcontrol,
 	struct wcd939x_priv *wcd939x = snd_soc_component_get_drvdata(comp);
 	struct wcd939x_sdw_priv *wcd = wcd939x->sdw_priv[mixer->shift];
 	unsigned int portidx = wcd->ch_info[mixer->reg].port_num;
+	u8 ch_mask = wcd->ch_info[mixer->reg].ch_mask;
+	bool enable = !!ucontrol->value.integer.value[0];
 
-	wcd->port_enable[portidx] = !!ucontrol->value.integer.value[0];
+	if (enable == !!(wcd->port_config[portidx - 1].ch_mask & ch_mask))
+		return 0;
 
-	wcd939x_connect_port(wcd, portidx, mixer->reg, wcd->port_enable[portidx]);
+	wcd939x_connect_port(wcd, portidx, mixer->reg, enable);
 
 	return 1;
 }
diff --git a/sound/soc/codecs/wcd939x.h b/sound/soc/codecs/wcd939x.h
index 6bd2366587a8..dab7ef108b48 100644
--- a/sound/soc/codecs/wcd939x.h
+++ b/sound/soc/codecs/wcd939x.h
@@ -899,7 +899,6 @@ struct wcd939x_sdw_priv {
 	struct sdw_stream_runtime *sruntime;
 	struct sdw_port_config port_config[WCD939X_MAX_SWR_PORTS];
 	const struct wcd_sdw_ch_info *ch_info;
-	bool port_enable[WCD939X_MAX_SWR_CH_IDS];
 	int active_ports;
 	bool is_tx;
 	struct wcd939x_priv *wcd939x;
-- 
2.43.0

