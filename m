Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B5DC3C988D
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 04:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790311848; cv=none; b=aZtt0mKSpQDAzQD7nvQj81yMpCvJn7xLv62AO7xNayTEPJ+hzB5MJ7E7WtQYUCRKXMkCT23pPd+C5poiPMiLmzA/PFzaRJ8S0aEmETulx4AE9iegCUFaSf+gk1MVnw8OGxBG3ax5V7/Dhyyl74PDFwl266vkKKmC6jzZn1oVBHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790311848; c=relaxed/simple;
	bh=RFsDwGuziZnLQYvPIagibDKiLenJn663Co716dknJHM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rqO2O9UV+Yf9rytT9gGiaQ6ehddpixu6p3AzZypaIhRs6vqJ/Je1zRvd9CiRmCbBHQAu8J87HxN37lDWr8e9KXqwiO0iAnovwpvtEpEUi4LeWcyDvp3cBMLkNdd53yq4MbXS9QqahqaY1r1/mGn9iHDFRL1mawyAT89iZWGYd0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fkvvJmO1; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fkvvJmO1"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc1cebad4aeso131953a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 21:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790311843; x=1790916643; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cC2JxcNZX/PdxSljMsgobXdfIwmK8OmUL2fGB78jIko=;
        b=fkvvJmO1GZetl1wwz79Xc7/D1RZXAeHyKz7hDjztxgq87dZCQWSBIvZ4u/XLJS7YzI
         dqq/1GKWXv0fwtvIfdoVpdOqIL2/DDAXUjg2r5y163yOnOrJ8ltvhH5uJNc5d4hNpp+0
         o/epF3yJw5LGbuKujJp7J2yX3Jt5zk+88CnUdXVUn5XqjY8KOiWkU7FrBaib5yLqA/YN
         iz1WzIDjtF0XGlBbj6NXhdz01fx+pQwdffxPp4Y4uIR+NHJD8KWpUMRr1q6W8SB6Z45F
         2XyHNleDtz74rsGNHuwuxNbKEyki7PgZNkehizfkWNU0P0WJszr47DiPJ6kxKDDYjRi6
         7lXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790311843; x=1790916643;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cC2JxcNZX/PdxSljMsgobXdfIwmK8OmUL2fGB78jIko=;
        b=hCINtk/pf4gVS9X/J6TxwoyH5gC7V+RE/pMmWknJ7EJQ2Mu4ZUYLut3tWdWfBqZ3Gx
         OVZt+K78bnfPyhTiS63Z298PUYLbqhy2Vi7oeEN4MxZl9rnbp9ZqWi/KZhrHn/MzKUKR
         kARDcp4oM+ss81C5VI+NbkLliKs3YFLMzRvNu3exY8rt7L0A9RpLaES5IAUXpxWnkpcF
         aZ/uYaEIXIk6hP9xBdMt3y3yEMxlPXJb4kqmblojLZbwjHtR6Ud7scdniYlSRb0bE7TZ
         qdrBZUDU6Q8fsajYI0HO24zoQv88bbQA3kjT5Ga3qXjJ5vpBaerHvGgQcacwLKH5MLVX
         jnfQ==
X-Forwarded-Encrypted: i=1; AKwUvBy6ST+Lj8PtMUArZ9ZIW9P9M6NQjI9I5kS9Ul4TlnUH84MrU0iQMBusCbH5L3FGwxmO98iFiv8Rv/4h1Mw=@vger.kernel.org
X-Gm-Message-State: AFuF++k9e64mZTS7syXXSQeSTL9bP1S1fct7NLc5NFKXimi3TBi5AR6d
	obs8mRTFMXjv+wAko42bgR/tYBSgkW1956sGt5la+rFrepjjjBgT48wK
X-Gm-Gg: AYBFou1nwraJ2y+GVqZJbgtvyQ7yPOzD4l8CIR8waAt4om/JihBz2wrBOVYfL06GeeX
	UW/T0IpSikZ3TKVIInCs0VCV5yty4gWO9TEgv0TeiBG3bH8eWUmPwg9Gav9cQf30ZCvm4E8iUyA
	LQaAo+Mp3zPQm8vAD+CRybBFxKPlRiYKIsIdyLdmBb//HziJrt2h19n9mgaTBIwIpsHxAPSVgFa
	iz5jAgw1nrLQ9ryRcKa3HYuORuppICKXriaYQm8u2ooqRilMuv+q4EPoLsAdLDCGrl0zmfIYYOT
	QgdhJGEheBBE0V2sOKdIKHTT96zw7SG9wV7O7XN1Nx84Gbq4Mc2A4Gyb2pdEseJNvezSB+eGnjk
	qz9rIr5D0dgyu02rCzSbdtYiE3gfdvmSR0c0qbHB4ilkG+T9WRlwOPh4IHaSMnxS3CCCoNy4ILi
	Wo0Cj49K1ARzFGMuCOjTvsDB4AKkwwDgdIew6HSwv3JKf4xmmzGOFSEPTcNSJERO0gX4MpKGcMC
	VB9/eMqgJr1Hi+llCxqY4WGnChVhcCXLFw8lrQNBNX1/MKItuXtP3b5McqUQ1xoyA2KJkzakGb5
	ZAG/PWH9wgiwhw==
