Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793260960;
	b=swVbUSPZFdvRlpiW+zNteqCSVo2JftpvUyuoscnCAKYp9xNaJlCO0vMV7/7yuoHFRVD4
	 SK9GeHPdt+ftrjJ9pjQ9TID2WLODMNjPhwWj2IPWyliVHY2I+P/THFtnu73cuYK9BLV6g
	 MogdPeREg91Z61N4/3mQHi6chBY60ar2fdNZR+hqKgXoZKXJqPY59Uu4gloKRexx3q4Uq
	 eg6GI1+fWy5Y5hHSYsZN5JVCt64loceFXad0brBSZh8gHsvuZrbcwkJAf+FPnbNclo0VJ
	 eR7FwJTOrKSp0BbDDgHjH33AAktXFY2QH24DeMAzY7QOoP891dQPRTecjyUBaQQs3jw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793260960;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=jf//jGkpoaafkxQgkLXGLNO187YYediMJ6KguSHiIjo=;
	b=STc2h1+HFTKXAA7MyF8+1T324SqJlucVVybDGgxIEiVY6f3rgjMIUz9FblRqMXcOCuOZ
	 BUZYD4Uf4jsxPN30Or/lWw1S+Xruj2DDIp0pAeOHpqIm6CU0xZeVPaXAxPPf6/SyBGf9z
	 ARvqAEQ+6hiYHQWWXV3VR+CQA6beNAlt7zjZulcfZyaLtTGxG9CM6ki3QTYXND85b147x
	 ECfAC79l7FLwcI/L/kAwWMR7kSGd1rrn0C17AyRHv0G7VNcp2SnbjuVI7wR2j3y/x+DYu
	 jjcW5fGKVtFuHnMY15QY4x7QFFuyTRGu1EJJbLTAFFuGtR0k+OiMrXsFx944SOf96UQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Q3XBvDSs;
	arc=none smtp.remote-ip=209.85.210.170
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A054C606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 08:02:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A054C606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Q3XBvDSs
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-881269371acso220967b3a.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 01:02:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793260959; x=1793865759; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jf//jGkpoaafkxQgkLXGLNO187YYediMJ6KguSHiIjo=;
        b=Q3XBvDSs1IN/w5HWxWK5rlqy3F9mzbJGY4rlkKlZ38RlsSvv1BrHSHHFQxwjdq1miD
         vf3hSQn4xCULu6CCXfD/NkGvIA14R5YsraKwIECjGFTgid0ANuuUJ8YXyB/6Lrvcnyia
         67fZUF6C/1Xsrt5iEwwyoddAiG5//KnurABnCMif6oSn1IS2p2qvM0CyL3X7pUtSJgEY
         +r512Y/wuBvDmuI73B2Mv93uyDuTQmDxt+SA/sxTCWSXeZT2h3kSHAM7cuL1wDaNm+3r
         0x/Xwdedf7Bmw3uv0natcB2guiZheuFqb/Tjh+5RMeOZ6FIVvWn4vouk1x/kEI3oY4D5
         DM2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793260959; x=1793865759;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jf//jGkpoaafkxQgkLXGLNO187YYediMJ6KguSHiIjo=;
        b=oozjCdgnxAzFQgARVPJ6JAKQwXLiUt8ek9JTuXXG4a7EofJDeasg9yQMhDz2gNc7P1
         CeIAJIEZN5nO3kOA331STHaq0ewkvd+wl9rQH/nys/N8TXClkqWkr2smM+xNL8ykPCC5
         KT10d2j8M6FY5dpmMMT5FrIRH+31vtTkT3pmFLg26IlK6nqr8v55U+dq6XKIgJug66qV
         7951l7JZSQppIp+vlAVSde4EAaVF/RoXlSpNyNyKtl0PeTrOc8hQn0QJ9OIy+UdoWP0O
         LRePhSKFrko8ee8sGWy8UcTxkuJs8kUm8ieSbe5SFZTte3mxbEWWl2vncSgMx79jEmxA
         Ge5g==
