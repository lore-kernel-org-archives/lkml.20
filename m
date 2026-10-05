Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7142547DF8F
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 11:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791198255; cv=none; b=s4YKNvv0Tp4/kmuLGkbXBKnt62ADlSgphAjH71vt6pKVtppwfs4jdXhtk6hJwNoDHyCykIMefql+xxLmh7ygeHvIDbFiCBdmiK4d6CDfA9vw5It+GMKJ8O2xBBq51suEVk1nXXKxZZ+S8gXSvlZXlG+HgQJJv71i3xajQ0oxW+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791198255; c=relaxed/simple;
	bh=MMm6LoBTkeAomP+0/fA2vfNONTNnzG8MpauClEVrS+0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gsw4vH0TnpZOPN73/mLJdNOo/38b+zsMyAlo1s+qMKhtsyOm1v1HUgDHLLTahqaw41Ir7pZxXPQHxQOc7no4PWipgut0UN5Xj2lFbmHs4KdVdhNAgcfA+BS4u4aEfc7S3xKo++1NeGrWxuyx9/4EsdUgDI9fkCBE0e7pzdTo0h0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oS4oUzrA; arc=none smtp.client-ip=74.125.228.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oS4oUzrA"
Received: by mail-pz2-f41.google.com with SMTP id 41be03b00d2f7-cce69f17291so175239a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 04:04:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791198253; x=1791803053; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pMNn1l9smvshEEs2IzaD7z/sVzU8/2Okzf/aYOfP2ok=;
        b=oS4oUzrAWOq24GJmKFXlkORVUDf3zS1FT8fRGt/YHhYKeBqn35E9BkeZkq2Tyk7/ZF
         Y8O7rIOdnOIZWB08JwepA+WpqwUKaEULGGWycqbhVHDFZfTIXDuChROHur04vFyzN6Wb
         +L7FZ6Bhps9jvczXM2TJSalp7RHan6/o6w9QR/Tx+k5wlFYQPfNrl9dMOilqdoyYXRCz
         BE8y/tqffPzp3LpjksKRtMwG27TyOFlDMy1eECROVKDTgzmTgdY1UVm04U5FLAzPte3O
         8Ud9GUSsDTLTaYFRKtmLKKdFEMoxfBRPwVqY8sEBvGSrXRcqTxLYFX20+sY8Gm+5iU7c
         HxyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791198253; x=1791803053;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pMNn1l9smvshEEs2IzaD7z/sVzU8/2Okzf/aYOfP2ok=;
        b=CCMZqz4uspx1pL6Xjr2ZYbdEAIevLbLk/qCv4zfa8Btkpceou6nG44TR+Bn70sOsEU
         O/xMKTMo69/mNbR6iVY/kXJWix4r4JA1eZ9tU9Sl6L+Msl1dD47+sCtp/rauUmXNQSAN
         qeUZYhwYfDB7WmVdLgjv7EBF+Nl3OLwJP4KdSegbsa8THYSFLBYbhK/K2FrU9Iz5bF++
         gIvkRkXhtt0vFlYarsIlsd8DasjTdtP2zn1or1/ahZq+GMr6eyK08OhIdiKbPTo5vIfx
         owyndTQ3mkLKDusaoznYVcw7XwCwGwQL7n/vv8FDN1f9oMbg4I8qgHqkYqpgtXYxGYId
         qSqg==
X-Forwarded-Encrypted: i=1; AKwUvBxz6sF6T5KWA3ClY9vhhAIDDEU+7DBlT07hNgb00L0DCDakgyN41t2ji22i2DeYxhHiCCh79m69NGMAxvM=@vger.kernel.org
X-Gm-Message-State: AFuF++mWwSoWFw2ZR85203kTsX4dbNv+Q40CBQwHxkapfuXL1kPAWHYI
	9F5JQjd2CxvgsxzqCd8APkhj+rPBfFCFIGj4QrPt0Iyd58iPaNSEIMgc
