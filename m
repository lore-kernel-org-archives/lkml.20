Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 437FA33C1B7
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 01:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792028706; cv=none; b=KhByILSLSLsSqO/C6o2OQ6CFkQXdSyCrSl/gOFTTiLh45MtDZQrWeh3zReDhno4TGBJ9mpx4w0aEegwLiWyrHgw3VQ6BEWI7adLMiXzKq5FW9U1DLcfogT2hOkzQc9MrrqKS4tzcVkgjqLZqef7VkrBO2s2IP0CUSu47qFas7/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792028706; c=relaxed/simple;
	bh=GOpvHClNFcgwMbCGA4S9aUo3sNtP7+Tu6UirQoDa9Rs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GzedcG+9+E1qvq3MaOikGM89C4yUzeP4WpOqfpSpCjMwRCy3REdcAUZBfV/xj8LMT152Cj+98xRZYM9qZvKRO8M7NBjqkqGO8LF/pBTbsxhidYcYytXQGlVpqGy1yc7kECJo0LAc67ZdMeCGOZi9cG4OLpdx4ATmOyDZrKKH9oQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pWe8eaMz; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pWe8eaMz"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2e831e86ebfso8942455ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 18:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792028705; x=1792633505; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tHQEAftjxeSOQpgNapgwf4pKKw/+LL69dyB2CtXEGKE=;
        b=pWe8eaMzFM+2VJHr3s4G3R8lHZ6Wxq4Ic+on315yTHcZJHk/60cnmZPrHjNYJX7rBl
         vtFOGCdvxcPpVWlNk7cbsGHDv01Mg+2pEC4Idsp+IoKt1z0VlNksf8th4bmdRLeLWYpL
         PQ3ziUbSK/hjIoFgVL+GonH9SAEy5YYC1AGJbXJDfUdFEbZf4BdxhJdNs0L8HF9Pnp8J
         I6kDeN+hLxGboyjyEjTHgL1xWRr5akjTxy8QK1gj6Irvq5lsuQL3JJEtlA4aXBcpmp+e
         TZmrxDuc1TmklT8kBJlUFT+jdvexsX4sMzZrCZmtejW55O1bUEPC6Bhx4fY+vIOCm3j1
         qyig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792028705; x=1792633505;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tHQEAftjxeSOQpgNapgwf4pKKw/+LL69dyB2CtXEGKE=;
        b=OukA9miApt+qsWuAVec8GsgkILM+37GRC4ZRE2hW/EhFa/O4brJz0i++p8d+1SW6Co
         swdz5Z5skTzcQc4fvVcCVZKlOVzJFOk3IUKjHe58tOnDPOkulcyQczzW1i1bPUMN/ZQR
         Y9TE83fbn+bv+us3pLmAEwBIrMhua27MvmAptkvvOLlOVOf4V8wHgtGt2wUE6w5BMGYN
         4F/6B0BvuOZwcg2jtY/BRmi0SlBVWo1mCuD7k2a57btq1fN4bWzoSIN4gKUWsvtUfxoD
         s6GwPRCxXnXrWBKKI4e9KB68B+W7GilTrZYWd7W8q7O1h56znNbW4ZiRJ2csoaecUjQi
         IHQw==
X-Forwarded-Encrypted: i=1; AKwUvBxDBem+4VgFm1pb63gEGYB9kb5SB3ptLKiqnmBBsNHrnCfnc6//qJ5G02WTQx1fJV1kTjcmwqdRZAsUuQY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKpu36B0Xr/9NdEWUcAdReXcnDMCr3cxtU3ZPwCHWJK8zc0IlkT
	NZ9jWrtrLSH/ODRI3DgNa0vNCXVhl44FjMmwxa93GBcpBMxf8twm1K40
