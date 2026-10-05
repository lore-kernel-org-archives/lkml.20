Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3751A47D44A
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 11:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791198220; cv=none; b=mmyto+XP7bhwic+PQYt8B3xOJul2r/lGvURLplNGjp+e4huK5ovPuNbBWBiCxfE4VrHQK3ljiAzW72ZOYdJzDujxjUcJKgvzpLKbmoybBp/54b418Fy8v2mCoDpG1SHtc+CRKoduNxb8u6Vh/hL//tPBJHDVxBMrKWTcvoV5GXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791198220; c=relaxed/simple;
	bh=75Pi527tpe9avIX9uIyazGSmLusLOPieiQVrl5PsM34=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eoHWGa8SzH2Iz1vVgNVjMGmej6+XQMlsQOSftv3Rb/Y+RxVh2DxOQJDxDH23LI5/NPyuUfba9jwybof54LPK7nvyV96YpQ3sC4hAZHq6jBt+1L1Bumd8v1fXV+P6q+dtrq30DuDa7spYYe9CT7wSj1vLnSQvGWzSQFp9EbNqoWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QxCHU8xp; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QxCHU8xp"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-3a4c8262465so1244404a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 04:03:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791198219; x=1791803019; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jzleEuY4fxtuuqAMZY5BgUyZW117KjLIE0OgBW0FxFU=;
        b=QxCHU8xpjMXz2yRGVQj7shw+5hSaRUjCMDtnxiPjTq4M7Y8RIVGe4RlE+htpMNzy3H
         TwH9yq9l2/fA9wALXk+zYdTf1GFj4Ddz64SYoeAJ4Qhq7vAA3R3cTIu4z+ah3VP3WO0p
         bxkb4QvFueZulOyFlY89b/5h3iljxClkr0pk8GgiIsoDqEoVS4z/R9J+YWb0lixAwmpx
         r4lv7305GdM7gce4KdauJnQxrPKjg9Y9iAUAweJW8gIExy5lHg0f7qtbbWU6QyJT+2A1
         IN0PWC0hqbhncqwjft/dmm91QLIpFU1IyEX2fF9/EH6vJEG+fVfesdVPkMdLXUOrQkdJ
         oY7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791198219; x=1791803019;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jzleEuY4fxtuuqAMZY5BgUyZW117KjLIE0OgBW0FxFU=;
        b=mA3weGj1TdKET9F24hVhPHr2t0AKGM3Rqvlej59qLx+T7KtrSuWndft9gVGT+OhB2C
         N/e5mxVXThVREfDXcSAOEHp9i47UWcMIO8be6hDI7Y4gQBa7Bd3XucIPOz0M39U4+w0+
         ByG0AW2mZoAJCnoPYc2Zjh3mNZTYEWe8wOvhal//0OKSGX6A/NicOl9wP6Qkm8tKEQf8
         CmcyN/24rpiBQiKzKY0eP/yMXc1Poj0aUVodBukUFy9wQTy0OhQLJKmnoVloeenYL2bq
         wRpKlD2o/OeS3f2fm46SVo+LQiaPHSiZZP0fQtTasxK3R28vivd/TMSvEQN8CY3ae1wB
         OLYg==
X-Forwarded-Encrypted: i=1; AKwUvBxjjHlmPcxixnJMeiRIQKPq+As/SdHV7OaR7MW8RCwPCmHaru/1O/zGPQqAQUCyHS2lheqU5ECdGar06O0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJol+ZTAGz4bW4CE+NToyE11vCNjP0GuyP0d/CB4RStXKnjyRgI
	4grG6eODo/KWjy6uAnDOPJG2mnY9dPTHteGJT/jNVmXL4/MGQuvs9n+X
X-Gm-Gg: AYBFou34myrE+SJI7nAL/kZC7ozD9hrm90gD5nLl28wrdii9fEz/yoIRza654srotcL
	DQcG4yW1hTDeVmrP0KFOVGQgBl4oEd3cSV+IGzP80ua4KDbfwUZnzcyBy5YDtLtZhfNBIYkVNR6
	48nqjiRnoA4VzV9ZkgLF4ECuGl8khEI0sOVlNeJ6mCEqc6f31cj5/W0Nr031faDq/CKOXd5n7tb
	jH11NqExUGAQkOefevhUllkFmq0sN4oedT/Tpmz5x+TCzND5ZoYRBQpI8GATqhFGH/LDTcsSYhT
	0BSleupbG6HemPO+QCty8g/jwlf5qwo/lq/zH0vgjQS7Kp3yJHPkK7CjDvbvPyhwxrRbS1vUXnU
	GG84rT1dXDo4tE5wlt5bMVx3OHHC3bM70tNno68+66ZCMDRM7MN239D0ZdFnaYu9WPAKnK4pke+
	ajRBO1Npkk5Noi9IDLaw3fR2ZtOxt+Fh+lSS8uEbYjTW66nlRYsrEn66U9ajDzGWq25fRkdbdqm
	sHDx5KnIRdD0i5ezytPZWr9SjEgoNzEKXRinUTII5WaZhsqEFJIUd4/9tN9/HKZl4jLIrY7fyGx
	7RMDIEuYYK0lXA==
X-Received: by 2002:a17:90b:4b83:b0:3a5:1c7:c2f with SMTP id 98e67ed59e1d1-3a6ce986288mr9784031a91.59.1791198218535;
        Mon, 05 Oct 2026 04:03:38 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cce6d334de5sm626498a12.11.2026.10.05.04.03.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 04:03:38 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Trevor Wu <trevor.wu@mediatek.com>
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
Subject: [PATCH v2 05/14] ASoC: mediatek: mt8195: Fix paired memif clock error handling
Date: Mon,  5 Oct 2026 18:02:48 +0700
Message-ID: <20261005110257.50145-6-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261005110257.50145-1-phucduc.bui@gmail.com>
References: <20261005110257.50145-1-phucduc.bui@gmail.com>
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

