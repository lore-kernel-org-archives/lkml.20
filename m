Received: from mail-pj2-f41.google.com (mail-pj2-f41.google.com [74.125.227.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBB7C3C583B
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 04:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790311833; cv=none; b=UUHS7HegnsWQBKmLTc2bpGZiSshNhBLtelLS0ItO5VKpSC1HgQ5D7H9kYg92I2pMUpzrOSKXCUiH5xnBCTUZCDGi70bCMPBixiQW5Z9IHRvCHhZXquW0DfILMrVuRa6JBG31Kb27Djg2j8nCw5cbLK1tGzM/6DJS0hcxQVXzujI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790311833; c=relaxed/simple;
	bh=Luug1/W1j+KIrThGmR2h+mZRSz1sWSH4I+8728ARnpw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O2B3LOzqEjEB1E6WbDu/eK4yeV75sLjylaLaflzdA87LbTema/RDAW6TeEZSBzNvEMcyM8MYWZADShp19c3nVTtSwwhbSfbuHxPd6dN05Xmyk433kWq1Ek427lpqi74WM1Lg4xI/XtDHZRBjuy4PkJ5lk6sZWoFG8fCtMR6QUmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C0imFktN; arc=none smtp.client-ip=74.125.227.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C0imFktN"
Received: by mail-pj2-f41.google.com with SMTP id 98e67ed59e1d1-3a0bd71827eso111409a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 21:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790311830; x=1790916630; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+a+AWZNIU0wqIWtIDJ3mjn2LblAPLsjjXpjUgivHtBs=;
        b=C0imFktNs+h8jkWNTT/uzU/bHA9/Xp9j78AnUa8rBtsNHjOcQPvta2mjzS9K5dWKqY
         bAIY5Fo87rQqhYVCRmrfBqVc/xtStHAK/Yhl5GsIMomWdn1qGp27WLmcSIXy4X9eMKVn
         34z7N2Tt/PriK/yBVgXU+BthJHCsdSZdpyDv9EjHA2rXvb8CxpFO3ptzYIezQkbQG530
         VVUeDIUx9Zw22dWwe/BnZlC38b6gROMnFp1/0YcmIIjOneaTTE9KCvATm7qhewWgBLfY
         eUAYSvBimfgcJvXcdIOZeEHt9bu8Z5GqJHuldI1YFT/2KfzcL85QqZhMkqnrPpWAAg/K
         t7Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790311830; x=1790916630;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+a+AWZNIU0wqIWtIDJ3mjn2LblAPLsjjXpjUgivHtBs=;
        b=kmjMJfzFDsQL06gLsA0IQsvVjsxRTT05pC8RN2qGLc/HWZPtJ+7Gwl+1Ymx4/NbGiU
         UU4YGCtUvFC8iOcPW18i3m+mHcewK/fXPkFWA5MBxt/AXk3nS8oOBZGDhO5S9VVl6btI
         D+ibyFfXzzhxFl4FaGMEjzVAohJ8fCVRVcCILLaMMc30iJ35kaB3uCgOLz9nIkBt50TK
         +YzpW0fcrPIYY+2dt8/Ix2O0jYjyjdSYDICx99gbKYNteRurlLO6kfCLxGgJianUWxYS
         +GHTKqW3SYaJpekv+q8mV/QELzJnKpR4XLF71wI62abzsod1OCktO6Jce6CrmG/6MgSS
         1xsQ==
X-Forwarded-Encrypted: i=1; AKwUvBzLO3gRYEB3t5gMw4jQqG2aHFRb4/giSrjSqrZF/uS0nCDYl+tHnEXlVYxGR5vaiTvZaBVg/uSKy11NuLw=@vger.kernel.org
X-Gm-Message-State: AFuF++k/kmqiZ5/eRrlH5LFxa4z+u1kmDIyWIH9jmDTsTUrIZiWcR6tl
	evZtQCD9s8l4/5Gj3aQf0Y8HBZSh0pq0yFlUiM/WGh5gDkoaK5xIv2IH
X-Gm-Gg: AYBFou0hbW06V0rDF3oE0LjsOOp2k7t4BQ5quYEgW58S13Cl68AySQnitjxLP5/bEfS
	cyx+JsWTgtG+Dlkt9yYHGucG9nR88+dgPESmZui5D0yYeqsus+JzTRxQGmXIVaHH4cIxlzFnHWE
	qe3NFp7wJdThRv2NaZVZje2T7ErnOEuF266Rf6bdbH8xU/3KX5VjydHbFnMf/ESRTsf/aT3ymkX
	hnUfnt6pJVV6mt51hsej2NBsqtw6n5odGizRSK05YVLDuvMgYlCou/B9H/Gk/80/WglaYGL+2CA
	An74wu4Puedc6Gu06/zv0lqSY+MuLbNNcsudcx/qoOHboV35ljim9g2SB3wOx1QqNPPXJ5AazD5
	AXCFSogmCIXHdGIciooipAI0otXcJv9M1I5G01a33Oz1eyjIOk5EQ0yJSUCE9XKZfrBbIurOsFX
	AvZhAC+wWgpSp2st6ZfY4mH4VZQrDnU+3WIX443q3Ye3evCUjSJxq8Q/EmLfjvi8tVJM/SeDUwS
	9cNuuU6895rAvcWZu194HveetunINws52NYz8eUJ8q/SnePAT8WLeLgyhiuVb+/pmqeqsUNysj8
	gmriGzNnlsdL6tkaiaxrwTu2
X-Received: by 2002:a17:90b:53cc:b0:39e:6c6a:2096 with SMTP id 98e67ed59e1d1-3a098970bd7mr3908285a91.55.1790311830120;
        Thu, 24 Sep 2026 21:50:30 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0976cacbesm8151528a91.13.2026.09.24.21.50.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 21:50:29 -0700 (PDT)
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
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Haotian Zhang <vulab@iscas.ac.cn>,
	HariKrishna Sagala <hariconscious@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 08/14] ASoC: mediatek: mt8195: Remove redundant error message
Date: Fri, 25 Sep 2026 11:49:02 +0700
Message-ID: <20260925044908.450775-9-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260925044908.450775-1-phucduc.bui@gmail.com>
References: <20260925044908.450775-1-phucduc.bui@gmail.com>
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
 sound/soc/mediatek/mt8195/mt8195-afe-pcm.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
index be150c0f5472..b8c3636cb64a 100644
--- a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
+++ b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
@@ -3083,7 +3083,7 @@ static int mt8195_afe_pcm_dev_probe(struct platform_device *pdev)
 	/* initial audio related clock */
 	ret = mt8195_afe_init_clock(afe);
 	if (ret)
-		return dev_err_probe(dev, ret, "init clock error\n");
+		return ret;
 
 	/* reset controller to reset audio regs before regmap cache */
 	rstc = devm_reset_control_get_exclusive(dev, "audiosys");
@@ -3130,7 +3130,7 @@ static int mt8195_afe_pcm_dev_probe(struct platform_device *pdev)
 	ret = devm_request_irq(dev, irq_id, mt8195_afe_irq_handler,
 			       IRQF_TRIGGER_NONE, "asys-isr", (void *)afe);
 	if (ret)
-		return dev_err_probe(dev, ret, "could not request_irq for asys-isr\n");
+		return ret;
 
 	/* init sub_dais */
 	INIT_LIST_HEAD(&afe->sub_dais);
@@ -3188,10 +3188,9 @@ static int mt8195_afe_pcm_dev_probe(struct platform_device *pdev)
 	/* register component */
 	ret = devm_snd_soc_register_component(dev, &mtk_afe_pcm_platform,
 					      afe->dai_drivers, afe->num_dai_drivers);
-	if (ret) {
-		dev_warn(dev, "err_platform\n");
+	if (ret)
 		goto err_pm_put;
-	}
+
 
 	ret = regmap_multi_reg_write(afe->regmap, mt8195_afe_reg_defaults,
 				     ARRAY_SIZE(mt8195_afe_reg_defaults));
-- 
2.43.0

