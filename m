Received: from mail-pj2-f39.google.com (mail-pj2-f39.google.com [74.125.227.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A943411F83
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 06:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.167
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790662365; cv=none; b=IBcypNARrdRG28Hulng3D6f9j4BZOeBNghGHZgRdxegHPWG98wBlfcdIjdpsougp59YH0UYmnjaIZ3UqAKUN787b+MVnYbWcLca/3LJC37QvT+G9tKsMxndnUIvYrKIDNP7WzLpWqHnsybhN3lDdLAH9eBTProAJYQ7vqP4vQ2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790662365; c=relaxed/simple;
	bh=ZmEU5EahOMV7kuRmbSaLsRIhMqxYvik8hg0QSwyhru4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tanjRhOtDphuUBsYzA54TyV9AEKvkg3u1j4arAHCHQD1R/nHSM6uUjgxILJwEbUf19KTTCpv6OZREgdaBhlWqZms4JaMkWHaS2IkiXFFQIvKGWpQrgbfmD7S8Te3Eb+g5kPd9WuKXY5bqp4xax/gVRBsGnAv8wUxp3Wm0KX97QQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k5k2ncRP; arc=none smtp.client-ip=74.125.227.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k5k2ncRP"
Received: by mail-pj2-f39.google.com with SMTP id 98e67ed59e1d1-3a49b6bb21eso316032a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 23:12:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790662364; x=1791267164; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3W1Z4z2ziqkLTLfdGWsmv+b1vbrImgZWrkJME4neunc=;
        b=k5k2ncRPRbsJdAD5t/bEJiL5HVX6M3UNt8Kb5zXGXqT5eZsHHEKHil7RmaEvhIU7VH
         nkFeLRi6A3k/XG8s78l4jg/0UWC7YQMQMog7ALYxj2rPgPXzfM2x570pjV7/zM9XcoHY
         cVKbvWuV4aAb0lKzjsarjPz3Qb42FB1AA1849GaJrOwPMy6tcVD+DrMaxr7X/CJXGU2q
         4jOqFWfuEOOthHTf/XpUsIoWdxT+iPt+Hjx3PWot1MIeXly8AAn9CX1S65YQQj0eEuKv
         Ei8c8+eZixETRVyeo4SE1YwaEzpJtCFXQmrc2AjgtAF4VN9ynKO0tG98s3uH6Vh10kdi
         bJNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790662364; x=1791267164;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3W1Z4z2ziqkLTLfdGWsmv+b1vbrImgZWrkJME4neunc=;
        b=j2ZM1Saday20ICb4SinUWeE3d51ON/vUdy/CmtBlKMcNFDpWH/svjpUpZ8Kop/BaGR
         bGWRVtVCajfH6hPwhZuqbscgp4ThmnLALSIwby4iwcrFApHDo+5APRbKM+bDV2univ3C
         sIOKlzfA4/6f7maq2NMnaAPnNBjUI1jiYfxL6CYk7APpeKkXhSyOFpCqVLGfB+DtN1FT
         thA+ckzmg2an4AvJFQzh36lAeK10n2pOOH+1YQmMlSyYG6s32/t0whbAKVjFJGc2PY8R
         hqCRq7bMMRZnEkilTjtve0genEBUKK7GL12bWJkuh7M81jyiTQtUW2eEa6q7H8yX/E/t
         FeIg==
X-Forwarded-Encrypted: i=1; AKwUvBynPuEgVLH1OuqfR+Y0Ao2SRRDw8vhCzYZVcFZM9A3BGcniWAWarV9bS2QfTcbFTlISorc/syyVhBNvI3w=@vger.kernel.org
X-Gm-Message-State: AFq9FYKAwWgsXQtASj6Xcwd5WQvxcsAz+gA+vbut8khN6ZyV4QdWzmoJ
	C0Q6T7mT5UYJM4dQ3+z0cS4M6/7F9J072L7rHYybsThys8zu+WYt7M8a
X-Gm-Gg: AYBFou3JbJJJxgRIvCW40SG/WNZ+hPmi8d+IYxtMxAQ7W5yld6j+LDl3smN2TzdH7Rn
	ck0SByOAsChkVLhdJgM/0IWEJSfce5/aqoJjCOPRcmdhlU4/Fn2X1E6KevMCEH+5h7HlwAyF1jX
	rhKgsNgpns6+ZqO5xnT6XqmObke+q+jZMr6I+A60XoO7be8jOOUSlWOVJDlvAu1+SnbaJbF6slv
	Qh+1dpWjNZNWc+ENp89WFiOyRIGQZnAlkGMMqQCo71Wh1aF8jkAj0VNrpqLBKqMGu3CrsBlRLu1
	FnJ3tTjiuLHr1hSPl2IRjqwCiZ56pI+DJS2jg5lJTc/u76kwUL0cSM9FRphO/H7zWd/GlkIHVSJ
	eo+iN7sWDnjuXO4Gyc56yVsTGld9qfWL64vRwMTPi5W9CwOr1FYKrmTs/3el3AHFC3SsNXFaBXY
	+7xhelC30PonHG7njabLHg0ixl0H4js59rEy42fdisSyiBuR6SR19VHv0bRuvwZQYhKBcwrv7IN
	2sepnoQxAlH0TpbO4hHdjUDR+mc85jYp1Kdm8fVNXO+XOdjXgt+Iw0UA6l1LY6/9/vDY5UwHjtj
	eviCT507kh1K/N+CykfgGVap
X-Received: by 2002:a17:90b:3908:b0:3a0:c20b:2fdf with SMTP id 98e67ed59e1d1-3a0c20b3132mr7441393a91.17.1790662363889;
        Mon, 28 Sep 2026 23:12:43 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a498726d63sm3280965a91.17.2026.09.28.23.12.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 23:12:43 -0700 (PDT)
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
Subject: [PATCH 10/10] ASoC: mediatek: mt8196: propagate TDM clock errors
Date: Tue, 29 Sep 2026 13:11:21 +0700
Message-ID: <20260929061121.124001-11-phucduc.bui@gmail.com>
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

Propagate errors from BCK and MCK clock operations in the DAPM event
callbacks instead of always returning success.

Fixes: ede4d841111a ("ASoC: mediatek: mt8196: support TDM in platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8196/mt8196-dai-tdm.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/sound/soc/mediatek/mt8196/mt8196-dai-tdm.c b/sound/soc/mediatek/mt8196/mt8196-dai-tdm.c
index b7aeee939d88..44bd08f5c1fb 100644
--- a/sound/soc/mediatek/mt8196/mt8196-dai-tdm.c
+++ b/sound/soc/mediatek/mt8196/mt8196-dai-tdm.c
@@ -256,22 +256,24 @@ static int mtk_tdm_bck_en_event(struct snd_soc_dapm_widget *w,
 	struct mt8196_afe_private *afe_priv = afe->platform_priv;
 	int dai_id = get_tdm_id_by_name(w->name);
 	struct mtk_afe_tdm_priv *tdm_priv = afe_priv->dai_priv[dai_id];
+	int ret;
 
 	dev_dbg(cmpnt->dev, "name %s, event 0x%x, dai_id %d\n",
 		w->name, event, dai_id);
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
-		mt8196_mck_enable(afe, tdm_priv->bck_id, tdm_priv->bck_rate);
+		ret = mt8196_mck_enable(afe, tdm_priv->bck_id, tdm_priv->bck_rate);
 		break;
 	case SND_SOC_DAPM_POST_PMD:
-		mt8196_mck_disable(afe, tdm_priv->bck_id);
+		ret = mt8196_mck_disable(afe, tdm_priv->bck_id);
 		break;
 	default:
+		ret = 0;
 		break;
 	}
 
-	return 0;
+	return ret;
 }
 
 static int mtk_tdm_mck_en_event(struct snd_soc_dapm_widget *w,
@@ -283,23 +285,25 @@ static int mtk_tdm_mck_en_event(struct snd_soc_dapm_widget *w,
 	struct mt8196_afe_private *afe_priv = afe->platform_priv;
 	int dai_id = get_tdm_id_by_name(w->name);
 	struct mtk_afe_tdm_priv *tdm_priv = afe_priv->dai_priv[dai_id];
+	int ret;
 
 	dev_dbg(cmpnt->dev, "name %s, event 0x%x, dai_id %d\n",
 		w->name, event, dai_id);
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
-		mt8196_mck_enable(afe, tdm_priv->mclk_id, tdm_priv->mclk_rate);
+		ret = mt8196_mck_enable(afe, tdm_priv->mclk_id, tdm_priv->mclk_rate);
 		break;
 	case SND_SOC_DAPM_POST_PMD:
 		tdm_priv->mclk_rate = 0;
-		mt8196_mck_disable(afe, tdm_priv->mclk_id);
+		ret = mt8196_mck_disable(afe, tdm_priv->mclk_id);
 		break;
 	default:
+		ret = 0;
 		break;
 	}
 
-	return 0;
+	return ret;
 }
 
 static const struct snd_soc_dapm_widget mtk_dai_tdm_widgets[] = {
-- 
2.43.0

