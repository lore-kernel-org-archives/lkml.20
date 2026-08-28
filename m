Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C31AA390CAC
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 09:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787908582; cv=none; b=ejCvcq0CLxePP3fZbbBt3B5WcoKkZuuH4Y1+/qJkQiiNksn8Tz4iM+BHvGUyzOK+iN7wsIoKOiDLdmEfFfp2dZ0KD9XMa9hb1qbqa5k3xy9XdD09O00FCcOzo9bo56vnjc1dX7rS/8APV+ezgb9egMJz7ylLIqdbnKlffxj66lI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787908582; c=relaxed/simple;
	bh=DdqB6KbiIKlpMDTCTBrubAh+8Ofs/e0ikTAPMvgixQY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pKjQZZkqbhkhHRsFZUoTxK7p4zGbHuFPKQ4tXCF/LUiBwyCVmU5fTlcQsv+14XJE/6e6d1RyEcoXwhy0MlSX9vtkhYSwYDwCSrvuZK8Awoh44p7NTdiJMKaKvxe01hiVIgMGX0Ho32Tx7MZUQm3nrEC1MkCYXZVhuOvYWUAmQK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n2JAEPkI; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n2JAEPkI"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-854f8068301so538473b3a.0
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 02:16:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787908580; x=1788513380; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3L4YTV08OIKXaB2YzOzTLg/mRS6RPqOe2hfmq9TrFik=;
        b=n2JAEPkIlIgEiPokERhTKRE3hGQq1jMkJfNOrT9baB8zhsI0GgDPznzRWGdszuMMoP
         ApdcXarQoBYjtnABL2nlmmDgJNvFMaKvFPUg+QEFoaicuxB2bot2A2LNGfV+RR5f6PRC
         3P2m6G6bhE/gf8zA4eeB7Dcfvq3zJcfgeUL0hkwGWll7GDq80W7j4BSoTF1iHKSxkHx2
         1ymHlZ1itvfbjT18LKg3ld7Z/U9lb4TTF+CQ+J7eqjQ4fASRwPdsE54kr2zJ3jMVvfAB
         aQ/ON3lvJS9HEPnKjry/X1tXmEDlIXsQIV2l/PwDqZpK27m7HejKnJyv9sK/x4Qgc7kH
         PRtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787908580; x=1788513380;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3L4YTV08OIKXaB2YzOzTLg/mRS6RPqOe2hfmq9TrFik=;
        b=DKcmckxePC53zAxT8moAUvbuVycgaGihsEUX7Ci1FS6QIiSZOhKmO2UTwXVi5k4eBU
         7yjT2Phb+6JUZ0Lz+o/3dwM4h3fJ3+DKdsJr+j8sHMXnvo1hPX5lpw6v24ZqHY20kb+E
         x+E7X4wK2iGf0xVSSv7p3+7gmSQRExrIFNJnyS4dT4X+gnpQZz+Khc7uv1LmG9RO/nEo
         0axC0denSO0WKQdCfOFgizgTMvOvbBnyzQCHoyBwKbP/g4M1SJNglfExPWTtVUpX1V2+
         8WnmilAJJH0HsYAOuVnc/DBC3khwVRf/jrYDwTe90f3Q27YRPWx1xFIswui4Mg3Z1efr
         EKCw==
X-Forwarded-Encrypted: i=1; AHgh+RoD9ePJ6hPlAyImdTsh8ZDl3r4Xx4csCBtNjgi/IgHRJo7B0dKy7d11t0yLYoVxQ6omRo1hXE0bnxqBVys=@vger.kernel.org
X-Gm-Message-State: AFuF++kxunPKqZYvKq6thJce+swi+9diGSU7ghZB3qAkvHDYu9BcN8it
	5zXZbaresOVgLiy3TplmZKBT45hNRTv8feJ/EGkudBkXOEfjgHIpsg7g
