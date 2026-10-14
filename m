Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ED694F7CDE
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 11:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791977371; cv=none; b=XubwEl04s/0OUNsOAb55QHixiIvIoFjHMVqAwrmC7jiZs5IqTnHMrbsRnTlYttAmnWjf9BhQvAFmrgl2gJ4xNEAqqer9YOFRNLwlAtVrXAcCvr7dldtgcKmHxe0o4DSkLHwyFRdA44hbsJ9eg1fZ2eUHiv+1+pl1jzziKzYEzKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791977371; c=relaxed/simple;
	bh=YFn/Uj3mpq3VOwSfjXjRt1zNxxCR3NBjVgF9SpAqAXs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TBo2vcUPt2xjaDB7n87JVgpdMQqKCKlIbNZxEaVqo57/cuiXT2oWhcSGnPMOfNmrZ59khzrAKy0ZhDnK0K6q9S0+uQygsI5lC4iEbyjOgKcWMskUrvj8NPsUZ7qBig3MznQ0KFMTd0lK8dVsyQ45y2JxRRBSu3z9w3TiRhlKh1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CEl9GlXV; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CEl9GlXV"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-398a4dcf289so2094906a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 04:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791977370; x=1792582170; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wf0tXzvtZuJlGGLGeU2mU+ZL2tYD6FeowFtUppIfdlw=;
        b=CEl9GlXVJpx3BOvOvU5bDd4O5zzuPS3yQyyqjepzzFI6fMK8ctKiHxiTVG2RDBZUNJ
         +CBIVETkbzjbq+F64eO6fDikemDOc4DuaUEVeG9Jea0+G0NOQLbFdFX45eCgT/7W+U0r
         RPAauXjJJdouIvL3HxKvfwo6t3Y/l08XoUdNK3kwQmPtg538fBy5Qmj+En4SvY2BZMyG
         e2gkI9qq42mrROmVbuO76kmh8xx6cvsKVThUOC6FaQCqi2W5udCDV3zyq84pplR2upDo
         397GA50FgZ7kmglEajtTB61QNBTUhwGu30/qVG2PwQ0gxnqCUtu0QMCG0IML/IEeRE4B
         ZpUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791977370; x=1792582170;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wf0tXzvtZuJlGGLGeU2mU+ZL2tYD6FeowFtUppIfdlw=;
        b=QlFomVd3pS59qSa74Ht0zMWe0UaiIg/C+uRhLlsYJ7WRBoRNiFROqaaPcabMhzJ292
         5dyU3+PUU9nC/OqlQ8IpWypTAh/bPgP/YypScvXUagEx3FK7sG06auz7QYaXnjJ0ahg/
         XP97JVJq9BaEJEqewL/QYfdMfs1nQ10qeblDBmiy9mx+rQIpM9RTCbWs4bGWVpsG+EHy
         4ykRJL4GwMVlGbCzg8Cj+vBByfsThNc+tArvKM+lPuw5NmVuTH7/RaF6IzVP8qslKLja
         gRNv/hz9gUYbqJ4pSyHOz2VILRrYZ+YH6ou1kJ+u3bq5V3IlFZXLycnDYZ1hdms6DDsX
         lKEg==
X-Forwarded-Encrypted: i=1; AKwUvBxxWRyBEBGnxgfNGmDTtGJQLo2QM6ngThmEeNfeGHHCcf+mQKjC3TuAnmWZoqwYjiKn9ZuE0oJOxpnHaTQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYK9uRQTk9eCFYiNOZP6p2BMLbBR/RuMGQJHvmCf8wHTWgkyEpjX
	1RRv4UXsbziBqVn67mHephlVzKWDjeVJ7rvllU+DS55l2zOS0iJd6JST
X-Gm-Gg: AYBFou3p5L5Ybw0z1bzk01IpFdQpGkczJlXPw2p4H2ERymsVSF2LUM7gjDiuUAoQ6lB
	DzqcpCVn/vl3rU+tu/NE8U4Dd8VjvXhpeD2U0qsRAE42NlYE7+hgjM5THkK68c7e+m2PiUiQAUD
	QdiiD9xMEUgxhsG6PZ4eiGorRjZovYtWUgEEKtcS8x93kHKxMk4XdJ2RL4tfIqlyTkUWb5PdlB5
	IOJWBqwVd/xlCx5nUfOm5mXVNm7xkyuTMMPJI6XzMAxkd8RH+fSeoMU3cc0wprjCHbvUwtEt/dm
	IOFLa1vjdNyTHjDcltIH0gDxMMNmvpeIZYxaDsO+nnbeR0XO4ceD1NnqzIludLGwUL/h89KD7fH
	jqzXHHrqIu/JeUq9pilbFIwJxqpok0atwadSp/wHX4TUNSXLqtiGHkKddLx5MzWESwm/4Pu7ZHe
	S/i7bsmmfSmxsIxEJREiDZgyWrUg965DZnSYSW/+HlY3LLx+Wf/KeEI77l6vniCIfjmlD62NMiE
	2Gccq3xLufvAHs0GfpE3+YEnbPely3J4bGSglmCm2rBvbzS5R24yjnRQWxLhuMy8PDcKj5QNowx
	lyfhB6S+F61YaA==
