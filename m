Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14AA23B42DE
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 05:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789534850; cv=none; b=m8LUtrDr0fEBxPWm5qTMn3DF7Y9itW6BNgvPH2tZF8WD3LQPzvhCH4HMWDNYjd4+yDxdsEgeHEBMG6Rlkj+oRbMU7k2d5Pen5oS405mdjzIAdm1JCzcDeRAc4EzYaOZ0EpXukDhZI75e4wIcZEg+g5mYsQ++v1MKbhhLAlAsOFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789534850; c=relaxed/simple;
	bh=xflv8IXogpKHOiX9yYBSteBDb/dchvBi49QGMB3YIgo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rUtj8NHgcIXqmtBhk76WGTW7sYUaFsqH83qFxKGZXVNFoxuVhmQZ6uxgQAvp7snoVGlZHJ/IPJsTAvrn4iFNcn+5OhmA8KjjCYSIWIThx5Dr+VY0uKVZbJzXJcStk1UXkeXc4loS5Q7MJtSBqcPQVGtcSqiqfJdK4cQlakpCrQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hXXlMkSe; arc=none smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hXXlMkSe"
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-86b90133ae8so345744b3a.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 22:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789534848; x=1790139648; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B/w0mflA4CW2wen443DfpVvqyUW44q6NA3gxSFkvPnM=;
        b=hXXlMkSeqNjqzdA64Mo90qwuIGZo7TQKMtSI/CzP79oMzWvY/uhz3C/1+kr1KljuNy
         qzsi9FquOQ3dJSZruccb5/ftRxDzDNIZPVv/jp9nBdBs6t7bvNCLQt52OTH2RAEIkCM0
         C8JZ9z2mkOdmMiqOQQIIT8Lekeh/yHfGEgbr3N18D3mSLqkMg4bUD3aI4o9VZBSs9yuF
         61xq8OwJNYOJKUx00zXGk4Cg1ktKem7X+11g4qZG8wWCEmOYNqAuybhT3Uov5Es46wr0
         ZbjMrdcDX8+4VXeiY4mgW+4K1xnYpRzrUwzMyolQFPqWIm4nn8NGVBFweytWyS8YqQFl
         S3kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789534848; x=1790139648;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=B/w0mflA4CW2wen443DfpVvqyUW44q6NA3gxSFkvPnM=;
        b=IJeEqjR9kzBMloM0Ns0W1VEQnzJkyhq+3FXXZjLjVOx0Z/e5bSX1sk7xFmFqfWZ/aY
         /lBk2DgQU78bn3t2fLdyyoUrNX+8cd8Eu7W8anagxyvykjVsyEJ1N9Gvgar6hSIbcApk
         oEqK0weM7PhOcG0Meo15WWDjsfJwjTIqCqDgCVz1BN/vxXhNf8GyLoibeEvXOx1UMIA1
         XGpeUkcUmSTWT0cVH4Vpn0cTIMVY3Pi6bdi5UP6uIpc6wzdmEKlMIN9jQKQU8rDPvVp4
         xDX+/2bepiMG4AeNdggqO8kKjt1ulppE/Er7tZYPOzhygJ9PpXPDWtwuSQ24/IsYKcVo
         aFTA==
X-Forwarded-Encrypted: i=1; AKwUvBz1sF4MFypY3R76xXvtfvj2stWzfq0ZNrmWY2GgfR7HWIyg4+frXeJ5Qv7Qtq2bAr5rKr6JwiHxedrUfTo=@vger.kernel.org
X-Gm-Message-State: AFuF++lEtcc4qKkOQ7iYIv6VczQbjob+TCZbuxuJ/C50uD3mx40TOmLw
	usazs8CoHe+1YGDo4BfgnE9R7ZncHvLU6jWQx1CrvHMUUSCjZj+LUm3B
