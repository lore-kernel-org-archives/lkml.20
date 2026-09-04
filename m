Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69E12481647
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 11:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788522568; cv=none; b=Csm5BCEts82qyWOIlMPY1wd3F+r7HgxLt+xyLh+B3ryKovLJbo1qk76nUqgoBxPMgxi581d+rr0Qi3HMlm04dNd81jNLOa3d1QpCdz69Wu8MGduPaJXNnRuH+DCdzILxWXZVwltx91q6fSzz4YejIR4cOZ7lMsnRxfpAdXvXCtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788522568; c=relaxed/simple;
	bh=Z+OuMzHypYgVVw55NzH0RaXFLMtX8AM24yOYGXMnZTc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=El/g86rgOvwcpzEa8kc3RsFtUghiN2CFHTufuEYyHDOe9bLFNVJny2FLIRvpZEtG9VpCFgZh2xttaBIgG5Uc4Ee7OGC2FkPvA/iPbSM6y3lXpxCZrXIO+WgfYxZsDSZBPmuSg4Zp9ombFvFfzbJWJ/OYZ2uC5LesaGfB6ox9nRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=smCvIjfy; arc=none smtp.client-ip=209.85.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="smCvIjfy"
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-7f4e596e393so960888a34.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 04:49:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788522566; x=1789127366; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0EWkSe3xT6wn1/eZYdxgKyM8DvnDFd+lwts1C5rXmNA=;
        b=smCvIjfyBvE4rk/GhXiWyv1K8Ce4npDIh2wKKpoBP0exJF9kapriCbcgZzCXVVIKYU
         47Q/fdO8eCubPu0taKKBSAazKGrucSAFY7CI70m9ZCaQlLlUjKpNrbdwEMhsvzaR+Rf0
         PH57h1QvkkKDmDjxFkMQ4jPUp/aCka4LE22dBSdW7t/HrTTtbgTCfpGvVcGLC95f1VKQ
         cOt+9Zw/wlQtW1+Hfd1lCvBivE765nrKQ6blqgOuQaWvhJL7Rg5pu80RaR8AqvNMtIFu
         o9N0mnG0sO0UdYRZlyMr5Y1DfllTvEe2wAItZOP881E0I8Vqf/K2xdXdIWjErDl+qa25
         TtAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788522566; x=1789127366;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0EWkSe3xT6wn1/eZYdxgKyM8DvnDFd+lwts1C5rXmNA=;
        b=FUWUoxj6tmghLZE72LHcImQAbzjZk4bdASI/QUWQoWJWtNGpsEhzwkuX3TOOJrUZ6S
         ns76W6lIJfAH6rpL/hn9c4MGnGPAEDuEca8QOUlKJtZhAiP74hW5Cz5t6Z4kRLEbwz4I
         5XT334banzNpufbz0kLTBLVokkgboaJ54JWzqvX+CLw5HS8to9vKFzZ6bQBFTWAO1Upq
         gMgZ+38h7Ds3CnJe1vIPUfEIfJ3aJB33scxsZxf21yC8lTw0o1DsxXAxRkPiwJXlTTBi
         i7BYBWENk/Schg1RVgoVRzMBhWRRCRQ0HSFjC9tgoSz2rCSDJYfoAnSZ18pRIIbD5fRm
         SvHA==
X-Gm-Message-State: AFuF++mV8fgXctDtnMkL4BxPQ/WYp80569SJFmvtMxnGAQQBM+NO1CkW
	k7+KNZQg20qilNZIGT7Fn8Gx8mP86zdNsmAEEsdbFqioWr56DixjGpuo
X-Gm-Gg: AYBFou0XBZq0r41ItEjx5Cwc6e2Ff4wssPyDAA+mKZDzRfJYr70z3vzKsvN9HW+3a1l
	mUE9VaALClY6p4Uqmo/zslhGKVM8lgYHWUdM5P/HPRk3cVTuSwWkW44IMXEzd1j+zzx95D+J8XV
	Z4cXVVTFDJEv01odUze+zb8sTR1wHsz/Ete0m5ItMIl36YlHCR9moEGiTBFm0At2WYwH+vLqt3P
	MFTjjrAjCBZESIA8aD2etjZQdN5Ck0x77h9I1jdx1SGeB1dEGl4n6z3C0SM79bXwF6gC9rwETni
	ZfjHk+Oh0H9e9CnYWCR6mJufKiNY8jAIsmLOY0myzyg3e7c8J/hIJAonn0+xD7lp/LiOllikQWU
	xcH+nlzPpQIuS+k3+iwAU7s+j0uqV0qgiCZMgxlXHyFd5+tw+uBcoUiPzKdLtKDnYGQ0eCjXcH3
	fYuSSo9KFIrEplucTaORI1VZTe2YBqrZE/EsVKonhNyPArJSrRNYf6z1tNineRa5HFQmhf4lAyF
	Kw31l1efIbB6Ts=
