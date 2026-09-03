Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2220638736E
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 05:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788412353; cv=none; b=RTd+9i5lVK6Df0uxlquB4n0rBHS9RixTheievMTiPaSQZHQYgI5N82w1ww+kOU3KjtbeyuLG5i4PJMK/lreDvrHsR0X0aKf1WgCYRjS67S98jhmVYSmlCfI2GvPETad1H4yttwb+Sv2i652Vi2o+GAsrb17zlqfd04fX1TtWvcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788412353; c=relaxed/simple;
	bh=IMMNfAHA925c8xRPeFIaX7picSPtRX32u3H+Rxm6mmY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PixcqpEvjwkqu4FUPeyxp0nDr8vsrkl/Ar6OZYsoNImYqNFS/Z7/YBxTGFem8/iff/8YCzPe2BWwlPOkGElSvIk7cXby5Xa/VPvr5H9xCacSjVLCdfS4v5/jsm9NuXjo/YwV5KNBEcUSsWYj3Q0Gc362PhNCxsCCn0zUlv7wWL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NFL8vXf3; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NFL8vXf3"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-398e9698a70so1838629a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 22:12:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788412351; x=1789017151; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bQlCZdv6KNUR0PACOoD9lgtTeqoM7wiIPRUAOQBrgJY=;
        b=NFL8vXf3VGaIJZPqkSa0ofqQsno/jCjN0fUr424mibkV4jdAXzx+ctAiGkJyKghWih
         N0HSqNtIwqUwIFNo+YwbWMjaOLMC/IMA+MeRDS7IfOnUerO2tU+VY1wasyqzG4PSRi55
         vzMZk3xjycpEzCaEaX+ovc7HLNM1ILrJ2z7E5dluvrAHBLRSfxctJ3csREUCQDKttwYa
         /6xkWk9HmQpWf7fV0Etqt9CGR7eZgnDKnIwvj7i7LQGulgpaEktByj2ChR8JlqqiDas7
         DRM+FuS//DGr0ojGHZfd1/Jqj3t0cEpvpNt9rOaW2g3lajD3wYuonSksBs4yMIIZB6hd
         4LaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788412351; x=1789017151;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bQlCZdv6KNUR0PACOoD9lgtTeqoM7wiIPRUAOQBrgJY=;
        b=eTN3Py+/TNSyKr3av0b/TkoKZPvHRL/5RvmMfGCwAQ5VK6DvPo9iTSDRKnHk1HK4F6
         +oY14uCpQ6NnLM2fm3chuUQEWc5qQUlc+pHt1py8QSjsrZEL0zJxw0ZoLRpyF5Xj2i/r
         rsgP/nXp54nA+okJeCljNeaHLsuInh5nVShhc+XpCVzCsJ704i42/yKw/mO6nUymAsWe
         KX0MKSuZL5+KyU2lHU+H9nrD4y+3j2MLoDhdck/3BXdDrW/wqR6Jxo7zBnwqyaoqi0Y2
         7r2Ugus4258LQE3U0uiCQArKbkVX/8ljByH5Q3T9xBqCXbowO5/RndxSBdQwvtlqgNE/
         MbGQ==
X-Forwarded-Encrypted: i=1; AKwUvBzhH1v23W9Dc+x392a8pexD/b9CTkNTJSXAepMFDA4TCe5NV7qKYUT7T4NxKgBUwU8mWt7ViCEbjD9g8TA=@vger.kernel.org
X-Gm-Message-State: AFuF++lpEA1IBQ3Gx2l7tYVkP0tW32cYNo6Yk7OehrLgalQiMOIfBQ65
	PKLBF3MBs+6EZoacLn+wOUt/dP3nNSc3Rg1ag+dBcuA4STQbxxnypUWw
