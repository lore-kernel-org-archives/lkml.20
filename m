Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B218309EF2
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 04:52:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788411176; cv=none; b=UrFykx/hAFTFJt30G26000oY6FLz7YL5eoowMI+vYO7JvfvbOz8As+Cy8L5XFN0MtPK3Ygso0NtBW5ZEsKAyPIGzNc4WtuLOguqrhvrhjw22mrhYcMN/nBVUV84HTOIOMA/CX2LFr9edfbUGUyT8oLCS+AU7sXFCnbGEe6X0tPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788411176; c=relaxed/simple;
	bh=HMjTaFNf++XBhM+sgnYCzvPtzS89AMLTDJUPnErkVb0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GgyVIafxDy2gjO4hYZkqOOr3QJ3uOMIiC6sZ0l/fO/z2ZcyjWil3DJi5NnyTwOr5lkrFQUZ/rcb07JthAPlwgGq62L3Xtehww3619PtPxV3ie3lm9wK/D1+ZFpFV9hG8211BUSDZli/U0PC6epnLtRdaJrWSeI7MaUf9zFTUako=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VSKY/KPZ; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VSKY/KPZ"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3966791a6eeso2320538a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 21:52:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788411174; x=1789015974; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/QLhY24jUWuW0UFPT8wZxIclDsrKF9CvBHKSfEU+hkw=;
        b=VSKY/KPZluXLISft5GI5rtLi0X5DuGl+guzpDZh7I2Cljk75LTqpS5mp9AuGTSnFv4
         iUwaXn3K4uf9zjWln1cqwBcCbUAzhryejWl+seFc0qLjw1uQwNfonnj+L6q7sIFl6+KO
         j5in9+XpcmznrUE+eR9h6gdX6xJ8hkbjAYG6thTexalQAsDfffRnZUaDEHzN9+mKva5k
         MO6yIKsvcCr+LO59z/weNrjZr5v8kL6QNm0WkOLtAg8Az04+OkVwCkcv0if73POWRe1L
         wYvgssHLJvropg2wsn5MQdGOh4ZEX47o6VKXnSf4eGfjKtnguwPTng+OATWPsfBhf+rw
         PocA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788411174; x=1789015974;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/QLhY24jUWuW0UFPT8wZxIclDsrKF9CvBHKSfEU+hkw=;
        b=Uyrymb9+GsQvtPeoI0MxV9krMCZk27S5GHG0lQJkDfNIy+n4JnS0sUfMYDSDLeFd+L
         jUeCJ755WoQy8hZfGaWXuErw310dxEc0WOTbh17ZXo0WfR4ilp4eGkoWNSyTp4eIJxQM
         bD4JtyBjTpo/HrSBCwztefjpR8eebWkc1Orvh7rK3zTwFMFd2g8DBth2Zx2vMnof2pu4
         DZMwj+8EfDYDfajzCII05Mc6zTjzftDlz4GR0QroLxg63njPWQYNpZiQXTjhWxIamhpZ
         iE9q7Dmyz8fVwx+OiuTXjXPy/V+3Z969kFFNP2PviBzpXdiazTrBAURIzosdn7iB5p04
         Rhjg==
X-Forwarded-Encrypted: i=1; AKwUvBzJix1WjZx+R6kIoDXGtc0sZIL4JDIyNLOKeMo78zRhza4HuOnivJJNKNey4cMAQjE3mC9WIAYkmssY7TI=@vger.kernel.org
X-Gm-Message-State: AFuF++npDEN0UEugVceM7JzBgEAHqfZ5nU1A1WLFXxtCSvQhYVRyhE0E
	ZTL0vrjAYIMMvlSQXoOYI92EyiW9jWpITnG9Zh+pJazd2gQGo7ZTieNz
X-Gm-Gg: AYBFou19kPE3+IVAemWoSUSbuNfCinSc+I84rSlxs7IQskzxabHoid5iMQ8sxOH3YJj
	5wvazGcl6fFLDxyNYQKxMhfNt46jNmNeMf55EdH4YtN9Cz3RTZsu4Hqpj5bHqWi94lv9AAie/Vr
	N9/Kh/Tp/VzM6jXgCF0XGTKUheWuaTyrfa87Wnxl6Hri67uFpyyjRf5KTeI1n98xDy6wDHFg2j9
	e5tAAM1bPcH5UUeQfDWOcGmo7gCVrETM+YSj3/OrEeZHScKObOCabzZm08axqOQ8BzTuwiARE0y
	GGc4FEo3Qil0o8dthptgxlUDxUpXt13Go0U9S58xOUyfca4JUZUhsigmIemB1NCdwIW1N3kZ3Yp
	eIobsv4rgaQqnpaRfe4Yi4M59RzVY5+3pZvdo+M77u3ru9yHBKHSiyqK8gzW6iNzaEiEC6EZ0GQ
	ONfpAfCUUQVsQs4Lp9ED/9JqryL9mhdkb1BBXxGInhFVkI/fJIeX5OYgnf0T3ofCr4JRacLAQR2
	+/vkHtGCpU2YmqdALJRFot0fMQPV/BkIWCGlWVMPThrVqGYdSw/tcJHUiJhk2eiIyPOa9QDdZZt
	/ByT
