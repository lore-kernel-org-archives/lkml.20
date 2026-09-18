Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDC124FD27F
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 13:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789738783; cv=none; b=MpEEmwaRq9Bu+uExyWKg0mL0hmxagE+ZWhgGFml0WmBOUPj12QK/pgo8lBAVyxNCiSzhWBX1o7Uz/gORTzJNeHaPT/BDRjm9NLtJ7UVNedJL7A2bp+EvAlNA0n4luYjJyM0yXMtvaR5d5VpwOBOJofTfWjKYtc8ZOYVNPBXSw74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789738783; c=relaxed/simple;
	bh=bfkR/qLfNTRZ34en6gQMGVqTglrIkt0mNbRGBMAZoDA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uaSvhb0HP6OiaRP6wiOOFWr2KSXGLF6EwSl5bn5ku0Tr0MBOQyeYq4PHK8cixr/vd4/kvmY6pKwYCMopDWAvZviCjuztX5J3DDK39Udhqx8Hyw5eSGbHeC9S5CcfRqQz5XhHYY2zj2UZ1I7nDWf9eDpmpvvkB2xqO2oL9UDlEOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ncc1c4U+; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ncc1c4U+"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-398c066106cso633675a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 06:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789738781; x=1790343581; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TxsRadM9sjHy6Zgyy9bUhpwEa5BB107/pv0esjxDrJQ=;
        b=Ncc1c4U+EbAqreU6nIH8KKRspB8WfBXXLN96f7oaJn6aovVbz20//ds6Ihl1smbua9
         HXHmkl3b1WBvjgSCOj8E8RVfdYp6ElV5lLB2APcws/Iec9lQlyAB5u2eO3CCnpegHDJa
         +8cI9LRBJqVnBw+7Z8OiBzBpPkL211MttYu/AcSiVO9DUHWEVUTNrmtBI9mv9llV9XNr
         hQkThPpmbDOCFEaBLYLKOe9hkh21uednPzu56h8elr/AdKLqhAxI2rPht1if/dQ+Vhya
         n04s5GDrwkZJRKHKKZ4hLFHL+ymXjAVz47fkHJfSMXXTgdDDOu8FT5tmWn7Z5bhg32vc
         DiJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789738781; x=1790343581;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TxsRadM9sjHy6Zgyy9bUhpwEa5BB107/pv0esjxDrJQ=;
        b=2sZWHiFdICaucOT3/A9G/mJSfqwTZgBrN39jtney50UzN3VbMUQMC7Bngv85z3gG+5
         iS9z+MrdkPKhW1YukqpRvD2qyg2XBDAHaxNkJw243edWIZ9XFyOKQ5oKEbR1ZFVBdCZg
         H8/RT3sr8CYmG8GrOfxfFYlb2U8nXzA4UMhW8JCBDx2jiOoJmQhFvt6T1RCyaEimwTSv
         sU+b9hhlAeMxnDaQucJUnetv0Eb4VHIMY2kENW/m/uFwvkBsL2OXGE1Mz/AKwkkFyIKM
         n1bMF0FMZdRdHPmKCtqQETc9jIe7cs+KB2gV2E+ptuujikaRUcDcq7J1o0Uqcce82rbe
         L9vQ==
X-Forwarded-Encrypted: i=1; AKwUvBwdNC0n1TNkHrhZyF9o/tiNuxBkxJw7j9hOPYVLbDHxSXW6sTZB1fPHC5uOnMLpM7/+cwlNh67pXtEM9BE=@vger.kernel.org
X-Gm-Message-State: AFuF++kTvKwH3NP9Zth+E94mW58vHzm8aEtH79ACJ7Yxi43KDGxITX2f
	+kfeLZGGsQqPUYMcnmxs42vGf1J1bbsKXDlcWyHy/MmHE4q1ZTLVK3nm