X-Gm-Gg: AYBFou2J3c2+8w6abnKjZC8FVxEfNM4TDLOiXFnrVbKRNyNDYKxkKkOPGg4J60mpP02
	LoJW2gQqkked3zDUNZ9iFiPS4Lb9d3/KNRUQfcWzYNdL1jdvQ4q8Z9J6+LZWPKibJ+7vzeIvE2O
	qhLizwC48idUHKz2PP2OckCyRB7JC5QViDJdVe+BJV/lL+2ftj4RiO2/61xlBUjG2UIvV/5/5j8
	d/Ke2x5ohGUqs4KCnDpLtC1rBJ3k6f8U745OtwNjshwozdIEZQigLmDGsmBhJzHWhPlXoTqXzVl
	Rg69aFhtOpqtqmz4v28SoMYxgJX5f64Ni4p1yY9drZPAGgJ5Pcghjy1Mks1ZhcErAEPRf1EOkie
	chnh+1qs3VHoYC+HguzMaJ3/REwEzliuDZ0dV+cqFOWXsjkmq799cSycmWj7uHctPaLDEYSPaEu
	iAL1Qv39d83czx2/XqmGBAmcOSynt5MgsqAPXY4rRJf4Ie/HqriBGt/0J0jZczV0mKl4pC8Vo4q
	xTK6/V7DuCml2WYRuygayJgmYuxsYE36L/Vc9LBDCLDw5fmZiY6U5SkI3j36vSw1eEd3hqmC6rw
	apbuWQw4j0pY9r0=
X-Received: by 2002:a05:6a00:4185:b0:845:3033:6cb7 with SMTP id d2e1a72fcca58-87236ce44a9mr2291018b3a.9.1789534848308;
        Tue, 15 Sep 2026 22:00:48 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc50abb1776sm850589a12.27.2026.09.15.22.00.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 22:00:47 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Cyril Chao <Cyril.Chao@mediatek.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Dan Carpenter <error27@gmail.com>,
	cassiogabrielcontato@gmail.com,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v3 02/12] ASoC: mediatek: mt8189: Propagate MCK enable errors
Date: Wed, 16 Sep 2026 12:00:09 +0700
Message-ID: <20260916050020.14575-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260916050020.14575-1-phucduc.bui@gmail.com>
References: <20260916050020.14575-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

mt8189_mck_enable() currently returns without restoring the clock
state when setting the clock parent, enabling the divider, or setting
the divider rate fails.

Propagate the error and disable clocks enabled by the function.

Fixes: dc637ffeed6c ("ASoC: mediatek: mt8189: support audio clock control")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v2:
 - Update the names of the goto labels.

 sound/soc/mediatek/mt8189/mt8189-afe-clk.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/sound/soc/mediatek/mt8189/mt8189-afe-clk.c b/sound/soc/mediatek/mt8189/mt8189-afe-clk.c
index f088ccf80448..56362c4756c9 100644
--- a/sound/soc/mediatek/mt8189/mt8189-afe-clk.c
+++ b/sound/soc/mediatek/mt8189/mt8189-afe-clk.c
@@ -639,7 +639,7 @@ int mt8189_mck_enable(struct mtk_base_afe *afe, int mck_id, int rate)
 		ret = mt8189_afe_set_clk_parent(afe, afe_priv->clk[m_sel_id],
 						afe_priv->clk[apll_clk_id]);
 		if (ret)
-			return ret;
+			goto err_disable_m_sel_clk;
 	}
 
 	/* enable div, set rate */
@@ -650,13 +650,21 @@ int mt8189_mck_enable(struct mtk_base_afe *afe, int mck_id, int rate)
 
 	ret = mt8189_afe_enable_clk(afe, afe_priv->clk[div_clk_id]);
 	if (ret)
-		return ret;
+		goto err_disable_m_sel_clk;
 
 	ret = mt8189_afe_set_clk_rate(afe, afe_priv->clk[div_clk_id], rate);
 	if (ret)
-		return ret;
+		goto err_disable_div_clk;
 
 	return 0;
+
+err_disable_div_clk:
+	mt8189_afe_disable_clk(afe, afe_priv->clk[div_clk_id]);
+err_disable_m_sel_clk:
+	if (m_sel_id >= 0)
+		mt8189_afe_disable_clk(afe, afe_priv->clk[m_sel_id]);
+
+	return ret;
 }
 
 int mt8189_mck_disable(struct mtk_base_afe *afe, int mck_id)
-- 
2.43.0

