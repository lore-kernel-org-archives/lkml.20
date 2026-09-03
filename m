Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD532386441
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 05:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788412365; cv=none; b=r/wYcaeQ4G4NsGzirScVUu1BP70/Q2OiuP6h8XDQfaFf0b6ShYgWdyO6OEpvF3lhPZObKiXW1lsBjLDOOPR5KIbmgep6oJSBYk5E3k1Is/a5d5D+LzScQm2lu+8YkIfyRc0eMohK8Me3GWwiN4QsLIJc8m72I8yxi+qrwt7ER6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788412365; c=relaxed/simple;
	bh=flUUxagMMbbwFuTrQc7nygferYAal45fxbtXaeUEeAk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=own7yW7fH0O1PihHJjKtlu6zoUJ+EcTbFjg0c+GiWuwllBUzT1JRvCK5BX6z3IAWzmOkChLwbpmMJKEKdcYSMCWa/72BrVOLG/It+TX5SUoRAHsYXuOZq+iWPAyvUX5IY7eXZsigjOhVCaq4PH8CdvHxqEEIc9j7LbfYk9HYT/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ra9Lmt8q; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ra9Lmt8q"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-38e041ea211so1810336a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 22:12:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788412363; x=1789017163; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H8NabRqeVDl6V/0Mf+sYcOuuE1n9qJZPVQBsEE5OZg0=;
        b=ra9Lmt8qykVXchYl3k78dLka0Dzua2jGwnv+TRZNUuH69nHM+z9jR3I+7dh5EfJIrY
         9McuXCYxjYQxDvVSUCiC482xNo1JljIOaSHXuQXNkTB/NfOIHYaIsMkuyXXCTWi0GEq5
         COYcfDpHKzr8OgPtSjKRaNKMrvfVA0sDb1JZ8/vEt/RHQg++OUWuc42Vh9dS6bZiPwMC
         sSF+FWxT/YUN/yOwsPCEcWZaIq8NvB2dAsZiMkmp6gJqDlouICWtGYUnoGunjLPvRnCy
         lyhntSZ/rpRtppgRsRELS31fuEjLXsysQ2NPop6lk1V6xO2dhTpo4/8U5jJaOoh1J3uk
         TGwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788412363; x=1789017163;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=H8NabRqeVDl6V/0Mf+sYcOuuE1n9qJZPVQBsEE5OZg0=;
        b=L+l4AC7y8690TMDjVX5w+NClvqIbnlYAmBMwQx0KRV2N3B0AmJcP3p/fQYnm4RxZBf
         sXARNfvDrCd4S2y1uMosWm/qIuEj1FWH4ZhuYqSfrwV8qWJfU4X2MPEXHL/w/6+yXeJ/
         1IEKCRhrqxIf9IN9UgZNi9jNoWs6hA58JPVvowFFyY+f8FJC4wDuDs2GN1TYX6G2bmvL
         /tnKI25HIRuS7md9kWTvr4i6B++qKEdqQ5ZKK/ixKG53SrgF/n17UlsgqSJtRECVHH3J
         0V1e/lI1WNjUZE5jCluyC9cA9vVFzBBSwFl95+CM1SP/xaRqpcUfUT9pog2pNyEuMRl8
         4c8A==
X-Forwarded-Encrypted: i=1; AKwUvBxO4dusaoWrFe4kCbkh23KPBm4zNf92NLjW7KvJUgHuWjMdkG3CZQzO799+W8Mxnd09qSUggDl0OhNO9TU=@vger.kernel.org
X-Gm-Message-State: AFuF++lY0Dx3R0CLJ8q+ZUHjZwlvIFCY/i43o5mNjaOQrYsS0KxFWs92
	8zBs2rPamT8V0KRsGCOvukgrtu8dk/5RGtVzLymVGuo9qZ95Wu4W1QOy
