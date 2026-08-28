Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1564E440A2B;
	Fri, 28 Aug 2026 11:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787916877; cv=none; b=fMNVy4PAFcG+MRXdTdrOKP1o84Otauhz03mo0okeM9fooV0hEAyAlKxX8EpM/j6YeLkaVo2HpaobDyubfkYX+i25eHgqvfrEC+rNHcu2UQpQxkOcmyPH0pL8IueHc/w+WWzU3Ui6Sx5UqJJJG78NnxX3BokIepreS06uy7fzYaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787916877; c=relaxed/simple;
	bh=6PhF5fppeYyFxAJu/j16BY9G1QFEwdQG/kgtZS+HGSw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EOJMzpqrDQk9KvSqpbQUbQ6XoVmoZO/tVJbiiB7UdbkpkfdIi4OUozyw/7nfpO1JmMuvVH2X4m8p9tpMrdLkIk9nZsgY0q7leIJjM4T//YllGRdstjegdEzyD/XGsoHkt0OXXN5yYmOjLslUy6lY0R5aswt9cIPBsGQtVsCNZD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [111.196.241.250])
	by APP-01 (Coremail) with SMTP id qwCowACnfPA6cpFqpPm9Bg--.43118S22;
	Fri, 28 Aug 2026 19:34:22 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Cyril Chao <Cyril.Chao@mediatek.com>,
	Darren Ye <darren.ye@mediatek.com>,
	=?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Subject: [PATCH 20/20] ASoC: mediatek: mt8196: Unwind register clock and cache restore failures
Date: Fri, 28 Aug 2026 19:34:15 +0800
Message-ID: <20260828113416.47061-21-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260828113416.47061-1-pengpeng@iscas.ac.cn>
References: <20260828113416.47061-1-pengpeng@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qwCowACnfPA6cpFqpPm9Bg--.43118S22
X-Coremail-Antispam: 1UD129KBjvJXoWxXFW3JrWUWrykWw1fAryUGFg_yoWrGrWrp3
	97Cr1qyrWjq348uFZ0vrW7tFyF9r4xAFW3CFyjg34kZr1akrWxAF1kJas7ZFsIqr1kGa1a
	gFyDKa45CF4Y9FUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUmS14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
	kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
	z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F
	4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq
	3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7
	IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4U
	M4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2
	kIc2xKxwCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkE
	bVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67
	AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVW5JVW7JwCI
	42IY6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF
	4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBI
	daVFxhVjvjDU0xZFpf9x0JUhNVPUUUUU=
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/

mt8196_afe_runtime_resume() first acquires three register-access clocks
and then replays the register cache.  mt8196_afe_enable_reg_rw_clk()
ignores each clock-enable result and leaks already enabled clocks when a
later rate change fails.  Runtime resume also ignores regcache_sync()
and proceeds with 26 MHz requests and main-clock enable.

Make the register-clock helper acquire transactionally and unwind the
successful prefix on every failure.  Return cache replay errors after
restoring cache-only and dirty state and disabling the three
register-access clocks.

The issue was identified via static analysis and manually reviewed.

Fixes: 7384ecab34eb ("ASoC: mediatek: mt8196: support audio clock control")
Fixes: 57513aabfe5b ("ASoC: mediatek: mt8196: add platform driver")

Assisted-by: LLM
Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 sound/soc/mediatek/mt8196/mt8196-afe-clk.c | 27 ++++++++++++++++++----
 sound/soc/mediatek/mt8196/mt8196-afe-pcm.c |  8 ++++++-
 2 files changed, 29 insertions(+), 6 deletions(-)

diff --git a/sound/soc/mediatek/mt8196/mt8196-afe-clk.c b/sound/soc/mediatek/mt8196/mt8196-afe-clk.c
index 286e39f53ae0..ea0835e73510 100644
--- a/sound/soc/mediatek/mt8196/mt8196-afe-clk.c
+++ b/sound/soc/mediatek/mt8196/mt8196-afe-clk.c
@@ -511,26 +511,43 @@ int mt8196_afe_enable_reg_rw_clk(struct mtk_base_afe *afe)
 	int ret;
 
 	/* bus clock for AFE external access, like DRAM */
-	mt8196_afe_enable_clk(afe, afe_priv->clk[MT8196_CLK_TOP_ADSP_SEL]);
+	ret = mt8196_afe_enable_clk(afe, afe_priv->clk[MT8196_CLK_TOP_ADSP_SEL]);
+	if (ret)
+		return ret;
 
 	/* bus clock for AFE internal access, like AFE SRAM */
-	mt8196_afe_enable_clk(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUDIOINTBUS]);
+	ret = mt8196_afe_enable_clk(afe,
+				    afe_priv->clk[MT8196_CLK_VLP_MUX_AUDIOINTBUS]);
+	if (ret)
+		goto disable_adsp;
+
 	ret = mt8196_afe_set_clk_rate(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUDIOINTBUS],
 				      MT8196_AFE_26M);
 	if (ret)
-		return ret;
+		goto disable_intbus;
 
 	/* enable audio h clock */
-	mt8196_afe_enable_clk(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUDIO_H]);
+	ret = mt8196_afe_enable_clk(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUDIO_H]);
+	if (ret)
+		goto disable_intbus;
+
 	ret = mt8196_afe_set_clk_rate(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUDIO_H],
 				      MT8196_AFE_26M);
 	if (ret)
-		return ret;
+		goto disable_audio_h;
 
 	/* AFE hw clock */
 	/* IPM2.0: USE HOPPING & 26M */
 	/* set in the regmap_register_patch */
 	return 0;
+
+disable_audio_h:
+	mt8196_afe_disable_clk(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUDIO_H]);
+disable_intbus:
+	mt8196_afe_disable_clk(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUDIOINTBUS]);
+disable_adsp:
+	mt8196_afe_disable_clk(afe, afe_priv->clk[MT8196_CLK_TOP_ADSP_SEL]);
+	return ret;
 }
 
 int mt8196_afe_disable_reg_rw_clk(struct mtk_base_afe *afe)
diff --git a/sound/soc/mediatek/mt8196/mt8196-afe-pcm.c b/sound/soc/mediatek/mt8196/mt8196-afe-pcm.c
index a1ae8322d8b6..49283f242c00 100644
--- a/sound/soc/mediatek/mt8196/mt8196-afe-pcm.c
+++ b/sound/soc/mediatek/mt8196/mt8196-afe-pcm.c
@@ -2222,7 +2222,13 @@ static int mt8196_afe_runtime_resume(struct device *dev)
 		goto skip_regmap;
 	}
 	regcache_cache_only(afe->regmap, false);
-	regcache_sync(afe->regmap);
+	ret = regcache_sync(afe->regmap);
+	if (ret) {
+		regcache_cache_only(afe->regmap, true);
+		regcache_mark_dirty(afe->regmap);
+		mt8196_afe_disable_reg_rw_clk(afe);
+		return ret;
+	}
 
 	/* set audio 26M request */
 	regmap_update_bits(afe->regmap, AFE_SPM_CONTROL_REQ, 0x1, 0x1);
-- 
2.43.0

