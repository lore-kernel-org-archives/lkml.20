Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794380226;
	b=Wb63h0bjgbXifQQHU38BwzO/VmgnTEMSFGU+2hqy6Q2+5oL8P5Qlag/3AicQKrk2aCFO
	 cV6S71FmMoZXfoLTgsoTcIhc0x1RgPCWQ0dszWteK4+iQk9bMx6w710DUGQ6E9g89GTHt
	 d6bS/rzB7hyWXXUIOd0OVvoVcai0AM6Y6EHlyG2RhIzN9tzpJapaOGbKxOOWNR7dAHJV0
	 nZ1nxMVuFACzOuPwoR0RsmXRZj+WtlSzlJ9KD0cmI6+NRpZB8tkphEtyMpZZqGlnjJK/q
	 nHphFuWLomjosBAPDXOGNSEspnWcqJZT10xpuEofYne7zCoh2xB9841mwwQjs46xyLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794380226;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=zNCeLT8KqxyW0oogwzsW9qArgIaSxaBhX1ik6DX4Ezs=;
	b=nAbAiZNBYtQLCZ7kth0/lNKsE1+/OoWOLmEyy/q97HJInCHC4N+e/vYooID6oZttjDrU
	 qI4O3t4dnQ7QO1u90l1m9zPXIrHF9zYaFCEAPbi2/hMwYk6HpS9dmqmqPgK2IDCk/rzJ1
	 sW739WDhimG2SAMCxfreKZaiedkGULk1V4QVJmFlvBIe7lyONVqyRJo+SA+k5slNjIeeQ
	 a4GKahUI24lQjJbsMuzAiHh8BMpaJaR5P2TumwnbHF9mF/y1mIqs3VnUE3ypbHBEpLQDq
	 1+0TsVgfKLFvnD67iTWHzomj7wDXTC2wyCffDw3HKG7AJjw5uphVCHaZ3iTUFoS6AdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XVWRAGZQ;
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E90B8606D36D
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 06:57:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E90B8606D36D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XVWRAGZQ
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1b3b4bcbfc9so270448c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 22:57:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794380225; x=1794985025; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zNCeLT8KqxyW0oogwzsW9qArgIaSxaBhX1ik6DX4Ezs=;
        b=XVWRAGZQajjRgIxv6uo76NlpyBMEg8eYJPuSGgcX1f8L5o4eT/n8iqgtY5UzTOruM0
         xmC+rl7V8lPZoIOSfqrhSnnc/hsHZ4l98LPf4fXSfGjMvvUwTcBFCns2Jh4eMeA35Ii1
         cqfG7XB6zXVyZzIdHzr8H02yM2BSxIllDYKV1LR427pvpW37diM25fFKdqtP46RDOfHl
         EruQML+jBpBZfHzM0gjxM363/p0AiBAjfUnGMbLzPRpjYf+2SMOSsIJq/d5CptB689HJ
         v054SVLYuAawTWMz0z/WnrSer+vmbGrDmAy/TSP9B9OGzYBFpgCU9LgoBk7jsq46UEyT
         EAdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794380225; x=1794985025;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zNCeLT8KqxyW0oogwzsW9qArgIaSxaBhX1ik6DX4Ezs=;
        b=wlKCIVtRsJA5/vXr4x9Wxtch6yzMld5XgQaNGWJcvXMawM339AQZCzsUb8yZwFOEHm
         mx+WpuShZLSU68nET3XAW4g2UBhTHnobFZjbo1MjmC4c31ane7Lsp0UzNnUttWuhZU+p
         jl4kYliPVVOYchitVs8uyGhPBxgZFyGekJh+OPJN6vtTlSY1iDYjG0mnGtw7Ms68ZO6w
         fDKWPuARnAQw40iOOXwkics2+7xQwQywgrOrlevbAT18lnY96PGJza3dtZtVIsnvWxuB
         Mu/gL+0PwJp2n76dlczWUtUuXww0G65jY+FJGaFlJNVAgljfi7ap3O5vyF3UxvWT+tMZ
         Iz7w==
X-Forwarded-Encrypted: i=1; AL+hErFbOzwUaDY7cTKSDG1Yxtp1GxUe5C22HxUbpwXwaWl6ldu1UbOFxTR1Etg6L+3DTZzaLTZlVwMzs9za9Pg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/muS765FZQqCygtHVVONk7c1T2VgqC74AnnzLlnr9hF6fYTVlA
	j0nmPEEXkSuyVifPcOL4aa51dhbVBwAYacS6rO3Il/uQW4MFPQOogQpK
