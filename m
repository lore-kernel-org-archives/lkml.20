Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2D3C368941
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 04:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788411168; cv=none; b=SGL9G5YU10uC6ow0HVw2U+LDr42U1vwCmIfOMZVeN2EIf6//A4nJu3is44qdm7M+aP1eqn1Y2KTkxBrcBJXnr3Wdzhj4k3S1TkyKjlFIysuAoox5NMDKndUedgPi6N+zwa3fQSJFIhZ5GzSXFAyizOsj1BA43x1svCyedXCdrUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788411168; c=relaxed/simple;
	bh=vhEaF87AcNPn5EcwQC99wiliM8yH41LnFNW22mPSM4U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=du4gbK5mWEmOMIsTVJYzP76l6+6cLLvL+8Hx82gr2BzBjFSyUv35IbjA+rpsFshziQqlXKqWx9H8ZCMjp1xkkbZoFrlB3+pcjYp6fFJefbt9nX4s98ykz4da9hK5JqxwG9jkTYjmoscb24+fjUyPzBMXenHWP9Sc7M6NLiNnH7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S5ltLkVG; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S5ltLkVG"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cc1d57602e8so2023301a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 21:52:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788411165; x=1789015965; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ESwlNjvZs7Wa/B2Z+WZbhnploP2cGr2N9OS4nSRjKU8=;
        b=S5ltLkVGU2kf2W9O82BIAGg8u7beRvf29uMBdAtbL3s0ny7Lf8oSW0by/PDDQJe815
         GLY4ax7C7HzDFmqzDCRb5Trt7JHmEayWb0P9Lh1nhbnQAU/rCdpZvIUuRzyP0XavT3Fj
         CUbCbbbzNkuwXHDKxB1u6JEwdqYVRMhzezGHoup+V4HPSVPRytUYxd3UTunnyWYXvKaX
         o/vNS3sajQq6wFaSyRaDNARbGfWAV+nInmstG1ETbroQ3qm8ajp0NVLTz9wofEnfejFY
         meUAER4C/eraCKGhMUgvGedwMiFrfykmwAEgxdLvEQVobd2yJUXVe9ACR58l35tStdDf
         xVKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788411165; x=1789015965;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ESwlNjvZs7Wa/B2Z+WZbhnploP2cGr2N9OS4nSRjKU8=;
        b=fF3oGClU8YncNLgMScDtUpqoPpIs0hhsACLO1mm20OseS0UEjUSkGcjdlnbL4Hujyi
         Lc03JipAsFZitWg1TuDT9McQRzC+lPxYhSz41uusimF4dp1K61kOdhl6iOiRtRiw9uOM
         oxvFe02nxFz2ShlRd+2Gzy4OBGM0rTSuffQ77YImwdgFgNbOfbZ3LfjHPANC84zFWT7Q
         UEZMwrWb1hkfSsqafM7nPYjVvqvmFs2XTWfUwXRDZ/3BjJ2R+L7/XFCA9Sic6D0NJkWm
         hn+4fHY8/966ZEcPeD/FRqT/jLUomvVHfihh1PI1OE8GwruCXPr7hYkEuWRpp/PcZN07
         Iesg==
X-Forwarded-Encrypted: i=1; AKwUvBw/mJzWCzyzs4x1kS1g2B8S1RWHgB7vTf37TabCiGhUnNBEJ8zB2z1SMVh4/xHvhw/2Ejv4Up3AF0jT1Xs=@vger.kernel.org
X-Gm-Message-State: AFuF++kSim+9Mc1qb+LfxQD+jdOU3tFTeSjkLbpHJLd2CG+6NU3NVW0q
	2PkO9YQnUu4poRjXdBgNzIhe+I8r6t9aPAoP5HMiP1LkLmNKRGLj92Ho
X-Gm-Gg: AYBFou2VClLmBwo1/iuGgFqTVIrVjH0hh7n21X1xCfm6ieFvX0ayDYTJfamqd9/p01K
	P3NNHjcuoCbL7KFyX3m9LI2xjdrXNcy8GZaYPsWqgDVeAyjw7Iu3ghmcCh/kA18mlU7MvAIFwXB
	mkzhTay+ONiF+1yRKuoGaxrYm0Wf8AL6Fis40NNG+xopJO7Qiya6Bur8lg9djubW2Rkg7xxU9qF
	hNdR/T8CZrpL3qLZWuu4UVKA5VsDfLd+lJeKrU209O1THqQRVJfOVv5GFH4DEKsJBC/a0hww9pR
	9PF/+hfxlUWsEy31zeXu7PaS4JtPaaDAqgiTI64yoalByH2Wjar6VRCFnKoRURZkgPezhgr4j4F
	BuCaw8TDbiAIEMCXfzPW/v3aok4uIko3HuAWIeegxgIFWRG3xh2abUO5EMMXtnQlRXzoqt1H3Ds
	vMTxzWOM/u5sRm980uBb3RlVeRHjvMNSdDth4yFtihMheAl+Fj343Z712rTEkmhylDkxrcqD5A+
	oFNUvXcgFtaKr4AqcrssZ/ghqtgggXuZRdhuVeoopWvgkrDNCarbwUJdeZXiaDBwXuVMowYsI2k
	V+MW
X-Received: by 2002:a17:90b:17cd:b0:38e:67e1:15b with SMTP id 98e67ed59e1d1-39aededf539mr13392201a91.6.1788411165011;
        Wed, 02 Sep 2026 21:52:45 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08d0d7e8sm2747538a91.16.2026.09.02.21.52.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 21:52:44 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Shunli Wang <shunli.wang@mediatek.com>,
	cassiogabrielcontato@gmail.com,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v4 0/5] ASoC: mediatek: mt8183: Fix clock error handling
Date: Thu,  3 Sep 2026 11:51:58 +0700
Message-ID: <20260903045203.175337-1-phucduc.bui@gmail.com>
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

This series fixes and cleans up clock error handling in the MT8183 ASoC 
driver.

Compile tested only.

Link v2:
https://lore.kernel.org/all/20260821122928.41343-1-phucduc.bui@gmail.com/

Link v3:
https://lore.kernel.org/all/20260828050526.590761-1-phucduc.bui@gmail.com/

Changes in v2:
 - Remove the redundant error log for apll1_mux_setting error handling.
 - Add Fixes tags.
 - Add a cover letter.
Changes in v3:
 - Add a patch to fix clock handling in the mux disable path, 
   as suggested by Cezary. 
 - Return directly from apllx_mux_setting() instead of using a goto label, 
   as suggested by Cezary.
 - Add a Reviewed-by tag.
Changes in v4:
 - Add a Reviewed-by tag from Cezary.
 - In the mux disable path, remove the goto labels so that all teardown 
   steps are attempted and any errors are only reported.

Best regards,
Phuc

bui duc phuc (5):
  ASoC: mediatek: mt8183: Fix wrong clock cleanup on clk_set_parent()
    failure
  ASoC: mediatek: mt8183: Fix clock handling in mux disable path
  ASoC: mediatek: mt8183: Fix APLL enable error handling
  ASoC: mediatek: mt8183: Use dev_err_probe() for error handling
  ASoC: mediatek: mt8183: Drop redundant probe error messages

 sound/soc/mediatek/mt8183/mt8183-afe-clk.c | 31 +++++++++++-----------
 sound/soc/mediatek/mt8183/mt8183-afe-pcm.c |  8 ++----
 2 files changed, 17 insertions(+), 22 deletions(-)

-- 
2.43.0

