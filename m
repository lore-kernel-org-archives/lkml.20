Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFC4250B8C9
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 13:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789738789; cv=none; b=fp3BevHDvSkB/RUp/uTIe7ql5//QzgAsM99JOkH1/I8IdTmiwSAKEI/w9JBrP0l/Oc8Dgi7ROneeObrA/jvmPA89OQSbKnd7YGkenypP73LKg4x6yMD9GdXqslge5knbkmXvM9/4vTlZROeFMupS3coxr3xQypyLr+V9hB3ucMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789738789; c=relaxed/simple;
	bh=0YZDgohYU82Y3Z3wgauvg8puXR/i5RfbrYlezzuK8Ts=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y7hvMpTc5lUlRXiu5/Oujsf+IVSOQGtsE8ElN/94nysAHLoKjsG/pua2ZPfQUGrhDH2ksjtABZRKTmo5nkpktIaw+RNAHv/tiZ4+pgvCabOk+FVrYnuWP/mlQVlIcuKcH/IHLJAH3353P7rALXOGYh9Wfn+GuYNjyfKAAitoa8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IUpRSwey; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IUpRSwey"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc1cea50dc3so504841a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 06:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789738787; x=1790343587; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/qDV/Zz9q7433cXeBFk2dk/vooaqEVgx7zKvutK7uX8=;
        b=IUpRSweyv5NqoCkU61+tPUs012QGZ/nZqxnhDktplsrBys/5ukmiKaZsvPJFz7C4yd
         MDVowc7o1z3t9uUYrto2DzWANpyaFX9XWC9O75F4pn1cw1+rVFRnieWMQEv0P97iViP/
         3OrxN1VXLmimZEeVgEGGp51FfIabFMXlsKe4EnEgPuYwEkAZhqU6cZEuVcGnQLfjzhV6
         /62xzeqJZGxXCus/0igOt3zuW4PGcBrA3J1NW+MiSJ8KY2CNrLG+MK4fbfM353pb41Ao
         6ESxpv+6hFELoWPOIaGtxwQ+RuRCTfcqw3uHAUSIs9oNVkk31FrVDMwrdFiRKbojVPRy
         0DoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789738787; x=1790343587;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/qDV/Zz9q7433cXeBFk2dk/vooaqEVgx7zKvutK7uX8=;
        b=ApSUVRUwCoNAayb3Y2+mOK75flnEQxhrZN5C3BHBkTGk3/9pNL/VGuc0/e49WgdOOQ
         evPuNBivvb4MM7EloYXuW6d4z1Vv1Hms8FPvIHeW6HfunHqgmcq5US3Z+8R3RxoOU/0W
         Q7VCFVRf5bzS8yuRcSx0oc7yT6zm2afo3FIm9A49sVrNvcF0t5Z+wKPVpuym2GzPGYVR
         ZxXqy+IR2hho3+Ont9qxaDOI2fIB4lqpBTP7p9Q2akoHS473RxYNigXh14Elhz/SLlV9
         nQlu4bE/pTLgw8CYWf2gnS4GsjmOmdX6HZbJXk4guSigt0OFgL5ofRQyjyXD/mPI8NHW
         NEfw==
X-Forwarded-Encrypted: i=1; AKwUvByKi/JjGJAgY6Zy5z5B8z0GiqIHOS/ExGIay/pT0VtDuUm14koh2Y9ZL1dgT3V12rLIjD/S/c1ey4Ol7YU=@vger.kernel.org
X-Gm-Message-State: AFuF++lY0eD1E9bGsnjpxXfofxguYboKuyMDA5n+TcmsoSQfXpKLpV4/
	0q5cYJekX11Fc/MRYcuyHUbIrd93LBt25zijomfblXAHuuBUasWOgchp
X-Gm-Gg: AYBFou39RO2dA7TJa1NCkT2AelgWiytCzUkzgCS988lM/kWomrmsMPfnrxYEfBBEIXt
	m24ECcokUXiFZ9S8zi261UenTBtoZu+ZoK9RoaZZbCMHmUKpZXMOXdqu7pvSRfW1+SsnfRToFxC
	kafa/CGlo3hCo80cbhd24EvptvPQYupZt1t+uPkUSk9/rShb/aNK/fdV9NlWvTPtQp7TazKBnJQ
	1hfAJ9SzRnmCin3QXga0Zq5MvL/96EOYMavsrF0KxPFdsygXCcRmHNR49fH9FN7ktREWdjqDcxE
	BkaGjRuf6wzGxns/+QG29xsczhuKL0N2t98yxu7ZHbZBf22clHuaiF6kIyWGbKO0KdiLYlFVJ56
	ewEIznCs4sv0gb09qjRFTHfrqmDiNRkAEHzLPegukyhacburLdwIOXIqQeMJRYidGRdLk8GCHGw
	uCbglhce50+oWa0hU4KB5hKQUCagmZFyeeNBW8cV4mWvtImPDzvYgniPR0kk9TDqlHfiTXkhE/z
	9fo01DKYLr16TPWthI+0IoAK87v/PKCrlRZ5EyMi7ptfjxvN6vIAd/BarEKQVYv/gx6L+U2iVxq
	kZvr7jg2/lQwDQ==
