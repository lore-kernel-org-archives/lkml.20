Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CB5D353A81
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 06:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790662327; cv=none; b=GzJtAHZTu/NodRAdG/hKHb8CjTt0l+HMXIvdbLkMkZnvouJfjMKlNeCKXJTB2WypyILsdrDh4p15cFkcjg34DgGG480fQxfzkdQRY95Mftadt6HcC9dhwDV05OcQNq4AmRWW1e15Xcxg3KHnzvpnIPdiq5bOAhi9qWadWIaGWSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790662327; c=relaxed/simple;
	bh=KCSgSXh19X+hOXoATJgfVeEzUlNqDSgVlI1L4EZAYvQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n1RvkfLWiyUwMT6eIlqNaeehjyLGGEKe6Oq0Gm2/Rudu7zuofs+geMAG56hrcSUOsWx2amNOgYCadLl5IkHkE38qINaDgyca16Ns3t7lJOS5BENhItz5neOoXWRTmOHIgnr6zx9cg+Oc1BXXJKimwnVtfNosvJTK6mAT7Z+MFqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HSUXyhUl; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HSUXyhUl"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396ccb1a98dso2148900a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 23:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790662326; x=1791267126; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vj13ChAHd3bCWGU6cXQ2y/gw1Mtr1ISY+VXDwMotkXI=;
        b=HSUXyhUlyJ2YJu7W9MxUundWKz/Wqsln4GHxu/x1E7hdqRegfrPTG8wsbW/A+rlzuR
         dpPWLlH3wqd3HLQOuhpDPxeH/jqXsgpLiAPJPwLk9oDw7El503fByHCqQf0bw8PkgGpg
         8/SnnM/ODs7yfoWwCBqxM8bmHZ9/R6DG3pPo+EtpVi5viH1LkHgJZmCahEDXEmOlEgzP
         5wBcxk8fOplUYQrUaTqwgZLh3C5HOoBv2XW2qq7taCCEIyMtoutEL51stbeiyQs6Nzln
         Wm/lZhd1a+amULJtPTkCInAy9R+q4Nupevh5P2d97ijIHHVIX3hpsn5LzRBarJ54vnkL
         3MsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790662326; x=1791267126;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Vj13ChAHd3bCWGU6cXQ2y/gw1Mtr1ISY+VXDwMotkXI=;
        b=qQ19YkZg8ubMg1fYZKyc7Sx9A3IKuRXqYptUJrq5Jre6kmg22YbC0oyf3GdPoMbr43
         TfKy1hj30Dyns8qzaFLliTvbh8rBBbSVm1fsktdfpjLuYI3rMpC1MKBnvImd4mgawnwM
         H5+RU0DL8A/7ngAyjXUU9EKWjuYzyNC5o9FJMFk9ixS/4XBO/ZJ5OLapbB2F7YivlkJA
         q84yTqXvrmfoKaTb2J5gRcPPbx5Fj+rpe2wRHttK+vQAqSWjcg0O1F9qY2KyiFgC8Mui
         cfc2a/b6RxDKRWV50F5w18uc3aVd+dC02rGpdwB5haHK2AsFu0L3XrfIBDtFQv151Tg3
         r4lA==
X-Forwarded-Encrypted: i=1; AKwUvBzm+qg8qL1pSxSBuJ1V/tEOsE/VzYbfpx1zIgj/S5Z/m7ZzpbW5XRzpyvF8n9SqiTwD2w6iiEMz8Xo9xt8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJOKWBNKKNFK8TrcgEAN9/cN1W+Ksa+Qjav3c5so2rbgAp3fNbz
	kg/pCbHzeRsEXSL1L9KSqEIe/QdgudmAGflq+apTg1VpEFw3IdZsF3qW
X-Gm-Gg: AYBFou1hUh4MzTSp0Zcx8iW/ZlodMQu9eJ/tP8fflb2+GEtAff9mP054IMe3AfagBSw
	+KTTkoz1ABAHkd2/WtykUutGHXGcRkJK4YwWJhQagvOsdTKPMp6hyIA07NaCYNxfksipK8nFhEx
	xE7tPNR2ZZ/tmFhZEynnzXFBtNPET81TqWxB6bMMkHi6P6ERBFlUMm4Ddg5sIkdBXJtBysPdStw
	bxhl4kSs5eYj2Cf3SMgkmn22bnl4geeS4Dtc9Bp1+ztLg64XH6uyyfunVPEo9hSSLP4tZtPHEJc
	v/gdxf0I8PWtJb37TRECTyRpT/BW8z6OfZn5RhkVsMie60fH2XwMNjPAzIRZe9O7Lv1cxIrLW0N
	w0cI01JrrA+vjoBf9ooxoBYAiPnl74BbO58TAc6hVga87bnq+z2Ld4GcSdhwuJHBG3FvVZ60nvf
	lSajZawjMmP0fFwL9zykfTirBg40Xqn1zWX6vySf4kRpUdJ0867A7BEDp2jA+Tq7KTP2Qqz+5AA
	TCH/XltCbUjHhyXrG9P60PRHXEMltcL7e7/76dwbLgDXHpl82FXmtpEw88BeS8+Mk2uoZ2ys1up
	OVzP6P2mq/yv6Q==
