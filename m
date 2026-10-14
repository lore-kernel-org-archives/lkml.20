Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C16E84F4D04
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 11:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791977313; cv=none; b=MOabe/en02WcjTjYCY4y3iv/Eibi7sQhP6ykBWGKeBjp8/8IIInAlJGr3Vwgwsp2MKdfwQDoPwEiLnUsQ1blNWVae0f09XLKc/vK6kR/+Vd0kKSu0JdjRkHv8Du3wVMh0+YGC4F6ZWg8Uob+jq5edbnlnMYYhFvl28NS4j91/Lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791977313; c=relaxed/simple;
	bh=8BVQGuuD7oUJbNndvp9+ynasbcq5BxwUFY6hOWwfM14=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n0Ttk07G9hrKbXx5/MzYhmbA64rJjT7azVOjvct6Cj15BMKPj6EFZTY9zYdduDGdbBC/5Y42jDkFbzi7Wz+VDDYbcNk6WgxKa/gMGMsjzHsySy95a0/dwBqznLVDJe3DlXgXHbl+o4TRBEbGfDmaxzuCYcQJsl0JpkbesNR0y4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GXe861Qb; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GXe861Qb"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3ab066bef7dso187714a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 04:28:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791977311; x=1792582111; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RVD+Izt35MN8c9Vj4EEt2lHnLwzvzVH8w94QaOy/wEc=;
        b=GXe861Qb5ePDTn0slfZYwSE3/lVCm1U/mUmWYTRL9F27Rsky8DAZrzuV9Ipvg9ml0U
         /TGb/TxBSDVkoUFAt+TptExtJSmtqX917jGsDC2lHyGvClevpLh07uY1+449jGFzpHJM
         wPkJTZYvTukueQUB3Kh2uNNgDmuLt4297UeNdRSmYKrjihOdfW8AVuynuOU50MleoYfC
         E5fZ3TzurAelPAdCRUwtIMbnAlVXh8IC0iUpiH9Z7ZB2pUL57GULXzjCfcq+CHL4J6JO
         5VBGZ1UOAsTtGc5gDuJCwgvvN5ORyKk0cc15sB/3Sj/g+pnFTHB5TZyMLQO83RAYTURb
         UeGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791977311; x=1792582111;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RVD+Izt35MN8c9Vj4EEt2lHnLwzvzVH8w94QaOy/wEc=;
        b=jeALy3NcOtinlI2zsx7A4U9XNIAHY1Jti5zBdsDzhJrvoY96rNDNRrn1ZRLW/YTPGh
         qP+bL3y90hfJyu/upotmb+S+lYvm9OfAQnnQn5O0N3DZBU5njyuRVL5vNOz2xH74P6IN
         c5PGB5P9zwgCWVKtYtaTpDWGoYCWlu5TRtMDrqNIjYpRV4qZMR0ejVE2gR3Iw7BAw24y
         TghR+TU675ST5waVATxymTE4cDJADFf5Rn92NdQoC2qH5RZmfQX1qF4AqbGTqycAHDRk
         JU5VZPZ/IzL7fZqNm7dsO28jt+whIC0vb1ONcn4fx/H2QI1BBok6HvVK7JJPP3vzxqiF
         JqlQ==
X-Forwarded-Encrypted: i=1; AKwUvBxQhln7y0eTLK4hFSo4nnzr81jsp0qIKJ3f4GD9r7XiKPmPh9dtR5A6klQaPqGINl6edS4k536UJE54RCw=@vger.kernel.org
X-Gm-Message-State: AFq9FYL5r3hs5et1jl7kAZ1b6QmMyIEajKqScvWFPqa9Zpu1e+BthLGK
	jOxHhE4wMS6ZhyCPPbe8cvRWepvIQCeV/PirriySS8zDURDCWB7lrGgW
