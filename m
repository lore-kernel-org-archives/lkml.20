Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEDF43BCD2C
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 05:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789534873; cv=none; b=rNMCkTYEGUAsS2thOllujZW+5adnZ3mvf5sfieQTKoVzgj2YaWRU0CTfTqWkEbeKm97EmeA7TEwLPSHxBPRh9G4MPU1K1jOSoiMGwlead59WhMgANobBolA4CcQPJ6UVbYVAZSoTX936vo8SLDKfvgu6nmOzetkkpCpN1TcNkSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789534873; c=relaxed/simple;
	bh=oeRk0bBJFuLJzLGlSEPoNXPBNRImrcUF+YBmLpWZ/7g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SzYuUn4ET/we/L6qsRzGEgmXIpMjXvGORqLhIA5B2L8C7yIU9OmKt/9/Is8TDxeXJNuU1avFByIg9alNI1oabEJ1/lj6q0RpH/lnSq+p/+RVgAVXhm7MuUN7HEj6Z6PrMa/Gavymb6PG7kE/yusW1h/fG8FDOAj77C+isVAI18o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JyutKMBE; arc=none smtp.client-ip=74.125.228.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JyutKMBE"
Received: by mail-pz2-f41.google.com with SMTP id d2e1a72fcca58-8631d0023daso304392b3a.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 22:01:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789534871; x=1790139671; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jypTF/RLwAzXcjo5Lv+S1qv5niAwH9zwffT+/LnOWho=;
        b=JyutKMBE1IplCDxf2sfvqFIiQLquB0N7xV4LACqJTW4+TrsEf9jTfcvuA7bOlNySmB
         lhPduOqWfNqGNsKH0yI8tb/ZUcjLvezg3gYXpML42C+NwrsxCr4FTIm3gKsTYs7sSPsz
         sJN0viNjS2TMFSbFOxXY5qyrqBy8J2o5fa1UteVx+cyXIFgUy8B+tVuEnVc0kqWkLlHJ
         tC/wk0FOzAvb4RGfXEzfCOBfrO96ccjflvI7/5YFueRnk30UTl7zmeFrn4DTkO69DuWm
         R6jwGZWqQWcyaBMwuYuHHLGT1ZfafuvzJSwbP1Xk8/QSlHIEuQ7BkrrvuTznS7aMG549
         +zJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789534871; x=1790139671;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jypTF/RLwAzXcjo5Lv+S1qv5niAwH9zwffT+/LnOWho=;
        b=y/ba5rW5hqD6Q/YnvUagbaifodhY5bVAbpw8rI/MrmxYZYnqwfy/bCHEinAqd3nhmV
         YL3IdWTNl7c9uknRHVnjAUDuUOZrZ4dmwpNtizmJKcdLThoa9pQLWkRlCiwflTC2XnGV
         FbnPzRSk0u3TxjQz0XqrxZOKnqJBzUDDEO2mZwwIIYWLO9Xu7SftWM0KRKFcJdrKqtUg
         7/NfmzUbjwjBJmYMOpOCNQGDCkBF530EWo8I3Ig5wMmupC3J4Mg7ixUL0G8TpqQWmO/a
         nqRyQ1lhLWtQRI9RUHts3wU8nvMwEoEOnxU4hA8a7m7ShpWKG3uwq1litHU58O1kTe7/
         MhpQ==
X-Forwarded-Encrypted: i=1; AKwUvBzBYrdPR4ukuxeXuPAxLVL/el1hdUY8MRWIYkX4qT4uFvPpBI/Rss4c1ufWs5sQIVl6q84sCfKSh7Z54cw=@vger.kernel.org
X-Gm-Message-State: AFuF++lGUV+23hAhOF0YI6n4Az99yiTMkIk5/ecaGgPnESADkOPUu0DF
	/DtPh9CuatD+KVZs3LuNQ0QfajsoOa4mnNOoUM0qeUdClCQxlMtPWMIR
