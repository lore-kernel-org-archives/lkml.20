Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793184123;
	b=U036h3AC2zir0gx6TxE/L5c7ImKXvy+bdbF/d21p3I/hdBJdiHWYiA0nvgdDZToMF9qA
	 MT8smEXWtCz+9NGW+O8fPnLYEunA+/p4cbeimVWpml51s9KcUlukv4ntGQ48fwx8Lskyk
	 Fz/1nW2vQ+yzQ039UBAivQVy2hxEFs6xEeyvYxFRZoo0IDkEyKG75z9asLH6NclJW3D0J
	 CqMdusFisEiepdObFnftbkErJOBp7D9GPyWKG0TNtUAuQfYpEWWmUo43DK+uayRVOU98c
	 GETo3x5VfA7Aik9mL/OS0bqmwPOdkHqnZRnYL5/ftAJMsgQ5jUXS6M9VuQCy6glej6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793184123;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=6ZIFLiITPDppon9XwsaZlsXJycxKJwC52zQPjn+czIM=;
	b=xfYN02tAOHzagbJgGqxUZmvW9ENXTfHXUiBf9bQZQ1UaoD27IqDmgVbmxLQRHXvSmABU
	 POpJBLSf8DV9S4FvZvrwrlgToOW2mXJgtpV9rZUB4frWtab55dZjUM+dEFvQRFGivn9La
	 WwmTpU3tXDV/+xUYQbXR5cI8lPgYO2Y+TrgIe+yVORQbJBOyu933VpTMHjoLow+moUGue
	 CVCYIzOv2cUDS+zFiZ/vwAYN00OnFO2hNo9eBX0G5Symd915Z22A7SBK+MamtlJAN8fem
	 brMXORfWhTDPBjUVUw8YeRIAelW/hCSLnW40LfjBoqhp9EbrXrE3enlpXPYng3Vxzyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bctOg8JQ;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D32F606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 10:42:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D32F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bctOg8JQ
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-36a0f27c9f4so1274314eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 03:42:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793184123; x=1793788923; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6ZIFLiITPDppon9XwsaZlsXJycxKJwC52zQPjn+czIM=;
        b=bctOg8JQJ2EV9/qrwFFuWtUMkZ6/IbSObGUxpLM90xJJmKy1FLqaziZWAIu07+Wh0v
         SWESaEAmAilz9hbkUIaiCRltJNJ9g4002bKPD8O52heKcQM0ry3cuJOIkMK+J2YQJwzK
         fLKfR6ybNhuWZHTQNg3LetJPChv5jgRZMkF6rbke0cZizY2Sa/TCnBapxub/i1UK4Lh/
         DgiW2wXR24WBmLiHbg4A5P1fhqjoyHKaba7lsCSZ601vj6iLsdgtBr/Jw6zV9HP7mtBd
         qa2g0izXdz8N2imUHw7NHKRlv8VCdsou4+21ll7PRBTo2sq33aetvpQd6nf7C2T547TU
         cCDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793184123; x=1793788923;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6ZIFLiITPDppon9XwsaZlsXJycxKJwC52zQPjn+czIM=;
        b=mjUIpmSsF1mmkBY6J/yIvxaKUfyD56W1mUQ2ovQXlpWHFPonSRHACgoXhSft3lAZmW
         gxvNrwLdBYRnoRpSHl5YxBQvnDAxt07WG2JJUFLkmrO5YlP2hj1h3FhfR+Dahv+Mb5yJ
         xFpm0DyT7VBa9p3ogCnfI38MzBQxeuYI8hC2nolX8mWJeIw8lvQmqkwUcdVGAKKqwFm3
         NvqidvI3TXzLfXqO8GMbdsxQBM2g/2e4QUdnwz8feE8BsthSB5ncHMsWp7r4DOkBSS7+
         A0cR0Qay0jTCcMJiOU8HcOjmqEV6Yi4hcokeCRfKZ0oCQb/g0vvjC7ks60Ik2aKaer5A
         HFbA==
X-Forwarded-Encrypted: i=1; AKwUvBzMiyRSOSwxGZieFgQo/YwE/EOlbNmyvPgz9hba1p7m9MiGPF79fu9kAsdfALTnkPgY9PkKdnHSYu6D6Lk=@vger.kernel.org
X-Gm-Message-State: AFq9FYLGVEgk5ul4j/z2fgb/wxj5BfiboTKrqSdI5fBon/ZlITNxC3iW
	t0h5lJtV1f5Z+xVXDwlzj/aJrrcP0TWz9xvVjl0mPQWNhywCFwqtPkwQ
X-Gm-Gg: AYBFou12NO40qrTz73NP31Ovb4VNigi2R4eJV7PA3VZnz1Dr9U7GmvXV3e8uPG1vyON
	fI0NBxvbegWuLQDExX5SoEkKJiB0M0nVNO+74nkCLgjbrvKpMUoz2HQjle8yhge69ix8Y0AWwn/
	bhFLK0J/1GNnwuLl31MzVqQRTGlqNU5F3LUBmPzy1qZc+Ow+kaPwzAo+HJCS85Or3tbCkWXuFyH
	IVZP4fT+Z8spjrJCqnfXaI4xUfjiYyM08ojlkamLv9aDlrscdbnyIxH3orawOMskJCXe3dNsrb+
	DGY3vKZnZ7O+4cPkM1aw5RC9P57xvhGny7LuWwJkrEm09aHbEQ5tX9a7jfwm5coWdNuyufMRFGq
	A88MipXFbAbU84ihdKu+AjGSAbvqWOKbcxbTtqR9PJE6NUhtqDVeembhTNOiL+egtrOBEpz9M9Q
	wchWeB0y1QT8ZECScPHcmwYnCPdFT8RCqFbnzjABPu65mWwKALnB0lcqVEWf0ifEfXhs7cVkYEf
	fNF9FXrhd9t1VCbVRFBCkF2EEm04lvujYX1U8/u8uw4ze4ao1B/w+RGSYzGKMvOUHI8fQXWbTBk
	cM8zrIfs6pBIxBtpAvpx8K+q6C68nm48+nTTQQUOqxKRaIMGbiwcAMk4gjG8DiCeMewuoVrWI+8
	CNIWB0lyx8QvaaG9cJyQksMfhxPlEaoVKlXRd25lTA4ksk4oBNhEmZLedwQ8i/No8+g==
