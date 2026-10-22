Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792658469;
	b=HKxSYBZDO4Vc/aX0b9d38yfowuQqB/FPijvFm9Ws8dYxmYET1qngcJubF9+9AMjZu4Ta
	 Yr10Z7whksITrPlLiPaePsP/qC+nq/unXaLJ2tnmFRXIlkRd8SefldsMCAE8p7KrIvwMS
	 gh0Qt8MF79jHZs9hqsUmoIWKZCi1d1Usyf08XEP36lWbFCjAFwRlBeMwSawadRPJ/CF9v
	 pAfsweBTRhIatwV58OAf7xKRCcmAqWOAf/SijR/GHe9PA1olxl+h07EoHM3jPcWP0kbyt
	 rrqW8DpzfHdIO6Svn1MtZguuLOoiVf4J//pfDhInPaNYrDMdp9mrcr3yL2iNdrUXxBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792658469;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=XnurLZm3rvLf63546fN/45BouE51Oz02YVjfq0TngVw=;
	b=cziE85YmmS4anbVJW4MPogNo3jtbbFly8vNUh8o5mJxij1GfW3XryGy6kgpwIoOOJAp+
	 IVRB8QORa59+rJ+94U1hK23yRwHndR962N+oIgBnACo5JltFum3v5KD8lLWaOd6zdsEwm
	 zh3Hrf5Vq6xueXytbHoTvAXRK7Tan742gUYTFsDWlSwG8H1DGM7Azk3SlR7NIp+o5RqBU
	 MBkQOpQAJMyATdoG1bhTkj0ValrWxswJybB6rf09P+DmCdYz0wVI80eAaRYjeyqxL4D+f
	 7/HCGHiXRjtZKO0X7CxgGxndvmkFVgNKEKRyPFMJdimTQTgxcliQuVdfuci3ZlWTAfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=dbl9vOLN;
	arc=none smtp.remote-ip=209.85.216.47
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4F24606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 08:41:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4F24606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=dbl9vOLN
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3acc96a256dso1072113a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 01:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792658468; x=1793263268; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XnurLZm3rvLf63546fN/45BouE51Oz02YVjfq0TngVw=;
        b=dbl9vOLNLKvok7ElsiI2sihRxm5IEWWtwp/RvueoagpftwYPru5c03poSjjNzvvrTN
         lPKu+9+b9FSJ0MV5e+YPNCwo5UYZUBbqQRsExDfNEYWZLQiV5S2G3ZlXvDIRosY5qxqG
         BgMIx99jlOd0Tl23dAdKOki6qgIbzwcPdjdCQDXyK5Z9klNP60phSiIiCoGtQp+V3IbG
         1S6MWA9rxHqd3vTT5Kp39A3fNGtLnPNyJTvhp6mEnQyWQhM0M29LDZ5ShBTgxQfioXsi
         0/J1G2zmns/MUqAErSS0b+34NwqGdnhWvKcQdSqJ1xplndIVx15NGkH+jm1FJVlLH33v
         qFeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792658468; x=1793263268;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XnurLZm3rvLf63546fN/45BouE51Oz02YVjfq0TngVw=;
        b=eV+D7ORWUpDDkKQTRzhU13MQLzVUKAg6KDj3yz91a2W+RNKst6X/sw/5H9Ji1XouUr
         +eNzu5qQpj5LQHbIvY9XBKE6xvBqxdD7CxNcdmv/3DL92QpOEerl6xEPav2yh0okL39o
         IDd9X8g5VgYb2zDtdT7wB/R6OHKuhF3oOFf4Ka2/0d9O+oNJ/tzGHkgwnCnjkWeHlZwK
         b8pv79gP8UOWV6HhuXxFDisdY0MiS9hOeB8oyY0yS4f0J879XwAmhFb4DNHnkSiPMWOa
         gqJ97APM5IlforBxWlYf3OABeKFHwM7xm8M04JMOHG29I5KCKHckbfjAHQZYY8rg5L65
         43Mg==
X-Forwarded-Encrypted: i=1; AKwUvBwVikpm9aHz4pvgW8O7+CFQmOy6trDyPvM2PP5LEBBuYliRqqD5Ksc8cDwwqBzMD6KNktsHR/zCjjPUhVs=@vger.kernel.org
X-Gm-Message-State: AFq9FYKI4ww8gLa07qGixPltl/uto2+PQ+IspLM3Qs7WnIkvc0fh/mgE
	IM128rprBkkKbtnecOMzsp33y7RSbCXfKmygRWv5l+zG4UZSUZquREhx
