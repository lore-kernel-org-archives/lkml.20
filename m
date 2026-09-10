Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14C7B48C402
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 12:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789045120; cv=none; b=sr5o8dn3lgQlDO5jWzBAv+jedJ+hx6XGelZcd4yLJil4pzjCOudEZVi8Kua3IN3/QMXHUPeJWSs2YDhMdRJ+lVcvpBoaDrzyqpjTPCiTnANf3smAQQgZabTHW2gOZIAVpnxptuCEceZ+lHDNzG9zBp6fNZNOit6Utv205cVeRnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789045120; c=relaxed/simple;
	bh=EMTf/inp7tRn7qQQ56C9Ys6vtY7gDfXQI6g14oe4GtU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gtlvNsW2mOl03QXxQJnacWf3XZ08khp5dTvzLDGEhooP7ogXgwNtxNlQ4huhAGbz5z5uEtmKgnCTQLxMLroR25LzRyUJKnMaEDuQyx41kY22ICn+HPlyrhyGYQf5oGq4FfkMw4ZEiuf1AAq6aofaMI6hcsPwjgsG+q4obHtGD3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jP8bPZWp; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jP8bPZWp"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-398c066106cso1155933a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 05:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789045117; x=1789649917; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ueFbq8+vEvSr27HopAfMc9ldfFuJNT5gbHVBZLkrJAw=;
        b=jP8bPZWpn1xRFYPQmHfJnInTgdORqiu+BJdHR3mPuORZn1PzAMlS7hmPzM0uzce9x6
         Vcq6dlA5MoAbbXhZQ2E8mznOZhkzEp6ciMK+jvdjguCT23WTLSuzSwjQLYJ8xns8mLkr
         AuOipdjV907yfNaVuSySlkZU4oLI5e4/R2EUWi78dLAAMuzR0yjfR/DcW/PNjYItlCJt
         uIN1WyHFGgqAQgswyP2LBAoDVivwIvcdkYznmh5Q/5wXFUGXjsDUlpboH2SnHhPWjn26
         dLmdj4/m21+awFVqag5di4UpKVHH89CmQQ2R/1UbdkrE+PZmBH2vyMfO0s2J/oAT+Uql
         w0PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789045117; x=1789649917;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ueFbq8+vEvSr27HopAfMc9ldfFuJNT5gbHVBZLkrJAw=;
        b=R1lbbwMDdyeZGytonzRwelbI1sVfS/v6+R+K+/UVGTpgOxUKtpyPPj4D+ggpzn/5uj
         gBw4xucLtJLLjc63XZzh1JClVdQJkrSihklEtphAKlyA8jJTxJftMfO1UL3BVpmJbCBZ
         Tsxf26sGl8O9xxIJZj9y0l7Fju+3hvLo7D9V1+uHvru+rRaNnYWYD5gAu/QWneCawiJQ
         Y6SvOTI979CwMQhx2wBdXYiu/9tBOOGe7m/+IfUqspEVjDqhZjP0The+eixEgMFoXLKg
         s+T/VbDUIJe/eHzov7yIe3H2mODx3y16Rv5ygxlC43u7XVAsV5rsFk7hBo80p/8ObfNl
         75wA==
X-Forwarded-Encrypted: i=1; AKwUvBxobFM5dP39/6eIO17G7xVo0Mn5jUJ7UXCur9hFzsTX9Ff9eR+Iu8pT4rATuc2sWwtErs1X76rezDSznbk=@vger.kernel.org
X-Gm-Message-State: AFuF++mGWi6fxsOAnOTzkfXVKuc4EVTDQqKvcXkpDA4xUFOA8f0J0oTD
	gr6Ru7Et5J6l8hPbRUa6ShWpR7+s5iiJW20V8owN+yI2W59GUAS2Yfvo
