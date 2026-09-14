Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 635E03E5EF1
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789370982; cv=none; b=sO5Ttr/XA2DVs7aBp+ysqv4PybaQwYdmxwXfHjKuRyWtxmuLTIqFjlfNjtP9Lfn9A1+HZlgtu3czyASLb+w404ZdxiLO+imHjDr8m+Ar0qWj5RFumRKaZ5ZMAn5copwDVisKFoiJhu4TNc2c1HR2fkPC1yIPiA7RVqla7xmAhJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789370982; c=relaxed/simple;
	bh=L2LE+CaRB/r8u7ksh8vaBEGwU4XGfFxUrv1E4QN5LbI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ex0oE3MV6wSChk1McFvYFP43LhBaKJA70EpklzsLuSnTc/zy6vFeG7d+343N7q5i898ttclbARfK25WQOXd8phMLQfPgb9v2jXEU62Ss2hktQmT/xpfFBbros4ivqoGthzXgHESVUimN7z+IPtex0LDOMm4g7XpMsvdHZkgUQe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SpmbS4WB; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SpmbS4WB"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-38ea87caafeso2934161a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 00:29:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789370981; x=1789975781; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PGiDmxTKSnaxUwBF7nwBu69cnzbPnmVOgMWHLivqaTs=;
        b=SpmbS4WBqZaX2y36mQU5uExJ2EOJgO5CfGdLkaecYaF9LE/B+chwbVaHD1fSGbDfku
         v3+68nQEWhuR20WcI3M4GJ9vTTFTts4jNT9IV2jOdCPOBm6hI4Acre4zOBg0aiSkd3Xr
         9Ne+de4QXLqVkm+S7FuoEksgxhxLHBXAyk2eukIlybVCbU8g55nAI7Qz/CN/Fq4Glgsm
         XdF2ii0tQwTcVUa1xUdswHkSbYtF/JeVemQcE3YzbPAr+fmNRLNgS3TMc31uuMvhymDY
         v3fDRTB3emzXTemCauJyRKRyUXJEepjIJuv0rHyDu7nt72HS2N0bSFSLPCI2EnTsvL0q
         qYJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789370981; x=1789975781;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PGiDmxTKSnaxUwBF7nwBu69cnzbPnmVOgMWHLivqaTs=;
        b=NFY9KBbL8XnnWTsrP6cVf0f+RfWqwci5Kvut5llE9HHRafTp2AbktsrBJtf53enbpM
         CQ2+6ly8QPnM03SmsVHgJQO7tadVlGgJQLlJKGa66PsBnE4f3uujeAk+TlZpAX5C9o9n
         kk4Xo9euz1u4oxfib2YsIckuk0xX3utLVH445MGw8nMzVF2ZhAD1LmNUYamRzLe4sEQc
         Lg98gRu8Vi0fgheL2JRZ72jhnpc2/uMNLBwgzD30xPFk3cHIQ4cjPFqTrJ0S43PySK/r
         CUqbuZJD1W9j/kbv6vBUQkaynHW1YzOnzYHpCIX26Uz+fpNhg/3rnT9CTcqO08PWZbn/
         MQFg==
X-Forwarded-Encrypted: i=1; AKwUvBxvEdcklDPTIPwONJ8zt3ejW1I88uZveW2dCav9wW5UKXeNLi+FrgtDXZ9TQCXHtqIwSeN2IqJjBbWM4vM=@vger.kernel.org
X-Gm-Message-State: AFuF++l3Aq1RpVL8Ysh72iuXja08KLk3pq5REDKO/QhXDGWb/P6biXID
	o2QLji9ex9A5DPc2eZVvNP9ja5TxoM24SNQljkhdCkg6HY6srvoymbEf
