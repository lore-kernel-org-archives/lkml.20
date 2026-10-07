Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5622948640B
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 11:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791371407; cv=none; b=Di/W3nUcjpGUr+VpR2tVSddJHvJafYpGWrs3zZNoonXEYJhqNXOJYoNbl9PVuuIfZyp5agJmp7cErSkC03G1zwMZfU71amN1aopkl6tg5+xghccIDZXvCznr56HtU/+YtdqhPWzXHXusNdhbE0L3JvBw2QUMghXNViz+imhCAcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791371407; c=relaxed/simple;
	bh=ek9iMbN6/T58Y5ZkX9mvVhOW3cmmdMjNX75uRDed6+g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F81aZQHuB3ItnXJORWboGprmPPevaBvIq2zLao1Er4xJQqmsGHASaHBnmHCSeCh06VqYkvkoUGN/Iojust47EvrJg1/qdWbO1C4XnTeMlHHPQe7qnctMha+yg2Jwho8a0fXlddN9GTErpeYATJxtcPzwiU7PR8hh7f3Q3U7jk84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TiMHMC73; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TiMHMC73"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cc4dbcf2b85so1863665a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 04:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791371388; x=1791976188; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CNV1bGZ8s0HMJS7MZxacnD8sWRhxmo+yws19q0+WRZ4=;
        b=TiMHMC73nYTHIhz9PeoPex2fH47X34hj+HeOTG85iyD91nxr/iDBL0tyBvIKaJyNkU
         S1c1/vUYee1uKw+4XFXqjKTr13WerGiM9fjlgGM0mbVivRy+OXHILPWRt22xYJjjZuvG
         6C8dLTfV6tfPacmiwtpI5AePc6JJjaLArFltHRPrEdag2H6XP4UnjvBCwP2ZSnErPDNY
         ouDAhzvUXk4ynDl/boTsPsgu/5TnY8VblZUXiMwtmd1U2M0fdd1YNI4KS2L3gEJWzXEk
         e2LRK9T9HRC8Pgcq9BWRA4CcXzNXsNX7LuGlufBU4p90t/eBck+ovG35HbcjZv4sfU47
         HP/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791371388; x=1791976188;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CNV1bGZ8s0HMJS7MZxacnD8sWRhxmo+yws19q0+WRZ4=;
        b=ncwoOU/hyrhycP8GuVlQtF466kAbHZU7w0u1/XEODB2Pv8BaWPOfXEbh3WKeZw3fc1
         pO6ZrlYd3nctv1ikVYQxFvhiIfEeOxCyZ2aQQxynh594ZBjFUjDnBwXP7H0OeepPrZya
         OLmgdU+dW/HTmhX9e6VvrUsY4o/r1xZCeqSzaFrXOjU/eBEaaXZak1lFGG+C9fGIAwmM
         +A7A5jMv6uev0PWb4TR3UPGqEQ194aBKRkQudEfgvuiO70JL2hNnxIGPKD89Bc5AFg8R
         TOlJdZ6WXndztWBu5MuUiYe0VIu8gN2qSecZ6t6wwSkvTd7owhf5QFqhEMoCZ93l4UMF
         S7KQ==
X-Forwarded-Encrypted: i=1; AKwUvByY/a1LwAPpojL6RAbHyiEVE8j7O4Jqdu9CMgAN7Rs+6vwRkHgXJ1PpqPOP/bOo9Cr4zvzaZVxBZLzBsEw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLGME5TIbzDS6AvCvHIyHD4XjWfILV3NRgqAwoZ1g7NhTN1V9yW
	vJffWJXdpqV+hfc4KDK0TMdO44G8xFdLFCsHqZ5l/MLnoFY85qn9mAHL
X-Gm-Gg: AYBFou3fr7NLGsATFwlzFOfuB8+GXsL56+oTmgja2JqIZ7Se5HtYSPVjKT/HWGPjpCf
	3E/p/kc7kIO3ExkbJa4RLLiw24kOPSW5mXsoQpJfrJHNzTv40sTWyAN7OTpr3ApU9dgpWsH2/XQ
	vx//bQe2UUFAs7WSEDKhjIindi6JxiQIn+cgeAyq/685iNgSA15b9GSqBH08L6Qa0kJE/jS41yc
	7b609GU0vuK2mW6FRapSDOtgZQRvIjHhFCGUuRJ057Paj2v7HrmBcnev930vMjZ99BhFqecHEGk
	Cm6QQhY5z5PoybYoyyaKTYcbDV7E8EHD9sLKHk/BHJoZAai3KDo4zqI6TFdFbnH80sc9m5YJNTX
	fm88SmV6GHM1gCMeGZ5aFL34Oe8txGgmKPWTHEAj3Gtqlsd2hOWffbEnW1KKRg7atehhM+AyRzt
	Q0HNaVYxkxlNXRSeRHNzBiRYDrjSKtREVPu4by0G2EIJmZ/GiVFH8Qh3ijB3gpVqwc6ii0HKPEO
	YWdwnRvtHLYqiwZDypxl69P1GLy6heJAfdPa9vicxyxb7UsMiLCHeJwAE52L398uf/JBopWw7Ky
	CK6ibPqTom7V6g==
X-Received: by 2002:a17:90b:288c:b0:398:c3ca:1ebc with SMTP id 98e67ed59e1d1-3a8a1969c32mr1650916a91.18.1791371388256;
        Wed, 07 Oct 2026 04:09:48 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a8a5ec70dbsm1328745a91.2.2026.10.07.04.09.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 04:09:47 -0700 (PDT)
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
Subject: [PATCH v2 2/4] ASoC: mediatek: mt8188: Handle constraint return value in FE startup
Date: Wed,  7 Oct 2026 18:08:56 +0700
Message-ID: <20261007110858.509341-3-phucduc.bui@gmail.com>
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

snd_pcm_hw_constraint_minmax() may return 1, which is then returned
from mt8188_afe_fe_startup(). ASoC only treats 0 as success when marking
the DAI as started, so .shutdown() can be skipped on rollback.

Return 0 explicitly on success.

Fixes: bf106bf09376 ("ASoC: mediatek: mt8188: add platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v2:
 - Simplify the code change as suggested by Cezary. 

 sound/soc/mediatek/mt8188/mt8188-afe-pcm.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c b/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c
index 4010879ad1d3..b2d935ae8668 100644
--- a/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c
+++ b/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c
@@ -320,6 +320,9 @@ static int mt8188_afe_fe_startup(struct snd_pcm_substream *substream,
 					   MT8188_MEMIF_DL7_MAX_PERIOD_SIZE);
 	if (ret < 0)
 		dev_dbg(afe->dev, "hw_constraint_minmax failed\n");
+	else
+		ret = 0;
+
 out:
 	return ret;
 }
-- 
2.43.0

