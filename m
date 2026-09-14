Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6F9C3E7BB0
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789370970; cv=none; b=CQ817B+SxIcbpZ/kz6lKijCJijfMtzdE2oBLg3V5kEVw8+fUPMh4djGRn8q/10eea1D+rxsw4+TU3E/34qBLJfp4vyeuytNFDTj2GkVBJ8vtVYy+ZpwwtngPk2cOQMIM5tlxVbPkijnLRqkAx+iz0XKQ/79iHxDT9U6EPh6romg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789370970; c=relaxed/simple;
	bh=XdoVnpTfZ+t+DnQW8QFaf+eY9aunqbEVCAkCrXvXkyM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EElahu0lVi/M+dX1T6Y0i/K0aq1xW4lSE9Ml8dGFgxd4Drv1x9N6fVrVT3Y+FXU/AJ/d8XGvm+boY/m0Y7/y9HU5NcEVYvyI6cmXQruxL3pseWFjznGzt+yDc8MndrFRgPNoHSegFQmz9CVUI1+y0dg5zQi2xYJ9JKTnq0Lj7cQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fam3d2qp; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fam3d2qp"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2dd020a2e44so26861755ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 00:29:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789370968; x=1789975768; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vZhy1gvzxv4nnqK22Id8tWzLP/pMb4kmGE3X33hanlU=;
        b=fam3d2qpLxSnjJqE5X47XnnY3H81BhxacDz6g0sR8wMsGVc4y3XH4hjnIqZ0VpqWFm
         UG/DwogMvVhoUvNtC79dhodkhhSEyvFKVEb/ipv3rLMSeW2KZXnq7vgcKMW9qaprc+ln
         NpM8hFqLS3xxtUVeVU2oTICZ7YTpgxuJVygGGrw2k/2KydqUnnM1p1TuNFFf2DW1sUQj
         XqbfxiI3+fFScgt1I3I8U7vZujB4+/GpGVsxRua8YU/Ic/A2nSQjrdMnIqHsqiR4GFBS
         wnfONIp7JW4NedvmAdVnHhkRTHD3uKmLd1kJN84NcRxC9p4pkpvTyfxdfcbean2rcVg3
         Yxyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789370968; x=1789975768;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vZhy1gvzxv4nnqK22Id8tWzLP/pMb4kmGE3X33hanlU=;
        b=YUWIeTsUS1cGGkcavpn1R8jMyuxprVU+vzgLibXZ56WtjFaZpwczplIr3v6G5ROYHM
         nCKG+FIQJQW9tzCnKj78xwJIHMN/tR2SR4zbM9dKEA8+xvekLiGJwFK54BjJG+mqoJ64
         QUEPNPsjb6MsJuO22fyzNHUtyg0m1QKiwqCDxW0vEvJ1Al6EVj6gpePRC8OMzMkx50GB
         Qmuyf4TZGUyHsPy7clV3voEDpNU0r9lzvmd/gLS4xCmRRLAh6IKWmf17EGygXFshIRwK
         N7OPs6hAc9plyZbSGzx945gbS1/HrI2fS2Opj71vMVvufZgYfz2tL71tKWGzwy/t714w
         RhQQ==
X-Forwarded-Encrypted: i=1; AKwUvByPzHj+znTGRjxahrAZatR5r5YEnOwThwVbDHaMqGZVZCjZxuxcyjpwPZzvQXGHHfvkjCAlBWAPwHgoA2E=@vger.kernel.org
X-Gm-Message-State: AFuF++nWDcPvllHHYPFNCTH1fYILEPF9PbEKAeTfgreDCDVe9YaFeWs2
	bEOZYFpEhrJBWO+1k+mLODJIyRAP2L+rTn086Uew+qgpTQ2ybb077ANW
X-Gm-Gg: AYBFou07gUtPZsOEo2vc8jhTBXlMh/AH/V0lFeUHgRArnYgRtjNxyhIcMDDNhzIFkXp
	R9c1zhKznBdjGFHI12MQelKjHZusSQBOcSgcmHU7/hNMeaVv9+2lwkvp6T8pWdie3yNMcyapiU+
	z47QEHiVV2Z8RuBq4LCXZecIZEvT/DMkdnjSdfQu1OF6cTJHsyvRiJYgwSqq/JoOa+O4OSVjw/C
	bhg+0qBJfCM9yfBHwmQD+Q72K4Wv++S5svJjLFPl2z2G7BeRiBnC13WxIZ70DnOYTZQiQS4Lllk
	1xANi2MyzweHxl64ZDH9S+kDAq1MJLXs4NvzRjg5GuoeFEFbI/dubqpu6iBv1QtFxiMHp6gWZ/E
	KhJFpVa48b6AtKzVk7eOlDUP+J9A8gZJNEC5LhNdX8oY5xCjdpEhASIbbGhbtFL//9ta4DCpagR
	27SfSxKbp37We107WpQvW7mclJF5zcXwN7ODjNn2Fs5IhwmVgVQGo+rL/HJbQOVqUryFawZfCSX
	NORcWH8Pa5Top5PnifJBOEiXWpjosbLgXiZgYyRdMv2snZGAIcwEGq+bsToGdqhMMszcFG0TeZu
	EFRlsPdf02JDm/c=
X-Received: by 2002:a17:90a:d008:b0:39d:f5b1:e35f with SMTP id 98e67ed59e1d1-39df5b1e456mr82384a91.25.1789370968111;
        Mon, 14 Sep 2026 00:29:28 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d957131f9sm19598245a91.12.2026.09.14.00.29.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:29:27 -0700 (PDT)
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
Subject: [PATCH v2 07/13] ASoC: mediatek: mt8189: Propagate runtime resume errors
Date: Mon, 14 Sep 2026 14:28:36 +0700
Message-ID: <20260914072842.24420-8-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260914072842.24420-1-phucduc.bui@gmail.com>
References: <20260914072842.24420-1-phucduc.bui@gmail.com>
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
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v2:
 - Update the names of the goto labels.

 sound/soc/mediatek/mt8189/mt8189-afe-pcm.c | 36 +++++++++++++++++-----
 1 file changed, 29 insertions(+), 7 deletions(-)

diff --git a/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c b/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c
index 77cf2b604f6c..67fa40afdefa 100644
--- a/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c
+++ b/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c
@@ -2328,24 +2328,46 @@ static int mt8189_afe_runtime_resume(struct device *dev)
 
 	if (!afe->regmap) {
 		dev_warn(afe->dev, "skip regmap\n");
-		return 0;
+		ret = -EINVAL;
+		goto err_disable_reg_rw_clk;
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
+err_disable_reg_rw_clk:
+	mt8189_afe_disable_reg_rw_clk(afe);
+
+	return ret;
 }
 
 static int mt8189_afe_component_probe(struct snd_soc_component *component)
-- 
2.43.0

