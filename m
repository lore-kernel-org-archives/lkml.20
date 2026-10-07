Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41A854854F4
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 11:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791371400; cv=none; b=I0T5mZwIYClU7IykasVdWNS6C7lQ7yAp3sGmGUruKWcEX8twObp9KUGcGR+3TgQkf7FJ/mpoUBcoDPuna9ZFc8xSvmn2lEQfIaC9e0xLFEftZDOrdaSYzKNkDeZkfMIIj8GGpXXTyrROor0Jx435KW5rvcFK+zF+plTpgGcleO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791371400; c=relaxed/simple;
	bh=IPGYtaOQglwuqgGFcejyGd0b+qOVVjwrtRjhs5z1A04=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rCwP9TnMdO9wMNEhyIAoosrzHOTE4SnEuFzGTsUgo4t4ynWWzz3psWLFFJ1RzVefuGtQ9lIdg9dcmu/ln2bK89q98/qaiycTev8BRUvvLmJHw8OPV5jpIprksKJqPeJSA0sXSTZM4R2rEFURYhUs64y7AZWHHaWekdUkvjbOTAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n1yl3wkw; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n1yl3wkw"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3a8adb68d8bso357685a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 04:09:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791371381; x=1791976181; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SACGOLnAL8mTnZGcUa8MVcCzBnwjTHmyT/MfByO6AXo=;
        b=n1yl3wkwKlcY1qJGozAYT88JRdraYWYmldedb8X8BgXHzCDCMb9I9+fNhWuGRFPMro
         n3yq6rbSx3b+F0ecjIx0rYi8k8PM3uLZPbqJhoNKDILryRHhehGjkEkK7tsXStAcCgIL
         sQmcYDKsFDgiMedoHqgsVNDDB6PLs1StVHVznRduQzxRiKh2FIvjVp5gElhVWBmb5Fmd
         JsJl//Rls87/r7yDDUn/AohVyGAtKUmH4ijz5Yj2xU6oAkMoVUXK2LLe2R2HFeLwpfDf
         CcioEeAoCKhObMMk3tAWhayQwdrUfHqJk6ub/zOVSGmyaR6KTJ2MZ/jkYJ3CrkUYlGg4
         H4mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791371381; x=1791976181;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SACGOLnAL8mTnZGcUa8MVcCzBnwjTHmyT/MfByO6AXo=;
        b=jhUAgDG4CjANiKhpYwYncr1UhvnucHN3FfmFzR09uSpHhH3KcqdN0aqmlbPCZx5VZD
         +EAgkT6kl18BSgpvIV7eX8YISOTXrMstGPdUEa18ALhEhP45fcx87m//EBrMYYmh7TGc
         rJJJS+8hZFiv2E4zFcOy37kdAzfBzFJapOGpx/rwZL4RBdMwcn9BMZHkWeqBNGCUTYZa
         xdG90i7QZIIMq0HdHI3ZLxy/M3aH8AD8RK3nKAegim+l76j/b/iiEgNxs25YzJ0Cvd0u
         B7aJXAy8IcfdNddHKL/1/BzaY3cesb8W/lRm7rrZjnPJRJbvoLec05X8fL1T157NKw0q
         G3aQ==
X-Forwarded-Encrypted: i=1; AKwUvByL5pHgBojSsXbDrVY60G03tRWyMgrWJsMaRAOGhBhjjYTkBzDwCNJ8KMSJmBnHABTXVZSnZOaeSELnNOk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJndiZ/Hm9A8IdKQLHcYa+Nwb95mYhBf9UWpLc9+LNg5I7LIIKE
	KK2u6mMle6xhTrX266ie0cgg3bBOgp4Xu77V3iB9nSm33cgCC8wOCCVo
X-Gm-Gg: AYBFou3SygbBmT2F4T1Is5ZzFbX04fnAlA2y4efNh7Ao2RA7E9UaR3WAD1Xg7Haf7ic
	ASnQS5mNEuM28JJtkAh02WMdnRMqfkVyGxafzHSfmBADifpFQmw6gXtVOqhuoBUG0c6Mwcby+Et
	QZOcjwrJulkFskStrYUovvQahfGkr8Q7FEi20sVpEqUQnOz8php3o5mfu8uqCfpu4bYaCxv7Y5A
	3HCFFMvT3+zhBQ71jezYjizE9mJBuf4J3rLpDjKuGgcT85Rq1QWOU2RXd9GvXbSGHLJ/yv+P9Js
	n7P7Rl/syMkHXYLyR3y0AQxxJ70NMUptHcFJERgy7VwqNvpxVI+hoTU4i6M6OSAVu18xTZB0UC6
	SNL1wTBiCqQpf812ftP1VL3wRiE+nI47EFf0WhjyE9vDLBO//fi83HFfRq6DbRvFWut5llqIa2Z
	krAmQBZiMaGOYgC9kgCM/sEXAN1H7UOipzwGyVh7Af24wNb1f/20FuSM2eKKOO79UCB0hF1MRR8
	GLnvknkarQwMz3lfLS5RPByRNPA5glExuZ2JRT6hGKcOgBKt4mvi6DCUSdKRML5Jgne/lK7ov54
	4whHseGBxF6iCQ==
X-Received: by 2002:a17:90b:2d0b:b0:3a6:f90b:20cd with SMTP id 98e67ed59e1d1-3a89f649916mr1577999a91.6.1791371381444;
        Wed, 07 Oct 2026 04:09:41 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a8a5ec70dbsm1328745a91.2.2026.10.07.04.09.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 04:09:41 -0700 (PDT)
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
Subject: [PATCH v2 1/4] ASoC: mediatek: common: Handle constraint return value in FE startup
Date: Wed,  7 Oct 2026 18:08:55 +0700
Message-ID: <20261007110858.509341-2-phucduc.bui@gmail.com>
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

