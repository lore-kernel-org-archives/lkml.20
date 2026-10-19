Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 483EF4EBAF0
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 12:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792413645; cv=none; b=B6q0gu+4c8N7k7sJhrKo62EQxmc9I4nKi/SzUkraRTQfQoGyiqh/nXP3yox3/wSZJtc2t8oRCAeIsYW2Z9+Pa/a55pMPwZS49TT1KNek/kl9dVc0ccH9M7xlbE1ryCWcGAnzdP/LfJpwrS1dTRvQOn4WxFd1cj2y898WXI15mOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792413645; c=relaxed/simple;
	bh=+U3UOitV9swawLPUgHDjqXjMi6tF/ayfw+8rddSHT3s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=C59QFQUJtgsVG23od8u4bejxJS/wYA50ZqdpS5qkKiROC5wAw7qznImHd9afMcifUMVgGD4AfTcMMD+UCTz6fKK1oZ7OfSrEuWK5aGeS24Wm9t7FWP0MRfEttSrs9hbgStt5NAggOtpSH/pzBaXQzF0XgTJpWXJb2rI6HYPhoGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=srfRRoDt; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="srfRRoDt"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8a070b3f44aso213264b3a.2
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 05:40:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792413630; x=1793018430; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AsWYDDajpUNibo8xaupeGhhH1lTDWeFw4XFOrh3OmFs=;
        b=srfRRoDtD3C17DiyYAeDJYoH1fxQIIym1xyIDFwmvc+ORBH/Pop0HA0ce8C/QtvciM
         e/bx+IQatr0LtsgSeatIFICoXuwgpK4+19c84qPdN9HvMfDJjh7EfhJzG+aBFVRJ39CD
         r4SVpMAtcd5/6uLhIoiHSE74r+OCYbAFD5ggKdGlK56mHyvGGCVzVpp+ZlyA46GH0UfX
         MGgCJhgUIZZ/5MtQivVPAnF/3uljTkxdCz+rjrsuou5HjHn2FG51qVwRr8CV+KxXn15D
         HQxBjCMBunAf8T2g3ZHo84aK+Dyhx5OUukxiPfKcCMP/7jQUgt70ZxFImsREPBVl2+Ib
         uaKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792413630; x=1793018430;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AsWYDDajpUNibo8xaupeGhhH1lTDWeFw4XFOrh3OmFs=;
        b=wWny033fk3Vo34BRDXY/cbEvPPXLVkcC8TTCfDMvWB+QDXHEjDWRxPmDy7VaNH51Cp
         kYjPrK2lhwo5cnlPYCf8nY7YsWju0kfvp5omHLfN83uSDRKUqn2HQ7dT4CGdsVJ0WlPh
         akLWQQha6YZnvgQkQF26e5L3DrZ5HhUouFp91Goima9o5ztNomtU15HBXsfQl27GsObh
         SdG5em4ofLbAMC4FumpUl1D5dCEIJI1H9oK1tfQXYWKJlLKdzm6LqnXlx5mqqJujN+gm
         DHAFsEpijxEsP5LsBCv7JWkHf0Qhh8xsfwGI01C9tB0Eh5Zb4aNImDHAFfsFpyPhk2Jb
         mDig==
X-Forwarded-Encrypted: i=1; AKwUvBzdis5HCKk5iSmbDapAaXpvaS3daetgsyyM1s6Gbk4ljaOHHun+4JKUy7WBMBP9dLRRM95NYTbh3kHMcSY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJIbA1DH7hd5WIBFFcobXqlCnESdMMt+xkp46lviun99XLZ9+EJ
	CwYbrOeAJXbjRz6tqkcAnc7PqNGOCHfQ7O3Esjf2Dof8D0lhwVQdVjhG
