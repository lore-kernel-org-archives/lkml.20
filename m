Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 681274FB9CD
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 11:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791977336; cv=none; b=A9+4HO/4NdxarG40kUYH4EeAoQuHRuopzJLofwN8afSzCE37dkp9dkc4uUWVYj/1M/o/qA6+nm5VJ01bF+/NEsOhE6vRTvyUdwDrRxcr8OMtJ8bxZ0MZBOZZ3hQQMvJFGviZ2DRuGh3C5vCj3orSUxpE0BxX5/iKq+tHReWPEvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791977336; c=relaxed/simple;
	bh=pxSpe0O1bS0J5JevJ1izQfRCUVeBTwQvQAquRw81NNk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SNLVDfcd+3cSOdh1XzFcglOKN83w6QjocONSTXVIkN7URNh2wjU+WPAfubVoNuw1owfoLOwsGzHsQV4ukXzVLNQSUh+Z563eDtr8cGKUym294yYjZNSAgX/o7NKVCvDbKrdBjC1Ohb22OYJ3JGIwhrFxmqAMbL0g9qS7A8+/zQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gfj3Jvvc; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gfj3Jvvc"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2e7006bbf77so5191785ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 04:28:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791977335; x=1792582135; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wrzhrSiREEi518WgYUmB9rjEq8Ct4ueH+v9/vpcq6jQ=;
        b=gfj3JvvcgLPmfbUpFWecglzTL3mb/iv/0KR/nsJeowPPvaVG8+Fy9yx94WQcsX+2Ko
         Kt8Mug9LtZEM933lHBhepNQ9J1eOe05+xxEPJrmLhOPpnFk3RTfqxZn+5yaLCAOUD+HV
         pNEt1wOTuuIJCsjcXuI4hmF1Eahe/VksgtRvEfwsn3gTNaAyG5avrA2+1L6Gy6VpzqVV
         NgN9UDwba8PBy/tkZZ59s/ar5STdLGllgEbWoTjso5hcT+x9TpAfCVnCuHNRfqaE5H0Y
         g7XayqRpYr+r7CzE4JQDOaSmcxY95MslqcMe9HDUsGgLoA98xjJfXPc0lPP1lOo/v0WF
         VIaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791977335; x=1792582135;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wrzhrSiREEi518WgYUmB9rjEq8Ct4ueH+v9/vpcq6jQ=;
        b=H8zFayJfSK4GZp05iK3nf1HbWqPS9dGgfdpc+MQhuayhqWJlGcoudjnUEHsP/tMv05
         0zEwcW81+vec0zEPSS4mKttFCNbCVNQbiV13ubo/ErQv4judBZufPt+dddzOmJopfnep
         qeCd+vlTeh8sMWSt9O4zLhH6cGQH4da43yPGZavlyDj78rpKEarO5PamtuUsO2CfpYVH
         sksPwFy7vUwm8bULS12RwKPtfhGEAitg4wiFBtq8VJYxPuJIasiz2k5zsskBKUEeQ1ix
         QrrHVKHY19brjkmy2ygkax0lyTpPJLhFrz7gMuBO5gf1Ke3oe7vMZgVlIkTqCpo+hUzp
         WKCg==
X-Forwarded-Encrypted: i=1; AKwUvByAEBc5Dn6/K9FKjLCw4gDarz3UQCCoNmNGm1M93tQpcnBrl5T48V4oHkaX++a2cPAS2zMwtSFTVGZegfE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKdxoBfPx2au1VX08dsK/43G8J8YL5bR/JYskq+UmpSUKkPgEfo
	JTAB8YOR1x8kzDQlD7lk64LbzJ039W4HiBs71n2nJbS2sc+OrC+z96vD
