Received: from mail-m155101.qiye.163.com (mail-m155101.qiye.163.com [101.71.155.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E5134ED1AC;
	Tue, 29 Sep 2026 09:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790674958; cv=none; b=l7C+mIg/cSLkUlNd4mFmEm5e/KOgq6abYyQfY/mNYNK7Kj6J8kmyRUkofj8b98bGYVqR2S4XyLDHJOY1NxADYiTUjFnOiyjU7THZWrHJTGXhO03wer7YROQ7pcWQ9Sqa1YznY0GvMuAK/8p/2zHvEOHlsCjE460ktp6FQhuCKIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790674958; c=relaxed/simple;
	bh=VnYrNWJVmU9MCGcyPogJztfGV446YXDWQsf2nvHzMhQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=X8BUX3pWzsaAD9BR6TyLg33UkzmUe7XNX/ONEqu5383Bu9Amffe4euBz2+nbZYGiedkhGnDC9svbpEtFlIzSic7ikn7cozqlqiBPCf0lpBZr1p1IsxAySPTBtP9s+C272df9ZoWPXph6Li0cump96Cz06QXocycJ3/RUwvXfd2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn; spf=pass smtp.mailfrom=seu.edu.cn; dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b=GvLqbRrx; arc=none smtp.client-ip=101.71.155.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=seu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b="GvLqbRrx"
Received: from PC-202605011814.localdomain (unknown [221.228.238.82])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4f7d6b327;
	Tue, 29 Sep 2026 17:42:29 +0800 (GMT+08:00)
From: Runyu Xiao <runyu.xiao@seu.edu.cn>
To: Srinivas Kandagatla <srini@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Prasad Kumpatla <quic_pkumpatl@quicinc.com>,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Runyu Xiao <runyu.xiao@seu.edu.cn>,
	Jianhao Xu <jianhao.xu@seu.edu.cn>
Subject: [PATCH] ASoC: codecs: wcd937x: use devm_free_irq() for watchdog IRQs
Date: Tue, 29 Sep 2026 17:42:23 +0800
Message-Id: <20260929094223.2086750-1-runyu.xiao@seu.edu.cn>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa0ec8b556503a1kunmd3a60ad42352c2
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaQkJKVkwfHklKGhpNH0pCSlYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlJSUpVSUlDVUlIQ1VDSVlXWRYaDxIVHRRZQVlPS0hVSktISk
	9ITFVKS0tVSkJLS1kG
DKIM-Signature: a=rsa-sha256;
	b=GvLqbRrxZ96hmKW72qzePjJAFK/KCXNGRAFnUseef/viKdUpo2lIHN3GI+2ui7L8RCe5Fi13SMWURqjwTBvRePMMrbLUx1+3wIRov8p04DkxBzD66zKnwTQ1tg5yECTv5IwstWVVDz3wkxQCisoeGRYd//x42oE4lTW7kIOHgxs=; c=relaxed/relaxed; s=default; d=seu.edu.cn; v=1;
	bh=zPoTI/RMsEj8z90RqksdLYgjap1eGGOdbOg7FzjEGjQ=;
	h=date:mime-version:subject:message-id:from;

The watchdog IRQs are requested with devm_request_threaded_irq() from the
codec component probe, but the remove callback frees them with free_irq().
The devres entries remain in place. Component teardown later tries to free
the same IRQs again.

The IRQs must be released before the SoundWire components are unbound. Use
devm_free_irq() to remove each IRQ and its devres entry at that point. Fail
component probe if an IRQ request fails, and unwind only IRQs that were
successfully requested.

Fixes: 9be3ec196da4 ("ASoC: codecs: wcd937x: add wcd937x codec driver")
Assisted-by: LLM
Signed-off-by: Runyu Xiao <runyu.xiao@seu.edu.cn>
---
 sound/soc/codecs/wcd937x.c | 32 +++++++++++++++++++++-----------
 1 file changed, 21 insertions(+), 11 deletions(-)

diff --git a/sound/soc/codecs/wcd937x.c b/sound/soc/codecs/wcd937x.c
index 0dd05604f5b88..ec902c81d5a4e 100644
--- a/sound/soc/codecs/wcd937x.c
+++ b/sound/soc/codecs/wcd937x.c
@@ -2540,19 +2540,19 @@ static int wcd937x_soc_codec_probe(struct snd_soc_component *component)
 					IRQF_ONESHOT | IRQF_TRIGGER_RISING,
 					"HPHR PDM WDOG INT", wcd937x);
 	if (ret)
-		dev_err(dev, "Failed to request HPHR watchdog interrupt (%d)\n", ret);
+		goto err_free_clsh;
 
 	ret = devm_request_threaded_irq(dev, wcd937x->hphl_pdm_wd_int, NULL, wcd937x_wd_handle_irq,
 					IRQF_ONESHOT | IRQF_TRIGGER_RISING,
 					"HPHL PDM WDOG INT", wcd937x);
 	if (ret)
-		dev_err(dev, "Failed to request HPHL watchdog interrupt (%d)\n", ret);
+		goto err_free_hphr_irq;
 
 	ret = devm_request_threaded_irq(dev, wcd937x->aux_pdm_wd_int, NULL, wcd937x_wd_handle_irq,
 					IRQF_ONESHOT | IRQF_TRIGGER_RISING,
 					"AUX PDM WDOG INT", wcd937x);
 	if (ret)
-		dev_err(dev, "Failed to request Aux watchdog interrupt (%d)\n", ret);
+		goto err_free_hphl_irq;
 
 	/* Disable watchdog interrupt for HPH and AUX */
 	disable_irq_nosync(wcd937x->hphr_pdm_wd_int);
@@ -2564,24 +2564,34 @@ static int wcd937x_soc_codec_probe(struct snd_soc_component *component)
 						ARRAY_SIZE(wcd9375_dapm_widgets));
 		if (ret < 0) {
 			dev_err(component->dev, "Failed to add snd_ctls\n");
-			wcd_clsh_ctrl_free(wcd937x->clsh_info);
-			return ret;
+			goto err_free_irqs;
 		}
 
 		ret = snd_soc_dapm_add_routes(dapm, wcd9375_audio_map,
 					      ARRAY_SIZE(wcd9375_audio_map));
 		if (ret < 0) {
 			dev_err(component->dev, "Failed to add routes\n");
-			wcd_clsh_ctrl_free(wcd937x->clsh_info);
-			return ret;
+			goto err_free_irqs;
 		}
 	}
 
 	ret = wcd937x_mbhc_init(component);
