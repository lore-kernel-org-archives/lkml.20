Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54C0F3D890C
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 10:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791281800; cv=none; b=eeheE8Tz2dNTFAI97RFMAFloax9vZsgYPrEqiZgDcGI5DFT5jts2BjoTMXdESpMy8pIfYjibSyAjJSm7tlpjMyJCb5DZ3QAHBwbx+yeErrmP+F1Po35ZYw9m7so99vkxIB99tQA7CWM9wm1nRHvbqeSkq5PqlbK3lNRfaRVBE5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791281800; c=relaxed/simple;
	bh=OA8yCxX33FQJplrdZY2YnuAxhukUB1SF5pnrPvNtytg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZIOu3yTn/MgchzapPnJvfoxoNHo437bdsiRPxRT+R3/2igTEE1W7Gr++n9RfLCNOEmKtzxleFWLp8mYv3xbHTcvtmaZDJGQXz6QIEzN343+CepLuCGPnXZs0MIy66v1oh+nYfyDrb5ymVU3pwGJhVtQhFDE8CBdsurlotWtvI9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sx3Y79cD; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sx3Y79cD"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8875d220446so313375b3a.3
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 03:16:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791281798; x=1791886598; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j534rI2GLWoLqHJsJ1LpomelkSLlLDjBn+7y/CTenmI=;
        b=sx3Y79cDizpyHQlZw2zCowIUagXmZQqAAdfGStd+MsTDHkLJkGWFUNWGEry6lk5+uB
         +iBTs/e6tUI+8nbL2GhCV9nOAN48Nm62OgyerDBbQZ93P6dE+ldexYLGXO5AcmgFAFKQ
         sYGYkuRgkGEbhVm69xwzIxzFYjY2Qq4syHtmiR+e9XpT167GnsnGSa1GXQUVXftjLHOv
         FAvrVwFH/S7OinYZEj5cIzu1iXs9+Cnvbd5VJHHRAR3kbLqdeGJlNgiMrT06sjvCbwvY
         9hi0JYJKLnTFZyrTzYxOGOupDgYd/Am0Iu54/WsU9Gc8ZBPY/S20BoEw+4ainUhVDt9I
         Gx+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791281798; x=1791886598;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=j534rI2GLWoLqHJsJ1LpomelkSLlLDjBn+7y/CTenmI=;
        b=0iHPf8DZRMJHNGji80hMu0yE/irRFAQFW8MAMXnC2+qBpik0STe1uuFJzcraQP7p0s
         gKnfYLOBk5WUnGPeW9YwKykABaaDE3LFhgpszH8eG1kkfPjpSt1u+sfKOquBR3oj4jmr
         AT4wkVoBhUFK/0XZNEvrnVX9jykRJk406R7ZPmS7To3J3u3EuGr0oZBYpG70XTiTl0Qg
         kylJKj8WUXKzoa+d/rvyNTybDU69jNJPSoXsmq8OQaLnrbsoLh8shDEbLKerVea1rHFo
         mTwGFbQspfdA6/ZfelG1gQCQlGcXw2r+EETt4F62F8tAqszNXb6Hv1iVXbNE3i9eo4fX
         R9Yw==
X-Forwarded-Encrypted: i=1; AKwUvBzO6Blo3XHLSNdpnfBowXlDa/ncWqhTYeb+odaPEV4YPND6tZ4Ho4i/Z6WzkYEU7fE6/sjJdCfoOPxoKAI=@vger.kernel.org
X-Gm-Message-State: AFuF++lMKLr2ICZ7VfjhC6LJMhHq7KcNMZRp3kRVvR1bhyEHqjhhgGVR
	1NYwVd8sT/GZDIIcGam9dYk2SSgrsS1LF1EMF8oTg456KtnMI/fYGcRx
X-Gm-Gg: AYBFou02/PmSdia5ga2pTxVM4Nqb87KqQY7UsNY/s8m5m9EzlTlDDyz1MJaIJUzJNht
	oxCJXzwbrj3roQLPS6ukLcKYYD0nMs9WDdarULzQjx2Lp/C8dNrgBvzNgjah1QxJTbmC5DtCF2E
	TcfcaYACyXQ0DIzzpXGj2xOZ/x49EgrVkFZPDO9Tc1e81/4Bk0nDJuFnB9QC+PYozk3DeIKxfey
	SIaVR8/Dgj3lGKXnTYeQOw0AyiySQCKsXdqjAtnz5T2FZUHo66m2sODDmHiZXO4PUneWupbZQgQ
	xZKOok+baIFqzfjbsJ1CGdm88JjHAyUBlZJyt8dfTr2Ey3/Fg9z4kQ+9maOOho5+BUAYwC3miEq
	D7vImzFmLil1yG7bJ1poR/874Q00AJ4qqWvZVZUWHoE6MLLeHD1KBjkB/VDESaQELWE4ApOWH9h
	Ng1CYGfEFWx3qCgKelgYj9d/usi+jE51PlkTcpTSeJiELtsTcXpnDmgbgXZVbtc1gEpluaO6Q1/
	y7tgI9hCfGdr3LAs42/ilqMVM1L3mCe06LiTyNgiv+nIeNtHE1ozlsspVHTTMHx0QkAsh3g21pr
	mnvuEOTn8brx2g==
X-Received: by 2002:a05:6a00:181c:b0:88b:c67f:a6a4 with SMTP id d2e1a72fcca58-890deebe383mr750381b3a.24.1791281798496;
        Tue, 06 Oct 2026 03:16:38 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88b0d152432sm4547505b3a.53.2026.10.06.03.16.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 03:16:38 -0700 (PDT)
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
Subject: [PATCH 2/4] ASoC: mediatek: mt8188: return 0 from mt8188_afe_fe_startup() on success
Date: Tue,  6 Oct 2026 17:16:04 +0700
Message-ID: <20261006101606.54079-3-phucduc.bui@gmail.com>
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

snd_pcm_hw_constraint_minmax() may return 1, which is then returned
from mt8188_afe_fe_startup(). ASoC only treats 0 as success when marking
the DAI as started, so .shutdown() can be skipped on rollback.

Return 0 explicitly on success.

Fixes: bf106bf09376 ("ASoC: mediatek: mt8188: add platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8188/mt8188-afe-pcm.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c b/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c
index 4010879ad1d3..87d6098caf99 100644
--- a/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c
+++ b/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c
@@ -318,8 +318,11 @@ static int mt8188_afe_fe_startup(struct snd_pcm_substream *substream,
 	ret = snd_pcm_hw_constraint_minmax(runtime,
 					   SNDRV_PCM_HW_PARAM_PERIOD_SIZE, 1,
 					   MT8188_MEMIF_DL7_MAX_PERIOD_SIZE);
-	if (ret < 0)
+	if (ret >= 0)
+		ret = 0;
+	else
 		dev_dbg(afe->dev, "hw_constraint_minmax failed\n");
+
 out:
 	return ret;
 }
-- 
2.43.0

