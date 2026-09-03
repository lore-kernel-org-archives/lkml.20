Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89F3C3859CE
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 05:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788412340; cv=none; b=STCRtAQqKgG5S34PAzGAHfdfFWMJIn7dcEjat1xmP8ecQxHKHXiPMxYcXDE4qNByopV1rsMfOcQKvyz0b36RrPOoOnFYwlY+iKHz/brNUC0Z6kNH51aKhkk2oRZeSHSb9gHYyuCdPuIXIjAIZm649hRimh3K6VMLSbFW0evWieo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788412340; c=relaxed/simple;
	bh=odPnwzTim5VJzRoqJDHtv4SSFk1321MGuPADe6BBZ6I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oKGM986Hc4fWdDW9QWaeDlnXARHVQuMZTd4RAIvQp2QjmTWIx0bTGcqgaQs5iOCQWv7Yg0oRd7dnsLIcuJEv21QYzJKgCVeCeCmIzP0AwAhozYDuMu7N6/SmHBVGMCys4N+vQQo7z8eKzWe/ETwRdlN9utt0zBefz2tbHh2DJZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=USMSwsGC; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="USMSwsGC"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-398b3c37877so2362360a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 22:12:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788412339; x=1789017139; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5wPkQ2yKZRMb3dr4gnYaeyOoBnx66i8isM9HTrrtk6Q=;
        b=USMSwsGCFXaVZ0NyKpTrBXaZdBXjspKncE4I4GEdmB5T2hxzPP9T+FuA2kkUlmxfh+
         j4LUtrarnD6QxXIR3FnECoeRcsh2Nel4xo5/X9qsDR6ZgFe59yQTtzPnIJWAyLk5/GZt
         qRnSsTW38GwFHqRYE7XmP8A0IbuIWO6vzzuJs8WH1UCLiG7lvgy2EfgvfXmoh2YvFDkd
         TcRUdMZ4rqAk3fYwrfkR584mLUjosUkOgEAsdK4RkccJs2lHnjh+g1hS43ESrYOwBK8s
         dHRDBh2RPpaehF+sOzO90kUyVx/XUnoB95gBeeUlV7ueznH7vMoAJpMaJzyIa1SS63RF
         yqJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788412339; x=1789017139;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5wPkQ2yKZRMb3dr4gnYaeyOoBnx66i8isM9HTrrtk6Q=;
        b=NAJFe9MlMQxWT6f9t6ysg9nWZmKOIxaRdgNmRs/2jSi7uTgRey3HWq1yRUCwWAZY75
         wht6sT8EHcwRqPTTYUg+8fFyESMD9KTVicX0XgKzU1Kx9low9SCgAiZmvaL365+DLdSY
         mCf71fzMcX1ipdX/vbTRKnJN/b/MbaET/wsd002odhYAksZRyB2B67sRanvBWSw+qBA8
         FqoaTh2927IaJbqR/CNNmWLF2Dl0CX1HXMbVfEPF5lIFX9YItG3VoUQUnVms+UnxpPqk
         YJr4MF0Hjpq4tnDFxifFT9rpfz8cK/szcS8/E5dlaGNn5Q9ASbW0YFgetjEn0h1U1pTU
         N2vw==
X-Forwarded-Encrypted: i=1; AKwUvBx4b19Rn6TFk78r5i3Wo09ikTTMWDOMigJqzJiOjcv7BNYVDw7Zem/6/WGIMZA51ONI/KidxASPqnKSsCw=@vger.kernel.org
X-Gm-Message-State: AFuF++nOLgo6AuHOeWFf8YZEsqYLpRw/xKwOOklpBOJkEJfhtTc2FrSq
	hqw1+ZsIxXGQi2erv4nm10a8RsS8PpwU2dTpM2tiS1LSW8BY1A8idHIo
X-Gm-Gg: AYBFou2t9SII/o4GGWov9DC+LNAl7b/8ry+ETy0Vi0LDRW6JC2VMoBosVYZupU7pXZM
	+rSCRBw0mi/2O6XEhqGmOXKnOcJSV4zbnwo0enga8tUfFLH9TiATIYSDjnnsAl2CLIG3/lyLQu5
	/t0RfuE5HU7G/sZODTvRrgHkkf/KkVPjVsGJ78Bq6stDynHDNmoo7Q7oBwdyyTNFnu2pJAGBszv
	tMKbs/Ys16kJbkyB/SpPoxE6MRbv9INpQjeQM64s85Fy6In/PRzQz66S6Ku7W+GoaiHpZNuLCoe
	UdtYGhPBurKd2ylgLPBDHedG1lPa0EsjF5EwKmHO9TNrlUk3jVQ3ynSB5HFT+7tUJlWN6BsF9Ck
	zJnjNRgR7U4DhEfqGYT6H42Mw6eM88ROOlYH7NH9pH1ajRfTf+K4eBfnN3fFKM+IQhbHZCeWnYY
	1udXQKNRiYpm4upb9g/Y7iM21nbYFVIFtBxBo++jQKBnenJWBGqfj5yBOjdJn/oTxa9Up8TpshU
	2pPfP4T0SkrQMEDFQIIbKP9u4R5tSNnNfS5loOikPghQgSy4DqM85xr9U4bQTqfouTqapeZNvly
	5cUxwHq5P5vCLh5h
