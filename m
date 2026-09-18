Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31D9551121B
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 13:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789738818; cv=none; b=Fl85V3TIN5DPtCJ4ZuEvXTfOT2aHidWTUyaBmx4SbxIFYgYL49B+iYm2mABwyMQU24vDMqX+IZozSTdotxsOtBmJ8V724uV494zQS7DwoOPpQ0v/uQ2Cs/iSIxtlZWm0iTb1pGTyvcAu82PGhZgwmFPmHBrYlon6b8omQ3UasBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789738818; c=relaxed/simple;
	bh=zF3/ckz404Yi/c/ZZWGulZd1TWbyZZLDncJjcMPvwY0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p3KBP8TrJyCYAcdMQRLMQrFVf94ZC9/yLO4s6va24aX68lQsjdcbCU3+fr9tLqe9HBN6f06LpFTJ0njEnht4I6om/B0PJRg0cYTXiRSRJVq3gO7mt5wthUIPaKB20D31/ZknOpK5N35hK7l9ITqW1HTSSBVYiB6tJzNM4UVnC3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q6FokFMi; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q6FokFMi"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396ccd5cf03so742867a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 06:40:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789738816; x=1790343616; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cT4KjTlEVnVWRGXoeui+h6lXwGfVb9+9GPpMaARw3xA=;
        b=Q6FokFMi5kZALJfEGr3D9lUieZG+RlywhU0gHtTbrKAzMwCqKC8sXQrol/KR8xqzax
         GdWLUKP+USeZIsITUG4/nXNcUcRmgulAnm0n5LyRZ2+yInRDykKR19oEEsh0FkLYr40V
         v6Rq80AH9v3vKh+/tk1DIckWI642jTxRYCQZAxv0Jk8VE++oBLPXlC/99110jyGUAZAW
         6h1b0SQbuqGBMch+FSPnB37HSenOb1ciBcQYHWnfsMy+S0CGRRnAuJEEVNRKkBVDllv7
         WxFKO6QPhyQK0m69Nv84Dy26WxaeyKV37hosMVTUqCD0gGPSnRSC/H/Bn3RmgeCsTh2h
         oK9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789738816; x=1790343616;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cT4KjTlEVnVWRGXoeui+h6lXwGfVb9+9GPpMaARw3xA=;
        b=KT9CEjSEF/kFidsunAZ4IDIvIlbqwBByx8sUEh09jusUSLZWafGvhf7yHdsBl2HWlb
         hUrRYqtVqShtMNlZKRgp8iLiKHCFXX7gA+9axqSK28ZRu72nJY6/m3bAbBIMOJOfT5tY
         cvzTJzQ/4KbFFCwcOkngrOVtf96qN3IRycMeaNlZHm+LwgH+hfWnDAEFi1YzJmW+GmKo
         kbii08RaD/FPq2IE/1Dv/TV1ProKoAgWZGjX8sSjP0W9BpoO9F2nt+xeG4/w1fhcH+PY
         VdLa6VZ6yCFSIfAzNGiFZb16AtlGTEjAb+man0+IA8Fy+T7UGbvs3zprjlY+/BsjKcCP
         hn5w==
X-Forwarded-Encrypted: i=1; AKwUvBzguy1/0BngeX18rB0qQlx6/xWLXy8y7+Bc1I6GPR5oaNwobYaa/CYdVKJ+qXD6qTjSentjXuwMKPltmuk=@vger.kernel.org
X-Gm-Message-State: AFuF++mF9wifwr9WwT+M5MaKLhu0H6zIymbGuRmc+qmC3ooslW2ZHDfr
	3oGdBZ50pxVtG0ch6E6dSYIPftoelcqJlcLMP+WKzLZ0XGk8ggddFcY1
X-Gm-Gg: AYBFou2OlU8MSdtqRuNmArUJTB6W0NKXYQx8G9i/sWSs3mqVMWX/T/GQZKMDKvRSz7e
	lQXspOIkcgigM+u/63D6QKrKJEKJVOcP63Grd3EzvNQAukE/bvAEXVcdK/5szJJG2Ekr0JRCt1n
	sX3qizbopqb3lLpYIj9JgAmXp9lluS5NRXljJ29CrpAuA28UXd9CX2ZhHtPvR1mGVTsetxyo+Y7
	qvT3K+K/rd0UarfpFfDek3chi6rRayP3uAUiv8NiV6YGlecmBtUttRfeKFQu2aor18IQ0D/JyU2
	RUQHr3OakdJdbSuPCA5DJvTp6T51Q9HKpcLfc/ZXgDFUXUDfzh582PwQdiQfCXLoVwEbz4EvHAe
	8bacTBXO8S/IEP1xE+AM6IHvyYHHqQHjdIgVkVgpbcON1uZmxiar8B+I+dXlnJ/pblnQBivUyQA
	RXOZekd8CteP/x3CvhUQc2EleHVDNEbx9qM2skxOvsh/Yo3+yQ/VW7s80r/ajnoqXdbb24i8RDu
	0jKz2zmJz9sSm9tusYlUj4gKfkhU0tMFJF4YurK1hGsS4Yb6q/x1Pml0ZC62y1HPm6WXJ4dZNAV
	GPEvprZNmX6Ntg==
