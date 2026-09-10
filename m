Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C35F488221
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 12:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789045107; cv=none; b=iM7CpU6vFZbRCO0A+BSJv61JU8WjAFi3+ghdfqNO89gtNPQKpaXXsMOBMmJDNWcHXlFie2k9Ja4vjGJU0fuhviHCc5kVMmNOkl9c5bVXVBCFNm5UgN5H31ZQ5kFs7m9iqQ0BkEzt+XhhTfRlGZgJeAXvZx2XLAGhB/hkKSDvLzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789045107; c=relaxed/simple;
	bh=sIdjIJnQzzDHHd3jtn8HXsF9ZViycOy80c1qBL2u6LY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GRpUcLI0e3wxvL6pnUk3ivbwLsX58XVOPsd1o/G3QRPt3mUqIp1cqsjzdGCLCFdDpr8wu/yJ7Bz+4B1Upn5cE+kDOnr0GjJO89QwTBowk8G5gacVUDtfAl6TXzJh2thxNwy/hhi146IJ3WVY9bos1KSli9SNTbCmCRATYFw6mxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G640F5VX; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G640F5VX"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cbee846deecso988558a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 05:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789045104; x=1789649904; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DhFmxksn93jaqEPBP5cg3W4kPZXQ3iAg4tUPjfm3otE=;
        b=G640F5VXxl5Z4GsUfiAe0sX6murh8Fmg/yQPi8pLB+bXb+JjrJF/E+r5xGV4q+gSls
         yDAKzDTIqChG10Mr7CWu7VEF8up6HX+fHY1lnD8BzXoInwZtodul6yW7pyAS5av2/N7U
         p/h/wW8rweSTY+hjhsPNnmWUCnPDnb+gUVpx1p90nFoQDgYiCFbEIWHeoT08WMYnfW2J
         29ydoitEeI5VUSetPblsFRClYlh6FcBtorR5WcBIk2GsqqQkKBh6pPK6qYRony1apwDg
         1V43+6CqEd165A4RdYT6Ps0FS/S7juH4Ejp57KfTZXKX0GUBt27igXspMNqRQj9KwHHM
         YGhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789045104; x=1789649904;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DhFmxksn93jaqEPBP5cg3W4kPZXQ3iAg4tUPjfm3otE=;
        b=AE3H78PW2hriRp4w9Cgy/020Dd2qgmVNTmy6yjT7ZgDtR1XLk0KjT9VhPbja7gh0hj
         g8rxkr6pf0hFLSY8izQvQt6DQSyaiL0hc5drLO/EKwE9rlBWQT3oUnW0Ft+7Wv3ueC/Z
         rZNOK3nOAeoR/8yYuzcyzdrIIMij8qI9O4UWdtDTfrlfl9oZFL7sE4Zv9+K8Upz+dRCg
         Ry0ivejceGhjDGNCgfUJDtNxeRDzE6fBe5mXCGfoWHfRcg5dOkE45EwMOLWIFOAxc7y8
         sbnuxRKWZ7ZmMEoWLCAXCWm77eIgBE6PkKoWdaByHNkjHAFKcVEb2ZaRKwiujOGcNqCj
         b/Bg==
X-Forwarded-Encrypted: i=1; AKwUvBxO+VLIs2bSR9ML5N3mGeiw8MuIU9ky3+1TZ1dz3Dn7vugG47avr0n6Cxl8hRE+G1V5UoKZMHFSO8tPrJc=@vger.kernel.org
X-Gm-Message-State: AFuF++mrPb1nzjY4q4SrQVGNQAt9Fi6JwDC573QZwY+YrVlHU4b3nltl
	JGIx3DFEsl4JLW81Tg7tn4E2OPylw1ilVt/QJYByqamxLRQ1G4ytrPLj
X-Gm-Gg: AYBFou3ke/8hCyaJRu9sPPVyorY1YlAczF1jo8tZgX2M+CYnopY4wENlhG7P+8sdH52
	TH4ydUBDOKcmAH3SXOCNZ93psyI6VyBf6eFECXjEWRlo6jA3T0qVPMgWpy8yg2a/Jz00OxZfq6P
	n8L+JZKPFIyknmRZpGgXQ7uD4x34fI/d3qhdC6UyEB5d78Y4mKxQ8VAHkXqyDKDB/TJIksPOrce
	B7aIOF9i6RTMkbsbfGan/1S52+YsTsuETAIsyey1lB6vZQU0KEjAlbEoCLLwoxQKqCQ3PgBqeDm
	XzbaDpaAb1ty63UXeSlYDzD1xXQAG9C9hCMnQZ0BdKcf6MHWmOjyoCBVxtpmKZpnbJn+VROdown
	9vxedKJXDZ/I4BK8/AjQXV3p9rZZpFcGNMCsnpz7LpcFupkyhTvP3Z6631PMi5swyKNEYmR86/v
	4qyE8hDufqywNx/Oa3FjtKe2SILlhcx7UhC152P4Bw3It7kP5pvhcfPkKGuNf88JRv+v+8ovjCY
	lF6hF7k75/S74TO2r97PzzJoLhiGZ1JmG7k15WzpczgvPY0CkGHPn483/JCoZDRE+iKMwlO92eK
	+/GALC28IIim9kc=
