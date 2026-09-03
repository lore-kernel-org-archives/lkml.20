Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD30333939D
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 04:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788411173; cv=none; b=RFSJZhFEbPwdJXI2yuNvgE8+wKrpRxZr4H61gG0tux3O8x/cEOskW1XGe6Yrkf2m15gi+md8a0QoL5mzjiTSRBpL860G4kMb2WmS7pkMGBkOVC+JON7whmTtvxeXLIHiD00PlR6lrCkriUSh2vVCoQFJ1qsLcH9K0/BWAXL+RPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788411173; c=relaxed/simple;
	bh=Q7QQT7/BVhDq1O498rAEP2puFeqnHzBBniDPqc+j0VM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iWZtKPdrIGZjlcTSUv15QfzHqviFPZZ62J2H8oVW2DjC0ystCa4VCGKFI2RGL+Ca4agEpJJu+bdwdhXNvWPChac/TcLw7H84Pc6Mob+LXVwvYQbDBmeLXk5743vEnHZqw2Sie2C9IuNY1oKUKWtq5NR+iqQs8IgHqpbUfVXEcwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fpszpUry; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fpszpUry"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-39682983a0fso2494811a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 21:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788411170; x=1789015970; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aHaGtDWIabgwE9bMPCVResetCLU3h+f9hWvuf0/laf8=;
        b=fpszpUrym7NqzDbQ/RgsCEPnsy2l1rnSVO71NqZpKIXz08fx+r8iX3COikHZxN3M+c
         PTm9tSzrNhaemk9FDi6Lrdx9PJc9NStZ+odBlR7zu92gqrLYR4cmWRx8J3/clIv+Sgce
         2LqGgAHLciSGCUTezaCzkelSZUOgTzIR5BGYZFyxOFUsHWDAGqwEwphSEbfkkfwwJyIv
         KdytoqDkkqJCb41vLdeDwNdSJSBaxVc0VFTYyJtcSC1Vu/OuCsBP7y8ZyAKW5EJ8G2K+
         rA8w219pNe1k4i6GJ6eiDnHuKvFEo8YBH5RCXwRblAviIahCKC98GM6AYNhAkuJUb8+k
         8luQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788411170; x=1789015970;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aHaGtDWIabgwE9bMPCVResetCLU3h+f9hWvuf0/laf8=;
        b=VpmaRaoFCsOlzIPQZdZptCpNj8/lqJUVPjFotpc4LKdViMfaQpfVTZad8tZug6UwWq
         7dKxroAJ4whkDvfTgzC9QuxoUSVg0ZFUSBv1nT9raokDZl5la7s7BP7kWjikC95VcOkS
         i3bTm1XUJ2a0Xsvkgb9ll2ec9XJmf7G8l7klf6OZWzk2grENkJnNPKzcH0bupFuY78nZ
         /vIDL1/MS+0AMfTIm3ENhInRePzvO8yTvloJELXO6n94fIoebR2yHh6U8LJtjd3tfX+b
         +gPsMsVGttty1udTXc0EmYpH2DYH0vX8iOOc5muml/VConXrmqaDPjWrd0zGCb+nQ9ic
         95YA==
X-Forwarded-Encrypted: i=1; AKwUvBz+6Xr8drumKQr546tfx2B9z2NnAiyTHfS8UKNvKwS++lDQMTWKzKGijaowYMd9S+/iqoJnUmUNeA1W+ME=@vger.kernel.org
X-Gm-Message-State: AFuF++l88Noa/XDf1sM0M9Yb10TC5v7bPoJNl/g/3d/jPRuMfR4iPj9q
	L9RHEqhWpjK14sQdff2LMzd5nUYzen6SVN/A/r7igXhp0PBr8HXLElaV
