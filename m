Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4DA548820A
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 12:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788782640; cv=none; b=fhr55htLPeDIp3gr+vQ0j10+SR3bEgT+o9XVH5+ppb3mFcw3E9FrcUfaZwc9G87Ug/eMUJmKYg+FEKjwyRiUVmOZTWeHs/iwmEmjEHCaouyB4lixzV/0nEAvcGMvm0JGgrz7sRjQJBiq/5W9GiE/BqJzUmcV0u4Im8fWgLsf8Yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788782640; c=relaxed/simple;
	bh=u6hxKWuOWYjJlvb1xtyZ0omGkq5FhEfL70A9B9beb0A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SOPLVlZDPG3WiZdG/jzDjRZp5QC+QP4b4VdTF+Rog4FPKF01gUlTEUgPKPq3qvZQOIQ7RnwVTxtCv81nNN2DKs5izx5iysjiQVz+bHmi8YjmvVzEzbE7aT4FqLpeDfby1LvevdvcWEgtDfywBSJgiNL6n3Cv9DHN0H+T96UfPfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CfnHXTIf; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CfnHXTIf"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2d5cad1a6baso29686295ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 05:03:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788782638; x=1789387438; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x9UdK2e9HQb43MTIsHuNy+QqIiXIInrTnSwN7k6DDQs=;
        b=CfnHXTIfFS1LyLTQg9XiwhWzoLGg+AasWcX5BzbxcRIWzZhsCkTsfp+Z+YSnh9FY7o
         yGwsUMLS18FbyMYL0e/fGBbwuMevyhcWPyk2kFWkMRHE1oMIPTxY+JVr27T1az0LZJDa
         4RylImEyWS6wdk3Rad0Qkx1emYaQDFa1Ty0UB7rvai4vN5KdaE/0H9yIi43Bf8J+g8/O
         wp1nMQmBj7xt3qM2ON9uW809wEHIOBCiTVx24xz8JiUDMI8xyPR5ASCh03mxvNP8fc+G
         bU4M+RUnibfa7AMqJmBywnauPVu+lG1irQJYimG16XF/coP0axGi2evzf6ue+WEpxB6Q
         dRAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788782638; x=1789387438;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=x9UdK2e9HQb43MTIsHuNy+QqIiXIInrTnSwN7k6DDQs=;
        b=Vc+X/XjSwhAM9XtnZmbdqOQ7qVzbJnKsjV3aM+qtkfvwVeLwc2610OEQG6d0FuTVuV
         tZFdYti9PmVcrhC9S9fl2UhNdWKFgy2jEEVOLa34KMPSRlJC3P085e/4u1rb0M3MjvdP
         QD9ymjYJpeUSgJ5WZksh04IlK0p3Y0C2JYL/7cDWIrIGpuA7C9xvivqAFGzs8KPlBLps
         XzADChO8Io9nCpevcTuk9ZPpI7GaiMnvJ/vICa6jWaNZZFb0CYQIo6ZVn5ldih05SzoH
         lykqjLXKNLSlSgMkWXrKkdK0Bw35XzyPcVmDa1ApSrcRaM89nj3KwVggyNZZ98OnYq6t
         kUOw==
X-Forwarded-Encrypted: i=1; AKwUvByjRBjUZcGQx+Ii5bhOOiLuqV9eO6GUShYjzHvHNppTkjuovAFw0qF4t2QnWwYZn1fvA2pFlh3nIJEEoC8=@vger.kernel.org
X-Gm-Message-State: AFuF++n16nsaD2zPYGEFAr7FAvCj1CkZbWXhY0EczHh51jOBcFBHWt4E
	xVKL6kdglraZTZxVemyTKR4YPM9JQHvZiHM3wWxy/go+e2DFLipkTrxZ
