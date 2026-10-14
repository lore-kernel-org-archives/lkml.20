Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8A134F7983
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 11:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791977307; cv=none; b=FuttKKnTWlfQjIOOi4NVkryxIe4jZAUP2uAOJWCl5K3nACZdzSUF7F1j8ST7Yq0WcR/rPHSuHxBd2aQFzE0x9LYotBwqCV/tbPV8MIhzLldi7QGBDt2HO1xwPLJdNECLQGaQJLDCwm/g9Cw55HZafpcW68BA2iw19Dg1gSNUMd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791977307; c=relaxed/simple;
	bh=kDfxq05EWUlkZUDmKSun7LC01T/X4qiMqm8esg+ujUQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SaLhezRVNX/9vxMVydKaXwEsYafNxVg1ULz0W8orlaT6JJOYMNijF0D9b2LJ9zJAyEkTpJtnStiGRtAvpg6c8WgcM2YjCumXQYHXeFEyV0E13GtSkXyPk8NeF1Cl8Pp2akaltcmGyyi6ufeS/OOZewX+odnK3N0tovTTt2fr8Vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fz7FEROq; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fz7FEROq"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3ab450c0873so3346378a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 04:28:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791977305; x=1792582105; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CExJJFNeVdJxJ2CT2z02fSyns9MbGRw3UzVN3YUCwRQ=;
        b=Fz7FEROqZtMVWVLfmzqzdRIxRmM9ZuCh0R13d0Fhfx+rQ4HX43QHlJDOOn9Chad8W8
         Dn6JLldNs+moX6eF5F7SG++HXJZC3ntg2uCVGtpAbrykk4gZN8f9027Cz/fWoU3vgWT6
         AjRqOSXMy316VEdwonLKgZHg8RlhExD6EXQg+WlkbEhdpef2iOOzyEMzROxJ3Zxylx8Y
         0o+JPihIkUOtU3yrTZ/rXiXg38tUgmsLfb2LILTeNnKXMWzEvRcVizk6zG37x6S+RhMC
         euGJ8wJ5snW7cvnlchG9Ee7/erHLu2j/L4Sfrj3fOpMg0dWxpkiRaO5wJUiUnoAAvr0K
         n5Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791977305; x=1792582105;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CExJJFNeVdJxJ2CT2z02fSyns9MbGRw3UzVN3YUCwRQ=;
        b=A6GEnPScoWQpYS+MwpIt7yF2NwEui4VvzI6PIacu/Ichni1eyNEuaFc+G4G4uxfWu9
         cOmwf4wKYHZaCSVuHPBQNKaELBtqvwUweYYB0payT+7nrOiCVORstJkFoOoY3xYP8cf4
         8SQGMVjcAmNhyOrhP3tuLebdSoMOclIdyxprnrQQSBjxYZbq43i0gzsokL7m9//uZNAz
         6Oi5WdRq4a8SWOt+13Mc0Qi5TZWOgz1y/juBJpZXN2ObqhOqIVflZrrnwUgqD4ZAS0XP
         BD2F4UKMrp73mO4eC/l/d1V3lhtkaQea08q1YAySehNE6jraYVgRFdu3d8yXoWWh3VQd
         BBqg==
X-Forwarded-Encrypted: i=1; AKwUvBwyfEPEKQqWvhN166eJLHFnCL2K1qRWIQp8KuwCAGWw5OypvoKSI4fsP8NlHDeW/bMVft2SlML9AcRvChs=@vger.kernel.org
X-Gm-Message-State: AFq9FYKalZg/lps3mIGBfSH0x+b0ZXYjKGBiRhzz7Mo2cqg0dv89Qp4a
	5UJwcO/De7Ix5kP3vI50KPAD+5tRSEifdBxekqMpEGfAcB0LIJ3XNH7B
X-Gm-Gg: AYBFou3MaHuao/mLDGSM7HRfLJU8NJwnFQ+jSFRkC/PtvvAy55UCcOn7DCGuomRvupA
	dvpsxVMZ/KHAiIQq+CzOKtskt1ZbMDKWHBNGuO3idrWFA1VNK++/a2qVhV5nAPR+VrHx4OrQYb3
	TGrtI/yc3RqtmNk2TfHJwrvvlxfu0OqifPnb5mojNaU76fQBez0A0oZznljakxxPLuYdaxd2W/G
	bSaO8LyDmxp9CYn9YwAMPtTtxSmF21akX/e+Cpsaa9nI3t400gXCSpRznVdz2kSZ6wUB3zk8GQ4
	mOO/pCwpMaFeJTk8UxSFRRZ14YSEt3563cPmbskmyBi2vUKpGAFq8vk4Axyauc2bQ/RgZtNirxI
	/OBb+2cQx/31Kg6KlHQkWv8wbDzSOBoj1wcKim6aquFaxDDNg5XdPN0SzIeD6jd4B/5/zF8uaDz
	g9QvxpN57MSfhldmgEhZmtuKpX69HahBlUABVuDFnEKU6Z0NHrPFgG1JADLzC3fKJSNcSdF4sWQ
	uy8/p+EwoyNcRtSUPTVC+oQABOAYyH0+LBmlTmIUnqU/JNd4fxRBF3UqxRjK0v2/78vgOQskUTp
	oWtu74o4o5zYVB0k1Whh1HI5
X-Received: by 2002:a17:90b:5343:b0:39e:6c6a:6580 with SMTP id 98e67ed59e1d1-3ab3a9d3dfdmr12082597a91.67.1791977305154;
        Wed, 14 Oct 2026 04:28:25 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac61171feesm4077076a91.17.2026.10.14.04.28.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 04:28:24 -0700 (PDT)
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
Subject: [PATCH v3 02/16] ASoC: mediatek: mt8195: Use dev_err_probe() in mt8195_afe_init_clock()
Date: Wed, 14 Oct 2026 18:27:37 +0700
Message-ID: <20261014112752.683032-3-phucduc.bui@gmail.com>
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

Use dev_err_probe() when obtaining clocks to avoid redundant error
messages, particularly for probe deferral.

Reviewed-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8195/mt8195-afe-clk.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-afe-clk.c b/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
index ec1ea5b988ff..12d8159338be 100644
--- a/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
+++ b/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
@@ -397,12 +397,9 @@ int mt8195_afe_init_clock(struct mtk_base_afe *afe)
 
 	for (i = 0; i < MT8195_CLK_NUM; i++) {
 		afe_priv->clk[i] = devm_clk_get(afe->dev, aud_clks[i]);
-		if (IS_ERR(afe_priv->clk[i])) {
-			dev_dbg(afe->dev, "%s(), devm_clk_get %s fail, ret %ld\n",
-				__func__, aud_clks[i],
-				PTR_ERR(afe_priv->clk[i]));
-			return PTR_ERR(afe_priv->clk[i]);
-		}
+		if (IS_ERR(afe_priv->clk[i]))
+			return dev_err_probe(afe->dev, PTR_ERR(afe_priv->clk[i]),
+					     "failed to get clock %s\n", aud_clks[i]);
 	}
 
 	/* initial tuner */
-- 
2.43.0