X-Received: by 2002:a17:90b:3d8e:b0:39e:2065:5f60 with SMTP id 98e67ed59e1d1-39e54f9d37bmr6277200a91.18.1789738786842;
        Fri, 18 Sep 2026 06:39:46 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e3617443asm13253792a91.9.2026.09.18.06.39.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 06:39:46 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	cassiogabrielcontato@gmail.com,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Jiaxin Yu <jiaxin.yu@mediatek.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 01/15] ASoC: mediatek: mt8192: fix APLL mux error handling
Date: Fri, 18 Sep 2026 20:38:57 +0700
Message-ID: <20260918133912.133799-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260918133912.133799-1-phucduc.bui@gmail.com>
References: <20260918133912.133799-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Propagate errors from clock operations in the enable path and clean up
previously enabled clocks when a later operation fails.

For the disable path, continue disabling all clocks even if a clock
operation fails. Log the error without returning it, so the disable path
can perform as much cleanup as possible.

Fixes: 125ab5d588b0 ("ASoC: mediatek: mt8192: add platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8192/mt8192-afe-clk.c | 54 +++++++++++++---------
 1 file changed, 32 insertions(+), 22 deletions(-)

diff --git a/sound/soc/mediatek/mt8192/mt8192-afe-clk.c b/sound/soc/mediatek/mt8192/mt8192-afe-clk.c
index 416aff726253..bd778e5663b5 100644
--- a/sound/soc/mediatek/mt8192/mt8192-afe-clk.c
+++ b/sound/soc/mediatek/mt8192/mt8192-afe-clk.c
@@ -87,7 +87,7 @@ static int apll1_mux_setting(struct mtk_base_afe *afe, bool enable)
 		if (ret) {
 			dev_err(afe->dev, "%s clk_prepare_enable %s fail %d\n",
 				__func__, aud_clks[CLK_TOP_MUX_AUD_1], ret);
-			goto EXIT;
+			return ret;
 		}
 		ret = clk_set_parent(afe_priv->clk[CLK_TOP_MUX_AUD_1],
 				     afe_priv->clk[CLK_TOP_APLL1_CK]);
@@ -95,7 +95,7 @@ static int apll1_mux_setting(struct mtk_base_afe *afe, bool enable)
 			dev_err(afe->dev, "%s clk_set_parent %s-%s fail %d\n",
 				__func__, aud_clks[CLK_TOP_MUX_AUD_1],
 				aud_clks[CLK_TOP_APLL1_CK], ret);
-			goto EXIT;
+			goto err_disable_mux_aud_1;
 		}
 
 		/* 180.6336 / 4 = 45.1584MHz */
@@ -103,7 +103,7 @@ static int apll1_mux_setting(struct mtk_base_afe *afe, bool enable)
 		if (ret) {
 			dev_err(afe->dev, "%s clk_prepare_enable %s fail %d\n",
 				__func__, aud_clks[CLK_TOP_MUX_AUD_ENG1], ret);
-			goto EXIT;
+			goto err_set_parent_mux_aud_1;
 		}
 		ret = clk_set_parent(afe_priv->clk[CLK_TOP_MUX_AUD_ENG1],
 				     afe_priv->clk[CLK_TOP_APLL1_D4]);
@@ -111,31 +111,36 @@ static int apll1_mux_setting(struct mtk_base_afe *afe, bool enable)
 			dev_err(afe->dev, "%s clk_set_parent %s-%s fail %d\n",
 				__func__, aud_clks[CLK_TOP_MUX_AUD_ENG1],
 				aud_clks[CLK_TOP_APLL1_D4], ret);
-			goto EXIT;
+			goto err_disable_mux_aud_eng1;
 		}
 	} else {
 		ret = clk_set_parent(afe_priv->clk[CLK_TOP_MUX_AUD_ENG1],
 				     afe_priv->clk[CLK_CLK26M]);
-		if (ret) {
+		if (ret)
 			dev_err(afe->dev, "%s clk_set_parent %s-%s fail %d\n",
 				__func__, aud_clks[CLK_TOP_MUX_AUD_ENG1],
 				aud_clks[CLK_CLK26M], ret);
-			goto EXIT;
-		}
 		clk_disable_unprepare(afe_priv->clk[CLK_TOP_MUX_AUD_ENG1]);
 
 		ret = clk_set_parent(afe_priv->clk[CLK_TOP_MUX_AUD_1],
 				     afe_priv->clk[CLK_CLK26M]);
-		if (ret) {
+		if (ret)
 			dev_err(afe->dev, "%s clk_set_parent %s-%s fail %d\n",
 				__func__, aud_clks[CLK_TOP_MUX_AUD_1],
 				aud_clks[CLK_CLK26M], ret);
-			goto EXIT;
-		}
 		clk_disable_unprepare(afe_priv->clk[CLK_TOP_MUX_AUD_1]);
 	}
 
