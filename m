Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6647168BD
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 05:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788412346; cv=none; b=GQFIMRpQ7g7AWryph1idUY2DcSmmrYyMvovvsbfgdxuE8OlSNYDHIrEABp/rkN3o6qHrMWTUiqp9vMVlsdx4fyWd0Slr2ml2bo2I0rKKD8tRGwb18DXDd4Gl4h0fDIISA1/UYY/H271nIIzvFBeCwQyItMTyuWh1G0I1qEVdGGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788412346; c=relaxed/simple;
	bh=UmnqL6M25drr5zDmIxrr/zQAOZdWt9FGZuHi/bpNqM4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kjzTtjTc6qVtwVlPGvwB/vz42NuIN3GJijxdOELo0Us4ysglUWmjJQfT7IgR8WfeTGitM5nmZVOh+PheV3yQvdF95xLX/LPYTicqss2ZlCG89NZKCNw0XifpUXiDwa9R77bZnK0Ovm3fzY0fMLZd7HJcfP4xQjV6aBzsAEQKBME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ArdzoqXH; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ArdzoqXH"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-382ef647e20so2311595a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 22:12:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788412343; x=1789017143; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MkJ39B1HLIjudCYGC3Enm23IBUt9PIrUzK1D2BnlrWM=;
        b=ArdzoqXHtQyTSXVipafzxLkbhvHaoA+TFUYJ0Fdnc3Mwo2bpS1cQELWV4sbKbeDIyH
         xjGOV9+oalwJOgylE0YEK2flAAol1LU8cOkhFixe5/8pInjH+KArQAiyNkOlQCuUiMY2
         wyW3IN/ubb+dB5ZAlHdP1tid2j1GmM/ONJIasYa9LPE2UJPTH8qlgCbyMjHGT7LfAOI2
         MV+RYno691bVjoxneidxowb0N1yvVt6tz/1F2oymoRyjcclZDWNWlqRMX7ZztPbQ3NCw
         BMbSwlbg/rybS6wn5aNLulMyq1xbb2S+y6/0tNqa07lNySb1ydqB37Oz1uoduokfVDh1
         d9Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788412343; x=1789017143;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MkJ39B1HLIjudCYGC3Enm23IBUt9PIrUzK1D2BnlrWM=;
        b=hygqC1H9PsyBi8hCZHxG95921YGTbLBUrEYrTT2/cT3MvvEAAPkYEgNnki178cIuZY
         eoNkyfwr1EByTOaM9ZcHCH4bDtpcv7VVq6FALCBHpcwtPKnDIkoJIEvX0y9+kvHe7REx
         QagbnA1HdNGASZfWkbruNL2KfOE7jMEjzf73NpnLYNtSgvxBwjo7XDOmkOdfPsw9XL9M
         dtiGDuAYC488MBJjBVGE/+TjpkuooS4fpgiVqVnWiVLOqOxnAB9Ak2m1o0eM8dhcvXIA
         0pB0sd1jCh9dZxStX5YwVcMdEeMFHpTkCQ6n7u0vKxj05NsKzWJoL/KSNUUcSFjP8WGy
         k+ig==
X-Forwarded-Encrypted: i=1; AKwUvBy4h/uybxYvdzLSMgoQfxe5IiNc0Xb6mxakusyCEiiy13X7uBLafwMLQAcXtTmQBRUfk8vHEMPKltszJig=@vger.kernel.org
X-Gm-Message-State: AFuF++ne8Ws4hGrxrfpdXj3kOfCWNbQ+CkKwRXCkCiO4CfwK7ZtNpKpe
	cv3XzYY6qSj9GbsGbwbtoJuSWLXKOtL2RO48MCQHHsGSrWqn0S7x36AR
X-Gm-Gg: AYBFou1YV9TZewwdPzUG7BDqu8+nIrDtkGs7cbfTtJZJqioBUP5rFrW/C8+6UC1mEY4
	Tbi711fbp/k28iT08+9WQ47FYpg5m7QmdpzBN//LV959jjJhaVwSwKCRP8xkUeeydzSvJRU/dWG
	Bc3mkXRQZuyxBHwP9ab9mfPdhqwAbvLohRf+PGETsXgZXRTEIEQrR3aiSMfMaDZCHNuHeAIHNay
	JmZiAXKYydbJu0M8JIK/l28AFDUOqx12jielkRo2AtnzmMwDaTNhDul9z/ddArUoVE3xTKPtQLD
	QvbWnIfVdU8YfLEX8SpFou8qFkJ2EeiAjaYhNe9UD6mKSLaC+eZcvksQcEjIYsiJufriWtRXkK2
	cElbsSktpJdK6m7g6ePjJ9NXsF9IH94Tbmo9AwyiFKzbggmPR4xKTzzT3RH6NVY5HJvl8ycOwlw
	B5WnIPEPXIehcuZ7w1KMbdYD39jUXw/kRjI2CXCIaPI3rqQraiLtd/eURMqQSJgBv6qBN+qbGGt
	WntPeIdcy1whA+FkOSwSOQuR4h3EjD3sv61/U4WNrdQCEFsaXnc/e1jXYy8/rDl0TZcZVdg1Ubd
	DIeXk8gVzcyLhc93