X-Forwarded-Encrypted: i=1; AKwUvByZM5mxUdQ4NMgwTKcBlah+GBIFWm485v22LUzSM1sPFAclpexsYgL6P4O0ovTmbuB8W1Oki7fcyzZOUCA=@vger.kernel.org
X-Gm-Message-State: AFq9FYIbdHM4GWPb61/+NEpmQlgDu+m6nWGclgNL3D7Y7d8jt9n6Q+p4
	JrhDS8sIcWeX/12DCAXNZ7039kI64nHR7inL5KN1TLYlnHH0BovU65SrVDhslA==
X-Gm-Gg: AYBFou2o1NLeTrfAdd45keR4tBjhVoWKgc1iekOECRE4ndzZysCwO/ivAp6MYb9+sEu
	G1MZB8c6yTZZs7ORg1mQbIXJIeuEC0LAi1PogGTZo6eJqrMdMS/30d7ubymFBUCTcxKizD/tzD7
	pN7xD96gNsNVO9ePzEgZm7DVOJUpR6QtTCLhL/h7RgQnnGnqhMlht7OM63/7mx2MAGtHPONK1kL
	pognMj1eRriw+xRLU2vuEbUbhH1vC28Q5d19/0IHJt4deOXg+MkOfTWF6ssIp63kJiVZK4ccx7k
	OSTLWkUAfam5V/QLQ6qRkN7Rs36NMFGPKb/Zqno6KvL2kNW54VbmvULzZGiwCfnf+7GzZYgUKpr
	E/BDmgJsgppY+SGkvCfb5LeIkuzc4DvPg2Lskc9+RmDKQ/YBwO87XASgzD2uGF4s+r7UovJHucM
	MikjLQUYQAq/MJUPfQq67uqSIFIzyUMW+o+fIGKxTdxQKYVq/5dEEQlRtp7gaVSQM3ENBXtj2Ou
	v2VX0e7pvcSZhIqvmcGyGDtzJcOw3KlH6BRH4iz3saakgSV7dFePKr+o5ijUK6W8E+MdrRk+AEP
	bok9JTlq7Q0QkOcvRjd0OA+DRsUGHzHho9MPKsSquZzMlJvBy5pmbONkAKIdbHvu6udHecM+kMy
	FSvOIoN98k+gHAnXAvNlOseFIx9KdbQ0wXYDl2z0hGf7s
X-Received: by 2002:a05:6a20:e290:b0:3e2:9b9e:7efb with SMTP id adf61e73a8af0-3e913da171dmr1397626637.50.1793260958888;
        Thu, 29 Oct 2026 01:02:38 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd8ccc682d8sm5059547a12.18.2026.10.29.01.02.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 01:02:38 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	=?UTF-8?q?Pawe=C5=82=20Anikiel?= <pan@semihalf.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 1/3] ASoC: google: Fix frame size calculation in pointer callback
Date: Thu, 29 Oct 2026 15:01:41 +0700
Message-ID: <20261029080143.12304-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261029080143.12304-1-phucduc.bui@gmail.com>
References: <20261029080143.12304-1-phucduc.bui@gmail.com>
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

runtime->frame_bits is the number of bits in a frame, so converting it
to bytes requires dividing by 8, not multiplying.

Fixes: 702648721db5 ("ASoC: Add Google Chameleon v3 i2s driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/google/chv3-i2s.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/google/chv3-i2s.c b/sound/soc/google/chv3-i2s.c
index fd12cedfe1c9..6353b2a079cd 100644
--- a/sound/soc/google/chv3-i2s.c
+++ b/sound/soc/google/chv3-i2s.c
@@ -234,7 +234,7 @@ static snd_pcm_uframes_t chv3_dma_pointer(struct snd_soc_component *component,
 	u32 frame_bytes, buffer_bytes;
 	u32 idx_bytes;
 
-	frame_bytes = substream->runtime->frame_bits * 8;
+	frame_bytes = substream->runtime->frame_bits / 8;
 	buffer_bytes = snd_pcm_lib_buffer_bytes(substream);
 
 	if (substream->pstr->stream == SNDRV_PCM_STREAM_CAPTURE) {
-- 
2.43.0

