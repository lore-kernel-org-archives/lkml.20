Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793982759;
	b=omMOfeYoHhlcTe9Lzq7uIXQIgq4IEFO0AfmVDCLIINcvf8AGErMzuzke2hvl47ko8HjP
	 TUXqf35DWiiHpoMxMCM7hjSHlguVMIypigomA9bn6pwGiW9GkFimjqdeHnT584KlXZ5SS
	 m36z3A0Ct0WfCyg8e2h3geewN4aAgrSSbrc2qRMAnXFGW8wbkgJIQrwrQ4JoP9QTAptBt
	 KJek2d3vfVePWe/eMRQBNm+fMdyPdnY+zYuPn18hE1m7hPFxW7OPon70ZHge0CsxOnAKD
	 LH/TvFXMFz/xnQ4unwbNVnrp82lGaPoL48PZp5lNpKT9YTRzXIyAeBKawsO1a6yGZpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793982759;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=T8u2P1x4rQsgh+erRfetmJts+t6jETFd7Sf2I66pwwA=;
	b=C9W8LVljJbuIgAvwtEfenX2vlNF6fsaWPZP3TF5WTsfPdXrHSCZbNX+nAi8kXFU6jGBr
	 XH1s5vdPYU/mkwWOLMug8XwOZmNkjQSNe5hHhbJGTudXw5ONqwQC515FnXOU0Vw6voZKy
	 8XhFoP3xArr4NJCemeSsSoWOOCD0cIpQ5svWXzvik8zbSbTHMlsDze7MnWTsJWc1d09Qo
	 SVC1OHAyUyn/9wEVUBT1FiWDZsYGfY9yxs5mfLd32kUwLwn49dyFA1iysOkzSDx/eCJEF
	 FKsGcoHVoG9m3jLBUepFDhFudm25JkBKkvO6eJ68D9mzxtSiIdndaqLOO+Oqgn9GeTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cadNhXAx;
	arc=none smtp.remote-ip=209.85.210.54
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A12A606D836
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 16:32:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A12A606D836
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cadNhXAx
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-843b6f8e2c7so1017554a34.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 08:32:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793982752; x=1794587552; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T8u2P1x4rQsgh+erRfetmJts+t6jETFd7Sf2I66pwwA=;
        b=cadNhXAxA/rqKP1ln2MEexAK1169OSw3OJcUoBLA41LacDtR8r89jqHPUaoYVGpJEO
         HVQPn2s7TQIz6DQCwWaxSm1HQEmF2g05yMRyX0MW0KaJCFNC5NpDMJt2TKUhy0n4bDeU
         drSDh+mVjBzTotKtmVcBnrgIb/BRyEttlVc6BiRD5CdmgDRVGDS7lzV2ujom8sQqY12V
         0jaDbBmt349IRIrWKTJWhcqzatVcMuR9uguNfR/rURS3Rp4on56zQ0BaKJNCDhUYPZso
         GWFHAoGZWuFtqQ4A8AaDHhy52chWuVA+Hd3f9m8rZqrxVvbB/Wgq3yxmHVqVhxZnpXNS
         3ARw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793982752; x=1794587552;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=T8u2P1x4rQsgh+erRfetmJts+t6jETFd7Sf2I66pwwA=;
        b=vZqHr6QEg32hQ4RkIWXFWW6WWmZtz2rYBwF88utR1+1ky0XuCtMHZ+bP0fV4t1FkHf
         BEXtCHsriFX3eyK15MES2MFBZRjyKVm9wAZenHkDtyY6lUcfRTeV8Sy3BmrTcp6+gkJW
         VY4LaXfsOHOXslv/meyu3wlJSg3SuIUsUoICZwo9RC/j+pr56FmTjoTNIruXJaIg1e1H
         maIbbK3LBlrW3eC8Z1qBFlegWaUwacZBU1X/j/qLjJjEFXbws0JEYaKum5MK0qqzxk3r
         vc1VXsuMA0TdA3xx06BxhJjOxniXaZLhlqKQho2/aBVAzfTNk8GKqzC2NPm1xAwV4nX+
         gbYg==
X-Forwarded-Encrypted: i=1; AKwUvBxW9hFZFZ7hzbcYVusxZqjJc3NICkOeAiu4mqzbYIO8xR2IJhSduLh+D6aDb96wZyJjIqwfFxkl7iageuU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Q/MGy4OZPm97PJyTJo5gUsUrUcS+JIsTP4+T0hhHp9f7lJJLD
	rm+Wcaw6rwqZ0Zd6V+QwYHMfLy2F15zA9L+bpZ3qgYZ/zyuokDf+y9Hr
