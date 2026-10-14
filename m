Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5DED4F4CEB
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 11:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791977378; cv=none; b=jzCPYKmQyaUKFVjICGysOzGiR//5aTVhq06PHT8qpUw020CPbgzr9rH0O8REk1/maR7HAUAApM6bTYN/wBvTo0SJH0y2/aRf5N5kPn2bJ+L3kJw6ylWQmsU1P4IjrZ3jIj7+BkO9PSRTgXmo/iOCBsTKalLhumIJiCOFO09Oe0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791977378; c=relaxed/simple;
	bh=MMm6LoBTkeAomP+0/fA2vfNONTNnzG8MpauClEVrS+0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LbkJYYtPYdkHgbBldwe4UU0TlTIYPGfIZMRkNnqMzuPW6HY53Jf09VMu9Lr47yIQ6IDcLFbFMcSCcGIYyct4YjlquJGoChTLnscehNP0zcV1szubkQJlbS5p40WZKYhc89Dj/dxZpYwecrebCMhliXZq2MUmObSPnbCp7OEkZeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z9CNsucb; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z9CNsucb"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3ac77270fbfso256475a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 04:29:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791977375; x=1792582175; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pMNn1l9smvshEEs2IzaD7z/sVzU8/2Okzf/aYOfP2ok=;
        b=Z9CNsucbeWMyZjdrWIDKPcMHC/QD4tM/5tMr2fXlM1Yk8fME0IEVXyBBGs/i7wvdXG
         pHaEZ1xMCopo/1wn4uY3olacQbixo9K28ZCqAu/FjJIU5HgQLupVI3HHHBa7YUMznR5L
         FdO9Cf3UBo/anTYnydrxqCZYP4r1A3z6xUOoftIY83D/2gCIWIcIV9TzZchKJ8z6h5rB
         dGcNiN5esSz0/EfXk4FsYUSEMr86M4DaTgcSEtxdI7yv5VRb8z9WtNKjySxMc1Qqz6RZ
         pYVta2bCIFeaxoA7mGG9J2IsyDTgKoBqE22YfHhUWzJWiCxU1id+8//AKDQG8uj/uxZF
         1slg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791977375; x=1792582175;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pMNn1l9smvshEEs2IzaD7z/sVzU8/2Okzf/aYOfP2ok=;
        b=gHbsYnY5NQcYLx+O/92KVdKQ9GpkvhNnsKwI0IvE87uy+Nx2bCmd09AvlHfDP965km
         s0xYIx+fg3NXm/lY25Z+VlvA2xPpxZ1WdAmYkHk/liqEkD5FR/Rwt2RuseCc0thsOvuH
         zL5s+mTdBFtB3FSwmEngUTgcKLzrppaV2VD4xFBPe8TGRw+jVMZ2asJtz714maL/av4m
         mNJP24TZtRfO5Xe0QRiLL0VHAym+BYIoqYNBmWwqViLU++YTtXSj/cWuINMNw5z7W/1q
         IY2VNs5P9PEbjo+5/n0+V+f8csvIoQyT/x9sQiVM0m41VG/2y/YcFviMIKC7bFJ9JX9f
         WSuQ==
X-Forwarded-Encrypted: i=1; AKwUvBxty/mGSXYptV31uuKuqXJM2UyCBprpPTLwBt2h1DGjcD+Ke1BPfnPxy8M8R4V3YAU16W+Vi/DCxX6LzXw=@vger.kernel.org
X-Gm-Message-State: AFq9FYITchCgb/9Bp1Fd0SQAh7KrFqSjiAEoLKb14tDPA4PLAWkrhdGk
	tfh96L9ysy7MbDMMdRcvCXFWe2Fx0XV3OfNjgOOSbFIjoJbqKasswW+W
X-Gm-Gg: AYBFou3TyEoRMFTZ0UnoGHX9pYWfi3vBHdgkV9J+J1TfWKXW+pmWgmAJ2gPDMfucv72
	gddKbK0CViNlh9PN6wkSXCs4/JCUlZd/b6E2fMrDVzquhXU8Cv0NGInz2yQQMf0rfhN1OiILx+L
	N+BoMiX+BVih1PYfAWhwHoFO5QzlGDY74YqRRbIcNXeazT81/pNjviMd9e60qAkWX/c4ztS6Z1c
	kGrWcYULbfoLtB77tAM6ijGjCiMC6NWLm/Xy0UAgcQgCZA6zNA65wNlVab/TeipyFaMdKO/BWbr
	/zSA2vQPFa2zDjYBuPIXP+oZ7KyAWT112ZAEPkD+AGwW7sbslEv4Po9mYvKBGxy3Jc5yvzDhsDb
	Dy+55dqi+uxirOpkWQgi5+xg3ipg2amNF7EtJMcT7AX1Kob4+GPjDQT0C6iE5UHeXCsSs7otVFv
	eChLBX73bhdrFRr6do3ROTS08PR8kZQFSIgO+jFj9wSEAf9mcIA1pNl3M1CxzVCuGPjrjeVVn2z
	QL4EnsRKoMYv/6Hj0gXzuO8T8I+BCLaOWlq0PvBPtGQDpspyJen4d2+r2I2NM0XMgREkX1IHa07
	4fx/AgBL7euukw==
X-Received: by 2002:a17:90a:4ca2:b0:3ab:7031:d962 with SMTP id 98e67ed59e1d1-3ab70412990mr8076731a91.41.1791977375198;
        Wed, 14 Oct 2026 04:29:35 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac61171feesm4077076a91.17.2026.10.14.04.29.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 04:29:34 -0700 (PDT)
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
Subject: [PATCH v3 14/16] ASoC: mediatek: mt8195: Fix HDMI TX startup error handling
Date: Wed, 14 Oct 2026 18:27:49 +0700
Message-ID: <20261014112752.683032-15-phucduc.bui@gmail.com>
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

Check and propagate errors when enabling the clock gate and MCLK
during HDMI TX/DP TX startup.

If MCLK enabling fails, disable the clock gate that was already
enabled before returning the error.

Fixes: 1de9a54acafb ("ASoC: mediatek: mt8195: support etdm in platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8195/mt8195-dai-etdm.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c b/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
index 1270fcac6b3f..11317cdd14ab 100644
--- a/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
+++ b/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
@@ -2321,13 +2321,25 @@ static int mtk_dai_hdmitx_dptx_startup(struct snd_pcm_substream *substream,
 	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
 	struct mt8195_afe_private *afe_priv = afe->platform_priv;
 	int cg_id = mtk_dai_etdm_get_cg_id_by_dai_id(dai->id);
+	int ret;
 
-	if (cg_id >= 0)
-		mt8195_afe_enable_clk(afe, afe_priv->clk[cg_id]);
+	if (cg_id >= 0) {
+		ret = mt8195_afe_enable_clk(afe, afe_priv->clk[cg_id]);
+		if (ret)
+			return ret;
+	}
 
-	mtk_dai_etdm_enable_mclk(afe, dai->id);
+	ret = mtk_dai_etdm_enable_mclk(afe, dai->id);
+	if (ret)
+		goto err_disable_cg_clk;
 
 	return 0;
+
+err_disable_cg_clk:
+	if (cg_id >= 0)
+		mt8195_afe_disable_clk(afe, afe_priv->clk[cg_id]);
+
+	return ret;
 }
 
 static void mtk_dai_hdmitx_dptx_shutdown(struct snd_pcm_substream *substream,
-- 
2.43.0

