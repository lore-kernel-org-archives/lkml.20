Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DC8A3B05A0
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 11:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791371419; cv=none; b=NYRMDYjyCzgDnPrzLJRDSGxt+/Nz1u4ndFO/DwKeloMwnQw0nzc3qEizuwN8QK9kNU1jAG9TN+xeinT8v63yHJTz8Ryk3ahSM1V2/PmL6UwWCoCqj6yVa4DUc24Y9ty76NvI9j4C6UwIr/kchRx1pnTlLhah+DY9DrKFTSXl958=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791371419; c=relaxed/simple;
	bh=H3PDzDrtO5c8WYmCowPyg7cQ4FV1kL+eaDhtUert0sI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s65mfNGSKi9nUaQ0T3R9KQ/+9jwmy4yN7YuyLlkiYNTMYU+CvjqhqWtu39J1KYcbEGfpH4MWSDt1ZT+QSLXW0C+LNpY0w7mGaAtfTKVth3fiCM2K0/z/U8plD+cuCAVuMQYvjCm+lzMK7pOTmXmjgBVCyNrfrWaptyBHi5pbbns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bt0e4QUU; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bt0e4QUU"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cc1d57602e8so744263a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 04:10:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791371402; x=1791976202; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZrZPU62D++2Mpf09f9HLGIFyK7TMDyESiaONSZX8Yvw=;
        b=Bt0e4QUUfLPs8vfmGhBKqHde4p3Zeg8VEjrEnwmZW3o2WwOX0is29QZDpEYjigrfk3
         c9G0W3QOJA/3kbdHX9V5oDBiHiz5Zy8GafnBwjx0hqMgD0KQyNd5NEXCUHIVeBsrcYhz
         GnrggQj1eY6ZvVs3o6Hyu5NQnQ4hnZKPzg3HVLscpTyNt2qc5wbWw+ScoSr2iCDFGyEM
         PHrMDbNfcMTKWzn4yAltr9iZwVAMjscR1JawREqiQ0fpYiDT5uWvURi9GOzjhMDhM1Fr
         O8uc4fbekxLirPRIH0ePtbtLaUdO6N4ZbwrKI4pZ3QKc53lwAjIO/L5DkvYCX4R+Fa9e
         A+jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791371402; x=1791976202;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZrZPU62D++2Mpf09f9HLGIFyK7TMDyESiaONSZX8Yvw=;
        b=gZxivPKw60lAdsPLjsOFALKYRGrxnEQHicbre80vor1ASp66K76Nc9OaLP6GLrK2kL
         GvWlZC/SqAM/wA4IS1oyfFePvfGNXbl9sHcmYYOeqgHdGXV50B9iT1pULSXWXgmVQGx9
         GRHPrQmDDZd9IlK5VsIltGkKlyDmXhbiH5ag7kkR9OVv1MoYJLW5UBpiXNa258u94xuO
         0EzfGcIaM2lcqrXFwccofrS5rl5kHxWjK/8rsILi1i7HcOhCJUuyS9Ik3QIuPEH277Pu
         NCXbsyLQ4IOlUxuKt1dX653p+1hzrzwiIbgFPnifzpOwexUtv8P0O6vSTvkOHZ+BT3B+
         9g6A==
X-Forwarded-Encrypted: i=1; AKwUvBwVLzZinu0Rsmi41ITX4kTlCx6/DsRP/WTJj2R4edTO43RpBhkRREB/2S3xKA0aw/4SL+jxyt11vbl+z/E=@vger.kernel.org
X-Gm-Message-State: AFq9FYKxAbf002rioHZGwDlBWMBlWZu3K4Av3+i82ykOCEAEug7clDna
	sGedxpq3KXQ92ZWh+7vPfyA9nfHWqGIypjFqki35WQWf0dOoCqa2ZM83
