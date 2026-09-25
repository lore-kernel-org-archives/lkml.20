Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1593D3C4B8E
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 04:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790311766; cv=none; b=YA3d7f+GsU9y6WM5FtggC4hrAfaYhA+TfGok1XJlgG0R7Yaaa3seBkgcWGSQ/azxjGPtVJBnhsueVW9xBM0N/ED3n+4pMFn+9dbT6zbmHt33AFp0/blPcTxy7yWfa0v3snb5xstjk3bqc8k1AG2cWQw5gr/p8qvJfIFKe51kV7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790311766; c=relaxed/simple;
	bh=Sw50ybQz8s9syiHD7m+se5DHakcc1EVB0zADgnHwXUg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=l3HTaEB6ccg820+XRSO0YB38xq7yOJyuqOw7StOBhpTSLl00UskNFSnNEKXgJbTOVxt5WUEjub6LSUISk9sT5cfxslRHkYANKLq/UgGBkIjOLzl3FuADDIMWIlAX+V0UjfpvZAt2Vyj5vunTLLutyaNmN+ulIq60tF0fEFU38W8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BP8fDhGH; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BP8fDhGH"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-396ccafb752so297111a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 21:49:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790311764; x=1790916564; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5tULBCWFB/U0caaVPBQD4RzyLkFgB8apGNGUQ7Hv3hk=;
        b=BP8fDhGHtfva+EisZlk9FJ+Wc8gLVmk9yrAxL493rhPThKyDAJNcAZgBEP7bGydMDc
         LxyEXAZAKgPaW6d32sV/ajR51wEE4uGD8uDC65u3gdZhqRVuiZc3lv1mwFObEXso+dOD
         CFI9ArNSDsy/aXA8pCJjzJX0AmzYvB7HADiBjXa+a45b4gscr38PgbltljCDRkW0wWhB
         QzpSO0dkIWBt/li4RCeRmKsJzS3mm/bKgVfpLAgT1e687dcgoXZx8CO1T45mc4VQtPvp
         wjpAkYpm9wIa0Ym/sMYByXHo/8UI6ktku0hc24Bu1ab+pwUdzQZHr8cdedCRQSgLmik3
         UdHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790311764; x=1790916564;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5tULBCWFB/U0caaVPBQD4RzyLkFgB8apGNGUQ7Hv3hk=;
        b=SnrPEm78dBUFCTHZyDKnRQU5GXg6Pg1Bn6Cvsl4HBEPVikUWGdzam8/xFeWgRDOhV5
         +f6C4KgdSO7F8Os9xnGv4qyr6Ic+aGOO5JPY2DkSAZMzo1WgCQBOXiV9RuaC1AJbi25i
         SpMr77IeoFP2ZMpec/dBOfDeK/MrDdbB/Tausc4CgdkW0slHSo2K36srEnYbrTRyAF+D
         nhuOojGs6PZGSMSaBTxT6XbB4p3ush+dsKsQ8bQpukUkCuKUyo9QbzLoqXv0WEec365F
         OZ9rNE+CeZMIYFQmQ0Cq4Lozn2rR6nk8CHJpe8RpScxJBbySR5LQLlr8aDOi2CgbnGS7
         vKjQ==
X-Forwarded-Encrypted: i=1; AKwUvByIkdwBvvKgFPYBxQzT+iy0LDfzKJIkKj+dj4HVo93guHQBvsFy+ZyamH2+LBF/P75eRTMc82T31IHWw00=@vger.kernel.org
X-Gm-Message-State: AFuF++mraA7mkxQnTAq3pqt52MCYWdyQt9AkINRcvl9l1s5k14ceLHw/
	nSpL3bLAw513J0XRX3SoeTUmXWb5/xMzHq8RwpZSDwdiSpsNQAK+dlx6
X-Gm-Gg: AYBFou0/yUBleGw52w0ErefSAmb6DIaFLeASUGbVmX/rBN+u+eK87O4yJ5HIAOWiP/z
	DYM3Typ43/sZEquwjgLbwM9qTIU9bnYKekmIrag/pfYs3BOwwJM0QCCpBKq/hyzd0lhUAhodTHw
	sTaDAb7Iy7a0NHaMw/YNBLw5rSj/Y/80g6IOPW885AjTut5n9L9GALdvd1gE8vYnL8rB62LE5wK
	MLJEx3KRq93XawIuh5/CuDJrnIsr1r9sADCEBEbKLmkcCpUf4G8Xxoxeov8H6gbUyEBNgZhXko8
	a58lHsVcd3WispS5IVUN7c9L+1TIMhRmlTGE5dVzEs5n5Bb50btBUsauiWDcFCRswTQgOLvcOSC
	qXaBEPXv4WNiBuilCDgFb2+YDW4yNP25bkPAibsegwQrfEXRvxBlSJ8IAx/yUsrEUEUYB5KZNc+
	mtBVGXh2T89Z7I63clCyGZIJGB6NWjWP50PvK9PzNyn2Z9LRxTRNkf0MXBR1WYkuhqnVDMaHpnj
	VnFKeXWYfHNNCfoadUsK6SsOVWJlTWeQcrKzg0v3DJYA2Rix0UCrHpeQK7/Hp81n1nPxbYTlbBT
	fHiknm5TELYlKQ==
X-Received: by 2002:a17:90b:3c4f:b0:39e:6c69:7775 with SMTP id 98e67ed59e1d1-3a09898525fmr4416407a91.30.1790311764283;
        Thu, 24 Sep 2026 21:49:24 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0976cacbesm8151528a91.13.2026.09.24.21.49.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 21:49:23 -0700 (PDT)
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
Subject: [PATCH 00/14] ASoC: mediatek: mt8195: Fix clock error handling
Date: Fri, 25 Sep 2026 11:48:54 +0700
Message-ID: <20260925044908.450775-1-phucduc.bui@gmail.com>
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

 sound/soc/mediatek/mt8195/mt8195-afe-clk.c  | 69 ++++++++++----
 sound/soc/mediatek/mt8195/mt8195-afe-pcm.c  | 98 ++++++++++++++------
 sound/soc/mediatek/mt8195/mt8195-dai-adda.c |  3 +-
 sound/soc/mediatek/mt8195/mt8195-dai-etdm.c | 99 +++++++++++++++------
 4 files changed, 196 insertions(+), 73 deletions(-)

-- 
2.43.0