X-Received: by 2002:a17:90b:548c:b0:39e:6c6a:656c with SMTP id 98e67ed59e1d1-3a0bb63224amr9430503a91.47.1790662325592;
        Mon, 28 Sep 2026 23:12:05 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a498726d63sm3280965a91.17.2026.09.28.23.12.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 23:12:05 -0700 (PDT)
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
Subject: [PATCH 02/10] ASoC: mediatek: mt8196: fix APLL enable error handling
Date: Tue, 29 Sep 2026 13:11:13 +0700
Message-ID: <20260929061121.124001-3-phucduc.bui@gmail.com>
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

Propagate errors from the APLL mux and clock enable operations instead of
ignoring them or returning success on failure.

Clean up previously enabled clocks and disable the APLL tuner when a
later clock operation fails, restoring the APLL mux state before
returning the error.

Fixes: 7384ecab34eb ("ASoC: mediatek: mt8196: support audio clock control")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8196/mt8196-afe-clk.c | 47 ++++++++++++++++------
 1 file changed, 34 insertions(+), 13 deletions(-)

diff --git a/sound/soc/mediatek/mt8196/mt8196-afe-clk.c b/sound/soc/mediatek/mt8196/mt8196-afe-clk.c
index 91ae44024949..1dc4210e58c7 100644
--- a/sound/soc/mediatek/mt8196/mt8196-afe-clk.c
+++ b/sound/soc/mediatek/mt8196/mt8196-afe-clk.c
@@ -314,15 +314,17 @@ int mt8196_apll1_enable(struct mtk_base_afe *afe)
 	int ret;
 
 	/* setting for APLL */
-	apll1_mux_setting(afe, true);
+	ret = apll1_mux_setting(afe, true);
+	if (ret)
+		return ret;
 
 	ret = mt8196_afe_enable_top_cg(afe, MT8196_CG_APLL1_CK);
 	if (ret)
-		goto err_clk_apll1;
+		goto err_disable_mux;
 
 	ret = mt8196_afe_enable_top_cg(afe, MT8196_PDN_APLL_TUNER1);
 	if (ret)
-		goto err_clk_apll1_tuner;
+		goto err_disable_apll1_ck;
 
 	/* sel 44.1kHz:1, apll_div:7, upper bound:3 */
 	regmap_update_bits(afe->regmap, AFE_APLL1_TUNER_CFG,
@@ -336,14 +338,22 @@ int mt8196_apll1_enable(struct mtk_base_afe *afe)
 			   0x1 << FREQ_TUNER_EN_SFT);
 
 	/* audio apll1 on */
-	mt8196_afe_enable_top_cg(afe, MT8196_AUDIO_APLL1_EN_ON);
+	ret = mt8196_afe_enable_top_cg(afe, MT8196_AUDIO_APLL1_EN_ON);
+	if (ret)
+		goto err_disable_tuner;
 
 	return 0;
 
-err_clk_apll1_tuner:
+err_disable_tuner:
+	regmap_update_bits(afe->regmap, AFE_APLL1_TUNER_CFG,
+			   FREQ_TUNER_EN_MASK_SFT,
+			   0x0);
 	mt8196_afe_disable_top_cg(afe, MT8196_PDN_APLL_TUNER1);
-err_clk_apll1:
+err_disable_apll1_ck:
 	mt8196_afe_disable_top_cg(afe, MT8196_CG_APLL1_CK);
+err_disable_mux:
+	apll1_mux_setting(afe, false);
+
 	return ret;
 }
 
@@ -367,15 +377,17 @@ int mt8196_apll2_enable(struct mtk_base_afe *afe)
 	int ret;
 
 	/* setting for APLL */
-	apll2_mux_setting(afe, true);
+	ret = apll2_mux_setting(afe, true);
+	if (ret)
+		return ret;
 
 	ret = mt8196_afe_enable_top_cg(afe, MT8196_CG_APLL2_CK);
 	if (ret)
-		goto err_clk_apll2;
+		goto err_disable_mux;
 
 	ret = mt8196_afe_enable_top_cg(afe, MT8196_PDN_APLL_TUNER2);
 	if (ret)
-		goto err_clk_apll2_tuner;
+		goto err_disable_apll2_ck;
 
 	/* sel 48kHz: 2, apll_div: 7, upper bound: 3*/
 	regmap_update_bits(afe->regmap, AFE_APLL2_TUNER_CFG,
@@ -389,14 +401,23 @@ int mt8196_apll2_enable(struct mtk_base_afe *afe)
 			   0x1 << FREQ_TUNER_EN_SFT);
 
 	/* audio apll2 on */
-	mt8196_afe_enable_top_cg(afe, MT8196_AUDIO_APLL2_EN_ON);
+	ret = mt8196_afe_enable_top_cg(afe, MT8196_AUDIO_APLL2_EN_ON);
+	if (ret)
+		goto err_disable_tuner2;
+
 	return 0;
 
-err_clk_apll2_tuner:
+err_disable_tuner2:
+	regmap_update_bits(afe->regmap, AFE_APLL2_TUNER_CFG,
+			   FREQ_TUNER_EN_MASK_SFT,
+			   0x0);
 	mt8196_afe_disable_top_cg(afe, MT8196_PDN_APLL_TUNER2);
-err_clk_apll2:
+err_disable_apll2_ck:
 	mt8196_afe_disable_top_cg(afe, MT8196_CG_APLL2_CK);
-	return 0;
+err_disable_mux:
+	apll2_mux_setting(afe, false);
+
+	return ret;
 }
 
 void mt8196_apll2_disable(struct mtk_base_afe *afe)
-- 
2.43.0

