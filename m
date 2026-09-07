Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F266B370D49
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 04:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788756824; cv=none; b=PkGd/1eXpEPq6NO6q49aHNJflkw+5a7sA6VPuFfvaRc39HCJ7srcZHzHPzAB2/G+fFg9D4RwtMzF+PoNaG9TOH08nTsEOnFhgN3TSNPnoOg8Nj9ysx8qe5RT9lcNROebGIiiDDYUapujtYcKPVV0ZDcmQBklpYR8Fpvp9Fm/vwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788756824; c=relaxed/simple;
	bh=3ZDHbcjvXPahuAiUxoNp1koMzr+ZHdLLfaaFqA7LTqo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=peef4ojb478QJvtw9h7WmTrL9uvi3KGbhNZEiYKDkdOnea2rLzpoQly+zH2Ej2sNpOcr/kGBxvm+RveR4GHgqp9wOhyRDP8kKpHE2KR5LM/G0QCuLwY2xY7LnI0KNxW17jdLrqn8LJuQ/avdiPW34jXY94dwCWsUmnVthI5AQOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D6/EIQrC; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D6/EIQrC"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cc1c9879395so2094597a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 21:53:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788756822; x=1789361622; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nxdTIH+4Wdge5UZJZ86PBV+TjYqDoYHr8IUVyTFJUa0=;
        b=D6/EIQrCulWjlOQ+3bvGGdqjcIYbk4OG0Vm+oX6afh99/z1pZNzyJm8xtTz3x37lEq
         5nnAuEXq7IOthIUwOmk0QtF19HEzSkBeno2EqPq8myxWLYgS2clpaLjmNFf4MeOzcx7A
         cC8mvfdZhmtfKbh5k4QneBEnMsHnFO3gZptUW2VKrXgasMAGscshdhO/UxFKwBcNs+2l
         u9YYj93ZNR+tGmhEH9TxlbQE63YAag1gAjSzINpiA4U9aSCHSu736TYpzaOtmzXjM3mh
         dNXyjDMrRPlou4Plq3F/MyFMtuPyohPFl2UvUMMwM+HZuhwhQcoJZc+zcPhOluRiOwOf
         oX6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788756822; x=1789361622;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nxdTIH+4Wdge5UZJZ86PBV+TjYqDoYHr8IUVyTFJUa0=;
        b=adeR0hp3gdFs6vOZzuntopZDMcmRLkYFL0Y+zGK7ZyJ1vqYfSItrChgrD7xvJuMgQt
         jqSh8LSP3hybjG4UcigMlD+nwrO315ANwEPVq1IgZpc3BLXCqfaZqussNOnmKi5k0fUJ
         0C81nxiimv++KRF4JXVJ0rb1DBhPQHLJW5uuJcFhaIoGhhv6Bo/nxtk/IytvZi61BgY8
         s3wTdipng6L1KPtf6OqM7GwNc9VQSiMRJlViLlNwif4E2teNXHrtIH/G/uM2RcoLTla+
         80ybhTalzRb6BPyfnu0/An4Rymt2wAY5+SzDBZeW0YLydyDd5nM4QvNLv74lZ7SXkdOa
         oBOg==
X-Forwarded-Encrypted: i=1; AKwUvByvMQwFhGPVn5bKbeBW61kJxKTP66EGj7P26VGjrb8IB3xEmgaCBbFTG6DX5SKy9YY555mRqUJOkO72DYw=@vger.kernel.org
X-Gm-Message-State: AFuF++mXcy0Eui/HcepsM22QSDVWj5jnybQHuDt1ma9ahJnVCMatSTAu
	eTiE3SitkxD3vX8wiEpQe+OoGr1NaT23ir40Zh7Kx9EW11WAEZfiWUMW
X-Gm-Gg: AYBFou10lFEQi23GtUH0eRoHhxmwXS28uufh7qXZxrd/yMWiQQSJxnx1S/Br+DzlQUl
	P9gjqTSLQKmqlQkbt5gJ9xULucelBDLjtl6SRm0FB8GKQ7OvtXOdQo8vttBVRLv69xtIpB5eSUn
	GloLM/MUTufISUGGQ4LjWDYLgWp4xLze0GOlSFuQiHMM7K57OVVANGLyBbLhkFSQeqg6bwwJ92O
	V2D7MhhoWy/GKco+XGM++uFBWKDYQEXDovCWC+Ob5z/gR/UOE+pkL5XPRbqzgPOD8iYco4hyn33
	2rM1chzwElasv5dwbF3flJiTw3BCsnSHpedhJlMkCEii9S58/QnrkaS5AlrfzHUB0xLs8u3F7ux
	U64lEWvP2Tl4J1PP1t2ZYbMi02O1eDPDnXxgPEn5slnHyA9JfZTifYzTPpss8HQZIr68yxnmb+t
	FZajLm16aYRXflwpxl7h+p+e0Jp4pO66KTmZ8QUn7XdhkULmed2Jn64sCJx2ISQCQ9RGJ10AtmP
	0LlLex5pcoc+BFH/HZ2hUS2
X-Received: by 2002:a05:6a21:648f:b0:3d1:5c01:e6cc with SMTP id adf61e73a8af0-3da39f7bf83mr30536778637.10.1788756822277;
        Sun, 06 Sep 2026 21:53:42 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339af25062sm37923958eec.16.2026.09.06.21.53.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 21:53:41 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Simon Trimmer <simont@opensource.cirrus.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Lee Jones <lee@kernel.org>
Cc: patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mfd@lists.linux.dev
Subject: [PATCH v2 1/3] ASoC: codecs: fix typos in comments
Date: Mon,  7 Sep 2026 10:23:29 +0530
Message-ID: <20260907045331.16932-2-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260907045331.16932-1-hemanth.selam@gmail.com>
References: <20260907045331.16932-1-hemanth.selam@gmail.com>
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
 
