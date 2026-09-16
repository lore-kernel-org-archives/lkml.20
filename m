Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B9A03BCD3A
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 05:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789534882; cv=none; b=Hepzb7Jkfx6CSpW34uLjBX/HN1vG1xUAJzo76ge/lPjjB6CkeLABMtLDQ/weYzEbFrexLMxuVxz2Vemq4EKIC1H5RXQGgwAaSpYj+/YLi/h2BvUSxRkuZaCupyvosYPcOba55qGmvk+8BuGmQU1BF7bOUMGnUWKhVOZNfvYMnXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789534882; c=relaxed/simple;
	bh=Wfj7ayzlWfEu+I8dT6gg9Qx37En8fvuHsBJbQGPJEIc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qS9crT2jxHiqmRYyJZQPu5+Omx0uc6I1B3u8Lkdici/duJcRjgzyWKOByfMgL9ek6Eg86NxTUA4aHhty5qUjLaGkMbjZUQfQfd2xiJZURbySPPZ0pEGMZoUMvF4pVSiS2sVXSf6w7Ah1UDCnQa1hYheZ2616TGpiQhiDl71ZCDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DGgpxG+0; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DGgpxG+0"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cc502a179c1so976394a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 22:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789534881; x=1790139681; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qB6h8bEY4JQqTm9X+KYhPwqJjNuxDZMSiRPIGrpZWzc=;
        b=DGgpxG+0xlTKDdHU0DNZP8acVcr3+RwWNiskjP8QE6gOIREDw6P0t+Kpn73QIjKIca
         rsBGy+Aja0UZuFuV/EqnK9TFV3775WGHjCloPHeb8PrhLxDtewZGGd+EFvY154B1V55P
         CdMRFLXus4MXI+NlrZHulH8+k5idNN2KKi6o5nqgHOg7ChsxiRq+4KpO+71AOPFdLHVR
         xL5zl7+R5Pd0D5Nq4epuTUHx5vHAVoXiSvH9Ya35M9kZmNiRw/7N20oRnL26FfO5xRGP
         5H4fWLk8n3ICQ7K873T1WfyNPPd4xf8GxFwoEOtCaT3e+SvUKM8I2rtXaJEWz4T+/n8e
         dlng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789534881; x=1790139681;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qB6h8bEY4JQqTm9X+KYhPwqJjNuxDZMSiRPIGrpZWzc=;
        b=DV4YcX0n4WAvNK3Qrhp3rsYUYtpvMmwTAw5RxmQWbWE/2k8kgjPLMAWM+gYZMnfC3U
         JWJP2zjNIDs4gYvDbhDDJ0Hf3SDWVoBzeH4GbgsnIQf1tYpEYNcKXo6BMiRZv98gkaRc
         p4dtrQzChH7qYCnZg4huxpzQj9uIWuhmOEXEyVXun82MlJzMzoXtVBmHrNXaKsijp3mS
         KtjqLWIulzrsRzNxqXxmbpzDY5SIbvZaO9xWQOhq09nwh+iL7yDaWz6FPy24gMEkHUoW
         ywcpPrIZWfVdoQ2Tu7uVAzETiu+lxmzatnFIzfaAu36lA8vP7k2R3s4A0kYnDRks08kL
         DObw==
X-Forwarded-Encrypted: i=1; AKwUvBw5CyXz5ZQUpTwNjPfOY+jI8CmFZr69d73QshI/8Mig6G3EqEusEL5vUuy7b/aEQZw000pGi+KxTkdmXOI=@vger.kernel.org
X-Gm-Message-State: AFuF++kdXYnZMNIW5AoY/+3nxrEuGXMyPGm8Ue7vw2IIrh8VQLp6wksB
	yfwt+1RXxbHXIICm5serM6hftlQWyjC94JXoCKAE1YcA9D1OoYfpI0HPXZ13OA==
X-Gm-Gg: AYBFou3XnA5nhHFOvygBoWY272XT0A9Pm8TRA3CdagbysS8ywt5KrIL1pdEKAxeWeNy
	bUprY7USfWak4Vzc5Mgq0fU19WIu9GlWYrpLPkVRblD4jTDCapGoTvWwQX/m4EltFwBxkjAq7oC
	4UB8WgPHrW9lPuS2XBMqsUFFEu+QlyAoR1bJqSK8SQTvKgDRo4TmpIfYO+EVoP8HXqMnwPag4g6
	jNUKkzcRS5fp/OJaKQt8BtjlDLWg64QM5mdkpX740ssUC3RPc1EdtnSt/uURHzyBAEGGix3ZpCX
	hYjR+BV48CVO2+1W7Bvu8fnux/Vx6xEEQqWDpUbMPzpDjzb/wExANb9i32rXWFah3IWPdf+MRAS
	8zCkrvzkpBGVT/JfGf+JYS8IRP7qg+xol+1HKehUfZ4TeR4FZ0dgfX3Uu9OkTUT9luOgW+0NpoY
	zPRr3YD9ntMU5jBhIOapFiTRzMsUuSCdxNFCcoBsJyZRZ4PxHol+ZRO9EvwEhZ7NJfXqD9VgRzF
	lVh92mXbpNXGBehPE7l7/q1TszSyzp6/KpQUacrf+r4LPqQ4gtQvWMY79bFsKkfTmyH/TCgqptB
	ggpQTWZFW8BtXqg=
X-Received: by 2002:a05:6a20:e615:b0:3da:f1b3:50fa with SMTP id adf61e73a8af0-3db4fb852a7mr9838208637.8.1789534880774;
        Tue, 15 Sep 2026 22:01:20 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc50abb1776sm850589a12.27.2026.09.15.22.01.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 22:01:20 -0700 (PDT)
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
Subject: [PATCH v3 08/12] ASoC: mediatek: mt8189: Propagate APLL errors
Date: Wed, 16 Sep 2026 12:00:15 +0700
Message-ID: <20260916050020.14575-9-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260916050020.14575-1-phucduc.bui@gmail.com>
References: <20260916050020.14575-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

mtk_apll_event() currently ignores errors returned by the APLL
enable functions.

Propagate these errors.

Fixes: 7eb153585598 ("ASoC: mediatek: mt8189: add platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8189/mt8189-dai-i2s.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/sound/soc/mediatek/mt8189/mt8189-dai-i2s.c b/sound/soc/mediatek/mt8189/mt8189-dai-i2s.c
index 94c49a662e2d..4826ee250d70 100644
--- a/sound/soc/mediatek/mt8189/mt8189-dai-i2s.c
+++ b/sound/soc/mediatek/mt8189/mt8189-dai-i2s.c
@@ -485,6 +485,7 @@ static int mtk_apll_event(struct snd_soc_dapm_widget *w,
 {
 	struct snd_soc_component *cmpnt = snd_soc_dapm_to_component(w->dapm);
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
+	int ret;
 
 	dev_dbg(cmpnt->dev, "%s(), name %s, event 0x%x\n",
 		__func__, w->name, event);
@@ -492,9 +493,11 @@ static int mtk_apll_event(struct snd_soc_dapm_widget *w,
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
 		if (strcmp(w->name, APLL1_W_NAME) == 0)
-			mt8189_apll1_enable(afe);
+			ret = mt8189_apll1_enable(afe);
 		else
-			mt8189_apll2_enable(afe);
+			ret = mt8189_apll2_enable(afe);
+		if (ret)
+			return ret;
 		break;
 	case SND_SOC_DAPM_POST_PMD:
 		if (strcmp(w->name, APLL1_W_NAME) == 0)
-- 
2.43.0

