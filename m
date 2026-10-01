Received: from mr5.vodafonemail.de (mr5.vodafonemail.de [145.253.228.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ECEB3BAD84;
	Thu,  1 Oct 2026 19:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=145.253.228.165
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790883309; cv=none; b=r4WOwLb+z0sinBIWwrCbdNygYvlgwDsdzLWjWHiXiupIxKJbTM5vMkHCG3FMH4WuAYr67/tBARBeeQEvxPHqQh22feGbHtcRWO89eTzrB9G4zFnubUh5+DeXed9aKYRff4Gb/BqtCPu4atl7hJYacS866hXhNDJzurVGhyZUCvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790883309; c=relaxed/simple;
	bh=P1K50zfPfDxntM6taKZQw51NZYMeQUvrdXfOO9PjY9s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qk7K5pjFm/Y2E46giC6a4nlexb4ZLScIOqAfr+O50tADgrMyG2URzPy0u5NqMVDZWgtSSHKFPz6C7XQ+2R1aSUo1vgR4ukyQS8ENPMj/kPqcxb+QNd1Xjwma2ANKYCc/na/DrUBfXZGK2WZYsxcdKhTtzqXeLblSU+Kzn/gxT5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vodafonemail.de; spf=pass smtp.mailfrom=vodafonemail.de; dkim=pass (1024-bit key) header.d=vodafonemail.de header.i=@vodafonemail.de header.b=yMpUTwxe; arc=none smtp.client-ip=145.253.228.165
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vodafonemail.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vodafonemail.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=vodafonemail.de header.i=@vodafonemail.de header.b="yMpUTwxe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vodafonemail.de;
	s=vfde-mb-mr2-23sep; t=1790882794;
	bh=P8IIrGSkylofkUztr8by5eRb0olCtVuANl12J5ojLzU=;
	h=From:To:Subject:Date:Message-ID:X-Mailer:From;
	b=yMpUTwxemiGa4dc0rdJPEkn2rpxOYNqPn6mWR5jEUaPMudbXrrVxeC4gT1ZBLYZpA
	 jKT+IAEh4TJJt8DPqBtt+M9uRruInKA4fIFzIu3LGzR5plx3oM3VVOewB8OEH4qcgR
	 vG6PcRsIFT/HtD3BAvfu9DO/i+lR2aDI0NF0+S+I=
Received: from smtp.vodafone.de (unknown [10.5.0.38])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by mr5.vodafonemail.de (Postfix) with ESMTPS id 4hwhjk1zS3z3sTfp;
	Thu,  1 Oct 2026 19:26:34 +0000 (UTC)
Received: from tachyon.qsoe.net (ipservice-092-208-226-177.092.208.pools.vodafone-ip.de [92.208.226.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.vodafone.de (Postfix) with ESMTPSA id 4hwhjH28jYz98VW;
	Thu,  1 Oct 2026 19:26:08 +0000 (UTC)
Received: by tachyon.qsoe.net (Postfix, from userid 516)
	id CB9582E0152; Thu, 01 Oct 2026 21:26:07 +0200 (CEST)
From: Yuri Zaporozhets <yuriz@vodafonemail.de>
To: broonie@kernel.org,
	lgirdwood@gmail.com
Cc: perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	xingyu.wu@starfivetech.com,
	Yuri Zaporozhets <yuriz@vodafonemail.de>
Subject: [PATCH] ASoC: dwc: Use OF match data again for StarFive JH7110
Date: Thu,  1 Oct 2026 21:25:52 +0200
Message-ID: <20261001192552.2904-1-yuriz@vodafonemail.de>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-server: smtpa07
X-purgate-type: clean
X-purgate: clean
X-purgate-size: 2507
X-purgate-ID: 155817::1790882790-2754384E-652A79A9/0/0

Commit d6d6c513f5d2 ("ASoC: dwc: Use ops to get platform data") made
dw_i2s_probe() fetch its platform data with of_device_get_match_data(),
and commit 52ea7c0543f8 ("ASoC: dwc: i2s: Add StarFive JH7110 SoC
support") put the JH7110 configuration into the OF match table. Commit
9c97790a07dc ("ASoC: dwc: Fix non-DT instantiation") then went back to
pdev->dev.platform_data so that non-DT users such as AMD work again.

Since then the JH7110 match data is never read. The probe runs neither
the JH7110 clock and reset setup (i2s_pd_init) nor uses its capability
flags; it configures the DAI from COMP_PARAM_1 instead. On the
VisionFive 2, i2stx0 drives the bit and frame clocks for HDMI audio, but
COMP_PARAM_1 reports it as slave-only, so the sound card fails to probe:

  designware-i2s 120b0000.i2s: ASoC error (-22): at snd_soc_dai_set_fmt() on 120b0000.i2s
  asoc-simple-card sound-hdmi: probe with driver asoc-simple-card failed with error -22

Take the OF match data first and fall back to the platform data when
there is none, so that both DT and non-DT users get their configuration.

Tested on a VisionFive 2 v1.3B (v7.0.3 with local HDMI audio patches):
the HDMI sound card now probes and plays through i2stx0. The non-DT
path is build-tested only.

Fixes: 9c97790a07dc ("ASoC: dwc: Fix non-DT instantiation")
Assisted-by: LLM
Signed-off-by: Yuri Zaporozhets <yuriz@vodafonemail.de>
---
 sound/soc/dwc/dwc-i2s.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/sound/soc/dwc/dwc-i2s.c b/sound/soc/dwc/dwc-i2s.c
index ade89c196..dbda943cf 100644
--- a/sound/soc/dwc/dwc-i2s.c
+++ b/sound/soc/dwc/dwc-i2s.c
@@ -18,6 +18,7 @@
 #include <linux/reset.h>
 #include <linux/slab.h>
 #include <linux/pm_runtime.h>
+#include <linux/property.h>
 #include <sound/designware_i2s.h>
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
@@ -922,13 +923,16 @@ static int jh7110_i2stx0_clk_cfg(struct i2s_clk_config_data *config)
 
 static int dw_i2s_probe(struct platform_device *pdev)
 {
-	const struct i2s_platform_data *pdata = pdev->dev.platform_data;
+	const struct i2s_platform_data *pdata = device_get_match_data(&pdev->dev);
 	struct dw_i2s_dev *dev;
 	struct resource *res;
 	int ret, irq;
 	struct snd_soc_dai_driver *dw_i2s_dai;
 	const char *clk_id;
 
+	if (!pdata)
+		pdata = dev_get_platdata(&pdev->dev);
+
 	dev = devm_kzalloc(&pdev->dev, sizeof(*dev), GFP_KERNEL);
 	if (!dev)
 		return -ENOMEM;
-- 
2.55.0

