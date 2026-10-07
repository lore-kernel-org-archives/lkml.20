Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 060CB45518D
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 11:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791371391; cv=none; b=L8R4WbUq0wwkqezcLaor4A9yjwoOdZihY01leXU7Kxp7SkRD9HXfCMgootUOEd/ai1J/re9t0aVYujjsO5LgY6Fw0LXy98Bn/8Hq5HuxnjfGiTEpwXVSqFFp1J4/p0BNVKuEZpBiFN8kZeTA9whJb0YhLQFZzC765k06nNB1HpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791371391; c=relaxed/simple;
	bh=DDkxtMw6JmqKFj9+PZ/xfRX82i+leYlJ/h0hjEWNucw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZiMA3Qup8b5KqvUzJudgp3OPEd3MAxZpvT7p6dfiotP8uc6KmLd4ntANPTxcMkf5XYHEkMzQfg1dTVBR2P2E338x26H7SaYyUwDSFydt0uKEbkICx6UQ0bYyO++QwD0EB2/3XPdZuOxu9GhGsgJjPotM3e2A3mN+YKdKPY9cUc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R9S9h0g/; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R9S9h0g/"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3a80d1c98f5so2172231a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 04:09:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791371373; x=1791976173; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5tPW28u/y25LsoprSZgjrTYuNMeOHBtCHRS1PxOld3s=;
        b=R9S9h0g/q05eOsWn3UGfc8J/NJZgpBe7SmzEejbTjIdbg1/5Bx8TPmnIxRnEa5mDpv
         lqe/1/D0u4mum++JtQCe7YB6K7Kcn11nveOfmPNpOw75jELc+n/UCti0S4EHg6I+NRuF
         9LowRRHSMLNglrCSPo9XJuu6yQQEWIzEvqVqLfDQOsQDgyHaHARpyOJ+dEND3qLbjGBx
         V++9nUytxr0TFpSslTn8FR1J019pB47K/G5xc8A0VG5Zio4FvEhGOZ3bw9+DA+6AuhEL
         HnHizaEEk63k0oMnwenaXG+lXOIOmLcOs0aGUTLodejpzyZzbW1kBoKPzXkDpgNZSjsH
         pG4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791371373; x=1791976173;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5tPW28u/y25LsoprSZgjrTYuNMeOHBtCHRS1PxOld3s=;
        b=KPyuHYjdzkcQmZv4CnpKhqOMKWWLvhzKrskfm5hgDkLTR0dY0DMb1Rw6DL3pkRGcwx
         W3p387Jjegb4ht+bMC+SV2eidQgt2htddrH91wOuEqwRXNXEdBJ/lm7rK9KVIFDHsuFx
         vexwub61Txj4fHYzqO64QqXWRWcHBdUd2GcZc4JDODJye8KFf7gt+O1qONXYtwE5AQS2
         Lqya9D8sRHSuP7FTYR9mZjUkAncH/prX4NaYRQD5F9iQasVL0a+VmdYGM1a7HnCywcvV
         rW2e+IElKdmaRb7795J9lqn4wHHTwGF/UOuwmTBpKBZZSsYYU8I9E7TcodMCH4JqP92y
         L7WQ==
X-Forwarded-Encrypted: i=1; AKwUvBzKxYOmUtcNrhgTVLq1Yhr+B3y25HAoVw/0ndE2O6qoRZ6jRgLn1vNRQFjHQGDt4FChGhdrNAz3t/DXQB4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKq1xQt5T6qVcT7O+tsoAvXaUky/G8U0kkHqcIRWWOgyLXLSLwo
	L8jUi26DbaH8p+NQfSiJfEqtglb4Ix5zBJxRXh2sYlKA89gXVYFKKo9v
X-Gm-Gg: AYBFou2HaIPa8/nb+tsKChMV2m3g73dWKXEEl7JvzY+lDVEBgr1oUe0UMSAmTkNCOBR
	UPJDT7gZFWV6gSRo68NQh8Hw1ACYLzIOQQ8U1XSPzFY6cQzQMRIYe2slcK37Kv/7yXx0HcElEIl
	Eo+p1iTDk7p35o7NEnp5IriB0Xd9XoATzl18xFyu2QgF3bkIKfPugXGa11ihah/9vFL6rBx5ysF
	+aNhyZRseHeT7lggLsyNeDVGxTyIBWxtnO456tPVT2gizYE1UNqCWcw6YhPd26WhR4hYEW4WqYb
	ol3SZM1UblF9ZBL1tCXdyBLTBHB4ym9P9dxNtSG0I3rUujpdARg8AbjRmTsZKvs1rdTSgvQueOn
	IgqvAZaJITOPiRrOAx0rH5f0QeqCPMZ+QkSbUShA/P220R8qXDOJMVJVcPN0CHnAR3p48jbyvIu
	Mz6WB2tkmjhFdGUkyBpphHrj5pIv20n/Jx3CSYvGGRxMTREUllUXuHiC8utE711eVe8tm9mPd+x
	6wHnqVMAt3jeBO9x0NhBMQLzhvAMqY24u7nOYM5sIp5dtE6iZYuYwtEWd9hIVkRCwyCx7mlc73E
	ZSyBARYm+XE/GQ==
X-Received: by 2002:a17:90b:2246:b0:3a7:aeb4:e6eb with SMTP id 98e67ed59e1d1-3a8a1ceeb73mr1617868a91.67.1791371373155;
        Wed, 07 Oct 2026 04:09:33 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a8a5ec70dbsm1328745a91.2.2026.10.07.04.09.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 04:09:32 -0700 (PDT)
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
Subject: [PATCH v2 0/4] ASoC: mediatek: Handle constraint return value in FE startup
Date: Wed,  7 Oct 2026 18:08:54 +0700
Message-ID: <20261007110858.509341-1-phucduc.bui@gmail.com>
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

Some FE startup callbacks may return a positive value from constraint 
helpers, but ASoC expects 0 on success. This can cause .shutdown() to be 
skipped during rollback.

Return 0 explicitly on success.

Compile-tested only.

Changes in v2:
 - Rename the patch subject.
 - Simplify the code change as suggested by Cezary. 

Best regards,
Phuc

bui duc phuc (4):
  ASoC: mediatek: common: Handle constraint return value in FE startup
  ASoC: mediatek: mt8188: Handle constraint return value in FE startup
  ASoC: mediatek: mt8189: Handle constraint return value in FE startup
  ASoC: mediatek: mt8365: Handle constraint return value in FE startup

 sound/soc/mediatek/common/mtk-afe-fe-dai.c | 8 +++++---
 sound/soc/mediatek/mt8188/mt8188-afe-pcm.c | 3 +++
 sound/soc/mediatek/mt8189/mt8189-afe-pcm.c | 8 +++++---
 sound/soc/mediatek/mt8365/mt8365-afe-pcm.c | 7 +++++--
 4 files changed, 18 insertions(+), 8 deletions(-)

-- 
2.43.0

