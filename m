Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1E1648CD4F
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 12:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789045115; cv=none; b=cAoP+zR1Ijkpjw5t7E++lanw/YwdRlwZcpoe0UbNMZVTbJOC7pCx2Ec29by6GBxtKFB1qeQP1zlUBHiC2P/Bs+BEpcQSkwH4IeIaQJEWr4DLV2uDpRCg03ZbmIfqYsqmbA9cc7zT1DkWqtBQEjDAW60NW3tRi3B085/CsGgHaOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789045115; c=relaxed/simple;
	bh=yM4L3d5xAxA3ZdEO3lRnqdCQHhz1gw6fuQgVMe41j5I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EEYx5DGFxh22dpBcgf0tivYM0jODtCgnSdT+ImI21XEdT1CRtSZQyfkkFdeR7HnYixlKxaJ0Uv1nuZKTUeR2iP7WIT4qz/JfyxlyH89c1wQGahzYXRgLiJg6332bFELu5tuIpUZxT4Q2Dr/05FfX0lzqsbYKAyQhI/ExtbiAbUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=skQAj1+4; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="skQAj1+4"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc4bdf8acd6so342002a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 05:58:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789045113; x=1789649913; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X0f+3hmpde177tradfD9iqffBrSGUNX0UYvHhWMmKXM=;
        b=skQAj1+4eJCaWdBS4pZ/idL7FrFydoXhJKy8mgLTV1REAiLYGCN821dfRHngaWgAiz
         yF9GVXEv/yTMsMG5EBCC7zb4h/yURwTvrq4CeBPV9doYYSdY6FULvUgHEzZoIsNBylwL
         dub7fSmlYlgyNqE07mxsxujxAR4rvku6xCykfkdfKyOBqCKPIF2mGTOQxLMh03L6J3EL
         E6X3zH3F1b8aZHw/zfms/tsQ4SECk2fGREBZdidZT/ZH0TMMC7dXoqw+L07f6EI/1sLN
         U29zBeB2wzkjwz8+tHeFBzNXcL/GzCoinWWfNPezSrZN00oTCRVBzetJ/yUJO34qvP8I
         3SWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789045113; x=1789649913;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=X0f+3hmpde177tradfD9iqffBrSGUNX0UYvHhWMmKXM=;
        b=ZNtBmlRB+FMv6fX8uC7tw7lCD9qsmM78GR42dVqjLNhOOQVeHMCIy9M4KBs9vqTrzN
         VoAfslTCSr0xZEBw2/2LPN6vPWYG5n0klMk1NMpcpTTSVXmonzD2Q/7fWKlV4i3kIils
         YXhObDqapZlxN3tZH+eFeVgKu2k/uhclxIGtZcE1MWMcDjYLGEKQavHH8onV7HHJ+5hv
         cv1YvaqVu4f1cdJ+SU05Njxp5VJrJ2UPgvQjZq4j3MOqv24cpVXHL0/2MiYqDbnep+wk
         LltYqh+q89R9HqXW3YIHAB9qQKM3l0uKCYTFjI42Ro82F/rTcrUNhrRk2OekHbmif+6H
         lRdA==
X-Forwarded-Encrypted: i=1; AKwUvBx1T1NPSzeXLLTLDlW5leLlpZpNrSMcT9MUviFTq2H4mlzHBoVkgIDAw7e2607Eo+WFM+CjTSQrpLOWRqM=@vger.kernel.org
X-Gm-Message-State: AFuF++lKiNVp9D8SA79mBZppDvacBaIlL9/vIk9PnBbp0aZt+1y8owJC
	e6PrjmcyzdpZ5iS5h8R4LHYhJjVunUCZNT16CLpx6GR3OiOaECdzg7R4
