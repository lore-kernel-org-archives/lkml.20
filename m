Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66A1A4F85D4
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 11:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791977365; cv=none; b=K1P9fR+sRMVBINYZYs7dRKWJ44NDM/la6RnQC5Q2/4GMkRLk3aIY3DkMGCDG59DKKxbHdqK/+nwhc+NLyuATXmu1fuO7OV/aw2GdPMm2XWRDLWipaBE89DujGukz90LM/l1JJ1pH/J2tZQq2sDlUgcOJ7YS1Rre9zilRsRcvgok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791977365; c=relaxed/simple;
	bh=R4UFkq5kOPTIOMmo6a8SnQ0q/K5kV69GaDbNWQblX9g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mgMC5GSCsw60dPX8npAi7gzgGxxhDi+ZfAjaBMpnexIPHvoOEpqsPnkczpviF95Tz0mr5yCXGdfzUe3vHPCyQc8hj9b63LBpvKU+wipoNBrZDWlfSCI2xtUtwjpQ763D1ici2GHlewEoi/vxOqNI1Qh+ZHnh0wmSu1TzzWHGnt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H6Io2J0v; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H6Io2J0v"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3ac397836fbso1424052a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 04:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791977364; x=1792582164; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9Vtx/KxXQb9NzxJFggdtETIpVOQq4JhRN6ab5MTU7oE=;
        b=H6Io2J0vnNLUzmx8Rlgl5qvPW1wQ4ZDpO1mDGFV5g+WA7WGw+kJ/U1Ar0sgw9fCy3w
         tmSifvqjpOoBnKGYQO1CATKnsqvK9ENCSz2m3AZvNVm47No08CubbHJoV1HJw/vs/67P
         k/XpIxdX+3jm1n4RMQygRos8bWXVsrGEv13twQeznrnLGldbclTHDEHNZYYeu/9nB6gB
         r0Rfv+ldFCbEMIvp8lP3/Vq299BomB1zw5TruAaFQ3DezYUMBq4p/2cUFAJzn5cU6HeV
         LKCC4cD/I7g0FJ3bzfJUDBIYmmj5J3et7JO5EhYS0AmGEBRohRCECiac7EcRUE9AEgn6
         Jjug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791977364; x=1792582164;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9Vtx/KxXQb9NzxJFggdtETIpVOQq4JhRN6ab5MTU7oE=;
        b=jiIUfs7k+aS8CmMkI2wvconqItOSTgBRAi5Nk0jGQZEn4ojyLSiOKtjTeSKWxRLy6X
         J+31SD6k/eblCAeUbG0HBhS4//OhOMxGxC8gwMNsPGJcaZag4BcvhF7bbIT95OgsOU7n
         lAmoX8NjblfU3bZlgJ7K47GlUd9+RIt03HI7S6ACkd7OAn8YMynPOy0tPO/SRbJAkcsw
         s7wjpFRnhJMtbrnS+mVI/BijPPoOxF/PB0G4JZnnKkBkPPiEKwmI2OBbaE/HwSQetZuo
         bOnR34/lSxUWqUA/Z2VX2DI7b2xqh1YnTG4yk0/EX+V8/C+SADHi7tRheiwCAb7NbtDL
         jGeQ==
X-Forwarded-Encrypted: i=1; AKwUvByfrcHqW2Ng5qSaTMBsgMp7B42RQdfeb68hlXQUv2n65pKzrnBYkEb49cPs5mMXqCr9YlSSy/Oie9ZZ+c4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKAl6rmpGtK9oFbSQjOxq/LaVe4PmJLsAtAerVVaQJqupWzhslp
	evLeClzbljaIqw8xQ0hnkocZ2Mwu9L+C9hCY34mlSEaIbTq1/AJQJddp
X-Gm-Gg: AYBFou1lbheN66MAwBuQH9FEGvYmAhGySGOZERfWx6e/aWWc7bTZZRZ7EKdiAEvfia3
	iJePnHKsE60T7gLMX+oFg7n3YhTgyf2xenhSgW6pfJgiJrsgfgHyh2XVItUvwpSAZ76lWCTAnxf
	kgA0myDocQ9KIao54DuXHeJv+gtHXRfgKV+IJjY7v0zBPtdusbc7ueh5zZhiZtoX6pGhwh4sPw1
	wMnK/ulL0ZH38AD5gJCvbxeBfeoRkh+2cWaA2TNpE4ByQN+0cx2YU21HCjxPrKijqmZ7USCyw9R
	CWonVQqVRUqzS4/4uN0oar7I5C+C8WtsDT5HmPULIySGh0ukZSzOV3HbPn3LGqtDOD6PnLPh7hC
	N8gkiCWzB/MpvgjRGcFauAbrKhR+5LJJPdglkuqkZ9FfGz/kM/rAlCm5vODtgfybCnMtalbLKOI
	oxwK1F6+PDnndNTslU7KWrEVerbtpTEJatWC2nsoc5T99qK0tmZ7MwHwbHdIz13RA17cHN7v1Ks
	W2HBu0VY2Hean/Y+7I7GnTsbDHxIhFmFgn05ksw5GYIBLFoUamMgtaC8DGFfKxweMMLtyDBHpMF
	fVssyBP1WcCl3Q==
X-Received: by 2002:a17:90b:524f:b0:3a8:c0cd:57f8 with SMTP id 98e67ed59e1d1-3ab3a239c2fmr12156626a91.4.1791977363541;
        Wed, 14 Oct 2026 04:29:23 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac61171feesm4077076a91.17.2026.10.14.04.29.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 04:29:23 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Trevor Wu <trevor.wu@mediatek.com>,
	Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
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
Subject: [PATCH v3 12/16] ASoC: mediatek: mt8195: Fix ETDM MCLK error handling
Date: Wed, 14 Oct 2026 18:27:47 +0700
Message-ID: <20261014112752.683032-13-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261014112752.683032-1-phucduc.bui@gmail.com>
References: <20261014112752.683032-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Propagate errors from mt8195_afe_enable_clk() when enabling the
ETDM MCLK instead of always returning success.

This allows callers to properly handle failures when enabling the
MCLK.

Fixes: 1de9a54acafb ("ASoC: mediatek: mt8195: support etdm in platform driver")
Reviewed-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8195/mt8195-dai-etdm.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c b/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
index 1a20adb2cbf5..fba51c552eec 100644
--- a/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
+++ b/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
@@ -1549,9 +1549,7 @@ static int mtk_dai_etdm_enable_mclk(struct mtk_base_afe *afe, int dai_id)
 	if (clkdiv_id < 0)
 		return -EINVAL;
 
-	mt8195_afe_enable_clk(afe, afe_priv->clk[clkdiv_id]);
-
-	return 0;
+	return mt8195_afe_enable_clk(afe, afe_priv->clk[clkdiv_id]);
 }
 
 static int mtk_dai_etdm_disable_mclk(struct mtk_base_afe *afe, int dai_id)
-- 
2.43.0

