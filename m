Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 293403B4EB2
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789370991; cv=none; b=PhRk7i/FkoR3QVL5BZFx2S4y6YNuczvyRiwA68DTqOeyy7F+vPbt7yedug0hgUog5fsR1HkZXNv6+CD2n8Hfb3W63pj6gDWlzYsfVcxkvuHZmAIy4G2cINFTjFo4BoHlXLWtcmujDUCVJ7wafHKZwHQWsCXB2SFm/mqduxB/4ao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789370991; c=relaxed/simple;
	bh=zVt/GLB/PctPHE9xjcaVCw+lY910OuGBOfYlSPretgM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CSvrBwljcFcj9kh2xZd2jljnXlBkvO39zBGn5SG67PMBZCc4zDfh3ZuWwotJ4mVs8Rtz5qghYO87FOB0tRkJwOzx0t0BD5TF/rmX0K3ncXYvBqbPcP4dZhP6ZtmDI6WzXSHsrJTPWM2qlgpWJ3nzPEWtvF3ptOJNvfrsncffrLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KYAI7pFo; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KYAI7pFo"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3964e480f76so4091242a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 00:29:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789370989; x=1789975789; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vlGnqVAUzYoXB3nTaQam08DX17fuCUu75lyq1+U5jAU=;
        b=KYAI7pFoKDv+72sI+qVre+WTK5th4jHZDZEbSzMkA76Tih8WoFXiferCPS9j5NkGKz
         3qAQC6T8qIN1Yv8/X/Rm2TMuXinYnRS/DPNFGd1Nx0Q7q01JUn5dxMj9HfJ6lXNa2HHc
         e2aUfCnB6PsPSMFSU8thEMw+iO1KxCbaVox3OZ9VPaBOaEhG+kyX1tS1kXrWQbGiwnRv
         tFC92gK43lZIVBMwYoS89R3ujMVrMSasj7/rxn+7BJ6YCedeWSKIpk+dQGf7M5RNH9M5
         7sUotqco5RJhjo5KzYerHw4FsNXKLoUk303VDPrm6VR9jjCkzmcTCaFls9oRnMvlksKp
         tQ+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789370989; x=1789975789;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vlGnqVAUzYoXB3nTaQam08DX17fuCUu75lyq1+U5jAU=;
        b=CnjUO2o/7Hx+w7wgvtueRbK262uRdp/hgq+2uVfAbHgYprgW24wUCT+8uKguWAOi2s
         oy2IJ1FmY92Goz8WZ4Js7gGkz5GUUzPi9ZuaST1zzvK4NuQDNYPsfFwLG3STDG8Se8KA
         RglwpY1LMSdxqe/9uf72TlVRBl7MRcHo3ICT00mJxi2iUNhUw5OtF8OuahANi3yE/Mr/
         LGb8YeRH3LqzQA1E3tX9RI9rr5EKrrjNFWohBx+j84yh6iI6dgRZV00vSpY/Hs6MWcAE
         n9FJwzGFGFJfLV6pOqlrmG+2ZcN5yS34t9zRSc2K4w65acMWfYWCrbRl7V9iQ9LgoNbs
         Ps8A==
X-Forwarded-Encrypted: i=1; AKwUvBxPrI75hwQfnBrd5IgZBXt9J7Ta0RQVEFFKRHKhtdbJ24LZ3EkHb7z03H25jhwNDGyd7+Iwef40gd8AC4I=@vger.kernel.org
X-Gm-Message-State: AFuF++mhv4ap47h6/TRs0G1Ih6T4dGdkjvlFeShXbSlEBu812qcgeVKU
	mBvrQcVhU9meKpjW4JbXBZ1cH/8c33LeQEFyVNlLtBSgTG4CRUYHswQA
X-Gm-Gg: AYBFou2RXhQWwwSVlFOV4pxT7Bx0Uby9Bbb73bHv/7aOwBPLQHvqmX0D/74OtJ2Dfbg
	Ty4yzWq1Eixg9umRNZgs80OaroG7NdcYwDDdavGLZubnNx0fhjxD/yUgxkswL19V7idn6W1UsY4
	y3fMuLQbfmNAMaSqt+MOAz4w+5So94nIvR9sEOtWYwdXZe6vLGFiQGYGehUm6h1U68qvTNCErYK
	CyVTt+K/KQapsTClv9U2SIsPpXtYtafUW9vRiJTMCmZt+Uj0bhTpMcNfikm+M9hk3GZLMhshDuH
	un0NZv0jUyEQ7b45z4ogSOVJ8RRnYLQsdt4hNyZozH20AxpUk8bgIQtmaDchBzrCWrSq4RRvltM
	JUSudVjAQGJSA/wNcyhgj8uW7+M+CVp0f74XC7HrstE4BGkxFa2/nyqAP5K9Kh+UXj8jU99OdYh
	kC81jjpUvSF1Uc3g13yZv/u9ntk4VzJL/1oyG+Znx6N+Jgninb05ICn+3C3yr77B/gNTHP0YJW4
	hwCz5vUN1FaeS6i74iNM37cv0BvGWyrCdXmQiKwwoy2f+nNdGy5n2ymSAfpKT8b4ueWj+a2wTzZ
	l4psvC+gZv2CI1c=
