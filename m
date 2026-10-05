Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5159447D44A
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 11:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791198201; cv=none; b=K95MHPxR5DD/S3UT4JONU3DElaoJM1tt7nO9GQXlzTFzD9hgTjiTRywRAv1FG0IHEJ5Q+tm6Xgc4QojSH5DPXNhXBA0ejk4QhY2HOVfl5fs7MlyxYZiTK+JVIgf42XB85rI5fM9QEiHSOBfjuSIWw6fwbHvPWH95/OV/dnDiXwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791198201; c=relaxed/simple;
	bh=BqOIdOWIc7Bbbr8ZxXOpLUQh36ChMcfJeTwhKtu2ZR8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l7U51FShsUajmwcGC16ZgtIfniYWtO4b0jUVd3WAwyPGcSbC6aMl5F1ZK7aTp4cJ63YvySQj9RzPg6gWCQ9ohdDHtIspjwDXmn+b30jct5oWMi4YPAtq++nHAwmgJXQsyXtaRitMbMZcFB6Dy3IoCu6YCSDG05b+99g/ZDqGBjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=seCWvC6f; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="seCWvC6f"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccc02279so903407a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 04:03:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791198200; x=1791803000; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dtvWIRp9yO8uIIIbpOsaLthb3JvQZmMy0vJI9vWrQ+o=;
        b=seCWvC6f5l8DPz1JfzsJ5wIlxiqDMr5AQRu0WJvXKYsSNlTM3W1YrlYMyoh7ka0JVy
         oAQjqF+BJrbfDIwU9UpcgiTVsBCpof+Azmxz+jN/xMKA90EUCVrOAgb1SrpCW8sM81Zm
         3/UqEeYQUuiAzIgwWuTt2b2LRNRguQq/7lK3UYd68AZCxoruOfRjcWW52qBNUH70fF0T
         HlrROtgGcbpikdHBABKGNHmavwfuOlUeg/7skOzOGVMO6Uy6dP8DNQI9vXND/qetH2l0
         NAYciNiFj0Zj7IVleiexdmYOb6OcwtaKo9VoXkXDpCiMasTPn52825SvgdeaOzA+8Noh
         sURQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791198200; x=1791803000;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dtvWIRp9yO8uIIIbpOsaLthb3JvQZmMy0vJI9vWrQ+o=;
        b=YFOWjAWsXLi5IFRxYp6U54//u8sV2QR36yB7LmC2rgOnEi+ocIhIOicRTOnmasR8HC
         bUGJE597BZ8Kur++9JZOr38O46YFlua3hEFDr+JUSOku+M/hDlHkJetj5iXezqFWg61c
         tIw90+JZ0OGIXVXs5SQ1xYjBbANZZHE4xWCtyz22xwMDOAABdeRP2lS23EeUBdC57cfX
         fv1ce4tjYl2/V4B2d8+t9rXgMX18fyncNaz3B8s+L63dhM4rxDJbMD/aE6YgMxGg2Tk5
         hD2IXC+hdj6gdKI2gKPTuxKX/cJ3XPkOv8TpHO0O6+pxqMujcDNDkCBv52s0LqfFALno
         Mosw==
X-Forwarded-Encrypted: i=1; AKwUvBwWvt71VsZ2eA5im5nH4HjOs40KOlwDlm1h0jA9WgOP/HAqmvfc0CCJLVzAQgvPHkREyR3M09jspF53+cc=@vger.kernel.org
X-Gm-Message-State: AFq9FYL63I3dReQROXDkaskJcL0+3bZUPWIFYUj9do2e9WMBkoUrnRNd
	ABVMI3pi78RbqNFCtQRhUCrKU/qiqXMf/vBr8adFkNlmZ/Y3JytULqaj
