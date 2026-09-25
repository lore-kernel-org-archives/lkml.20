Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A39D93C4B93
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 04:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790311804; cv=none; b=b5Q+WMyKTUCKfnwaEo2Q3nSuWgyOzKmRj/3/b3Gk2xZeLX5e1Bo27sGsGYbqLPjeoS2kXvWrSwU0anVdNwt5/cggXtD93pKYysSxRJjjwT26xtoFiSyGM8Zxy5qxIIHzuOi7MkD48n7j89x6PPYzdwkQvxaDjhYc+Qh7gN3pHb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790311804; c=relaxed/simple;
	bh=3XxECfTsUmdCi+zRvqz0zN2fUbeWSo65SVUzmGYUP40=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D7jur57jVYer2hLQb0cy+CAHA3JUPB2vriIt5WM8VXN05aAGCYAsiVXxuKjyvQeJwsT5nnuTRIWkiGLXneal+tBgRZR8SGX+lEFXBRQdmf2YTsJraf+FINRVZ9tk1wlS5HJe603tC3WWa24cxqAq2/rI67229lw1dn57kusAXXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FFn8VgHV; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FFn8VgHV"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-396ccb652d7so378476a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 21:50:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790311803; x=1790916603; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9TPAdVO6cx1GivG1fZmlwZJr0XNJ9YraoDL81c+GXj4=;
        b=FFn8VgHVPWfEKSnOBopejLC8B8mTe/KvFbIKiEJ+HnJt1NX2X6Y8sa2Nr/aQeoYHbG
         XVonJahogV2jD/SzLhwzwCMaQKPtDuQ96bBx3QzVtgsd6aelC/hUjNoOpdR1kHjM8PDv
         iTgrHr7gbn2vw6O4q626ZM3i+zzyVJ6MJ1f7atIwO4Wecaq+HCuxq63eHsW4ETr+0GKb
         cu4D0z8c87T4kyHbFz2Eab1DB7ZiZwfAyFr8rnMbdpkpgHGlHbe349j97RnY4ZiOooPf
         4Sn/vg5VX4fUSH2rODLyz8McGbDOEFbmQG+lg/Hm3/hadWgd9DEJlsphgD3YvU8aBV5D
         819Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790311803; x=1790916603;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9TPAdVO6cx1GivG1fZmlwZJr0XNJ9YraoDL81c+GXj4=;
        b=qCKJNMvhSfQEldS2m/Rh+wI/+jLhOYC0vcsXX1mxbG/PRbFIYyLzi30tgnpnG40Hnm
         eQGS0DT+RjuA/piXknE973KGIHweDSslU2ZYtG5yRqXBezl42B2AnHxyvChTkgub7nCX
         5mfNS+0fzR4rbkSZtI3VCHoMaDBGsq6f7HhdFxebQp0U4MxghmINbfhhOd0zuIIld4ln
         TaopQ3VC8XOuFClOz9y4Hl67gnRC1hkPkffvn+d39AtyhJZ06jABQwxFORYbbgKq3dFC
         Bw/fQVQBo9tTQdozJfD0zm4e2V00xbz9nzxoziwTl5uOdtmrwvp0ut9LQo3kJcrwZQb8
         mnbQ==
X-Forwarded-Encrypted: i=1; AKwUvByqHplGDJqxdfThBZBr823qYEM2PxLEhUEQbd3jKWbvXNHmfXlQ5sWR6y1T9Hu7bxK3vFb0ndsz258s9bQ=@vger.kernel.org
X-Gm-Message-State: AFuF++mjNo2whX7HUVr/e3xpRnl+P6Xj+Vt1DICumFfb3JVD3hacd4Ey
	p0v0E4PTAHvypjCT9caDd0PytCCID+H81QBsy1dOhkCIDwLRFmatStZh
X-Gm-Gg: AYBFou2wz14mKRJFLETdCQ0ziZgNv1kkS0BuhlnSVREnwvLEv45VaF6rGfIY9xU8PwG
	xX0/UOYX+EA/MhO1TZGCFmgbPohhBjIcV6zOGxyFRRF+uQ8ljjmeiTaKSwo9D9dEgidnXMzLPI9
	PXrUXLMvCsHmysRy1Tfchoe7YnngSmlWbxRUjPBxGy0jCHVIQXdeZhW6OjSp7eR61wS5/xtXDS5
	4yRn2Q6kYT3k/nKgy/YDTn6uyISwSdswt/fAJMcrRLrP9fMEe9ayL3XfRnGtp/KRI544eJAx2Ex
	zqpdWlTaTR/0giq+bb1a3D2Z71LPMRTn5xaPtJ0NDcyfPFReeppaBBDo+u3NGOsSmQqnqDKYfsx
	0FgZAdBnvf9W9yboJyqt/0npUQ6K+2UPWwmVjUhGRhjRJz1UbvMai1WoNuc7dL4EBevb1fpNx3M
	CIoja5m6OueBvhCAzpop5odZaI69enqW3v6sdLQvsMXcklLXHtq7MLQcf5gbZd0vF8uvdQUT/dd
	PdCOdhJwDgB2Ha7YbQ5JEEZp7RfqWOQE2Cq0CV/U7ZL85duPttSvI5KYSbID0qO9/M7IW9GhX+8
	iFFXIaENtv+Rj+xAuYsLvJhI
X-Received: by 2002:a17:90b:3c51:b0:39e:6c6a:4b79 with SMTP id 98e67ed59e1d1-3a098e41273mr4074558a91.67.1790311802879;
        Thu, 24 Sep 2026 21:50:02 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0976cacbesm8151528a91.13.2026.09.24.21.49.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 21:50:02 -0700 (PDT)
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
Subject: [PATCH 02/14] ASoC: mediatek: mt8195: Use dev_err_probe() in mt8195_afe_init_clock()
Date: Fri, 25 Sep 2026 11:48:56 +0700
Message-ID: <20260925044908.450775-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260925044908.450775-1-phucduc.bui@gmail.com>
References: <20260925044908.450775-1-phucduc.bui@gmail.com>
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
 sound/soc/mediatek/mt8195/mt8195-afe-clk.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-afe-clk.c b/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
index ec1ea5b988ff..12d8159338be 100644
--- a/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
+++ b/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
@@ -397,12 +397,9 @@ int mt8195_afe_init_clock(struct mtk_base_afe *afe)
 
 	for (i = 0; i < MT8195_CLK_NUM; i++) {
 		afe_priv->clk[i] = devm_clk_get(afe->dev, aud_clks[i]);
-		if (IS_ERR(afe_priv->clk[i])) {
-			dev_dbg(afe->dev, "%s(), devm_clk_get %s fail, ret %ld\n",
-				__func__, aud_clks[i],
-				PTR_ERR(afe_priv->clk[i]));
-			return PTR_ERR(afe_priv->clk[i]);
-		}
+		if (IS_ERR(afe_priv->clk[i]))
+			return dev_err_probe(afe->dev, PTR_ERR(afe_priv->clk[i]),
+					     "failed to get clock %s\n", aud_clks[i]);
 	}
 
 	/* initial tuner */
-- 
2.43.0