-	if (ret)
+	if (ret) {
 		dev_err(component->dev, "mbhc initialization failed\n");
+		goto err_free_irqs;
+	}
 
 	return ret;
+
+err_free_irqs:
+	devm_free_irq(dev, wcd937x->aux_pdm_wd_int, wcd937x);
+err_free_hphl_irq:
+	devm_free_irq(dev, wcd937x->hphl_pdm_wd_int, wcd937x);
+err_free_hphr_irq:
+	devm_free_irq(dev, wcd937x->hphr_pdm_wd_int, wcd937x);
+err_free_clsh:
+	wcd_clsh_ctrl_free(wcd937x->clsh_info);
+	return ret;
 }
 
 static void wcd937x_soc_codec_remove(struct snd_soc_component *component)
@@ -2589,9 +2599,9 @@ static void wcd937x_soc_codec_remove(struct snd_soc_component *component)
 	struct wcd937x_priv *wcd937x = snd_soc_component_get_drvdata(component);
 
 	wcd937x_mbhc_deinit(component);
-	free_irq(wcd937x->aux_pdm_wd_int, wcd937x);
-	free_irq(wcd937x->hphl_pdm_wd_int, wcd937x);
-	free_irq(wcd937x->hphr_pdm_wd_int, wcd937x);
+	devm_free_irq(component->dev, wcd937x->aux_pdm_wd_int, wcd937x);
+	devm_free_irq(component->dev, wcd937x->hphl_pdm_wd_int, wcd937x);
+	devm_free_irq(component->dev, wcd937x->hphr_pdm_wd_int, wcd937x);
 
 	wcd_clsh_ctrl_free(wcd937x->clsh_info);
 }
-- 
2.34.1