X-Gm-Gg: AYBFou2q8Vgo4eLP0IrXzQUlT8L0soF7nV1h2GqBZxFct5N6FwNsPMPr+nBpLiz+icU
	t/JD4aeyxipKaLJDXCuT45RCG6rq0MfjBlSLGcN9mfL1JEcOfRnP2zv3YxWMZ5hkV542Q+5RN8p
	SxAOCwiKYJc6YxYXnzDZ5QrHaZZGVfL+s5wW89z40cGNwJeRgbK+QZ2r1NMCW3RAA13KfkoMSLM
	T7za8FeYgz6lw/4V2B/Dp3dz3o52C7grXY4VCeNLtVuVN9ypCSUc485Z+heRoldRM6j4nKZ7X44
	PXfdKlNOTjrVByjSWpaIc/Se36wq551Nd+3o2fYepP7i7ynq3xnkQSry3h6JyKe7Om0/ikUP7Or
	OY6fE8CJdgArE/RyjBuy6XHcx4Ji2z84DiPyz2wMxv6kjb1+iFcZ+p0/PbOU2DexhEgVW087se1
	3ykV5+V4e3MxRZOYBTlTEu7/5F/ctDn/nVn1jQXXf0oMkArV0BhH+1Wqfj0WLN3iYydHj50s6XK
	nVnM3LBXkJc4ekT1xIWqvrb3vu/TsccaeMbEzihFoBFctqJwDtPRbau3J6mok5WV+nkDtobrq4l
	F3M9KTE3yBR5TQ==
X-Received: by 2002:a17:90b:586e:b0:3a0:f5fe:74d9 with SMTP id 98e67ed59e1d1-3a6ce3a97e0mr9329608a91.4.1791198199561;
        Mon, 05 Oct 2026 04:03:19 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cce6d334de5sm626498a12.11.2026.10.05.04.03.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 04:03:19 -0700 (PDT)
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
Subject: [PATCH v2 01/14] ASoC: mediatek: mt8195: Fix tuner clock error handling
Date: Mon,  5 Oct 2026 18:02:44 +0700
Message-ID: <20261005110257.50145-2-phucduc.bui@gmail.com>
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

Check and propagate errors from mt8195_afe_enable_clk(). If enabling
the tuner clock fails, disable the previously enabled APLL clock.

Fixes: ff5a90173d98 ("ASoC: mediatek: mt8195: enable apll tuner")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8195/mt8195-afe-clk.c | 24 +++++++++++++++++-----
 1 file changed, 19 insertions(+), 5 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-afe-clk.c b/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
index 618d8400913a..ec1ea5b988ff 100644
--- a/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
+++ b/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
@@ -241,21 +241,35 @@ static int mt8195_afe_enable_tuner_clk(struct mtk_base_afe *afe,
 				       unsigned int id)
 {
 	struct mt8195_afe_private *afe_priv = afe->platform_priv;
+	int ret;
 
 	switch (id) {
 	case MT8195_AUD_PLL1:
-		mt8195_afe_enable_clk(afe, afe_priv->clk[MT8195_CLK_AUD_APLL]);
-		mt8195_afe_enable_clk(afe, afe_priv->clk[MT8195_CLK_AUD_APLL1_TUNER]);
+		ret = mt8195_afe_enable_clk(afe, afe_priv->clk[MT8195_CLK_AUD_APLL]);
+		if (ret)
+			return ret;
+		ret = mt8195_afe_enable_clk(afe, afe_priv->clk[MT8195_CLK_AUD_APLL1_TUNER]);
+		if (ret) {
+			mt8195_afe_disable_clk(afe, afe_priv->clk[MT8195_CLK_AUD_APLL]);
+			return ret;
+		}
 		break;
 	case MT8195_AUD_PLL2:
-		mt8195_afe_enable_clk(afe, afe_priv->clk[MT8195_CLK_AUD_APLL2]);
-		mt8195_afe_enable_clk(afe, afe_priv->clk[MT8195_CLK_AUD_APLL2_TUNER]);
+		ret = mt8195_afe_enable_clk(afe, afe_priv->clk[MT8195_CLK_AUD_APLL2]);
+		if (ret)
+			return ret;
+		ret = mt8195_afe_enable_clk(afe, afe_priv->clk[MT8195_CLK_AUD_APLL2_TUNER]);
+		if (ret) {
+			mt8195_afe_disable_clk(afe, afe_priv->clk[MT8195_CLK_AUD_APLL2]);
+			return ret;
+		}
 		break;
 	default:
+		ret = 0;
 		break;
 	}
 
-	return 0;
+	return ret;
 }
 
 static int mt8195_afe_disable_tuner_clk(struct mtk_base_afe *afe,
-- 
2.43.0

