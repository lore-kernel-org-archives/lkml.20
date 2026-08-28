Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C70532C11C4
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 05:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787893557; cv=none; b=SQE1H0K2RF8/OFI6BClJMmHHQ5gHrwQfvTxSX6U4zgrrf5Nottz9nrb2D1kibPjnVRe4Zvj2vSesb5G7ZHxNcZvHXa+idqQqtIRQxbtVokFnJsV0ZcBH7ZfIf84YAeUyvGLS/p1WPuuEF06WrTpRpVcAF41SqSY2C+0494J4Hz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787893557; c=relaxed/simple;
	bh=Q7QQT7/BVhDq1O498rAEP2puFeqnHzBBniDPqc+j0VM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Gwo2deqGN87jjCEv/h1YcDC1HdIbPcbTa/+kGrL9JdqaE3Mmk4PQ5rEOQwsTcekUnuzIfCzqJ/0yq+P8BctUqOV/D2Npey2A9PTXNyULN7og88pYJu3E3zCNxXJTICA7clhEJy2mE//jFFEi6xUQQ2bL4JUqwEw7Y6vrPNBFsbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KdOGayKg; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KdOGayKg"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-39266382df6so761291a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 22:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787893555; x=1788498355; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aHaGtDWIabgwE9bMPCVResetCLU3h+f9hWvuf0/laf8=;
        b=KdOGayKg73h5yOVMTM+lSR4hOWBJPZ9EeCrACOzM/88sTIJybLIcIcuyMLowwJK0q7
         539iKbNghWjo/eCAnF8qePEYZV2YqDRKxMkQhx5gYtru7NiA+HYZPBH0eZ44apF1nQKE
         b7UrFLjLRKd2WR1rta6KBibc8U16AvMlJeX8cfGFxQxffHvZQztm4pErP+VuamOtSHzp
         bsNGIBFZX9SJCkmitV2gkeaIOju+cOXnfX+ELOhe+Pci9Q9Gy239DAKZFz9l39fMnUBr
         d00VklGy6zUpyAkidyq0oaKuHK9t91gtUqqSn+vYTsfX/3duRgQOqoZBuJPTzkmcMKyk
         wyyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787893555; x=1788498355;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aHaGtDWIabgwE9bMPCVResetCLU3h+f9hWvuf0/laf8=;
        b=FT7L4P1WYPSFDvnMuJyqZSexdxB5Fh9VURBkAUzeUH/qVqVvlBH9Lcx1/J6BfQ1s4S
         EAKpprhrNE7CQfYoOsBftfs6r0uww+ygQ0XgRuj3hedfMPe57QyBITgbGp/BO1Unhvyi
         g6KkHp6wSBQuQIOxrN/HWirVRw5bm0TyK8HdHM7+/p6SD/jiE+oH4ycyvdSwGr2gxjXf
         RG/LDLzxZuoqOfpEjqURRL9yZIBEnS+ZiIgYuYAqEorAL4oCyuFrkulnIiVjzUO6F8J9
         fw1if0V7ZSx8sdtKsT8qSgjMKGycbZ4yQsWRLc9dewwy8lUanMQ1iQOXgehWYwMGoP4E
         6BsQ==
X-Forwarded-Encrypted: i=1; AHgh+RqlHxTj51cEPLKMGbSi/AQfbdh7TSPTJxccLqV3l0fiHFiSGSfFTfQgqngeCtmTsNLpBO7orjlyUHEziPA=@vger.kernel.org
X-Gm-Message-State: AFuF++kFq8G3aayXEWuRt43sZUfSj24Xn28rHb0g5GweH969KpmAX756
	dfYH8uLn+ewFCQA8w/AmvWrcZ2r73XIXMs/ky+CZ9hlu7IFoMdx/voIb