X-Gm-Gg: AYBFou1gCZX9X5sXOAfHgCR4XP4HGk2T5pB2yIiHIBDCSxDXaJ/g61ElGLTpS8XVHZT
	vPtxmW/1vKuJ2ydAccm+SFe3d1IwKzI4v4WA3IHrKdZnjTwV1o0CJumcdmrFjoMhAE72bI4NKHw
	ee44LF7ue+E/s269KVqq5wSvqnbGvfxaVqdwq0cWb+8ohMB8j8ygUPRO0qsDVKnkLLyXsu5gaco
	7Fl87z6RxSqeyAB9fg2PT1ShR9kiLemnXwmcxi4yBUYuKUN3E5l0pAVJujsGOXgA7mCY14dCOi4
	5nB/cSjQFEPdNximb2rxPoSQ1Ow5FzXHqtbzNBswsvnvZWr6F4JKYvJ0pFZRbXDNeMFOba+u7/k
	MuipVgoNKhojc8JztgKEvBlbLUakY4EHvoA8XxUvKZu8HDQS0vx/Q65g1hXLQqjfcBv7Lv3XEsG
	mbehS45XS2CTj6B6UWvN4pVbZDEoTQDPB4H3UYz+Cj1pInQEXss6COlgzudv/ENnskWQPa4GTGe
	Xgv6zo2A23Oo2bgpghBI3D2xdiIbIPgceTODmIpRtkURRIOzahBN3ooK280fF9T+uLMpOERyzMF
	UR+O
X-Received: by 2002:a17:90b:1811:b0:398:c724:1bb1 with SMTP id 98e67ed59e1d1-39aedee9313mr14120611a91.8.1788411169700;
        Wed, 02 Sep 2026 21:52:49 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08d0d7e8sm2747538a91.16.2026.09.02.21.52.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 21:52:49 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Shunli Wang <shunli.wang@mediatek.com>,
	cassiogabrielcontato@gmail.com,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v4 1/5] ASoC: mediatek: mt8183: Fix wrong clock cleanup on clk_set_parent() failure
Date: Thu,  3 Sep 2026 11:51:59 +0700
Message-ID: <20260903045203.175337-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260903045203.175337-1-phucduc.bui@gmail.com>
References: <20260903045203.175337-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

In mt8183_afe_enable_clock(), when clk_set_parent() fails, the current
error path incorrectly cleans up the previously enabled clock instead of
the clock used by clk_set_parent().

Fix the error path to clean up the correct clock when clk_set_parent()
fails.

Fixes: a94aec035a12 ("ASoC: mediatek: mt8183: add platform driver")
Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v3:
 - Add a Reviewed-by tag.

 sound/soc/mediatek/mt8183/mt8183-afe-clk.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/mediatek/mt8183/mt8183-afe-clk.c b/sound/soc/mediatek/mt8183/mt8183-afe-clk.c
index cc4f8f4d3dab..6ab0734ad136 100644
--- a/sound/soc/mediatek/mt8183/mt8183-afe-clk.c
+++ b/sound/soc/mediatek/mt8183/mt8183-afe-clk.c
@@ -137,7 +137,7 @@ int mt8183_afe_enable_clock(struct mtk_base_afe *afe)
 		dev_err(afe->dev, "%s(), clk_set_parent %s-%s fail %d\n",
 			__func__, aud_clks[CLK_MUX_AUDIO],
 			aud_clks[CLK_CLK26M], ret);
-		goto CLK_MUX_AUDIO_ERR;
+		goto CLK_MUX_AUDIO_INTBUS_ERR;
 	}
 
 	ret = clk_prepare_enable(afe_priv->clk[CLK_MUX_AUDIOINTBUS]);
@@ -153,7 +153,7 @@ int mt8183_afe_enable_clock(struct mtk_base_afe *afe)
 		dev_err(afe->dev, "%s(), clk_set_parent %s-%s fail %d\n",
 			__func__, aud_clks[CLK_MUX_AUDIOINTBUS],
 			aud_clks[CLK_TOP_SYSPLL_D2_D4], ret);
-		goto CLK_MUX_AUDIO_INTBUS_ERR;
+		goto CLK_AFE_ERR;
 	}
 
 	ret = clk_prepare_enable(afe_priv->clk[CLK_AFE]);
-- 
2.43.0

