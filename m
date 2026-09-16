Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B42C34FF79
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 05:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789534841; cv=none; b=rSWplSsUzD8ecRzXBhwz9IvfpPN3WdPndRXDAk+urZo+8G6gMvujz3PJBoe2A+cFcKN8E7G6od6LSMPjUx6VmYOPPWNvswt2X40sw0ffckES6XqBnTKcoDnW7AGg7AK4RqQvhGsTihcRmpc3kU5ousCKifnyTyTq7yMxiz+54Dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789534841; c=relaxed/simple;
	bh=ia/XtnRAaExPSbXuMXlFSKQ4MRBhm7ffRyuC+GlyLMQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZxetGqvUVuX90FuIOvkW2zT9htCSSiRvEWW6dt6bTliMC6m3vwSEVw7eltibv7Ps4BG6um+12rlrCrnwAv655Xz/v+gsonToD+U9gLEaBJd6DfBizLoJNXIyFH6LYFhRjb5SkdTgtU9c410QrkuIoHFsULXMUszTFaNd21gISog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lt5V+NDM; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lt5V+NDM"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc4d04d740cso401692a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 22:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789534840; x=1790139640; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iARb8n/qcGnTWsohfRgsSXvgkdWyuqUiUdH2ru4qCBI=;
        b=Lt5V+NDMNcuodSQd2vbL17dMne9/HyI4JoHRZ5K2j2Q5JlwYMxwrO/8D8dk7bZn8Uc
         vWTiY+nGauPtbHudWkebm3NgcfoxR2viOcQkv44Ur5EzJSZTAWRV4NC68nMjvFVUXoHS
         h1z65DD6Lx4oTYN9Z0FqMn/2qNlAbkmY7QubjE46sayp3Y5OVXpxJNZtR3DEWHLGZ4a1
         b4FGEyxIPTlwIPyEDu/PMHKBZCV/Q9pOmtMNvMMRnl47WigUS4ElFMVll9TtZRHJx5IG
         cEaNnfuYIZLoSW6dF4SgkLLc+pVxapxi2trpAB5PzWOO3zX3e8i6ts4PTuh9B6sKK/rX
         Y3ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789534840; x=1790139640;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iARb8n/qcGnTWsohfRgsSXvgkdWyuqUiUdH2ru4qCBI=;
        b=RqEQM07ck/Dak/OKteUf41ZesRJCuF2naDgEMhVD/AniknaFynwJhOgW0BH6ym7yIp
         BrdhE0zNtWpQ5y0/hWuuRJT1RFlvhBpzk2dX7gVqHkMPfwDerZVNV3WihGDY7xP1RJmN
         5Ux3AG/JEOfRhKko4SSLdpCsjp/mYMHfiTVLr1s75et9nLuCGWxHRgnCukt6CzVaTdE4
         ZN31BKQDiU+cGW+esFikXNy9sUE67san4gNW18IGugvsyjv6q7/KrSvewWKtQGf6sPR1
         SGzobk+fsFv5XVGKyJtjpH6Kd/lbuAkwu7pPLZVNYF2Ed54xN7lAnuU5Y343u9T1pudT
         pTAw==
X-Forwarded-Encrypted: i=1; AKwUvBxYkLyZKk/qt33+S3qgnK76tN3rqQYcqzDM2X/5mcjoihG/vkyUqwwkESMZp+Gj9g6LWEl9qTBpa8ytcts=@vger.kernel.org
X-Gm-Message-State: AFuF++kd9iHMGzwjbA+S6nrC9CJ/WcOIZJ76T1vmJrIOePVXgixBDRTl
	qbBae9OPhCy4Tt9gjMrFQ9MN2hbjmESDtYEBXw9ZiXqXdZweMSb+664O
