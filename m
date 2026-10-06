Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BB522F8EBE
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 10:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791281793; cv=none; b=KExVUXi2Sk2zOI9HlHvdJYkESwQ/pkFx+aVT5g4Bt/KOspC1/QVEXGroOHYvflL3s4Yjpr/sQ99rINdEFerWH9fVZwancMulrxymxy6c61yqTMUbyqcWvB5XiA1Pb8MFpH7qkTH6DXo20PYUBLgJ4M0stskwJJHGoN4pHDB6e5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791281793; c=relaxed/simple;
	bh=IPGYtaOQglwuqgGFcejyGd0b+qOVVjwrtRjhs5z1A04=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=udBOJIkGm8lEFglNpLkjTO40R2Q4AMDibMnucETFvAdqAwrVLm0IYTtcruJUl6hd69rP2RpHEPLenyc4VdnRH7dm/hFobspHsMs0kRwA0GcIFW1Vatalywr1liS3TZsUA0iMW59KSeBjkArCtFGL2BzAQxkKczuaf9WcwwIKyfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Uzy7gP7f; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Uzy7gP7f"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-873a4edb243so1911169b3a.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 03:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791281791; x=1791886591; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SACGOLnAL8mTnZGcUa8MVcCzBnwjTHmyT/MfByO6AXo=;
        b=Uzy7gP7fq2HfIXZAg8nnFJdXOO2uh5tl5MhO7qczvUk27zFMUmPO1UkAn6PnF/wm5Q
         UL7NBb47kJjo94l2hfRxKxYTBbgCvvJthLytoktAb6jVaOsX+CclwoinkQiyj9OQS0YZ
         YKNzzAVA2iQXoj6P2/XJvU84gd073ZElG4yzmeSh4OK9+K93rQW/E1eTBetE1AVOcfEi
         4hkr27yWs366cnBhbWRh887XTfvEYsq6tN/MERTXWGGnTSPz6nDd2iOpLz/Z7aiQcc0C
         zr9QonaAD50zf/K6Fu5z9E1BoBbYVEuYnMOAdtHiKGHTMB/BupnouIrTbBotZ/OO8bW8
         O3iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791281791; x=1791886591;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SACGOLnAL8mTnZGcUa8MVcCzBnwjTHmyT/MfByO6AXo=;
        b=o5G0JoIF2q6OMcxbKunM76H5FbrIczyX7nxxdfZjE7xb9ZIDZH71b8olROgJO+3Tbd
         2dzHkF/rI9SGAUDWbwrZyxCgPdlchcyGpGXi/g9mauVXyZPO2pCfF0JDc/y9Cx8fTm1W
         whTv0XfKqd/NJJ7vfeCbClKE3zKgDHYU5MFhewd7UVerEvDtJGeS6CCpnX7o7CmW8zBv
         C2/Lb02Yk18cd/p3UEI0CuY1aMbZaCk9VPGWF8oMb6a+NZTAeUGoyBWrk/Hnq9DL1j3k
         dgqsksttU+96MA4QJdSU3subsholmj54YORu4qBxvfng7t4XY+J7PndkzS7zwbmoNhAl
         MrnA==
X-Forwarded-Encrypted: i=1; AKwUvByXdRPL1ZXkv4G1osQWI00yHGe8dcDdQsmQYd6I8ZnbRrzA0vX3hQCiqyDhUE0V/utbdI9jdtPWdhcAfqE=@vger.kernel.org
X-Gm-Message-State: AFuF++nZ6j9zcofQp3rJM69OBt7q3wCBLfq4luYxDeXdsYKwdTwowzFX
	6mjoHd9sTp/I4JuNQXDoVzCbsvhxpc2BiqWeQTAC5JxIxp50ViNB06yQ
X-Gm-Gg: AYBFou1cRnf0AUuw0I41QoNnvSC0qXOnY2st45FO4iany4TFcHs4BuievSr0EF4sAiB
	5GOc66p/3mbaQVFnwNoWwkmgIkJ8PbVTT7R5ogYXirJ4ucDOv0paLqppc9LP/JVCv4JAKsBvH8B
	B4wrqqL+74VpuFJIm3Ykq1RZzTm9fLee5BVbi09E5U3m/KKttu6BW8qBPETh/LIMnqJGk5yKgK6
	OtqfE4x0nP9XjOdvHp/10s4T4iWajYDKZ22v3wrIcQIWGgM863dIcS86i/ogAZXf2YdPTxXI+4n
	P8OuJ5JyK9utrC9SIP2Vkr/jNZxFeiNkCMFCrtLfdPbJ63PGvH2MK/OVn2D0c56d3aD/GdTOs+c
	vOpBRcYdzQDABSFu6b+CmHLBFM678b3hqu78nJxd/VHb+70WGgxoZ7tAh0CGENxvDy69x03i5Bq
	4l/q3StfXMqgaWsAnjufJzjuOoY9WDE9iQsDQ2Mm22BM6fCHVomEBuXJ8thKHDPNhptRJQFa2jm
	tsZcGS7wQwFUju1fasBP97xJADqjr84f7LlLPYxiE+8CqF3saMDT94omOkgTryDgRaPaIk/oL2n
	Mdh0TiBOpJ37cA==
X-Received: by 2002:a05:6a00:14c2:b0:885:e24e:16c5 with SMTP id d2e1a72fcca58-88c64d112b6mr9929947b3a.50.1791281791595;
        Tue, 06 Oct 2026 03:16:31 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88b0d152432sm4547505b3a.53.2026.10.06.03.16.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 03:16:31 -0700 (PDT)
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
Subject: [PATCH 1/4] ASoC: mediatek: common: return 0 from mtk_afe_fe_startup() on success
Date: Tue,  6 Oct 2026 17:16:03 +0700
Message-ID: <20261006101606.54079-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261006101606.54079-1-phucduc.bui@gmail.com>
References: <20261006101606.54079-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

snd_pcm_hw_constraint_integer() may return 1, which is then returned
from mtk_afe_fe_startup(). ASoC only treats 0 as success when marking
the DAI as started, so .shutdown() can be skipped on rollback.

Return 0 explicitly on success.

Fixes: 283b612429a2 ("ASoC: mediatek: implement mediatek common structure")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/common/mtk-afe-fe-dai.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/sound/soc/mediatek/common/mtk-afe-fe-dai.c b/sound/soc/mediatek/common/mtk-afe-fe-dai.c
index 948f606cbaf2..ec99bc4a5d5e 100644
--- a/sound/soc/mediatek/common/mtk-afe-fe-dai.c
+++ b/sound/soc/mediatek/common/mtk-afe-fe-dai.c
@@ -75,8 +75,10 @@ int mtk_afe_fe_startup(struct snd_pcm_substream *substream,
 
 	ret = snd_pcm_hw_constraint_integer(runtime,
 					    SNDRV_PCM_HW_PARAM_PERIODS);
-	if (ret < 0)
+	if (ret < 0) {
 		dev_err(afe->dev, "snd_pcm_hw_constraint_integer failed\n");
+		return ret;
+	}
 
 	/* dynamic allocate irq to memif */
 	if (memif->irq_usage < 0) {
@@ -88,10 +90,10 @@ int mtk_afe_fe_startup(struct snd_pcm_substream *substream,
 		} else {
 			dev_err(afe->dev, "%s() error: no more asys irq\n",
 				__func__);
-			ret = -EBUSY;
+			return -EBUSY;
 		}
 	}
-	return ret;
+	return 0;
 }
 EXPORT_SYMBOL_GPL(mtk_afe_fe_startup);
 
-- 
2.43.0

