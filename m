Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D4DB40F729
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 06:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790662356; cv=none; b=XTLtt9/jc1GJD5HcIdzv3I8lZxmn3vNBwb/pDqQ+pFpyCe1vIvOxi67Q2EgEVlY6fkiuqNb03My7SMcj/rPn/V3dY7RkDQOxj/LzrTWSTzUCcYdNrARAvMp2gW1ax8wi9k+9j7Rceii3rzFx4dIs6EkWFKFXUAzR7cFZT9NZgcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790662356; c=relaxed/simple;
	bh=Z7J7qQUA5FEZEGJ+4nMmHdVlBUyM8v1bp7NF2k9hIQo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lrDV6UA1jwO8XYlw9E2l2cfN7fHwEGi/FyfxfWRZ1uDuP6Si4rS7GpPcHZHZhf9/nPRY4drWsATDV0Vis3OmPLJ85wXgEaFsY0CjanMJoTJwcRk2hqPvi+1uwmicsLxw1iaDPxAbyjaHETyH7PT8sguqcQxfP2KfuhmKK+hGZbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DEOLcnXP; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DEOLcnXP"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccda24afso1972800a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 23:12:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790662354; x=1791267154; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7lfbotW9h5DjJNCJiSoWtaX/OscTKUaTGY49TPTCiQk=;
        b=DEOLcnXP9kWrTj4Fm0OsEjrCMrP6WsS3S/sFt/4sCSioP+Y7y/MEdEwItwP00Bi0RE
         8HWuSYcTuFJbN8krJqEtkoi00dk7eJZFrMV4VRCttSnScG0YtaJAxTamdFIm8o/cN3XY
         MUZ9Z0a3bJNO3znbUVMNgVA0/CIfC9SZZvDOobZmAxzLh/Y1osok43ae590FJXgMGOFS
         ipLhRLJnCLpf6MQ3vgCGqraBYEK0sYZLkcYnNCDOMN/WosFEwT5Efdu2x1LC7lUVg/vY
         ll1ermH27zooL2KMGdcXhWLhXC61arTaL+XebKENUnv2v2rBjbss3fvfnToIknWSzD+C
         OslA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790662354; x=1791267154;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7lfbotW9h5DjJNCJiSoWtaX/OscTKUaTGY49TPTCiQk=;
        b=NAoRpEhICkcPoAreN9wJGVBx/gUkQop3/K+fKXTI6kL7icK6gbKKaDUqHqtyhRuL8U
         EaD6p4Hy8MQOzFqMlvdsCVc+5wLGE6VovHis7bVdiuL/C30U64pS8I5mVilZLnRVk7bO
         68FXawkBIoYfae2Y7UdANJXantD73HV4wbvUc4vyjq+gHP2HebTNH6a6OgzeR+ESRpNZ
         TMxCSJgjftW4JREqzYCCYKDjP2naHxnlHc+kk4l15srmpuC+M1qizFUo6qvCiEWIT+6U
         4GMy83stuic4sVGXXRa0miRuGtvgW7PsbNXRuuKQ4rHiBEkX4uUeHGEuG+DZg1AQNLCi
         9tAg==
X-Forwarded-Encrypted: i=1; AKwUvByaTAH4Ew8QmfEg+UtuhOWqCfx+7tBN+8RXLZQVFO7kPGiDPQvCi7a7LYyRINRyVVhFrTAMtgY6hGrlBvw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJlla4yroI6j6CsNZIOhv4/0edp1uwFfPpjvVH4+wIw5+XwZ3uM
	8yAsFKGUws8zB4QFLYnrq0hVa1wIOAR+iqsQtob/lhiOjiSlQd1OnfRV