X-Gm-Gg: AR+sD12SC3uCgMOj2tw+GwD1FyG9/m5Uj8x+bHagCKNoMumK/k83omPVobM/M6KDLPS
	9gRuQFCBT7bmfyGaLtuNK2+AkaTbTRSHF1icwD7I5OxOrPXLb8enUtbfqo0D+0hzODEZnlxMUuY
	QMIC+EaIAfacYtPBog/Go3ufzH+n4HlzLofuzFagDiNFRcVWnFkajWcmYEx4S4f60z8KFvH7ZUA
	iVhkWSXnc1vHNpA4fVxIUQlZKB7gJs1rIabSiWda2gM7I29MYxRIybJQPd2AdBkKgDxOjvMQ+qx
	4t5LNfHUJw+g5ZSHgfngU3UKdKojdUQrZrV71PwcXPvMaQELhFKv9EqEVuUt45vIwRDnwSqrWmK
	dXM9QKmx1kyg8u6AyI1DycVgGSM3vIh0Nk+M7e5uDx7WX40DRg68fSHLXUvneY7InZt6XPMEBUz
	v3aA0cInaH0A3XDHDeVMixkITOSt3e8gRjNIXbCKbfpS7dnX20TjZqjlX/tOKeD5zJ5LbWpTsen
	b/YEKSpNuoFyLOuJqykSRvQR5vJo/X6c1jECKyrn9V22r2XFycPOzK3AU6OjIUq+U6qZ5aErRoY
	UQO4
X-Received: by 2002:a17:90b:1a8c:b0:366:3517:1aa2 with SMTP id 98e67ed59e1d1-396d0c0ffb5mr8090761a91.0.1787893555138;
        Thu, 27 Aug 2026 22:05:55 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396dda7c922sm986549a91.7.2026.08.27.22.05.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 22:05:54 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v3 1/5] ASoC: mediatek: mt8183: Fix wrong clock cleanup on clk_set_parent() failure
Date: Fri, 28 Aug 2026 12:05:22 +0700
Message-ID: <20260828050526.590761-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260828050526.590761-1-phucduc.bui@gmail.com>
References: <20260828050526.590761-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

In mt8183_afe_enable_clock(), when clk_set_parent() fails, the current
error path incorrectly cleans up the previously enabled clock instead of
the clock used by clk_set_parent().

Fix the error path to clean up the correct clock when clk_set_parent()
fails.

Fixes: a94aec035a12 ("ASoC: mediatek: mt8183: add platform driver")
Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v3:
 - Add a Reviewed-by tag.

 sound/soc/mediatek/mt8183/mt8183-afe-clk.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/mediatek/mt8183/mt8183-afe-clk.c b/sound/soc/mediatek/mt8183/mt8183-afe-clk.c
index cc4f8f4d3dab..6ab0734ad136 100644
--- a/sound/soc/mediatek/mt8183/mt8183-afe-clk.c
+++ b/sound/soc/mediatek/mt8183/mt8183-afe-clk.c
@@ -137,7 +137,7 @@ int mt8183_afe_enable_clock(struct mtk_base_afe *afe)
 		dev_err(afe->dev, "%s(), clk_set_parent %s-%s fail %d\n",
 			__func__, aud_clks[CLK_MUX_AUDIO],
 			aud_clks[CLK_CLK26M], ret);
-		goto CLK_MUX_AUDIO_ERR;
+		goto CLK_MUX_AUDIO_INTBUS_ERR;
 	}
 
 	ret = clk_prepare_enable(afe_priv->clk[CLK_MUX_AUDIOINTBUS]);
@@ -153,7 +153,7 @@ int mt8183_afe_enable_clock(struct mtk_base_afe *afe)
 		dev_err(afe->dev, "%s(), clk_set_parent %s-%s fail %d\n",
 			__func__, aud_clks[CLK_MUX_AUDIOINTBUS],
 			aud_clks[CLK_TOP_SYSPLL_D2_D4], ret);
-		goto CLK_MUX_AUDIO_INTBUS_ERR;
+		goto CLK_AFE_ERR;
 	}
 
 	ret = clk_prepare_enable(afe_priv->clk[CLK_AFE]);
-- 
2.43.0

