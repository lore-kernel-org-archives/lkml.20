Received: from mail-m155101.qiye.163.com (mail-m155101.qiye.163.com [101.71.155.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EC7A416842;
	Sun,  4 Oct 2026 10:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791109450; cv=none; b=HO/pLfuxdaWNXP47J3KGfc3wlzOJ1oIcNSu+Od/vpVof+mUk3O560NbWDFhyEv44WvMN8JmaolK+VnPRIhaaT2P/cC7hMEu3ta7l43JdzJLkLFag0w6PB5qhpdWPUPO3oq8uy1jf6VnJmhCNk5Dhw746OqJOORIWPnQa8TqsG8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791109450; c=relaxed/simple;
	bh=/an0Ahh1xrPPkDannssAWcgM8uooqZe/h43gpFs3dW0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QzFsQTiclNXI04+fswwWzGJBl5ybJ1snG8O0ZtX3To/WZYwylgCnQ+CAziaUWEHBjhzuk19/V7tu7lZEV5FoB6Qb6y37DSk/sOKxJVr9fqhdQLlpj5JZwPSwcBntXAEbo57fyLRrryX1cINug4gciAkFs+V/3/uT0UE/Qhrkcak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn; spf=pass smtp.mailfrom=seu.edu.cn; dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b=UoVexn+i; arc=none smtp.client-ip=101.71.155.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=seu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b="UoVexn+i"
Received: from PC-202605011814.localdomain (unknown [58.241.16.34])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4feb7a971;
	Sun, 4 Oct 2026 18:23:56 +0800 (GMT+08:00)
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
Subject: [PATCH v2] ASoC: codecs: wcd937x: request watchdog IRQs without devm
Date: Sun,  4 Oct 2026 18:23:46 +0800
Message-Id: <20261004102346.1203410-1-runyu.xiao@seu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260929094223.2086750-1-runyu.xiao@seu.edu.cn>
References: <20260929094223.2086750-1-runyu.xiao@seu.edu.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa10671155b03a1kunmbe4e162033872b
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaGh0dVk1MGU0eTkhMSUkaTFYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlOQ1VJT0pVSk1VSE9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpPSE
	xVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=UoVexn+i8wSlmjRPIq+/9RsRjXzY7gcnIV635ED4LSwtpe9FS4msNpk6CytFrcTS+EarP+OfSPxNwHnwCTjBRfAyvZBD4stDUll54nPZe5Un6Aj5kTc0vA6bgy28ChARf3vK8wV/89nH4P9+RX6pe6HQq4cNK0Q7tmT1kE1nxXw=; c=relaxed/relaxed; s=default; d=seu.edu.cn; v=1;
	bh=EYqnINkQDb70UfTXaXUn3ZfNSoOVKpSu/IdqarVA5H8=;
	h=date:mime-version:subject:message-id:from;

The watchdog IRQs are requested from the codec component probe and released
from its remove callback. Use the same non-devm lifetime for both
operations.

Use request_threaded_irq() and keep free_irq() in the component remove
callback. Return errors from each request and unwind only IRQs that were
successfully requested, including failures later in component probe.

Fixes: 9be3ec196da4 ("ASoC: codecs: wcd937x: add wcd937x codec driver")
Assisted-by: LLM
Signed-off-by: Runyu Xiao <runyu.xiao@seu.edu.cn>
---
v2:
- Use request_threaded_irq() and free_irq() as suggested by Mark Brown.
- Keep error unwinding limited to IRQs that were successfully requested.

 sound/soc/codecs/wcd937x.c | 44 +++++++++++++++++++++++---------------
 1 file changed, 27 insertions(+), 17 deletions(-)

diff --git a/sound/soc/codecs/wcd937x.c b/sound/soc/codecs/wcd937x.c
index 0dd05604f5b88..7ffbb445f8ac4 100644
--- a/sound/soc/codecs/wcd937x.c
+++ b/sound/soc/codecs/wcd937x.c
@@ -2536,23 +2536,23 @@ static int wcd937x_soc_codec_probe(struct snd_soc_component *component)
 						      WCD937X_IRQ_AUX_PDM_WD_INT);
 
 	/* Request for watchdog interrupt */
-	ret = devm_request_threaded_irq(dev, wcd937x->hphr_pdm_wd_int, NULL, wcd937x_wd_handle_irq,
-					IRQF_ONESHOT | IRQF_TRIGGER_RISING,
-					"HPHR PDM WDOG INT", wcd937x);
+	ret = request_threaded_irq(wcd937x->hphr_pdm_wd_int, NULL, wcd937x_wd_handle_irq,
+				   IRQF_ONESHOT | IRQF_TRIGGER_RISING,
+				   "HPHR PDM WDOG INT", wcd937x);
 	if (ret)
-		dev_err(dev, "Failed to request HPHR watchdog interrupt (%d)\n", ret);
+		goto err_free_clsh;
 
-	ret = devm_request_threaded_irq(dev, wcd937x->hphl_pdm_wd_int, NULL, wcd937x_wd_handle_irq,
-					IRQF_ONESHOT | IRQF_TRIGGER_RISING,
-					"HPHL PDM WDOG INT", wcd937x);
+	ret = request_threaded_irq(wcd937x->hphl_pdm_wd_int, NULL, wcd937x_wd_handle_irq,
+				   IRQF_ONESHOT | IRQF_TRIGGER_RISING,
+				   "HPHL PDM WDOG INT", wcd937x);
 	if (ret)
-		dev_err(dev, "Failed to request HPHL watchdog interrupt (%d)\n", ret);
+		goto err_free_hphr_irq;
 
-	ret = devm_request_threaded_irq(dev, wcd937x->aux_pdm_wd_int, NULL, wcd937x_wd_handle_irq,
-					IRQF_ONESHOT | IRQF_TRIGGER_RISING,
-					"AUX PDM WDOG INT", wcd937x);
+	ret = request_threaded_irq(wcd937x->aux_pdm_wd_int, NULL, wcd937x_wd_handle_irq,
+				   IRQF_ONESHOT | IRQF_TRIGGER_RISING,
+				   "AUX PDM WDOG INT", wcd937x);
 	if (ret)
-		dev_err(dev, "Failed to request Aux watchdog interrupt (%d)\n", ret);
+		goto err_free_hphl_irq;
 
 	/* Disable watchdog interrupt for HPH and AUX */
 	disable_irq_nosync(wcd937x->hphr_pdm_wd_int);
@@ -2564,23 +2564,33 @@ static int wcd937x_soc_codec_probe(struct snd_soc_component *component)
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
+
+	return ret;
 
+err_free_irqs:
+	free_irq(wcd937x->aux_pdm_wd_int, wcd937x);
+err_free_hphl_irq:
+	free_irq(wcd937x->hphl_pdm_wd_int, wcd937x);
+err_free_hphr_irq:
+	free_irq(wcd937x->hphr_pdm_wd_int, wcd937x);
+err_free_clsh:
+	wcd_clsh_ctrl_free(wcd937x->clsh_info);
 	return ret;
 }
 
-- 
2.34.1