X-Gm-Gg: AYBFou1JWPB6NHGLYza3SWNGE8qOX8B5UCg0mLMwXbLUEv37SBumjzApOk0DAxrgQFd
	eNQy56WNL/8qZUgVvUAJNvwr0D19nXUMQ7p0qJdUgRh2gjt7U1291o5lK7wCJOAWduL+u8JTTcp
	iO87Y4GTGKwAlzAShni7VhK5TpGsiidrRWrdeEmZIXXs0HtEM1ffHVVx18U8fTbEUJDtiiOoOaj
	uXp/rr8F8NBYhS2Pe9W48O4GnmM3CQfiUl0kVySXbR1cFbJSLLnkBuYZqwDHKpOhPF+RVXx+mBh
	Q6CYeGu37CTMNZ7ZhwCNkB7ShVIcMUZ5dErNO1/IeV9cn3lcgs4NC5E4JcqjrWThEB65NII+cSg
	svtsoX9jZSXIVU1E+M3S99k7RdRhpFf+0rZUwaplwMzaTaMbpTR4Q+Uwu1Sww4iWcjM6oGAQMQ0
	6+xBjkyOvcdBAKmMPKsQse5Phj6i3sXL1Ex5VeFEwAVxMcEhyePLicnHUbJQfFMW2EXEouF52hK
	Mgph9QqMxQBSArkpMCajxNE9t9eg2cEr+tAp9P0an2rXBAlNe2jzqbjCkwx7ifkmUwHX1vHISJB
	jNtdQeOKXKgVk7mBbwp5GvTr
X-Received: by 2002:a17:90b:4ace:b0:3a8:59d3:530f with SMTP id 98e67ed59e1d1-3ab3a97a06bmr15236496a91.57.1791977334611;
        Wed, 14 Oct 2026 04:28:54 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac61171feesm4077076a91.17.2026.10.14.04.28.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 04:28:54 -0700 (PDT)
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
Subject: [PATCH v3 07/16] ASoC: mediatek: mt8195: Fix FE startup error handling
Date: Wed, 14 Oct 2026 18:27:42 +0700
Message-ID: <20261014112752.683032-8-phucduc.bui@gmail.com>
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

Check and propagate errors from paired memif clock preparation and
PCM hardware constraints during FE startup.

Unprepare the paired memif clocks and shut down the FE when a later
startup step fails to avoid leaving resources enabled on error.

Fixes: 6746cc858259 ("ASoC: mediatek: mt8195: add platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v2:
 - Check for negative return from mtk_afe_fe_startup().

 sound/soc/mediatek/mt8195/mt8195-afe-pcm.c | 44 ++++++++++++++--------
 1 file changed, 29 insertions(+), 15 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
index 1d3e01e2c3e7..02736949ae6a 100644
--- a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
+++ b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
@@ -364,24 +364,38 @@ static int mt8195_afe_fe_startup(struct snd_pcm_substream *substream,
 	int id = snd_soc_rtd_to_cpu(rtd, 0)->id;
 	int ret = 0;
 
-	mt8195_afe_paired_memif_clk_prepare(substream, dai, 1);
+	ret = mt8195_afe_paired_memif_clk_prepare(substream, dai, 1);
+	if (ret)
+		return ret;
 
 	ret = mtk_afe_fe_startup(substream, dai);
-
-	snd_pcm_hw_constraint_step(runtime, 0,
-				   SNDRV_PCM_HW_PARAM_BUFFER_BYTES,
-				   MT8195_MEMIF_BUFFER_BYTES_ALIGN);
-
-	if (id != MT8195_AFE_MEMIF_DL7)
-		goto out;
-
-	ret = snd_pcm_hw_constraint_minmax(runtime,
-					   SNDRV_PCM_HW_PARAM_PERIOD_SIZE,
-					   1,
-					   MT8195_MEMIF_DL7_MAX_PERIOD_SIZE);
 	if (ret < 0)
-		dev_dbg(afe->dev, "hw_constraint_minmax failed\n");
-out:
+		goto err_clk_unprepare;
+
+	ret = snd_pcm_hw_constraint_step(runtime, 0,
+					 SNDRV_PCM_HW_PARAM_BUFFER_BYTES,
+					 MT8195_MEMIF_BUFFER_BYTES_ALIGN);
+	if (ret)
+		goto err_fe_shutdow;
+
+	if (id == MT8195_AFE_MEMIF_DL7) {
+		ret = snd_pcm_hw_constraint_minmax(runtime,
+						   SNDRV_PCM_HW_PARAM_PERIOD_SIZE,
+						   1,
+						   MT8195_MEMIF_DL7_MAX_PERIOD_SIZE);
+		if (ret < 0) {
+			dev_dbg(afe->dev, "hw_constraint_minmax failed\n");
+			goto err_fe_shutdow;
+		}
+	}
+
+	return 0;
+
+err_fe_shutdow:
+	mtk_afe_fe_shutdown(substream, dai);
+err_clk_unprepare:
+	mt8195_afe_paired_memif_clk_prepare(substream, dai, 0);
+
 	return ret;
 }
 
-- 
2.43.0