X-Gm-Gg: AYBFou38m1PLSvHyYRxGvsm7uXyO2RbkG11o3VCRJ+HA/qp6bS5in2fW2E0EgVxQawC
	YzSCCiRQNPpbBsVi2G/P9Wn/yB0gNncIpwFZZ25BjBjC0XKtBN7qaT/uwES/ARxnpi5th/++RNW
	YtFH7K9hmP0WZccwJxgfLzpSIzrGAZGyI57WQdIYdoB58+OIqr0DBRlAYWg4OLgpQ7T9BLz6XDP
	7VpEXZVWAXGnZNiPK0IFEq29w9ofL8bLGWfXUIfgDfVP/LL3Bq9p+jxCUIwZ2/EVjcalwwh3mvo
	F3JsHYGJs+87ADGNIGt8a5NiCezZiHDQjvzGy+TRBdf7VCBZvH1gaYXDFVhwRDvIAPNQ2qUfA6o
	nENVSwukev1mK8JzxZqtaLkkzYQGegW/24pjlgWBLuQx+Pj5UcnL8HgJAMY4WIpy5rKPDM6Zjnf
	1dVLRCAJHhKm98/OeheU/kRIvJ7PN+WC5NwTvfXDzXxAnCi9fWKhM7pGS4w0dcU6lX9rnsg9LxA
	RYvk26esxSoAMvcJtFhYJggGm+aLqxVL+NdWhEFixCggQ4zXyFtKnKAqJsxBicTq9gqDB7DMVPY
	+aj6pCHKdDiXLA==
X-Received: by 2002:a05:6a21:b82:b0:3de:52c4:50bd with SMTP id adf61e73a8af0-3e0bc6a0f48mr10138880637.0.1791198252738;
        Mon, 05 Oct 2026 04:04:12 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cce6d334de5sm626498a12.11.2026.10.05.04.04.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 04:04:12 -0700 (PDT)
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
Subject: [PATCH v2 12/14] ASoC: mediatek: mt8195: Fix HDMI TX startup error handling
Date: Mon,  5 Oct 2026 18:02:55 +0700
Message-ID: <20261005110257.50145-13-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261005110257.50145-1-phucduc.bui@gmail.com>
References: <20261005110257.50145-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Check and propagate errors when enabling the clock gate and MCLK
during HDMI TX/DP TX startup.

If MCLK enabling fails, disable the clock gate that was already
enabled before returning the error.

Fixes: 1de9a54acafb ("ASoC: mediatek: mt8195: support etdm in platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8195/mt8195-dai-etdm.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c b/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
index 1270fcac6b3f..11317cdd14ab 100644
--- a/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
+++ b/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
@@ -2321,13 +2321,25 @@ static int mtk_dai_hdmitx_dptx_startup(struct snd_pcm_substream *substream,
 	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
 	struct mt8195_afe_private *afe_priv = afe->platform_priv;
 	int cg_id = mtk_dai_etdm_get_cg_id_by_dai_id(dai->id);
+	int ret;
 
-	if (cg_id >= 0)
-		mt8195_afe_enable_clk(afe, afe_priv->clk[cg_id]);
+	if (cg_id >= 0) {
+		ret = mt8195_afe_enable_clk(afe, afe_priv->clk[cg_id]);
+		if (ret)
+			return ret;
+	}
 
-	mtk_dai_etdm_enable_mclk(afe, dai->id);
+	ret = mtk_dai_etdm_enable_mclk(afe, dai->id);
+	if (ret)
+		goto err_disable_cg_clk;
 
 	return 0;
+
+err_disable_cg_clk:
+	if (cg_id >= 0)
+		mt8195_afe_disable_clk(afe, afe_priv->clk[cg_id]);
+
+	return ret;
 }
 
 static void mtk_dai_hdmitx_dptx_shutdown(struct snd_pcm_substream *substream,
-- 
2.43.0