X-Gm-Gg: AYBFou298la/W5/tGPhLjRt3DhVyTH+aLdYn00WuOY6XtFbL/WM9kanXaXFd6qVd9S0
	U2uXdumxw/4BfyQsje7EQBJZi6odFxZ7nXYPtUz61qugLDVR8eGiyrenGUTfZf4ZjuOje5sgATM
	0oikE8jc9JD8rpqr7j9F/PB8k9MVB1hkEYquFZz42K05Cki4gCR87Y1tjPYF3NSxsYDzoLpcSN9
	v01l15FyQrhZ0qRnoBP4rUBmRy+L3q//1DaabaEovXWiuGeqWsxlr4Y7s75/uohsSEV1Vs2VD3C
	7PfPMfYxkdddI2gzZ5+7aPlu9aX5oLkF+0xJF22MHENKgoM1fR37232BR/B7DHkNF7QH9YD+f12
	/iAN4ZxVrsbbIkgYL8XeQK+exAOhZbZLLpub3NrL7410xlCP+g/qVAcUimlvZ0F9SMAEhdY7YYR
	lU6aJAL87sWi05Y6aURA2G0RK6Bp9c7rstSqs9HxpblH4N+wob16LqBNwPgdgbVR+WXHsHu7fCl
	DewGLvbshvi4L4xvDsMcQITjyxurbTYNCNdf2iMJ5ObzTaoATU7fm9sqCSG5Z27D6lgkQiNvEv7
	TnQx8XAASAOx0Q==
X-Received: by 2002:a17:90b:4cd0:b0:3a6:f1d2:57f8 with SMTP id 98e67ed59e1d1-3a8a08354bbmr1628776a91.2.1791371402126;
        Wed, 07 Oct 2026 04:10:02 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a8a5ec70dbsm1328745a91.2.2026.10.07.04.09.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 04:10:01 -0700 (PDT)
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
	Haotian Zhang <vulab@iscas.ac.cn>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Cyril Chao <Cyril.Chao@mediatek.com>,
	Tuo Li <islituo@gmail.com>,
	Rosen Penev <rosenp@gmail.com>,
	Garlic Tseng <garlic.tseng@mediatek.com>,
	Alexandre Mergnat <amergnat@baylibre.com>,
	Dan Carpenter <error27@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 4/4] ASoC: mediatek: mt8365: Handle constraint return value in FE startup
Date: Wed,  7 Oct 2026 18:08:58 +0700
Message-ID: <20261007110858.509341-5-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261007110858.509341-1-phucduc.bui@gmail.com>
References: <20261007110858.509341-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

snd_pcm_hw_constraint_integer() may return 1, which is then returned
from mt8365_afe_fe_startup(). ASoC only treats 0 as success when marking
the DAI as started, so .shutdown() can be skipped on rollback.

Return 0 explicitly on success.

Fixes: e1991d102bc2 ("ASoC: mediatek: mt8365: Add the AFE driver support")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8365/mt8365-afe-pcm.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/sound/soc/mediatek/mt8365/mt8365-afe-pcm.c b/sound/soc/mediatek/mt8365/mt8365-afe-pcm.c
index e9497246f37c..314235557fdf 100644
--- a/sound/soc/mediatek/mt8365/mt8365-afe-pcm.c
+++ b/sound/soc/mediatek/mt8365/mt8365-afe-pcm.c
@@ -514,11 +514,14 @@ static int mt8365_afe_fe_startup(struct snd_pcm_substream *substream,
 	snd_soc_set_runtime_hwparams(substream, afe->mtk_afe_hardware);
 
 	ret = snd_pcm_hw_constraint_integer(runtime, SNDRV_PCM_HW_PARAM_PERIODS);
-	if (ret < 0)
+	if (ret < 0) {
 		dev_err(afe->dev, "snd_pcm_hw_constraint_integer failed\n");
+		return ret;
+	}
 
 	mt8365_afe_enable_main_clk(afe);
-	return ret;
+
+	return 0;
 }
 
 static void mt8365_afe_fe_shutdown(struct snd_pcm_substream *substream,
-- 
2.43.0

