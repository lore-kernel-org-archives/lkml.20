Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C30D03BFAE0
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789370938; cv=none; b=l5JONaoaLFcnREBltlWQ9wWg1Qy7u6TKpJ6c8ZXsw3v+kZ02BuOEvNgVRw3XK0XEHbrfCAymlyQqGHJxX5eH2BoXEzQDTB5SHmX/D9wMOje98spWpHeuqbRTQbm83RSgoCAuC8VBxOLW8mnx6y1XlJJRM4AD3wDpjYg3qyXcgbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789370938; c=relaxed/simple;
	bh=2CcPm7Cfm0LPYY+SBic1zMOSG4SC06Av06vGivN7fNY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rKm1PeDOQBePAzf5Hr7h34lrePNXvWMvZS4NdF8CvQy0z+bGGix6DkzExAOn/lu6i4S8GepXzQHDp5TLqBGqf4UTVwKUwnhazQod/xzrhCw57ZCMoUU89YNOJaP1T93d0EcfYDcappprxWdkONLUvBzDfpxo8fhDc+FLTGaHgpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HvYKEGMz; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HvYKEGMz"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc4aa0f1a94so1100323a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 00:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789370936; x=1789975736; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0PXm0Hk8s8gy5/waTkuG4N68LdsLQ96+cyFMyC7Q3Yo=;
        b=HvYKEGMzFUPUCpMJjs3UKVe5BtIxYOB0xo+jdd49HblPWu1rragxb0Yum9cn2s6UOI
         /LjPQmOyipDfhNH/UL+g37aOIPjVgMV3YaZ4Vpcxyf/2JEINiVAaF48eIEPGImU7crh0
         kj5OqvXlJsKaxPAqtMs5SRNoFDwzBPRMokCaLXYZ98wLdyxg+01RgQNWcIY2nOlhdSa9
         O0ZXHfhlxn9CXvF332LdTSEnryHKpfPUA9Y29eyy8QwiIxjf8dr9DdM3lIYGSEYAV3CZ
         NITLLTGKXdDAW027jAmkSCseFHdrYuEGGf0OE3HLyEGDJcV8Ha2luZMl2epDV/qhY/AZ
         2mKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789370936; x=1789975736;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0PXm0Hk8s8gy5/waTkuG4N68LdsLQ96+cyFMyC7Q3Yo=;
        b=m2bQ/ISC1t7Xo64PX/Fr2SgWESERcaDfYkg7NhTJ9PPqtA+qVoXZfxc9ayHWddHiI6
         FCNWh41yC1iIlAM/3BSf7c2W00dZJXY/haPz+JEEeWFGM8X5hAWC3Pc9anZ5QiS4An+j
         jzfOEnIG4vR9WwFUQlI1pYVEOPp1nm6+dsinCARSI3hvYgC7xLkvQEH5DV3LinXWxdfV
         uBMgo2XWCrP4pXua2W6Bhrl5XwauOdacdD8Gycfais03b9i3dGxRtntTY38k+bwxzIi4
         EdKnCeDW+55yVzAV3LRGmcNRlT32zaDVbIBJm4ULBEv/zJlBspEkf4/a5cz9uiB1yMGN
         R6Jg==
X-Forwarded-Encrypted: i=1; AKwUvBz+F/BybjemoFY9K4MEhgUlw7AKOngvCaDLxapgwcs9w6UDiv0wW2XvmTTEiIBMYfyGN4bt0SNZyJi6M40=@vger.kernel.org
X-Gm-Message-State: AFuF++mSY6HutSBUKfy2r4YXk/b2NJK9bhoV2lIgHc3gpqnh0Qk58XW0
	8diwU5bc6kwGJe27nGkTxRnSFbpi1Ec1zXz5FI88sBlIUBAqa+BcAwCA
X-Gm-Gg: AYBFou2bYxVnlcQtE/e4mUfh5HxgraEKau6PJtvjEkriMlpMhR9QFDYarFKTIZM+Pv4
	RU5yRxVRhR6DvBPIPjpq7GAWleMOpbXX6tDihOov61PBfqi+GZj8J9iM/2hmhFk6KJuRJpKtJgY
	d6DyzQmtSbEpgLjv8cdXU4jdIrBwfh9O5x9+TpxrOyAqyB97CQbitRce8SKDuF5oywrNS92gb6z
	jjJFfqN/xWmAIInUUMTeQOOvU1poUriuSLrkq5OXJ3jtv2IywNr4P2kT+XVk2nwpup8sPYFbgif
	suGUsNtHAVHsUd4mormdvLgoRsbzz+hiSAKpWy11XRDprNtu5b30XVhmXnIeL7mAjhRDm0oyvuM
	sGxfWLiGpPJqNc8Wb+AbgQEvQoehc0eugNYBh0Dg6zeNUizKaMvMx25wyDIEI9T/5o53at/EFN6
	EWIWGSbKLsdz34RIylYo8GT7at/0QCaa0/VL0v26c3m8IeFPWSVL4fezYiK02bZzvDsc8aRV0/3
	/DaIS0U/weYq6nANqaOrRp6p62MefBIhDfmbw05rj+JvcQ0e8uPYEp0yskJiyhk//w+8jZ+8GOX
	N3NaXivNv50pwzQ=
X-Received: by 2002:a17:90b:1d4e:b0:38f:5869:387b with SMTP id 98e67ed59e1d1-39debfaef5cmr2973318a91.9.1789370936217;
        Mon, 14 Sep 2026 00:28:56 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d957131f9sm19598245a91.12.2026.09.14.00.28.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:28:55 -0700 (PDT)
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
Subject: [PATCH v2 00/13] ASoC: mediatek: mt8189: Improve error handling
Date: Mon, 14 Sep 2026 14:28:29 +0700
Message-ID: <20260914072842.24420-1-phucduc.bui@gmail.com>
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

Compile-tested only.

Link v1 : 
https://lore.kernel.org/all/20260910125742.150902-1-phucduc.bui@gmail.com/

Changes in v2:
 - Update the names of the goto labels.
 - Check for zero frequency since freq is unsigned. 

Best regards,
Phuc

bui duc phuc (13):
  ASoC: mediatek: mt8189: Return error for missing regmap
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

 sound/soc/mediatek/mt8189/mt8189-afe-clk.c | 136 +++++++++++++++------
 sound/soc/mediatek/mt8189/mt8189-afe-pcm.c |  49 +++++---
 sound/soc/mediatek/mt8189/mt8189-dai-i2s.c |  17 ++-
 sound/soc/mediatek/mt8189/mt8189-dai-tdm.c |  17 ++-
 4 files changed, 155 insertions(+), 64 deletions(-)

-- 
2.43.0

