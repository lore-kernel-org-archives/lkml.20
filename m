Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793982752;
	b=R+Y1eUGiATU07C2tnqceAVOAU2yIEdjqe7Lx+MIDmppe2AxjDufOOdLj0efA6DphIXLN
	 +Vxo+z8XhZHqsOQ4tbhCrEXHqHuDjlDsAhZwdukWbfKlcKeXhj78vKRxwpSdkcs4GteiW
	 Wy6jCQoM7H69j5FRtR+wzhRv7As6tmFuXODYdEboYaljZTF8GNmH6briS8Osqk9VVVeNT
	 KXO8tKQ73lPPPiTdIrn8k9zDAKa74FB1het9/Uswb655AOuo2AWnBCz2jtPdC6MhApDYx
	 jlROWak3gB8utOBBa8duQ6UQmXwNKWJIJX30GtiLq2UfGVZLARSXlQV0iymyRMeWGOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793982752;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=PLhpD9ccdquyHXvw/JVPQGaivr5kK+qZR5BeQNamL4A=;
	b=yzAnKR6jDyg3+8jSm+GdRbgSnqbf5QL8OqxBNFuMp/DInsVCl+kcN5ondx6yVnr+6Tqx
	 g2/2V0DIfYhl/hU+gQ/GB9SrKlwCXnfiwLUIwSsZdsMVJ9l1hucgSb1FSFwERkPwLCcpU
	 m5AHEMnpw0wq7fllwlb6IKuq4OxWn5Ah02PWWWSLPViq8mVp4li46kyW40zCZgdyoIJ5y
	 9yizZuWOjyCl6zQZXGd4/+GRwjeIIOgpd5yNA1erfx0gWCY4r8kMp8+vOdloek2GHxJU7
	 Mv+DTXi99rQXSlMfskhxGSFnp8n/2vKE7IofmWpr0JXwRTcmifJFtwJRgcmg/WLxuSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="wd2gDNI/";
	arc=none smtp.remote-ip=209.85.161.43
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94FFF606D820
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 16:32:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94FFF606D820
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wd2gDNI/
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-7037daaa820so467808eaf.2
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 08:32:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793982750; x=1794587550; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PLhpD9ccdquyHXvw/JVPQGaivr5kK+qZR5BeQNamL4A=;
        b=wd2gDNI/+JV11jjBs63iRALRbyoxDRJDGVb5gHVbNYlAjWCtLzN0yrA/zTMApkGwn/
         YwSnYELBy1v0H2vdhrx81XxQmcVKhQKwQHjNQHsP1Zzv6EXGhIzo7wog1oAOVZWIefQw
         /iGLqX3pM4+ExwmzMaMu2+EfTWjDbYHP34PDnmajxzQOaYjryVz8cUlnFounxEIAPoz1
         c8nJCWtRVz735NKpKbw9ulg6kzfayZ9SHYhFFSl3MTfOAunoeB/FMldxqGVYMsCzsjz1
         /cafzugwEVud67cr0OvCfWL1EKHpf/fbQuMcj7B+wpXwlmKkMEPHgNjZDkO31GEmyDHA
         soPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793982750; x=1794587550;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PLhpD9ccdquyHXvw/JVPQGaivr5kK+qZR5BeQNamL4A=;
        b=UGbZNZj7eaE9eZuiBI8jag5D4OHh8K5p7VdWGBGRN73MBz3OpICsMZGYwlnsHU6u1e
         YNZogNtWHv7u04p13XpTBuI/335O8ndkOXExzVTm+bpD53aEOxXbdTqdI2yCmfexmiF7
         URMShw61Z9q2mrFVffoOHWfCaSj9FQg8ZSVIswfavxQpFknvzB+0KwILVcM8SAvfjviY
         HcsemeYEXOkUDobpRH/57hqHG4zROmjGa1MJ8OTdITBEvI5nC8kyETO6hcrWfoZKLmOI
         6mb/dMCmNq4vbekespRxvNDKRDEvXGeqP8p0rfMMCKCHBU4NBuqB+iZUAxkv+ArWiMvY
         5/tA==