X-Gm-Gg: AYBFou3Sn3o4c7cLID4eExS2hZ9rUaYzGBcprlRv45vIVZgDBa3oIpDTapjJ2wq2xrn
	T6fcUxJFRMEbVWotz/yWhtdIX6dr5gPa5/YQI3let9zPDjFrBceR/72C/tZkBNAb0S9faPQoRa2
	DDPflmZTLwFg0SVRDErfN8RO738AQ5xsKJv44h7epnUN+imydd+DVaMe05F8e3xRN4Y6SxNio41
	ZGIGTK93ovvu2BNqIE7BSCdfsGMBKcZ4td8DkZ5RNmFQmATXmiWnYXZgXq8r/J2tb2aaA+Wwq4D
	eOd9t3R3mbTnWjKGPvqrRWNk7WINkbbU+w5WhOtzINcsmLYfGBECNxa7KilrqmUn8ReAudyqcjE
	6pkdaY3Lek2lAlhFMFIQt8HPtaoClfGIN/ndbEaFoLmaHU1U8enS6Wbx4w2EW+FpTOejZxnFtCk
	2wK5hRNaCsUBU6AqxT3opdvHz+ezWFJaP3mgzaxfICdmyIxlFIxJ7seRljM0ZQ0vAgPOAmEgwAv
	sR1Y7ReX1eCdw7O5hssq0JupxiqIg3j+m3L3jbPGYg/QTpGTyayYwEjeZxWKPWoM29EsH066EYx
	nu4jSCpxfeIn9OKJ
X-Received: by 2002:a17:90b:164f:b0:39d:b1bd:b384 with SMTP id 98e67ed59e1d1-39dec0b6344mr3180432a91.17.1789370980816;
        Mon, 14 Sep 2026 00:29:40 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d957131f9sm19598245a91.12.2026.09.14.00.29.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:29:40 -0700 (PDT)
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
Subject: [PATCH v2 10/13] ASoC: mediatek: mt8189: Propagate MCLK errors
Date: Mon, 14 Sep 2026 14:28:39 +0700
Message-ID: <20260914072842.24420-11-phucduc.bui@gmail.com>
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

mtk_mclk_en_event() currently ignores errors returned by the MCK
enable and disable functions.

Propagate these errors.

Fixes: 7eb153585598 ("ASoC: mediatek: mt8189: add platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8189/mt8189-dai-i2s.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/sound/soc/mediatek/mt8189/mt8189-dai-i2s.c b/sound/soc/mediatek/mt8189/mt8189-dai-i2s.c
index 4826ee250d70..f20dbb410223 100644
--- a/sound/soc/mediatek/mt8189/mt8189-dai-i2s.c
+++ b/sound/soc/mediatek/mt8189/mt8189-dai-i2s.c
@@ -519,6 +519,7 @@ static int mtk_mclk_en_event(struct snd_soc_dapm_widget *w,
 	struct snd_soc_component *cmpnt = snd_soc_dapm_to_component(w->dapm);
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
 	struct mtk_afe_i2s_priv *i2s_priv;
+	int ret = 0;
 
 	dev_dbg(cmpnt->dev, "%s(), name %s, event 0x%x\n",
 		__func__, w->name, event);
@@ -529,17 +530,17 @@ static int mtk_mclk_en_event(struct snd_soc_dapm_widget *w,
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
-		mt8189_mck_enable(afe, i2s_priv->mclk_id, i2s_priv->mclk_rate);
+		ret = mt8189_mck_enable(afe, i2s_priv->mclk_id, i2s_priv->mclk_rate);
 		break;
 	case SND_SOC_DAPM_POST_PMD:
 		i2s_priv->mclk_rate = 0;
-		mt8189_mck_disable(afe, i2s_priv->mclk_id);
+		ret = mt8189_mck_disable(afe, i2s_priv->mclk_id);
 		break;
 	default:
 		break;
 	}
 
-	return 0;
+	return ret;
 }
 
 static const struct snd_soc_dapm_widget mtk_dai_i2s_widgets[] = {
-- 
2.43.0