X-Received: by 2002:a17:90b:2e0e:b0:398:9be5:b419 with SMTP id 98e67ed59e1d1-39b2622bfecmr60688528a91.20.1789045103695;
        Thu, 10 Sep 2026 05:58:23 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d7e77b1afsm4891592a91.5.2026.09.10.05.58.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 05:58:23 -0700 (PDT)
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
Subject: [PATCH 05/13] ASoC: mediatek: mt8189: Propagate reg_rw clock errors
Date: Thu, 10 Sep 2026 19:57:34 +0700
Message-ID: <20260910125742.150902-6-phucduc.bui@gmail.com>
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

mt8189_afe_enable_reg_rw_clk() currently ignores errors from clock
enable and parent operations.

Propagate these errors and clean up the clocks before returning the
error.

Fixes: dc637ffeed6c ("ASoC: mediatek: mt8189: support audio clock control")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8189/mt8189-afe-clk.c | 31 +++++++++++++++++-----
 1 file changed, 25 insertions(+), 6 deletions(-)

diff --git a/sound/soc/mediatek/mt8189/mt8189-afe-clk.c b/sound/soc/mediatek/mt8189/mt8189-afe-clk.c
index 88f15a9c2513..435914aafb44 100644
--- a/sound/soc/mediatek/mt8189/mt8189-afe-clk.c
+++ b/sound/soc/mediatek/mt8189/mt8189-afe-clk.c
@@ -700,17 +700,36 @@ int mt8189_mck_disable(struct mtk_base_afe *afe, int mck_id)
 int mt8189_afe_enable_reg_rw_clk(struct mtk_base_afe *afe)
 {
 	struct mt8189_afe_private *afe_priv = afe->platform_priv;
+	int ret;
 
 	/* bus clock for AFE internal access, like AFE SRAM */
-	mt8189_afe_enable_clk(afe, afe_priv->clk[MT8189_CLK_TOP_MUX_AUDIOINTBUS]);
-	mt8189_afe_set_clk_parent(afe, afe_priv->clk[MT8189_CLK_TOP_MUX_AUDIOINTBUS],
-				  afe_priv->clk[MT8189_CLK_TOP_CLK26M]);
+	ret = mt8189_afe_enable_clk(afe, afe_priv->clk[MT8189_CLK_TOP_MUX_AUDIOINTBUS]);
+	if (ret)
+		return ret;
+
+	ret = mt8189_afe_set_clk_parent(afe, afe_priv->clk[MT8189_CLK_TOP_MUX_AUDIOINTBUS],
+					afe_priv->clk[MT8189_CLK_TOP_CLK26M]);
+	if (ret)
+		goto err_audiointbus;
+
 	/* enable audio clock source */
-	mt8189_afe_enable_clk(afe, afe_priv->clk[MT8189_CLK_TOP_MUX_AUDIO_H]);
-	mt8189_afe_set_clk_parent(afe, afe_priv->clk[MT8189_CLK_TOP_MUX_AUDIO_H],
-				  afe_priv->clk[MT8189_CLK_TOP_CLK26M]);
+	ret = mt8189_afe_enable_clk(afe, afe_priv->clk[MT8189_CLK_TOP_MUX_AUDIO_H]);
+	if (ret)
+		goto err_audiointbus;
+
+	ret = mt8189_afe_set_clk_parent(afe, afe_priv->clk[MT8189_CLK_TOP_MUX_AUDIO_H],
+					afe_priv->clk[MT8189_CLK_TOP_CLK26M]);
+	if (ret)
+		goto err_audio_h;
 
 	return 0;
+
+err_audio_h:
+	mt8189_afe_disable_clk(afe, afe_priv->clk[MT8189_CLK_TOP_MUX_AUDIO_H]);
+err_audiointbus:
+	mt8189_afe_disable_clk(afe, afe_priv->clk[MT8189_CLK_TOP_MUX_AUDIOINTBUS]);
+
+	return ret;
 }
 
 int mt8189_afe_disable_reg_rw_clk(struct mtk_base_afe *afe)
-- 
2.43.0

