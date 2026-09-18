Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 695C55111B9
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 13:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789738809; cv=none; b=fh2RE8YUxRyZkNxkyJn/uygK7X8nFpb0jiaT0F+pQADm7EAeoLiwxYgpTgNuYClSiQlMR2906hCQphO9A4UJSTVTu2ICfQ/LMcXYn35Lz4A5KV2rgT6dQT4mwHfNsnLTPOM3P2moJNM38Y3WoQsvZRe3ef+R6EywJc6j0DQG5ZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789738809; c=relaxed/simple;
	bh=Ion7oeotHUPfHsC8ZZdaBN3kHybJSmfJXlAWCx23Dq4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SjR69lfZKkt6ddwcIc9fYeRQQv4zMXTjkVDcpQOitlfsLsMKTWj3+VPrg4k0v+SDO7/4J8oyrjgSGvQ99SQ/nCFiz/BJ60KcFrGIRYTsNiXqBre14JAZuN376QAVs5CYtoFMsOOp5kVUdsl6bJZJWpkU/FEK9d/bAuaT7d0CZJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Izhkec9F; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Izhkec9F"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc4c08393b0so569001a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 06:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789738806; x=1790343606; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ppJ5fgau4uw0MPuW4ZdZtY3EQ3eIT2OOYRbyNQHq6DQ=;
        b=Izhkec9FKqkZ8qgWA4yX5Ff41xx1hrmTt3HfZw+bz9g902L6zBHe1g3vuPBrCtBBSd
         zCx9vVHNpFGQdfw89UtgsNUrHYNaHzMEGauIMBLEWWPULIqe7tKlmLU3Grr6U8SZNRjp
         F+DFefHwhUAqtotoWhZSxoR8/ktsx/jQq70UWn/YmS2qzY06h3SaYU1VuU22No7ehLFj
         bLWwn9dllengFS3nnQSZ2UUTSkOHf+Emcdn8q1gcvLgrAULkVPdu5NXnIviDiabhyF5G
         z2WaFKonnsg17qKWA3kRU2B83DJxySV2vv97X9rC46/SF5RbG49ZYI5XuTcUTxb+h51K
         V/hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789738806; x=1790343606;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ppJ5fgau4uw0MPuW4ZdZtY3EQ3eIT2OOYRbyNQHq6DQ=;
        b=dDf/LhEupCOEsFSrUcqpA6a5F+jzsNLMEX6qJIZR7S4GVqae3pmbhrnmaB1TqXQ2Tr
         +ZWWO6c08aHX3JrN5vqPVOppA7JEuhc/lJRadOttHERtdXd4MO6VRqeOtoB3CrYVyyLZ
         MBdFdw0Con0l/j9TpTOE3i+qbE5Al/0Wx5lPE4UZ28LKXVF2IMktYZyL3uuVjC5WgPav
         klA94tTStJjx+zi7bD9kB4H+W2Lt5A60X9fs8If7ilBLN1ksCdiyv0i+YlOBZXmffkjO
         Cka5j6YSFXX5r1ajcThTyEDypJgMVkPL/R2t/52XRJfHVFTuqTDwECcGSe6XN2IbTbat
         4pOQ==
X-Forwarded-Encrypted: i=1; AKwUvBzK5NpiQlgPpiBfojVP8bFLs7KrZlKGBUQRReXw3sCG8Ogd2m/XCTe4a5lByeBGkB3/al0h8mbtEGDfTv4=@vger.kernel.org
X-Gm-Message-State: AFuF++lh0C5wJkd7eg7HdgiErRGpmRDuXrr8m/ex07AXKrwEbnlsQx4O
	jp87zI2AQ8ObKyDsMEq49Fs8q9joP7aG6QaGSyW3ISzYcyC1d5JKwklB
