Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96E6F3DDAED
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 06:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790662305; cv=none; b=qm1i6bc+nOi3J3Lka8056scQob0NnzcsxfftozBI40abrN1haaklcmcW7Ms2rDEZDgdfVLkFb8SSTUJ3vAhGudesx7bcWtwIQrgRpbnRp7weWPKza60O/fomaBXZivKuI8duN0lKBUv3CeZTjqEpXDJQ35ePizXpqTiqi0iQ6Po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790662305; c=relaxed/simple;
	bh=RGYHV4Zn+Dn9B6A5MIGzROsX1KFS/3JS0nwwmfoW1QU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qGLYXFSmiY2Ji4+EGBKxnBAlKHh+4DAn4snn8sAmfC8Xu10JAFkMcXLPwKxkb9d4YcD/oJIp7Nw8tO0flC9pDjwlk+4CAJilfTXxWLp/OIK2ogaqTjrinuThkJInpqCQmXb8P4txn0/ZF0UdMlmlapUmlh6RJI1uxV3fABImCSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T563v5G/; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T563v5G/"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc4c08393b0so1592749a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 23:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790662304; x=1791267104; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lCOnM4BG9opzc/4UWmCexloGpdYaWaFpKWwedqDPapw=;
        b=T563v5G/+tAaVEfGh2VX/G9105H9pOYX0V82dmVdyagksFWtz2gSfWAxetGcMXU3kJ
         QaoBVom/gGl1pNDBSNa/YArshE9r6rODvOm6pb9DxNG6o/CVBB1LTXkeUmbRYf0yT7j7
         abID53wwP5UG15AzswoufaBt2/c3t6kGHsaA0R583ODi7lKM/IhXZMS+6p3A55s1VrfG
         IgdzyF+wkruRmblWXGF2yrV7wmqySdinMV1noPUAAPQRODfnCk2tOIjt4SFrY0gR173g
         5+EfWaf9EM2MB8h9X5GR1XMfiVunlhIS6FSmXYDYWR6OfrLyCBJhCxRykJbOqWe93N/a
         BAdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790662304; x=1791267104;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lCOnM4BG9opzc/4UWmCexloGpdYaWaFpKWwedqDPapw=;
        b=160QhdtpIRN4CrlTbFnne3vbj7x+1l0UkbFzSHVU8vVIEQoUADF2zqcewdTjySKzwB
         LA7lvUhi1921fhtJZbgWy4q4g4afzOrdIBqJgh0gkr8asazsDiThoFFvN3/Js0OHePdZ
         qEScr5RInNUPeCdri6kz2OAbevyRpFdCICCOH5LBQnnwSES83OvxTjNO+0kjVzxx7fOK
         yi4WYVlylRVny4xpLOyJSq7pMiEgWrVoKCOXqDUy32bragXwm4ObTfHaNiU3INK8mP6R
         EUxhsqtYx/kopsrVjoTGED5Ce1IdtA+zE5Ai7tvOEmBjYgPUfqCtM1ibys9S40xx8JF/
         uF7w==
X-Forwarded-Encrypted: i=1; AKwUvBzN+UxHgbEyM/PxzhxZDy5pzWXGfPhZxkcG6motoQMZ/qS2Nv1qpSsC+Exv9tZtNHq9wp/LU4Vu3qb1v+o=@vger.kernel.org
X-Gm-Message-State: AFq9FYKP7val17Bu6CEE2BZPeszvxpfgpF8XZIwREjCy3ERa9MJfuOh0
	6iHFYiRxtu4M1xzI6A4bF/wdwhRK2Xxms2IARkn0QL80iIviF9JiiqTV
X-Gm-Gg: AYBFou0wltSQ9HQBvCXPmt1lrBQES5guqCNTN/dN2J5YE2P3N0nlZFpX1Z8AJuQCPwa
	RUkdGIk8wauOmkxmn/35l149J/Sj9FZu2aHdHFsd1SDcovl6T2D3TeNGxt3XE1Z0pwcKzKYpKWa
	IsG1PaKCryHly4GVHuc0zQ5fTpkx7M0y8PU5tBWfNvazeSa1VHCcGsxZly3Y+mCrSiowJ1sZ93x
	ax3kKDXrpW5R1oIK/JR+vAYFGvogGk44yb3Mp8mMA6FUPnzAA1mbR87j1AvtdWSISsOzgTK0e2Q
	TtraruageLGdjuN9wH16giM2RIgqtjM1twJb29fnKPXDf8FVgVj17Y9JdyEiFprbTV62k3EJtj4
	tpQhL2pOGYkolVZrag9QMjSnMYVRc7g7qXm8cngMkU/7hycEdPRmwieCkgNZQtXU+hay5kAUdcs
	YXlOA8pHDyUjw6dDaFGbJx5Me1gqBsjqg4WFVNHcPqNfChJ+sFHaX0yE15MQaLL1e0XEvWFUUcv
	QrHU07PlSP+qlYN9vOpSzUvz/hnH4hC0AG6UShNj6Wg2xYisLxDqdrMeL+XuyGJlMdTI5aWiYYl
	O/N2tEOO1FVDyQ==
X-Received: by 2002:a17:90b:4c4f:b0:3a0:bf0a:c9da with SMTP id 98e67ed59e1d1-3a0bf0ad1cbmr11373686a91.47.1790662303866;
        Mon, 28 Sep 2026 23:11:43 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a498726d63sm3280965a91.17.2026.09.28.23.11.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 23:11:42 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Darren Ye <darren.ye@mediatek.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	cassiogabrielcontato@gmail.com,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Cyril Chao <Cyril.Chao@mediatek.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 00/10] ASoC: mediatek: mt8196: Fix clock error handling
Date: Tue, 29 Sep 2026 13:11:11 +0700
Message-ID: <20260929061121.124001-1-phucduc.bui@gmail.com>
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

This series improves error handling in the MT8196 ASoC driver,
mainly by checking and propagating errors from clock operations.

Compile-tested only.

Best regards,
Phuc

bui duc phuc (10):
  ASoC: mediatek: mt8196: fix APLL mux error handling
  ASoC: mediatek: mt8196: fix APLL enable error handling
  ASoC: mediatek: mt8196: fix MCK error handling
  ASoC: mediatek: mt8196: fix register access clock error handling
  ASoC: mediatek: mt8196: propagate main clock errors
  ASoC: mediatek: mt8196: use dev_err_probe() in mt8196_init_clock()
  ASoC: mediatek: mt8196: fix runtime resume error handling
  ASoC: mediatek: mt8196: remove redundant error message
  ASoC: mediatek: mt8196: propagate I2S clock errors
  ASoC: mediatek: mt8196: propagate TDM clock errors

 sound/soc/mediatek/mt8196/mt8196-afe-clk.c | 145 ++++++++++++++-------
 sound/soc/mediatek/mt8196/mt8196-afe-pcm.c |  28 ++--
 sound/soc/mediatek/mt8196/mt8196-dai-i2s.c |  17 ++-
 sound/soc/mediatek/mt8196/mt8196-dai-tdm.c |  16 ++-
 4 files changed, 136 insertions(+), 70 deletions(-)

-- 
2.43.0