X-Gm-Gg: AYBFou11k4A3LY2mIGM3gSAsiA1cZ/ivBsqeBdHSRb90oPJjfj6ZO4ocpCRJGee0QPm
	o8f+EhcBMZMJRpfwbe42tknfsn1i+R2dnnB0gyG5rUwwZuTKOUGfvEhuY0qPTtwuO8KM597pkHE
	r9KVQsXwz2kEZvtom+etottcl46sDPiPhUG1dEEbTv/nM54hay+Fr4oMSOhE9iYc5AcI9fDjBWu
	XNB5tCqg9ffUD11PJ9ZFeI9SPvvjtH3f4nxQDjZatdguJaZG5Bf4x7kouOIS4kk07k5Qwn4GkdZ
	YCNGCawQkXWHMxHS5Edngru9y9pC9LjJtzkh38/IQlM4fS2Mq160okf396H/TuIvSr+RYjck2pm
	TKmqsR0i7AweeG/6AM7qhk9fX5A5SLpnZ95W4I/O1BYpY6lR3uKayGFsB75ZEswydLpwt5tlO4x
	j0WvvEPSlCeREMYwqr0IyRBgPxi/ih4ykGEvoBUT2upNKhJ9iHXG3xesIzuTn/rc7Ip/F9u4JOO
	loo4TzLknnH+c7fSc1uKoK5Kp+94z/5XDlDACzqYZg3wNAFsTY/edU4YlW/3LS8K5T64PNguC45
	9rRe2+T/Ad2i3Q==
X-Received: by 2002:a17:90b:4fc2:b0:3a0:c276:1ec2 with SMTP id 98e67ed59e1d1-3a0c27621c1mr5466581a91.19.1790662354571;
        Mon, 28 Sep 2026 23:12:34 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a498726d63sm3280965a91.17.2026.09.28.23.12.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 23:12:34 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Darren Ye <darren.ye@mediatek.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	cassiogabrielcontato@gmail.com,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Cyril Chao <Cyril.Chao@mediatek.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 08/10] ASoC: mediatek: mt8196: remove redundant error message
Date: Tue, 29 Sep 2026 13:11:19 +0700
Message-ID: <20260929061121.124001-9-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260929061121.124001-1-phucduc.bui@gmail.com>
References: <20260929061121.124001-1-phucduc.bui@gmail.com>
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
dev_warn() and dev_err_probe() call is redundant and can be removed.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8196/mt8196-afe-pcm.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/sound/soc/mediatek/mt8196/mt8196-afe-pcm.c b/sound/soc/mediatek/mt8196/mt8196-afe-pcm.c
index 9888812cd993..fbeba01b086c 100644
--- a/sound/soc/mediatek/mt8196/mt8196-afe-pcm.c
+++ b/sound/soc/mediatek/mt8196/mt8196-afe-pcm.c
@@ -2360,7 +2360,7 @@ static int mt8196_afe_pcm_dev_probe(struct platform_device *pdev)
 	/* init audio related clock */
 	ret = mt8196_init_clock(afe);
 	if (ret)
-		return dev_err_probe(dev, ret, "init clock error.\n");
+		return ret;
 
 	/* init memif */
 	/* IPM2.0 no need banding */
@@ -2394,13 +2394,13 @@ static int mt8196_afe_pcm_dev_probe(struct platform_device *pdev)
 	/* request irq */
 	irq_id = platform_get_irq(pdev, 0);
 	if (irq_id < 0)
-		return dev_err_probe(dev, irq_id, "no irq found");
+		return irq_id;
 
 	ret = devm_request_irq(dev, irq_id, mt8196_afe_irq_handler,
 			       IRQF_TRIGGER_NONE,
 			       "Afe_ISR_Handle", afe);
 	if (ret)
-		return dev_err_probe(dev, ret, "could not request_irq for Afe_ISR_Handle\n");
+		return ret;
 
 	/* init sub_dais */
 	INIT_LIST_HEAD(&afe->sub_dais);
@@ -2469,10 +2469,8 @@ static int mt8196_afe_pcm_dev_probe(struct platform_device *pdev)
 					      &mt8196_afe_component,
 					      afe->dai_drivers,
 					      afe->num_dai_drivers);
-	if (ret) {
-		dev_err(dev, "afe component err\n");
+	if (ret)
 		return ret;
-	}
 
 	return 0;
 
-- 
2.43.0

