Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ABDF47ACFD
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 11:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791198195; cv=none; b=rUhd2nW7v5JYWxQxuLrwGvMGmLaUH8ILL4MQSxEw5R4x4zk+A4jlo6DE2l0/pghxGMJX5HWLhRvhqfSA7txUzb3Xpt1JX9ItsuYW7P4eb1EjlXnOUDaWg9ZSpSk7dzED3B/TclccNrhkpM02a+awjyyMkrgRgCCQj63IWmylu+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791198195; c=relaxed/simple;
	bh=srpOY/YeSVH9cpBDRvuy4jhWcatwqPlft5VzYl8wWUE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UadlI99t5Gza3tsfGwRhmyd8cuDHJhMJOvvUIOTJGiwirwAzR+sZfx59+4ZcHt6MM4WacgPW8gLtn6KmM395Nf4uVTFCwZwqmls4nrdULDLLF5Nc4Tkvb1qHGCfUlAVr6JVCuNQ5Wt0IlOIIRGtYkGcGAUneElXDt8EiBfCyp+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AFrLtC8h; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AFrLtC8h"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cc52c1b8286so253054a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 04:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791198194; x=1791802994; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SH0Znh1ZN4Qa2aqMJURXlEwFyEPWYynPhvibLKZzQZk=;
        b=AFrLtC8h+FPdWNXIW7dN2tOwwjvGuLNFFMCOm+BX1Di5VzydOhuw1MuprnwG7mrSWA
         GBtoAdu8lwc6ab8/gSk5GyB2mfyST8dVyvREtbaIadQSJnh1ZaMI0sbDtChVpncxMrp5
         FIAA53QOZreMGDKOPf0UJ3hxNpumiFKFnpPKA42al2crcVgdbcQ0ER9lUb33KwIvFOjd
         lPWllHWRvi3xtuOfv+EAuFxFnQV6gE7ayS2L6acwCjDmiNR9rO92EvsIJcpoRjDP75z/
         1bDu3ZKkXCeS/5ntS8s5M8IT8boMG0jWy6nTrBE6GWi6yC9viDc6v8YfveAXDXxrI4l5
         Jrzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791198194; x=1791802994;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SH0Znh1ZN4Qa2aqMJURXlEwFyEPWYynPhvibLKZzQZk=;
        b=aP6v7nd002J5dLI1JvzRc8/hQgMpJCUG9QkjK5kYhUrxrn9kF6xfCAsrwZeS1nMITI
         s0N+wuz0rkYRZMcRhf/FeEoZzWQatrFwBwk6gC5A/9Fmin/0JpSgHgPh+swMghL5jjUJ
         bjAWk5LZpgOqeJZ4yYwV3CpdCGsZ9p3+qhfVdohMUoTwvkMG4BOblDwn5y75gSzyNIaT
         q0xIUjtsvBwLR3YBoDzcllJon3nMOscpYtr7AeRb9Mok6AP6M/zFa4DHbS9lK5C22tTB
         2pTLUr2lUnpV/N67+lLdnI/8ykP4vTiFYu3Rx9vqh4/3hGSCEEpKTa9AcmsuVxKhuoxV
         JGwA==
X-Forwarded-Encrypted: i=1; AKwUvBwu205Wy5FBsH332vYJ4rckPeZYFzFkvZEYm4g+LoXSrP7A0GK1o8k/5NLc/AHyE91SVoj9qOkHEPNDW/4=@vger.kernel.org
X-Gm-Message-State: AFuF++kVAJHVRoM7EW5EecbAa3vzVdjlguo9G8FaHBRSvf9swpcBpP+A
	lBAIlaftThwlX1OR6hxHCyA6cU0jt2LS7EmtbDQW5r2p/1BaQzbWDGby
