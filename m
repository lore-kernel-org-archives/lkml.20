Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD1583672AF
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 10:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791281807; cv=none; b=ujvNICl6EQExFmXWMG2kPbVH2/d1hH8JEa+xGA9JG1CBOFBPfhounkwXowKc4DHMgI1LKGIJC8G6qyNqMrFaZ2lNfsg6wdRBYyCvQ92mhj3R/XASmvJPt/Aj+cK/XBD4y7maCtiMMfkKmu6xsxe8a59qIBASXuOB8wZWZFMM0IA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791281807; c=relaxed/simple;
	bh=IPLilhdcPz0Rw1KffNK3T7TwDRffmKz0tzBAuXq8ebA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aJy5azylwprXJHwP81cSst3vUz26bGI7bj8J4qILZi4FdusPPYY2uCTpfFnkqXsD5YfYm3n87fwNKMO15v26pgRu8nf2qI1bLjG7WKmxdnrCCHVM2eeZfEKPBvgvJxTlVrGL0Pm+eoQyJVh28FuVd+h+2uzLKhL7fXc4Im5pZW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bM8GAPd5; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bM8GAPd5"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-88d48da248eso360256b3a.1
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 03:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791281805; x=1791886605; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0f/MTd/p24/UUitH2lVkrRpF3QAUdU24FyYEOQgmlyU=;
        b=bM8GAPd5ZcB556LPUmPLp6SW4GJGVo6Jdfi6cot1mmlcBIFwjsTd2+IcerwuHqzAaz
         kAP6C7AO0+AihlYhjozIChpVIXz2oAertNx9Aa+CAoy8XLDajq7bef1M7Id2+D/az7Fx
         3NebrrTu0Jhe1kO3lNwPI7KyNloeqoZ3TOyrvsTHOYXULzS8/LHJVnPRJFhsIQ8eUjeV
         UgGsQIcGmjLuuueSSy7KiJ+F1oxNTmvkXbeKvc6efRztg1q6NMiRzys+EgfxThxoyIBf
         yf6043rsOjELr44MDqsMeW9Wvh6o377qDmiMlh3jHC2KJER27i2Hhi15WHv81EqtZJmN
         g3WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791281805; x=1791886605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0f/MTd/p24/UUitH2lVkrRpF3QAUdU24FyYEOQgmlyU=;
        b=xs3OTIb3iDJvBTcAX2GDi5P19JFE/9sjRynPGmJx+OTmrnp3XEhayEvNJx90O+MRwv
         RpXQMQGn2hCRRBt4wustn0qXZg2XW5EvsyCFjwWKamqfNFcVljdnkjic5oLLLm3wk6B+
         vCDIYKxCDu9XX88V+3UVDtO1J88YnbKPZhKKhrZxjc+jqwOvSY5Etkz+Ks7/6vsN6uDY
         gQuXl25CBMtnasHLi8dKRuEuSpYHi1lMQQUhcRM8lyL08bt5eiY8B+m87NLtg8C1gTpu
         lqTkPVrpZj0KKvWMIY7qWaiQDDw9UMtgUOuRcDO8lhzaSl8edmdMrzL+DoudSjesjhq+
         dhjg==
X-Forwarded-Encrypted: i=1; AKwUvByZL+HDlLSJRh3ZM2T5Q3MkPm0ydZzyZ1cbnk+YGeT5O9spHNm6TZln3ibkeCn83WCS3tzy5Vd6NpMNSnQ=@vger.kernel.org
X-Gm-Message-State: AFuF++kZWAjgfBbJaTxFW+4XkeK2GAw93M8y4dsAjAunpEOiLR1nhczk
	jcENZFU8tTYmrUqOYxJWuhis30DYZigq/v8NvOWcE0nzZmyITFyTn+Hw
X-Gm-Gg: AYBFou0L8O1CgYGHE8VWOrVMZHuewjlYdnEVxAq2qovJF2AA6YU5FPWGR8ZEURQGnl9
	v4YyBqNW9E7GRHAN67LHnY63nf2aYK90Qq1nTPVwFMB/QGXa2kBRfGPDaVJmeduX/PCb8ZiSRwI
	Hzp2l9UNf/Anu0UHxELlReWsOFhrgq/VsIiBVJ18tyDM5Nz23ZaK+rzeHVsm8QYWqZF+ljOyg7N
	2j+uHTmsumYG0lAJlVIcXvPlIbKvEL/cvk7/nYVwlw8MhQt5ioVmNkwYvCsJF9bwI6KllBEL2vQ
	SZZlk16SK1w4P48/yE2F7+phpRKOPms+NWrovb+6n45O78tQ+hijbW2RiMIEAU0EbctXvfktw5q
	qkUK5gIxSmWGwXSlHcaFiY+zeg8RMmaI5/4L2LNgEoHJUafLp7A4LGwon2FtSwZsklbITLHntXm
	zX0DavPFSmV4hbbCFiT8b63Y6qH53nqg/BIV2+ucoUrGp8tZW9DIqAscXbGu48z25/zU6JdDDnV
	Rw3IphZv1RzipTk2z8x3sO5n3mzcXX+3t8Lsgn3A3WJuaUAtxiOZsvXyiJ/SdDFN0sdgJvNZ0tY
	kEf/gQ2WD/03Uw==
X-Received: by 2002:a05:6a20:c70b:b0:3dd:a196:69ec with SMTP id adf61e73a8af0-3e12492c658mr784333637.71.1791281805254;
        Tue, 06 Oct 2026 03:16:45 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88b0d152432sm4547505b3a.53.2026.10.06.03.16.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 03:16:44 -0700 (PDT)
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
Subject: [PATCH 3/4] ASoC: mediatek: mt8189:return 0 from mt8189_fe_startup() on success
Date: Tue,  6 Oct 2026 17:16:05 +0700
Message-ID: <20261006101606.54079-4-phucduc.bui@gmail.com>
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

snd_pcm_hw_constraint_integer() may return 1, which is then returned
from mt8189_fe_startup(). ASoC only treats 0 as success when marking
the DAI as started, so .shutdown() can be skipped on rollback.

Return 0 explicitly on success.

Fixes: 7eb153585598 ("ASoC: mediatek: mt8189: add platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8189/mt8189-afe-pcm.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c b/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c
index c0f340a6cc09..eefa96b701a5 100644
--- a/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c
+++ b/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c
@@ -155,8 +155,10 @@ static int mt8189_fe_startup(struct snd_pcm_substream *substream,
 
 	ret = snd_pcm_hw_constraint_integer(runtime,
 					    SNDRV_PCM_HW_PARAM_PERIODS);
-	if (ret < 0)
+	if (ret < 0) {
 		dev_warn(afe->dev, "snd_pcm_hw_constraint_integer failed\n");
+		return ret;
+	}
 
 	/* dynamic allocate irq to memif */
 	if (memif->irq_usage < 0) {
@@ -168,11 +170,11 @@ static int mt8189_fe_startup(struct snd_pcm_substream *substream,
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
 
 static void mt8189_fe_shutdown(struct snd_pcm_substream *substream,
-- 
2.43.0

