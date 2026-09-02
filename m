Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85DA238DC53;
	Wed,  2 Sep 2026 07:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788333660; cv=none; b=VSqujrGvTqk89n2XYx3lfC5AK+vrRJKf2fj+6stkYY0juJrIy7OWZzDXbCc/i99XYhusMHy28KQr5uQB+MgACdzutM+2mPYsdygBD3IhbAyDtmeFO7BYT4ScN6XQVffbVkMoiM7voieJUi8yFQhMa1LjXmR34YwGg5jhz0L2VJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788333660; c=relaxed/simple;
	bh=R/4XowQmGvxTlj2rCZ1tdczvx2JUZWBc0dNrP/2sr0Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RsMXgq1SsijHHm2ER7wNJQKTvxjenu8o/tzYmdw7ktVGKKBVy33xNSOwVkb7iHCm5DYAZWJyPigUWk+NDxRnca8tpC8UhxXnsk7L0tseuknAgPJOGS8wNYvCvmoCcmrH5IZvXxoEFgqD+pQRXoeI5JQqFJkFEVwlR4U89s34sTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=YTWCjTpO; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="YTWCjTpO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=vw
	1Xvpggs2mVj8lsae6MPUwNod4aHqBhrGAI+BPAJEg=; b=YTWCjTpOPUqjx8dsOM
	w42+CJhoFN3qpnUDHC+tpNNAiLxxYI6hyXWkT7XPHyNTBgA1Eo2LOqGf8lwrZoLo
	kkZR+EoNT6+UL4ARtw+n263ZOjUHhzzNRJazCqrsdA/H0QZgG6jaos1AwkYiCTUj
	5Uv7cF2mF3cYbDlkOUMkUvy94=
Received: from localhost.localdomain (unknown [])
	by gzsmtp1 (Coremail) with SMTP id PCgvCgBnP6UuzpdqMkg2NQ--.54267S5;
	Wed, 02 Sep 2026 15:20:19 +0800 (CST)
From: wangdich9700@163.com
To: srini@kernel.org,
	broonie@kernel.org,
	tiwai@suse.com,
	wangdich9700@163.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	wangdicheng@kylinos.cn
Subject: [PATCH 3/3] ASoC: qcom: fix VA CDC DMA DAI range handling
Date: Wed,  2 Sep 2026 15:19:43 +0800
Message-Id: <20260902071943.522194-4-wangdich9700@163.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260902071943.522194-1-wangdich9700@163.com>
References: <20260902071943.522194-1-wangdich9700@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PCgvCgBnP6UuzpdqMkg2NQ--.54267S5
X-Coremail-Antispam: 1Uf129KBjvJXoWxAF4kAFWkZrWUAF1UGFy3Arb_yoW5WFWrpF
	43Wan8KrZ8Aa97Zw17Jr45Wr1UGr4xtFWxCay5J3Z7Jwn8ArnFqay3JF1IgFW2kryIqFn3
	JrW7Z3s8uF4vgrDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0ziAuc_UUUUU=
X-CM-SenderInfo: pzdqwv5lfkmliqq6il2tof0z/xtbC5xNAj2qXzjOk+wAA3k

From: wangdicheng <wangdicheng@kylinos.cn>

Several switch statements used "LPASS_CDC_DMA_VA_TX0 ...
LPASS_CDC_DMA_VA_TX0" which only matches VA_TX0, leaving VA_TX1
through VA_TX8 to hit the default case and print a spurious error.
In lpass-cdc-dma.c this also meant the va_mem0 clock was not
prepared for those DAIs. Use LPASS_CDC_DMA_VA_TX8 as the upper bound
to match the rest of the driver.

Signed-off-by: wangdicheng <wangdicheng@kylinos.cn>
---
 sound/soc/qcom/lpass-cdc-dma.c  | 8 ++++----
 sound/soc/qcom/lpass-platform.c | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/soc/qcom/lpass-cdc-dma.c b/sound/soc/qcom/lpass-cdc-dma.c
index 5be13dd59517..dc645fcfd33b 100644
--- a/sound/soc/qcom/lpass-cdc-dma.c
+++ b/sound/soc/qcom/lpass-cdc-dma.c
@@ -180,12 +180,12 @@ static int lpass_cdc_dma_daiops_startup(struct snd_pcm_substream *substream,
 		clk_set_rate(drvdata->codec_mem0, CODEC_MEM_HZ_NORMAL);
 		clk_prepare_enable(drvdata->codec_mem0);
 		break;
-	case LPASS_CDC_DMA_VA_TX0 ... LPASS_CDC_DMA_VA_TX0:
+	case LPASS_CDC_DMA_VA_TX0 ... LPASS_CDC_DMA_VA_TX8:
 		clk_set_rate(drvdata->va_mem0, CODEC_MEM_HZ_NORMAL);
 		clk_prepare_enable(drvdata->va_mem0);
 		break;
 	default:
-		dev_err(soc_runtime->dev, "%s: invalid  interface: %d\n", __func__, dai->id);
+		dev_err(soc_runtime->dev, "%s: invalid interface: %d\n", __func__, dai->id);
 		break;
 	}
 	return 0;
@@ -202,11 +202,11 @@ static void lpass_cdc_dma_daiops_shutdown(struct snd_pcm_substream *substream,
 	case LPASS_CDC_DMA_TX0 ... LPASS_CDC_DMA_TX8:
 		clk_disable_unprepare(drvdata->codec_mem0);
 		break;
-	case LPASS_CDC_DMA_VA_TX0 ... LPASS_CDC_DMA_VA_TX0:
+	case LPASS_CDC_DMA_VA_TX0 ... LPASS_CDC_DMA_VA_TX8:
 		clk_disable_unprepare(drvdata->va_mem0);
 		break;
 	default:
-		dev_err(soc_runtime->dev, "%s: invalid  interface: %d\n", __func__, dai->id);
+		dev_err(soc_runtime->dev, "%s: invalid interface: %d\n", __func__, dai->id);
 		break;
 	}
 }
diff --git a/sound/soc/qcom/lpass-platform.c b/sound/soc/qcom/lpass-platform.c
index b335b2c8bb16..2f65e6a589bc 100644
--- a/sound/soc/qcom/lpass-platform.c
+++ b/sound/soc/qcom/lpass-platform.c
@@ -490,10 +490,10 @@ static int lpass_platform_pcmops_hw_params(struct snd_soc_component *component,
 		break;
 	case LPASS_CDC_DMA_RX0 ... LPASS_CDC_DMA_RX9:
 	case LPASS_CDC_DMA_TX0 ... LPASS_CDC_DMA_TX8:
-	case LPASS_CDC_DMA_VA_TX0 ... LPASS_CDC_DMA_VA_TX0:
+	case LPASS_CDC_DMA_VA_TX0 ... LPASS_CDC_DMA_VA_TX8:
 		break;
 	default:
-		dev_err(soc_runtime->dev, "%s: invalid  interface: %d\n", __func__, dai_id);
+		dev_err(soc_runtime->dev, "%s: invalid interface: %d\n", __func__, dai_id);
 		break;
 	}
 	switch (bitwidth) {
-- 
2.25.1

