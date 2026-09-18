Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A69EA4FD28B
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 13:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789738799; cv=none; b=Nl2Jh1w1Lr3KPBZ+W7ftnHf5i2TV4cPlv/JGyHvz0ymS/BRM/bSd/JU3nItRtKoTIs8+wQpnY2GXo/kIzuvktBCXNwDrm0j5onHAOu/p0AAsIioUi/0FZsuT8uLk0ayYkMBXvMiW+OzEzycClPuFZdZhGpuXvlzBEEyhBIPboic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789738799; c=relaxed/simple;
	bh=OWrie+dV2E3Oh3XvLUGUdaBPRj738r+NfpSbomdwbk0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s4NAswUi4l8d71dA3BTw/nY3KW1sieuVe26YoO51juIwZab4JUu8t5IBsWp6lhrOc5DfOKHwGxX69GOVIGgaoangv9LFCv53pAVyFoYg+RY8m2jNjJdTz2kL5hXQHODGGzsigaLs2NnSYMpOIOjhNNrCQCLJHQ2Qb54Hk+XLQms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hILWV941; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hILWV941"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc4d04d740cso433152a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 06:39:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789738797; x=1790343597; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xZ46FG5TVo6218myQRpLPBR3Fij1s0mvVbflmMAQD4M=;
        b=hILWV941b4XeVj5vvysZJv+/JgiCoT1z1TFh33eO65+JA+zZXTk1/tSZNiIKO7GEzn
         dfegvcE8t0/X245xkI+cICpDDU7uNqOOfaOFUd3HJ8wFYiuICkmh8x/RGcjGfAuBIAmF
         Q0y/xGv3H0zLLPQjaMeiL23CFUNc8ybxRRTPkbiuBRsZ2FlEh3g8FU9h4BNOVUu2uDxB
         8SD9xCzdM62ubeDTYWNV1s2EI0mZfGzqnJHOeDeMEP/o74oqXT8kpkB5hWsOEouJt69l
         UIfUlGT1wv3SHhL59zVbdmHUEu68D7VFz7aliL43PocJdW55svzKbKhflheqzH1Q1wDH
         WpHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789738797; x=1790343597;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xZ46FG5TVo6218myQRpLPBR3Fij1s0mvVbflmMAQD4M=;
        b=HoHomA2mAmdF037WWd/UFMXUSwfPoURHPKtWpNcdFU5AECQBwdiRhRKmgUJKezSxKi
         3KDfhJL2Ego/M8gf9OES9FyyJICCEn6ZCEH88a134mJQ+KUXq+SJ2C7cC4rbqvXohM7l
         tb5Jk6npAfU7BUavtH+AKfkT74lAu/Pwb2wYM4bJzKaMi+d/gYiOX6ZsHS2+JWQhrNmL
         AondGx9LkswtwuGO3IBUW0fdImRQIsw0N3bbHmozahbrPpyGB4P+Qto0XU6KUGM1g8d1
         vGGeMIz7nQS1dSEM0ajx9Xi1lLrBiN8khUgOLQJ2ad35ZV/1pX0KlG4WfPXuarODG6N4
         AgdA==
X-Forwarded-Encrypted: i=1; AKwUvBy007dhyFShe7dlSRga4i4+A+GM5iZb1haJDyxkDsJDYRH7tI77y/kcOozrNbjvPxkZnhCBKRW3VCPt3zg=@vger.kernel.org
X-Gm-Message-State: AFuF++kbknrJlzayMqnAO6r1uNhnVVZwi/CV1blCJ3wcp4Ddjjt3gU8o
	vWFNeSgT/XrTQ0jtcr8RJeZcHdlLW5AJWKEXmHO15z2LiSau7QnBB9it
X-Gm-Gg: AYBFou2RMJZX8hnhke2FJ3dPYglmgP+/mkDsM8rdDtK74IwnR6V/AzAXQFOLtrpN+mP
	uAWOAmkhCdXucXo4d9vFmU/0aS+Tla0giWm6mlUZEKzX3RLLglBAUxmxKWHIQxpUNd0CgKWf7bk
	nmfdNEZ1P2oYqBJ2fJWFxaXDSih/aB/6kbAcLzANRNrJ768zaHwpwJGki+tND2LnuXgQUY1+HpK
	KnGzfMw6qtfhT1x/mphnoZ+ZUvH97aJtSvoq1EmDUhg/YmUO3/VIF4bOkVGo8E7ejSDRyXz8yhE
	mQsfinns8jpGtYIAyr3F8NUGB7SsXfKXkJ1j6oLhUAMytzOq7lOq5BstMOOZgkhl+zUcgfLaHo1
	zvGT2iQ+aqtjRSPM1esleGLK35zn488ZQUn1GxKmF/9lCVxT8Y169krlA/nz+9B06oCZUk5EJTc
	IjW8y9WF+0hCerROCTB5qMendovf1aguWckwr3u8sQo/s+xRG/6AcXrZjRRY5auxlEa5TVljPre
	3nzBzOWFV5Htj9sRTE70PJnlgEzkFYthzxBJxnvWGY9HYVeZTABcv0A/Fe50kmGRAeyw+CsG4IW
	c71R4PDoIxlBCg==
