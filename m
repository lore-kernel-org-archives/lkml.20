Received: from mail-pj2-f40.google.com (mail-pj2-f40.google.com [74.125.227.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AABEF40EB80
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 06:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790662351; cv=none; b=JaDt7fbOW+/G3d7D5TybJaDwbGjCbnywW94IDzBoNbpqcFBasnb6H4NRB31CDxGYiGmZa9OdwG7ujI47qdKzJZt2dJY0Y85I87fcnz6Yl+zmQ1I8VfASkVZVmFxN0U4SCQoPjc0WlK7g4UeElo7a1fv/3/AWOEiRrDJPVyfmPHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790662351; c=relaxed/simple;
	bh=ICRPRat5nDAnR0mTCgPDNQqSXwR41U4D6Unqy/wk6q8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gaB4GWBL2SiNMG4LKE08tSZQgl7GNT9Ksp4ZFO+8T5roN5qBfwvWw0OLsVCmJ68Cg/c31tBzQKK53gIcNLxw0BFTggD6KJUebwXBYLsAUZCkTPzYTVV05OZPj8wEExHvPk+3BPBjaO+e0iFzoAHQmemfnbMQTq/eikKmIScocW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fMMbbBWB; arc=none smtp.client-ip=74.125.227.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fMMbbBWB"
Received: by mail-pj2-f40.google.com with SMTP id 98e67ed59e1d1-3a0eeda3e03so1223759a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 23:12:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790662350; x=1791267150; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o1ihgfA2Xx/YQxYVKmUYf4V9Nz+OYG4xbe0ZFsfUP2g=;
        b=fMMbbBWBdf/kLOvvDKouYZi3OhLwC7K0sK7kVb1IyFD7gx01WCD0SW+Mxyy/dQJ6Dk
         bvj1nvPBN94W0jZiaQUVDWx5oNs4SUsqJJ7rClwtxbSFpSDcwR6Tg7a/HtJTHt//F7gU
         oixjdqnE2rsgZZEnsdAk+rR+VCVzFsJE5uUz5telIlRNTyomjG4yOxjKuleU9asuufyO
         2W3d/Qy0wZZEq1P/MxI6U4wHnJFn8YLenVaZnGwuUvRas7EUIFP1zLEuaT580KPuMsha
         bx4i9PV39iLf1Lqh9crjJWclH0Z25QGUv2mj5/rp4LmpCOaneNS/Bycnh6P+hh+fv9BX
         ebmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790662350; x=1791267150;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=o1ihgfA2Xx/YQxYVKmUYf4V9Nz+OYG4xbe0ZFsfUP2g=;
        b=J+KwDwpWMASUVjG46+7Gq2pp7Bi/i1sQC56+nM+o271l0eCCyVhVJlkGPimlVlUUOU
         7nG82dVofVUIwktTiQUJ6GGDCDbzR+hi+j/hj2C7K6EfYwWZ1am7wp09T6ASrbWpjmqM
         7F3yJaw+8xQjw01uA7jR+DW6+6DAioJwIdDCXqXoCoHFi5W/E0ZZIrlMIjMqpF8GwRxK
         tcIIuPJM/5C4KxOal62oZArhnIXgQ6ZJHHAesUHyTQR5nMyNvioIfuUPuFFyIy0kLpS5
         QtPJGwmjWCpOPo0UbE0HK591mfc33z1RvFjKv2STpU0C04O54EeaKTydHtw9AH6ZHYGX
         YR4g==
X-Forwarded-Encrypted: i=1; AKwUvBwMZLZ0+5aUvmrI4jQtPthgxr9J2upRZxfz8Sni+XdNeyRbqeWSa/FVoZ8EfPfPczPvi0G1pCBISsH7PNk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJVGivqbjCZEtOK6LrtJcuqAIZcGMc9bBfVPGN4oYy5K3GCWVYc
	yibj04e3Q9mmlvYEfMQrq23uwZsTv3+RCqCmix/jRboLptGOPdugZRsE
X-Gm-Gg: AYBFou0Xo4DCf09NJNlAu7ukxYoWQpgMvB0VoBTatd2DetTHIeNlub2gPnsrg40/lTr
	3okqzu9gOjQFh64cDx/8Ew8jNCKp+q7qRiucQIfCj498dUlJLfxskGdnR6noTrTQpuQbECNJVnC
	PxJ0QwuMv2A8UKZhmPMip3n6MASW3fw8qUR6JUwcbQ05uI4aN+Vorwa8kOEbL/ZXZJ8J21EWzPx
	aYX/cKD2lmhha6KIrr3rOb2JVV602COaf+bEeoox4+GW+iTu0PCgvl29nV3UpDIY+72LufxTNol
	+pojn2KU7MwjEJNPBD5p8+rgK9xFh7Bp/GLKuLOUO4swXtfLvVzmwo51N+jF0vl7zI/tzF6ii68
	wJGhGpBu//sMJdlRbM3MPA/gXN4GpjrK1ZoLMGPPmOt2X3hwmWmJHn0gOxZ8QOMK3CU3lwNbiTF
	bWEldjRlXfPygU8neueS9/ppopIQ5cNOwBkwLVubl17tKC/6U3M1AtF1PCNhTERNVptavwUKPUE
	nvnwiTPYNuB9HcwEb9j9LOZc1uzJ888V7E2ARw+H6KNPhZQaiiFtQujHtxkRmfcD21a+DJlKVRB
	CGi1e4cz9ce31g==
X-Received: by 2002:a17:90b:3c0d:b0:3a4:6ff5:778 with SMTP id 98e67ed59e1d1-3a46ff510efmr2033501a91.44.1790662349906;
        Mon, 28 Sep 2026 23:12:29 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a498726d63sm3280965a91.17.2026.09.28.23.12.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 23:12:29 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Darren Ye <darren.ye@mediatek.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	cassiogabrielcontato@gmail.com,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Cyril Chao <Cyril.Chao@mediatek.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 07/10] ASoC: mediatek: mt8196: fix runtime resume error handling
Date: Tue, 29 Sep 2026 13:11:18 +0700
Message-ID: <20260929061121.124001-8-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260929061121.124001-1-phucduc.bui@gmail.com>
References: <20260929061121.124001-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Propagate errors from regcache_sync() and main clock enable operations
instead of ignoring them.

On failure, restore cache-only mode, disable register access clocks, and
clear the 26M clock request as needed to clean up the runtime resume
state.

Fixes: 7384ecab34eb ("ASoC: mediatek: mt8196: support audio clock control")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8196/mt8196-afe-pcm.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/sound/soc/mediatek/mt8196/mt8196-afe-pcm.c b/sound/soc/mediatek/mt8196/mt8196-afe-pcm.c
index dcee037991aa..9888812cd993 100644
--- a/sound/soc/mediatek/mt8196/mt8196-afe-pcm.c
+++ b/sound/soc/mediatek/mt8196/mt8196-afe-pcm.c
@@ -2211,7 +2211,7 @@ static int mt8196_afe_runtime_suspend(struct device *dev)
 static int mt8196_afe_runtime_resume(struct device *dev)
 {
 	struct mtk_base_afe *afe = dev_get_drvdata(dev);
-	int ret = 0;
+	int ret;
 
 	ret = mt8196_afe_enable_reg_rw_clk(afe);
 	if (ret)
@@ -2222,7 +2222,9 @@ static int mt8196_afe_runtime_resume(struct device *dev)
 		goto skip_regmap;
 	}
 	regcache_cache_only(afe->regmap, false);
-	regcache_sync(afe->regmap);
+	ret = regcache_sync(afe->regmap);
+	if (ret)
+		goto err_set_cache_only;
 
 	/* set audio 26M request */
 	regmap_update_bits(afe->regmap, AFE_SPM_CONTROL_REQ, 0x1, 0x1);
@@ -2233,10 +2235,20 @@ static int mt8196_afe_runtime_resume(struct device *dev)
 			   CPU_HD_ALIGN_MASK_SFT, 0 << CPU_HD_ALIGN_SFT);
 
 	/* enable AFE */
-	mt8196_afe_enable_main_clock(afe);
+	ret = mt8196_afe_enable_main_clock(afe);
+	if (ret)
+		goto err_reset_26m_req;
 
 skip_regmap:
 	return 0;
+
+err_reset_26m_req:
+	regmap_update_bits(afe->regmap, AFE_SPM_CONTROL_REQ, 0x1, 0x0);
+err_set_cache_only:
+	regcache_cache_only(afe->regmap, true);
+	mt8196_afe_disable_reg_rw_clk(afe);
+
+	return ret;
 }
 
 static int mt8196_afe_component_probe(struct snd_soc_component *component)
-- 
2.43.0

