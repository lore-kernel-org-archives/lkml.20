Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21A813B442B
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 05:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789534867; cv=none; b=g6UzQ5Zn8rTNrK7T6JqOUAWwn080f1Ox4SQsK7tQkwUPIcspQPPScnJkIogR7o+khM9v05+nCLd6FFVKyi9CgP1loT7aYqiyHmnEvPJ3wJnYRtsriGb/7HxOCPiCPI9RAboFDp79tKdh6wqKwPY0ofmksn6ZFGm+zJ6STwMOdyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789534867; c=relaxed/simple;
	bh=sl/gIEyH51hHq7ahCeZqum/kQo2BHWlJjw6te8rTW7s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TuzA+Xc5UqpI5sBZaQwgivohas84ca6B7xsTNm5+L0zOGGZNe2UnuJDGa8TteJZU1zM5MfmRu1GjNJvy1ndBmNRwUt2F6/P3pfaXsuqg6KQalXREWI9nirPwITsrI6nLfzC4FuCxKWqQNOMXtzAbqwNiXYZ7SJ+EkZnHae1RxpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZtvZObVm; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZtvZObVm"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-85469b35611so308923b3a.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 22:01:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789534866; x=1790139666; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cdugvJNqgU6E7j1wDJGENADgIVNNhusm8dqwAWIMj0U=;
        b=ZtvZObVmzjTaSITqdNS3iK2RHjMhrg+AoyzbwZ1K+myRokdt4j+nJnDoBARQLxq1oq
         yVgNUG1+zKrdzUVjVS7cUKGbAHzkxVk1+9on8lYowASlzWVjdYZbthQ+YFA2uBaOejLk
         lblULpixCktilqSrQ62JfSdONgM+OPFej65BAWjXy0ybgtigz6qcWcfzquYPk9ihGbLS
         1YMTcFVBTdDJn27o9HzcBBKzpxoONqaFMdP7LJ6OF/CBjNx1iVqmmap4xNV2XKp8Ragm
         Ox5141jWwN9Q58GjuFvgq1VdbkvRo5L6n2QnYKQdSq3oYLL32oaLbgjHR3CQlNYBXWse
         S5ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789534866; x=1790139666;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cdugvJNqgU6E7j1wDJGENADgIVNNhusm8dqwAWIMj0U=;
        b=KgYRQOEmPIHO7qzzuO1PDvLhZPCjRvjZSdf6FQrA11O3MOVtcweELiXlmAoLYuFtao
         XbNjY8bXboWZ5ZU5JHabl/szd9MRpP8WDsJHCDlr6sJ0fiUO7N4nvh3ifStD/ORb/odO
         E1iao0YWKqzS/7cah7lwIRA28AEi9dvQEzdGB8YgE2t128o1RHyfI0pQFzyFj+nGrTep
         qpud4z0EuNDcxaMZMuUcbEO2xssDWYWXg2b6JMGE1FnvckaOgw2DMLQfVC9feC9Sa6QZ
         OMAdc9YuN95KOCt4VhcCqRDGYAYoue+3A2xlnBJaFZcTSw1ToQk18Qqn7Wbs4Hh83EZs
         qJfA==
X-Forwarded-Encrypted: i=1; AKwUvBzSJ6RKneRDj0PE3vYGIEMOrEwkrE2xDvHjM9Pd4zM1uIt3ONKEUNRKWR6m2aNqNUD/5pp1d4PvlhLLZkA=@vger.kernel.org
X-Gm-Message-State: AFuF++nK3K5pQtzxwT/EARdJf0yadnU+ThrKY/d9xLNANVahB1lY6ir0
	0djvAjVB6HWYJEM9q+EimNXVDa3v6UspClDhtgVAqOvkJPbQ1Lw+L6WE
X-Gm-Gg: AYBFou058rQhOY4dtUOBig3o5LcaoUc8lP5UHNUxtRKfy3rX5QoBe1s9RG22bKjYDC1
	v77h/gnDtTFPalw0ivKnNoWpEC/P25j7IyX6yhMs613YQ3+AIygpPjGNbR5Rz+wHdv/0oBDEAyJ
	t/BRXXgWYzpA6ZgXjCVPaSj2ppwqsu+yY1iQIwwJm6gLbXgjcCYP5nssWxpIUZmhxS938MjsgGi
	S+Y1CvUIDA9cjopJBsEcfH4RuGCguQjwqT1qBCudVVvrkKTJlmlWi85C1/D8dHA1KE0xpg9TC+q
	t6vCOo290hJdiCP9H6ufceHvcwEbuts7ucITOEFqfSGOuhnIKmrxzSheuFMrB1G968AhBhXyEEK
	9RdzNQF3l3LvVmZ6oPwLU+MKtslggMceggb1kr5znwHP4NhRsjJZQeSP2Xexcpx5nAYl7g3TU4L
	jKbMM9y/6E1gnqzaCUIfybyFi45dVWdLWvTbClMZKaW/rwQvy92Tr9E8vht4ekd7Lb/vq2P33MO
	Mrk3tnCK/qG2b01+4OZf83Jt1TArVc5QLLbqrn6hJ9YXIY4fIfXr7BbwNhQlKq8TrtszWQDJRZn
	KJSMl5xQU6C/swk=
X-Received: by 2002:a05:6a20:918e:b0:3d3:b00a:7082 with SMTP id adf61e73a8af0-3dd5f7b25d9mr2952258637.28.1789534865531;
        Tue, 15 Sep 2026 22:01:05 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc50abb1776sm850589a12.27.2026.09.15.22.01.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 22:01:04 -0700 (PDT)
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
Subject: [PATCH v3 05/12] ASoC: mediatek: mt8189: Use dev_err_probe() for clock errors
Date: Wed, 16 Sep 2026 12:00:12 +0700
Message-ID: <20260916050020.14575-6-phucduc.bui@gmail.com>
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

Use dev_err_probe() when obtaining clocks to avoid redundant error
messages, particularly for probe deferral.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v3:
 - Add Angelo's Reviewed-by tag.

 sound/soc/mediatek/mt8189/mt8189-afe-clk.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/sound/soc/mediatek/mt8189/mt8189-afe-clk.c b/sound/soc/mediatek/mt8189/mt8189-afe-clk.c
index 1132c924158d..594c214fa697 100644
--- a/sound/soc/mediatek/mt8189/mt8189-afe-clk.c
+++ b/sound/soc/mediatek/mt8189/mt8189-afe-clk.c
@@ -793,10 +793,9 @@ int mt8189_init_clock(struct mtk_base_afe *afe)
 
 	for (i = 0; i < MT8189_CLK_NUM; i++) {
 		afe_priv->clk[i] = devm_clk_get(afe->dev, aud_clks[i]);
-		if (IS_ERR(afe_priv->clk[i])) {
-			dev_err(afe->dev, "devm_clk_get %s fail\n", aud_clks[i]);
-			return PTR_ERR(afe_priv->clk[i]);
-		}
+		if (IS_ERR(afe_priv->clk[i]))
+			return dev_err_probe(afe->dev, PTR_ERR(afe_priv->clk[i]),
+					     "failed to get clock %s\n", aud_clks[i]);
 	}
 
 	ret = mt8189_afe_disable_apll(afe);
-- 
2.43.0

