Received: from mail-pj2-f41.google.com (mail-pj2-f41.google.com [74.125.227.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 506D03C4B93
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 04:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790311774; cv=none; b=ZsdtTKnsQUxUf2eUPvhSKMB9a+el7TwiOjwJ9mmt/hQsOpG4RhEqxzSTxuSJ1XXrtZVBHCfYr0ED+8CvnKmtxZmSLcUtcoSSxnlS82eBJdn7cU6SGDRJgI8Mnd4FMVUbzUfoRCyKqTNhL/fEmFC/6yqSSQTo3Vq2/XEVA8CKNYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790311774; c=relaxed/simple;
	bh=BqOIdOWIc7Bbbr8ZxXOpLUQh36ChMcfJeTwhKtu2ZR8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Jd71IRuM0i9nYMaFQ3g6goRw3yGZ1zV2z40cD+5/i2ylpV0Ox18wVG93aNHXzkRuJdAqT1Tz0M4wqpvNr983JhfYrnGOQYqsqoPHrDE2Qbz3Qd+Ydt5weRWrAa1+lnJy5aWqZBU0TiGnKEzVzrjQSzucEYUNCGV9yinz2O8553Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lIX/M5qQ; arc=none smtp.client-ip=74.125.227.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lIX/M5qQ"
Received: by mail-pj2-f41.google.com with SMTP id 98e67ed59e1d1-3a0b18f811cso396609a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 21:49:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790311771; x=1790916571; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dtvWIRp9yO8uIIIbpOsaLthb3JvQZmMy0vJI9vWrQ+o=;
        b=lIX/M5qQAazWf6XS7qzfo33OWftnYTdrw9Q8KutgKMSHJYRzm4wjaUdvAe/c79x1DG
         J4lwZJX7HF5T1apjYnthOdaghHNY00Xd0b7UadB2KZUq2VzBfO/3npfop1n9QCBgF5Qx
         4qQ4UlTCG8gOxL1TKwNuUrhiMaaKoUXkcIQ2juiWlwJ3sUDVBxrDSIPy7MJvoTEmCnSC
         WmW8hnFh8w7WG2BvExZRWx9Y4aHzVgJ/mqGv0S/x1dUcycsHcxDFipGmAuwNB4GQv42c
         2KQhRZ5+8GrzDADi+t5BTAHOziGqAibsPpzLzyPvh8u+evEjCKX92HRFTxpdqds84oGm
         50CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790311771; x=1790916571;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dtvWIRp9yO8uIIIbpOsaLthb3JvQZmMy0vJI9vWrQ+o=;
        b=z97hF3L+T2+AyccnkN03arAc+Mv6zJVsJOorvAxKMPv1/m24Cb8H4Bd1uxSBwzi2x5
         ON5RR++IYSYJ2uUJvTWv0w09UOIWhjtcgNfJIwNdTJrSicXIpskm2HJ1umX7vUhx5J2o
         ktm2ApoQEHAhTHzdBXGx6H4l8VT9KTpMeJOeqR57VaJTvOPA2MJ0C1/axFsyazuSEsDE
         qPRQ8aycR6Vz72UWH1DVm01g85zGnNhN73YTmE9oP/QVjABWBKDJZbtDOQSb66uAsND7
         qQnb8HVFpMG5GnraYsZTAg8hwTJWaAXbR7LzP3uaXw/zKwEmpcnUJQlZ1wRPeffZKnK4
         HFsA==
X-Forwarded-Encrypted: i=1; AKwUvBzMkuOQAcYIULJbjSZuXohRepFTtoEcKrecB4xIerr59Io8bm90dc5gRsojA+SOZ8aAhoZlR9CAvLlV0CI=@vger.kernel.org
X-Gm-Message-State: AFuF++l9YX/UMLuduRHGRK7aCfbvzUlQvtoi4ef95oYb3M8czTL1ymTC
	oCcOw8VAl4E1AULoRUeUi6TQ/hRNCsfgcGsN7Efg/iJVIBs2cQ6TUwQD
X-Gm-Gg: AYBFou1HYsTCzn3LdZPmALSvArlzFdv4MxmH8mCwxFHKRbKXE4R4VidU5rX1v8znCh9
	bGGMaHtxBdj9efWja558XX3ZXPzb+cieFSvGPBjzwSHReC9Cle8NfXNu6e+C8olalX16NjMv+Ku
	mpaQiQiq4c3W54PbZLntN54RQ9mSxUL5g8rqtC7WycpU6KVa9zx4IreMRThOtZoA9tBDBzPmKSn
	zgoR3nbcGI3YVYIqrpXodTB0mg86/59giRi7skXAMhu/4x47rVhA+cryqcJdA2BEr8K2jppH4se
	zJdgOwyHy7/KZat24xUyeZvJC1TaZ71wB8R9V/JwPxofPp8DKOe9oG418lK10oxE2hbyDVUXwHr
	XQ9EEq3sLRqgET7gxoJFhheplrOBgSYzac3/0ORpYyaGjxi2WYGCrgBxh4otjXwUJtUsh2XORDa
	1tEdVfBSUdfkZZ5tHwNtocrTAWTImr8nHTB7C+4Py9s66Co18O2vn8cGYatRwZba85DSfWcbepm
	AUFFR62j7HOYy59kTN6mviD2qhNmrP/M2csvIrACk8Y1luVBbEQjSmmF1G6lYIxPd2xuE10l/Vp
	Yr37Rk+GFd6jng==
X-Received: by 2002:a17:90b:17c8:b0:39e:433:23b5 with SMTP id 98e67ed59e1d1-3a098b973c5mr4047368a91.5.1790311771625;
        Thu, 24 Sep 2026 21:49:31 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0976cacbesm8151528a91.13.2026.09.24.21.49.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 21:49:31 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Trevor Wu <trevor.wu@mediatek.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	cassiogabrielcontato@gmail.com,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Haotian Zhang <vulab@iscas.ac.cn>,
	HariKrishna Sagala <hariconscious@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 01/14] ASoC: mediatek: mt8195: Fix tuner clock error handling
Date: Fri, 25 Sep 2026 11:48:55 +0700
Message-ID: <20260925044908.450775-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260925044908.450775-1-phucduc.bui@gmail.com>
References: <20260925044908.450775-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Check and propagate errors from mt8195_afe_enable_clk(). If enabling
the tuner clock fails, disable the previously enabled APLL clock.

Fixes: ff5a90173d98 ("ASoC: mediatek: mt8195: enable apll tuner")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8195/mt8195-afe-clk.c | 24 +++++++++++++++++-----
 1 file changed, 19 insertions(+), 5 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-afe-clk.c b/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
index 618d8400913a..ec1ea5b988ff 100644
--- a/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
+++ b/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
@@ -241,21 +241,35 @@ static int mt8195_afe_enable_tuner_clk(struct mtk_base_afe *afe,
 				       unsigned int id)
 {
 	struct mt8195_afe_private *afe_priv = afe->platform_priv;
+	int ret;
 
 	switch (id) {
 	case MT8195_AUD_PLL1:
-		mt8195_afe_enable_clk(afe, afe_priv->clk[MT8195_CLK_AUD_APLL]);
-		mt8195_afe_enable_clk(afe, afe_priv->clk[MT8195_CLK_AUD_APLL1_TUNER]);
+		ret = mt8195_afe_enable_clk(afe, afe_priv->clk[MT8195_CLK_AUD_APLL]);
+		if (ret)
+			return ret;
+		ret = mt8195_afe_enable_clk(afe, afe_priv->clk[MT8195_CLK_AUD_APLL1_TUNER]);
+		if (ret) {
+			mt8195_afe_disable_clk(afe, afe_priv->clk[MT8195_CLK_AUD_APLL]);
+			return ret;
+		}
 		break;
 	case MT8195_AUD_PLL2:
-		mt8195_afe_enable_clk(afe, afe_priv->clk[MT8195_CLK_AUD_APLL2]);
-		mt8195_afe_enable_clk(afe, afe_priv->clk[MT8195_CLK_AUD_APLL2_TUNER]);
+		ret = mt8195_afe_enable_clk(afe, afe_priv->clk[MT8195_CLK_AUD_APLL2]);
+		if (ret)
+			return ret;
+		ret = mt8195_afe_enable_clk(afe, afe_priv->clk[MT8195_CLK_AUD_APLL2_TUNER]);
+		if (ret) {
+			mt8195_afe_disable_clk(afe, afe_priv->clk[MT8195_CLK_AUD_APLL2]);
+			return ret;
+		}
 		break;
 	default:
+		ret = 0;
 		break;
 	}
 
-	return 0;
+	return ret;
 }
 
 static int mt8195_afe_disable_tuner_clk(struct mtk_base_afe *afe,
-- 
2.43.0

