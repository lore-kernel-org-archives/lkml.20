Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40C084078E6
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 06:12:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790662337; cv=none; b=kk3jIolHPO0NtFm5tErIBN4BtC/DLYIg8fuU2m0QoxTUYeks9JcZprFdMJHl4YpZb4VPsDSMSXUGUFuJ4VrPZpNkPYBLs5zIAvy2mhOuMzTm4opyzwralWmrwIjcBjDrFbectKXX30Pd+qEE7pxS+sfsDkPIVvU4I2wJoXcqs3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790662337; c=relaxed/simple;
	bh=eF0q83Y+oQZF5di7Cc518sTOKLF39DjAz4+BHEHLp3Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Hk9WhSOpjdnuo+wwnSYP447qNvPjJ7v0KnsOtSzRqOQm+vVaZA6syk4THURFlFX4QZFZDydp2RhSrKnaPfj4Kk6+U7UoGewo+MJrhPO0vFjnAql68mYJwk1nWon4EBWJkUaDqcrPTR0/m0iLGcTNQcNNVGdR4OtFFGIZaD5Cx08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lBocqplE; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lBocqplE"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396ccb652d7so2583871a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 23:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790662335; x=1791267135; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=urUaTaRaVpO22Fs+yHiC7cI69fVJEcpMdS3nF5oFxHs=;
        b=lBocqplE/dmc/c/tZ8dURcjpKr/U3Yx1tjddFCfHvHceiK5wJ/izSEGMSfSCMTZZAL
         uJn7DmZzrnM5LFXu0ZS9LVKM1QpMfutbTOTa2yfAhJzEnI50KcR5SIDjqwpz8vZUhNkZ
         WWYxlCci+hW/+o7YpJJSaETMkLPhBeCM7G67m18Uo6lc7xnGWKz3GPBxI5AjDa6ayz0f
         f8xYhU54nbuXpn9grPCLvlbYMRBXimaoHTduIC2Cbmocrh3MrcZTzIZXPigDaaXS54W4
         DmrcqEoABd55TDolK+mNflbRHnxAgSDwidn4f6yE/qUNUC9PRiFrlhv0soxEQlpAqcTy
         qMtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790662335; x=1791267135;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=urUaTaRaVpO22Fs+yHiC7cI69fVJEcpMdS3nF5oFxHs=;
        b=oJXKMdfu7f35xj85USHXl5xvf9R8gxprmYVueQAL6esAKCbOKGeSOUHgzATsLEBiJI
         pt4U79umVtQkUX5ZD1oTz5KovhutXiDMneuJ2WyjjYJ6hRGUMyH8++gBS1C0Yls7uWyy
         xqccPlui0WHODhLmQE5y2VEfB4ZcPEvBQRA03oRct4cCffJhHgb1b8BsjStUM81iyEoU
         Rqc0DaHCrK43ODCfpRZBdWc0RD1eQEC9J2D25HEKo3gg8VrgIji50VpVE+Ho/V1KS+EP
         LoPRAXMhiGst97WtkxusdgbBnH5rXMk652h93pKVJuDD1CLroqH3HE1QXKrAeAuZgI8W
         XTrA==
X-Forwarded-Encrypted: i=1; AKwUvBxs6Yl9P4U0dzDZm3rmrTAlVh4JDY8h+SWd5ST9Wkhesck/HChHq+zWYw+hVqR6nWErzAbaFuZFduKZwBc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJNAXd3swHUznlK5/QubT8PN5Uc1kwQSQRbhNeloNBpOQc/PREi
	IVPDchnO8XnbK5aLpAbcEYRP7rFENbnbIx5oPxNVxbluVUgky3DkpyzQ
X-Gm-Gg: AYBFou0wRrUehvY5tt5RcvkxQZBUXruAswghUm4pOuh6HF8K6tu/rhS6QwxJThfS8Kf
	1vm7lqw5YVfNdj7HUQO1+ww3dJi0MYNHq8shxClvq9rVwq1Iokz8zJGcJ7fNJYRVixpLABJmvfx
	r+2T2B38qwOxQRrNc0qzAUQQ2BYM22NzFie1s1FBvXTUwnNJMdjkdHA/KeWsEoN7/F/i96+4Syn
	yo6G+dRuYN0Iy2JN4VwoRsUtKwlJTVTfojn84jgasm4BxhjpfOI8adGNn6tY83jfh0cp0O/UcDV
	jF6lk9ZubGOQoOYLXthXAQeihDtUleVbDluSbM7bu3omWvINZ62jhIyIFj/Ig4ROpu0obZigADd
	XFXZ/M8LnFM8vOyrCygtqRGXT5E4zAtVbekQCTcXoYJeTrdw/QELz4E2BwcFjF0i2neudNiIvtf
	81p+uxNyZkDHrE2jkWXrE2eydU35vjNgLfqUmu4GNBafO7BLdNIfUEa6laDJcXLRgHcF6OAYucf
	5O+hk6sS1Tj5C+pFU9iBPqw0GDFVtpqUYMqpTB/awFim1n5lr3863gFGU0IJAmZXvYWbUrBDR1f
	szI6xBFrGnfxIA==