X-Gm-Gg: AYBFou0NyoP4rXZ3XvglZ+5Him1adJ93NpvTqs+Q0CFEHcArKf0nPhoyPQ0F4ERS8S8
	6xJiLE82hpzrSnZEnq4Tknwx9y8oQ3EJEsmXsqzWqSbyQgNHzTPpjCYQKv52nzcu7aGA1S4cYu9
	5rHrEZa1FKt3GMjGWVb4lFM2wuo8KbTAElo7YiIt94FGbYzAmfvqetV20GEzH2+nGND3tAkucP/
	tTKlVEzk5H7vjS4fOtSbzF5iCNuigftGL9M9Qb+HYWkyARhtTBH+tkkLGSHX8g3unOVtv0PGfOM
	IhX9khqzSfM4d7Yq0Vl+mm75ljFEoZOii61IAWx4I+eGgkqtjm+Gi7cVnu/XCAUWwvmE6W5/E42
	4hUGaBGU5GAe3LQfri/jWIl0ymsEpIjwU9/yl+ntn/nYouGYQiCdwNdid/wkGvmHLd+3E5VDOGS
	VzeM1/Np+AS7XuMUOHbwWPbJ42sDRjXNpDsXdKEzcZVlOXR2l1q2RRmZQla63PdLO0B8UEOjo7B
	HhX1RwdNeudp3w2lQHBT502lmU6lpOoktnjqopoTB5gtIeqRxbVRPvp1XwmdKU+5XSTlDO17daH
	kWx2
X-Received: by 2002:a17:90b:5288:b0:398:9bd1:3214 with SMTP id 98e67ed59e1d1-39aee123ff5mr15589958a91.21.1788412351417;
        Wed, 02 Sep 2026 22:12:31 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b0875ce14sm3218092a91.13.2026.09.02.22.12.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 22:12:31 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Jiaxin Yu <jiaxin.yu@mediatek.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v4 5/8] ASoC: mediatek: mt8186: Fix MCK error handling
Date: Thu,  3 Sep 2026 12:11:47 +0700
Message-ID: <20260903051150.178057-6-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260903051150.178057-1-phucduc.bui@gmail.com>
References: <20260903051150.178057-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

The mt8186_mck_enable() function returns immediately when a clock
operation fails, leaving previously enabled clocks active.

Add error paths to disable previously enabled clocks before returning
the error.

Fixes: 55b423d5623c ("ASoC: mediatek: mt8186: support audio clock control in platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8186/mt8186-afe-clk.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/sound/soc/mediatek/mt8186/mt8186-afe-clk.c b/sound/soc/mediatek/mt8186/mt8186-afe-clk.c
index 77a0cbc8ee24..62b008b7caca 100644
--- a/sound/soc/mediatek/mt8186/mt8186-afe-clk.c
+++ b/sound/soc/mediatek/mt8186/mt8186-afe-clk.c
@@ -520,7 +520,7 @@ int mt8186_mck_enable(struct mtk_base_afe *afe, int mck_id, int rate)
 		if (ret) {
 			dev_err(afe->dev, "%s(), clk_prepare_enable %s fail %d\n",
 				__func__, aud_clks[m_sel_id], ret);
-			return ret;
+			goto ERR_ENABLE_MCLK;
 		}
 		ret = clk_set_parent(afe_priv->clk[m_sel_id],
 				     afe_priv->clk[apll_clk_id]);
@@ -528,7 +528,7 @@ int mt8186_mck_enable(struct mtk_base_afe *afe, int mck_id, int rate)
 			dev_err(afe->dev, "%s(), clk_set_parent %s-%s fail %d\n",
 				__func__, aud_clks[m_sel_id],
 				aud_clks[apll_clk_id], ret);
-			return ret;
+			goto ERR_SELECT_MCLK;
 		}
 	}
 
@@ -537,16 +537,25 @@ int mt8186_mck_enable(struct mtk_base_afe *afe, int mck_id, int rate)
 	if (ret) {
 		dev_err(afe->dev, "%s(), clk_prepare_enable %s fail %d\n",
 			__func__, aud_clks[div_clk_id], ret);
-		return ret;
+		goto ERR_ENABLE_MCLK_DIV;
 	}
 	ret = clk_set_rate(afe_priv->clk[div_clk_id], rate);
 	if (ret) {
 		dev_err(afe->dev, "%s(), clk_set_rate %s, rate %d, fail %d\n",
 			__func__, aud_clks[div_clk_id], rate, ret);
-		return ret;
+		goto ERR_SET_MCLK_RATE;
 	}
 
 	return 0;
+
+ERR_SET_MCLK_RATE:
+	clk_disable_unprepare(afe_priv->clk[div_clk_id]);
+ERR_ENABLE_MCLK_DIV:
+ERR_SELECT_MCLK:
+	if (m_sel_id >= 0)
+		clk_disable_unprepare(afe_priv->clk[m_sel_id]);
+ERR_ENABLE_MCLK:
+	return ret;
 }
 
 void mt8186_mck_disable(struct mtk_base_afe *afe, int mck_id)
-- 
2.43.0

