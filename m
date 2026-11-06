Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793943586;
	b=f27YU+U9JavadsnPOf/i2XlVnNo2EBqem4qFB7VFvW00BaLCFC+ajJeUiERYmcOGfxq0
	 Uw8EVNhPagkfFp9mDXSb54cOJoEt4BvhOLBu114AD0TmTYfDFfTljSpEoU/0rxrmdoG44
	 +XRndHZUKbidWwjEbuVWKbGu0fZOhbGe9zmRERHcN4uqpitiQumXgOhA8qmd5QVGSdKWB
	 RDmsif3Z/Pz3qLUTkDQAcQSYVIZciy/3DqQhcstdq9+TI0UlZuAtc3v2JdgTSYyOIcVJV
	 le7WAmshk2wPkmq570WSIpXeITgyIr3UI2n9f5Q2nfdMl8G36W4SqtR7YunDCqSdt3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793943586;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=i0xp37LpmrAlgRcxvQDad9Lq/cKsDvG5Q5zwfdyzMEU=;
	b=TW6xrodcPVpOZQkxPbcYzg4/ZrNr5QZh+o/qo+dTrJYrM7nZFSlkk7caHo4JYJn+igRe
	 dSoXQVbDEiKpgrG/F5GVpFxG+HHElffYbzGCOnF1GPz5+fHjokNGnExV9KQP8mU95SpWo
	 KAJT0F7F/53m+mlq+yGt+i9CxGarSALyKaZ1FXs3b8x1W90c6VlPtfMRJtHyTs3kRCygi
	 OjXWauGNCJYel9vIzYImSXjbhoamjhxBvBB7/diEOnkA8gbypnQX2gyr1P/cL3hyt9DSK
	 e/2sT5U/UaLNN6O+cqPQ8anIPj2Wkc64iuzofKmwKa8LnBW6I6hLTPUol8rD9alpHqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sgVRrgck;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18383606D823
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 05:39:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 18383606D823
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sgVRrgck
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso481857eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 21:39:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793943585; x=1794548385; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i0xp37LpmrAlgRcxvQDad9Lq/cKsDvG5Q5zwfdyzMEU=;
        b=sgVRrgckWXsX9hy51UR4KUQcjsgwq2KxWWyJOKfF+QIsRrJGIUBlo8JAf0k5Clfa5B
         W2gf56tW7nNkpIRFIAbpSEG6zXm4220vdtO9qlxieyAJY3XV6I2QyWuqHQhpjdFxiWTR
         O6E5QHtFpsiysJbPFnki+OTarhhVyEw/DU59NYaMuEVmXL13Fzwq8WS/QWKhoTCKjEIC
         Jj+zOE7OBNFdYrOPR+9S3N2JXE87rQZqHRYeDv6r4GF34hMtdANlPvpZXvbK7Lr5EKuu
         mmANsM8d3PekWKWiFy60GOhuDHJ4eA8foEDL5v29Z2UTeAmFG4V1AAJV43JpAkwB9EXQ
         GaOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793943585; x=1794548385;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i0xp37LpmrAlgRcxvQDad9Lq/cKsDvG5Q5zwfdyzMEU=;
        b=BoXV/lXMJDuez297gM4MuNBBZvGrWrj6bd89Swq3xLNQQeLCjCcqUYjHBYUOSM1Iqf
         KCRWka+AUN20mQUeuo8fs4xjNppxd+rWFzSk3SaqVx2O/PRNJ8pPstziCuTW5ck0p73H
         vZr8b8kl5lq63ywuZfAH/IreU3ets573inZGb9xdk33JA1Uq1SBqiYSx/wky2GpTJBsN
         nBEmrsdSzdzPIXKKAFLBRDOoGvrcbZJTO76oy7T1t/LcjFc1Rla3bPRlKBIe/VFpfeJl
         IFK9s2zKz5e9M8bXnbUENMpvWZOwd6Ug2FVlahAxJUYZBzVKytcffZlQ5M/K/fK1+K3o
         4Ndw==
