Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D3744F7983
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 11:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791977300; cv=none; b=f4vFPBC5Q64Z8J+psDpJCSyVs4XQ6X2iUgeMsK2jaX0tDJkGEj6Ij6Zbn54G3xn70TZqUS/G0486jEgW6WXjhI4TRpanydfZ+hkWSpKkVRUOLnFyK+6HLYAXdUXTlXyrv0ybHW360Oj+kC1s/7YLhlV7A2kobsxpnXlMgPTF01Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791977300; c=relaxed/simple;
	bh=BqOIdOWIc7Bbbr8ZxXOpLUQh36ChMcfJeTwhKtu2ZR8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GTlDbrQ31mbuX+TNSyEEnfsvqnQr/toMcDHb3OmYR4eXc9F3GR2O1vteKUY+khHy9lqJq5VAlAIbTxMVJ9xMF52TkEfzB8BklEwXU2KVaT1i1GXG3WmSg8gkBZwBVYkPB4mAu5m+gwY29QlfoPZasHimlUGi966KdugyWB01BPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q8zVxwiE; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q8zVxwiE"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3ab9268d90eso2014444a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 04:28:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791977298; x=1792582098; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dtvWIRp9yO8uIIIbpOsaLthb3JvQZmMy0vJI9vWrQ+o=;
        b=q8zVxwiE0UMYaqW2Agvhzp2Wum0iKIPcOu+iAepkvWnqd5qaywIFePv9bhQAc6OO+A
         vIWpn3Qow5Yx9FE3ix0nZA8qGR6W54h9mDG1ttg+R3hyZZ5E8aX61ysVtZU4trU8Eq6Q
         RvLDNJ3DmoCGJq8PcatEKz710v7idDrI07kbwrTf5fxytidoWvJbqND+JZcYJ7heIdPv
         ED4MPGv6Sf1v/wanm/dxVhCX1POBfeVF6TelFCbgwxgH6ZN4C9fzR7ex8k//zpWm8DZJ
         0hjHr3pM5HuJWGIWrGei8tVgdwRiom/7i2YGjIn5W5abbjZ0/5n7ap3OZEByrCGJxZ7/
         CbSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791977298; x=1792582098;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dtvWIRp9yO8uIIIbpOsaLthb3JvQZmMy0vJI9vWrQ+o=;
        b=QHjys9hibLFE2/xOuNF+bPInbH78UVys/JJAq4Pzc2bTqJ9bpEDZWHS2cSGbfV7TJL
         DZiNBNYv8CuTUIBEq/j/zsoO3huEe+TNgXNBh6LSB67dZMB/IV9SfRfFCD7jeWlggftd
         0RIUAzIAeZCcWUK7PlA/aRFJamDpPrvlOtjIaEETHvW1B+mk8Jni9xSLWw7bihqqNdIT
         qvFIchmYNFHE93z+3gkAcyMKyhs0MICYKLPoanJlaHYRw5ThHuYQ7n8rF+W9Um+ESSlM
         iaD+jOGZvsu8KZZPIJsPCIrvuBlm3dz1qATeF1UCJBpGELKmeB3XjpISzBCcSJ8xuHqt
         p8Xg==
X-Forwarded-Encrypted: i=1; AKwUvBzfDIynPekqNrdDwZQunDUzGSaEHE4cF+JMwlPGKfUZea+LlMWZXebU4mTBBj1Fb8WdAxgrEnf8Fey48W0=@vger.kernel.org
X-Gm-Message-State: AFq9FYIVQbCxUTDyKCuwqFMcLneDVlJ+uHE3dfrChSYWd0WiKXtqmmrr
	w52cpc1ZVO7adqdfHgoh3yWZk1MMVlDsVDKszwBMLewGVxdKr++f1/Ia
X-Gm-Gg: AYBFou2OVFkm+3yQrLnpU9F2RLQDHWDb4AL62LvOX9/q+T6hso/Io6CZwCb1C2v5l3R
	Z3T7CmAsgMQsAtMsXZ2h2rAZlx64wV8Hw2uhvctiGqFZpy/wSuINztHyHuIsq2Qa9FFIDnHvDuv
	CsQ0I4PY0p5LUcEbRuhh82BBk+5RUZAnPspFMou7Z8KmMweUZEv+jQGtnqzsKT8BAXALl8M5Fm4
	shFvsv+Eau/Dvp2dQplubRH4LUUbUI5DbPF9CEguuhrb81vTAMjkxB7kWZkfvo+iU8PQK+irNi3
	SNwYFQV5SEGkmD24zKxWkEFBy01T3vCEpzNDnouZ41BADc09pFRUqeEwaTXaWoFoIG+gT4y87Hz
	o+y3iSCXxoL4oCZth5jT+cRKspI6P1G1VyK7yW687TWUJchOXR79FAVm3ctQgTgmqmLPhqRPPc1
	NZRKh19gSCWB1fx3A7Gtv8Zb83TZ/lIC2NOk78bDNrbNWia5Y6QovbuB0eIfJB8vi3WpgARwA6k
	NewekTYMgLuMCEKHybjHbHlB78c1+Lkt6jzlTgSJzWKR/bCHWx3IzWdL7XEskIXm4IRJgB6pYeh
	venO1nVM5IFVGA==
X-Received: by 2002:a17:90b:4c52:b0:3ac:6c15:1173 with SMTP id 98e67ed59e1d1-3ac6c151496mr1396142a91.31.1791977298568;
        Wed, 14 Oct 2026 04:28:18 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac61171feesm4077076a91.17.2026.10.14.04.28.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 04:28:18 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Trevor Wu <trevor.wu@mediatek.com>,
	Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
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
Subject: [PATCH v3 01/16] ASoC: mediatek: mt8195: Fix tuner clock error handling
Date: Wed, 14 Oct 2026 18:27:36 +0700
Message-ID: <20261014112752.683032-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261014112752.683032-1-phucduc.bui@gmail.com>
References: <20261014112752.683032-1-phucduc.bui@gmail.com>
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

