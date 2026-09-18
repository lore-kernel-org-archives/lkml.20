Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF5CA51121B
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 13:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789738813; cv=none; b=RiQU3Tyq+l6gEEVh94w9LZNEat+AMLnfRs9RlYV8TMxe1nUQ2sSojvyp+FCXVmdMuLFdgj0o/uE7XVb5HuPIa4WUrEGVsiBBOZO/v+cmJT41C6IQd5WDKaFNhw9UrqjT4azd9/uknwZz+14XP3y9sBzP6r9Fft0PjQi6Xp6CF6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789738813; c=relaxed/simple;
	bh=py0ZrKaM8DbzSWplMOWdiU7mC/SzmDtkED2SS4JnlbY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jQNooyYtV/ZG8/4+eZ+vXqgGHIkucKMG+ger+0mAo++H+Y2sV0Zo/RAux4zf61g0dzBuk/JJc3oi9DwdapGQiETL3cZtEhbNyBzjEkVIJDg/8hb/u/tqj20TDOARztT/ljux6PqR1w+E9teOMd4sB1vzJaZPV+oAESLQkleXqwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KllhrvJx; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KllhrvJx"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-39b9184fa80so735170a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 06:40:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789738811; x=1790343611; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=47miggGna65qNmT8xI9ufxte8NSMbuV+wMsl3roErvo=;
        b=KllhrvJxPPaQAm4itC6AAuwdWI5fyipgGpb82XDBO+s+Mbjav6GfhNZIzCGF4NaxtE
         OfrS16FRPCH5589trDyEJVkHBLj9SWHWaOAcmxxOr+yFt4OQXa8SzVIYsCjpsMEhxNK4
         Z7dOo4QFgXlVyxURw8w/Vk6RwDcIWZlHsjarYH9VvdmwMGR2CEhJ7tUUYd508Z2KLn8F
         69FuZPAj8H8tWFngcdG/pntEK3QDNDTX1XMhsagHxarTKhMxaiLUNOMlDDRQ3Q4jLj5s
         duMi9VDWHgRosA/EO1gOIcpwR4uW9YwOyUEmFFvV9M1euY/gO5LGBZfdyfNUCJubSH+k
         9uPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789738811; x=1790343611;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=47miggGna65qNmT8xI9ufxte8NSMbuV+wMsl3roErvo=;
        b=PXvmY/thoSVnn/Y92emWdKffO/698/x1VHAUVt4eVb2NjG40JKa+hV4snVUYJ+3BRo
         RTEgKyvMiCWMX3xdqmDWpiIfD3R3TRb31JvFeKg8CHmVuGUiT7JYpvFwEvd4V4HSowvF
         FaTXweJx6YJ0rU4pTju4J/lWy3Avr6mG2ykH/6Cg95px+E1g4FyxrzOhaLb7xjQBSIsA
         MP1wawe0S1Ay5SoG4ENrWD8ILNUQZZ1Ql6F8wk4ZLTx6YQyraxpjbffc3rp9enLNC3LD
         Pf2D8HZUgyE0N8G3kMFDS7kOGUkBidh/DkEalPo+0+OS2MzaKnHB/LlNg+zZI2V3nSnk
         zkTg==
X-Forwarded-Encrypted: i=1; AKwUvBwcbV+yaMQ/WXbMWl+VGT8gRe/9hlT2rgHL9Mn8n0WNe0PzTbHt0NvVVRdY2LgKMAB6ST3D+13ckD6iQUY=@vger.kernel.org
X-Gm-Message-State: AFuF++nwcdPLo7sKds3TT+q6Ygvf3QTSOWjunZZjpvInDQJoUwjjPPeD
	GopFJGjFUJofF0aOp6YlfTySSNOL+fgNoCjq9W+gndXQENpFWayzvuBw