X-Received: by 2002:a17:90a:dfcd:b0:398:ba0e:96f6 with SMTP id 98e67ed59e1d1-39aee1ad8edmr15910160a91.23.1788412338925;
        Wed, 02 Sep 2026 22:12:18 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b0875ce14sm3218092a91.13.2026.09.02.22.12.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 22:12:18 -0700 (PDT)
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
Subject: [PATCH v4 2/8] ASoC: mediatek: mt8186: Fix clock handling in mux disable path
Date: Thu,  3 Sep 2026 12:11:44 +0700
Message-ID: <20260903051150.178057-3-phucduc.bui@gmail.com>
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

In the disable path of the appl*_mux_setting() functions,
clk_disable_unprepare() is called after clk_set_parent().
If clk_set_parent() fails, clk_disable_unprepare() is skipped,
potentially leaving one of the clocks enabled.

Remove the goto exit paths so that all teardown steps are attempted
and any errors are only reported.

Fixes: 55b423d5623c ("ASoC: mediatek: mt8186: support audio clock control in platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v4:
 - In the mux disable path, remove the goto labels so that all teardown
   steps are attempted and any errors are only reported.

 sound/soc/mediatek/mt8186/mt8186-afe-clk.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/sound/soc/mediatek/mt8186/mt8186-afe-clk.c b/sound/soc/mediatek/mt8186/mt8186-afe-clk.c
index aa8b2eaf7b95..3edd0dd20eed 100644
--- a/sound/soc/mediatek/mt8186/mt8186-afe-clk.c
+++ b/sound/soc/mediatek/mt8186/mt8186-afe-clk.c
@@ -131,7 +131,6 @@ static int apll1_mux_setting(struct mtk_base_afe *afe, bool enable)
 			dev_err(afe->dev, "%s clk_set_parent %s-%s fail %d\n",
 				__func__, aud_clks[CLK_TOP_MUX_AUD_ENG1],
 				aud_clks[CLK_CLK26M], ret);
-			goto EXIT;
 		}
 		clk_disable_unprepare(afe_priv->clk[CLK_TOP_MUX_AUD_ENG1]);
 
@@ -141,7 +140,6 @@ static int apll1_mux_setting(struct mtk_base_afe *afe, bool enable)
 			dev_err(afe->dev, "%s clk_set_parent %s-%s fail %d\n",
 				__func__, aud_clks[CLK_TOP_MUX_AUD_1],
 				aud_clks[CLK_CLK26M], ret);
-			goto EXIT;
 		}
 		clk_disable_unprepare(afe_priv->clk[CLK_TOP_MUX_AUD_1]);
 	}
@@ -158,7 +156,6 @@ static int apll1_mux_setting(struct mtk_base_afe *afe, bool enable)
 		       afe_priv->clk[CLK_CLK26M]);
 	clk_disable_unprepare(afe_priv->clk[CLK_TOP_MUX_AUD_1]);
 ERR_ENABLE_CLK_TOP_MUX_AUD_1:
-EXIT:
 	return ret;
 }
 
@@ -205,7 +202,6 @@ static int apll2_mux_setting(struct mtk_base_afe *afe, bool enable)
 			dev_err(afe->dev, "%s clk_set_parent %s-%s fail %d\n",
 				__func__, aud_clks[CLK_TOP_MUX_AUD_ENG2],
 				aud_clks[CLK_CLK26M], ret);
-			goto EXIT;
 		}
 		clk_disable_unprepare(afe_priv->clk[CLK_TOP_MUX_AUD_ENG2]);
 
@@ -215,7 +211,6 @@ static int apll2_mux_setting(struct mtk_base_afe *afe, bool enable)
 			dev_err(afe->dev, "%s clk_set_parent %s-%s fail %d\n",
 				__func__, aud_clks[CLK_TOP_MUX_AUD_2],
 				aud_clks[CLK_CLK26M], ret);
-			goto EXIT;
 		}
 		clk_disable_unprepare(afe_priv->clk[CLK_TOP_MUX_AUD_2]);
 	}
@@ -232,7 +227,6 @@ static int apll2_mux_setting(struct mtk_base_afe *afe, bool enable)
 		       afe_priv->clk[CLK_CLK26M]);
 	clk_disable_unprepare(afe_priv->clk[CLK_TOP_MUX_AUD_2]);
 ERR_ENABLE_CLK_TOP_MUX_AUD_2:
-EXIT:
 	return ret;
 }
 
-- 
2.43.0