-EXIT:
+	return 0;
+
+err_disable_mux_aud_eng1:
+	clk_disable_unprepare(afe_priv->clk[CLK_TOP_MUX_AUD_ENG1]);
+err_set_parent_mux_aud_1:
+	clk_set_parent(afe_priv->clk[CLK_TOP_MUX_AUD_1],
+		       afe_priv->clk[CLK_CLK26M]);
+err_disable_mux_aud_1:
+	clk_disable_unprepare(afe_priv->clk[CLK_TOP_MUX_AUD_1]);
+
 	return ret;
 }
 
@@ -149,7 +154,7 @@ static int apll2_mux_setting(struct mtk_base_afe *afe, bool enable)
 		if (ret) {
 			dev_err(afe->dev, "%s clk_prepare_enable %s fail %d\n",
 				__func__, aud_clks[CLK_TOP_MUX_AUD_2], ret);
-			goto EXIT;
+			return ret;
 		}
 		ret = clk_set_parent(afe_priv->clk[CLK_TOP_MUX_AUD_2],
 				     afe_priv->clk[CLK_TOP_APLL2_CK]);
@@ -157,7 +162,7 @@ static int apll2_mux_setting(struct mtk_base_afe *afe, bool enable)
 			dev_err(afe->dev, "%s clk_set_parent %s-%s fail %d\n",
 				__func__, aud_clks[CLK_TOP_MUX_AUD_2],
 				aud_clks[CLK_TOP_APLL2_CK], ret);
-			goto EXIT;
+			goto err_disable_mux_aud_2;
 		}
 
 		/* 196.608 / 4 = 49.152MHz */
@@ -165,7 +170,7 @@ static int apll2_mux_setting(struct mtk_base_afe *afe, bool enable)
 		if (ret) {
 			dev_err(afe->dev, "%s clk_prepare_enable %s fail %d\n",
 				__func__, aud_clks[CLK_TOP_MUX_AUD_ENG2], ret);
-			goto EXIT;
+			goto err_set_parent_mux_aud_2;
 		}
 		ret = clk_set_parent(afe_priv->clk[CLK_TOP_MUX_AUD_ENG2],
 				     afe_priv->clk[CLK_TOP_APLL2_D4]);
@@ -173,31 +178,36 @@ static int apll2_mux_setting(struct mtk_base_afe *afe, bool enable)
 			dev_err(afe->dev, "%s clk_set_parent %s-%s fail %d\n",
 				__func__, aud_clks[CLK_TOP_MUX_AUD_ENG2],
 				aud_clks[CLK_TOP_APLL2_D4], ret);
-			goto EXIT;
+			goto err_disable_mux_aud_eng2;
 		}
 	} else {
 		ret = clk_set_parent(afe_priv->clk[CLK_TOP_MUX_AUD_ENG2],
 				     afe_priv->clk[CLK_CLK26M]);
-		if (ret) {
+		if (ret)
 			dev_err(afe->dev, "%s clk_set_parent %s-%s fail %d\n",
 				__func__, aud_clks[CLK_TOP_MUX_AUD_ENG2],
 				aud_clks[CLK_CLK26M], ret);
-			goto EXIT;
-		}
 		clk_disable_unprepare(afe_priv->clk[CLK_TOP_MUX_AUD_ENG2]);
 
 		ret = clk_set_parent(afe_priv->clk[CLK_TOP_MUX_AUD_2],
 				     afe_priv->clk[CLK_CLK26M]);
-		if (ret) {
+		if (ret)
 			dev_err(afe->dev, "%s clk_set_parent %s-%s fail %d\n",
 				__func__, aud_clks[CLK_TOP_MUX_AUD_2],
 				aud_clks[CLK_CLK26M], ret);
-			goto EXIT;
-		}
 		clk_disable_unprepare(afe_priv->clk[CLK_TOP_MUX_AUD_2]);
 	}
 
-EXIT:
+	return 0;
+
+err_disable_mux_aud_eng2:
+	clk_disable_unprepare(afe_priv->clk[CLK_TOP_MUX_AUD_ENG2]);
+err_set_parent_mux_aud_2:
+	clk_set_parent(afe_priv->clk[CLK_TOP_MUX_AUD_2],
+		       afe_priv->clk[CLK_CLK26M]);
+err_disable_mux_aud_2:
+	clk_disable_unprepare(afe_priv->clk[CLK_TOP_MUX_AUD_2]);
+
 	return ret;
 }
 
-- 
2.43.0

