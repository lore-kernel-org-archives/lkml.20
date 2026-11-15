Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794732243;
	b=BJHOlVruDhAfWItAOqVW5YwaRmUabElGvSvMcFBS9nvx+V+urngNSc055KSz4DXnyb8T
	 2cEbJP7fxxQtSs9u1In/A1MNQZq1hyxV+mM/iQhFbuVlT3kQBcWfQ8+j9bKQOvjdzhdXi
	 nP+yrSDOjIfNxBRnglc+sd0SFXvxlnvsdQzmW2yYiOI21LjyES7MPcH/iGCwpHweeGZjZ
	 N0cVA7poqmdc2MJT6x2loq+vcXh3ddVy8KL8FDGi3YZOjqRYj5+EseFl+/QM29VNWLe7H
	 zrENGbz7WZWDbB6keqvq7rkSKJXZiwyFB0K/+miV/7sJIY6AOVF1liNO+3UGDeIBQCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794732243;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=k3pKKll9Zt00f038xEIgnuDfHiu+C5SaRqan6FZGPzU=;
	b=2CdBMMz3f6TND0hk2ic53svGfHsdpNVrw4vRvcirq+K/8mQHxKNgSAxUT+KH2ow12LnJ
	 8fV5JD4CyagzRVOZHuq4ylwEno9bE8Eah2uzHz29rzxlN9zuy/OSg8ykPnYHDK7D3kyng
	 gS2X8pRzlWMxARF4aKE5nTkmXy5k+hBX4Z/myAyN909N6uplNnYRes5LEzg91FSfe5+Ab
	 jTQIkBAWoMgZEt6HzNa4CtolGlct0iL+8WuFq+k9uqtW73O2hv7im4mRHR/YfTdlIgsUg
	 snpcQDZO1olWQJDKYM+e1xaoDNw5YlbqByr9DbnVkgOf9aPVSfnxc8JhDiX058/IE7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="fWJUg/PA";
	arc=none smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC2C9606A336
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 08:44:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC2C9606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fWJUg/PA
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c50ac25cdd4so188487566b.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 00:44:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794732241; x=1795337041; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k3pKKll9Zt00f038xEIgnuDfHiu+C5SaRqan6FZGPzU=;
        b=fWJUg/PAS41p4lEVsfrk5bJMI7Eqq2hDoLXIegImlqHI4Dh9jhVu2kYa5EHs/bMi3b
         z7/vK0T0V05W2xSVtMRY1jGSanQ/7sqNdJSehWcwkxSwb2k3k1nMp0pOLRubYMeKj32a
         /vZTeeVpZetoJzu4NN0kJpqX+1A0KyNlbQAmNMxkBdmzyPdf0e72iJ7hwgMa4nY0b16V
         froeoto3eafmzDofrN5ez3W3uGx9cz5rSNCm3O5w4rD11XNz61eza/zPL+MNFX17XsfI
         O5Gfm7flfy5J/yCZVgYTiXgNzaevAwnGNwz2qe0y6GnbUTuXwM6plIiz9KD/Hn3hJ1YQ
         lzKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794732241; x=1795337041;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=k3pKKll9Zt00f038xEIgnuDfHiu+C5SaRqan6FZGPzU=;
        b=GFj277FBaW+BPkDRn025F/Wy7VCAxy7SFW7Yl5pd04eCq5e7E3GE/izxSqsEg2AYfy
         vu+XpHGyT5M4WBFWjgbIdw2KCusOO4bwKBDKTW+FQBN2XT243tY8B0DEfuCY//AC4zTq
         Js6A+MHLdYmjfEmOpZEHrGVVSxpXB8iRhTxQk0Cs84MMUToAr5TZmDzQ7YwBfMzoG4FI
         2RqVUjjFliJIP2KBtAAyyy+JWqtvzcGK1TytOyBrAerT+2mfNpC92HqKALDmlrkb4k/j
         aHwwvjzJhhys5S3rplclT6I0lZ64UZ2dCzONInGS6Z4Wr6osenYNRFDTiblDIrR0mAxs
         nvHw==
X-Forwarded-Encrypted: i=1; AL+hErGP3y2quyGRAiDMScOdeu84bPVjozuLDOZPhOYpncaoSdxzjUveFiH2d4A5tRfoc/YFHdU/U0SYy7KMq8s=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ko9EOd7TsRstMOjeUg9hhJgXMpB7TzRWG2Rf74lxQ69a0//Cz
	YqCtaBAAoFfMKwuGy1zvHKLyT7GHV3iN57nTs3RDzsD/GWZxNsCWB8FW
X-Gm-Gg: AYBFou10HrQ1XVEhQ4Yt9U9ZLrO/epIj3hjB5qvQFuD9/1IySNqS1iUHNyJAfSp9vDI
	Z1zUXRNIE4Ckta0utT83f0w/1DLGId9BO7mOwtKJW12n8fbsfrYqkLsJcfntuzkrFnIlb98EuP5
	Lf87Tg2TcMnIq7X8gwWdYC1VGBUWUZYLOMKXR7tiexld/RYB62BDChDbrd+6/R9FLCfswccYiPF
	mc4mPBSMkUzc2Os/IeEfKqGpoQJtX+HyAljW5iMOMapEnKd/ilqtqqVmzjUwIy+a2RwlhkrZeMJ
	XttHyDHtcj1bdGjmAivGmCGgLirEo9PdTsS+uE63fXaziPVm5ki0XuKDV7oWIWtWzthApA47Slt
	0Bx+2deJie9y0HVS5QKzH3gG3ml0vbQQh9B2SiPpPx3x81xj0nYQKHOEa4HzzlYONhqtiLTzZhu
	rL1JEtnyQ2vhOfCFAGoyGfn4sfGVaJJq8/LNEJOt0Wm63S8+aIi5/F/vrHjOO8ox7EbugYH1YHf
	lEtZr3HZchXcuqIiRs2ppNL64WbZf5/cyOL3qwa7pZdW9+rS7SEdYqcKyZaqa6k63RAPsgnPj/u
	PHgHzrSxoN1bx0cXhj+J8RR+nRVU57WJoN5BzpwdSrNhcdVA2ax7UU0wc0EuqNfOdnFWawKHbRj
	GUb6C2GeIwQ==