X-Gm-Gg: AYBFou0ODxFzzX25+bF7j5NM4Yc1nugfZytwaH9RQp1QGUsdPdxngVNrA4BQ2ikGyOc
	WFptpol1Z1iak7/C4PXwTYH0tAYvwWtiSvSXCHRAco3aq0MJYlieFEwXEQ0O0hb4S6bMVRO2uPt
	tWUKPjjendkoKUNNVCmXfj0OvLRMWqujxljfmHE6hrMIqWwXNp7swCeaaUtivpCWFs38mD65wvt
	HVhfd6NBvwio/lehk6YQTtBTy73X5l38C/WQS5xLJwVnITiwnVTgEOncBPA9SECAwjJp6DM9yJy
	ZI9wR0lZCeVfvIXZ9cXNt37H5S+HRM4CnN3mUBN4jSm5VdsjUUYZMgcfQw6WQwcQzZurdN+SXZ4
	Th8CbisQjztleRpwJF6+HZCTt9whp3n9mh15wFkNjnkzgnvJ25CnpUo4YYDejITS62TAXXznETE
	e4tG2gI8aYOhi+VXZO+SVTszIwD9VjjIevH/PbFO+1dxGje0351hu+b+MTTg/hDxtyM936RySQx
	wd7AiX6c21PBKd3pqPSpIyl3IBEeXVtGpvoBdgu+FkoCKPKT4elu82VTe5HfBtEpv7ixpEcMuef
	y2q3Ng2o5soDCA==
X-Received: by 2002:a17:903:110e:b0:2e9:2a1a:8b69 with SMTP id d9443c01a7336-2e92a1a8ba7mr50722885ad.55.1792028704623;
        Wed, 14 Oct 2026 18:45:04 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422b8cc1sm73202995ad.54.2026.10.14.18.44.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 18:45:03 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	povik+lin@cutebit.org,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Andrei Simion <andrei.simion@microchip.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Kees Cook <kees@kernel.org>,
	Syed Saba Kareem <syed.sabakareem@amd.com>,
	wangdicheng <wangdicheng@kylinos.cn>,
	Chris Bainbridge <chris.bainbridge@gmail.com>,
	Linus Walleij <linusw@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Neo Chang <YLCHANG2@nuvoton.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	u.kleine-koenig@baylibre.com,
	Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Hemanth Selam <hemanth.selam@gmail.com>,
	Md Shofiqul Islam <shofiqtest@gmail.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Zain Aboobacker <zainaboobacker33@gmail.com>,
	Sang-Heon Jeon <ekffu200098@gmail.com>,
	Bo Shen <voice.shen@atmel.com>,
	Vinod Koul <vkoul@kernel.org>,
	linux-sound@vger.kernel.org,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	patches@opensource.cirrus.com,
	linuxppc-dev@lists.ozlabs.org,
	imx@lists.linux.dev,
	linux-rockchip@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 03/25] ASoC: amd: ps: Fix acp63_sdw_dma_close() being skipped on rollback
Date: Thu, 15 Oct 2026 08:43:02 +0700
Message-ID: <20261015014324.5569-4-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261015014324.5569-1-phucduc.bui@gmail.com>
References: <20261015014324.5569-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

snd_pcm_hw_constraint_integer() may return 1, which is then returned
from acp63_sdw_dma_open(). ASoC only marks the component as opened
when .open() returns 0, so .close() can be skipped on rollback.

Return 0 explicitly on success.

Fixes: f722917350ee ("ASoC: amd: ps: add SoundWire dma driver dma ops")
Reviewed-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/amd/ps/ps-sdw-dma.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/sound/soc/amd/ps/ps-sdw-dma.c b/sound/soc/amd/ps/ps-sdw-dma.c
index f27ebbd21379..c2640985f54c 100644
--- a/sound/soc/amd/ps/ps-sdw-dma.c
+++ b/sound/soc/amd/ps/ps-sdw-dma.c
@@ -337,7 +337,13 @@ static int acp63_sdw_dma_open(struct snd_soc_component *component,
 	stream->stream_id = cpu_dai->id;
 	stream->instance = amd_manager->instance;
 	runtime->private_data = stream;
-	return ret;
+
+	/*
+	 * ASoC only marks the component as opened when .open() returns 0.
+	 * Since snd_pcm_hw_constraint_integer() may return 1, explicitly
+	 * return 0 to ensure .close() is not skipped on rollback.
+	 */
+	return 0;
 }
 
 static int acp63_sdw_dma_hw_params(struct snd_soc_component *component,
-- 
2.43.0