X-Received: by 2002:a17:90b:3908:b0:3a0:c20b:2fdf with SMTP id 98e67ed59e1d1-3a0c20b3132mr301956a91.17.1790311843503;
        Thu, 24 Sep 2026 21:50:43 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0976cacbesm8151528a91.13.2026.09.24.21.50.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 21:50:43 -0700 (PDT)
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
Subject: [PATCH 11/14] ASoC: mediatek: mt8195: Fix ETDM startup error handling
Date: Fri, 25 Sep 2026 11:49:05 +0700
Message-ID: <20260925044908.450775-12-phucduc.bui@gmail.com>
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

Check and propagate errors when enabling the ETDM MCLK and clock
gates during startup.

If enabling a clock fails, disable the clocks that were already
enabled to keep the clock state balanced.

Fixes: 1de9a54acafb ("ASoC: mediatek: mt8195: support etdm in platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8195/mt8195-dai-etdm.c | 50 ++++++++++++++++-----
 1 file changed, 40 insertions(+), 10 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c b/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
index fba51c552eec..1270fcac6b3f 100644
--- a/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
+++ b/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
@@ -1575,36 +1575,66 @@ static int mtk_dai_etdm_startup(struct snd_pcm_substream *substream,
 	int cg_id;
 	int mst_dai_id;
 	int slv_dai_id;
-	int i;
+	int i, ret;
 
 	if (is_cowork_mode(dai)) {
 		mst_dai_id = get_etdm_cowork_master_id(dai);
 		if (!mt8195_afe_etdm_is_valid(mst_dai_id))
 			return -EINVAL;
 
-		mtk_dai_etdm_enable_mclk(afe, mst_dai_id);
+		ret = mtk_dai_etdm_enable_mclk(afe, mst_dai_id);
+		if (ret)
+			return ret;
 		cg_id = mtk_dai_etdm_get_cg_id_by_dai_id(mst_dai_id);
-		if (cg_id >= 0)
-			mt8195_afe_enable_clk(afe, afe_priv->clk[cg_id]);
+		if (cg_id >= 0) {
+			ret = mt8195_afe_enable_clk(afe, afe_priv->clk[cg_id]);
+			if (ret)
+				goto err_disable_mclk;
+		}
 
 		mst_etdm_data = afe_priv->dai_priv[mst_dai_id];
 
 		for (i = 0; i < mst_etdm_data->cowork_slv_count; i++) {
 			slv_dai_id = mst_etdm_data->cowork_slv_id[i];
 			cg_id = mtk_dai_etdm_get_cg_id_by_dai_id(slv_dai_id);
-			if (cg_id >= 0)
-				mt8195_afe_enable_clk(afe,
-						      afe_priv->clk[cg_id]);
+			if (cg_id >= 0) {
+				ret = mt8195_afe_enable_clk(afe,
+							    afe_priv->clk[cg_id]);
+				if (ret)
+					goto err_disable_slv_clk;
+			}
 		}
 	} else {
-		mtk_dai_etdm_enable_mclk(afe, dai->id);
+		ret = mtk_dai_etdm_enable_mclk(afe, dai->id);
+		if (ret)
+			return ret;
 
 		cg_id = mtk_dai_etdm_get_cg_id_by_dai_id(dai->id);
-		if (cg_id >= 0)
-			mt8195_afe_enable_clk(afe, afe_priv->clk[cg_id]);
+		if (cg_id >= 0) {
+			ret = mt8195_afe_enable_clk(afe, afe_priv->clk[cg_id]);
+			if (ret)
+				goto err_disable_mclk;
+		}
 	}
 
 	return 0;
+
+err_disable_slv_clk:
+	while (--i >= 0) {
+		slv_dai_id = mst_etdm_data->cowork_slv_id[i];
+		cg_id = mtk_dai_etdm_get_cg_id_by_dai_id(slv_dai_id);
+		if (cg_id >= 0)
+			mt8195_afe_disable_clk(afe, afe_priv->clk[cg_id]);
+	}
+
+	cg_id = mtk_dai_etdm_get_cg_id_by_dai_id(mst_dai_id);
+	if (cg_id >= 0)
+		mt8195_afe_disable_clk(afe, afe_priv->clk[cg_id]);
+
+err_disable_mclk:
+	mtk_dai_etdm_disable_mclk(afe, is_cowork_mode(dai) ? mst_dai_id : dai->id);
+
+	return ret;
 }
 
 static void mtk_dai_etdm_shutdown(struct snd_pcm_substream *substream,
-- 
2.43.0