X-Gm-Gg: AYBFou28gHZWfxvgG+igajJ8lpOm0w4FX2SU/B4A8YqSJqbOdIMM3yL9Hvy+buxsNw8
	N2zsWCk2zvvTnrNrMI176KLeE5h3IuxQtxohNnVy2aDZnfXJ6copNyTj5LbXdibo1dq3FokOTLP
	N3uHcQEQXIZbvGSV12bckGt22JL68ebq46QRLX5R3UcPvri6fmzE4dDUX+W9LXRleOO4cKjGSwm
	G8+Mb8CkfevWOIMyqu88wylmx1S91ArrM3QUgBD9llFXfZ9er+4Bl2fwSRg0B2SuaOclSbL3/tB
	WudhJzeRzQL8O6KqSGD0ScD6fb2SDajV9ABuuLlSoee8jga8uYJS1nFMteua9MZltZxr5NoV0Zj
	eB3kdC0Fc+QRQlhu6YJBH+9L08f/uIFPf6zPbn5hn+o+NGMvd8yUpTf/yNHz1/eYkRLx4qV5SIX
	DUHSnB71VrFmEP3Fm0JEfWoHH4xWqUSycICzg/V2aFz86wOf6MaV3D2YyH98kEQyQgZa41s/QzP
	nq8zW+pTxPSQvlXpAZ+IvbA1pV92PfPuRaO1XeeRJu1E/1/TFapD0zMqbJ3XIovgWL9cqxXtUPW
	MBGC
X-Received: by 2002:a17:903:46cd:b0:2ca:1479:d9dc with SMTP id d9443c01a7336-2db125c332fmr382050405ad.12.1788782638093;
        Mon, 07 Sep 2026 05:03:58 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db14ae85eesm43064815ad.82.2026.09.07.05.03.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 05:03:57 -0700 (PDT)
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
Subject: [PATCH 4/7] ASoC: mediatek: mt8188: mt8188-afe-clk: Handle clock enable errors
Date: Mon,  7 Sep 2026 19:03:07 +0700
Message-ID: <20260907120310.135693-5-phucduc.bui@gmail.com>
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

Clock enable errors are currently ignored by several AFE clock
control functions.

Check the return values and roll back previously enabled clocks when
a subsequent clock enable fails.

Fixes: f6b026479b13 ("ASoC: mediatek: mt8188: support audio clock control")
Fixes: 9be0213a6858 ("ASoC: mediatek: mt8188: refine APLL control")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8188/mt8188-afe-clk.c | 69 ++++++++++++++++++----
 1 file changed, 58 insertions(+), 11 deletions(-)