X-Forwarded-Encrypted: i=1; AKwUvBy0fnPQ1XRU5yPlTagZrp4hc+cWHDrOBngYs7p92+Rb1gbpgwOxuRD0N72q/IuWpOgSDrSLZmQ9FNyJowQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/+ywZpMrGt1HdeN4YATQGLu10anj3Gl4INtHSfZwtryEFapFkO
	/690PsaH24/v0hy7yhinV7CDcsH6XuYPKt4bnGrmZQHTFavHiUsW2Ydn
X-Gm-Gg: AYBFou3sgOYorHBitxdyOHhCc+EDrMnjtDMAedHVQQL+f4QfwKYSMuHZg7RRDg+a24Z
	Lh5HlmGXTlh9EUIv4YHWUvW63WeYexElL39ypTDwJarZpkz0nSBp+L9vvhV/PoT+pjYIQQF6aOM
	L56cXGTYpEhoJcp/0V0ce77ysg8b1NREl/JZaJxKXFweP4VZP2KkqWcwqJW28qo5Tt20+RACRrr
	hI1aDhMUl33m6yxN9JtLSjUVG45QDAEKm5ZBxWxsI5Fd9Psi8B5mhgOFMWa70aVaqIYkzfrbUW2
	yH5+byvykRQqREgBfU4qTMUszi3Is47XgUnQwVGzM36dfflhEnKcboBi0WH1vgKrMUvygl67iaQ
	b+xTKkSZ5V+oMvQrEFd51UE19v3GIOngJLhDFSqZBcPDHyeZP40mP+qCz2BnvzUVdXr7AFr2PLw
	8pHZYClCE6oKAa7cKpCVFkRRLlqzASETYTVQyU2l5abNBenZCgw7COVGCddm9wFxTGtM2gu+O8l
	daavTEZRXSti4r6yE5OIwAwoNhjlemcuPdP5LAz6tB24OQfzzIblTcqUVmJpcPp3tpe9nQm8ZdB
	TLDdAYlNhmmGWPtBoTUECXhRFra4Lfl0uMrQUh1dwybXnlKn+xXcMXQRCO//lJ5FtGYtyuUR9ia
	W7RMqWncpAZu0VZSghg==
X-Received: by 2002:a05:693c:8843:b0:36e:58f3:6f0e with SMTP id 5a478bee46e88-36f72cc191fmr2106289eec.5.1793943585023;
        Thu, 05 Nov 2026 21:39:45 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:64e:8358:c9cb:c17b])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa651e6b1sm6126445eec.3.2026.11.05.21.39.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 21:39:44 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Thu, 05 Nov 2026 21:39:35 -0800
Subject: [PATCH 4/4] ASoC: arizona: clean up coding style and formatting
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-arizona-asoc-v1-4-25ec7338446e@gmail.com>
References: <20261105-arizona-asoc-v1-0-25ec7338446e@gmail.com>
In-Reply-To: <20261105-arizona-asoc-v1-0-25ec7338446e@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 David Rhodes <david.rhodes@cirrus.com>, Lee Jones <lee@kernel.org>
Cc: patches@opensource.cirrus.com, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, mfd@lists.linux.dev
X-Mailer: b4 0.17-dev-e56a4

