Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D8CC50E58C
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 13:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789738794; cv=none; b=CILfm0UKHAJ3eVsyxKKwsd9LdDqOlQ2uF0HRvkzOU8CI15kUd8PBvCZ3SqJO8yn4pu1XppCpHuHvtuI6T/kdgkwTA/RN45mFvlLD2u1Npdl1bhJHfczjctha+uWRCNCEYOzpuhMjltPgOWSsRLA1kPJapnSsP/eQHofllRyfuRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789738794; c=relaxed/simple;
	bh=Yhr/LGNoTuypBOAzfvG820znUChZLtctV2QUCTymu2M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s0YU+bD2OeutD6DA1Bfs0Vbs6Sja7+wP6jRmP1t17U8Krfv0/Qh2V7NCtvBfMxPXZfJxNs9CXstK5MnaD6IY1/uVKouVyyAG3yH1JpcgtoJrViHOcWx1aUuUe0XSA3z7CxFOpu2AENtWDzsX7UnNfAAjaH505Au8I4TqitXjo5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J/iG0jN6; arc=none smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J/iG0jN6"
Received: by mail-pz2-f43.google.com with SMTP id 41be03b00d2f7-cc4c08393dfso549836a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 06:39:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789738792; x=1790343592; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ktoNsEAM8yzRGTqWXbn5tE4afzDQIVo6sEvkne09pIg=;
        b=J/iG0jN6qnv4JLDb6hYYsXt+7hJgiSdN00OmeeMBBp9/oYBpHuSlviKaWbiZEwKQj7
         Vc/mdvO81HdYgM5ADuIlMObqq35hqKScFpb5NmQU0PAblF4yFRxpeqlCfvkM8mnAONQF
         LrgUE6QGVieqRcKjN/5pt7S+m9jArxrZiMnUKNk55Qjoyx7eFkCxZbuHOUSCx+thmgEe
         HNrCxJnu2IqFml0gkGgL2KWCETbdx/U2J51uoeXmQvN+DiOGbAO1JbgDBpZZg7tsOf8U
         6zuAKdhwLjzG1c1jtKs1fWcdOQeYhbgfBUaz3bcyfxTo9rdA436EKfCWm3dbj4JNgQui
         AH8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789738792; x=1790343592;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ktoNsEAM8yzRGTqWXbn5tE4afzDQIVo6sEvkne09pIg=;
        b=fXb40TI2EENxSTzVk0AMM3NRqTLX3AKgM1364T00/7nqilmef/ALvXdiutsoE6PggR
         pnBhkXBJTDyh+PTK01nDcxOc+llkgdjDaYDluSFSrV1cRoB73/yhFBD5E5tk1eANe2Dz
         bju4b5QVdE/ismmSBaFIi1ZqvZ+rO3w58EZrVP1UIZQHs3dngz/kA9sXcfrPTCgJ8lEA
         euJpQeyYMN9qDXdzaBQ4J0P5Jg9Y9dNTDA5GOYMnGzhPLIso1QN3/2aCLPGHz7QuYF3X
         2iA6BqDwi63NWI3NPI5LjwYMpSfJiYsPLiCkzIFj/ssueL0b+i/LYMaVBAIY82YvSU4b
         g7vw==
X-Forwarded-Encrypted: i=1; AKwUvBzje5t/k1AsQAHoXxve8h04mGZKOrLk3ffOxcdc0x/6b0puDQr2A2km65ikcFKgBF6o8z0zGQcsFOgI2a0=@vger.kernel.org
X-Gm-Message-State: AFuF++nKWLYsPH3t8p6mm7ic55J/w2Js8ymtWlFPnOO2Mo9jxDV1f6t4
	22mSpfQIHG1VH3Sr8DAG7ltWhqsdN6+Z7urlkLCnIp8TFDgGNiyY9D9H
X-Gm-Gg: AYBFou08lypfXWDs6oKnig8TdHHAieGrc/xV6DmGS4uF87ct4dZWnQbNcwvc80KUQh6
	m5CRSWR0Oe8lDg6KQKZCiSnnQ58ZZByrd/2OpQWgLZ/5CxUTqKeEuMnZEk47TsPM8XwhBxloUW9
	//jtf1nViXWmSS0NoE6//x9IhD4GvWlFn22ohpGxqAeRrAnzfCNhk171y8gQeHVjv7d2l8UOImc
	g4Q6iC56/q4qgp23YyI65Oy/Lk5sEHeBY62me8oMSH2T+fNBoFnM5MKIbwU9czlnN5SdVlD9Zg5
	782s3odHsrskl8K+/dPHTjbK5W6WSowol5k024tYcLXPsCU1vXR1Gqd8ssN39BC8nVquzvcPIB6
	Bsft7ZOqP7xcMskcoOKx929u0tBU1PF3fmEgf8PPMrqgzcqLR6z1r62dGVCtWedQb9t2t24wMDx
	DSdKeEVzPzt7KK59ydhPdK7VL4uwY5ySTkvzrMgqccwjisLCNj/j4Fhu+3Pj8PyYUl+eOh6lF29
	J/qmNgsO7YYMq4P1SgIGQDqfsJStBtItZNsUtMMSXpjOGewgWJk/YcxH53Qpy8VbTF60Xv61Nj7
	k6AoLf1AttczNQ==
