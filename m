Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A69B045D188
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 12:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788782631; cv=none; b=apmX2gilJFjKD9G22utk6CXfFiIchpjrmWue1Bj1qTEc4SU3JFC1iJ62fmhUHva/iHZlic2gfbCmOFGXX5iOe/h77fZzcIGPc7uYwyIw/MoGUkqin8pulDWIF8/ekuIy+/J1ykqWgKHu7jFlyc6DvDR7TJjS/fjrxihZHz0w2CI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788782631; c=relaxed/simple;
	bh=KhkOmwnapS3cd429q+vblKGN5LA3Ldi5GUgHfE+aNuQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ACI8f/vFTU1IMpi+rofxuoOXoAYHsecpF8S1GI1vujx0YgU0aibp4T+tsuE6WnXZeicQijY2yxwhjFAWGq1+K0KjC1IrO4JlOzRAPhZOlMjUubun94TxK1bGAJIiNPS3cYxTAHk9Cazm7PHI4KhJmAi++WsFso/sXIfAB5WNlNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e24fuVsA; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e24fuVsA"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2cc891373e0so36471705ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 05:03:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788782629; x=1789387429; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ea6lVpnhWbYQ3wI5UpSM25XcXKci0dt7/GlZ6PuirvE=;
        b=e24fuVsAqMfoPUuO44W+3zKWW35+o379AfNSREg8qlsOweEnUGK0T2PpKZA0PCS+G3
         k4vzbi0wjQD6mLEUMmT/ps83bvEB3Qo38qaUxZLR39ZtFqhvdRNhIORtkdZkTjWOY/EX
         JBQdrvI/TDDqE6geGBpLdo1euIr3PcCfKiAEgAUX1lQRinPSvqAXWZys9Sx0W04L4dA8
         y4Wm9b5k5WXJQWhVFkTIbLmFreeNDARx1IBx8LY9gCTMDsVcnQed8ovc39Jd+xq2VOR7
         /dl0PRDpOKmFIEozKQrPxXQFrGPpbku4iYvhZE/jUdErNn7TMHNCd4BF1eAaI1KikPt6
         hM0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788782629; x=1789387429;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ea6lVpnhWbYQ3wI5UpSM25XcXKci0dt7/GlZ6PuirvE=;
        b=IqmBjaAGdo06KJ567xan8cX6GeIvplyXHERuM28x31A5CsR449plNDKW8CtsBfmM30
         bu67jGhpcCIEKVw54GvBNmf7FukL7iB83yF02zNJMYVGpTsjFYYex4l5V9jimEcgg79h
         F1uYVltTfqyS2JAZ3duChHg+NpjiMLfQH/iRMA3IZ9ulfqoaSunYKH3QY6sIQZOjoUfV
         huZ+BmCyT0zkkHHiPLd3l3QW5MMPU8V549h9AO0polXVImzUn8CVWSffQX8iOV3+iUn+
         oXHvFaiU5zFVyeygIvp9R6uxKX2XAP9pBYijCJN4RR9KYx6m12Dqwwo329kbjkpbXHok
         lDFg==
X-Forwarded-Encrypted: i=1; AKwUvBytCsOlds93uyr9G4DOwn6tb0vkyGs1gx5J9+c8a10NKVal47qgN1WajJUu+W3va08gV0NxAR0ZIine7jA=@vger.kernel.org
X-Gm-Message-State: AFuF++l6XY4MXvORnKBl2aX8R1XF367XqENd3qmJVH+hXuuJ89fiZX6r
	x20GnCYHnKxAlwQ8tTNbXTd8uvoS4Fv5Wbm+lIINqgFpOA85hbYVX1qR