X-Received: by 2002:a05:693c:20c8:10b0:36a:1e0a:accb with SMTP id 5a478bee46e88-36a203e2f43mr3129824eec.35.1793184122327;
        Wed, 28 Oct 2026 03:42:02 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a238da3e1sm7521881eec.8.2026.10.28.03.41.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 03:42:01 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Binbin Zhou <zhoubinbin@loongson.cn>,
	Binbin Zhou <zhoubb.aaron@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Yingkun Meng <mengyingkun@loongson.cn>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 1/3] ASoC: loongson: Fix IISConfig0 update in hw_params for rev 1
Date: Wed, 28 Oct 2026 17:41:36 +0700
Message-ID: <20261028104138.26973-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261028104138.26973-1-phucduc.bui@gmail.com>
References: <20261028104138.26973-1-phucduc.bui@gmail.com>
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

Changes in v2:
 - Use FIELD_PREP() for register fields as suggested by Binbin.

 sound/soc/loongson/loongson_i2s.c | 21 +++++++++++++--------
 sound/soc/loongson/loongson_i2s.h |  6 ++++++
 2 files changed, 19 insertions(+), 8 deletions(-)

diff --git a/sound/soc/loongson/loongson_i2s.c b/sound/soc/loongson/loongson_i2s.c
index da0d029c028a..aebea177e7e0 100644
--- a/sound/soc/loongson/loongson_i2s.c
+++ b/sound/soc/loongson/loongson_i2s.c
@@ -6,6 +6,7 @@
 // Author: Yingkun Meng <mengyingkun@loongson.cn>
 //
 
+#include <linux/bitfield.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/delay.h>
@@ -69,6 +70,7 @@ static int loongson_i2s_hw_params(struct snd_pcm_substream *substream,
 	u32 fs = params_rate(params);
 	u32 bclk_ratio, mclk_ratio;
 	u32 mclk_ratio_frac;
+	u32 mask;
 	u32 val = 0;
 
 	switch (i2s->rev_id) {
@@ -92,14 +94,17 @@ static int loongson_i2s_hw_params(struct snd_pcm_substream *substream,
 		mclk_ratio_frac = DIV_ROUND_CLOSEST_ULL(((u64)clk_rate << 16),
 						    sysclk) - (mclk_ratio << 16);
 
-		regmap_read(i2s->regmap, LS_I2S_CFG, &val);
-		val |= (bits << 24);
-		val |= (bclk_ratio << 8);
-		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
-			val |= (bits << 16);
-		else
-			val |= bits;
-		regmap_write(i2s->regmap, LS_I2S_CFG, val);
+		mask = LS_I2S_CFG_LR_LEN_MASK | LS_I2S_CFG_BCLK_RATIO_MASK;
+		val = FIELD_PREP(LS_I2S_CFG_LR_LEN_MASK, bits) |
+		      FIELD_PREP(LS_I2S_CFG_BCLK_RATIO_MASK, bclk_ratio);
+		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+			mask |= LS_I2S_CFG_TX_RES_DEPTH_MASK;
+			val |= FIELD_PREP(LS_I2S_CFG_TX_RES_DEPTH_MASK, bits);
+		} else {
+			mask |= LS_I2S_CFG_RX_RES_DEPTH_MASK;
+			val |= FIELD_PREP(LS_I2S_CFG_RX_RES_DEPTH_MASK, bits);
+		}
+		regmap_update_bits(i2s->regmap, LS_I2S_CFG, mask, val);
 
 		val = (mclk_ratio_frac << 16) | mclk_ratio;
 		regmap_write(i2s->regmap, LS_I2S_CFG1, val);
diff --git a/sound/soc/loongson/loongson_i2s.h b/sound/soc/loongson/loongson_i2s.h
index 8b4603c876c5..457d90e3d5b6 100644
--- a/sound/soc/loongson/loongson_i2s.h
+++ b/sound/soc/loongson/loongson_i2s.h
@@ -40,6 +40,12 @@
 #define I2S_CTRL_RX_INT_EN	BIT(1)  /* RX interrupt enable */
 #define I2S_CTRL_TX_INT_EN	BIT(0)  /* TX interrupt enable */
 
+/* Loongson I2S Config Register */
+#define LS_I2S_CFG_LR_LEN_MASK		GENMASK(31, 24)
+#define LS_I2S_CFG_TX_RES_DEPTH_MASK	GENMASK(23, 16)
+#define LS_I2S_CFG_BCLK_RATIO_MASK	GENMASK(15, 8)
+#define LS_I2S_CFG_RX_RES_DEPTH_MASK	GENMASK(7, 0)		/* rev 1 */
+
 #define LS_I2S_DRVNAME		"loongson-i2s"
 
 struct loongson_idma_data {
-- 
2.43.0