X-Gm-Gg: AYBFou19oT71Zhaxo1j4pt0vNay9edKyXHD+C7mthxXPzRkcS+f4LSTkxBEWr/cfbkX
	FF5ZsUbO4K0S23JBKIHJ6X1Wo6J43E9TDAExoX8/PH8i/BsL/C9VoygSzRn5KBw5elRP5B1hUCQ
	HEY9EFT4S/vzXXBEqLMY9GSjU78iJzID+vzBqIapxzEQumLkIaPc9CUkEBeqkyNjuzrz5pnKfxB
	HTQw3HQpe0uAKAzNVbabgwPPHhAsY0RRKFCR5l+CdNyBDxVG/vLYKNDX5nRY5nLOWziOjPtd6Sf
	l3R3gQvzhkHQZunUwtfs+53MMic8elZDqpOvtmPiHHP/DdXG3k6V/5F8gyR39siG8x54s8BYAmi
	FeC9mblgJP2tv2hJGMkv04mTwKEx+FNNGn3ggOksSPc3jkQCTaMMGtdbEs851+jFFzIiSe/ZZNY
	WdlsN8QqS4fN1ntyz3NiN7bum2ldDrv7VWaMXJzOTnlwEjasr73FzNiy12flsKsqku7aG5nIFHn
	Levl0G1kHFwUru+F8PJTFLrapNM9JvHnISsjdexBhDtkdniAkVRLmXCBqfEk91SEwNxyNkyS53f
	I8TsBikCC627Kg==
X-Received: by 2002:a05:6a21:70cb:b0:3dd:a9a9:3967 with SMTP id adf61e73a8af0-3deacd7c65emr12182287637.43.1791198193691;
        Mon, 05 Oct 2026 04:03:13 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cce6d334de5sm626498a12.11.2026.10.05.04.03.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 04:03:13 -0700 (PDT)
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
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Haotian Zhang <vulab@iscas.ac.cn>,
	HariKrishna Sagala <hariconscious@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 00/14] ASoC: mediatek: mt8195: Fix clock error handling
Date: Mon,  5 Oct 2026 18:02:43 +0700
Message-ID: <20261005110257.50145-1-phucduc.bui@gmail.com>
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

This series improves error handling in the MT8195 ASoC driver,
mainly by checking and propagating errors from clock operations.

Changes in v2:
 - Check for negative return from mtk_afe_fe_startup().

Compile-tested only.

Best regards,
Phuc

bui duc phuc (14):
  ASoC: mediatek: mt8195: Fix tuner clock error handling
  ASoC: mediatek: mt8195: Use dev_err_probe() in mt8195_afe_init_clock()
  ASoC: mediatek: mt8195: Fix register access clock error handling
  ASoC: mediatek: mt8195: Fix timing system clock error handling
  ASoC: mediatek: mt8195: Fix paired memif clock error handling
  ASoC: mediatek: mt8195: Fix FE startup error handling
  ASoC: mediatek: mt8195: Fix runtime resume error handling
  ASoC: mediatek: mt8195: Remove redundant error message
  ASoC: mediatek: mt8195: Propagate IRQ lookup errors
  ASoC: mediatek: mt8195: Fix ETDM MCLK error handling
  ASoC: mediatek: mt8195: Fix ETDM startup error handling
  ASoC: mediatek: mt8195: Fix HDMI TX startup error handling
  ASoC: mediatek: mt8195: Fix ETDM probe error handling
  ASoC: mediatek: mt8195: Fix clock parent error handling

 sound/soc/mediatek/mt8195/mt8195-afe-clk.c  |  69 +++++++++----
 sound/soc/mediatek/mt8195/mt8195-afe-pcm.c  | 102 ++++++++++++++------
 sound/soc/mediatek/mt8195/mt8195-dai-adda.c |   3 +-
 sound/soc/mediatek/mt8195/mt8195-dai-etdm.c |  99 ++++++++++++++-----
 4 files changed, 198 insertions(+), 75 deletions(-)

-- 
2.43.0