X-Gm-Gg: AYBFou1jW/WwfwGpIyVwwRLab7F0OzXKxjSR3ZxVsDd+02yk+RKkmo1aIWR/yfbMCYa
	KZeL/57YWwOvLhDtyrg71a9P6JXBoe20RvDLTzVizS+bA75+4sMraB5x07UKCcjGChJE01HU5B/
	vkqebQKm+c/2ChcJkOgJP+qL/xjAJNtYLn+Zf+d4dt/zuf1dR0xA8e+zrEx3XWHvEIMoJD9lRRY
	XzkB21xrsVBL9T+6UUppfCGDfm2MyWPZpuEHORY7YwqnfZ5yhjoGINwazPobW55FpN2/V4MbW9m
	5hlaDxY7Zf0oEpd/xqRNYetPA8dPfaJ+vJ/WtBQkJ1SzeJ5tNwqOHzsniDwatba938lFgBq1Hph
	16uaLLORH09jQegJey94NZG3PYMrZ8suYiIQNeOs0jMtoe+O+9xVfrbTT5Sj2CXnXCREq0+xK1J
	FD2FdSWIRJ0i0QFY4HGH9G/4EsfUNRRfsh6vQE0tr3gI/CEP1N4mDgzAOcGHRQSUsRalsZdkLxG
	xhaU1I5/FJYuoIwr4XHC9xfIcJdHZHcxMpTbdc3szKGGoWDBF4ptUPYYqo2ylkbaAEd5AeQ8PFU
	1lHQoZa8pZVadw==
X-Received: by 2002:a17:90b:5281:b0:39e:4c7f:8b17 with SMTP id 98e67ed59e1d1-39e54cf8bc1mr6408347a91.28.1789738806339;
        Fri, 18 Sep 2026 06:40:06 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e3617443asm13253792a91.9.2026.09.18.06.40.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 06:40:05 -0700 (PDT)
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
Subject: [PATCH 05/15] ASoC: mediatek: mt8192: switch to devm_clk_get_optional()
Date: Fri, 18 Sep 2026 20:39:01 +0700
Message-ID: <20260918133912.133799-6-phucduc.bui@gmail.com>
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

Switch from devm_clk_get() to devm_clk_get_optional() when requesting
clocks, as optional clocks automatically return NULL when not present
instead of requiring manual check and NULL assignment.

Additionally, handle clock errors properly using dev_err_probe() to
propagate error codes (such as -EPROBE_DEFER) on failure instead of
just printing a warning and continuing with NULL pointers.

Fixes: 125ab5d588b0 ("ASoC: mediatek: mt8192: add platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8192/mt8192-afe-clk.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/sound/soc/mediatek/mt8192/mt8192-afe-clk.c b/sound/soc/mediatek/mt8192/mt8192-afe-clk.c
index 77f596cab92d..9b9a3465ddb5 100644
--- a/sound/soc/mediatek/mt8192/mt8192-afe-clk.c
+++ b/sound/soc/mediatek/mt8192/mt8192-afe-clk.c
@@ -672,13 +672,10 @@ int mt8192_init_clock(struct mtk_base_afe *afe)
 		return -ENOMEM;
 
 	for (i = 0; i < CLK_NUM; i++) {
-		afe_priv->clk[i] = devm_clk_get(afe->dev, aud_clks[i]);
-		if (IS_ERR(afe_priv->clk[i])) {
-			dev_warn(afe->dev, "%s devm_clk_get %s fail, ret %ld\n",
-				 __func__,
-				 aud_clks[i], PTR_ERR(afe_priv->clk[i]));
-			afe_priv->clk[i] = NULL;
-		}
+		afe_priv->clk[i] = devm_clk_get_optional(afe->dev, aud_clks[i]);
+		if (IS_ERR(afe_priv->clk[i]))
+			return dev_err_probe(afe->dev, PTR_ERR(afe_priv->clk[i]),
+					     "failed to get clock %s\n", aud_clks[i]);
 	}
 
 	afe_priv->apmixedsys = syscon_regmap_lookup_by_phandle(of_node,
-- 
2.43.0