X-Gm-Gg: AYBFou33PuortgJA784Me/Q124EI0Lb0mCFNpGgYbp/6oMqtd8o16ROdoggh7MQtkhx
	0le3HXJpPZ5xg9O198n3xh9vO5D+XfEaHsiMl7A2vpRhYzccm4vx7QM0Mu/gUTqGJaJLOxj4C5Q
	4suVxUxCoYqG6ULGwZRFuapd7zEUhhNBRAM3icwQlU5w/T6IuiAhlOKQSFxoHcYT6YMDaDHFbC6
	kj4zEVRa52vyzCiWkjxfoerFC/ZWqx7WRF3A9nD5Pt2ep5/myoiusuxUjDHOAZhsJerHBhErfu4
	5qd1oFzypqHq66bDxkbE5VIbmrB6rUECT9u1AupBxK8GYfLSMIXfY6cSh2hTd5F+DFNFOWUv3Lh
	V1vEZD5I3e5csbkRoJRzHCnL9qVcjR4S2KbEmSqQj69h0CVF/YQiZD31/KOT3iAYZ0JB3HYXAPq
	oCl6U1CS0F3/lRQrj66s/J/jFwvSTWF7ifw/gEyN2KgM22mW7v5W8UcMCx0FdDLbUjpGRhakKjS
	YIjRehz2DmjbZSY2r9PyKkzuI02ei72bm56xYpIKa97c1JAgTpbj5a9oR2XVtQQGXN3HlpE+at3
	YQHXJKFotIdSjQHGfrbvVwuWURhJP9H+a+l0v+7dd1Fsqw==
X-Received: by 2002:a05:6830:908:b0:7f6:96ad:36a8 with SMTP id 46e09a7af769-85f1cf93edfmr3229045a34.8.1793982752194;
        Fri, 06 Nov 2026 08:32:32 -0800 (PST)
Received: from localhost.localdomain ([2600:1702:4ff0:baa0:5054:ff:fe3d:4ddb])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f1de8f066sm2244780a34.23.2026.11.06.08.32.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 08:32:31 -0800 (PST)
From: Will Porter <mrwillporter@gmail.com>
To: Christian Ruppert <arc@gmx.li>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Neil Andrews <neil@androos.io>
Subject: [RFC PATCH 08/16] ALSA: mixer_audient: Add control initialization at probe
Date: Fri,  6 Nov 2026 10:31:21 -0600
Message-ID: <20261106163129.1006907-9-mrwillporter@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261106163129.1006907-1-mrwillporter@gmail.com>
References: <aupn1wwW7w08M3gu@khmer.arcnet>
 <20261106163129.1006907-1-mrwillporter@gmail.com>
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

From: Christian Ruppert <arc@gmx.li>

Add the possibility to initialize certain control types to known values at
probe time. This is particularly useful for controls which initially read
wrong values and for controls which cannot be read at all.

Signed-off-by: Christian Ruppert <arc@gmx.li>
Co-developed-by: Will Porter <mrwillporter@gmail.com>
Signed-off-by: Will Porter <mrwillporter@gmail.com>
Assisted-by: Claude:claude-opus-5-5
---
 sound/usb/mixer_audient.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/sound/usb/mixer_audient.c b/sound/usb/mixer_audient.c
index 433bb5479d8e..70ec3274a5e4 100644
--- a/sound/usb/mixer_audient.c
+++ b/sound/usb/mixer_audient.c
@@ -38,6 +38,7 @@ enum snd_audient_type {
 static const DECLARE_TLV_DB_MINMAX_MUTE(snd_audient_tlv_mixer, -12800, 600);
 
 #define SND_AUDIENT_CTYPE_FLAGS_SIGNED		BIT(0)
+#define SND_AUDIENT_CTYPE_FLAGS_INIT_HW		BIT(1)
 
 static const struct snd_audient_ctrl_type {
 	snd_ctl_elem_type_t type;
@@ -49,6 +50,7 @@ static const struct snd_audient_ctrl_type {
 	union {
 		long integer;
 	} max;		/* for booleans holds physical int value for true */
+	u32 init;
 	const unsigned int *tlv;
 	u8 unit;
 	u8 sel;
@@ -533,6 +535,20 @@ static int snd_audient_add_ctrl(struct usb_mixer_interface *mixer,
 		return -EINVAL;
 	}
 
+	if (ctype->flags & SND_AUDIENT_CTYPE_FLAGS_INIT_HW) {
+		int i;
+
+		for (i = 0; i < ctrl->hwchannels; i++) {
+			int ret = snd_audient_raw_set_one(mixer, ctype,
+							  ctrl->val_offs + i,
+							  ctype->init);
+			if (ret < 0)
+				usb_audio_warn(mixer->chip,
+					       "%s: cannot set channel %d (%d)\n",
+					       ctrl->name, i, ret);
+		}
+	}
+
 	elem = kzalloc_obj(*elem);
 	if (!elem)
 		return -ENOMEM;
-- 
2.47.3