X-Received: by 2002:a17:90b:3ec5:b0:37f:ed7e:7e42 with SMTP id 98e67ed59e1d1-39aee172d61mr14055157a91.14.1788411174299;
        Wed, 02 Sep 2026 21:52:54 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08d0d7e8sm2747538a91.16.2026.09.02.21.52.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 21:52:54 -0700 (PDT)
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
Subject: [PATCH v4 2/5] ASoC: mediatek: mt8183: Fix clock handling in mux disable path
Date: Thu,  3 Sep 2026 11:52:00 +0700
Message-ID: <20260903045203.175337-3-phucduc.bui@gmail.com>
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

In the disable path of the appl*_mux_setting() functions,
clk_disable_unprepare() is called after clk_set_parent().
If clk_set_parent() fails, clk_disable_unprepare() is skipped,
potentially leaving one of the clocks enabled.

Remove the goto exit paths so that all teardown steps are attempted
and any errors are only reported.

Fixes: a94aec035a12 ("ASoC: mediatek: mt8183: add platform driver")
Suggested-by: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v4:
 - In the mux disable path, remove the goto labels so that all teardown
   steps are attempted and any errors are only reported.

 sound/soc/mediatek/mt8183/mt8183-afe-clk.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/sound/soc/mediatek/mt8183/mt8183-afe-clk.c b/sound/soc/mediatek/mt8183/mt8183-afe-clk.c
index 6ab0734ad136..dd1a5925af96 100644
--- a/sound/soc/mediatek/mt8183/mt8183-afe-clk.c
+++ b/sound/soc/mediatek/mt8183/mt8183-afe-clk.c
@@ -271,7 +271,6 @@ static int apll1_mux_setting(struct mtk_base_afe *afe, bool enable)
 			dev_err(afe->dev, "%s clk_set_parent %s-%s fail %d\n",
 				__func__, aud_clks[CLK_TOP_MUX_AUD_ENG1],
 				aud_clks[CLK_CLK26M], ret);
-			goto EXIT;
 		}
 		clk_disable_unprepare(afe_priv->clk[CLK_TOP_MUX_AUD_ENG1]);
 
@@ -281,7 +280,6 @@ static int apll1_mux_setting(struct mtk_base_afe *afe, bool enable)
 			dev_err(afe->dev, "%s clk_set_parent %s-%s fail %d\n",
 				__func__, aud_clks[CLK_TOP_MUX_AUD_1],
 				aud_clks[CLK_CLK26M], ret);
-			goto EXIT;
 		}
 		clk_disable_unprepare(afe_priv->clk[CLK_TOP_MUX_AUD_1]);
 	}
@@ -298,7 +296,6 @@ static int apll1_mux_setting(struct mtk_base_afe *afe, bool enable)
 		       afe_priv->clk[CLK_CLK26M]);
 	clk_disable_unprepare(afe_priv->clk[CLK_TOP_MUX_AUD_1]);
 ERR_ENABLE_CLK_TOP_MUX_AUD_1:
-EXIT:
 	return ret;
 }
 
@@ -345,7 +342,6 @@ static int apll2_mux_setting(struct mtk_base_afe *afe, bool enable)
 			dev_err(afe->dev, "%s clk_set_parent %s-%s fail %d\n",
 				__func__, aud_clks[CLK_TOP_MUX_AUD_ENG2],
 				aud_clks[CLK_CLK26M], ret);
-			goto EXIT;
 		}
 		clk_disable_unprepare(afe_priv->clk[CLK_TOP_MUX_AUD_ENG2]);
 
@@ -355,7 +351,6 @@ static int apll2_mux_setting(struct mtk_base_afe *afe, bool enable)
 			dev_err(afe->dev, "%s clk_set_parent %s-%s fail %d\n",
 				__func__, aud_clks[CLK_TOP_MUX_AUD_2],
 				aud_clks[CLK_CLK26M], ret);
-			goto EXIT;
 		}
 		clk_disable_unprepare(afe_priv->clk[CLK_TOP_MUX_AUD_2]);
 	}
@@ -372,7 +367,6 @@ static int apll2_mux_setting(struct mtk_base_afe *afe, bool enable)
 		       afe_priv->clk[CLK_CLK26M]);
 	clk_disable_unprepare(afe_priv->clk[CLK_TOP_MUX_AUD_2]);
 ERR_ENABLE_CLK_TOP_MUX_AUD_2:
-EXIT:
 	return ret;
 }
 
-- 
2.43.0

