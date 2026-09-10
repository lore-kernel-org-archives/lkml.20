Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A92249552C
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 12:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789045143; cv=none; b=Duiv60fZ3RsFr4ixNUQGoPUWjFDA+xi3utc3ARDmaglZLz8M+u1dkuDEz1klP3Sdc+aTa4WF1/WuwyxXU4rAN0C8Ul5u18uczZxKkqANnfK9050dJo8VOJyoALQxR6OirL8ZF6rOhH+aqur8kMV718y0xx7ZSg8u4gnkTXI4+KI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789045143; c=relaxed/simple;
	bh=HNQ3yAaTj8Lox9L4v2OsrFX6RIoSfJ6hArRWObXN3VU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cuGOc+4bEXF/B8eLuSqm77n8DznidhMh4jh717iPcXVCq/C9y6KiOA1+l/cOUyUtBzKisMLFB3kCtYvT3exz/IZvDOLVhnouXtyiRiBMkya/hxzD/dCfNf4OdSZsBiTZem/xmQyNSth4HmaOr5J8sbRlU/ivvXbI2tBY+xuHccs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XXmG+AmY; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XXmG+AmY"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-38ea87caafeso6197383a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 05:59:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789045141; x=1789649941; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DlX7uEp+xJt+DRWD58MvDXb25/Cat7Ywclf9fNm7ioc=;
        b=XXmG+AmYeQA5wFVZe4dPHhJnRvIQuS2SddhNcQiHH8MWPBka942XMgjYgqNim3IeLx
         d5kwADZa1r2xjLVXZS/IRgIuIXmk1EBm+iq4gz1jq2nxgAcm9FcUFxqT3Y+N+k5LRbW5
         NyWO2uFYIZyvnY6xpaqDDykqGA9ItPmv7/iPBTORP3fZYi9Ce44x3j2otet0gOwLw7U9
         Ui4lgmQtiJ2tVBiB76vksrXK+3oLxxHYq9frS98i8BA4tfS17PvA99vzc+rp75NK3WMs
         /Q7Wp6vskMvUGcw4zyXMe7Cn1bPbiv/O3sYTBj4y7bFF3vBznrtc455dH/wuAz2euoRe
         DKfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789045141; x=1789649941;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DlX7uEp+xJt+DRWD58MvDXb25/Cat7Ywclf9fNm7ioc=;
        b=szb+vHxjKG2w1/RIWF5qwlmsiIJ3NwySYkBN6yIR4GgDjkfiAriDpf/QpIv04+qZmW
         QdG5Vr18qquGWv25VkKm9z58wk0k4YcfWMyVMK8xH27aBcEBQbfkDQHCDflsbGWkO8rP
         b+aWfX3uLdzM282/sAc9ILNqz+OpAk3ObUxM5r42qc9zPw+Z/wruMyw/HAdiSjyQoawl
         qXVcTUSwQWEl414/7MYL0U4HMx3XoifSHXXklt4aDExqeg1pkLHdOYDZrHK/hgNb+Xpv
         wmiLGPP3L7zHaEwUf0zIn8TeglqHzLSCv4Ix00aRr8z0yC1dqESS3CB9conEoVEFz5Hv
         9Agw==
X-Forwarded-Encrypted: i=1; AKwUvByRNPjJ8znXDjZdasHPP2vlFI4BnQEZhpCcoMFRmYZG0zrveFC8DUIyt8DJB5Fg+NaIKcCKiabaQNkkzr4=@vger.kernel.org
X-Gm-Message-State: AFuF++ntdJtudKIwgiem2oaaUxV6XDd+3kXwjgDkQ7h4YxDkHoeVvTtN
	J8bru3dyy1O631lmikErdtyYOv882GmmBEGWrHlifiCegp0YtA9SzwY1
X-Gm-Gg: AYBFou3Gpo0RskMRIdHz+2AUaILJkBgLoaZI9FRKsZ2Gx67DESICyJWlqC0XJKYRfP8
	Q1EQow8TPAF3jInTorIngvheFw0YhyYylFfOAuvWeuqo2mVgvryagqXjKlfjh2g3p8kFud7b9du
	8WkiGdYUDfvbG6ZQ6sXUieZd/OE+QS6s4k/5zGv8J+TA83rw8mtoQALHaCjgaHCNIOlJcn4yM+M
	d3rciW6WFntYIRxnv3kICN6dawze4sf+p5Y0/odi7ss5uzX39hjl1JhMrMVUDzbqQJ3CqwmhGrT
	YNxQGUgltn+zVerH88FOAxGgSnniJocqvcuJzmlUAWVdB98oW4wfyV6vwcU29VeKmWzuT0BZeGW
	JvEnK/wB64zjYWGqAtkDd0fHdb1tnSB0GXsAVHGmgZOfpQ4IlX3pNVYfwa64vJmI+LGgS277P8j
	55f0Od3deQKDLLruY5qr9JjbiQszWewFs5CKCVqBRmHLpd4N038bzooZANFbffWIs/jQo94xOcH
	TGqTWKQgoVlUZ6hSxBIBz4B8HSKNAN0i2S1IfQIvBj9VtnWA2TJ4z5o36g7Yt3cWqCC0sWSdiI5
	ct95cIfFnoYwI/w=
X-Received: by 2002:a17:90b:3a81:b0:398:c292:ac80 with SMTP id 98e67ed59e1d1-39b2612eaa4mr58543997a91.10.1789045140953;
        Thu, 10 Sep 2026 05:59:00 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d7e77b1afsm4891592a91.5.2026.09.10.05.58.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 05:59:00 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Cyril Chao <Cyril.Chao@mediatek.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Dan Carpenter <error27@gmail.com>,
	cassiogabrielcontato@gmail.com,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 13/13] ASoC: mediatek: mt8189: Validate TDM MCLK frequency
Date: Thu, 10 Sep 2026 19:57:42 +0700
Message-ID: <20260910125742.150902-14-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260910125742.150902-1-phucduc.bui@gmail.com>
References: <20260910125742.150902-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

mtk_dai_tdm_cal_mclk() accepts zero or negative frequencies.
Reject invalid frequencies before configuring the TDM clock.

Fixes: 9f202872ba04 ("ASoC: mediatek: mt8189: support TDM in platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8189/mt8189-dai-tdm.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/mediatek/mt8189/mt8189-dai-tdm.c b/sound/soc/mediatek/mt8189/mt8189-dai-tdm.c
index 1b51027c6cf4..7748b4ff2c72 100644
--- a/sound/soc/mediatek/mt8189/mt8189-dai-tdm.c
+++ b/sound/soc/mediatek/mt8189/mt8189-dai-tdm.c
@@ -381,6 +381,9 @@ static int mtk_dai_tdm_cal_mclk(struct mtk_base_afe *afe,
 	int apll;
 	int apll_rate;
 
+	if (freq <= 0)
+		return -EINVAL;
+
 	apll = mt8189_get_apll_by_rate(afe, freq);
 	apll_rate = mt8189_get_apll_rate(afe, apll);
 
-- 
2.43.0