X-Received: by 2002:a17:90b:2d44:b0:39d:8794:5564 with SMTP id 98e67ed59e1d1-39e54ce36fdmr6605508a91.12.1789738796691;
        Fri, 18 Sep 2026 06:39:56 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e3617443asm13253792a91.9.2026.09.18.06.39.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 06:39:56 -0700 (PDT)
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
Subject: [PATCH 03/15] ASoC: mediatek: mt8192: fix error handling in APLL enable functions
Date: Fri, 18 Sep 2026 20:38:59 +0700
Message-ID: <20260918133912.133799-4-phucduc.bui@gmail.com>
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

If a clock operation fails in mt8192_apll1_enable() or apll2_enable(),
the functions return without checking the return value of mux settings or
unwinding previously enabled clocks and MUX configurations.

Fix this by checking the return value of apll1_mux_setting() and
apll2_mux_setting(), and adding proper unwind handling on failure.

Fixes: 125ab5d588b0 ("ASoC: mediatek: mt8192: add platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8192/mt8192-afe-clk.c | 32 ++++++++++++++++------
 1 file changed, 24 insertions(+), 8 deletions(-)

diff --git a/sound/soc/mediatek/mt8192/mt8192-afe-clk.c b/sound/soc/mediatek/mt8192/mt8192-afe-clk.c
index 7647bdd463d9..118dd4819682 100644
--- a/sound/soc/mediatek/mt8192/mt8192-afe-clk.c
+++ b/sound/soc/mediatek/mt8192/mt8192-afe-clk.c
@@ -308,20 +308,22 @@ int mt8192_apll1_enable(struct mtk_base_afe *afe)
 	int ret;
 
 	/* setting for APLL */
-	apll1_mux_setting(afe, true);
+	ret = apll1_mux_setting(afe, true);
+	if (ret)
+		return ret;
 
 	ret = clk_prepare_enable(afe_priv->clk[CLK_APLL22M]);
 	if (ret) {
 		dev_err(afe->dev, "%s clk_prepare_enable %s fail %d\n",
 			__func__, aud_clks[CLK_APLL22M], ret);
-		goto EXIT;
+		goto err_disable_mux_setting;
 	}
 
 	ret = clk_prepare_enable(afe_priv->clk[CLK_APLL1_TUNER]);
 	if (ret) {
 		dev_err(afe->dev, "%s clk_prepare_enable %s fail %d\n",
 			__func__, aud_clks[CLK_APLL1_TUNER], ret);
-		goto EXIT;
+		goto err_disable_apll22m;
 	}
 
 	regmap_update_bits(afe->regmap, AFE_APLL1_TUNER_CFG,
@@ -332,7 +334,13 @@ int mt8192_apll1_enable(struct mtk_base_afe *afe)
 			   AFE_22M_ON_MASK_SFT,
 			   0x1 << AFE_22M_ON_SFT);
 
-EXIT:
+	return 0;
+
+err_disable_apll22m:
+	clk_disable_unprepare(afe_priv->clk[CLK_APLL22M]);
+err_disable_mux_setting:
+	apll1_mux_setting(afe, false);
+
 	return ret;
 }
 
@@ -358,20 +366,22 @@ int mt8192_apll2_enable(struct mtk_base_afe *afe)
 	int ret;
 
 	/* setting for APLL */
-	apll2_mux_setting(afe, true);
+	ret = apll2_mux_setting(afe, true);
+	if (ret)
+		return ret;
 
 	ret = clk_prepare_enable(afe_priv->clk[CLK_APLL24M]);
 	if (ret) {
 		dev_err(afe->dev, "%s clk_prepare_enable %s fail %d\n",
 			__func__, aud_clks[CLK_APLL24M], ret);
-		goto EXIT;
+		goto err_disable_mux_setting;
 	}
 
 	ret = clk_prepare_enable(afe_priv->clk[CLK_APLL2_TUNER]);
 	if (ret) {
 		dev_err(afe->dev, "%s clk_prepare_enable %s fail %d\n",
 			__func__, aud_clks[CLK_APLL2_TUNER], ret);
-		goto EXIT;
+		goto err_disable_apll24m;
 	}
 
 	regmap_update_bits(afe->regmap, AFE_APLL2_TUNER_CFG,
@@ -382,7 +392,13 @@ int mt8192_apll2_enable(struct mtk_base_afe *afe)
 			   AFE_24M_ON_MASK_SFT,
 			   0x1 << AFE_24M_ON_SFT);
 
-EXIT:
+	return 0;
+
+err_disable_apll24m:
+	clk_disable_unprepare(afe_priv->clk[CLK_APLL24M]);
+err_disable_mux_setting:
+	apll2_mux_setting(afe, false);
+
 	return ret;
 }
 
-- 
2.43.0

