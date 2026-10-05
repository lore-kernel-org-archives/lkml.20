Received: from mail-pz2-f38.google.com (mail-pz2-f38.google.com [74.125.228.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 353A447DF97
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 11:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.38
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791198225; cv=none; b=I14dW5w6+I646ntwQf9aVNPhr9icZB+M8khcoWxGJ9ik1Kyf7K2k+ePd6FsixQf9MyflA2DlzKAY4ZZtoqNy9NJXeX9OzuFYLf17ROYUzhNITOlyrJciTRRNYnZQaoobfU73nopM5jYbB/UrCK2tJ6r0kANTHI39MIXPoBOVAGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791198225; c=relaxed/simple;
	bh=pxSpe0O1bS0J5JevJ1izQfRCUVeBTwQvQAquRw81NNk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lNtg8zfNJ48mzs7/a6SSZbIBvE7PR+4jIOJTjb47ezuXPxRzGeMYzUwR6TMMV9U/lfjW7HFd3Jdaiz+o7eVSR8Y2NJNRZ/35ia7MOBMPpSI1qJZf7U1B3BL5N3UC4ILuVf5Av5ClZfzV2aaNeaKUd6sBPesmcJFxripIXxdADx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rs3qFceA; arc=none smtp.client-ip=74.125.228.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rs3qFceA"
Received: by mail-pz2-f38.google.com with SMTP id d2e1a72fcca58-883a16b758dso238493b3a.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 04:03:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791198223; x=1791803023; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wrzhrSiREEi518WgYUmB9rjEq8Ct4ueH+v9/vpcq6jQ=;
        b=Rs3qFceAImpWqXBdNxXEdnTAAXc1B06L0E/PvrNm6GBuORfPyvAvsCIjlYnuR2Bz0y
         piG58+yNbVgIDpl8GNC88+GJgyXgS5cyywT4A/48omrNT9UrAFlomrMa3gRpR2xzHIUo
         Ff7tUOhzmwdOa7kVtvwggp5RokJAQLalxMNfiOBwTs+ESHfNRP+lcxq6/GE7Q/S926Cr
         gMceZkS7Rc58d4fdhHpOnzJAuLfwP8hWaRAEs9qBemqVJJmtSrTOOikz857BySRGgZ95
         UeWkJJFcqlIfN6m+E2/M8dJyRrbFuT0yhUkZ2h1n0f4fnfJKzFA4d2gXQ8lHpEO3nsxA
         cD2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791198223; x=1791803023;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wrzhrSiREEi518WgYUmB9rjEq8Ct4ueH+v9/vpcq6jQ=;
        b=cx6TIOqK0cVJvIbAPE9gi+CrhAsCPRY141oWy1Kk101UP1TROsw2KCSF5roaZQnFJK
         OXF+VA9sPeSSJR70hg7MZoCzKNph1EYpu7S0YMhuy+lpgamiM0Psy5iZHnQPdj2Dw5qo
         1hO+MRQQW6kKBDNZCuIe98iowio1fx6oaJedyJs4GS85+3dZxMgCwjPcq0rZ8XvuqRuk
         3GhyHhTd960nzb+P7NPADONMLK3r2Fx7u3jy4h7Q6F7iO3PujszU1sLIliUEm9lOGZMq
         WU7UbyAzGIoD11twh8BJYXmcNVkZssN9Ukz37bDj3KGMUTlzTb7vP7ui8RYINZ4SBa9T
         2q3A==
X-Forwarded-Encrypted: i=1; AKwUvBybS5zOtyOLuj8uaBcGGTJJQmKaMuva8K+FI0GjXRgjV5l6SzZBg9tg5et91pp/ZfBD7ZcI3oFnsq58hzo=@vger.kernel.org
X-Gm-Message-State: AFuF++nXy27DyINF4kUuV9TWfa9zg3ajOn8f/g0OkvCT4RYfvQ5mBwiC
	3hWfDxT4/aYa0IQNjFddsiH8YFGjoWYPNf96F4l+HjHWE4Ty3+VQSOut
X-Gm-Gg: AYBFou1YcB1HPATChwSG2HLGkZAZUE2xI8zyiuIm6WOVZFWL2WsqQdIcAIBOXqEWqvA
	sjaofbnpbdTbPwdJAED0ECaONRRDs4zkRqkT8CLTCWmgzamYdWy+Nh/EYZo04uwHHpCyIzY86lN
	KnITyFdPfyzBjZ2HHDVBC/boehbZkWPx43wGlF50aexRkOgKtScgXMNpupJLNcRsNjA5WY9IJbi
	BtuwGNqNL9IarfiLmUi2KWfW8b92IHswmE4/yR34retgVDJdnhz+ubKiAX7k1FAAaMAbad/H7Yx
	xbxW+DXAOQjDQRmB/MjtIOwZqR0zp7EFpuOJatnjSTimOM8kIgX/auH3w/UNtLkRvuACcZgz2nm
	hOvTwuITBFsuEM8Efc8M0pTmRK3C3kH1JMZBepngxkIQmyhSsjkm1qBHcsZ6ZZQBIoNoVG3gvN6
	II8zYkhQS94tfVR8nArT/PsHXheJdY/69cj6sdE5Ee+twP9VktAyly14JTH2N/45JB2zwWT5VPh
	TIH887h3sMQrw9ve8+7tYGHdCLr/0bXgx1VDeOZDtXP6PKjw3c1Fz4GND4sn0Apc72ioOnxVJRo
	yylr/Mg7Zy9rDg==
X-Received: by 2002:a05:6a21:4ea9:b0:3de:60e0:5ca5 with SMTP id adf61e73a8af0-3e0bcfe8b19mr7326452637.9.1791198223408;
        Mon, 05 Oct 2026 04:03:43 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cce6d334de5sm626498a12.11.2026.10.05.04.03.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 04:03:42 -0700 (PDT)
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
Subject: [PATCH v2 06/14] ASoC: mediatek: mt8195: Fix FE startup error handling
Date: Mon,  5 Oct 2026 18:02:49 +0700
Message-ID: <20261005110257.50145-7-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261005110257.50145-1-phucduc.bui@gmail.com>
References: <20261005110257.50145-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Check and propagate errors from paired memif clock preparation and
PCM hardware constraints during FE startup.

Unprepare the paired memif clocks and shut down the FE when a later
startup step fails to avoid leaving resources enabled on error.

Fixes: 6746cc858259 ("ASoC: mediatek: mt8195: add platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v2:
 - Check for negative return from mtk_afe_fe_startup().

 sound/soc/mediatek/mt8195/mt8195-afe-pcm.c | 44 ++++++++++++++--------
 1 file changed, 29 insertions(+), 15 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
index 1d3e01e2c3e7..02736949ae6a 100644
--- a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
+++ b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
@@ -364,24 +364,38 @@ static int mt8195_afe_fe_startup(struct snd_pcm_substream *substream,
 	int id = snd_soc_rtd_to_cpu(rtd, 0)->id;
 	int ret = 0;
 
-	mt8195_afe_paired_memif_clk_prepare(substream, dai, 1);
+	ret = mt8195_afe_paired_memif_clk_prepare(substream, dai, 1);
+	if (ret)
+		return ret;
 
 	ret = mtk_afe_fe_startup(substream, dai);
-
-	snd_pcm_hw_constraint_step(runtime, 0,
-				   SNDRV_PCM_HW_PARAM_BUFFER_BYTES,
-				   MT8195_MEMIF_BUFFER_BYTES_ALIGN);
-
-	if (id != MT8195_AFE_MEMIF_DL7)
-		goto out;
-
-	ret = snd_pcm_hw_constraint_minmax(runtime,
-					   SNDRV_PCM_HW_PARAM_PERIOD_SIZE,
-					   1,
-					   MT8195_MEMIF_DL7_MAX_PERIOD_SIZE);
 	if (ret < 0)
-		dev_dbg(afe->dev, "hw_constraint_minmax failed\n");
-out:
+		goto err_clk_unprepare;
+
+	ret = snd_pcm_hw_constraint_step(runtime, 0,
+					 SNDRV_PCM_HW_PARAM_BUFFER_BYTES,
+					 MT8195_MEMIF_BUFFER_BYTES_ALIGN);
+	if (ret)
+		goto err_fe_shutdow;
+
+	if (id == MT8195_AFE_MEMIF_DL7) {
+		ret = snd_pcm_hw_constraint_minmax(runtime,
+						   SNDRV_PCM_HW_PARAM_PERIOD_SIZE,
+						   1,
+						   MT8195_MEMIF_DL7_MAX_PERIOD_SIZE);
+		if (ret < 0) {
+			dev_dbg(afe->dev, "hw_constraint_minmax failed\n");
+			goto err_fe_shutdow;
+		}
+	}
+
+	return 0;
+
+err_fe_shutdow:
+	mtk_afe_fe_shutdown(substream, dai);
+err_clk_unprepare:
+	mt8195_afe_paired_memif_clk_prepare(substream, dai, 0);
+
 	return ret;
 }
 
-- 
2.43.0