X-Received: by 2002:a17:90a:e7c3:b0:39e:261:4e12 with SMTP id 98e67ed59e1d1-39e54eb2281mr5551712a91.23.1789738815772;
        Fri, 18 Sep 2026 06:40:15 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e3617443asm13253792a91.9.2026.09.18.06.40.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 06:40:15 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	cassiogabrielcontato@gmail.com,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Jiaxin Yu <jiaxin.yu@mediatek.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 07/15] ASoC: mediatek: mt8192: Propagate errors in mt8192_afe_gpio_request()
Date: Fri, 18 Sep 2026 20:39:03 +0700
Message-ID: <20260918133912.133799-8-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260918133912.133799-1-phucduc.bui@gmail.com>
References: <20260918133912.133799-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Currently, mt8192_afe_gpio_request() ignores the return values from
mt8192_afe_gpio_select() and other helper functions. If configuring
a GPIO state fails, the function still returns 0, hiding the failure
from callers.

Fix this by capturing and returning the error codes properly.

Fixes: 125ab5d588b0 ("ASoC: mediatek: mt8192: add platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8192/mt8192-afe-gpio.c | 74 +++++++++++----------
 1 file changed, 40 insertions(+), 34 deletions(-)

diff --git a/sound/soc/mediatek/mt8192/mt8192-afe-gpio.c b/sound/soc/mediatek/mt8192/mt8192-afe-gpio.c
index b993ca2dbd7c..ed6dfdf2589b 100644
--- a/sound/soc/mediatek/mt8192/mt8192-afe-gpio.c
+++ b/sound/soc/mediatek/mt8192/mt8192-afe-gpio.c
@@ -208,98 +208,104 @@ static int mt8192_afe_gpio_adda_ch34_ul(struct device *dev, bool enable)
 int mt8192_afe_gpio_request(struct device *dev, bool enable,
 			    int dai, int uplink)
 {
+	int ret;
+
 	guard(mutex)(&gpio_request_mutex);
 	switch (dai) {
 	case MT8192_DAI_ADDA:
 		if (uplink)
-			mt8192_afe_gpio_adda_ul(dev, enable);
+			ret = mt8192_afe_gpio_adda_ul(dev, enable);
 		else
-			mt8192_afe_gpio_adda_dl(dev, enable);
+			ret = mt8192_afe_gpio_adda_dl(dev, enable);
 		break;
 	case MT8192_DAI_ADDA_CH34:
 		if (uplink)
-			mt8192_afe_gpio_adda_ch34_ul(dev, enable);
+			ret = mt8192_afe_gpio_adda_ch34_ul(dev, enable);
 		else
-			mt8192_afe_gpio_adda_ch34_dl(dev, enable);
+			ret = mt8192_afe_gpio_adda_ch34_dl(dev, enable);
 		break;
 	case MT8192_DAI_I2S_0:
 		if (enable)
-			mt8192_afe_gpio_select(dev, MT8192_AFE_GPIO_I2S0_ON);
+			ret = mt8192_afe_gpio_select(dev, MT8192_AFE_GPIO_I2S0_ON);
 		else
-			mt8192_afe_gpio_select(dev, MT8192_AFE_GPIO_I2S0_OFF);
+			ret = mt8192_afe_gpio_select(dev, MT8192_AFE_GPIO_I2S0_OFF);
 		break;
 	case MT8192_DAI_I2S_1:
 		if (enable)
-			mt8192_afe_gpio_select(dev, MT8192_AFE_GPIO_I2S1_ON);
+			ret = mt8192_afe_gpio_select(dev, MT8192_AFE_GPIO_I2S1_ON);
 		else
-			mt8192_afe_gpio_select(dev, MT8192_AFE_GPIO_I2S1_OFF);
+			ret = mt8192_afe_gpio_select(dev, MT8192_AFE_GPIO_I2S1_OFF);
 		break;
 	case MT8192_DAI_I2S_2:
 		if (enable)
-			mt8192_afe_gpio_select(dev, MT8192_AFE_GPIO_I2S2_ON);
+			ret = mt8192_afe_gpio_select(dev, MT8192_AFE_GPIO_I2S2_ON);
 		else
-			mt8192_afe_gpio_select(dev, MT8192_AFE_GPIO_I2S2_OFF);
+			ret = mt8192_afe_gpio_select(dev, MT8192_AFE_GPIO_I2S2_OFF);
 		break;
 	case MT8192_DAI_I2S_3:
 		if (enable)
-			mt8192_afe_gpio_select(dev, MT8192_AFE_GPIO_I2S3_ON);
+			ret = mt8192_afe_gpio_select(dev, MT8192_AFE_GPIO_I2S3_ON);
 		else
-			mt8192_afe_gpio_select(dev, MT8192_AFE_GPIO_I2S3_OFF);
+			ret = mt8192_afe_gpio_select(dev, MT8192_AFE_GPIO_I2S3_OFF);
 		break;
 	case MT8192_DAI_I2S_5:
 		if (enable)
-			mt8192_afe_gpio_select(dev, MT8192_AFE_GPIO_I2S5_ON);
+			ret = mt8192_afe_gpio_select(dev, MT8192_AFE_GPIO_I2S5_ON);
 		else
-			mt8192_afe_gpio_select(dev, MT8192_AFE_GPIO_I2S5_OFF);
+			ret = mt8192_afe_gpio_select(dev, MT8192_AFE_GPIO_I2S5_OFF);
 		break;
 	case MT8192_DAI_I2S_6:
 		if (enable)
-			mt8192_afe_gpio_select(dev, MT8192_AFE_GPIO_I2S6_ON);
+			ret = mt8192_afe_gpio_select(dev, MT8192_AFE_GPIO_I2S6_ON);
 		else
-			mt8192_afe_gpio_select(dev, MT8192_AFE_GPIO_I2S6_OFF);
+			ret = mt8192_afe_gpio_select(dev, MT8192_AFE_GPIO_I2S6_OFF);
 		break;
 	case MT8192_DAI_I2S_7:
 		if (enable)
-			mt8192_afe_gpio_select(dev, MT8192_AFE_GPIO_I2S7_ON);
+			ret = mt8192_afe_gpio_select(dev, MT8192_AFE_GPIO_I2S7_ON);
 		else
-			mt8192_afe_gpio_select(dev, MT8192_AFE_GPIO_I2S7_OFF);
+			ret = mt8192_afe_gpio_select(dev, MT8192_AFE_GPIO_I2S7_OFF);
 		break;
 	case MT8192_DAI_I2S_8:
 		if (enable)
-			mt8192_afe_gpio_select(dev, MT8192_AFE_GPIO_I2S8_ON);
+			ret = mt8192_afe_gpio_select(dev, MT8192_AFE_GPIO_I2S8_ON);
 		else
-			mt8192_afe_gpio_select(dev, MT8192_AFE_GPIO_I2S8_OFF);
+			ret = mt8192_afe_gpio_select(dev, MT8192_AFE_GPIO_I2S8_OFF);
 		break;
 	case MT8192_DAI_I2S_9:
 		if (enable)
-			mt8192_afe_gpio_select(dev, MT8192_AFE_GPIO_I2S9_ON);
+			ret = mt8192_afe_gpio_select(dev, MT8192_AFE_GPIO_I2S9_ON);
 		else
-			mt8192_afe_gpio_select(dev, MT8192_AFE_GPIO_I2S9_OFF);
+			ret = mt8192_afe_gpio_select(dev, MT8192_AFE_GPIO_I2S9_OFF);
 		break;
 	case MT8192_DAI_TDM:
 		if (enable)
-			mt8192_afe_gpio_select(dev, MT8192_AFE_GPIO_TDM_ON);
+			ret = mt8192_afe_gpio_select(dev, MT8192_AFE_GPIO_TDM_ON);
 		else
-			mt8192_afe_gpio_select(dev, MT8192_AFE_GPIO_TDM_OFF);
+			ret = mt8192_afe_gpio_select(dev, MT8192_AFE_GPIO_TDM_OFF);
 		break;
 	case MT8192_DAI_VOW:
 		if (enable) {
-			mt8192_afe_gpio_select(dev,
-					       MT8192_AFE_GPIO_VOW_CLK_ON);
-			mt8192_afe_gpio_select(dev,
-					       MT8192_AFE_GPIO_VOW_DAT_ON);
+			ret = mt8192_afe_gpio_select(dev,
+						     MT8192_AFE_GPIO_VOW_CLK_ON);
+			if (ret)
+				break;
+			ret = mt8192_afe_gpio_select(dev,
+						     MT8192_AFE_GPIO_VOW_DAT_ON);
 		} else {
-			mt8192_afe_gpio_select(dev,
-					       MT8192_AFE_GPIO_VOW_CLK_OFF);
-			mt8192_afe_gpio_select(dev,
-					       MT8192_AFE_GPIO_VOW_DAT_OFF);
+			ret = mt8192_afe_gpio_select(dev,
+						     MT8192_AFE_GPIO_VOW_CLK_OFF);
+			if (ret)
+				break;
+			ret = mt8192_afe_gpio_select(dev,
+						     MT8192_AFE_GPIO_VOW_DAT_OFF);
 		}
 		break;
 	default:
 		dev_warn(dev, "%s(), invalid dai %d\n", __func__, dai);
-		return -EINVAL;
+		ret = -EINVAL;
 	}
 
-	return 0;
+	return ret;
 }
 EXPORT_SYMBOL(mt8192_afe_gpio_request);
-- 
2.43.0

