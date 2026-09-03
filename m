Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEDFD1E1A3D
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 05:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788412361; cv=none; b=tcR1vl4gjh8QvavqIHK/cRKNbCWGEskU2qy7tPJ0a9yVjg4ZeuEkbxUbFTAwqrcv2Ou0s0VIS//mQNi5Ov4UdBsn29MX8K5YHjBvEABFQjHKBT2p9fQduGk8NvZH1Mgwf25UZ/cgmBV8QoTAMPvrj8MCdSuXPWKbMJIVy0YWC1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788412361; c=relaxed/simple;
	bh=UHO3oH2Sj6WWxyXwm9+QaU7CNkpCUF4jRBx0s2y56hw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pRR/N0ohCbybkLinFROQE8XPTrjm5n+QvDtEqKGCUo7R/6xe3L8zziNA5IpW8q9uLTnq2VsC2PnvTxGxiHsXXGcbFxD17obPGCl7QflgT/yExwq+RPb7TdbdlD04VyJ5H4qRq4vJEdq4DWvmKfSdiaxyU2kvxgR3dczraXdiv2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lDOudsl0; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lDOudsl0"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3964dfb5b9aso2543519a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 22:12:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788412359; x=1789017159; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jrW30Al+vmkO4YXsfGyVaS6XNDTUobyD5Gl2CjSaQLg=;
        b=lDOudsl0Dg4iplIqMn80WFQWCrLDxtRSrT/ngu3wEeTTNsjgh+vdlT+zWrt0xrwaOP
         XEbHQFmcDrz/UI4tWhtRjynepa5eJJ3P/POXxzAnBxybz2f9gb2CI7SzOx8Mz7+COptb
         4sUmy/IXZ3U0tTt9KU9nYnP7QvppdP3FZ6//2b7QxvD25f4mn7VmElrmeRrtmQZh8jL/
         hJg5KI/3FmeUkFN1S2FQBO5DdIxy2adMZKHkyS7WbvCH/fNa2fGIODaMx7jsVr/4uIGK
         LSvigHebQ6PxyJZ9yWzKvhk7gFQJmhsbItdC4adiUrL0S4ROR1Dxt0/0OkShevp5s9up
         gUSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788412359; x=1789017159;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jrW30Al+vmkO4YXsfGyVaS6XNDTUobyD5Gl2CjSaQLg=;
        b=QJ9qPr8TTmD7DmiUePb6NpeYizEMrHHq7gUp2bG3RYeRFiZhZUW0rhulwcFbx/NAyR
         q7V+iLW4JH+II5Y3kTMUzH+eH74L0ROPfCfFPzto1HyRnqvXS8LS3D/XCMk+ENJLqFbj
         TrMzPRk7U2RUmc3m+O8JJ3ayJ8qcnJHUJWHc5ipjfAXH/0vlFdJOWHpgTwdz/YmsZLtn
         TYPN8UVWCmAAQpQo3fGBs5A5586V9COLwL13u84RHKow1V0L4yvY+60rvFD00VbBfY1/
         Jc86qwjsxxoLn+xNffwDEH3gXi+x/Y6zaLYr/WdU2+amYhRny8Ub8meEcMpUNW0oeyLH
         koZg==
X-Forwarded-Encrypted: i=1; AKwUvBxiPtpcj2Zx3FhJRAYRwAA/zyWcHQz1d+4a55wrtg9SKRvNGAc7ZRC/DiuRGvv6ORCdaKNw30nArb+NePk=@vger.kernel.org
X-Gm-Message-State: AFuF++npQlk+i8dRf05XbDqWLSJIdKqBkZUi4JyfVzRl3Y28B7lAijVz
	RvTJ0uXjAY5JG1I9OmkRlo/zuJ/xfIwHktiRAardhPK0lgW6WyE32Rf8
X-Gm-Gg: AYBFou0BgnPuLgE3iisbDVZTMv25+F5AM2eInceWgywe8NbUVf3JFDoCeXmBGhnJF+8
	nhcU+muJRiJFXpvbZ6l6Q+zg3d9kWyCTVljC4lOPapiWP9zLUpZiIwjbSzQIIlguRktcmJuEpYS
	J/1yt6prvgmd//K9tgAnHGA2k17LKxP1ZLCejqRzuY+Lql7dTRnZe3m7dAUNgijKG9O/HXNZCx/
	PZaRXnKWNAOe1m2w6dRAIXmuSzyrBo4z4myz3ObvCcg3LPpG5O2lly8QnlREtJlx4OW7SVAdZsl
	FoN7gPZzgfSNdK+WQMVSh7P3nI3SGI7NhKhAhSvcn75007WLsUrsLMpC9UswBgnZTFR1ez1bF6Q
	DIp2V+Y5IGnCnV1bPzV/FlO9Y8Dy8EkYTU43UKapCnyhvTzbJ/ZGfwiSwdnnEm5i6ZD29Q4Fg2U
	P+9eIOWAZW+BhtcbzD0s4IDLhHTAh47cZReCAc6HLbVXkeY7gq9S2O9Xy7cFJSNkbe1cGur7Bmu
	RsTLPHD4MPdBqcdOVXB0b4L0ARq2MpsXaRnXBMBbl6YW96MNef7uz2fMiJr0+Nsl3mVcXZ0dln0
	F/9x
X-Received: by 2002:a17:90b:3842:b0:398:e46e:ade3 with SMTP id 98e67ed59e1d1-39aee22248fmr14029377a91.23.1788412358993;
        Wed, 02 Sep 2026 22:12:38 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b0875ce14sm3218092a91.13.2026.09.02.22.12.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 22:12:38 -0700 (PDT)
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
Subject: [PATCH v4 7/8] ASoC: mediatek: mt8186: Handle regcache sync failure
Date: Thu,  3 Sep 2026 12:11:49 +0700
Message-ID: <20260903051150.178057-8-phucduc.bui@gmail.com>
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

Check the return value of regcache_sync() and restore cache-only mode
if synchronization fails.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8186/mt8186-afe-pcm.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c b/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c
index 44a521c3a610..143386c54dd7 100644
--- a/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c
+++ b/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c
@@ -2743,7 +2743,11 @@ static int mt8186_afe_runtime_resume(struct device *dev)
 		goto skip_regmap;
 
 	regcache_cache_only(afe->regmap, false);
-	regcache_sync(afe->regmap);
+	ret = regcache_sync(afe->regmap);
+	if (ret) {
+		regcache_cache_only(afe->regmap, true);
+		return ret;
+	}
 
 	/* enable audio sys DCM for power saving */
 	regmap_update_bits(afe_priv->infracfg, PERI_BUS_DCM_CTRL, BIT(29), BIT(29));
-- 
2.43.0