X-Gm-Gg: AYBFou2wbb9C2ZEi1SelTVrrRqmDdPrWUgP8G8YT5DUKO47m6Lx+VIzIkU5Mrv+DDpG
	Yu0KcqaIfYqCv4p9MxT0qgQjE85RccpDAYBY7kJBJ2YDBZQQQRaDqmATOJsjrg4G+BuqDwzOAmO
	wjkhuutlTpTgsLV96maq3o8+oFBOZOdyFA2GU5er20c7ElupuK2Ia4wjvRAytVH66sNAkPIkKZP
	H+Ypojqb3qmxzedaJ90f+XUasi9L3I7CYjhM1YX22DY5LKsvCVRYmwQw6CvZD9vBjnrwo1iYCto
	7g+3ZpWCfDtfM5TJIsJBbFV0Cpu/IqUIgF5tAAt77altZRLJQI4HrDVCnkbqOz1/FR3j2bNMgFm
	U53etH8gSjzbnYjfaTa1L7kEDlz5oWyEC5q3Xy+Oazmxiv2wQKQ1Q0GlXRpuGhAvbkkX8vYIA+K
	S7dQ9IYayH9ENFmCRrMdvmRYVglfAn3fk3sAXKC2miN4W/Whrzmj2gpiD5dlmQmCvPWTm49RLqu
	qzNLJxukeR3HJR8obsYkM4kzcuRIIenf867mnTYsXlkdWR22GIHP3WTMt+EHG/vnPBhsKZcGAUf
	+1MB
X-Received: by 2002:a17:90b:4c4e:b0:38e:bbf1:de3f with SMTP id 98e67ed59e1d1-39aee0674ecmr13930896a91.12.1788412362952;
        Wed, 02 Sep 2026 22:12:42 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b0875ce14sm3218092a91.13.2026.09.02.22.12.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 22:12:42 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Jiaxin Yu <jiaxin.yu@mediatek.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v4 8/8] ASoC: mediatek: mt8186: Drop redundant probe error messages
Date: Thu,  3 Sep 2026 12:11:50 +0700
Message-ID: <20260903051150.178057-9-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260903051150.178057-1-phucduc.bui@gmail.com>
References: <20260903051150.178057-1-phucduc.bui@gmail.com>
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
dev_err() calls are redundant and can be removed.

platform_get_irq() returns a negative value on error and does not
return zero. Therefore, only check for a negative error code and
return it directly.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8186/mt8186-afe-pcm.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c b/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c
index 143386c54dd7..4bf098657fb4 100644
--- a/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c
+++ b/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c
@@ -2852,10 +2852,8 @@ static int mt8186_afe_pcm_dev_probe(struct platform_device *pdev)
 
 	/* init audio related clock */
 	ret = mt8186_init_clock(afe);
-	if (ret) {
-		dev_err(dev, "init clock error, ret %d\n", ret);
+	if (ret)
 		return ret;
-	}
 
 	/* init memif */
 	afe->memif_32bit_supported = 0;
@@ -2885,15 +2883,14 @@ static int mt8186_afe_pcm_dev_probe(struct platform_device *pdev)
 
 	/* request irq */
 	irq_id = platform_get_irq(pdev, 0);
-	if (irq_id <= 0)
-		return dev_err_probe(dev, irq_id < 0 ? irq_id : -ENXIO,
-				     "no irq found");
+	if (irq_id < 0)
+		return irq_id;
 
 	ret = devm_request_irq(dev, irq_id, mt8186_afe_irq_handler,
 			       IRQF_TRIGGER_NONE,
 			       "Afe_ISR_Handle", (void *)afe);
 	if (ret)
-		return dev_err_probe(dev, ret, "could not request_irq for Afe_ISR_Handle\n");
+		return ret;
 
 	ret = enable_irq_wake(irq_id);
 	if (ret < 0)
@@ -2957,10 +2954,8 @@ static int mt8186_afe_pcm_dev_probe(struct platform_device *pdev)
 					      &mt8186_afe_component,
 					      afe->dai_drivers,
 					      afe->num_dai_drivers);
-	if (ret) {
-		dev_err(dev, "err_dai_component\n");
+	if (ret)
 		goto err_pm_disable;
-	}
 
 	ret = pm_runtime_put_sync(dev);
 	if (ret) {
-- 
2.43.0