X-Gm-Gg: AYBFou2l5bxTN09Nt1SSnm2JpXdgj9Mq32JQ7LQZQ/+7HUoVVlxcZJNJdRMDivNPedI
	YI2BcegkZK8eOkWTmlL7ySVcKkYG66qj4KXJGm5XXX0z51rn3f45eQFPGY6I+87IrIrqaZ9UOgr
	K9RUt0P/Q29x+43DAxIklKfQyFdkS2pDRhNjxokpHpMiG9bXCSxebWZhusVXyqdNKL30wybyMcT
	9b617cm2+Zy2hLmCCo1U378GMlnyG7HC4NtvBbFpreHkOUtBB9X3c+oQ+9K7XlU1UJd7nXb+Jav
	tHUWHJg8oiJjAfQfgBtO/dnmmhSp72BV3jYU3bzoRxgXsAoOEUCg8fvKbxUlPKos/Fboyw18sSh
	6vHAelsMI/+1uh/09Y7A1E6ct+yVvf7wwVnzEIJcAuM+vgxuiuMiBl+RZgPbHY7F/HLOGA4wfsW
	ORiRuYxWQHmhzqALiMjkO5O+P87IuK4ze7wnWiVEnNVaacGBdA60l4TlbnWAPWVxsr55gvusnv3
	f5DDUxUXn2wr3nh1z1EdQk7m9w2gReelIW/zQywfRZxb3IQA3sCE8xJRnzeB2j4nbDtbDYYncUU
	9fn19IdyNTZH5A==
X-Received: by 2002:a17:90b:4b86:b0:39e:21a7:5dfe with SMTP id 98e67ed59e1d1-39e54c5a1ecmr10006575a91.3.1789738811052;
        Fri, 18 Sep 2026 06:40:11 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e3617443asm13253792a91.9.2026.09.18.06.40.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 06:40:10 -0700 (PDT)
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
Subject: [PATCH 06/15] ASoC: mediatek: mt8192: Use dev_err_probe() in mt8192_init_clock()
Date: Fri, 18 Sep 2026 20:39:02 +0700
Message-ID: <20260918133912.133799-7-phucduc.bui@gmail.com>
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

Use dev_err_probe() when obtaining clocks to avoid redundant error
messages, particularly for probe deferral.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8192/mt8192-afe-clk.c | 24 ++++++++--------------
 1 file changed, 9 insertions(+), 15 deletions(-)

diff --git a/sound/soc/mediatek/mt8192/mt8192-afe-clk.c b/sound/soc/mediatek/mt8192/mt8192-afe-clk.c
index 9b9a3465ddb5..c6ca4fe7fb19 100644
--- a/sound/soc/mediatek/mt8192/mt8192-afe-clk.c
+++ b/sound/soc/mediatek/mt8192/mt8192-afe-clk.c
@@ -680,27 +680,21 @@ int mt8192_init_clock(struct mtk_base_afe *afe)
 
 	afe_priv->apmixedsys = syscon_regmap_lookup_by_phandle(of_node,
 							       "mediatek,apmixedsys");
-	if (IS_ERR(afe_priv->apmixedsys)) {
-		dev_err(afe->dev, "%s() Cannot find apmixedsys controller: %ld\n",
-			__func__, PTR_ERR(afe_priv->apmixedsys));
-		return PTR_ERR(afe_priv->apmixedsys);
-	}
+	if (IS_ERR(afe_priv->apmixedsys))
+		return dev_err_probe(afe->dev, PTR_ERR(afe_priv->apmixedsys),
+				     "Cannot find apmixedsys controller\n");
 
 	afe_priv->topckgen = syscon_regmap_lookup_by_phandle(of_node,
 							     "mediatek,topckgen");
-	if (IS_ERR(afe_priv->topckgen)) {
-		dev_err(afe->dev, "%s() Cannot find topckgen controller: %ld\n",
-			__func__, PTR_ERR(afe_priv->topckgen));
-		return PTR_ERR(afe_priv->topckgen);
-	}
+	if (IS_ERR(afe_priv->topckgen))
+		return dev_err_probe(afe->dev, PTR_ERR(afe_priv->topckgen),
+				     "Cannot find topckgen controller\n");
 
 	afe_priv->infracfg = syscon_regmap_lookup_by_phandle(of_node,
 							     "mediatek,infracfg");
-	if (IS_ERR(afe_priv->infracfg)) {
-		dev_err(afe->dev, "%s() Cannot find infracfg: %ld\n",
-			__func__, PTR_ERR(afe_priv->infracfg));
-		return PTR_ERR(afe_priv->infracfg);
-	}
+	if (IS_ERR(afe_priv->infracfg))
+		return dev_err_probe(afe->dev, PTR_ERR(afe_priv->infracfg),
+				     "Cannot find infracfg\n");
 
 	return 0;
 }
-- 
2.43.0