X-Gm-Gg: AYBFou3CGA8JiBgkXOTJFcpXpnmLPqKk2YnK7R5Ig+24INnjSGM85nExxfvS2DFdcb3
	iCo5aNRt2XagP2VkgnArPM8vHXWVQT/GxXVwKj3C5fuaafSbsUleiDEcSm0/w3IiGpNmRmjKWJw
	AOtzDR2fpTXPPkv1WGnmYIRTJj0ZapVKi8gT0WbKOWEU2/7Gn+FZlzpS2zz4tuWJIUfHLfpniqY
	Pp/e2K2fuBEH/m2dBXmL1EuYKraBIaIoWDE6axcAmTymAc1rQ8lYvI1R8hwAnZRgtb5EfzqJjBU
	Sp71kUftfNibBi/lHwIgVNZZ89Co+s1U7oGhnumDOj+Uxwsh6+G9IC3ZaaMpywSMfx5c2Q9hxqN
	Wsls2yhshBkUq4ZbXst2/ao/FzxL0/WM9wamc6KWrFqh6RGrz93UCgF6EPXLyUM41Mhgl2KLkgx
	VchoxfECJckCpu03KkKgHC7R0BANnxgnK/Uzk9SnD5uKuIrXc5hA72dhNi2XaAfjEAtMS0o0aLi
	tMtOuGiiRjKhiqSqJP5G6Kmv9K5u9LuU/VNDkXbI4fJN9KldYN588asm/KoqpSXXyKs6DQsXX4x
	GCu1YGSclhd/AUo=
X-Received: by 2002:a17:90b:57e6:b0:37d:f206:a2ac with SMTP id 98e67ed59e1d1-39d70a34abcmr11658680a91.7.1789045117218;
        Thu, 10 Sep 2026 05:58:37 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d7e77b1afsm4891592a91.5.2026.09.10.05.58.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 05:58:36 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Cyril Chao <Cyril.Chao@mediatek.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Dan Carpenter <error27@gmail.com>,
	cassiogabrielcontato@gmail.com,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 08/13] ASoC: mediatek: mt8189: Remove redundant error message
Date: Thu, 10 Sep 2026 19:57:37 +0700
Message-ID: <20260910125742.150902-9-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260910125742.150902-1-phucduc.bui@gmail.com>
References: <20260910125742.150902-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

The errors handled here are already reported by the called functions,
either directly or deeper in the call chain. Therefore, the additional
dev_err() and dev_err_probe() call is redundant and can be removed.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8189/mt8189-afe-pcm.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c b/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c
index 431320719b63..9335a9e44665 100644
--- a/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c
+++ b/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c
@@ -2488,13 +2488,12 @@ static int mt8189_afe_pcm_dev_probe(struct platform_device *pdev)
 
 	afe->base_addr = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(afe->base_addr))
-		return dev_err_probe(dev, PTR_ERR(afe->base_addr),
-				     "AFE base_addr not found\n");
+		return PTR_ERR(afe->base_addr);
 
 	/* init audio related clock */
 	ret = mt8189_init_clock(afe);
 	if (ret)
-		return dev_err_probe(dev, ret, "init clock error.\n");
+		return ret;
 
 	/* init memif */
 	/* IPM2.0 no need banding */
@@ -2528,13 +2527,13 @@ static int mt8189_afe_pcm_dev_probe(struct platform_device *pdev)
 	/* request irq */
 	irq_id = platform_get_irq(pdev, 0);
 	if (irq_id < 0)
-		return dev_err_probe(dev, irq_id, "no irq found");
+		return irq_id;
 
 	ret = devm_request_irq(dev, irq_id, mt8189_afe_irq_handler,
 			       IRQF_TRIGGER_NONE,
 			       "Afe_ISR_Handle", afe);
 	if (ret)
-		return dev_err_probe(dev, ret, "could not request_irq for Afe_ISR_Handle\n");
+		return ret;
 
 	/* init sub_dais */
 	INIT_LIST_HEAD(&afe->sub_dais);
@@ -2603,10 +2602,8 @@ static int mt8189_afe_pcm_dev_probe(struct platform_device *pdev)
 					      &mt8189_afe_component,
 					      afe->dai_drivers,
 					      afe->num_dai_drivers);
-	if (ret) {
-		dev_err(dev, "afe component err: %d\n", ret);
+	if (ret)
 		return ret;
-	}
 
 	return 0;
 
-- 
2.43.0

