Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E33A1492E37
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 12:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789045138; cv=none; b=l/y01vnzds/xJOjGPOaNVDnQOoceupOGgtsU0lpdMsyFldQUcJYRDAx3lAT9ubKUyAIE0NYXLtP0gvSBMoODBoIQK0QQ6bniLtw7CyIXnUgGgN77iYcmTtkkzNgx31IvXxKV5NtuPiGRNEZf1ezJlk54SJ8MoM3K7TS05xF2uOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789045138; c=relaxed/simple;
	bh=zVt/GLB/PctPHE9xjcaVCw+lY910OuGBOfYlSPretgM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a546oU8Ey/GgFOS4LO3Hmzt2b/9/p6o1kupgdZ6fES9k+dkHSPcJO3H4UScTSc2Svrk6DwUCrxvcubbvl1Rm92BDb8hlEfIbK0GE/NI7+twc9YbzxuTRWvpsyM0FUPRLxNQIDTPY/JgQ5vIaGOdAHnJKXB8v3GfERk5OaTSguH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GV+HiOYW; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GV+HiOYW"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccafb751so2128170a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 05:58:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789045135; x=1789649935; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vlGnqVAUzYoXB3nTaQam08DX17fuCUu75lyq1+U5jAU=;
        b=GV+HiOYW4ibcXRW0xjhbCO9YDZNtuLs+6jRlWYwSWfuWpU5e8wdNu8ARubW8ePu/dM
         Q4Q/EidX4rLFAhHy3L3QnQnnT9q8vnQkvN4ZqMn2PMVws9Om2dK1oKEZWc0hoSHePY7h
         A0zH0xrcw16Jc108Sc9CKoGW8IXoFwDiWC3qJjkyQJp8pkeiA4Ry3GXjsBkIfvIRBw1i
         Rl+RSJkacGn9ovAMDE3b21aLS//sNnDVF3j4AWkYyLaH4RNRBuXIA9lx/zqAGGQjjK3I
         1w2gSPq448J8SN91AmkMlQ087m7ZkH869WDUGugtRLz0emRb1UkOQGIhJeXLzahjvAAi
         0Tsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789045135; x=1789649935;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vlGnqVAUzYoXB3nTaQam08DX17fuCUu75lyq1+U5jAU=;
        b=Lv2g+X0oFo69lfrE8Qubdwu5iLTisetQ23ZnjeQ8V+mHd1QXLFhrJnLuECM19h7qfM
         Uy5qEWr4U4hpqewvc2b8c79aC8cQbqJGCMPJZjRrSHT77f54PXSiPQJPTAiQgZnd8V/2
         Bwhx/s3ezNQ+8qd16F1rGz1JysTgJtV6iS5uuBE6erU9DpLDcq6wAZHe0akWPeizsAHv
         /6bfb8VrZYEbiGoz7EYczcel3S9qtbsd0VnvyBH+8o03L8FwMuYyaCFJZlcHSV9kEXK/
         XW4K9jmems2vuW7Nyrz2mIRvPdBhusvsgDxfQ2tiHxrXCALrS2Vnwhz06utBOCrjPDVz
         IfUw==
X-Forwarded-Encrypted: i=1; AKwUvBzzXNYtYMYGwlFfrFSsS/4GNxc0qiXoKXx3XvwrwKbAwFE+UiEBtjwsX5s0iuoixbWo1EEurDn8+HcKnRQ=@vger.kernel.org
X-Gm-Message-State: AFuF++n3SEnoVzTzPLe0/o8qXbouoq/Vhz0PuuVYq+sv71tdOXN/WxTO
	mw1n/YwYSMTcSRHI31oazyf2OJKFJ8C56Yk5cREatHpmD3R09FDiXwCg
X-Gm-Gg: AYBFou3nQeRktRavIjLOHjtYFC37Tha9oLRbIw2/kkw+R9k4t2xuMYDtheTWrMdsxnm
	++SAtI6W3cF4cmRUVDNKJMSbWkNi3UfY8anY1nk9bFTVHkrkmCA+asfV8QpnX/PU8YrU7RJ0B4e
	NybaPySbrDRKjHablq3+tsE1oyX8KZ4IQdZP/rmn0ghqkPwW525uc/tEZgWLw1Sw5NuWCDhwKSg
	S/dB9HtuxTnhh1zb5/kOUxpJO9nMeoMhgWlFV9pHaXBq7xBHAssRCmFg1u4XciXagZyciNtcWkz
	r4POshLwASrwbKmpWVpwx+5bHPQvgLroJCcnEfosmNGg57ntDvWHO1uiOEgGTaZYACFtX23XMoN
	uwA+5Sz2PsOD9LgGmONnc7iA+NUpQUPRtNuyNgLPIDZ2ZuuCgcf9X+Gacx2y9nFPMluWpESTT4c
	kPFRC9tDGvYn82vAK29faMLXXjRAdUdzB3NeBYO+OxFhUNXJqcjVKGN1k+8rNeF+zjpn09lBJZ4
	vKrChwGG5eCa8HUhkl/P3VdTMU7T3UaHltjDIeGLejFGRmtgBup8IcFY2yulkKu8LKzRGmrH1hI
	Aan0B/xFKmtccI8=
X-Received: by 2002:a17:90b:520e:b0:398:9be8:ea65 with SMTP id 98e67ed59e1d1-39bac3c452dmr19487586a91.18.1789045135450;
        Thu, 10 Sep 2026 05:58:55 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d7e77b1afsm4891592a91.5.2026.09.10.05.58.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 05:58:55 -0700 (PDT)
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
Subject: [PATCH 12/13] ASoC: mediatek: mt8189: Propagate TDM clock errors
Date: Thu, 10 Sep 2026 19:57:41 +0700
Message-ID: <20260910125742.150902-13-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260910125742.150902-1-phucduc.bui@gmail.com>
References: <20260910125742.150902-1-phucduc.bui@gmail.com>
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

