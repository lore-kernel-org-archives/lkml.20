Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C41BA35E943
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 05:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788846816; cv=none; b=O6JJ7BkleNPgm87nXKr5kZ7z9wdARDCtQGx0pxxJVemfIC/yiE71WiwyTs1OvoLZeBng94EU7pJARNU3HEKnXfQPA+tFNoTYh9dqD9QeXun+NG8AtI9CKD4rf72ZWkXDbr8I/Q+GDtddciQPqRCU+mqvaxA/5/ix87qXx3Aipkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788846816; c=relaxed/simple;
	bh=JGJBLmB5YEOfw+2Ir+WBMhYBBkRwnqec5SN+QsKeXMs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AFj75VV9hOitN75kZzxphHEYaHNlwnBq9UPoQKenaUTgnJnD2d5pNqnUWzE2U4Ej8VgIPgkRXb6LV4M6O6P8CJzVAf24fW6qMor6KhIElbq32ft8uLBN5Z9tppmu1263TAxmLfSuFtgDTmNYulRITONIMLNCyO7oWpH9rxhA6kI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gyvqn73I; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gyvqn73I"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-39647aa9d52so4016203a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 22:53:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788846814; x=1789451614; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=t0p68XCi/3n37Yvx4lo5DP9CDnr6N0Hgv4ZYSp2PWaQ=;
        b=gyvqn73I8QJOCVxVAXS5ZA6Ftl9mONJSC1yX/071nTXJTJUY98DO6aK0LRo+7gv2++
         Yvcd+0ZUIiySti62b0eorskJz8wPTkrX+Vk21fKozgxPzK9qjq1ywc0/39rQvje3pNLw
         KfMqa8nU5LnfReuLCosFnfIj6tk1oMA7DKGx7lcs0BZ1OrYLqnso3vfIN+Abt5N+v5HZ
         Hwyd2vi67/bWl8iZttj0f6SfnPBjbE69uv7rwslyRf6DYtaLF+FTuksGsHrwEf43SePm
         fMXlX/B4R4xkoUoXofynfFGp/9BaVe+DBcmAX9/ai2reNGN4BbJLU6XYZZLm+WvRBxEi
         ppng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788846814; x=1789451614;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t0p68XCi/3n37Yvx4lo5DP9CDnr6N0Hgv4ZYSp2PWaQ=;
        b=bzNglvSM6KIsVjH6ixQVZGtH7bEB+xatGuAwnNjA/i2Ooo+NEkDZCO3cIfQEaWPIxZ
         0krrUAQse5lT1rp56O8+Z4RfREwI0ZKs6I8mk1J6nv4E1BrnXdDIuboVmPJQrTgdiEI0
         fpE3g/oKnphrdWu/9Ar5Jt04w3VMthFce5gNq1wBo3iavHa5zRveJRNmsHTBRpRZ8MOj
         j7z4arZmeJ6yL/2aJew9ASl8YUJS6puhetvi6tk+TkU2eX9kvgtGFOhi9B6M5fGN7xiB
         8mWjK3/03ZS+kSwGxwnMKAnCux+yUQaJADuWEwmA0qH3obMYGJfhAMkb+CExO7WQyO8m
         mHVQ==
X-Forwarded-Encrypted: i=1; AKwUvBxICsGCFydP5VwphIUIYHiGkfT8SKXPfSQeKDfmiRbBMoF2O3MhC7tApfBjB7o950DVo07IWjrZpbIVGgk=@vger.kernel.org
X-Gm-Message-State: AFuF++lfaDnMhyh8Kwx07zt79IJ93Os3lJTG7dBVM/Y2YpG4LLXpjVbf
	ohtnkJHV8d04AzXPtI6UsGhySyI4RnLmHCci0aa43QxHAG5Ek0/hVS7KY0wKSCkJ38I=
X-Gm-Gg: AYBFou1ZwMAJ+6EVOLxvgvXqjXy3PLFSRePCXMZRAPFoX5mYRUbYosUi1lLlvh2PfsO
	dcG7GHtF4CN8PPAoIdghS6G8BfFfrLwrBpw0kwrWPc2d5LoOKpQqnwdmyArxQkiAX23vp1WJbzo
	thttg23Uymf5GfhT/e4gw51/+8j8eaqGXGI80HuzCRVhIwV4Qbj7SnFna2Gp5Z/Tx7Vv+VolZAs
	Bucg1Z/TKG/+zvPwL9LMl7PHbnfkXCnyapfQxwQoV1ScUVdDaYGZB/qvhGh7ej4e5eHgziZTH9W
	gTAxR+yhq0GLmE6aIVWVqy7womviSQgaFFgsDaFgDqzOmdL5EzV2JQQcg1fnUtVzzA+KjB68lWV
	itsZrcMiBs9DTZi3mWuGNTAs0So5Ao7KuLRdYJwKfyRRovMhmmLpeLpfbtccx9DsWB5f58IhTt1
	s0WdSNskic3MWT0gvE3siOV+KbexOOJf8/28ru2SW3g8u9A/z3XbCoZko2YW2e7qsn3v8UwrRC1
	yTb1BgC1401TQ==
X-Received: by 2002:a17:90a:e183:b0:37f:e5b1:ec4b with SMTP id 98e67ed59e1d1-39b07f305admr35724680a91.5.1788846814013;
        Mon, 07 Sep 2026 22:53:34 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14340a69666sm11957635c88.9.2026.09.07.22.53.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 22:53:33 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	patches@opensource.cirrus.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] ASoC: codecs: fix typos in comments
Date: Tue,  8 Sep 2026 11:23:28 +0530
Message-ID: <20260908055328.22099-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
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

Changes since v2:
 - sent on its own instead of as part of a cirrus series.  Mark Brown
   asked for patches touching different subsystems not to be grouped into
   one series when there is no dependency between them.

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