X-Gm-Gg: AR+sD116PkmBFZKubgnNuSc5J5/sS0oqwORaFSCxs0IXMUjDAm59Rop5k16Z0MSoOEq
	rTBu6EQPGPw3BajQedm55NJSZvkX4OUrEo67aiJ0TYGZCbwglLQHS0uHNW/4SjiHVyfZZWVNxV6
	lsqIvUmJrkeGA2SNsyBi7IqlSQM61COu4yRZ92vXg2mLDmfJnOmE4GUqFh1YKDQAibyCdDjPBQ4
	qn+u+GT2V09NRdyo5B67xR4XG4qlyOrZBNtrRLfFiU1nd+nj/rPASLncSSo4a/YQ4OVXgrYiJoW
	GbWC1vsjNI4KRQgJuF1Vg9St1cmlJix3IuZ4Ldo3qxywuUR1HQKEDd/e8Ic00vaPlmjC52RHKXr
	iQQCf/pXGxLfVtRRDUSkgUr8RtCG4fpDg+NTrx6POQbWZcGL/gEKfU90zM3o6bi2fcTdqp2Kmyk
	BVUdkuligMu4z+nloyiAnkkqfI/xYVH5hT4fNV4VKAAiSTPZxPJpDUMzHKIdSSjaUYlYGlHoLeI
	gJwZfdeIamDdIZHdvHlX/pBYu1Tg/NxoB25qE7qnxqOQNJEoSB4gN1bNiEMdQlYJxdIfzG0iKv1
	xDpp
X-Received: by 2002:a05:6a00:4109:b0:852:38ea:3fd with SMTP id d2e1a72fcca58-85629a252e3mr11093863b3a.11.1787908580220;
        Fri, 28 Aug 2026 02:16:20 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8569fe78fc3sm381248b3a.24.2026.08.28.02.16.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 02:16:19 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v3 5/8] ASoC: mediatek: mt8186: Fix MCK error handling
Date: Fri, 28 Aug 2026 16:15:29 +0700
Message-ID: <20260828091532.600047-6-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260828091532.600047-1-phucduc.bui@gmail.com>
References: <20260828091532.600047-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

The mt8186_mck_enable() function returns immediately when a clock
operation fails, leaving previously enabled clocks active.

Add error paths to disable previously enabled clocks before returning
the error.

Fixes: 55b423d5623c ("ASoC: mediatek: mt8186: support audio clock control in platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8186/mt8186-afe-clk.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/sound/soc/mediatek/mt8186/mt8186-afe-clk.c b/sound/soc/mediatek/mt8186/mt8186-afe-clk.c
index 85fe828ca5ae..6d2871254e32 100644
--- a/sound/soc/mediatek/mt8186/mt8186-afe-clk.c
+++ b/sound/soc/mediatek/mt8186/mt8186-afe-clk.c
@@ -528,7 +528,7 @@ int mt8186_mck_enable(struct mtk_base_afe *afe, int mck_id, int rate)
 		if (ret) {
 			dev_err(afe->dev, "%s(), clk_prepare_enable %s fail %d\n",
 				__func__, aud_clks[m_sel_id], ret);
-			return ret;
+			goto ERR_ENABLE_MCLK;
 		}
 		ret = clk_set_parent(afe_priv->clk[m_sel_id],
 				     afe_priv->clk[apll_clk_id]);
@@ -536,7 +536,7 @@ int mt8186_mck_enable(struct mtk_base_afe *afe, int mck_id, int rate)
 			dev_err(afe->dev, "%s(), clk_set_parent %s-%s fail %d\n",
 				__func__, aud_clks[m_sel_id],
 				aud_clks[apll_clk_id], ret);
-			return ret;
+			goto ERR_SELECT_MCLK;
 		}
 	}
 
@@ -545,16 +545,25 @@ int mt8186_mck_enable(struct mtk_base_afe *afe, int mck_id, int rate)
 	if (ret) {
 		dev_err(afe->dev, "%s(), clk_prepare_enable %s fail %d\n",
 			__func__, aud_clks[div_clk_id], ret);
-		return ret;
+		goto ERR_ENABLE_MCLK_DIV;
 	}
 	ret = clk_set_rate(afe_priv->clk[div_clk_id], rate);
 	if (ret) {
 		dev_err(afe->dev, "%s(), clk_set_rate %s, rate %d, fail %d\n",
 			__func__, aud_clks[div_clk_id], rate, ret);
-		return ret;
+		goto ERR_SET_MCLK_RATE;
 	}
 
 	return 0;
+
+ERR_SET_MCLK_RATE:
+	clk_disable_unprepare(afe_priv->clk[div_clk_id]);
+ERR_ENABLE_MCLK_DIV:
+ERR_SELECT_MCLK:
+	if (m_sel_id >= 0)
+		clk_disable_unprepare(afe_priv->clk[m_sel_id]);
+ERR_ENABLE_MCLK:
+	return ret;
 }
 
 void mt8186_mck_disable(struct mtk_base_afe *afe, int mck_id)
-- 
2.43.0

