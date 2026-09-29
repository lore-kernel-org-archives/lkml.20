Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF2C1401A25
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 06:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790662347; cv=none; b=jH0bJCjepKzvoCcmYmRRDPqYGFHGytz6K3/SvMGcF6gi9UARPpaZvKa1+UnyZbAH+rtVWZKgmivVwwjJGodavQSPj5M4ROi2Q60AG+/gvRTpNfSJbZQweRf75R58G4O3Mo0o3k1PGK4DSH9M83ye56o4iSYr1Q9xDs1IYoCt7vU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790662347; c=relaxed/simple;
	bh=v46sc255Ln1PXrxBKjqQwkinEYifo4ikFZ46vupgL1c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cqpeOTKB1Hi4AwC/PD9GV6uh4RnbHjwOJOyuQ0dZ3z59/bgGrdQ+XxNqfCtgkdESEKjnU9dxMh4PYzkbjEc3ZmD99tuhZtSLSE7GImOKnrMjSckIBTWvfbEYowK1/KoE9/rAQC0g84p4SnCxybrCkmEUP84lTyiiHryoL1gYPKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dUyP+mcc; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dUyP+mcc"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d8fbef5018so25568235ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 23:12:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790662345; x=1791267145; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6VPftEpiZ5xyFAyML7rbLAWxXnWGIHElQ2g4AnTk/zY=;
        b=dUyP+mcc/5TqVUHzWyzVKt3pgqRoGTsw2QkVX5QiIDwmwkDYvO/xmCd8V8Cv7T5wgv
         JkQw4AL6GL4KefWEVDqfm8Htv7qYn0/ilg0qLvxomXmsA2pQyosGip3UtK3HmttEuwN6
         Rjaxnm6lPWGWoJWQkVTGr6EX2vH2Toy3vEsual5z6O5VEF8dDKMNf5B+91c1iCf51Fi/
         q1BH66yFljIqctSkO+zei/j+V0kgop3Ita11aOve7im8d3zg22vd+a0FkRdGUAZX+erL
         sBo4jXLKu6EBnCgXmtvtDSFZR2hUyNGEIAFEY9+rMEptLAGchc3LU8jYdku7QFasTGcj
         9/3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790662345; x=1791267145;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6VPftEpiZ5xyFAyML7rbLAWxXnWGIHElQ2g4AnTk/zY=;
        b=NCvH109nQr7RaR7yvzTyMI5yW/ZoHPMzzFWcWtd20+9s3Mr9QKwLNMArvAHg4VEkCh
         d56dvp230DexqR2Mmjjik0YsG/+RSoMVoF8I+tv3J9gTz9J72lgYp5j7ny+yvnA2Bqw8
         J8t4LjG2J/5hL5FOr4+ffpiY5MsSxeZJJM0j8kXXTIMGX4W0gGzk9JbLp8hhAJ4iBscX
         TwWs3PytrjsVBt5nXSQDMEYISD732atQVedhCD+C9VO0mmo4lNdQ/7VoBJnb85lLRVQJ
         bjzGd0RdBWfWHFFfE68MjuAl9K7sxBsBt+RIO6pVbyZxTJv+3Pe3fy8IQW7KMViRoeHG
         xZ2A==
X-Forwarded-Encrypted: i=1; AKwUvBzBLZbfhQ5tXTcfBme5R+NEQlEcAn2D1iGSAh1PcNpnLouj6rb0VKDjBnYk5S06Rj0gVc7xE29gWAOTTCc=@vger.kernel.org
X-Gm-Message-State: AFq9FYLkY+gHRxmTQL2hTsSU4PQ563Mpbc8rxAAeOc4CFYC5wj1ykdNU
	dSjAzEtwIxxoJy358fmj5XlJ8NSfe3+RfObA4YJWlVxL5yA2TZl/60FL
X-Gm-Gg: AYBFou1lXTFkMAYzoEeW4wQfFyAWUQbfSOzUqIzqun6b4gzrNjgRvq/ThmzWOkik1ya
	wbAWpcy5Komo2/gOGEan4rcMPVSJl5NNubanZ1OCkfrc9LzMICWuVXv5Yu2iI5W+mUhRTJhcXRi
	sqsgiLg2Xeo9ikmkT9BeMEx2FiGY2ohQ5vHA4PYT+6YSbcV6YJqlgdrL7mWjbYpsn2Uwc/HXyFx
	X7h/nsuj9LFfeoJsOc99hN/MTKgxuRJuHdlNBlnGgEZvuM+3lU1UCuM9uoF09OwgTsBp++rE1xq
	pWX0DLAfscsZw8SO8XrqLqxO/AhHNNAvupznq6NwPf8zA1ofIiYd/S6tOPzeY4fD2MUVkHH9DBU
	oLy5huCqaeU0oyfr1XODeFjc79QQ82c6zK9smAc2cBlYCR899B4PmvcQZQ5FruUZweRHIDJjK3T
	UiZj/R9Yafu+mQkr7XqnyiWX/lDSKI334nGPOJY4d4iusMc0gXX/14gZPvYS1Q37RxYcx3YSHtQ
	CXIk2uGcXvET/yrQbWWNTbuBDIOQZi/p5xtoLMAOOgSucv6VU5l//9SwaqFichd3HRRxoq28ehq
	aj9+XP9sIeXQpA==
X-Received: by 2002:a17:90a:bc9:b0:3a0:a515:c47d with SMTP id 98e67ed59e1d1-3a0a515c8f3mr8329776a91.34.1790662345126;
        Mon, 28 Sep 2026 23:12:25 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a498726d63sm3280965a91.17.2026.09.28.23.12.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 23:12:24 -0700 (PDT)
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
Subject: [PATCH 06/10] ASoC: mediatek: mt8196: use dev_err_probe() in mt8196_init_clock()
Date: Tue, 29 Sep 2026 13:11:17 +0700
Message-ID: <20260929061121.124001-7-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260929061121.124001-1-phucduc.bui@gmail.com>
References: <20260929061121.124001-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Use dev_err_probe() when obtaining clocks to avoid redundant error
messages, particularly for probe deferral.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8196/mt8196-afe-clk.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/sound/soc/mediatek/mt8196/mt8196-afe-clk.c b/sound/soc/mediatek/mt8196/mt8196-afe-clk.c
index dbfd02d20338..91a05ea6b8b6 100644
--- a/sound/soc/mediatek/mt8196/mt8196-afe-clk.c
+++ b/sound/soc/mediatek/mt8196/mt8196-afe-clk.c
@@ -618,10 +618,9 @@ int mt8196_init_clock(struct mtk_base_afe *afe)
 
 	for (i = 0; i < MT8196_CLK_NUM; i++) {
 		afe_priv->clk[i] = devm_clk_get(afe->dev, aud_clks[i]);
-		if (IS_ERR(afe_priv->clk[i])) {
-			dev_err(afe->dev, "devm_clk_get %s fail\n", aud_clks[i]);
-			return PTR_ERR(afe_priv->clk[i]);
-		}
+		if (IS_ERR(afe_priv->clk[i]))
+			return dev_err_probe(afe->dev, PTR_ERR(afe_priv->clk[i]),
+					     "failed to get clock %s\n", aud_clks[i]);
 	}
 
 	return 0;
-- 
2.43.0

