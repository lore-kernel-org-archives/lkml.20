Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D479C4F68B5
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 11:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791977331; cv=none; b=YnsGV1+dM4oCL9zTXH2DZhb4LIVKfBEObffQtlfmy9U8SbhU/YYv1Z7W8eemJPZ2Fi87SxTBthb6npexPiNSxjXSLewPZXPJ/o6avN5mES09JDDpFrun1/jo7nQ9rTb38DbI/oyTzseDVypxvrM8vAG+lcWsqU/PD6ab4oiE1jI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791977331; c=relaxed/simple;
	bh=75Pi527tpe9avIX9uIyazGSmLusLOPieiQVrl5PsM34=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V6MbruZzpW0e0q4LGFtU3pD5YX4O2qjYVrlr7sHB8BscEQ1Fyyg72n8mT4DF+Vh710xNON+kNlDAk8jOp06mFQNTYdJMneLbkn1zeDayl2CCGZ18rYlKeiVbWe8EQ++Upm++MOc1wBzd4cR943LGRQZGNp71Xl+EuZtGfI9L6UM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k3qAkSCE; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k3qAkSCE"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3ac451e128cso994909a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 04:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791977329; x=1792582129; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jzleEuY4fxtuuqAMZY5BgUyZW117KjLIE0OgBW0FxFU=;
        b=k3qAkSCE9sNP6+ILakHh/uu3RSZl40loup5+/yg1C4c/OY7j/A9d/WdDSFafbu8Hsz
         Pq5+26Ry8mxQTLK5qsOXXUkgNyxCOdBe5WU9ZVfD5CsEe+ix8Bbuhrbziodsl3lQrWtM
         S+GQAyajYRhWRd0JeEijJ7p76OMHoKIN+HWIPRcBqrX9/vsVPpJpSv2PVG9U8Gboz1qU
         woPjsAlqCyQAZ6wMfPy2GDUwiTyM3C0MuWOmWtfa5oIgjKbDtVItTxNrp9JEhnZVso0a
         LzXmDiB251AuMQXkfGmCeB/NGb9BD/w3FGNJ7tOwdxuZs5PL/dWnZaqp9b1Z3djsfTQ5
         oMAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791977329; x=1792582129;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jzleEuY4fxtuuqAMZY5BgUyZW117KjLIE0OgBW0FxFU=;
        b=LSwIs9JBXF7TWZTTdKxQ7GTWkkp4GnGQ1i5nQ0/SyPquhiFBFATwi5+dwNVKKgsvWX
         iIKOXUP0YX6iwYRAOwR0N5Xl9ZdJkdjfhAD5pqSINQQj0fP6xSfJXODLWUO9CEY+k5DH
         5X5pC4we57ZggpYni9xyUgnnv2yQUXKUB7l17v7kM6DaReIkZaZf6VQsYLEfxRaFotLA
         Enb5xWMBpbHeD6CVLRxzKyTN3bRxADTOCurBvRLEOE963CEbdUQtJbFGOM0jZLyLSZey
         iJDKUWOmjZ4wamAsxGTAwO9dekPnuRPqnC6s96x5a0K/IqwL7QNhrKwlBNml8JL9eitZ
         aI2A==
X-Forwarded-Encrypted: i=1; AKwUvBxGiErBC3+kRuPFG6EsW+9ay3Jr0VI5klemx1gb+Y8GP2gGHUjPL3ZvAjAK8UQji9WpcL8gCU5Qp3lHABE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJEz+I+PDDiQXZsZzzz7rAjyWVV10ELbPzzyAyBf2AcQkpD7gQS
	ZjcT7u/hksUf4DzTr+rr7USznqUxbbQ3F4NKUO1l/9Lq25STEvS7Jixq
X-Gm-Gg: AYBFou2z004sKQUbm8RYXKK54xy1g6+5EfSbSxPbeV5UjtTsCm/NHidTZ0nQmMfgt5Z
	LFECO0oU/QuXRK52Rcjv1BvV7ilqX4FeWEgqJ2qd8PTIsvNZt1zbuoNShn0WV+2OrHTbQ3CS1F+
	JKHyA66L5dDjSKvp/RiNO6rsx14Z9x8xlaVuPvCrQnptiyRJtsqyKi4119K+kQhKmYNBuGzRN19
	afr9jTEwgMnvZiVcY0m32ojZ8cAYeCw6kZft7hX2fsV27TqQ3ppW/JfB16IQTRHQe9fX3Epd90U
	C7BhvqMmdaTCRNQcbP12o6qUWFdgYYLer/McAkYbnqM7JpVWw0AcHUrBiaCwBdpC3sGyr+KtoUY
	E6svCRwVh7DeaPAWYMMB/mj6vMO5drBGZIWD4554dCFC+VSlxK1EOZiWCTQw15fd395Cf9RmnqY
	58KzSjVSkvUPzki0NW8N0LgY79N0f7E3zJRoLG7vzqazRwKwk188G/YAFPGrB2RfIYl/kTUWhWY
	IEderzmRzKZ6GCLInTxK9b2CJiYIBsC3IUi6xJSiWtHgzjzk+9MZ+Qq4oYJqWavGcFtT9uK0az6
	b43bdTnBsudFuZZEXwdHvj5h