X-Received: by 2002:a17:90b:4e86:b0:39e:4c7f:7306 with SMTP id 98e67ed59e1d1-3a098b8addcmr11959877a91.29.1790662335533;
        Mon, 28 Sep 2026 23:12:15 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a498726d63sm3280965a91.17.2026.09.28.23.12.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 23:12:15 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Darren Ye <darren.ye@mediatek.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	cassiogabrielcontato@gmail.com,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Cyril Chao <Cyril.Chao@mediatek.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 04/10] ASoC: mediatek: mt8196: fix register access clock error handling
Date: Tue, 29 Sep 2026 13:11:15 +0700
Message-ID: <20260929061121.124001-5-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260929061121.124001-1-phucduc.bui@gmail.com>
References: <20260929061121.124001-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Propagate errors from clock operations and disable previously enabled
clocks when a later operation fails.

This ensures that the register access clocks are properly cleaned up on
the error path.

Fixes: 7384ecab34eb ("ASoC: mediatek: mt8196: support audio clock control")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8196/mt8196-afe-clk.c | 25 +++++++++++++++++-----
 1 file changed, 20 insertions(+), 5 deletions(-)

diff --git a/sound/soc/mediatek/mt8196/mt8196-afe-clk.c b/sound/soc/mediatek/mt8196/mt8196-afe-clk.c
index 1d107b85d03c..6198711e01b5 100644
--- a/sound/soc/mediatek/mt8196/mt8196-afe-clk.c
+++ b/sound/soc/mediatek/mt8196/mt8196-afe-clk.c
@@ -546,26 +546,41 @@ int mt8196_afe_enable_reg_rw_clk(struct mtk_base_afe *afe)
 	int ret;
 
 	/* bus clock for AFE external access, like DRAM */
-	mt8196_afe_enable_clk(afe, afe_priv->clk[MT8196_CLK_TOP_ADSP_SEL]);
+	ret = mt8196_afe_enable_clk(afe, afe_priv->clk[MT8196_CLK_TOP_ADSP_SEL]);
+	if (ret)
+		return ret;
 
 	/* bus clock for AFE internal access, like AFE SRAM */
-	mt8196_afe_enable_clk(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUDIOINTBUS]);
+	ret = mt8196_afe_enable_clk(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUDIOINTBUS]);
+	if (ret)
+		goto err_disable_adsp_sel;
 	ret = mt8196_afe_set_clk_rate(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUDIOINTBUS],
 				      MT8196_AFE_26M);
 	if (ret)
-		return ret;
+		goto err_disable_audiointbus;
 
 	/* enable audio h clock */
-	mt8196_afe_enable_clk(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUDIO_H]);
+	ret = mt8196_afe_enable_clk(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUDIO_H]);
+	if (ret)
+		goto err_disable_audiointbus;
 	ret = mt8196_afe_set_clk_rate(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUDIO_H],
 				      MT8196_AFE_26M);
 	if (ret)
-		return ret;
+		goto err_disable_audio_h;
 
 	/* AFE hw clock */
 	/* IPM2.0: USE HOPPING & 26M */
 	/* set in the regmap_register_patch */
 	return 0;
+
+err_disable_audio_h:
+	mt8196_afe_disable_clk(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUDIO_H]);
+err_disable_audiointbus:
+	mt8196_afe_disable_clk(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUDIOINTBUS]);
+err_disable_adsp_sel:
+	mt8196_afe_disable_clk(afe, afe_priv->clk[MT8196_CLK_TOP_ADSP_SEL]);
+
+	return ret;
 }
 
 int mt8196_afe_disable_reg_rw_clk(struct mtk_base_afe *afe)
-- 
2.43.0

