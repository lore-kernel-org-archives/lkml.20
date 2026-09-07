Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 326F3488233
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 12:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788782654; cv=none; b=PGjdMzdJfUn0FBUc7y4ukIMGCYKIwDrpY0BTZdDmHK0UctIo4nmEXvxoBaRRZFT/s/+tgJ3F2dQ9BsnLyKRhYNF0NOFS7yAkS6A9zdfeqx3t2gen2bHJ7nVRAPoNcVVIGhUQ+XZUyJXXfRKXlTLL5NQPpn7sYF6/MK2nvdB2mSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788782654; c=relaxed/simple;
	bh=Nph2ROMLnvDhQtRDVClTwoKUmdbXNY6dbwexoUG0CYs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IHyy1VB4jftZXEI0fJ/rN/D/62Mkny5Z2dQB+PYmTlF7V48sy6NfiYwRLxZL/SxGCT4djtD/f+08EzZxVNDh50n7PJkirp1kSgaul8UphJY2DysI+O9kv09SUwpRxCoyGlCt2KSm9vmFaBAOhpGUGyjzOFisZoqoDHJIOdNLSTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O8oEN0gn; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O8oEN0gn"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2d01663d816so23601885ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 05:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788782652; x=1789387452; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O7h2S3qXgjH0d2/zuTeGXDlTjAza128Ox3NWLM9is1c=;
        b=O8oEN0gnNgk7F+Y3+m1u/T1vocboO7ZJF6y/iXWBjatyrNwkSyABBH0pTrgrcti9+W
         3dL/MY2T7bQ5ZfldgvgkuoHlIKFlSqqjwZcCWXO6OblfDCihZK3sYKYT9g1K6+jxI1Xn
         kWJCta6KiqYKSPN/1EyRJXqKU4noaJcfhwoFVkr70pg76eXZWi0TrFtYD7i5E69lFInC
         YlGUeXCTAb31eUfkL8eM2WrWNe2Dgq582HaX0sl84JyqbfP+pCr/7SjK4yRaAPBl9Ao0
         KX8kAJmkYij1HicRT7rPG14p8KsuJEyl2XeT7VTWdv6S35SINsnaOwOuAjcau+UCpeO5
         ZTVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788782652; x=1789387452;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=O7h2S3qXgjH0d2/zuTeGXDlTjAza128Ox3NWLM9is1c=;
        b=IhMKxrz8lfNxp3AR+s29MJhAwjyWVMXY/3DvcBBei0cxknffh3+TSv5iXDt8Le0LH6
         LGlYkVLsGAVh/lc6GL7liHPSovyCxDLBk4R09PC1QQSCGPrUnTU7oGAdejYhzbVQ6BC9
         3h2NUeBxLV4i59XJv1WiQLv7NB1LqmSh4mLBk8PLFPpvpMAV0ga+VXrjlDqKwTa8JKVY
         19J/EhirIlYa8hwGt7SlrxPrb1IVr3GCRCHPzFAFNXITjhc9P9QzmrurCxCiytcoCyak
         Wlx6YvMfmp63FSMSogXzTaDfAcKlYKTdXtQ+G5j7wnKCJjGVOzjMT3ql/vzBkddn7KiF
         poNg==
X-Forwarded-Encrypted: i=1; AKwUvBwjLc7GSwyVdesirOm98PAZh818r8ThJ0W9yyvRZkYeNRE7vd0J3XeerixHeCA9bcUFgo2WtI/VtuDl4SY=@vger.kernel.org
X-Gm-Message-State: AFuF++lKeMIBinnYg/5wt9HsBwwRtbG1PladOWMnMjIDUvEoMI7/IL6i
	5ALyH3pHh44+eO1dlfxmktMswZKNwPUaVqBXCuyudWwNeaD8vCzlUNiM