X-Received: by 2002:a17:90b:534e:b0:3ac:7f4c:a690 with SMTP id 98e67ed59e1d1-3ac7f4cbb76mr561876a91.35.1791977329145;
        Wed, 14 Oct 2026 04:28:49 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac61171feesm4077076a91.17.2026.10.14.04.28.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 04:28:46 -0700 (PDT)
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
Subject: [PATCH v3 06/16] ASoC: mediatek: mt8195: Fix paired memif clock error handling
Date: Wed, 14 Oct 2026 18:27:41 +0700
Message-ID: <20261014112752.683032-7-phucduc.bui@gmail.com>
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

Check and propagate errors when preparing and enabling the paired
DL8/DL10 memif clocks.

If enabling the second clock fails, undo the clock that was already
prepared or enabled to keep the clock state balanced.

Fixes: 6746cc858259 ("ASoC: mediatek: mt8195: add platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8195/mt8195-afe-pcm.c | 24 ++++++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
index 52c3381e6766..1d3e01e2c3e7 100644
--- a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
+++ b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
@@ -286,15 +286,23 @@ mt8195_afe_paired_memif_clk_prepare(struct snd_pcm_substream *substream,
 	struct mt8195_afe_private *afe_priv = afe->platform_priv;
 	int id = snd_soc_rtd_to_cpu(rtd, 0)->id;
 	int clk_id;
+	int ret;
 
 	if (id != MT8195_AFE_MEMIF_DL8 && id != MT8195_AFE_MEMIF_DL10)
 		return 0;
 
 	if (enable) {
 		clk_id = MT8195_CLK_AUD_MEMIF_DL10;
-		mt8195_afe_prepare_clk(afe, afe_priv->clk[clk_id]);
+		ret = mt8195_afe_prepare_clk(afe, afe_priv->clk[clk_id]);
+		if (ret)
+			return ret;
 		clk_id = MT8195_CLK_AUD_MEMIF_DL8;
-		mt8195_afe_prepare_clk(afe, afe_priv->clk[clk_id]);
+		ret = mt8195_afe_prepare_clk(afe, afe_priv->clk[clk_id]);
+		if (ret) {
+			clk_id = MT8195_CLK_AUD_MEMIF_DL10;
+			mt8195_afe_unprepare_clk(afe, afe_priv->clk[clk_id]);
+			return ret;
+		}
 	} else {
 		clk_id = MT8195_CLK_AUD_MEMIF_DL8;
 		mt8195_afe_unprepare_clk(afe, afe_priv->clk[clk_id]);
@@ -315,6 +323,7 @@ mt8195_afe_paired_memif_clk_enable(struct snd_pcm_substream *substream,
 	struct mt8195_afe_private *afe_priv = afe->platform_priv;
 	int id = snd_soc_rtd_to_cpu(rtd, 0)->id;
 	int clk_id;
+	int ret;
 
 	if (id != MT8195_AFE_MEMIF_DL8 && id != MT8195_AFE_MEMIF_DL10)
 		return 0;
@@ -322,11 +331,18 @@ mt8195_afe_paired_memif_clk_enable(struct snd_pcm_substream *substream,
 	if (enable) {
 		/* DL8_DL10_MEM */
 		clk_id = MT8195_CLK_AUD_MEMIF_DL10;
-		mt8195_afe_enable_clk_atomic(afe, afe_priv->clk[clk_id]);
+		ret = mt8195_afe_enable_clk_atomic(afe, afe_priv->clk[clk_id]);
+		if (ret)
+			return ret;
 		udelay(1);
 		/* DL8_DL10_AGENT */
 		clk_id = MT8195_CLK_AUD_MEMIF_DL8;
-		mt8195_afe_enable_clk_atomic(afe, afe_priv->clk[clk_id]);
+		ret = mt8195_afe_enable_clk_atomic(afe, afe_priv->clk[clk_id]);
+		if (ret) {
+			clk_id = MT8195_CLK_AUD_MEMIF_DL10;
+			mt8195_afe_disable_clk_atomic(afe, afe_priv->clk[clk_id]);
+			return ret;
+		}
 	} else {
 		/* DL8_DL10_AGENT */
 		clk_id = MT8195_CLK_AUD_MEMIF_DL8;
-- 
2.43.0