X-Gm-Gg: AYBFou2PyNKLpeYR3vTM8rUUK+Zmr5KueX3+E2upuC7Yr9urqa6GG3KIxQCIO8QOL2S
	MHiol0EQBhXFgmuTkwA4jrwnjUyBOxf08mDapatVB10RVBbUmQMlNy6Ho6VjFTl4Pg3FG51S9fw
	KNj277nc32V2VODx951NwCjAs7jNxgJFHqiiUAVQ3/F7UsU3G2Zo+rzA7Y6IUFg1oo87So9JHJt
	X1nQ6k4tUMAQVYPXZLZz/lhq2Gk3YrbybxbSbENVK9p738ov1kWwrpxKUOBZVvjztAVk2r9piSt
	HfSajaMag0iiv89+sBNPXR/W59Y3p1ilPyre7JfHMbejOHtpyFWBsVqXV3cu3DWPJGZS23IM5q8
	EUNzC/XKewh8yppuDdmMBOKVkr3erDFBQovqrxcGyJMYQjKLpHIVNADzwrjjNawMRFOHGN38I6U
	F+AK9+jsvkaXLgVV4oHMm/FL29mNHOSWZq85SaHnvxmQT4u/+S6WsMFVFkCRBsD8WpimvLyUfon
	ati0lgfSUVpCHQv2qqyn6LxN3VzdUXgcFKYxadkZEr3jHNGc+QAWR21oPjc7VMHKVmaJL9za+Hd
	2nERe8+G6SVo
X-Received: by 2002:a05:6a00:4385:b0:89e:779b:d03 with SMTP id d2e1a72fcca58-8a04ac28ab1mr5908872b3a.6.1792413630214;
        Mon, 19 Oct 2026 05:40:30 -0700 (PDT)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89fcceb71a5sm3443033b3a.54.2026.10.19.05.40.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 05:40:29 -0700 (PDT)
From: HyeongJun An <sammiee5311@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Charles Keepax <ckeepax@opensource.cirrus.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	patches@opensource.cirrus.com,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	HyeongJun An <sammiee5311@gmail.com>
Subject: [PATCH] ASoC: cs42l56: Remove the ADC Mute Switch control
Date: Mon, 19 Oct 2026 21:40:22 +0900
Message-ID: <20261019124022.3410793-1-sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ADC Mute Switch control writes bits 2 and 3 of the Misc ADC Control
register. These are the ADCA Invert and ADCB Invert bits, which have
their own controls. The ADC mute bits are bits 0 and 1, and the DAI mute
callback already sets them.

So the control has never muted the ADCs, and nobody can be relying on
it. Remove it rather than point it at the mute bits, so the ADCs are
muted in one place only.

Fixes: 272b5edd3b8f ("ASoC: Add support for CS42L56 CODEC")
Suggested-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Link: https://lore.kernel.org/all/atXh3Br+fuH83S0q@opensource.cirrus.com/
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
---
 sound/soc/codecs/cs42l56.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/codecs/cs42l56.c b/sound/soc/codecs/cs42l56.c
index 54d23857b0ad..ecce51985a11 100644
--- a/sound/soc/codecs/cs42l56.c
+++ b/sound/soc/codecs/cs42l56.c
@@ -419,7 +419,6 @@ static const struct snd_kcontrol_new cs42l56_snd_controls[] = {
 			      CS42L56_PGAB_MUX_VOLUME, 0, 0x34, 0x24, pga_tlv),
 	SOC_DOUBLE_R_TLV("ADC Volume", CS42L56_ADCA_ATTENUATOR,
 			      CS42L56_ADCB_ATTENUATOR, 0, 0x00, 1, adc_tlv),
-	SOC_DOUBLE("ADC Mute Switch", CS42L56_MISC_ADC_CTL, 2, 3, 1, 1),
 	SOC_DOUBLE("ADC Boost Switch", CS42L56_GAIN_BIAS_CTL, 3, 2, 1, 1),
 
 	SOC_DOUBLE_R_SX_TLV("Headphone Volume", CS42L56_HPA_VOLUME,
-- 
2.43.0

