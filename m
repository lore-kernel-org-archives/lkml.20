Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51DE7388397
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 05:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788412349; cv=none; b=g7ls7MhgujkCASPG/y9j1rqmn+WXSxBJ15kuUtNTYKrLPyOjTs6iBU09LMGCcqGsAWevMT9t1oVM34a79s+zPjXbvtR7jg1Av5ozCVgd6zhT/Vqvx5GiOENoH9QsvDDaM588aDeZsVIjNZl+nDjo6UL7cLBRZfeGFAkxn3rNBrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788412349; c=relaxed/simple;
	bh=Lu9ftL++z7WjSD5MPMDlXb7QZyJAM5mSBPMFjz6MMrA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KiLTDEUYfIMgbrb+v88UdwH4pPldsZET0oTNWSRsvYFjr18N7tRnE+0ZZPdH8fJmozpnDpieR/E2kWfo3OLr3drTRUGDWu6XCLCbnvGjtvrpF5tCbrWkiKjbbrOqpStagivickZwOgli+u2TQ8NR/ZzD1+1avVEDOracWzqyVPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fdKwpUmL; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fdKwpUmL"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-39675172593so1877141a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 22:12:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788412347; x=1789017147; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=teLAShLua5VCgT/jcx7hzSu9pxqI7I/30dsuHzraqHI=;
        b=fdKwpUmL/dNbkMxazywB7B5oHX1yMxA2kkHJPS/l02cXe+9j88T/fL6O1PiLKbXWXY
         Ha6f6fSEVzQly1oPu6OrV4NZwLoiKLB8E6TFmne09wdCJHQIgDjpLAVcl09VaPuimpoJ
         YicoyahMoo4BiZTvIF/CL3ZYBVH0ycv42dfXsBBcYyPT+fuGrD3Ntnf1uJ1u3QcQNMGR
         UTC6gsBD4dNC46fSmMURvT+bCsKzkAEkrQ/HXQmqisxYi+U+qxWO4uxDW1TBD5Y0NA9q
         ln4ojTCdw5qnoE54zFg/8aLSwAbkmSnarYpfJViezZrusHxeUBJfF7SXR+Zga7Ynm/af
         rTgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788412347; x=1789017147;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=teLAShLua5VCgT/jcx7hzSu9pxqI7I/30dsuHzraqHI=;
        b=slF/jVU6Ubsd/r+G+53rD0GAm2GofCoCPUovkkUtZA9LnKDBxNGSdA19hOhx3q5sKk
         qBFyWSQMmOXoA+iE+wlnBbeic6A8pcHQr59LZqYwTJvJKGncY85Ps1IsY4naTBcPJYem
         GFetUpGZGQG3ZmcHRDS32jDx4HUe8Vo/7NnTcXlWMoZFtJxm412FYsROArWoCu1TAo3V
         1MnM68qQ5BXJCo1TLyDt3obm4TC+hcS8brjUXc/B2lO7OhFROyQfzndTHkysNL/R2UHk
         DOa6dKfrEfyUa1BOl/ofAquJSvgkdAFiT/nGJKOUMNBDAp6oHWYlEhNjRTWYif3yaioi
         m4Sw==
X-Forwarded-Encrypted: i=1; AKwUvBwquoaip9+ZfMgJvWSBgsRnn+B66YTi+VgwYkL/e8aQ07ZL8rM6hFoRl3/1jr/ioXg2FgSpySu2DK7SU5c=@vger.kernel.org
X-Gm-Message-State: AFuF++mEifYfo8LNAPM8lmJxFxrXb1HJWd3bwQEtzvL+TNgl1pqyg/Np
	1cYfTxTrP0lRMoxKahAuH+OSC8Vy4gFUJ5MvNjQAvR1+pViPQJ3cMb6fRR8gzw==
