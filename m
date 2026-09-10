Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E453F489FDC
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 12:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789045087; cv=none; b=d4AhvjBoQZajXXvs8MovakSja22Z5jUBcWegiq9LIfGAsR6UbIQbiqaG9KXmXBngYGNRbhAju7oldCAkHS7quIkuCWi4L4niDwxh/WEsaWtzzXMTBfdDIaR6ztCohnsdLTlXqrYoL13FKlKnFUPKNAM/0iGwLTMyWfbd+kjaY5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789045087; c=relaxed/simple;
	bh=EVDRcKmTVQAmuHJWES9U2hQGWq/76vGUhS5zLMa3z4c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jMuXzN929sg8MBaAdc2AOGrR4ywOXjx43HLcuDM79swnGVDly56nOZ7nv+QylFf0eEfmLDTkfBDsiajJbgbIH+u46FuMJCvtm6ZJQm7xSapZO2BSd25l698/pxndu1v/NaUJPeka649D0f/Z5KVhhdmu70zV108kRPwJp5s6KQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NnXXgkkJ; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NnXXgkkJ"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc1cebcb8d7so817361a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 05:58:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789045085; x=1789649885; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UiWyf1Dh9nthmX1SJ2zMjXD0YayBfWTFNKR/lg5M5tg=;
        b=NnXXgkkJqpobyICWryKKYqtxScJ9nTHeIqtGe5QkiqQCA4IKbCz2fRJvB9IHWN1BQ7
         H0McH/ZAfuAhStKtr9okXryVP/Z3YeCrPCfLVpffq7PVIUcEI700KYkcPVJ0NsYDZxwN
         NgES9Q/QjQ79RLG2LX7Q4dDqTVak37YqqLFM/2MY2ShdFkUem9Olh5ceUJUz8y4gixrV
         5M38APvgEWgkb0wk1IBZJJIy975ppI4e+iU4YS4aqkNawE3FAHr/hA4fXfH53Pfd2oh/
         i6mWgVPaM47+erWVBLEAFPtl/FT8DkusEKOPEk69f6l+3J6fjpElC+xDL4NGkGmPoaqN
         8mtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789045085; x=1789649885;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UiWyf1Dh9nthmX1SJ2zMjXD0YayBfWTFNKR/lg5M5tg=;
        b=FSdZKShDp3mP+atwRLv3LbRXxIT0aTxzX0t5E3PH090jh6bee02y3uUbA11WoA/6Iw
         KxbDLvxpEBcwbKG/lbRb6itdHOf5iLDy1lzxCDiMRrPoCFSjeoIdMbfZSj5Maqf4uDYc
         jWvVyTtwJYdCAEyRPvbwVG407v2KGkt/nHMs851osw2MaAgk/kgrafk0thsnSkAR1ssi
         XWEVxy9tusprJOICHcacKm7tFr9B7rSUFaCxi/kOxaMwKRloLmTZZU80Ww0dPKprhlZa
         IXXiv63hem9D3mtbSDY326BhNBKguvlrgo460HtJga+5JjKTAYteUo5yn3YPJqHKAQEO
         sINg==
X-Forwarded-Encrypted: i=1; AKwUvBwOTpG1U4rsxxt9AWeCDcmLBBiSFlzIrZLJ0ePU34ZSk85wODBDRLefI7dPjH8K0K+JgSydpSJjGCosfBc=@vger.kernel.org
X-Gm-Message-State: AFuF++lNVn+dhReIcAqpczwsHdcYxRNXQ+qeTQ2S9iiL70sgbERk8Kmh
	eiGVmBLlPCF8nCasdKczKIt2qmcRaGrLnKjSx/gB25yjImJ/0sfPwDaK
X-Gm-Gg: AYBFou2mXoq0Eood/rGcnQt7WOR1kJ2QUfLDOQP3LlShM5LofcypZNym2HCxZaNXO1m
	AJvIICvzxjGJTiMVmBYK599JaM1wf/TpTzPq+Nyl2XmaWkdfqzbv2u+jQfDyYAGAu/wagw9fQO2
	VKFUQoyOImkPI7tIXxfpQe7iigGa4jKZfkHdHa2C9FwrhRtTBqklkP4AR/6OffZeZD54ILgCuSv
	lq4Vp90eqL+nAIzYay8fGi2OosbRxMkaTlIDml8hs2t/Ftrt+lk2Z4lP92nDOZ0xByGDDqCeygJ
	TA+8npvYhsEAc/t8jX8hbThCKttKdl6E1oEC1wTSf2f1HIzxn8sRZ2pMEpChWJ6fmman5ca6tVk
	os2SSUD48B3Yb+K5P4ZUu7bYLmQ1iW3X0eRMqIDOLuG3AmQP+rCjetqeTDTgj0BzKKMf7US7hFf
	gHKDHhOvrFlHl7cFkC2If0vbjg4mu2AQB661pA5I671hDUjEEXjd8wigtbLKG9VmrI8R/xx62sb
	gCOg99EAKXHz1DKDrM8u1Y1KcK1Q+8VisnDM8kb6KSLS/k1SUtLJgK4H43E1jDC9FxF4rGq8uRm
	qaSucJO4MeYsJ/K9xDKchg8kBg==
X-Received: by 2002:a17:90a:d406:b0:38f:de94:bf34 with SMTP id 98e67ed59e1d1-39d77b1c378mr4389281a91.10.1789045084933;
        Thu, 10 Sep 2026 05:58:04 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d7e77b1afsm4891592a91.5.2026.09.10.05.58.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 05:58:04 -0700 (PDT)
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
Subject: [PATCH 01/13] ASoC: mediatek: mt8189: Return error for missing regmap
Date: Thu, 10 Sep 2026 19:57:30 +0700
Message-ID: <20260910125742.150902-2-phucduc.bui@gmail.com>
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

mt8189_afe_enable_top_cg() currently returns success when the AFE
regmap is unavailable.

Return -EINVAL so callers can handle the error.

Fixes: dc637ffeed6c ("ASoC: mediatek: mt8189: support audio clock control")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8189/mt8189-afe-clk.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/mt8189/mt8189-afe-clk.c b/sound/soc/mediatek/mt8189/mt8189-afe-clk.c
index fc7a7a73b0cf..63e03a40dbbe 100644
--- a/sound/soc/mediatek/mt8189/mt8189-afe-clk.c
+++ b/sound/soc/mediatek/mt8189/mt8189-afe-clk.c
@@ -236,7 +236,7 @@ static int mt8189_afe_enable_top_cg(struct mtk_base_afe *afe, unsigned int cg_ty
 
 	if (!afe->regmap) {
 		dev_err(afe->dev, "afe regmap is null !!!\n");
-		return 0;
+		return -EINVAL;
 	}
 
 	dev_dbg(afe->dev, "reg: 0x%x, mask: 0x%x, val: 0x%x\n", reg, mask, val);
-- 
2.43.0