X-Received: by 2002:a05:6820:4cc8:b0:6aa:de29:651 with SMTP id 006d021491bc7-6b6fbcd091cmr4246771eaf.16.1788522566129;
        Fri, 04 Sep 2026 04:49:26 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b6036fcsm6723317eec.20.2026.09.04.04.49.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 04:49:25 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org
Subject: [PATCH 1/3] ASoC: codecs: fix typos in comments
Date: Fri,  4 Sep 2026 17:19:12 +0530
Message-ID: <20260904114917.28603-2-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260904114917.28603-1-hemanth.selam@gmail.com>
References: <20260904114917.28603-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix typos in comments, reported by scripts/checkpatch.pl using the
misspelling list in scripts/spelling.txt.  Only touches comments, no code
changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 sound/soc/codecs/wm8962.c  | 4 ++--
 sound/soc/codecs/wm8996.c  | 2 +-
 sound/soc/codecs/wm_hubs.c | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/wm8962.c b/sound/soc/codecs/wm8962.c
index 8a9598161b35..af4716051220 100644
--- a/sound/soc/codecs/wm8962.c
+++ b/sound/soc/codecs/wm8962.c
@@ -3430,7 +3430,7 @@ static int wm8962_gpio_request(struct gpio_chip *chip, unsigned offset)
 
 	/* The WM8962 GPIOs aren't linearly numbered.  For simplicity
 	 * we export linear numbers and error out if the unsupported
-	 * ones are requsted.
+	 * ones are requested.
 	 */
 	switch (offset + 1) {
 	case 2:
@@ -3813,7 +3813,7 @@ static int wm8962_i2c_probe(struct i2c_client *i2c)
 	regmap_update_bits(wm8962->regmap, WM8962_EQ1,
 			   WM8962_EQ_SHARED_COEFF, 0);
 
-	/* Don't debouce interrupts so we don't need SYSCLK */
+	/* Don't debounce interrupts so we don't need SYSCLK */
 	regmap_update_bits(wm8962->regmap, WM8962_IRQ_DEBOUNCE,
 			   WM8962_FLL_LOCK_DB | WM8962_PLL3_LOCK_DB |
 			   WM8962_PLL2_LOCK_DB | WM8962_TEMP_SHUT_DB,
diff --git a/sound/soc/codecs/wm8996.c b/sound/soc/codecs/wm8996.c
index dface555f928..e7a20ce39940 100644
--- a/sound/soc/codecs/wm8996.c
+++ b/sound/soc/codecs/wm8996.c
@@ -2106,7 +2106,7 @@ static int wm8996_set_fll(struct snd_soc_component *component, int fll_id, int s
 	if (i2c->irq)
 		timeout *= 10;
 	else
-		/* ensure timeout of atleast 1 jiffies */
+		/* ensure timeout of at least 1 jiffies */
 		timeout = (timeout/2) ? : 1;
 
 	for (retry = 0; retry < 10; retry++) {
diff --git a/sound/soc/codecs/wm_hubs.c b/sound/soc/codecs/wm_hubs.c
index f80dfc488e3c..019940589e51 100644
--- a/sound/soc/codecs/wm_hubs.c
+++ b/sound/soc/codecs/wm_hubs.c
@@ -338,7 +338,7 @@ static int wm8993_put_dc_servo(struct snd_kcontrol *kcontrol,
 	ret = snd_soc_put_volsw(kcontrol, ucontrol);
 
 	/* If we're applying an offset correction then updating the
-	 * callibration would be likely to introduce further offsets. */
+	 * calibration would be likely to introduce further offsets. */
 	if (hubs->dcs_codes_l || hubs->dcs_codes_r || hubs->no_series_update)
 		return ret;
 
-- 
2.48.1

