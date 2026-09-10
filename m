Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B4C0463B6E
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 12:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789045098; cv=none; b=gTwEojVtQC+H3xGJnrmNpZsFF7rkmLLTFdZan5t5pPbeqynCBF08TpK/SthKDKnW1aRFwboaKnpgjezDtkWHM8EpwcZIkFPvMq4tLnRSgFSnXSkN84o96HS2Z/CPCGCIzMEzhPkAnRMAxOjjaUiqWaA103lrnZ5AqA8VYrGTMvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789045098; c=relaxed/simple;
	bh=gxw3C5/yz8ul7f7LJNdtEH1VOBy0BfPp0Uf/l7ubhrE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gUSq3fZ2M8bLAo4bWWq7ZGZtfJtlolsq38VQPpXHq8ovc8ZcwhG/qknARLv1UrtQO+/6wNo7OF+326k7f4ro1/T4muHnh5Cx87TGqgfnrwW8KSKSaAFTH7neNZm2kaRIP+Ma2ppnCRb3CMqPzKWXGLYCTJh8KQCZ/D9kVTlUB3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hufIA9G/; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hufIA9G/"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-39b31b4281eso1367867a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 05:58:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789045095; x=1789649895; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ap1gX+PkBizjl0Oij+OVCGBkei2bcoaYLfDjuKETX2w=;
        b=hufIA9G/ggefXX0rfNyF2raSWNK3tZ5ieqR7Zjmv7m/2QIpe3gt/QDl+86TL3fnzw5
         QXJk9Y4u4ttmxXtuZn8wM31meINvmzu6vMp2NdG26pmJ57cbCVrAh4Lhx3vEIpAjklOT
         0pGXuaexVUmu5KNR9WFtu4JIdk5B03cmVnCmMVPrg4rYTfr2mh+z5Rn1So+WSVeHjFyb
         GbK0KQ6b4P+QCJpoApjEtSJpKi4UscLz/y7uTpl5zJeRgZkFi6svn2akAHLwMxL1yH8y
         hBUHMxPIaLkUmfpT+zoOEgLbJgcpBP4HSuHI1Zgf4O15e01f8q13rvHb89bHjBmFb9G5
         4Fxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789045095; x=1789649895;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ap1gX+PkBizjl0Oij+OVCGBkei2bcoaYLfDjuKETX2w=;
        b=qWOPMQf87U28NOwXL5A8RY6KKz42dy5Lfh5wmg0k8JfrAXeJRXhUQScoTjzWS9v3/N
         D8SMHqF2ZfKXHbxybkNlE7vLnI9tp2f8yWVMYDhra2+HHb7ATdneLmqRqxffwCbBpVlh
         e9iBsidhIa42pkmDr4JxXNndO/ZtKBgVaNjUc8gmZJeeQonJD+zKvLLwnYnbtdPrpBVy
         PrsOUg/4H6bOIjlCx9WYRAenaILKkJ1x5fM4WxaGzy8R1TMlLmjYAWesdO8ibgF17ZdG
         6C4W6NlRKHOMAmgyZ8T6eazZrD1y/T5LJPzC5QxiIMTc7ByeuOz1UI2Mz3z1C5Vy6HrY
         A8Iw==
X-Forwarded-Encrypted: i=1; AKwUvBwRaQQU8TdiGXvPEILCrkmRdezowKk3nVxUCSa0TemWDyt8Y/DAIOIh0lZJf66Zyyg85iAiKlhs5D4PLsQ=@vger.kernel.org
X-Gm-Message-State: AFuF++mVjYWic4YbpnkSxbTbZUXZSgA4CYF39QXuaIyIiXBiiNmivwGL
	qOWDUlOFPdKZAK7ALk+LCs3YNgsL8P2BWLFEKYPchvXiFNK/mYgIvd2v