X-Forwarded-Encrypted: i=1; AKwUvBznUv1LmGuPGRCyXwD3vBoVJRaV5o+WbIDthrtxPJ+h2yTIhS3nGI3uyZz/vYoK5J+s30zQFDdOpIfWh/4=@vger.kernel.org
X-Gm-Message-State: APuU4Z84dfK27bydAg9Ngo18S1KvJ/1H2rMCTll6XLLgr/9hgdbtxkSY
	btS2YgiHuhvn3ol7tEEmpGgVYfKRGKM0+bFP2WObcZ9ayHSopFjAcDUO
X-Gm-Gg: AYBFou2okVT1ZjVlBwEyvovnfCdbrn+tJE9lSuv25ch8SMtS3wBr9WVGOOXXwV+HbJU
	QuOyyctH5yv9JAi9uf4W2OhslUPWTqVveh7J25YzaGw3DBiSG6AJwJET8Kfml5REafSxwv5XHsA
	b8Enqtio35PawANUtCizZdq7SYvVlO92zCRQPTrTHcMzohe/F6FcdfH6TZvOU1z5ctxLrxCoOHg
	RYl2XwzIKCjJ/AKlrzzqddRWGKDp3WZp0r0MKZRfCDEnMx0jNePstWo5ZihuB/HYXWkU1iUwUMM
	xyMi/D0KFXYDpiwAbT007Tux/Yb6pVW7iOrsckE0cKzLD5G++ZoOyknFRYiwFma41PVk0fWqriq
	hsJTnNfGpInDJ1pqrqOWzB1Cf4X7/urRQsGhollFxxUjzhpjtlWGDE6fbbPwTuQhFPeV73r6eUK
	/zM/4MdE5tvwrPrtf0/l74yyr9rW+PHLYvMTvDLhgYzYPWq+LC4QyBVHBOwKm4TF/Es4WlboRoE
	fr1fzdHNnOrHNvuFCHURhBmim4u3xJNla/9HzQn/YWfmXjkXEayMgHJfuQ9aJr2KLfZiFOXO50Q
	Y0pm1sFkckslZtjFit9fAXKTepE1Wf0q1CEZliqGVNPtHA==
X-Received: by 2002:a05:6820:428a:b0:6f8:92ab:bb4e with SMTP id 006d021491bc7-716e7750a3amr1705274eaf.6.1793982750550;
        Fri, 06 Nov 2026 08:32:30 -0800 (PST)
Received: from localhost.localdomain ([2600:1702:4ff0:baa0:5054:ff:fe3d:4ddb])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f1de8f066sm2244780a34.23.2026.11.06.08.32.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 08:32:30 -0800 (PST)
From: Will Porter <mrwillporter@gmail.com>
To: Christian Ruppert <arc@gmx.li>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Neil Andrews <neil@androos.io>
Subject: [RFC PATCH 06/16] ALSA: mixer_audient: Allow arbitrary boolean control values
Date: Fri,  6 Nov 2026 10:31:19 -0600
Message-ID: <20261106163129.1006907-7-mrwillporter@gmail.com>
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

In preparation of id14 support, allow arbitrary values for true and false
of boolean switches. This also rids us of the tedious invert flag.

Signed-off-by: Christian Ruppert <arc@gmx.li>
Signed-off-by: Will Porter <mrwillporter@gmail.com>
---
 sound/usb/mixer_audient.c | 43 ++++++++++++++++++---------------------
 1 file changed, 20 insertions(+), 23 deletions(-)

