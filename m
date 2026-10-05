Received: from mail-pz2-f37.google.com (mail-pz2-f37.google.com [74.125.228.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B52B447D44C
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 11:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791198217; cv=none; b=JriF5ReILL7lwYcviaZhzl1ZlVs47w1O4FRYPbek2YAjEfAIefdOwiAe0yyVSSbgXRAvIlQVHVJOkzjW1Y6cb0DQwB2epz0eulHlx2DmEUYwlChId0QrQvB3mCWUYyNzuWcs/thw5Q+wiOg7l2Zjq2Rgm9nAng9dS3wxRVLGa3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791198217; c=relaxed/simple;
	bh=YUm+x0nzeJJbL9Rv9wE9lDbjGN/o/ElldmkNERhZ0M8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PA0p+X3jmEQkzgymRPjqR3rgXg8QQLK0FZFk3sJwO3eM2eTLv34pZVhZKGb63ta406KhJCiN/YBurVH9IPhHwX1Avi6K2aLtUOwh/frFkWSeF+IR58WVi48kXJSw1RrdXTW0u15uhB5qz00BaB0k/82RYNIh01ZrBGmoQb5ktg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VDptfuk6; arc=none smtp.client-ip=74.125.228.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VDptfuk6"
Received: by mail-pz2-f37.google.com with SMTP id 41be03b00d2f7-cc7c4c92477so807418a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 04:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791198214; x=1791803014; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GKjDwPOE3diTKoGaWJLuVQ3uglSGi8QtTacAmTtKLmA=;
        b=VDptfuk6c0ASiNrCUAXUx+scopIzZFrHmT8TR2rYoRzgtNqbdTLvzVeN3YXiYQ0eIr
         aQu8xjlKAXXJmkzeF8S4IO4IV33vdeeCuPaYyPEkGjFLCL4coxIQu974mkvKxHWEKxc4
         2QUMglVoHYPXqukVvPYOrSQM5xeAk+y3s927otaUbkD+lxv004fUy8Uq7WqTulndQBjq
         yebSbzjjnAJZtky0Fa4pnieP7mSHQQXHoXEWhCzVIWDukbgJadCR85pcOqGtJheFIW54
         R/OhhS66WB0BAopij0ceBJ/hEvqBQ3Vt+3nAOGwyRNH8I0Ol8FfTadbUCN9nMs4VJPNy
         afSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791198214; x=1791803014;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GKjDwPOE3diTKoGaWJLuVQ3uglSGi8QtTacAmTtKLmA=;
        b=ooU0YQobIq1Ob2P0f+dd/145B3cnfyx+ZwHDjbgqWpYIAivl4Mz4JXt8CqtsywF6Z+
         cIOnXqMOm/4C+LqUKwWGxqOiY4kR0E1pDaVqEFKOMXtIxet9p34XD/5geoy6gmI9jN+M
         taHRVtYsZM6yOCFduYQnlAdHAVsKHK/oqHP6gG3JHEQ4XQmFLZPr5Vq/m4hf7t4kD6hR
         lW/cxmCv5R6lXA1xdXtplV5XsiMjVBMjnp2JVS9dEpoFWDgjH//VDWsThwJ3lQ8na23d
         MYDsY+vSrKqo1AeDAoDvq136k+/5an2YNeV9MUGAMjLCG5f1KUChL8E3fHKAV5mK2H7W
         YcYw==
X-Forwarded-Encrypted: i=1; AKwUvByo/rkPgLi/iXd0Uenw3pja++kLYdtWN6IOKCjsJ0o+VfmsgFqALpJc2DIvaVXsFyCeIIrQVZsYOJQrSyE=@vger.kernel.org
X-Gm-Message-State: AFuF++ktrB/a2/uEHgNNSGRMcEPCxFO6D0ndONGjf12XhFqsChBkcHlK
	Bh3kWWShRz+suwuFyXIudN0zKa6T9T8CEU2ahm2bWJf0GYPtc7nhtFI+
X-Gm-Gg: AYBFou1W5BARdik7Swscxf6AlaIuYfDwuo6RzZsrT7b3Rii0FlexFQGH9iRtvo5I414
	B1RZmZw7hbQacLGi6jMoVTSKU/xys7heM70iv2w9kZfbSZm9TnbP/SmObKVIW7g7I/jM7haXaYs
	JnYAuytX2VNpboFasnpQH3KF2892JrzP2FB9NPCRA4NGvlp6N4UeLwZt2ej5gWzClxcsXeDQL7H
	MwW8WUtaa0KwdtEo9SIJ6OocFtCDNY9d1OaomjmDyGsApPG5Rb3fVTgMiuLCDvVq1eiY/inBZuU
	6mcAA/ZvlWBX0hyEMcDGHfN6NZhiVHBNN406D+kSkpj4kBZWxlnrZaVb6dWWQmO7urWkQi4AfEn
	wXfG7I8G9xEUgSKJt97Uk9FlCmAqUMPHQLs8UxRKdb9QYbsQnIsdw+hfVicZNULVPM/W+1Kclil
	l8n/YPHOJI145u+o4MDjB6xKUwx+b13xkvjiUXASIz8fhFGLuNiB7ziC2dfHt5z51KnYXuCPtaJ
	+ZVaakbWlzW6H/xZBZDs/PU+0Nruc0zh32tql5YE6NpL85uYiAMlvzAykBQ2AZLWNZUUGmGg+vM
	NRGaDRHUEUsCcg==
X-Received: by 2002:a05:6a21:71c1:b0:3e0:d508:59b3 with SMTP id adf61e73a8af0-3e0d5085ab9mr6255687637.71.1791198213773;
        Mon, 05 Oct 2026 04:03:33 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cce6d334de5sm626498a12.11.2026.10.05.04.03.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 04:03:33 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Trevor Wu <trevor.wu@mediatek.com>
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
Subject: [PATCH v2 04/14] ASoC: mediatek: mt8195: Fix timing system clock error handling
Date: Mon,  5 Oct 2026 18:02:47 +0700
Message-ID: <20261005110257.50145-5-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261005110257.50145-1-phucduc.bui@gmail.com>
References: <20261005110257.50145-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Check the return value of mt8195_afe_enable_clk() when enabling the
timing system clocks.

If enabling a clock fails, disable the clocks that were already
enabled and propagate the error to the caller. In
mt8195_afe_enable_main_clock(), return the error instead of continuing
with AFE clock enable.

Fixes: 6746cc858259 ("ASoC: mediatek: mt8195: add platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8195/mt8195-afe-clk.c | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-afe-clk.c b/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
index 34c828fdea29..ef7a62fba6ec 100644
--- a/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
+++ b/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
@@ -662,7 +662,7 @@ static int mt8195_afe_disable_afe_on(struct mtk_base_afe *afe)
 static int mt8195_afe_enable_timing_sys(struct mtk_base_afe *afe)
 {
 	struct mt8195_afe_private *afe_priv = afe->platform_priv;
-	int i;
+	int i, ret;
 	static const unsigned int clk_array[] = {
 		MT8195_CLK_AUD_A1SYS,
 		MT8195_CLK_AUD_A2SYS,
@@ -673,13 +673,22 @@ static int mt8195_afe_enable_timing_sys(struct mtk_base_afe *afe)
 		MT8195_TOP_CG_26M_TIMING,
 	};
 
-	for (i = 0; i < ARRAY_SIZE(clk_array); i++)
-		mt8195_afe_enable_clk(afe, afe_priv->clk[clk_array[i]]);
+	for (i = 0; i < ARRAY_SIZE(clk_array); i++) {
+		ret = mt8195_afe_enable_clk(afe, afe_priv->clk[clk_array[i]]);
+		if (ret)
+			goto err_disable_clk;
+	}
 
 	for (i = 0; i < ARRAY_SIZE(cg_array); i++)
 		mt8195_afe_enable_top_cg(afe, cg_array[i]);
 
 	return 0;
+
+err_disable_clk:
+	while (--i >= 0)
+		mt8195_afe_disable_clk(afe, afe_priv->clk[clk_array[i]]);
+
+	return ret;
 }
 
 static int mt8195_afe_disable_timing_sys(struct mtk_base_afe *afe)
@@ -707,7 +716,11 @@ static int mt8195_afe_disable_timing_sys(struct mtk_base_afe *afe)
 
 int mt8195_afe_enable_main_clock(struct mtk_base_afe *afe)
 {
-	mt8195_afe_enable_timing_sys(afe);
+	int ret;
+
+	ret = mt8195_afe_enable_timing_sys(afe);
+	if (ret)
+		return ret;
 
 	mt8195_afe_enable_afe_on(afe);
 
-- 
2.43.0