X-Gm-Gg: AYBFou3hPy238/4/JLRiQQzH1u5sEJy38sBaxz6oGYle8fQyeMp5hUbHdwwmfocqNbU
	s9WkTKu/TATWuipna5xVpCcB86rigynZdA+TPdtMApH644IhNVsdTaHnCKnCUT4WkRiKLfMZUje
	u7TTX7mpXGZ2HmQcMMkHSqYm5lbuTYIuEAbsGDsPI/T0OwpsYidWgc+wgTdI++a1pn7GUDNZkfL
	R0kAerx9UofVNauNfPq69rasteut9CI3rAcrTmIOm+5+JOkMpqjUBhoyCRIIQWMeawfXg4vTu/Z
	+t+Iq+rca+MzGNs7QOPOmQmHC7ELaE7UHK8S4s3wJouhweLHANtEW458732duMvU731O+NUvBjs
	vOfRH2MQ6V74b1u39OKiFvnCspc4v/MftanwaLObPsq+8P7m0UJ2X1q0i7zd/nXn3+61kI4qhiD
	iVNKgj8hPDHllN32pRlQEM9KvToFEbCvsXkDwUXccjJm7VWZchHWKjvDNWDrFrapqgg2RnSlvcl
	9RcgpwgKi+gNeUxGyy9DbHZBXv2RFwIJPxNbLzshEyNJbzTGZb8Hr5UE/tAMLzQRxYowbcYB6+j
	hfrEowOC7gY+Inr0Qb3LjN2dcT8/lf2JLFdbOfhmF0wTFhZS2foVcDNxtTOBsj6XYZtbdT8=
X-Received: by 2002:a17:90b:3a43:b0:3ac:9c37:9429 with SMTP id 98e67ed59e1d1-3ad86f1b5f7mr4226272a91.52.1792658467986;
        Thu, 22 Oct 2026 01:41:07 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ada48a573fsm3340992a91.10.2026.10.22.01.41.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 01:41:07 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Binbin Zhou <zhoubinbin@loongson.cn>,
	Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Yingkun Meng <mengyingkun@loongson.cn>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [RFC PATCH 1/2] ASoC: loongson: Fix IISConfig0 update in hw_params for rev 1
Date: Thu, 22 Oct 2026 15:40:39 +0700
Message-ID: <20261022084040.31181-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261022084040.31181-1-phucduc.bui@gmail.com>
References: <20261022084040.31181-1-phucduc.bui@gmail.com>
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

From: bui duc phuc <phucduc.bui@gmail.com>

On revision 1 controllers, loongson_i2s_hw_params() reads LS_I2S_CFG
and ORs the new LR_LEN, BCLK_RATIO and RES_DEPTH values into it
without clearing the old ones.

The first stream after boot is configured correctly, but any later
stream with a different rate or sample width ends up with a mix of
old and new bits, so it may run with the wrong rate or sample width.

Use regmap_update_bits() to replace LR_LEN, BCLK_RATIO and the
RES_DEPTH field for the current direction while preserving the
other direction's RES_DEPTH field.

Fixes: d84881e06836 ("ASoC: Add support for Loongson I2S controller")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Compile-tested only, I don't have the hardware. 
A Tested-by from someone with a 2K0300, 2K2000 board would be appreciated.

The field layout follows the Loongson-2K0300 user manual (IISConfig0) [1].
 
Not sure whether concurrent playback and capture is supported on this controller. 
If it is, note that LR_LEN and BCLK_RATIO are shared, so the stream started later 
would overwrite them when the sample width or channel count differs. 
I can follow up with symmetric_channels and symmetric_sample_bits if that is 
the right fix.

[1] https://github.com/loongson-community/docs/blob/master/2K0300/2025060909243029508.%E9%BE%99%E8%8A%AF2K0300%E5%A4%84%E7%90%86%E5%99%A8%E7%94%A8%E6%88%B7%E6%89%8B%E5%86%8C_V1.01.pdf

 sound/soc/loongson/loongson_i2s.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/sound/soc/loongson/loongson_i2s.c b/sound/soc/loongson/loongson_i2s.c
index da0d029c028a..109cb61c6ddf 100644
--- a/sound/soc/loongson/loongson_i2s.c
+++ b/sound/soc/loongson/loongson_i2s.c
@@ -69,6 +69,7 @@ static int loongson_i2s_hw_params(struct snd_pcm_substream *substream,
 	u32 fs = params_rate(params);
 	u32 bclk_ratio, mclk_ratio;
 	u32 mclk_ratio_frac;
+	u32 mask;
 	u32 val = 0;
 
 	switch (i2s->rev_id) {
@@ -92,14 +93,19 @@ static int loongson_i2s_hw_params(struct snd_pcm_substream *substream,
 		mclk_ratio_frac = DIV_ROUND_CLOSEST_ULL(((u64)clk_rate << 16),
 						    sysclk) - (mclk_ratio << 16);
 
-		regmap_read(i2s->regmap, LS_I2S_CFG, &val);
-		val |= (bits << 24);
-		val |= (bclk_ratio << 8);
-		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+		/* Shared fields: LR_LEN [31:24], BCLK_RATIO [15:8] */
+		mask = GENMASK(31, 24) | GENMASK(15, 8);
+		val = (bits << 24) | (bclk_ratio << 8);
+		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+			/* TX_RES_DEPTH */
+			mask |= GENMASK(23, 16);
 			val |= (bits << 16);
-		else
+		} else {
+			/* RX_RES_DEPTH */
+			mask |= GENMASK(7, 0);
 			val |= bits;
-		regmap_write(i2s->regmap, LS_I2S_CFG, val);
+		}
+		regmap_update_bits(i2s->regmap, LS_I2S_CFG, mask, val);
 
 		val = (mclk_ratio_frac << 16) | mclk_ratio;
 		regmap_write(i2s->regmap, LS_I2S_CFG1, val);
-- 
2.43.0