X-Received: by 2002:a17:90b:398c:b0:39e:1c2c:1d4b with SMTP id 98e67ed59e1d1-39e54bcd0a9mr5957619a91.11.1789738791912;
        Fri, 18 Sep 2026 06:39:51 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e3617443asm13253792a91.9.2026.09.18.06.39.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 06:39:51 -0700 (PDT)
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
Subject: [PATCH 02/15] ASoC: mediatek: mt8192: fix AFE clock error handling
Date: Fri, 18 Sep 2026 20:38:58 +0700
Message-ID: <20260918133912.133799-3-phucduc.bui@gmail.com>
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

If a clock operation fails in mt8192_afe_enable_clock(), the function
returns immediately via the EXIT label without disabling the clocks
that were successfully enabled earlier in the sequence. This leaves
unneeded clocks running and causes a resource leak.

Properly unwind clocks enabled before an error by jumping to appropriate
cleanup labels on failure.

Fixes: 125ab5d588b0 ("ASoC: mediatek: mt8192: add platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8192/mt8192-afe-clk.c | 28 +++++++++++++++-------
 1 file changed, 19 insertions(+), 9 deletions(-)

diff --git a/sound/soc/mediatek/mt8192/mt8192-afe-clk.c b/sound/soc/mediatek/mt8192/mt8192-afe-clk.c
index bd778e5663b5..7647bdd463d9 100644
--- a/sound/soc/mediatek/mt8192/mt8192-afe-clk.c
+++ b/sound/soc/mediatek/mt8192/mt8192-afe-clk.c
@@ -220,21 +220,21 @@ int mt8192_afe_enable_clock(struct mtk_base_afe *afe)
 	if (ret) {
 		dev_err(afe->dev, "%s clk_prepare_enable %s fail %d\n",
 			__func__, aud_clks[CLK_INFRA_SYS_AUDIO], ret);
-		goto EXIT;
+		return ret;
 	}
 
 	ret = clk_prepare_enable(afe_priv->clk[CLK_INFRA_AUDIO_26M]);
 	if (ret) {
 		dev_err(afe->dev, "%s clk_prepare_enable %s fail %d\n",
 			__func__, aud_clks[CLK_INFRA_AUDIO_26M], ret);
-		goto EXIT;
+		goto err_disable_infra_sys_audio;
 	}
 
 	ret = clk_prepare_enable(afe_priv->clk[CLK_MUX_AUDIO]);
 	if (ret) {
 		dev_err(afe->dev, "%s clk_prepare_enable %s fail %d\n",
 			__func__, aud_clks[CLK_MUX_AUDIO], ret);
-		goto EXIT;
+		goto err_disable_infra_audio_26m;
 	}
 	ret = clk_set_parent(afe_priv->clk[CLK_MUX_AUDIO],
 			     afe_priv->clk[CLK_CLK26M]);
@@ -242,14 +242,14 @@ int mt8192_afe_enable_clock(struct mtk_base_afe *afe)
 		dev_err(afe->dev, "%s clk_set_parent %s-%s fail %d\n",
 			__func__, aud_clks[CLK_MUX_AUDIO],
 			aud_clks[CLK_CLK26M], ret);
-		goto EXIT;
+		goto err_disable_mux_audio;
 	}
 
 	ret = clk_prepare_enable(afe_priv->clk[CLK_MUX_AUDIOINTBUS]);
 	if (ret) {
 		dev_err(afe->dev, "%s clk_prepare_enable %s fail %d\n",
 			__func__, aud_clks[CLK_MUX_AUDIOINTBUS], ret);
-		goto EXIT;
+		goto err_disable_mux_audio;
 	}
 
 	ret = mt8192_set_audio_int_bus_parent(afe, CLK_CLK26M);
@@ -257,7 +257,7 @@ int mt8192_afe_enable_clock(struct mtk_base_afe *afe)
 		dev_err(afe->dev, "%s clk_set_parent %s-%s fail %d\n",
 			__func__, aud_clks[CLK_MUX_AUDIOINTBUS],
 			aud_clks[CLK_CLK26M], ret);
-		goto EXIT;
+		goto err_disable_mux_audiointbus;
 	}
 
 	ret = clk_set_parent(afe_priv->clk[CLK_TOP_MUX_AUDIO_H],
@@ -266,17 +266,27 @@ int mt8192_afe_enable_clock(struct mtk_base_afe *afe)
 		dev_err(afe->dev, "%s clk_set_parent %s-%s fail %d\n",
 			__func__, aud_clks[CLK_TOP_MUX_AUDIO_H],
 			aud_clks[CLK_TOP_APLL2_CK], ret);
-		goto EXIT;
+		goto err_disable_mux_audiointbus;
 	}
 
 	ret = clk_prepare_enable(afe_priv->clk[CLK_AFE]);
 	if (ret) {
 		dev_err(afe->dev, "%s clk_prepare_enable %s fail %d\n",
 			__func__, aud_clks[CLK_AFE], ret);
-		goto EXIT;
+		goto err_disable_mux_audiointbus;
 	}
 
-EXIT:
+	return 0;
+
+err_disable_mux_audiointbus:
+	clk_disable_unprepare(afe_priv->clk[CLK_MUX_AUDIOINTBUS]);
+err_disable_mux_audio:
+	clk_disable_unprepare(afe_priv->clk[CLK_MUX_AUDIO]);
+err_disable_infra_audio_26m:
+	clk_disable_unprepare(afe_priv->clk[CLK_INFRA_AUDIO_26M]);
+err_disable_infra_sys_audio:
+	clk_disable_unprepare(afe_priv->clk[CLK_INFRA_SYS_AUDIO]);
+
 	return ret;
 }
 
-- 
2.43.0