X-Received: by 2002:a17:90b:1c8b:b0:398:dcfe:967a with SMTP id 98e67ed59e1d1-39aee0ab6f2mr12102665a91.17.1788412343352;
        Wed, 02 Sep 2026 22:12:23 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b0875ce14sm3218092a91.13.2026.09.02.22.12.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 22:12:23 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Jiaxin Yu <jiaxin.yu@mediatek.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v4 3/8] ASoC: mediatek: mt8186: Fix AFE clock error handling
Date: Thu,  3 Sep 2026 12:11:45 +0700
Message-ID: <20260903051150.178057-4-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260903051150.178057-1-phucduc.bui@gmail.com>
References: <20260903051150.178057-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

The error paths in mt8186_afe_enable_clock() do not consistently
undo the clock operations performed before an error.

Fix the goto targets and cleanup order so that the audio internal
bus parent is restored to CLK26M and all previously enabled clocks
are disabled before returning the error.

Fixes: 55b423d5623c ("ASoC: mediatek: mt8186: support audio clock control in platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8186/mt8186-afe-clk.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/sound/soc/mediatek/mt8186/mt8186-afe-clk.c b/sound/soc/mediatek/mt8186/mt8186-afe-clk.c
index 3edd0dd20eed..685dc27c7780 100644
--- a/sound/soc/mediatek/mt8186/mt8186-afe-clk.c
+++ b/sound/soc/mediatek/mt8186/mt8186-afe-clk.c
@@ -288,7 +288,7 @@ int mt8186_afe_enable_clock(struct mtk_base_afe *afe)
 		dev_err(afe->dev, "%s clk_set_parent %s-%s fail %d\n",
 			__func__, aud_clks[CLK_MUX_AUDIO],
 			aud_clks[CLK_CLK26M], ret);
-		goto clk_mux_audio_err;
+		goto clk_mux_audio_intbus_err;
 	}
 
 	ret = clk_prepare_enable(afe_priv->clk[CLK_MUX_AUDIOINTBUS]);
@@ -315,24 +315,22 @@ int mt8186_afe_enable_clock(struct mtk_base_afe *afe)
 	if (ret) {
 		dev_err(afe->dev, "%s clk_prepare_enable %s fail %d\n",
 			__func__, aud_clks[CLK_AFE], ret);
-		goto clk_afe_err;
+		goto clk_mux_audio_h_parent_err;
 	}
 
 	return 0;
 
-clk_afe_err:
-	clk_disable_unprepare(afe_priv->clk[CLK_AFE]);
 clk_mux_audio_h_parent_err:
+	mt8186_set_audio_int_bus_parent(afe, CLK_CLK26M);
 clk_mux_audio_intbus_parent_err:
-	mt8186_set_audio_int_bus_parent(afe, CLK_CLK26M);
+	clk_disable_unprepare(afe_priv->clk[CLK_MUX_AUDIOINTBUS]);
 clk_mux_audio_intbus_err:
-	clk_disable_unprepare(afe_priv->clk[CLK_MUX_AUDIOINTBUS]);
+	clk_disable_unprepare(afe_priv->clk[CLK_MUX_AUDIO]);
 clk_mux_audio_err:
-	clk_disable_unprepare(afe_priv->clk[CLK_MUX_AUDIO]);
-clk_infra_sys_audio_err:
-	clk_disable_unprepare(afe_priv->clk[CLK_INFRA_SYS_AUDIO]);
+	clk_disable_unprepare(afe_priv->clk[CLK_INFRA_AUDIO_26M]);
 clk_infra_audio_26m_err:
-	clk_disable_unprepare(afe_priv->clk[CLK_INFRA_AUDIO_26M]);
+	clk_disable_unprepare(afe_priv->clk[CLK_INFRA_SYS_AUDIO]);
+clk_infra_sys_audio_err:
 
 	return ret;
 }
-- 
2.43.0