X-Gm-Gg: AYBFou2c5WMXGt7TUsGsUJrMqnA1qBPwtsoKxkDu1mpyB+UBQ+M/uF2aO/XXaiogLPH
	zj99J6DOvjBQwZUxbTe0JIgB8941LlpY03Q2LZ8Xbo62fvHLBWEFDy7DEYudcH54UOVj/JAooT3
	9OQkysGvIyvqqun7O2QH/HhpnqpnzuzeR7x/LK4/9efB+ZR+Ep4aXALudou3zRQxilggQxoLw3y
	nmRcESfAzidJE5V/OfGOQVBl3dPBakksaUBCpE6gYr9u2NdbMcMwLPifAp/JTd6NnCnW8jktrW2
	we6oqfYF2qRo67v500Ho9EGZyu72tuNvvWrhzFbzJFiOOUdi+rDWalH6syhUC0HS5ru5V74KSyI
	72Bu/h3/XelgBHEBMS6pHhcnkjRCeDOqDndq1QPzhOqS1AlaXkyGUxU+iGiAP656ufj7uF7g7FN
	lEsM7kGtJfpPIKKElcw7jE0Ikp/1oXNwXmAr9728IQZnKIsh5pCqKERxmBWWHWwwbBT5eg5BfRK
	2jRxdUnAbSPc1D1aXDztWtPJkx35FSOlBTtbK9vXimYS5Rs+ulB5fqqCq05vcpqz4IG/pbTxnjY
	M6i6Qor9O3CHaYk=
X-Received: by 2002:a05:6a20:4307:b0:3dd:5844:c95e with SMTP id adf61e73a8af0-3dd5f7b07ebmr2753489637.27.1789534870897;
        Tue, 15 Sep 2026 22:01:10 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc50abb1776sm850589a12.27.2026.09.15.22.01.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 22:01:10 -0700 (PDT)
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
Subject: [PATCH v3 06/12] ASoC: mediatek: mt8189: Propagate runtime resume errors
Date: Wed, 16 Sep 2026 12:00:13 +0700
Message-ID: <20260916050020.14575-7-phucduc.bui@gmail.com>
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

mt8189_afe_runtime_resume() currently ignores errors from regmap
operations and mt8189_afe_enable_main_clock().

Propagate these errors and clean up the state before returning the
error.

Fixes: 7eb153585598 ("ASoC: mediatek: mt8189: add platform driver")
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v2:
 - Update the names of the goto labels.
Changes in v3:
 - Add Angelo's Reviewed-by tag.
 - Restore the existing afe->regmap checks.

 sound/soc/mediatek/mt8189/mt8189-afe-pcm.c | 32 ++++++++++++++++++----
 1 file changed, 26 insertions(+), 6 deletions(-)

diff --git a/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c b/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c
index 77cf2b604f6c..39cc2804ad4c 100644
--- a/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c
+++ b/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c
@@ -2332,20 +2332,40 @@ static int mt8189_afe_runtime_resume(struct device *dev)
 	}
 
 	regcache_cache_only(afe->regmap, false);
-	regcache_sync(afe->regmap);
+	ret = regcache_sync(afe->regmap);
+	if (ret)
+		goto err_set_cache_only;
 
 	/* set audio 26M request */
-	regmap_update_bits(afe->regmap, AFE_SPM_CONTROL_REQ, 0x1, 0x1);
-	regmap_update_bits(afe->regmap, AFE_CBIP_CFG0, 0x1, 0x1);
+	ret = regmap_update_bits(afe->regmap, AFE_SPM_CONTROL_REQ, 0x1, 0x1);
+	if (ret)
+		goto err_set_cache_only;
+
+	ret = regmap_update_bits(afe->regmap, AFE_CBIP_CFG0, 0x1, 0x1);
+	if (ret)
+		goto err_clear_26m_req;
 
 	/* force cpu use 8_24 format when writing 32bit data */
-	regmap_update_bits(afe->regmap, AFE_MEMIF_CON0,
-			   CPU_HD_ALIGN_MASK_SFT, 0 << CPU_HD_ALIGN_SFT);
+	ret = regmap_update_bits(afe->regmap, AFE_MEMIF_CON0,
+				 CPU_HD_ALIGN_MASK_SFT, 0 << CPU_HD_ALIGN_SFT);
+	if (ret)
+		goto err_clear_26m_req;
 
 	/* enable AFE */
-	mt8189_afe_enable_main_clock(afe);
+	ret = mt8189_afe_enable_main_clock(afe);
+	if (ret)
+		goto err_clear_26m_req;
 
 	return 0;
+
+err_clear_26m_req:
+	regmap_update_bits(afe->regmap,
+			   AFE_SPM_CONTROL_REQ, 0x1, 0x0);
+err_set_cache_only:
+	regcache_cache_only(afe->regmap, true);
+	mt8189_afe_disable_reg_rw_clk(afe);
+
+	return ret;
 }
 
 static int mt8189_afe_component_probe(struct snd_soc_component *component)
-- 
2.43.0

