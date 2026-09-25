Received: from mail-pj2-f14.google.com (mail-pj2-f14.google.com [74.125.227.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9770C3C7DE8
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 04:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790311826; cv=none; b=WDqTZ5+fDvZ/VIIZg1cFCdOO/jXlzlW4y40VVt/Vri8sz6zPfhmMeY1Vp2W942Zy6Adcy5v1xXACLHebaYRQeYmi8Gule+12/yIc25HpY9n3ssdbQfsZGNeR4WIrn+BdgKCJ4eMfeg2vBddxRKqPlNDxM+xQTdDhl7Qw7aCT0RU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790311826; c=relaxed/simple;
	bh=ftxTR8on66uxbSklw596OG+y/YWB6brt0oLqdp65L3k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DTbShYiRZXWOUDEECJSA8Qpd/M/OaAOkm1kNQFJ+GytruZAakBIFcmodilnN3LiVbK9MLTaVb6XjD6r+ga0wUvUZIuHChLeCibfLKFtmwVs/AVcP6FNBSMr/VAacp2raxa7tg/9arcYMkc5PDNaQe4bY5mXp0nU3FqyOgzE2gS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HSVB4gWJ; arc=none smtp.client-ip=74.125.227.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HSVB4gWJ"
Received: by mail-pj2-f14.google.com with SMTP id d9443c01a7336-2d747f0135fso2647345ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 21:50:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790311825; x=1790916625; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w4GNAjod76l6NOc1BH/+OGpfP5lfIuJmdZBB1uffkhg=;
        b=HSVB4gWJ6ZayUSzU4JOvDrRNYbfQrllCCkQuHwaIGNA3grXYxnAmIjEFPdzhEnKqTV
         mZIF9HLdLwkXVcONEX46JptSD/acgo7/HaiS3RQw6wLj47agPQytlKHTik7M/ifIEb8v
         NqN6uvSHjQS09UKNuW+eshrP+nqTZBSzVAx379ghD4EhIpUF7sQwb3EyFk7r2tQ1jT/3
         IcDyFNj86m21DJvOXsfmdALXx9lGeobfbHSErMDS/SMJ9EKAm0gcWzwVYZbA9u5Shecw
         qKYDGauWkobZ0qwhrW6ZOI735AqL0sRrG7PTEYXRkzwiwh0deFux3wRSi7nJRzkJKlhz
         uRNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790311825; x=1790916625;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=w4GNAjod76l6NOc1BH/+OGpfP5lfIuJmdZBB1uffkhg=;
        b=Ou033zRzgU0YykbZiRSOXEJ22SJEzEAm+fr33zF0E/1uqhwRZfHYlqtnhRNNLuXzDS
         WXezlphHU3/XTGbVX/rWuwSrVhCDFWe4F1YOtPWhUJKUvJ49DgM1JCxu1zkdfd2bi37H
         oTKvjfBV0aE+pdaj2fm+voVT72KfnLfa4uiFrp7Kjif/HouZXrLKxXUbh6VaZjq4UGwH
         HU2LOGFMFOXeue5ZScPYMbPCqCAhPesrW7o90vOeKZOg/cpytcKGixk6gqxL5H6g9d96
         vPdilgyscMgWSvwJCmbXgHeYBMWIASZrke4tN08nyGO2zRwixewWoTCCh4WKYv+4Rpc5
         /ZDg==
X-Forwarded-Encrypted: i=1; AKwUvBwSwxBqNkqcxxv1uiXkc38kwSwYQWBDaxTGY0QWGEEgOqeGAnpdnUkstGwpunIrY3EAgqYUJ0ihh1dggb4=@vger.kernel.org
X-Gm-Message-State: AFuF++nl+2UBoX+qpg+tXjjgZE5dMedgYVEsYdQ+/0fiCpcyLESIgixH
	NOJ8gZWg6kPPSxMrsMRbS9MIgxoobVgjZjQdvPhLyhoQcfDabdOEHlck
X-Gm-Gg: AYBFou1SIXqSvzvEsFl0J2aBmmzcZoaXNbmuqYxp++vZiPjE+u4lUinGCs0BzDTvTme
	LkFKfER0toUPTaFeQcKj7VsN2vJ3FueLL0FlXSTiz4ci9F7oifKxD1fqDr/p2FHDFDMirIVbTzf
	O2pDFD0SqhIfTPpHDIDG4HZXxd3mq79qkyr4MzHAQnHX0mZA1bhmqq+v3D2GTEypFKZlwocDOA8
	a+1JkmYaE8IgRNvSWowu8IGcnvnNOETj7U5sUz+oBADBFNNS+zaYMy1qX5/sJm7hJxhPy7H2mb5
	8iPXjLXZUz4VGorpcpgVMgx1qWlkrTyJ03t64grDq+lWHBWgwyjgEbyJj9spF2PbpCO5BhjaIKF
	GcDBHXPU12+/N4xUnyh4C9qxwNZENY3IWvAYolIEb7vJVr8Qw7+CT8Z7lNnKk8ui6PjUwTSqMv1
	RNgvQ1weRcKZIjT4IxLsni9d/ABVLIEXM4AzeeTGJrkJ0TONiAOHBRRgRm/VBxNXeYDAk7mZpIp
	HcGMYAQv6uNmZzpdVQ5xqJR9yGIeFIRuDcxmiD5IRMq0Oe7XUfydgs7cvZEK2NhuwsCNN7i3qbO
	2CvmcZ7pPNe1Dw==
X-Received: by 2002:a17:90b:2c88:b0:39e:b15:7950 with SMTP id 98e67ed59e1d1-3a0bb5789eamr919112a91.23.1790311824883;
        Thu, 24 Sep 2026 21:50:24 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0976cacbesm8151528a91.13.2026.09.24.21.50.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 21:50:24 -0700 (PDT)
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
Subject: [PATCH 07/14] ASoC: mediatek: mt8195: Fix runtime resume error handling
Date: Fri, 25 Sep 2026 11:49:01 +0700
Message-ID: <20260925044908.450775-8-phucduc.bui@gmail.com>
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

Check and propagate errors when enabling the register access and main
clocks during runtime resume.

If regcache_sync() or main clock enable fails, restore regmap cache-only
mode and disable the register access clocks before returning the error.

Fixes: 6746cc858259 ("ASoC: mediatek: mt8195: add platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8195/mt8195-afe-pcm.c | 23 +++++++++++++++++-----
 1 file changed, 18 insertions(+), 5 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
index 5e76625915a5..be150c0f5472 100644
--- a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
+++ b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
@@ -2958,18 +2958,31 @@ static int mt8195_afe_runtime_resume(struct device *dev)
 {
 	struct mtk_base_afe *afe = dev_get_drvdata(dev);
 	struct mt8195_afe_private *afe_priv = afe->platform_priv;
+	int ret;
 
-	mt8195_afe_enable_reg_rw_clk(afe);
+	ret = mt8195_afe_enable_reg_rw_clk(afe);
+	if (ret)
+		return ret;
 
 	if (!afe->regmap || afe_priv->pm_runtime_bypass_reg_ctl)
-		goto skip_regmap;
+		return 0;
 
 	regcache_cache_only(afe->regmap, false);
-	regcache_sync(afe->regmap);
+	ret = regcache_sync(afe->regmap);
+	if (ret)
+		goto err_restore_cache;
+
+	ret = mt8195_afe_enable_main_clock(afe);
+	if (ret)
+		goto err_restore_cache;
 
-	mt8195_afe_enable_main_clock(afe);
-skip_regmap:
 	return 0;
+
+err_restore_cache:
+	regcache_cache_only(afe->regmap, true);
+	mt8195_afe_disable_reg_rw_clk(afe);
+
+	return ret;
 }
 
 static int init_memif_priv_data(struct mtk_base_afe *afe)
-- 
2.43.0