X-Gm-Gg: AYBFou3fLBYGJRn9kKLf7BthvyINtIjKLZT1m/bbX1kUsrao5kWAix1um/+A5MIfV9P
	xJfyDthdaLgoIARgbvCmgdw8Z8ytBbikH+Mxm59USn58xucmcYIsYEoww7v21gdGMULJYRAWl1z
	+xvEMOnb6nPIHOu7lZTFY+Kr6LwJRp2YPOyFtyl/6WMClHeyNzJU1GQYf4MC9i7wpXTfpXbegTJ
	bzimg0NrnLtvXL7CDdWtw/wCCPXX7WmEkhhhdp350FuJKVNVxq4t6c7cQiAMST/wTMlvFhXEW6t
	QGWkbg3JzBPIETus0OhrnNMqrLTlkhyd0s77iD3Yv/CjGuW0KGr/JcO6X4kVB+g5mDsmtseLbBt
	N5pnbgt1VKxQrxBk+d4dKfVqctvCNwJ3zL6BaU/pV0Fi1BIp+BilPqe/GAH4gnP/FiXmN6mWJr9
	iz8Uq1rBG5fxNphV2pb3LnnaB1nLGe3UixI7O7bQDp35zhY/DxsiguIHIceOyc+bGO6X8/6WauQ
	SsbMvaJ0vGqXnwuDa0pLcJ0Ad4UQ8CLv4zxUqyapCi4OABbGFMhrpd8ChAx9Hue9qoNS7378YKn
	w5Nvy0SYrVrxAb0=
X-Received: by 2002:a17:903:40c9:b0:2d6:f6ba:263d with SMTP id d9443c01a7336-2db124b451cmr310785685ad.7.1788782628815;
        Mon, 07 Sep 2026 05:03:48 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db14ae85eesm43064815ad.82.2026.09.07.05.03.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 05:03:48 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Kees Cook <kees@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Trevor Wu <trevor.wu@mediatek.com>,
	Douglas Anderson <dianders@chromium.org>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 2/7] ASoC: mediatek: mt8188: mt8188-afe-clk: Handle tuner clock enable errors
Date: Mon,  7 Sep 2026 19:03:05 +0700
Message-ID: <20260907120310.135693-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260907120310.135693-1-phucduc.bui@gmail.com>
References: <20260907120310.135693-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Clock enable errors are currently ignored when enabling the APLL
and tuner clocks.
Check the return values and roll back the APLL clock if the tuner
clock fails to enable.

Fixes: f6b026479b13 ("ASoC: mediatek: mt8188: support audio clock control")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8188/mt8188-afe-clk.c | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/sound/soc/mediatek/mt8188/mt8188-afe-clk.c b/sound/soc/mediatek/mt8188/mt8188-afe-clk.c
index 42878c8a6529..ecba13eda440 100644
--- a/sound/soc/mediatek/mt8188/mt8188-afe-clk.c
+++ b/sound/soc/mediatek/mt8188/mt8188-afe-clk.c
@@ -260,15 +260,28 @@ static int mt8188_afe_enable_tuner_clk(struct mtk_base_afe *afe,
 				       unsigned int id)
 {
 	struct mt8188_afe_private *afe_priv = afe->platform_priv;
+	int ret;
 
 	switch (id) {
 	case MT8188_AUD_PLL1:
-		mt8188_afe_enable_clk(afe, afe_priv->clk[MT8188_CLK_AUD_APLL]);
-		mt8188_afe_enable_clk(afe, afe_priv->clk[MT8188_CLK_AUD_APLL1_TUNER]);
+		ret = mt8188_afe_enable_clk(afe, afe_priv->clk[MT8188_CLK_AUD_APLL]);
+		if (ret)
+			return ret;
+		ret = mt8188_afe_enable_clk(afe, afe_priv->clk[MT8188_CLK_AUD_APLL1_TUNER]);
+		if (ret) {
+			mt8188_afe_disable_clk(afe, afe_priv->clk[MT8188_CLK_AUD_APLL]);
+			return ret;
+		}
 		break;
 	case MT8188_AUD_PLL2:
-		mt8188_afe_enable_clk(afe, afe_priv->clk[MT8188_CLK_AUD_APLL2]);
-		mt8188_afe_enable_clk(afe, afe_priv->clk[MT8188_CLK_AUD_APLL2_TUNER]);
+		ret = mt8188_afe_enable_clk(afe, afe_priv->clk[MT8188_CLK_AUD_APLL2]);
+		if (ret)
+			return ret;
+		ret = mt8188_afe_enable_clk(afe, afe_priv->clk[MT8188_CLK_AUD_APLL2_TUNER]);
+		if (ret) {
+			mt8188_afe_disable_clk(afe, afe_priv->clk[MT8188_CLK_AUD_APLL2]);
+			return ret;
+		}
 		break;
 	default:
 		return -EINVAL;
-- 
2.43.0

