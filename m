Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1314749B465
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 13:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791465029; cv=none; b=M/9kgXMbUoSbTShbX/RuA812I4t2fCQe1TlB0rIjfTDh6k/ZJKOsL3JcXPyXFeijBOvHG5scfDrvZc/DD2fWFWVAK851eJCKX35HFu7aIY2PQUVKOupW39PdZJuUkcuzz9+OUj33+ZEvnsUhy8pwbay3UG6xmt25G0Fo86CqEcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791465029; c=relaxed/simple;
	bh=FW+M5Chu4W2BidjPpohFRBIjtT2yv0mCxqjYHiuMgvY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Hlnmj9B7DT5C8zMMuPrZjqhixqsMilEl1yahKxeh4FwD4J789sAqzIAjxUt3chsDcXcLroA7i8qAJi+WcIpY6ZUgSKknc0Oi8OICmnSlsgVU3QK9phiHIGIdXULZ2O5iCcCEDigI41Tu+nYtr7xlQXiIYAcyTlwAj9MCIJg18uA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EpIZxY7D; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EpIZxY7D"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-8899a204034so1685422b3a.2
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 06:10:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791465027; x=1792069827; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sbNj7+3qYNNHpJNsAPAmuGDKu5hgPeJHpvv36maJHJg=;
        b=EpIZxY7DFpAxVHW2PEmPVWMEl51UnoQXpbV3OgjpRUEl4hGCU0j3pWjSkCierWo7X2
         BYksxSPlTjZz2UZR4RCrQEQG7gPlKOqKqe87g0zc1EbeLo1VUUJ0RyR4OVWuPrm3ggrY
         bhlLtq2t5ZzCNN5Hu/Ah6KOTOdQ1nv7hQhTO+/af20GEjetddQ/s+WKYmzyUWy4XO13s
         MoOexLvNaLPwyauQScJP2quoRFi6l3WEM84VM5I/rN6RMqB3NBeIxXDaTtUl+FB2FV4Q
         qonljRgmMF7IHEDr/4eM0KrOFnJviiVcRay/esDTIp+0qUkSf1EYdGIUhDymBqZTFswz
         eQBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791465027; x=1792069827;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sbNj7+3qYNNHpJNsAPAmuGDKu5hgPeJHpvv36maJHJg=;
        b=JmF0yVbbzKmVulocVe6F8uASB6oZm6exteg0gKS/+Udbl9Wy1ddq364He1/eGx4HQO
         /xkJVfEHk6MzErO7a0iDiJh5Z85qAuUiEwjpYYZO3a2IEShm/PQGgsqYIYkVP0TChnF+
         MrD/XMyN8t6esDNZ0SCSXNOeEATcEYfic5QAxgtR+v7W8P7mDwMs/kE/fDANpHPdQ6c2
         LFNghHYfeJZfk3x9thSVR0823sK6JOb1sFPSWQQ0TVHeIdnOAepgL84zPE+v0sR1eJb1
         6Jqf/pIT/C1ZehojAoH7N1ViDxBUFOXus7mMfd6zKQOShoB0nua+LbfbsLw+TOqzCc6F
         2s8Q==
X-Forwarded-Encrypted: i=1; AKwUvByDfMAMgC4qD0XDZc7UyFtprWsnD5YTgztRloahHVxl4OEIG0RSv0CJNcPco/Q5/VD4G4zArTwh40UBVkY=@vger.kernel.org
X-Gm-Message-State: AFuF++kqaXkEhppG+Gwra+5U2wve7EGMQP0ShRk5Zy7766p8GF/jr4I5
	86GyrA9GpG9xaqk5ffdIipoRj4lEKpJiszmxmVdsvGQ/coCqHaTetD9c
X-Gm-Gg: AYBFou04fYlwT4zOcDqP2LQ+exqUSYcGS8gel3rReiPaGNIGAAjkMuhx184To0WPyh4
	V8G3V/7Zy3/XEYVHMuIKXK32ev7W4vQdft5i7iyxfO7BkDHqFCpN57UQww13VH8x3QM3bf68PfH
	RuRS0ugbhqlLmtsR4Ui1q9vdXwamjf1vH5XSAMKowd0eKM9m1jQRkfl9Qs70P4lPRCbe/ESTVJJ
	MxU4fFQXRIObpRls4mGyTgjSTgnRGtEZi/WLVL6iAXJKsOBKt0ixO/MPdzik6xe0Iy8E0W4XcAZ
	5liBe91WzFvN3A0h6ZOvO8jad4vJDOhbQtCtQzXT7LNkRzXh2htJf2yGtM+ybqmUlQRPRWpAOqH
	PUhh0RIBJYiRXK9nNuiKg8C/FisfLR7zsYt/l1ojNw2bChaTRQTAl1Eki69l+3jMzDbQ/uPMWJ/
	gcTZyleEy9K0E13x1Qn5Ski5rEFZGsxKUK4fAMuf+TZ97NyNhoOJKXndnqy9lbeDyln5xF1eNED
	AISQbZWhNnbE7qXFxKDgIgZilbCFkWxnYMYCVYfNiSncCYGp7ZnKeYGVr4g4totreIQ65X+P0b3
	x972cMRsVw==
X-Received: by 2002:a05:6a21:3b8e:b0:3dd:ff70:1426 with SMTP id adf61e73a8af0-3e133d9578cmr4573434637.3.1791465027299;
        Thu, 08 Oct 2026 06:10:27 -0700 (PDT)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-893143368a7sm870761b3a.48.2026.10.08.06.10.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 06:10:26 -0700 (PDT)
From: HyeongJun An <sammiee5311@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	HyeongJun An <sammiee5311@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	patches@opensource.cirrus.com
Subject: [PATCH 5/6] ASoC: wm8978: Fix the 128x oversampling switch bits
Date: Thu,  8 Oct 2026 22:09:51 +0900
Message-ID: <20261008130953.2446692-6-sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261008130953.2446692-1-sammiee5311@gmail.com>
References: <20261008130953.2446692-1-sammiee5311@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The DAC and ADC 128x Oversampling Switches use bit 5 of R10 and R14.
Table 66 of the WM8978 datasheet puts DACOSR128 and ADCOSR128 at bit 3
of those registers.

In R14, bit 5 is inside HPFCUT[6:4], which the High Pass Cut Off
control owns. So turning on ADC oversampling changes the high pass
cut-off, and the oversampling bit cannot be set. In R10, bit 5 is
reserved, so the DAC switch has no effect.

Use bit 3 for both.

Fixes: 823dba519122 ("ASoC: Fix broken bitfield definitions in WM8978")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
---
 sound/soc/codecs/wm8978.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/wm8978.c b/sound/soc/codecs/wm8978.c
index 25cc433c7653..258bc9f88f52 100644
--- a/sound/soc/codecs/wm8978.c
+++ b/sound/soc/codecs/wm8978.c
@@ -255,9 +255,9 @@ static const struct snd_kcontrol_new wm8978_snd_controls[] = {
 
 	/* DAC / ADC oversampling */
 	SOC_SINGLE("DAC 128x Oversampling Switch", WM8978_DAC_CONTROL,
-		   5, 1, 0),
+		   3, 1, 0),
 	SOC_SINGLE("ADC 128x Oversampling Switch", WM8978_ADC_CONTROL,
-		   5, 1, 0),
+		   3, 1, 0),
 };
 
 /* Mixer #1: Output (OUT1, OUT2) Mixer: mix AUX, Input mixer output and DAC */
-- 
2.43.0