diff --git a/sound/soc/mediatek/mt8188/mt8188-afe-clk.c b/sound/soc/mediatek/mt8188/mt8188-afe-clk.c
index 77511f6fba41..8b6dca22c8ed 100644
--- a/sound/soc/mediatek/mt8188/mt8188-afe-clk.c
+++ b/sound/soc/mediatek/mt8188/mt8188-afe-clk.c
@@ -579,22 +579,47 @@ static int mt8188_afe_disable_top_cg(struct mtk_base_afe *afe, unsigned int cg_t
 int mt8188_afe_enable_reg_rw_clk(struct mtk_base_afe *afe)
 {
 	struct mt8188_afe_private *afe_priv = afe->platform_priv;
-
+	int ret;
 	/* bus clock for AFE external access, like DRAM */
-	mt8188_afe_enable_clk(afe, afe_priv->clk[MT8188_CLK_TOP_AUDIO_LOCAL_BUS_SEL]);
+	ret = mt8188_afe_enable_clk(afe, afe_priv->clk[MT8188_CLK_TOP_AUDIO_LOCAL_BUS_SEL]);
+	if (ret)
+		goto err_local_bus;
 
 	/* bus clock for AFE internal access, like AFE SRAM */
-	mt8188_afe_enable_clk(afe, afe_priv->clk[MT8188_CLK_TOP_AUD_INTBUS_SEL]);
+	ret = mt8188_afe_enable_clk(afe, afe_priv->clk[MT8188_CLK_TOP_AUD_INTBUS_SEL]);
+	if (ret)
+		goto err_intbus;
 
 	/* audio 26m clock source */
-	mt8188_afe_enable_clk(afe, afe_priv->clk[MT8188_CLK_ADSP_AUDIO_26M]);
+	ret = mt8188_afe_enable_clk(afe, afe_priv->clk[MT8188_CLK_ADSP_AUDIO_26M]);
+	if (ret)
+		goto err_26m;
 
 	/* AFE hw clock */
-	mt8188_afe_enable_clk(afe, afe_priv->clk[MT8188_CLK_AUD_AFE]);
-	mt8188_afe_enable_clk(afe, afe_priv->clk[MT8188_CLK_AUD_A1SYS_HP]);
-	mt8188_afe_enable_clk(afe, afe_priv->clk[MT8188_CLK_AUD_A1SYS]);
+	ret = mt8188_afe_enable_clk(afe, afe_priv->clk[MT8188_CLK_AUD_AFE]);
+	if (ret)
+		goto err_afe;
+	ret = mt8188_afe_enable_clk(afe, afe_priv->clk[MT8188_CLK_AUD_A1SYS_HP]);
+	if (ret)
+		goto err_a1sys_hp;
+	ret = mt8188_afe_enable_clk(afe, afe_priv->clk[MT8188_CLK_AUD_A1SYS]);
+	if (ret)
+		goto err_a1sys;
 
 	return 0;
+
+err_a1sys:
+	mt8188_afe_disable_clk(afe, afe_priv->clk[MT8188_CLK_AUD_A1SYS_HP]);
+err_a1sys_hp:
+	mt8188_afe_disable_clk(afe, afe_priv->clk[MT8188_CLK_AUD_AFE]);
+err_afe:
+	mt8188_afe_disable_clk(afe, afe_priv->clk[MT8188_CLK_ADSP_AUDIO_26M]);
+err_26m:
+	mt8188_afe_disable_clk(afe, afe_priv->clk[MT8188_CLK_TOP_AUD_INTBUS_SEL]);
+err_intbus:
+	mt8188_afe_disable_clk(afe, afe_priv->clk[MT8188_CLK_TOP_AUDIO_LOCAL_BUS_SEL]);
+err_local_bus:
+	return ret;
 }
 
 int mt8188_afe_disable_reg_rw_clk(struct mtk_base_afe *afe)
@@ -630,7 +655,13 @@ static int mt8188_afe_enable_a1sys(struct mtk_base_afe *afe)
 	if (ret)
 		return ret;
 
-	return mt8188_afe_enable_top_cg(afe, MT8188_TOP_CG_A1SYS_TIMING);
+	ret = mt8188_afe_enable_top_cg(afe, MT8188_TOP_CG_A1SYS_TIMING);
+	if (ret) {
+		mt8188_afe_disable_clk(afe, afe_priv->clk[MT8188_CLK_AUD_A1SYS]);
+		return ret;
+	}
+
+	return 0;
 }
 
 static int mt8188_afe_disable_a1sys(struct mtk_base_afe *afe)
@@ -651,7 +682,13 @@ static int mt8188_afe_enable_a2sys(struct mtk_base_afe *afe)
 	if (ret)
 		return ret;
 
-	return mt8188_afe_enable_top_cg(afe, MT8188_TOP_CG_A2SYS_TIMING);
+	ret = mt8188_afe_enable_top_cg(afe, MT8188_TOP_CG_A2SYS_TIMING);
+	if (ret) {
+		mt8188_afe_disable_clk(afe, afe_priv->clk[MT8188_CLK_AUD_A2SYS]);
+		return ret;
+	}
+
+	return 0;
 }
 
 static int mt8188_afe_disable_a2sys(struct mtk_base_afe *afe)
@@ -739,8 +776,18 @@ int mt8188_apll2_disable(struct mtk_base_afe *afe)
 
 int mt8188_afe_enable_main_clock(struct mtk_base_afe *afe)
 {
-	mt8188_afe_enable_top_cg(afe, MT8188_TOP_CG_26M_TIMING);
-	mt8188_afe_enable_afe_on(afe);
+	int ret;
+
+	ret = mt8188_afe_enable_top_cg(afe, MT8188_TOP_CG_26M_TIMING);
+	if (ret)
+		return ret;
+
+	ret = mt8188_afe_enable_afe_on(afe);
+	if (ret) {
+		mt8188_afe_disable_top_cg(afe, MT8188_TOP_CG_26M_TIMING);
+		return ret;
+	}
+
 	return 0;
 }
 
-- 
2.43.0

