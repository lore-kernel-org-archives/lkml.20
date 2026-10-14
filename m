Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D56B44FD271
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 11:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791977383; cv=none; b=LCELbEZusXZrGKKRYR86tHWjgqq8fJ2Jk6EFMplOD/qNQQeYwC3of+n74Pcku01r7yW4e6dPpA5pDrPkDd5uScGpDoGbX8Uklpd8qYBi9tfOG9NcCaDFfG2t96bmUAUuTKO6IMUlfe0iOFUed6SYrJrKtS7ZHZHoRW63891tpG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791977383; c=relaxed/simple;
	bh=d1blBm1Hzmm7Po+juQSeLUZW1RgbslTJX1nk3YK/wzo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qbWvj2xBDuQvfUH0i2BVasgLDazKDSQEMcXuj7uI6PF+TZzUJCOwuMvPflJEOnwzIUxfhsQ4mTz7pQ+FjL8DfVtVTsYXxSPyKG0frH204dazqDQZLI8Uw19mGZW7U6JRsV2fqjfOF6baeecJaTJampl2BiMz9miPnAvvggfNf74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UQshfsTM; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UQshfsTM"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cd60c5da24cso1756596a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 04:29:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791977381; x=1792582181; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U1o0Fr3SsImGt+aqLrFKoD5OlJOoiuIdG7+nqMI1YN8=;
        b=UQshfsTMDjHfn8RYLF+sA/YqWYveXKGoxy64xm3GcaCvkcj/2NPMlOtl8TXits7C08
         olYjSP5daWG+2PzUdfvvHeWyZRRkUjZtUL/3FGnRhRkbQ63owIt5YVrL4UzNcqMR8KHy
         +zmOKQmtp/UiPn4eEUXeWc1vFvtH3tr83Llc2ODQ/BOEIw/2ST7rgw3yNQtZQMqZRuPw
         EaLf0hw3YlLYSXc45ZyLP6og7azt7xYvowVA7gKpGIrPyEXeXeWAf0hafAFzn2GCytG9
         Xap7CI5BXKu0Y3l88slcmyS5d9l1ssWnHS1SxHtTwDEbFJmlBhqOCfV5DwcaG4HqyTHr
         OJzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791977381; x=1792582181;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=U1o0Fr3SsImGt+aqLrFKoD5OlJOoiuIdG7+nqMI1YN8=;
        b=ePYC/tOKRr+RxDJPIgJS907NWRqUmHCCXQw5qcziDw5VdLzJIip7uKwOhERMo9ny4z
         aavlX2cCOqGevKu8pOHw0sTlDX8Syixku/flN37E7z2B8XDsD421s5ElTA8pg2q5OYnF
         OBpnuc3fjoOIwiH9JjBhzfubCemnlqVtuqTkY6Q4Gb5XCB+PP/dKgilUiqJ7qoO0Rxt4
         FIJEogru17Ejq8OmbhXeIOkgL8u8D7ONQ/HZi/eFVXvtl1DUvnJGY6z5EYPL0om7b8EA
         i/3jwyRjoUYqgiyjDK+S4VHiZr0Mbe5uVUHKpW+3/oiPWEBPut7H90zW1F/JjuMqJiZ3
         2cnA==
X-Forwarded-Encrypted: i=1; AKwUvBytGVZA2RexvA2F9wAtFDgDhCBsjMTz3gwTY77KmEpdvwxEKE3ZSDUzcw0SVIvxJkk+BEpa/i8Re6t8fis=@vger.kernel.org
X-Gm-Message-State: AFq9FYLBpQ9VO7ICIzU01/oAQhIGfWnIQrd2jWQa4pAVElfoiewjCrMv
	dgURthLuZiF73kzjq4axiyveirxIrIn8ZBBNQidzkMBKsZ3PEVjr9wSI