X-Gm-Gg: AYBFou3Bk71gliU3JItm3DXQKYZ0p9Uif/hR2ZhqL26YgX6uePvjx9J6+bJeRoTLV0r
	W1xLLUWWQw1ZUXR4h0J8mylDFwihUaFiK5y6K28HS/RL6uMvZs1dyQB3M1/rtYJCNbz1HCBuEnz
	WX4IgQI/FAiVJ4zKoJJdkZ206BU993HDOYb0E+YtfzaHbq949H65JZO5PqL/TfnLEfLH8nFKWAJ
	hMQfUQPLmc3yTnQc5PBC8hCPg8gyp39ulDHd2XWcBZral3i0bJVNgyYIwIRMqVykO6IFRI5Nmxk
	6JViqqBW6MpU28Kl1wcqXOh2AYAWu4qTGT004NK7xI9v/ndPlb+yTtroZwXdVf9fGDjhMYAIBCN
	lIyfQ31zuLuhzyv61INV72dlkprlci/7w2Oey6+80RhFkLqd6DtuXLXXUYGQVeyMgZDblm7JZhg
	vcDXuY6nvPlC6BHijUDvIreEM8oIOj8/S7VLSJtxa0jv1fX3HfL/bXJ2kkzRlMcUS9xpl1jGiwR
	NFBGl+0rzQbhWVuTZOnkUmcerZGCnVSjaLcqqoKlX92nLh0EAWYt7ks0vd9amc/gFiM57GQ32KF
	heOmXQON6+nuyZA=
X-Received: by 2002:a17:90b:528d:b0:3ac:6e91:3f14 with SMTP id 98e67ed59e1d1-3ac6e9140e4mr1552762a91.22.1791977310692;
        Wed, 14 Oct 2026 04:28:30 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac61171feesm4077076a91.17.2026.10.14.04.28.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 04:28:30 -0700 (PDT)
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
Subject: [PATCH v3 03/16] ASoC: mediatek: mt8195: Fix register access clock error handling
Date: Wed, 14 Oct 2026 18:27:38 +0700
Message-ID: <20261014112752.683032-4-phucduc.bui@gmail.com>
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

Check the return value of mt8195_afe_enable_clk() when enabling the
register access clocks.

If enabling a clock fails, disable the clocks that were already
enabled and propagate the error to the caller

Fixes: 6746cc858259 ("ASoC: mediatek: mt8195: add platform driver")
Reviewed-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8195/mt8195-afe-clk.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-afe-clk.c b/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
index 12d8159338be..34c828fdea29 100644
--- a/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
+++ b/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
@@ -599,7 +599,7 @@ static int mt8195_afe_disable_top_cg(struct mtk_base_afe *afe, unsigned int cg_t
 int mt8195_afe_enable_reg_rw_clk(struct mtk_base_afe *afe)
 {
 	struct mt8195_afe_private *afe_priv = afe->platform_priv;
-	int i;
+	int i, ret;
 	static const unsigned int clk_array[] = {
 		MT8195_CLK_SCP_ADSP_AUDIODSP, /* bus clock for infra */
 		MT8195_CLK_TOP_AUDIO_H_SEL, /* clock for ADSP bus */
@@ -611,10 +611,19 @@ int mt8195_afe_enable_reg_rw_clk(struct mtk_base_afe *afe)
 		MT8195_CLK_AUD_A1SYS, /* AFE HW clock */
 	};
 
-	for (i = 0; i < ARRAY_SIZE(clk_array); i++)
-		mt8195_afe_enable_clk(afe, afe_priv->clk[clk_array[i]]);
+	for (i = 0; i < ARRAY_SIZE(clk_array); i++) {
+		ret = mt8195_afe_enable_clk(afe, afe_priv->clk[clk_array[i]]);
+		if (ret)
+			goto err_disable_clk;
+	}
 
 	return 0;
+
+err_disable_clk:
+	while (--i >= 0)
+		mt8195_afe_disable_clk(afe, afe_priv->clk[clk_array[i]]);
+
+	return ret;
 }
 
 int mt8195_afe_disable_reg_rw_clk(struct mtk_base_afe *afe)
-- 
2.43.0