X-Received: by 2002:a17:90b:17c3:b0:398:deed:6e1d with SMTP id 98e67ed59e1d1-39debf6cf10mr3012416a91.5.1789370989442;
        Mon, 14 Sep 2026 00:29:49 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d957131f9sm19598245a91.12.2026.09.14.00.29.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:29:49 -0700 (PDT)
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
Subject: [PATCH v2 12/13] ASoC: mediatek: mt8189: Propagate TDM clock errors
Date: Mon, 14 Sep 2026 14:28:41 +0700
Message-ID: <20260914072842.24420-13-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260914072842.24420-1-phucduc.bui@gmail.com>
References: <20260914072842.24420-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

mtk_tdm_bck_en_event() and mtk_tdm_mck_en_event() currently ignore
errors returned by the MCK enable and disable functions.

Propagate these errors.

Fixes: 9f202872ba04 ("ASoC: mediatek: mt8189: support TDM in platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8189/mt8189-dai-tdm.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/sound/soc/mediatek/mt8189/mt8189-dai-tdm.c b/sound/soc/mediatek/mt8189/mt8189-dai-tdm.c
index 5d68a55ccc45..1b51027c6cf4 100644
--- a/sound/soc/mediatek/mt8189/mt8189-dai-tdm.c
+++ b/sound/soc/mediatek/mt8189/mt8189-dai-tdm.c
@@ -261,22 +261,23 @@ static int mtk_tdm_bck_en_event(struct snd_soc_dapm_widget *w,
 	struct mt8189_afe_private *afe_priv = afe->platform_priv;
 	int dai_id = get_tdm_id_by_name(w->name);
 	struct mtk_afe_tdm_priv *tdm_priv = afe_priv->dai_priv[dai_id];
+	int ret = 0;
 
 	dev_dbg(cmpnt->dev, "name %s, event 0x%x, dai_id %d, bck: %d\n",
 		w->name, event, dai_id, tdm_priv->bck_rate);
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
-		mt8189_mck_enable(afe, tdm_priv->bck_id, tdm_priv->bck_rate);
+		ret = mt8189_mck_enable(afe, tdm_priv->bck_id, tdm_priv->bck_rate);
 		break;
 	case SND_SOC_DAPM_POST_PMD:
-		mt8189_mck_disable(afe, tdm_priv->bck_id);
+		ret = mt8189_mck_disable(afe, tdm_priv->bck_id);
 		break;
 	default:
 		break;
 	}
 
-	return 0;
+	return ret;
 }
 
 static int mtk_tdm_mck_en_event(struct snd_soc_dapm_widget *w,
@@ -288,23 +289,24 @@ static int mtk_tdm_mck_en_event(struct snd_soc_dapm_widget *w,
 	struct mt8189_afe_private *afe_priv = afe->platform_priv;
 	int dai_id = get_tdm_id_by_name(w->name);
 	struct mtk_afe_tdm_priv *tdm_priv = afe_priv->dai_priv[dai_id];
+	int ret = 0;
 
 	dev_dbg(cmpnt->dev, "name %s, event 0x%x, dai_id %d, mclk %d\n",
 		w->name, event, dai_id, tdm_priv->mclk_rate);
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
-		mt8189_mck_enable(afe, tdm_priv->mclk_id, tdm_priv->mclk_rate);
+		ret = mt8189_mck_enable(afe, tdm_priv->mclk_id, tdm_priv->mclk_rate);
 		break;
 	case SND_SOC_DAPM_POST_PMD:
 		tdm_priv->mclk_rate = 0;
-		mt8189_mck_disable(afe, tdm_priv->mclk_id);
+		ret = mt8189_mck_disable(afe, tdm_priv->mclk_id);
 		break;
 	default:
 		break;
 	}
 
-	return 0;
+	return ret;
 }
 
 static const struct snd_soc_dapm_widget mtk_dai_tdm_widgets[] = {
-- 
2.43.0

