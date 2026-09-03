Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA03123EA84
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 05:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788412331; cv=none; b=HwwHNsbpXAIBf0y1JxkUUyZpiwI1CFKfrL5xj5+u4Kz3IwBV9gRzW6pMw76Ade0jzhQ6Nzf2NgjJQV3z4PVitxP9/wURPNOaGdVL50P468nFtl8t4NTuhmgvJTbn8Gvt3Z0Qk0PxVsKpXoUYRWmYqFK3wt8UM+ZtIR37Kg3cICk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788412331; c=relaxed/simple;
	bh=QuHzfk6YmKahgTfxy5ReSNFyHaM28WbpdYkFRfUwrAg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QDq+4uCDt0SfIOKLFju4+B/CbTtUffjroKLhlXEZOio31UL4PgrsxudG8Na6ZhZmVeGRS+TpRXQDfv/Z470jY9RylvS20O4jThJ5BEJU0tN+EgcnhscD9wlgLjACyPhC72G27xu6S+pS//sj0Lkcf/6xHdu6preiGsFe2y+oPD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MbnSDDLT; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MbnSDDLT"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-39682983a0fso2511797a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 22:12:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788412329; x=1789017129; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cBr8HRxr2IvFH9jg6UhnzrGvkPEyPmptbNqlHpdb1vQ=;
        b=MbnSDDLTZtUXB1dXjWnAIpUDM0HImxs279kP+1NtcCtF2EQyHgkc5DySMnS6Ze3VIB
         wdTe6U+6ZX/e9onRZajyf3RixpIUPbDKCNcUdHHGMgW5MQGrjYpUegih0ew49ZxUn0pD
         MlcTyE7huqE8g62W5pQztptoqaOGQe+YhM64LrkvKUqu5gfgliaAd5rdKXFFZBsRW3Ro
         IWEvCVTne40+VHHAtAfhxuVdADfAcXLddV5FQne0l2sSdG3k7cEPnTekAtkdZftAGhE1
         WLGiEfSYx5DRB8UEG3tg/Gp87yfOx/cmS50rlk3OAT8xqaaICTWw5BP45QN6nV9xIfAc
         zv9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788412329; x=1789017129;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cBr8HRxr2IvFH9jg6UhnzrGvkPEyPmptbNqlHpdb1vQ=;
        b=AaGr/cly94nX0tQlYWxIBL7MRGfPa98VI+MOwAHx42yRsaPkzrtut7QzmJmN+K8QEg
         QhJER/y7xFwUx56JF3G14Ho344fK5FsGcK5zI/Js3s8504fe+ZRXAkrd5O7vGas/bF+M
         7E05XznGpDpm7ipGrZPkVW4VrZytvclP3qLxdJAQGC1Pm1dK39kOn6In7h80iqLoHV31
         +zSLDRLHHR5jEX1YRalBeYP8SMb0qob86vLepHKER0TKu/PM/0iSwF5F/fotHimRiZxw
         fC8PdKtWrJOGNNverMtTdKbrPiT0ZMQ5n8J8c7vNG1Sm3jB7aRP/BRPRP2az6jMaOpsc
         YPpg==
X-Forwarded-Encrypted: i=1; AKwUvBxPjXRPm69OtScwiQOzLZ1YtVAaVi4/HP4dMj8YxxZwhqjZxvx1wk9lUBESsd07X33iMyVvWOyhbVskDW4=@vger.kernel.org
X-Gm-Message-State: AFuF++nBnl0ZCAU3b9A4h6+JAgx1s00+3cZjBYDzJvySii4oi3LyuzQp
	dfnCXfVyzff5LM7YS1OSON1zw6rrzyA0GuBtqLdDPS53eT8e3sA+ZgKD