X-Gm-Gg: AYBFou2krAU3Ns14YRrpRb0NbM2CAL8K+GAf0X3RuG51RPVu/pCmG2TOzht4Qv40+G4
	2XONpctHc09Eg8f1sUSBtu+G5yKhF6s7LgF/aFhobcLl4yCtnY0VqhqO6taJnNWcbVIHGYGfWnL
	+xiYl8gHV+x92Ys8Fwxy3qZwA/BYfTyYw6k1tBl49utFrcyD+uC70LWtu7dA0pKJHJkDyP2z2JN
	ySrkllYC2akdl6p/1q8JZI+z2n7kpIOu/A+tRoBZV+E6YLaqambbhd+wXn6dz+VN9oPC3UH2sNK
	NYIn9aOwcsnhqKnojUKYDbKbPhWqkS3KDZOftrYbrnmYpxp4r3jxNPwncuQXkm/nB9atc8ZPFin
	A4XhFTGCnfWKQCbYh08rKGRdl3NwJqmr5m6oJZllW4LRqMPJUMwGB3gIwE4YcM1qhlp9se8LRHg
	zAwSTkxz090cfbE7BWIpa5+C6nmjP7l091B4HP2lvQEF9M3dwsI3GEIJuJoo82wZLrwRjAWJzcR
	9VYztBXz7ZfpPwbSY2+Ykwrmz3C8x9+QZZCR5NCV3Z04LpjC5Pq70xWVIOZR5xha1nYezoevFOj
	Scoecy3DhmSG2eA=
X-Received: by 2002:a17:90b:2b43:b0:398:ab03:95b2 with SMTP id 98e67ed59e1d1-39d709e5464mr10985783a91.10.1789045094591;
        Thu, 10 Sep 2026 05:58:14 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d7e77b1afsm4891592a91.5.2026.09.10.05.58.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 05:58:14 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Cyril Chao <Cyril.Chao@mediatek.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Dan Carpenter <error27@gmail.com>,
	cassiogabrielcontato@gmail.com,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 03/13] ASoC: mediatek: mt8189: Propagate MCK enable errors
Date: Thu, 10 Sep 2026 19:57:32 +0700
Message-ID: <20260910125742.150902-4-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260910125742.150902-1-phucduc.bui@gmail.com>
References: <20260910125742.150902-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

mt8189_mck_enable() currently returns without restoring the clock
state when setting the clock parent, enabling the divider, or setting
the divider rate fails.

Propagate the error and disable clocks enabled by the function.

Fixes: dc637ffeed6c ("ASoC: mediatek: mt8189: support audio clock control")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8189/mt8189-afe-clk.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/sound/soc/mediatek/mt8189/mt8189-afe-clk.c b/sound/soc/mediatek/mt8189/mt8189-afe-clk.c
index a901be97e75f..933179f2a5ba 100644
--- a/sound/soc/mediatek/mt8189/mt8189-afe-clk.c
+++ b/sound/soc/mediatek/mt8189/mt8189-afe-clk.c
@@ -639,7 +639,7 @@ int mt8189_mck_enable(struct mtk_base_afe *afe, int mck_id, int rate)
 		ret = mt8189_afe_set_clk_parent(afe, afe_priv->clk[m_sel_id],
 						afe_priv->clk[apll_clk_id]);
 		if (ret)
-			return ret;
+			goto err_m_sel;
 	}
 
 	/* enable div, set rate */
@@ -650,13 +650,21 @@ int mt8189_mck_enable(struct mtk_base_afe *afe, int mck_id, int rate)
 
 	ret = mt8189_afe_enable_clk(afe, afe_priv->clk[div_clk_id]);
 	if (ret)
-		return ret;
+		goto err_m_sel;
 
 	ret = mt8189_afe_set_clk_rate(afe, afe_priv->clk[div_clk_id], rate);
 	if (ret)
-		return ret;
+		goto err_div;
 
 	return 0;
+
+err_div:
+	mt8189_afe_disable_clk(afe, afe_priv->clk[div_clk_id]);
+err_m_sel:
+	if (m_sel_id >= 0)
+		mt8189_afe_disable_clk(afe, afe_priv->clk[m_sel_id]);
+
+	return ret;
 }
 
 int mt8189_mck_disable(struct mtk_base_afe *afe, int mck_id)
-- 
2.43.0