X-Gm-Gg: AYBFou1CHZCdYTMSAwulHWb4D7JzL0iQOIYiFOuT8eb8pU3MwDahr7DMjZQauGpLUVr
	G3SdPBr2D2uT+6FrD+cscJC6mgPqdcNgzIn9D9YXTvsFrvJyaB6W3bUksqWrzgoyGOhDdRk79Ch
	f+MAd75Om8Kf3vvy5FN+kvfP1oYJ4lUzqzFdgZwkdADNd9bLXkHvxAyv/PpTaBa7FO1SvEABaWR
	Jq5jn2dtABWjdOZniQSEp3rgANso3LjE8XPVskUR0sE6X1N+ThXsO+eRJslev09aRnjO7MnJqVU
	LKFgLv7ocXbJllhsHpPhykyr7qghduAPMBZAhq+rHivw+2FXFqga0FyRaac4SDknp9ZJk92A/dw
	lXh2tSS4oPBDJq8ZwmDlkxtPmtY0zjU4lC1pa8qBvlrgnoW6ZgyqFllcsllYPODj29PSnnD8khl
	lNiVh/5mi8AFnCWl2ghz6C5y4rWiVOZxSzA2CFNx15iWBv+niQHHsfFNf8pa7blaE7Ryf8kFIMk
	kHZX6CXzkYeJrgvi3sE1lusefgoCIH6zXlib/JYNLqNSUPIoqFnSa4bq8nWCwqQg7ILwYJMxv4Y
	IYBD2Mg9d+k/kw==
X-Received: by 2002:a17:90a:10d6:b0:3ac:80dc:f40e with SMTP id 98e67ed59e1d1-3ac80dd0197mr393878a91.24.1791977380867;
        Wed, 14 Oct 2026 04:29:40 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac61171feesm4077076a91.17.2026.10.14.04.29.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 04:29:40 -0700 (PDT)
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
Subject: [PATCH v3 15/16] ASoC: mediatek: mt8195: Fix ETDM probe error handling
Date: Wed, 14 Oct 2026 18:27:50 +0700
Message-ID: <20261014112752.683032-16-phucduc.bui@gmail.com>
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

Use pm_runtime_resume_and_get() to properly handle runtime PM errors
during ETDM probe.

Propagate errors from MCLK configuration and enabling instead of
ignoring them.

Fixes: 1de9a54acafb ("ASoC: mediatek: mt8195: support etdm in platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8195/mt8195-dai-etdm.c | 27 ++++++++++++++-------
 1 file changed, 18 insertions(+), 9 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c b/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
index 11317cdd14ab..8fa830a57502 100644
--- a/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
+++ b/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
@@ -2503,6 +2503,7 @@ static int mtk_dai_etdm_probe(struct snd_soc_dai *dai)
 	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
 	struct mt8195_afe_private *afe_priv = afe->platform_priv;
 	struct mtk_dai_etdm_priv *etdm_data;
+	int ret;
 
 	dev_dbg(dai->dev, "%s id %d\n", __func__, dai->id);
 
@@ -2510,15 +2511,23 @@ static int mtk_dai_etdm_probe(struct snd_soc_dai *dai)
 		return -EINVAL;
 
 	etdm_data = afe_priv->dai_priv[dai->id];
-	if (etdm_data->mclk_freq) {
-		dev_dbg(afe->dev, "MCLK always on, rate %d\n",
-			etdm_data->mclk_freq);
-		pm_runtime_get_sync(afe->dev);
-		mtk_dai_etdm_mclk_configure(afe, dai->id);
-		mtk_dai_etdm_enable_mclk(afe, dai->id);
-		pm_runtime_put_sync(afe->dev);
-	}
-	return 0;
+	if (!etdm_data->mclk_freq)
+		return 0;
+
+	dev_dbg(afe->dev, "MCLK always on, rate %d\n",
+		etdm_data->mclk_freq);
+	ret = pm_runtime_resume_and_get(afe->dev);
+	if (ret)
+		return ret;
+	ret = mtk_dai_etdm_mclk_configure(afe, dai->id);
+	if (ret)
+		goto err_put_pm;
+	ret = mtk_dai_etdm_enable_mclk(afe, dai->id);
+
+err_put_pm:
+	pm_runtime_put_sync(afe->dev);
+
+	return ret;
 }
 
 static const struct snd_soc_dai_ops mtk_dai_hdmitx_dptx_ops = {
-- 
2.43.0