Clean up minor coding style issues in the Arizona jack detection
driver, removing redundant parentheses and fixing argument continuation
alignment.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 sound/soc/codecs/arizona-jack.c | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/sound/soc/codecs/arizona-jack.c b/sound/soc/codecs/arizona-jack.c
index 737984c206a9..ba1701e79c9b 100644
--- a/sound/soc/codecs/arizona-jack.c
+++ b/sound/soc/codecs/arizona-jack.c
@@ -423,7 +423,7 @@ static int arizona_hpdet_read(struct arizona_priv *info)
 
 		/* Skip up a range, or report? */
 		if (range < ARRAY_SIZE(arizona_hpdet_c_ranges) - 1 &&
-		    (val >= arizona_hpdet_c_ranges[range].max)) {
+		    val >= arizona_hpdet_c_ranges[range].max) {
 			range++;
 			dev_dbg(arizona->dev, "Moving to HPDET range %d-%d\n",
 				arizona_hpdet_c_ranges[range].min,
@@ -436,7 +436,7 @@ static int arizona_hpdet_read(struct arizona_priv *info)
 			return -EAGAIN;
 		}
 
-		if (range && (val < arizona_hpdet_c_ranges[range].min)) {
+		if (range && val < arizona_hpdet_c_ranges[range].min) {
 			dev_dbg(arizona->dev, "Reporting range boundary %d\n",
 				arizona_hpdet_c_ranges[range].min);
 			val = arizona_hpdet_c_ranges[range].min;
@@ -833,8 +833,7 @@ static int arizona_hpdet_wait(struct arizona_priv *info)
 	int i, ret;
 
 	for (i = 0; i < ARIZONA_HPDET_WAIT_COUNT; i++) {
-		ret = regmap_read(arizona->regmap, ARIZONA_HEADPHONE_DETECT_2,
-				&val);
+		ret = regmap_read(arizona->regmap, ARIZONA_HEADPHONE_DETECT_2, &val);
 		if (ret) {
 			dev_err(arizona->dev, "Failed to read HPDET state: %d\n", ret);
 			return ret;
@@ -1139,7 +1138,7 @@ int arizona_jack_codec_dev_probe(struct arizona_priv *info, struct device *dev)
 
 	if (arizona->pdata.gpsw > 0)
 		regmap_update_bits(arizona->regmap, ARIZONA_GP_SWITCH_1,
-				ARIZONA_SW1_MODE_MASK, arizona->pdata.gpsw);
+				   ARIZONA_SW1_MODE_MASK, arizona->pdata.gpsw);
 
 	if (info->micd_modes[0].gpio)
 		mode = GPIOD_OUT_HIGH;
@@ -1151,9 +1150,7 @@ int arizona_jack_codec_dev_probe(struct arizona_priv *info, struct device *dev)
 	 * will reside, but if we devm against that the GPIO
 	 * will not be freed if the extcon driver is unloaded.
 	 */
-	info->micd_pol_gpio = gpiod_get_optional(arizona->dev,
-						 "wlf,micd-pol",
-						 mode);
+	info->micd_pol_gpio = gpiod_get_optional(arizona->dev, "wlf,micd-pol", mode);
 	if (IS_ERR(info->micd_pol_gpio)) {
 		ret = PTR_ERR(info->micd_pol_gpio);
 		dev_err_probe(arizona->dev, ret, "getting microphone polarity GPIO\n");
@@ -1185,13 +1182,13 @@ static int arizona_jack_enable_jack_detect(struct arizona_priv *info,
 		regmap_update_bits(arizona->regmap, ARIZONA_MIC_DETECT_1,
 				   ARIZONA_MICD_BIAS_STARTTIME_MASK,
 				   arizona->pdata.micd_bias_start_time
-				   << ARIZONA_MICD_BIAS_STARTTIME_SHIFT);
+					<< ARIZONA_MICD_BIAS_STARTTIME_SHIFT);
 
 	if (arizona->pdata.micd_rate)
 		regmap_update_bits(arizona->regmap, ARIZONA_MIC_DETECT_1,
 				   ARIZONA_MICD_RATE_MASK,
 				   arizona->pdata.micd_rate
-				   << ARIZONA_MICD_RATE_SHIFT);
+					<< ARIZONA_MICD_RATE_SHIFT);
 
 	switch (arizona->pdata.micd_dbtime) {
 	case MICD_DBTIME_FOUR_READINGS:

-- 
2.56.0.506.g506a7eabc5-goog