diff --git a/sound/usb/mixer_audient.c b/sound/usb/mixer_audient.c
index 57d856d25271..4b20db9a82e2 100644
--- a/sound/usb/mixer_audient.c
+++ b/sound/usb/mixer_audient.c
@@ -43,13 +43,12 @@ static const struct snd_audient_ctrl_type {
 	snd_ctl_elem_type_t type;
 	unsigned long flags;
 	size_t len;		/* datatype size, can be 1, 2 or 4 bytes */
-	bool invert;
 	union {
 		int integer;
-	} min;
+	} min;		/* for booleans holds physical int value for false */
 	union {
 		int integer;
-	} max;
+	} max;		/* for booleans holds physical int value for true */
 	const unsigned int *tlv;
 	u8 unit;
 	u8 sel;
@@ -65,7 +64,6 @@ static const struct snd_audient_ctrl_type {
 	},
 	[SND_AUDIENT_TYPE_PHANTOM] = {
 		.type = SNDRV_CTL_ELEM_TYPE_BOOLEAN,
-		.invert = false,
 		.len = 4,
 		.min.integer = 0,
 		.max.integer = 1,
@@ -74,19 +72,17 @@ static const struct snd_audient_ctrl_type {
 	},
 	[SND_AUDIENT_TYPE_MUTE] = {
 		.type = SNDRV_CTL_ELEM_TYPE_BOOLEAN,
-		.invert = true,
 		.len = 4,
-		.min.integer = 0,
-		.max.integer = 1,
+		.min.integer = 1,
+		.max.integer = 0,
 		.unit = 0x3A,
 		.sel = 0x02,
 	},
 	[SND_AUDIENT_TYPE_MUTE_OUT] = {
 		.type = SNDRV_CTL_ELEM_TYPE_BOOLEAN,
-		.invert = true,
 		.len = 4,
-		.min.integer = 0,
-		.max.integer = 1,
+		.min.integer = 1,
+		.max.integer = 0,
 		.unit = 0x3B,
 		.sel = 0x01,
 	},
@@ -359,16 +355,12 @@ static int snd_ctl_audient_boolean_get(struct snd_kcontrol *kctl,
 		if (ret < 0)
 			return ret;
 
-		ctl_val->value.integer.value[i] = buf ? 1 : 0;
-
-		if (ctype->invert)
-			ctl_val->value.integer.value[i] ^= 0x1;
+		ctl_val->value.integer.value[i] = (buf == ctype->min.integer)
+						  ? false : true;
 	}
 
 	for (; i < nchan; i++)
-		ctl_val->value.integer.value[i] = ctype->invert
-							? ctype->max.integer
-							: ctype->min.integer;
+		ctl_val->value.integer.value[i] = 0;
 
 	return 0;
 }
@@ -392,12 +384,10 @@ static int snd_ctl_audient_boolean_set(struct snd_kcontrol *kctl,
 		return pm.err;
 
 	for (i = 0; i < hwchan; i++) {
-		u32 buf = ctl_val->value.integer.value[i] ? 1 : 0;
+		u32 buf = ctl_val->value.integer.value[i] ? ctype->max.integer
+							  : ctype->min.integer;
 		int ret;
 
-		if (ctype->invert)
-			buf ^= 0x1;
-
 		ret = snd_audient_raw_set_one(mixer, ctype, base + i, buf);
 		if (ret < 0)
 			return ret;
@@ -485,8 +475,15 @@ static int snd_ctl_audient_info(struct snd_kcontrol *kctl,
 
 	uinfo->type = ctype->type;
 	uinfo->count = snd_audient_kctl_channels(kctl);
-	uinfo->value.integer.min = ctype->min.integer;
-	uinfo->value.integer.max = ctype->max.integer;
+
+	if (ctype->type == SNDRV_CTL_ELEM_TYPE_BOOLEAN) {
+		uinfo->value.integer.min = 0;
+		uinfo->value.integer.max = 1;
+	} else {
+		uinfo->value.integer.min = ctype->min.integer;
+		uinfo->value.integer.max = ctype->max.integer;
+	}
+
 	return 0;
 }
 
-- 
2.47.3