X-Received: by 2002:a17:90a:d2c7:b0:3a8:13d6:f740 with SMTP id 98e67ed59e1d1-3ab3a99aa95mr13309248a91.22.1791977369735;
        Wed, 14 Oct 2026 04:29:29 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac61171feesm4077076a91.17.2026.10.14.04.29.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 04:29:28 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Trevor Wu <trevor.wu@mediatek.com>,
	Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
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
Subject: [PATCH v3 13/16] ASoC: mediatek: mt8195: Fix ETDM startup error handling
Date: Wed, 14 Oct 2026 18:27:48 +0700
Message-ID: <20261014112752.683032-14-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261014112752.683032-1-phucduc.bui@gmail.com>
References: <20261014112752.683032-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Check and propagate errors when enabling the ETDM MCLK and clock
gates during startup.

If enabling a clock fails, disable the clocks that were already
enabled to keep the clock state balanced.

Fixes: 1de9a54acafb ("ASoC: mediatek: mt8195: support etdm in platform driver")
Reviewed-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8195/mt8195-dai-etdm.c | 50 ++++++++++++++++-----
 1 file changed, 40 insertions(+), 10 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c b/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
index fba51c552eec..1270fcac6b3f 100644
--- a/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
+++ b/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
@@ -1575,36 +1575,66 @@ static int mtk_dai_etdm_startup(struct snd_pcm_substream *substream,
 	int cg_id;
 	int mst_dai_id;
 	int slv_dai_id;
-	int i;
+	int i, ret;
 
 	if (is_cowork_mode(dai)) {
 		mst_dai_id = get_etdm_cowork_master_id(dai);
 		if (!mt8195_afe_etdm_is_valid(mst_dai_id))
 			return -EINVAL;
 
-		mtk_dai_etdm_enable_mclk(afe, mst_dai_id);
+		ret = mtk_dai_etdm_enable_mclk(afe, mst_dai_id);
+		if (ret)
+			return ret;
 		cg_id = mtk_dai_etdm_get_cg_id_by_dai_id(mst_dai_id);
-		if (cg_id >= 0)
-			mt8195_afe_enable_clk(afe, afe_priv->clk[cg_id]);
+		if (cg_id >= 0) {
+			ret = mt8195_afe_enable_clk(afe, afe_priv->clk[cg_id]);
+			if (ret)
+				goto err_disable_mclk;
+		}
 
 		mst_etdm_data = afe_priv->dai_priv[mst_dai_id];
 
 		for (i = 0; i < mst_etdm_data->cowork_slv_count; i++) {
 			slv_dai_id = mst_etdm_data->cowork_slv_id[i];
 			cg_id = mtk_dai_etdm_get_cg_id_by_dai_id(slv_dai_id);
-			if (cg_id >= 0)
-				mt8195_afe_enable_clk(afe,
-						      afe_priv->clk[cg_id]);
+			if (cg_id >= 0) {
+				ret = mt8195_afe_enable_clk(afe,
+							    afe_priv->clk[cg_id]);
+				if (ret)
+					goto err_disable_slv_clk;
+			}
 		}
 	} else {
-		mtk_dai_etdm_enable_mclk(afe, dai->id);
+		ret = mtk_dai_etdm_enable_mclk(afe, dai->id);
+		if (ret)
+			return ret;
 
 		cg_id = mtk_dai_etdm_get_cg_id_by_dai_id(dai->id);
-		if (cg_id >= 0)
-			mt8195_afe_enable_clk(afe, afe_priv->clk[cg_id]);
+		if (cg_id >= 0) {
+			ret = mt8195_afe_enable_clk(afe, afe_priv->clk[cg_id]);
+			if (ret)
+				goto err_disable_mclk;
+		}
 	}
 
 	return 0;
+
+err_disable_slv_clk:
+	while (--i >= 0) {
+		slv_dai_id = mst_etdm_data->cowork_slv_id[i];
+		cg_id = mtk_dai_etdm_get_cg_id_by_dai_id(slv_dai_id);
+		if (cg_id >= 0)
+			mt8195_afe_disable_clk(afe, afe_priv->clk[cg_id]);
+	}
+
+	cg_id = mtk_dai_etdm_get_cg_id_by_dai_id(mst_dai_id);
+	if (cg_id >= 0)
+		mt8195_afe_disable_clk(afe, afe_priv->clk[cg_id]);
+
+err_disable_mclk:
+	mtk_dai_etdm_disable_mclk(afe, is_cowork_mode(dai) ? mst_dai_id : dai->id);
+
+	return ret;
 }
 
 static void mtk_dai_etdm_shutdown(struct snd_pcm_substream *substream,
-- 
2.43.0