X-Gm-Gg: AYBFou1hNMuFKB5MF+31AYa2X/n6dn86GG2OgS3lTanCnHzlRcqvgFMdTsu9RaDBOko
	80JDznJOGV5BaydwDbBRFdjf5k/LTjbXRmD5Ksyet49wib8uli395Lh2Q6VAfw6qhV5NYLsmqqo
	4H+DN5ubopIQuPzXII0VbSzbAR/6s0Stl3aYZltXjkr4AhE72PPjrcmJNOJMTbFfPemTYRxThUY
	/uALnPFK8IUNCwvZ2muiZ0jqcJszwsYDR+EipReDpGpRmP/mXAVDkbLs0Gtc77kWGr94BW9Bcud
	qcL5i3nCE2RJ5Q61u5rDHTj0UfNe9yqb/09sckr0OsJtH+85celdUlVv7SW5yfCyuFS9vpnjbjR
	V4DGFASDAVaWGgfliEy2mhOPN/NtwAhuTixL0u3kUGvP5O2ccdKplCLC5oREbftTuNVth7Wrq4u
	zZzjYLUwfXHHa3XIqtbgNiq2rIV824rucw11OowJ1meiHutRy71X/DNqRabmauB/8z4lNvZvh7X
	DjoDbRhhQTbJtOqbhi+FiQXgOQssGX3d+KRYD9f1UHhY0UsKc2lFo6/ASWp+aPgUSoC7bvf8JQl
	DNYaaWiUg5HK3w==
X-Received: by 2002:a17:90b:2dc3:b0:39d:e9b6:cec9 with SMTP id 98e67ed59e1d1-39e54d36756mr10232434a91.7.1789738781094;
        Fri, 18 Sep 2026 06:39:41 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e3617443asm13253792a91.9.2026.09.18.06.39.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 06:39:40 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	cassiogabrielcontato@gmail.com,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Jiaxin Yu <jiaxin.yu@mediatek.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 00/15] ASoC: mediatek: mt8192: Improve error handling
Date: Fri, 18 Sep 2026 20:38:56 +0700
Message-ID: <20260918133912.133799-1-phucduc.bui@gmail.com>
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

This series addresses part of the error handling in the MT8192 driver.

It propagates errors from clock operations, GPIO requests, and DAPM event
handlers, and uses dev_err_probe() for cleaner probe logic.

Compile-tested only.

Best regards, 
Phuc

bui duc phuc (15):
  ASoC: mediatek: mt8192: fix APLL mux error handling
  ASoC: mediatek: mt8192: fix AFE clock error handling
  ASoC: mediatek: mt8192: fix error handling in APLL enable functions
  ASoC: mediatek: mt8192: fix MCK clock error handling
  ASoC: mediatek: mt8192: switch to devm_clk_get_optional()
  ASoC: mediatek: mt8192: Use dev_err_probe() in mt8192_init_clock()
  ASoC: mediatek: mt8192: Propagate errors in mt8192_afe_gpio_request()
  ASoC: mediatek: mt8192: Use dev_err_probe() for devm_pinctrl_get()
  ASoC: mediatek: mt8192: check return values in mt8192_afe_gpio_init()
  ASoC: mediatek: mt8192: Handle regcache_sync() failure in runtime
    resume
  ASoC: mediatek: mt8192: Remove redundant error message
  ASoC: mediatek: mt8192: Propagate mt8192_afe_gpio_request() errors in
    ADDA DAI
  ASoC: mediatek: mt8192: Propagate errors in TDM DAI DAPM event
    handlers
  ASoC: mediatek: mt8192: Propagate errors in I2S DAI DAPM event
    handlers
  ASoC: mediatek: mt8192-mt6359: Fix error handling in MTKAIF
    calibration

 sound/soc/mediatek/mt8192/mt8192-afe-clk.c    | 163 +++++++++++-------
 sound/soc/mediatek/mt8192/mt8192-afe-gpio.c   |  94 +++++-----
 sound/soc/mediatek/mt8192/mt8192-afe-pcm.c    |  12 +-
 sound/soc/mediatek/mt8192/mt8192-dai-adda.c   |  44 +++--
 sound/soc/mediatek/mt8192/mt8192-dai-i2s.c    |  20 ++-
 sound/soc/mediatek/mt8192/mt8192-dai-tdm.c    |  18 +-
 .../mt8192/mt8192-mt6359-rt1015-rt5682.c      |  37 ++--
 7 files changed, 240 insertions(+), 148 deletions(-)

-- 
2.43.0

