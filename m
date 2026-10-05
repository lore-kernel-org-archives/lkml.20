Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 574F347CA81
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 11:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791198264; cv=none; b=GCKUoOHTEowi0EZUJkZbXJnlm8kO+lzrXuE15GKnnPuWLrieCb0EVKAYmAGzqqXiqu9c0T8WDQT1HqrN57eDRQlLXOSmaMuM6iEoL0fNplfclaPbGWb0WTQ6CFmxxyJVVLNuMGMRT9CTmwsyY/Pk7IHtGDhljdGcuHWORADOzeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791198264; c=relaxed/simple;
	bh=R4W/s5gJc4IPH9tGG0NMkgYOTqk1l/A5nm8KgAntf7Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nAylXtNuvtLCgTprL6JUXb3X+iUXwysNOW67eGpTuX7+BxblmamIOnNrbTFBl7OzeAgldwo+L/P/t8SD8OmhB1A+r2++0YAr89WGZpMOLsVIR/uQ8JOOmYDGaJhR6gOzO1YFJwdx8hC21ZGJEpOzRgP+JsbQuvHD/XMeER4EJ2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nu2im9HE; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nu2im9HE"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3a7cfe8f761so309094a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 04:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791198262; x=1791803062; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yhIzfLC5gjj745ZZDgOhdg5fEWiTou40MIcz5JgYdEA=;
        b=Nu2im9HEk7OwLZtTm7ZK6yPeNE3hofjmg2B3aiN+2E9HXT2RGoC1agQffQGE+1QCqz
         5j3GVTJfHxr0Z2aY3/JYLGKL5LFDImgBEAobkuHZd7LhoY2DPrMtYYiKprjU/q+a18JB
         k0zrlZrRQJTpjarkcEwRe0htBVlHPOH5RJmtP07cCuAd5pHVdyixh8a+eFPncKxQgp3F
         R+0MUXtAxyzXZ0YJdwhKamAgow8wugn46+P5AoS6sDN0KB5YDw13xO6gHU9VH9U0iQQn
         Ylvl53EX17Sy+arL0aElMMT3X9ob4djHT2afQsh5MUUflPd8wJ31JCTJn7LxjusdvDfX
         G7Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791198262; x=1791803062;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yhIzfLC5gjj745ZZDgOhdg5fEWiTou40MIcz5JgYdEA=;
        b=FdxHpU6JOEsYmqOWoSNFEnctwNExgi4o0Gqw+wM7ybTzgKxnKL0Tfvxms+FpkO2DqU
         K/OFpt4H0PukYm/M/ReigcflItQD8+pQoRScy12uBe8RkMJ+lhcOZKCO/1uFUKXKslGT
         7XF+dCsCzM0h7k8MOncWhPDDHajqVU4QapOqwuh/RpJ14xlvkE2kEKGAE19gFTLc1eIg
         AHFw66ZuBMsr1OE49cAKgXDAnUUR9XIJ8M2ZmIl/mXWZ0zxpn03Ocm1cnLy+SogLApDe
         SsZrUcpXywe6HsvB4nXYKeDtZ9xSBR/uWcNlHZcVklEjRttaEboppechMe9vcEs54Pc+
         +OgA==
X-Forwarded-Encrypted: i=1; AKwUvBy9eTSl96poazig/AvVuVnT2hxEYeWJEaGB9/tv5afe0IS12itepd26hUvKJb4oIzQHtdyXYZ3/Y6oRFEo=@vger.kernel.org
X-Gm-Message-State: AFuF++l6vlMl7NNuERXNku1YoWM5JAONhkx6/XOUOUQshgBjtbDCShyw
	gZ0WBoZJQ0yqKatgPv76jTdME1f3JPlCfV2xpjEKixXCdfBHqN9kHwRM
X-Gm-Gg: AYBFou3kUoLgu6uBV5h78RQjjmJnqb824sX2heiXWxq6CgFIfNUFHeo9hLNQFDk/DVL
	MsUGr62PGGjLPhEqgOLweSyV0ydBqopy719OFbaVD9YVMJIa4GL1liQdb4b0SLUoqS0zwqPDw2X
	FbY59DnRHJtA+2AjEp+AbsY8EZGg38fBcwJEWECtLLr82orsCL+fswCTOhpGiv50OWbdx6oYFXk
	hwKhXXRvxr/rRg9acj58DGhyGn89kyjUIC/7w4Rq6h7LVfmeZU8D4aHAfeyHjrgORfYhX8dxPfK
	DDgG+D5TblaL8h+s3ERgMlFzY5D778Ol0sTPOX8vDf8obseW7d5r4zLCO3uhY14mZrYNCBE0aEI
	VXXx0Ex7w9Lw4VRW2drJ2Z5aUlg+xyN2abyKwlTRYDNPhh03ofkPQPtzBYFzi48Vc2DzHsx4dlT
	BMh38tU11mMHKotVP6JTIztkDdo2/AWIBWI99kNSoKuMrBKlA/4l8sKukvZq253KK2vhoRwqRRP
	62o51ZOCiptURDgnkTXQV6OvvRMrWjZSdnREbLRkQk0U4xF+HfwKPBUqcdaQOCGKWYvyg9uw0NV
	+DCN2lVka5Z7RQ==
X-Received: by 2002:a05:6300:68cb:20b0:3df:f477:1e19 with SMTP id adf61e73a8af0-3dff47726f0mr5590214637.48.1791198262474;
        Mon, 05 Oct 2026 04:04:22 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cce6d334de5sm626498a12.11.2026.10.05.04.04.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 04:04:22 -0700 (PDT)
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
Subject: [PATCH v2 14/14] ASoC: mediatek: mt8195: Fix clock parent error handling
Date: Mon,  5 Oct 2026 18:02:57 +0700
Message-ID: <20261005110257.50145-15-phucduc.bui@gmail.com>
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

Propagate the error returned by mt8195_afe_set_clk_parent() instead of
ignoring it.

This allows clock parent configuration failures to be properly handled
by the caller.

Fixes: 3de3eba588bb ("ASoC: mediatek: mt8195: support adda in platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8195/mt8195-dai-adda.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-dai-adda.c b/sound/soc/mediatek/mt8195/mt8195-dai-adda.c
index 94abde15ea09..8a58a142064d 100644
--- a/sound/soc/mediatek/mt8195/mt8195-dai-adda.c
+++ b/sound/soc/mediatek/mt8195/mt8195-dai-adda.c
@@ -262,9 +262,8 @@ static int mtk_audio_hires_event(struct snd_soc_dapm_widget *w,
 	default:
 		return 0;
 	}
-	mt8195_afe_set_clk_parent(afe, clk, clk_parent);
 
-	return 0;
+	return mt8195_afe_set_clk_parent(afe, clk, clk_parent);
 }
 
 static struct mtk_dai_adda_priv *get_adda_priv_by_name(struct mtk_base_afe *afe,
-- 
2.43.0