X-Gm-Gg: AYBFou2WB0/LFYQ8e5dmC3Om2sYxA/9jK6DD9UaDAI6cr5JY0em5kGn1sfNt153dT7t
	gpcml7YvFuQswnIF0b/4igrq7EfY92GyYNMQ4aMwSROxyVYhTda98l9VctAtC+LwtqcuMA5yKWA
	ijY4t8KxriHzAkkLWg24Qj2stII+bBozp/rMQZ8a3mlYP9FJtHoUKqb5itJef6590jj5IcW75hj
	qsFzI8/800Y5Q2keoxy6d9CDI6fwf2mMOMFQsXba2uN0QMxur471eBIBntoM21yfysC9PX/IBy9
	M3XpGQVSUiIV+VnPcrAMHF/U/Luf/34x+euhDVTRBRiFc9J/mJImVOtUqyW0/s0RaImNeWymi1n
	e749GhxLCAmL6rjUsaGTllo5XcXRV0z5PXz12zbzrHnN3TxXDi7u9+Z5asoqUZnaroUauSTsBQI
	Qm5ERXsXmrMp/Ga1nns1rupCaUgrjqlfdpcB4qbFVQii8rl0aK2IPtBCLziWA94hT/1dj/ovYkG
	Xm99NKXVVDwqrtsvTZEcvWqlnLvvUCoJtfidTsYFE3eKSmDubc7GBLYQg/lRov945MADdJvXUGK
	NRhC
X-Received: by 2002:a17:90a:ec8c:b0:38e:5964:97a8 with SMTP id 98e67ed59e1d1-39aee04ace5mr16394737a91.16.1788412328628;
        Wed, 02 Sep 2026 22:12:08 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b0875ce14sm3218092a91.13.2026.09.02.22.12.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 22:12:08 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Jiaxin Yu <jiaxin.yu@mediatek.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v4 0/8] ASoC: mediatek: mt8186: Fix clock error handling
Date: Thu,  3 Sep 2026 12:11:42 +0700
Message-ID: <20260903051150.178057-1-phucduc.bui@gmail.com>
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

This series fixes several error handling issues in the mt8186 ASoC driver.

The patches mainly address failures during APLL/mux, clock, MCK, GPIO,
and regcache operations. In particular, they make sure that partial
failures are handled correctly and that resources are left in a
consistent state.

The series also removes redundant probe error messages where the errors
are already reported by the called functions.

The changes were found by manual code inspection and compile-tested only.

Link v1 : 
https://lore.kernel.org/all/20260820111253.97866-1-phucduc.bui@gmail.com/

Link v2: 
https://lore.kernel.org/all/20260821123021.41390-1-phucduc.bui@gmail.com/

Link v3:
https://lore.kernel.org/all/20260828091532.600047-1-phucduc.bui@gmail.com/

Changes in v2:
 - Update the cover letter.
 - Drop patch 5 from v1.
 - Add Fixes tags.
Changes in v3:
 - Add a patch to fix clock handling in the mux disable path
 - Return directly from apllx_mux_setting() instead of using a goto label
 - Add GPIO rollback handling for partial failures in ADDA DL/UL.
 - Add Handle failures from regcache_sync().
 - Add a patch to remove redundant error messages from the probe path.
 - Update the cover letter.
Changes in v4:
 - In the mux disable path, remove the goto labels so that all teardown
   steps are attempted and any errors are only reported.

Best regards,
Phuc

bui duc phuc (8):
  ASoC: mediatek: mt8186: Fix APLL mux setting error handling
  ASoC: mediatek: mt8186: Fix clock handling in mux disable path
  ASoC: mediatek: mt8186: Fix AFE clock error handling
  ASoC: mediatek: mt8186: Fix APLL enable error handling
  ASoC: mediatek: mt8186: Fix MCK error handling
  ASoC: mediatek: mt8186: Fix gpio rollback on adda dl/ul partial
    failure
  ASoC: mediatek: mt8186: Handle regcache sync failure
  ASoC: mediatek: mt8186: Drop redundant probe error messages

 sound/soc/mediatek/mt8186/mt8186-afe-clk.c  | 95 ++++++++++++++-------
 sound/soc/mediatek/mt8186/mt8186-afe-gpio.c |  6 +-
 sound/soc/mediatek/mt8186/mt8186-afe-pcm.c  | 21 +++--
 3 files changed, 78 insertions(+), 44 deletions(-)

-- 
2.43.0

