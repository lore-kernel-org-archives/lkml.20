Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6A8F47DD76
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 11:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791198245; cv=none; b=PNZZU1048B6QgNOyd385k0t61FQq5qwFw6ajzvKcqDjGwUBUz9Or6RIdkUsd1STujfnJp6KzA2EkmjQwC8/T1sjZrA/BMYVyooLbA5SX3P/uwxrpezaCzCl/469+MZqqdOEd22b4aDaiZeCTPw4jwFZ6iVtMNTQv5xe9+kg947o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791198245; c=relaxed/simple;
	bh=ypQXbofgJUYSU/ugIyK1wgNOcXryRiZTUAAMJdAgMxg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BAL49d+F3L8g8hdKQbR0sT6Iox+1BWLMIjMV386jSS85NbQGH7EuSCY6KOmmkqDB0/Ej0vpvhGSTS8DVch+PJffdBouhQgUmOV6nG3wyUzJdte6UzKP5A0c8oetmQ5XgXFq+Fw5Dd0J6DDDKa2JW9DhSNJ5NnwDoaFPmvkH3YKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y5mREot6; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y5mREot6"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cc4c7fab7b6so1056411a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 04:04:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791198243; x=1791803043; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oOBRYOJd1nqgIrlYjIP4hj2rZhjfdBykcJZsmW1nWNE=;
        b=Y5mREot6j1xvc7xX9PzSB8QLf1D41jR/NOjsRL33qziy6uJXgJb4TzEnXi9hi8eGzd
         a12jgphhcHpfSuu/hx/dJRP/T6lH0l31Zo0pXrzFspOPVJk2UtuXWQe4mDQ1EZ6l6Q6E
         Hn81U909qpDa1wJ9G1KXCYibUvag24kF5PQpNRp1goiBWTt6cb9jJMY1EB8OV6uYsHJ+
         5DqKLw/UasIZKS86SGQk9I/4ZeUodstLmfp8L3Op3og4CpuFdL9LjBsr1ZHBy0zRuGdN
         dxaQ1fdGVR456t/Lp66q11DrCRZmLoynVoXW1FokRk8qth5K+mdZe+//Zv2ez1LRpKr2
         PnIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791198243; x=1791803043;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oOBRYOJd1nqgIrlYjIP4hj2rZhjfdBykcJZsmW1nWNE=;
        b=xh7uLlzTX7Cl1g0I3Lz5KJSaJt/ncXVBnGQ7Elx2qprxPOI34D9X2w3zZSnbn4HleB
         UZ4sn0iYMvhk6uoHtIVYSIc5AZmKqSE4Jc31Lm+gnIf1CMm/EjvOa8LSAwJhb2OPBdQf
         6LnYdeCTJBt4fDlRTq6/kX+hDNrTomvIG9Xb4iZOZCCMKO9yxCGpTK0DO2+1OKxzxa1G
         j/mfaMHSPnqwcqqO4lHjJIyRJOhnkrWz+pErtjLdIMBPNI/Gklu5ockhoKBHMpXop1wR
         AKKgA7rCB3qW+UfBSPZ9uD5iS3cKy+WHxWdnV4BYxEdI3diPZKWWTAUCQ56pMcSDsE9o
         7uAQ==
X-Forwarded-Encrypted: i=1; AKwUvBwIWBiiz/f7vcW/5lW9pIVEIXRZ9zzGGxMspHsZQ5aiD0SOmf0GID3Zj0TcakfwfjkOtk/DaHp3NAJ2kLE=@vger.kernel.org
X-Gm-Message-State: AFuF++kQDF130cBbYPDkxBpbpiUIOVJMjiyq8hRGaITFSCNGL9AVm3SE
	YnJ94Wj0/IK/JANjmqSoG3uds6jIovSu/O4BGmEJU9XFwIEPKo0bLVo/
X-Gm-Gg: AYBFou0u7LS4JBqsYjkyDeNt3EFoZP9isBWQLkPx6rwtvbLSsuU8aLcOG7bXMlJyV+i
	UmuNYGh2lDru4N7MI5nl4PikEPYOV0Vf7ftSSE1pc1CKmkKHLeW/ifLwOzXCvv5UiUrtL/9HfX8
	mLVReqjLpBNkcFD36LYST8l8wFezBIvXsjF92oiLUQSufDESRxZI0gLcZ21fHcpHndmWcNeKnl4
	PJlInAkAO1cj9eorYTLw5TKulWt4koH1joA93+APUkKfu5Caq4aFLFAjBP1ekdqVRyykWCNT1Qs
	fubn4CEImIYgsC6p+/GDTYTSRTnh7wPailKOGNOlTifgnmXMDtg0iTVslS1JW9q0j4aFU98byZC
	d+jfdwXSSDTV+pqU6c+X20s+deEsaYjGF2E1m3Ps+gB2SgfFribxTjyXcjKllRk6w1PY9wwQBvi
	BthdokCC96J54HNhp8IjdbcaJc/rJT1T/NS1oYDYoNJ9pmZho8MR7gwwjpMkfMLnj7TiIptSylW
	RwyRktlRNYnTlYsb/XIQN/GnarA1HJrHEe0X5iJEA7BO3Bgs/M37UkxZj84lPa6kcnO0UqgyLNH
	C70l8zXKmuqOBw==
X-Received: by 2002:a05:6a21:648f:b0:3e0:b1b2:2ae9 with SMTP id adf61e73a8af0-3e0d6b33a61mr6751759637.47.1791198242991;
        Mon, 05 Oct 2026 04:04:02 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cce6d334de5sm626498a12.11.2026.10.05.04.03.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 04:04:02 -0700 (PDT)
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
Subject: [PATCH v2 10/14] ASoC: mediatek: mt8195: Fix ETDM MCLK error handling
Date: Mon,  5 Oct 2026 18:02:53 +0700
Message-ID: <20261005110257.50145-11-phucduc.bui@gmail.com>
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

Propagate errors from mt8195_afe_enable_clk() when enabling the
ETDM MCLK instead of always returning success.

This allows callers to properly handle failures when enabling the
MCLK.

Fixes: 1de9a54acafb ("ASoC: mediatek: mt8195: support etdm in platform driver")
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