X-Gm-Gg: AYBFou3I2OJuvbTa2DTUx9wpdEgLGgJMmtHYQ7iQ92JTJWE9pTH7gpeTYCFkY3ur65Z
	P9SFawHIiHnXu14BOcjiTwnNANdO/e9LMyAIlm4Vcv3lGq3A37g3OKSQ9EcHbgsibb7Wil7fpaF
	ZJFJhvPHdWORcJx4+OqrLBk+WZSmqSGGVu7O0f0K1QqD8KdgKLE7TvAHOCXj3snGrN9xz3uIS9P
	09wOQrwV08A0Y6SVWQxcIPgg15Ybk3pzCGmHXXy1g0GQRMcpi3DZE9xwY7NdYasuzZJPZzqxmd2
	ZZXkyoMBKSdNsXE/9k/zPDmWOMNYpuF5MEkg0oxDwqAngH7Mjd/Z84RXu4ckBfDfn9L6emB+trK
	vf/RWYa1qt815TA0GDLeT0IkDbGf75iBZqCtt7I1iQfH5AiOvJv1NGxH4Ft7ZLZZI6RInFpQYaV
	oLlVhyDY/891fXYMpJAROfN7PI1k1iCPJ2thfjsnevup9XnOspouAng+Bg+y/ypddYJJ1ob7YFD
	Bn6WpWVuXBN16L/2/vedG4y1Z+D53lwSlaGJQ1k256G8OGevKJ0udKU+zbkbf34qDiblQ0BmLM4
	oCmvwqitGJ0+fwI=
X-Received: by 2002:a17:90b:3c4a:b0:39d:6f12:fd47 with SMTP id 98e67ed59e1d1-39d70bb2226mr11925208a91.20.1789045112679;
        Thu, 10 Sep 2026 05:58:32 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d7e77b1afsm4891592a91.5.2026.09.10.05.58.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 05:58:32 -0700 (PDT)
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
Subject: [PATCH 07/13] ASoC: mediatek: mt8189: Propagate runtime resume errors
Date: Thu, 10 Sep 2026 19:57:36 +0700
Message-ID: <20260910125742.150902-8-phucduc.bui@gmail.com>
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

mt8189_afe_runtime_resume() currently ignores errors from regmap
operations and mt8189_afe_enable_main_clock().

Propagate these errors and clean up the state before returning the
error.

Fixes: 7eb153585598 ("ASoC: mediatek: mt8189: add platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8189/mt8189-afe-pcm.c | 36 +++++++++++++++++-----
 1 file changed, 29 insertions(+), 7 deletions(-)

diff --git a/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c b/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c
index 77cf2b604f6c..431320719b63 100644
--- a/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c
+++ b/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c
@@ -2328,24 +2328,46 @@ static int mt8189_afe_runtime_resume(struct device *dev)
 
 	if (!afe->regmap) {
 		dev_warn(afe->dev, "skip regmap\n");
-		return 0;
+		ret = -EINVAL;
+		goto err_reg_rw_clk;
 	}
 
 	regcache_cache_only(afe->regmap, false);
-	regcache_sync(afe->regmap);
+	ret = regcache_sync(afe->regmap);
+	if (ret)
+		goto err_regcache_sync;
 
 	/* set audio 26M request */
-	regmap_update_bits(afe->regmap, AFE_SPM_CONTROL_REQ, 0x1, 0x1);
-	regmap_update_bits(afe->regmap, AFE_CBIP_CFG0, 0x1, 0x1);
+	ret = regmap_update_bits(afe->regmap, AFE_SPM_CONTROL_REQ, 0x1, 0x1);
+	if (ret)
+		goto err_regcache_sync;
+
+	ret = regmap_update_bits(afe->regmap, AFE_CBIP_CFG0, 0x1, 0x1);
+	if (ret)
+		goto err_26m_req;
 
 	/* force cpu use 8_24 format when writing 32bit data */
-	regmap_update_bits(afe->regmap, AFE_MEMIF_CON0,
-			   CPU_HD_ALIGN_MASK_SFT, 0 << CPU_HD_ALIGN_SFT);
+	ret = regmap_update_bits(afe->regmap, AFE_MEMIF_CON0,
+				 CPU_HD_ALIGN_MASK_SFT, 0 << CPU_HD_ALIGN_SFT);
+	if (ret)
+		goto err_26m_req;
 
 	/* enable AFE */
-	mt8189_afe_enable_main_clock(afe);
+	ret = mt8189_afe_enable_main_clock(afe);
+	if (ret)
+		goto err_26m_req;
 
 	return 0;
+
+err_26m_req:
+	regmap_update_bits(afe->regmap,
+			   AFE_SPM_CONTROL_REQ, 0x1, 0x0);
+err_regcache_sync:
+	regcache_cache_only(afe->regmap, true);
+err_reg_rw_clk:
+	mt8189_afe_disable_reg_rw_clk(afe);
+
+	return ret;
 }
 
 static int mt8189_afe_component_probe(struct snd_soc_component *component)
-- 
2.43.0