X-Gm-Gg: AYBFou1TrBfnAED3OFFawZ57iqDSAMi2FmrBCAkTrrVY1xUp54+m5uTlLqhddul7qEj
	dMt5Il6MojTH0LIMvtRkhfoEj5kGg5RoRj6b/B9TCmaVwvPceyMW6RNV7IQs6p33Bl9OOrOv6FG
	WWqWW5aXs368HDVerj79C5AXSID6r1RhdgBEKtfOwMAWceZnL0443gaBUrALYwewYEImfNxj11G
	FuTUkhKOIdCQxkNwaEpnY2B2TgrCBqrt1l6t0fyC4X4qPWJ5bmPoDjTv0GzTkVs6endQmEFeNtG
	OIaEXVX0RhzY5MeV4G6+N+B0JImvvfe5ds5G1aMQzJIvYoEow7oXskn0Qxf7vakqkU33MRs/hvw
	42VuEYJlds7Tows7bWH2o5pCUhyFaFdapwhyciy0N+CkcccNPozIvzhAgdxE6R4Q9jwiIJ0ZwZd
	vpgPCk8+p5RPmvbctABShyDocq050pTEGUZzihPyrUkbvt9rv4cJdqr+aO/PV97fWca2nB1gOCk
	UKQWlNdB3pk6s5NRUNJQvzKCmh9MTntT5wJuTmYVWX/S/p9RdahrHOz0ONvwhcDWwqQqxJGxH0B
	IQRRz/M6Tkuj0po=
X-Received: by 2002:a17:90b:520f:b0:398:9c00:29e9 with SMTP id 98e67ed59e1d1-39aee1b72e5mr16164501a91.17.1788412347415;
        Wed, 02 Sep 2026 22:12:27 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b0875ce14sm3218092a91.13.2026.09.02.22.12.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 22:12:27 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Jiaxin Yu <jiaxin.yu@mediatek.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v4 4/8] ASoC: mediatek: mt8186: Fix APLL enable error handling
Date: Thu,  3 Sep 2026 12:11:46 +0700
Message-ID: <20260903051150.178057-5-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260903051150.178057-1-phucduc.bui@gmail.com>
References: <20260903051150.178057-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Currently, the mt8186_apll*_enable() functions call mux_setting(afe, true)
but do not check its return value to handle failures.

In addition, the cleanup paths of mt8186_apll*_enable() do not call
mux_setting(afe, false) when the enable operation fails, while the
mt8186_apll*_disable() functions do.

Add error handling for apll*_mux_setting() and call mux_setting(afe, false)
in the cleanup paths when mt8186_apll*_enable() fails.

Fixes: 55b423d5623c ("ASoC: mediatek: mt8186: support audio clock control in platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v3:
 - Return directly from apllx_mux_setting() instead of using a goto label

 sound/soc/mediatek/mt8186/mt8186-afe-clk.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/sound/soc/mediatek/mt8186/mt8186-afe-clk.c b/sound/soc/mediatek/mt8186/mt8186-afe-clk.c
index 685dc27c7780..77a0cbc8ee24 100644
--- a/sound/soc/mediatek/mt8186/mt8186-afe-clk.c
+++ b/sound/soc/mediatek/mt8186/mt8186-afe-clk.c
@@ -353,7 +353,9 @@ int mt8186_apll1_enable(struct mtk_base_afe *afe)
 	int ret;
 
 	/* setting for APLL */
-	apll1_mux_setting(afe, true);
+	ret = apll1_mux_setting(afe, true);
+	if (ret)
+		return ret;
 
 	ret = clk_prepare_enable(afe_priv->clk[CLK_APLL22M]);
 	if (ret) {
@@ -378,9 +380,9 @@ int mt8186_apll1_enable(struct mtk_base_afe *afe)
 	return 0;
 
 err_clk_apll1_tuner:
-	clk_disable_unprepare(afe_priv->clk[CLK_APLL1_TUNER]);
+	clk_disable_unprepare(afe_priv->clk[CLK_APLL22M]);
 err_clk_apll22m:
-	clk_disable_unprepare(afe_priv->clk[CLK_APLL22M]);
+	apll1_mux_setting(afe, false);
 
 	return ret;
 }
@@ -406,7 +408,9 @@ int mt8186_apll2_enable(struct mtk_base_afe *afe)
 	int ret;
 
 	/* setting for APLL */
-	apll2_mux_setting(afe, true);
+	ret = apll2_mux_setting(afe, true);
+	if (ret)
+		return ret;
 
 	ret = clk_prepare_enable(afe_priv->clk[CLK_APLL24M]);
 	if (ret) {
@@ -431,9 +435,9 @@ int mt8186_apll2_enable(struct mtk_base_afe *afe)
 	return 0;
 
 err_clk_apll2_tuner:
-	clk_disable_unprepare(afe_priv->clk[CLK_APLL2_TUNER]);
+	clk_disable_unprepare(afe_priv->clk[CLK_APLL24M]);
 err_clk_apll24m:
-	clk_disable_unprepare(afe_priv->clk[CLK_APLL24M]);
+	apll2_mux_setting(afe, false);
 
 	return ret;
 }
-- 
2.43.0