X-Gm-Gg: AYBFou12qnHvxTp8WmVvwqDg0al8oz89sTF0davdwycMchT266pgXHd/lCKu0Xnrmqj
	Dm9DfUh8AQhXKF5hDYSnKnDZzowKODb1CgV0pelrQviyyAcmto2gie6C9YcfFRqPWeG66SRJUNO
	MNJ5JxkmPHFNz4yAk9PxfjCmtJsznZGXRIsNlKPcNzCJA5W80UfyFtAH/L+qEjV8YA7T5KMcfd3
	tpluJXk6/xsRoKKrUTEYGLcoHLU+5Q7JNYMtu3pvdjKC0fqLipVpe/N/Ii83GDiaGL7n3yU/e1q
	a9EbOlPh1oxbcpETiT5KoEBa2AqNB803fvmVDUcCmU1ECuAXzZoPrRmwP+vigZ3ALsPcY+rL7kL
	SNGKvkUkASAarwn1BbKyKf0xKcZBZnK04HmkFFXlyCRC2oFUaj9wxIwFe3SZkUkRqCOg5IDfQTJ
	8PnVbzRsGrYTt9zPuacJSEeQg/T/AemduIe9dSxjVly26N30i+Nc5jM3Tp/T+bcpVMQRUrOTdlq
	FRwPE1GICMA0cprRKEhUOjr8I4CpkOgU4QaarLzZanjIcnmbFbEs4r5DUrGjvh+4l1enDAsECh7
	MFgW6s+GteBuMKW5
X-Received: by 2002:a05:6300:6697:b0:3be:b0b3:3962 with SMTP id adf61e73a8af0-3dd5f44a0camr3248100637.9.1789534836913;
        Tue, 15 Sep 2026 22:00:36 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc50abb1776sm850589a12.27.2026.09.15.22.00.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 22:00:36 -0700 (PDT)
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
Subject: [PATCH v3 00/12] ASoC: mediatek: mt8189: Improve error handling
Date: Wed, 16 Sep 2026 12:00:07 +0700
Message-ID: <20260916050020.14575-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Hi all,

This series addresses part of the error handling in the MT8189 AFE driver.

It propagates errors from clock operations and runtime resume, validates
clock parameters, and removes redundant error messages.

In v2, there was discussion about checking the return value of 
regmap_update_bits(). While opinions differed, the existing driver already 
checks it in mt8189_afe_enable_top_cg(), which is used by 
mt8189_apll1_enable() and mt8189_apll2_enable() touched by this series.

Therefore, I keep these checks and add the corresponding error paths for 
consistency.

Compile-tested only.

Link v1 : 
https://lore.kernel.org/all/20260910125742.150902-1-phucduc.bui@gmail.com/
Link v2:
https://lore.kernel.org/all/20260914072842.24420-1-phucduc.bui@gmail.com/

Changes in v2:
 - Update the names of the goto labels.
 - Check for zero frequency since freq is unsigned. 
Changes in v3:
 - Add Angelo's Reviewed-by tag.
 - Restore the existing afe->regmap checks, 
   making the separate patch for missing regmap unnecessary.
 - Do not pre-initialize ret; set ret = 0 in the default case throughout 
   the series.

Best regards,
Phuc

bui duc phuc (12):
  ASoC: mediatek: mt8189: Propagate APLL enable errors
  ASoC: mediatek: mt8189: Propagate MCK enable errors
  ASoC: mediatek: mt8189: Validate MCK ID
  ASoC: mediatek: mt8189: Propagate reg_rw clock errors
  ASoC: mediatek: mt8189: Use dev_err_probe() for clock errors
  ASoC: mediatek: mt8189: Propagate runtime resume errors
  ASoC: mediatek: mt8189: Remove redundant error message
  ASoC: mediatek: mt8189: Propagate APLL errors
  ASoC: mediatek: mt8189: Propagate MCLK errors
  ASoC: mediatek: mt8189: Validate sysclk frequency
  ASoC: mediatek: mt8189: Propagate TDM clock errors
  ASoC: mediatek: mt8189: Validate TDM MCLK frequency

 sound/soc/mediatek/mt8189/mt8189-afe-clk.c | 134 +++++++++++++++------
 sound/soc/mediatek/mt8189/mt8189-afe-pcm.c |  45 ++++---
 sound/soc/mediatek/mt8189/mt8189-dai-i2s.c |  18 ++-
 sound/soc/mediatek/mt8189/mt8189-dai-tdm.c |  19 ++-
 4 files changed, 154 insertions(+), 62 deletions(-)

-- 
2.43.0