X-Received: by 2002:a17:907:d86:b0:c50:4b6e:329 with SMTP id a640c23a62f3a-c5096372173mr567826466b.15.1794732241262;
        Sun, 15 Nov 2026 00:44:01 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b979e9sm288937866b.85.2026.11.15.00.44.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 00:44:00 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Griffin Kroah-Hartman <griffin@kroah.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/2] leds: lm3533: Support getting LED sources from DT
Date: Sun, 15 Nov 2026 10:43:47 +0200
Message-ID: <20261115084347.70592-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261115084347.70592-1-clamor95@gmail.com>
References: <20261115084347.70592-1-clamor95@gmail.com>
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

Add support for the standard `led-sources` device tree property to
configure the mapping between control banks and physical low-voltage LED
(LVLED) outputs.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/leds/leds-lm3533.c | 57 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/drivers/leds/leds-lm3533.c b/drivers/leds/leds-lm3533.c
index 7db1105bee5c2..ad8bc3751e3e5 100644
--- a/drivers/leds/leds-lm3533.c
+++ b/drivers/leds/leds-lm3533.c
@@ -26,6 +26,14 @@
 #define LM3533_ALS_CHANNEL_LV_MIN	1
 #define LM3533_ALS_CHANNEL_LV_MAX	2
 
+#define LM3533_REG_OUTPUT_CONF1			0x10
+#define   OUTPUT_CONF1_SHIFT			2
+#define   OUTPUT_LVLED_MASK			0x3
+#define   OUTPUT_CONF1_PREP(x)			(((x) << OUTPUT_CONF1_SHIFT) & 0xff)
+#define LM3533_REG_OUTPUT_CONF2			0x11
+#define   OUTPUT_CONF2_SHIFT			6
+#define   OUTPUT_CONF2_PREP(x)			(((x) >> OUTPUT_CONF2_SHIFT) & 0xff)
+
 #define LM3533_REG_CTRLBANK_BCONF_BASE		0x1b
 #define LM3533_REG_PATTERN_ENABLE		0x28
 #define LM3533_REG_PATTERN_LOW_TIME_BASE	0x71
@@ -54,6 +62,9 @@ struct lm3533_led {
 	u32 max_current;
 	u32 pwm;
 
+	int num_leds;
+	u32 leds[LM3533_LVCTRLBANK_MAX];
+
 	bool have_als;
 };
 
@@ -622,8 +633,36 @@ static const struct attribute_group *lm3533_led_attribute_groups[] = {
 
 static int lm3533_led_setup(struct lm3533_led *led)
 {
+	u32 output_cfg_shift = 0;
+	u32 output_cfg_val = 0;
+	u32 output_cfg_mask = 0;
 	int ret;
 
+	for (int i = 0; i < led->num_leds; i++) {
+		if (led->leds[i] >= LM3533_LVCTRLBANK_MAX)
+			continue;
+
+		output_cfg_shift = led->leds[i] * 2;
+		output_cfg_val |= led->id << output_cfg_shift;
+		output_cfg_mask |= OUTPUT_LVLED_MASK << output_cfg_shift;
+	}
+
+	if (led->num_leds) {
+		/* LVLED1, LVLED2 and LVLED3 */
+		ret = regmap_update_bits(led->regmap, LM3533_REG_OUTPUT_CONF1,
+					 OUTPUT_CONF1_PREP(output_cfg_mask),
+					 OUTPUT_CONF1_PREP(output_cfg_val));
+		if (ret)
+			return ret;
+
+		/* LVLED4 and LVLED5 */
+		ret = regmap_update_bits(led->regmap, LM3533_REG_OUTPUT_CONF2,
+					 OUTPUT_CONF2_PREP(output_cfg_mask),
+					 OUTPUT_CONF2_PREP(output_cfg_val));
+		if (ret)
+			return ret;
+	}
+
 	ret = lm3533_ctrlbank_set_max_current(&led->cb, led->max_current);
 	if (ret)
 		return ret;
@@ -690,6 +729,24 @@ static int lm3533_led_probe(struct platform_device *pdev)
 
 	device_property_read_u32(dev, "ti,pwm-config-mask", &led->pwm);
 
+	/*
+	 * If led-sources property is not set then either this Control Bank uses
+	 * its default LVLED or is not linked to any LVLED at all.
+	 */
+	led->num_leds = device_property_count_u32(dev, "led-sources");
+	if (led->num_leds > LM3533_LVCTRLBANK_MAX)
+		return dev_err_probe(dev, -EINVAL, "Number of LED sources exceeds max %d: %d\n",
+				     LM3533_LVCTRLBANK_MAX, led->num_leds);
+
+	if (led->num_leds < 0)
+		led->num_leds = 0;
+
+	if (led->num_leds > 0) {
+		ret = device_property_read_u32_array(dev, "led-sources", led->leds, led->num_leds);
+		if (ret)
+			return dev_err_probe(dev, ret, "Failed to get led-sources\n");
+	}
+
 	ret = lm3533_led_setup(led);
 	if (ret)
 		return ret;
-- 
2.53.0