X-Gm-Gg: AYBFou0pfIY04tXPKtbgmc7KFFEF+2FBjPiSljtgAgIWXGvJIkOILpjKMqAi1o0+ttH
	SkIToT/0f2Q4hn8eHO+mc3AA+4f38hidpgZ8UnA8piN+FPp3/BTpxdaox82+riqDR7DjYdvXm9M
	FEPJxuK5HZdp1UoFKnJ0yCgnWMsbm70pvHQR20HbrHpCMTGU2Vb1yoOE1NfyyyZdICXCB+YNOgP
	g2XWglPcicLPHu0KuseVx0DGXakWgLTNfy8jCLpdKdbiTPpp/vqDZnLeTniiJTZCO596CFWdp3T
	XIjElNAyqiHw/7vkS41+UjaBXzUsGhDwZsDeGALE4fBSTEOBilGog7VErJJmmfWfSewglfJjXYA
	K/hHlyjBMDfaHh4l2p93c7QOChnSoWduXyyXmOn+IdeALLBRuDGGbubYeEG/uyla3vtj3Pq0PXB
	JZMPbegPH02ewagubl2w5mzEz37uS87KloByTt742J4BUzfa1tTIzjFSs/JlAsKsREBReYETtgA
	RZbJ3pFfiMB/6GYh7K1Ns4YF6WLsy3lPL6CQCMVKAmbFaKZGGNGaXWS4GUPlTBTQfeeYAg8EAVL
	SyMSpxZo4GEUawsXBxr8YsrA6NcsDAz42d044uBlKmYOxWEu04+v8XJUTIryIxjUtGARcx5aWlZ
	nI67U406M9CPHbzsgcpk=
X-Received: by 2002:a05:7022:7f0b:b0:192:e5a8:6bae with SMTP id a92af1059eb24-1b3c034e292mr1418599c88.40.1794380224935;
        Tue, 10 Nov 2026 22:57:04 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:311a:ad7a:93f8:96c8])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b11435sm13858121c88.4.2026.11.10.22.57.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 22:57:04 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Tue, 10 Nov 2026 22:48:24 -0800
Subject: [PATCH v2 26/33] HID: logitech-hidpp: use unaligned accessors for
 multi-byte values
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
Message-Id: <20261110-hid-logitech-hidpp-v2-26-30743e91d83b@gmail.com>
References: <20261110-hid-logitech-hidpp-v2-0-30743e91d83b@gmail.com>
In-Reply-To: <20261110-hid-logitech-hidpp-v2-0-30743e91d83b@gmail.com>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
 Gideon Heinz <gideonheinz02@gmail.com>
Cc: =?utf-8?q?Filipe_La=C3=ADns?= <lains@riseup.net>, 
 Bastien Nocera <hadess@hadess.net>, Hans de Goede <hansg@kernel.org>, 
 Edwin Velds <e.velds@gmail.com>, 
 Stuart Hayhurst <stuart.a.hayhurst@gmail.com>, 
 Andrey Smirnov <andrew.smirnov@gmail.com>, linux-input@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.17-dev-e56a4

Several paths in the Logitech HID++ driver manually split and reassemble
16-bit protocol values using shifts and masks instead of using standard
kernel helpers, which obscures endianness intent and adds unnecessary
noise.

Replace open-coded 16-bit big-endian packing and unpacking with
get_unaligned_be16() and put_unaligned_be16().

Tested-by: Gideon Heinz <gideonheinz02@gmail.com>
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/hid/hid-logitech-hidpp.c | 84 +++++++++++++++-------------------------
 1 file changed, 31 insertions(+), 53 deletions(-)

diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
index 1d80e7b7a99e..df0bcaaf8647 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -960,7 +960,9 @@ static int hidpp_root_get_feature(struct hidpp_device *hidpp, u16 feature,
 {
 	struct hidpp_report response;
 	int ret;
-	u8 params[2] = { feature >> 8, feature & 0x00FF };
+	u8 params[2];
+
+	put_unaligned_be16(feature, params);
 
 	ret = hidpp_send_fap_command_sync(hidpp,
 			HIDPP_PAGE_ROOT_IDX,
@@ -2108,7 +2110,7 @@ static int hidpp_solar_battery_event(struct hidpp_device *hidpp,
 
 	switch (function) {
 	case EVENT_SOLAR_BATTERY_LIGHT_MEASURE:
-		lux = (report->fap.params[1] << 8) | report->fap.params[2];
+		lux = get_unaligned_be16(&report->fap.params[1]);
 		if (lux > 200)
 			status = POWER_SUPPLY_STATUS_CHARGING;
 		else
@@ -2410,7 +2412,6 @@ static void hidpp_ff_work_handler(struct work_struct *w)
 					  &response);
 	if (ret)
 		hid_err(data->hidpp->hid_dev, "Failed to send command to device!\n");
-
 	atomic_dec(&data->workqueue_size);
 	kfree(wd);
 }
@@ -2455,23 +2456,18 @@ static int hidpp_ff_upload_effect(struct input_dev *dev, struct ff_effect *effec
 
 	/* set common parameters */
 	params[0] = old ? data->slots[effect->id] : 0;
-	params[2] = effect->replay.length >> 8;
-	params[3] = effect->replay.length & 255;
-	params[4] = effect->replay.delay >> 8;
-	params[5] = effect->replay.delay & 255;
+	put_unaligned_be16(effect->replay.length, &params[2]);
+	put_unaligned_be16(effect->replay.delay, &params[4]);
 
 	switch (effect->type) {
 	case FF_CONSTANT:
 		force = (effect->u.constant.level * fixp_sin16((effect->direction * 360) >> 16)) >> 15;
 		params[1] = HIDPP_FF_EFFECT_CONSTANT;
-		params[6] = force >> 8;
-		params[7] = force & 255;
+		put_unaligned_be16(force, &params[6]);
 		params[8] = effect->u.constant.envelope.attack_level >> 7;
-		params[9] = effect->u.constant.envelope.attack_length >> 8;
-		params[10] = effect->u.constant.envelope.attack_length & 255;
+		put_unaligned_be16(effect->u.constant.envelope.attack_length, &params[9]);
 		params[11] = effect->u.constant.envelope.fade_level >> 7;
-		params[12] = effect->u.constant.envelope.fade_length >> 8;
-		params[13] = effect->u.constant.envelope.fade_length & 255;
+		put_unaligned_be16(effect->u.constant.envelope.fade_length, &params[12]);
 		size = 14;
 		dbg_hid("Uploading constant force level=%d in dir %d = %d\n",
 				effect->u.constant.level,
@@ -2506,20 +2502,14 @@ static int hidpp_ff_upload_effect(struct input_dev *dev, struct ff_effect *effec
 				effect->u.periodic.waveform);
 			return -EINVAL;
 		}
-		params[6] = effect->u.periodic.magnitude >> 8;
-		params[7] = effect->u.periodic.magnitude & 255;
-		params[8] = effect->u.periodic.offset >> 8;
-		params[9] = effect->u.periodic.offset & 255;
-		params[10] = effect->u.periodic.period >> 8;
-		params[11] = effect->u.periodic.period & 255;
-		params[12] = effect->u.periodic.phase >> 8;
-		params[13] = effect->u.periodic.phase & 255;
+		put_unaligned_be16(effect->u.periodic.magnitude, &params[6]);
+		put_unaligned_be16(effect->u.periodic.offset, &params[8]);
+		put_unaligned_be16(effect->u.periodic.period, &params[10]);
+		put_unaligned_be16(effect->u.periodic.phase, &params[12]);
 		params[14] = effect->u.periodic.envelope.attack_level >> 7;
-		params[15] = effect->u.periodic.envelope.attack_length >> 8;
-		params[16] = effect->u.periodic.envelope.attack_length & 255;
+		put_unaligned_be16(effect->u.periodic.envelope.attack_length, &params[15]);
 		params[17] = effect->u.periodic.envelope.fade_level >> 7;
-		params[18] = effect->u.periodic.envelope.fade_length >> 8;
-		params[19] = effect->u.periodic.envelope.fade_length & 255;
+		put_unaligned_be16(effect->u.periodic.envelope.fade_length, &params[18]);
 		size = 20;
 		dbg_hid("Uploading periodic force mag=%d/dir=%d, offset=%d, period=%d ms, phase=%d\n",
 				effect->u.periodic.magnitude, effect->direction,
@@ -2536,17 +2526,13 @@ static int hidpp_ff_upload_effect(struct input_dev *dev, struct ff_effect *effec
 	case FF_RAMP:
 		params[1] = HIDPP_FF_EFFECT_RAMP;
 		force = (effect->u.ramp.start_level * fixp_sin16((effect->direction * 360) >> 16)) >> 15;
-		params[6] = force >> 8;
-		params[7] = force & 255;
+		put_unaligned_be16(force, &params[6]);
 		force = (effect->u.ramp.end_level * fixp_sin16((effect->direction * 360) >> 16)) >> 15;
-		params[8] = force >> 8;
-		params[9] = force & 255;
+		put_unaligned_be16(force, &params[8]);
 		params[10] = effect->u.ramp.envelope.attack_level >> 7;
-		params[11] = effect->u.ramp.envelope.attack_length >> 8;
-		params[12] = effect->u.ramp.envelope.attack_length & 255;
+		put_unaligned_be16(effect->u.ramp.envelope.attack_length, &params[11]);
 		params[13] = effect->u.ramp.envelope.fade_level >> 7;
-		params[14] = effect->u.ramp.envelope.fade_length >> 8;
-		params[15] = effect->u.ramp.envelope.fade_length & 255;
+		put_unaligned_be16(effect->u.ramp.envelope.fade_length, &params[14]);
 		size = 16;
 		dbg_hid("Uploading ramp force level=%d -> %d in dir %d = %d\n",
 				effect->u.ramp.start_level,
@@ -2563,18 +2549,12 @@ static int hidpp_ff_upload_effect(struct input_dev *dev, struct ff_effect *effec
 	case FF_SPRING:
 	case FF_DAMPER:
 		params[1] = HIDPP_FF_CONDITION_CMDS[effect->type - FF_SPRING];
-		params[6] = effect->u.condition[0].left_saturation >> 9;
-		params[7] = (effect->u.condition[0].left_saturation >> 1) & 255;
-		params[8] = effect->u.condition[0].left_coeff >> 8;
-		params[9] = effect->u.condition[0].left_coeff & 255;
-		params[10] = effect->u.condition[0].deadband >> 9;
-		params[11] = (effect->u.condition[0].deadband >> 1) & 255;
-		params[12] = effect->u.condition[0].center >> 8;
-		params[13] = effect->u.condition[0].center & 255;
-		params[14] = effect->u.condition[0].right_coeff >> 8;
-		params[15] = effect->u.condition[0].right_coeff & 255;
-		params[16] = effect->u.condition[0].right_saturation >> 9;
-		params[17] = (effect->u.condition[0].right_saturation >> 1) & 255;
+		put_unaligned_be16(effect->u.condition[0].left_saturation >> 1, &params[6]);
+		put_unaligned_be16(effect->u.condition[0].left_coeff, &params[8]);
+		put_unaligned_be16(effect->u.condition[0].deadband >> 1, &params[10]);
+		put_unaligned_be16(effect->u.condition[0].center, &params[12]);
+		put_unaligned_be16(effect->u.condition[0].right_coeff, &params[14]);
+		put_unaligned_be16(effect->u.condition[0].right_saturation >> 1, &params[16]);
 		size = 18;
 		dbg_hid("Uploading %s force left coeff=%d, left sat=%d, right coeff=%d, right sat=%d\n",
 				HIDPP_FF_CONDITION_NAMES[effect->type - FF_SPRING],
@@ -2665,10 +2645,10 @@ static void hidpp_ff_set_autocenter(struct input_dev *dev, u16 magnitude)
 	params[0] = g920->slot_autocenter;
 	params[1] = HIDPP_FF_EFFECT_SPRING | HIDPP_FF_EFFECT_AUTOSTART;
 	/* set coeff to 25% of saturation */
-	params[8] = params[14] = magnitude >> 11;
-	params[9] = params[15] = (magnitude >> 3) & 255;
-	params[6] = params[16] = magnitude >> 9;
-	params[7] = params[17] = (magnitude >> 1) & 255;
+	put_unaligned_be16(magnitude >> 3, &params[8]);
+	put_unaligned_be16(magnitude >> 3, &params[14]);
+	put_unaligned_be16(magnitude >> 1, &params[6]);
+	put_unaligned_be16(magnitude >> 1, &params[16]);
 
 	hidpp_ff_queue_work(data, HIDPP_FF_DOWNLOAD_EFFECT, params, ARRAY_SIZE(params));
 }
@@ -2680,8 +2660,7 @@ static void hidpp_ff_set_gain(struct input_dev *dev, u16 gain)
 
 	dbg_hid("Setting gain to %d.\n", gain);
 
-	params[0] = gain >> 8;
-	params[1] = gain & 255;
+	put_unaligned_be16(gain, params);
 
 	hidpp_ff_queue_work(data, HIDPP_FF_SET_GLOBAL_GAINS, params, ARRAY_SIZE(params));
 }
@@ -2711,8 +2690,7 @@ static ssize_t hidpp_ff_range_store(struct device *dev, struct device_attribute
 
 	range = clamp_val(range, 180, 900);
 
-	params[0] = range >> 8;
-	params[1] = range & 0x00FF;
+	put_unaligned_be16(range, params);
 
 	error = hid_hw_open(hid);
 	if (error)

-- 
2.56.0.542.g3ef89b7020-goog