X-Gm-Gg: AYBFou1NWse4STFdL4jhwqyROXFDy4DvUI1zMAPuC4ypCQuG08GJZ1t8FklJP+Ge9F6
	nO2CsMW86NlWARusX/cN9XBX59irnMTKAUPtqCQZ+qLBQb4VvNPLOUAerQSAHRuXvxDTx1YLabx
	1Hhp2aLedjAieHx8E5hj48zxRecJrZWa6Hmf4sCRxB72UNjvj6xluHTt6raDmz6a9iXrWY4f/Iw
	FkAUFIBAYvHw/ZhTokCe7+R0/U2eoqeVnuQJNPJVmrLtGXEYR3ItTM5tMFlCHCx27rKNuVpyMST
	wHFqm+5mUeqpTtLoR7qBxsPbPWFy6NnZk7k4EWdHLV6J5TQVGKeYEX01gE7RZmxU6XvNhswXdSn
	pZlCFYy/eIq+GEYE+Sa3mx4fskv0CCgzHk1ZtEz6zIP5eEm2KlFZR2xXvCEZ09YH9Cc5RbshK8T
	JSeI5KKQ3mblRaQ95nzyXk+bg0BAPKGluRyc97p93E+xk0NFpmgXXKid1sapo0NQqb2zq8WQwi3
	+cJQaTUBGpCIaX3DFr5l9HXByVzno5ViqhcL5Jw2byaAnWK3R6jke0aFWk7kf8yWQ7yxRZUzcww
	baVK
X-Received: by 2002:a17:902:ed8b:b0:2c8:2808:3ec9 with SMTP id d9443c01a7336-2db126d8fc2mr211708425ad.12.1788782652165;
        Mon, 07 Sep 2026 05:04:12 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db14ae85eesm43064815ad.82.2026.09.07.05.04.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 05:04:11 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Kees Cook <kees@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Trevor Wu <trevor.wu@mediatek.com>,
	Douglas Anderson <dianders@chromium.org>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 7/7] ASoC: mediatek: mt8188: fix clk leak on error in audsys_clk_register
Date: Mon,  7 Sep 2026 19:03:10 +0700
Message-ID: <20260907120310.135693-8-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260907120310.135693-1-phucduc.bui@gmail.com>
References: <20260907120310.135693-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

devm_add_action_or_reset() is called after the loop that registers gate
clocks. If kzalloc() fails mid-loop, the function returns -ENOMEM before
that call, so cleanup is never registered and all previously registered
clocks leak permanently.

Move devm_add_action_or_reset() before the loop so cleanup is always
scheduled. The clock from the current (failing) iteration is not yet
stored in afe_priv->lookup[i], so it still needs an explicit
clk_unregister_gate() call.

Fixes: fd67a7a1a22c ("ASoC: mediatek: mt8188: fix use-after-free in driver remove path")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8188/mt8188-audsys-clk.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/sound/soc/mediatek/mt8188/mt8188-audsys-clk.c b/sound/soc/mediatek/mt8188/mt8188-audsys-clk.c
index 972f097a13ca..9f3b3a777577 100644
--- a/sound/soc/mediatek/mt8188/mt8188-audsys-clk.c
+++ b/sound/soc/mediatek/mt8188/mt8188-audsys-clk.c
@@ -170,7 +170,7 @@ int mt8188_audsys_clk_register(struct mtk_base_afe *afe)
 	struct mt8188_afe_private *afe_priv = afe->platform_priv;
 	struct clk *clk;
 	struct clk_lookup *cl;
-	int i;
+	int i, ret;
 
 	afe_priv->lookup = devm_kcalloc(afe->dev, CLK_AUD_NR_CLK,
 					sizeof(*afe_priv->lookup),
@@ -179,6 +179,10 @@ int mt8188_audsys_clk_register(struct mtk_base_afe *afe)
 	if (!afe_priv->lookup)
 		return -ENOMEM;
 
+	ret = devm_add_action_or_reset(afe->dev, mt8188_audsys_clk_unregister, afe);
+	if (ret)
+		return ret;
+
 	for (i = 0; i < ARRAY_SIZE(aud_clks); i++) {
 		const struct afe_gate *gate = &aud_clks[i];
 
@@ -194,8 +198,10 @@ int mt8188_audsys_clk_register(struct mtk_base_afe *afe)
 
 		/* add clk_lookup for devm_clk_get(SND_SOC_DAPM_CLOCK_SUPPLY) */
 		cl = kzalloc_obj(*cl);
-		if (!cl)
+		if (!cl) {
+			clk_unregister_gate(clk);
 			return -ENOMEM;
+		}
 
 		cl->clk = clk;
 		cl->con_id = gate->name;
@@ -206,5 +212,5 @@ int mt8188_audsys_clk_register(struct mtk_base_afe *afe)
 		afe_priv->lookup[i] = cl;
 	}
 
-	return devm_add_action_or_reset(afe->dev, mt8188_audsys_clk_unregister, afe);
+	return 0;
 }
-- 
2.43.0

