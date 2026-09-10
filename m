Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 258D1489FB6
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 12:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789045127; cv=none; b=HYdn0aaJOfbGIOK4XGVyrF7n5AtNdueS5ONPgGBpj2xo30OekGJBDojjo8AjVMBQZSG1AsHAcs1pgAoTw7p4J1TIVyVo2Mz9Y9e4FZ6B5Sk1UF0BTCV+YvF2h92IT8WVGch5NHlHfRfk/CnMnny7EDdn6MhxEhE1cNm/kYuR794=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789045127; c=relaxed/simple;
	bh=Wfj7ayzlWfEu+I8dT6gg9Qx37En8fvuHsBJbQGPJEIc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uOSBh6XZU3bpWDwsFH56aGpPYwlyAufpA4ojaUOoEGc457jpHcV5p0S01JiRmuISd1XcCcqxjPSm6PENuFoTVHh4Xb+56IJIv17r28r1dgxlbS1bxHj2nAat3nzM/mJ9JDOzSslTw6mmSceIngtEwMOs/o4/ZH39T+tzeg4WcSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ct57quuM; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ct57quuM"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-398b3c37877so6573844a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 05:58:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789045122; x=1789649922; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qB6h8bEY4JQqTm9X+KYhPwqJjNuxDZMSiRPIGrpZWzc=;
        b=Ct57quuMxyD2hHz3lF4kxqr7Gj+MBJ3uJIZGzCkp5B4WESkKv93MK+UoB2j8xWb1sa
         uXyu48K85yY61cO6T6pJVm8UVKXhdCF6IDiTq1aECDVm/ATJHOy/qLUWlB0lEGP7uK2k
         8BD3QeVvaUt5e32t5ylR7P8V2AYGNS3HMjPTcjb8HV8k5qJwGIZ+eL8cJ4nHBQvKpGUE
         UoZzVD1S1HlFHDEJkPdENIMqYubElaD+RUjGe0A7K8vaLhkYMNRpglUDEVmduY9qQX+G
         JJBhXCFE4kq2nV+m8LWChMF8nD8ImhUOCPoWxO6/oNMg+8Ojts8pZ4dXpaNAlbbw3msg
         mfzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789045122; x=1789649922;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qB6h8bEY4JQqTm9X+KYhPwqJjNuxDZMSiRPIGrpZWzc=;
        b=GNdci0O/9mPdeIuR9w/T18C6RW8fkoYLK+Ls3jaIpxyqw3E/UWogoo9vT+AptlYC9+
         ewKNBPVSYMmNyY9AHlXoA0074KzQEyO0OqoLGsf2Ct3sVKCmP+InSN+s1H0+i/V/jwmX
         yn4Sbmu8cePnwYk8ci3rtXuGdYrhnVzx6G+zkdSObGlSGrIf5pZNQZpvf+KPiXHlCg4o
         bzuLuhUlZqEe2onMWes57nwY3u9o6Rf2YWaaSyEvoLYvbtyOCNUE9ojEjfVTTEEBlz4W
         IPV2SEzDsFMvs5KhVmdwkLLtwM2h8SQc1SY0jPDwYYS83/BAX2UEFWwLc4aUOokgeVX8
         i4jQ==
X-Forwarded-Encrypted: i=1; AKwUvBzurkS/pG4FyykU4RGLtJX5xhi/m9eMB99ElcwbG1L4SYfjEsAHNxkJ8zTTrbRdB0f+PqdYWd/5sJ0RUgg=@vger.kernel.org
X-Gm-Message-State: AFuF++lvnYxpeEIJhjuR78wnVst3c2S5bZlR0G+QXRONoxe+/qnS6Gzf
	ZH01ePFBx/lLG5vqfxkijVL/8iQjj/wEY48PaHu53v/nbyIdvJghYeeC
X-Gm-Gg: AYBFou1nIuBUAx95VEETT6NWqtK1wmlKcY3fTBLGeqkMNphWqH1hEZwTEYYydOF70NN
	iUZPJFpbt2008oZFzRootUXtIj/lF9Ch0wEzw85ZtTGwdv6s7FOnBVVkbtM1QIxWKHZX/6ralWW
	e9uU/wJYe0n3IRD4Mkb7odX7M/TjlZ8qApoQVFCLxfAy52uqOWJEqb9G0S0a+F9bmNNR/CIE93Q
	/7dsJKiShd27UpP4qii0llYgW7HtMUsEs7QFfFLwx8RQkTjnc67S5mKQhSF6uMz5sXJ577x90Nf
	d0bZidiBHy5i52HSmq7Z0nfI/BpaBIBj4nl3Kq7875NPJQZGHwWmtDjmADK6XNripluwyHdDLSX
	Bvg+lOEhjBJsDxv//Wv75gPIQHYW3W4xLFY1VIHPYWBOvE/EaLufPArhLB5W9IR6jdaR1Leqocf
	g/bdGM/WgzjZEKCwAk+fwam9HEYdmY8dH2SXleLyxGLLpMOWzLZ+vcSvkusBAqOX+JQF+xDIIas
	jHxhYMuRactFvXBWvmv7kfi+CDy4C/m3UkITmOP2R7RI7hSRjVgb/W8SYN484GWLDCtycsgbV/O
	ESKB3jnHx1jAvXNctPzv7Pxikg==
X-Received: by 2002:a17:90b:3b52:b0:38f:18f9:785 with SMTP id 98e67ed59e1d1-39b26101d25mr61915384a91.8.1789045121712;
        Thu, 10 Sep 2026 05:58:41 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d7e77b1afsm4891592a91.5.2026.09.10.05.58.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 05:58:41 -0700 (PDT)
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
Subject: [PATCH 09/13] ASoC: mediatek: mt8189: Propagate APLL errors
Date: Thu, 10 Sep 2026 19:57:38 +0700
Message-ID: <20260910125742.150902-10-phucduc.bui@gmail.com>
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

