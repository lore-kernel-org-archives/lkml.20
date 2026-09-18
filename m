Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E7E647C0F1
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 17:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789754275; cv=none; b=Ta/40sHuidDu/IQISkamtjXJ99rnt5vuweZWFyOG+f6jJ8agMKjwjiJTzFFXyuYT7nO2bQZ6R/6ToShiPJISSHfWY1jvcRebP5A78z3IZJSenGoycTIfjC0MFAkIhoTRQ0xhjpYj2LZdvRXZKGvC2KKUvli0DDUQKkg+aC0Jlnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789754275; c=relaxed/simple;
	bh=gSTm+0eZaDzHmuBKmkva/vAPyOnmyFaucHMLv7zIA1U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dx97cgCL8KjQ9s5RHzGDTKr5R3ajKOXz0/WE4IrXUME+SmZl2Cp41UJMCk3cLHe/LalXH+tfWche5LgkcNZUOEXt/Z4S9rMps7CkKlpoWKk2RsHZvGPyWFEv+we5hsjSZfp3nJQksuU6ZeXS+lsJXf/uTnPISfm3P/pawRx/rxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MAbcaYxW; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MAbcaYxW"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-485b1d2874aso769594f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 10:57:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789754269; x=1790359069; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MOpF21qwCYtkBPyOZB6nIIWOi6wwbvKg9f2XgINcd2A=;
        b=MAbcaYxWKWl1T4jO4Zzv2rQ/Xi5W0MjcBPAapK7uBgpL+D1UW44MefJOoiGVzfWc6j
         p4Nh7WsxTTHqO1aSzbpMU/ztcobpoD+tAvkb1R6DA4sfYK7Mhwg/jEaKRg1TBY7L4h5n
         usHMlGR4n/CM0bJMIqk7kqnya0QbOFG9yAT0/ML1+4Q0KZBa3HNqsZtMYSUUisQ22ynk
         ry9KBACeGYUm5I4z3fD3vBV9lpbyI1+pHz9po+G5v/kEZjx/tm/sPOYfYrHgmWbxVsWH
         fNBRWVRFBIWSWyGJYlIsXb8j4tr3jqOAoWRMXQdKiHUrEVUDTesxuHURoAraHSup5rUv
         wgPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789754269; x=1790359069;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MOpF21qwCYtkBPyOZB6nIIWOi6wwbvKg9f2XgINcd2A=;
        b=RcQ8LzwELmQj5M7TrV+hL/FlvsjSjWMw04pFC1XOdNLhQkKqZ+RVQ2l2NkdO2LnAd1
         LX/EGqQflW3StL2z95oG5rmEHVV9V9/THsOSpgWjAHdKUkI0RL6TeevpwSCEG82fjcVK
         UJrYb87iulnDPiZSAmJ/UKVXzPajVrWehFCTy9+xdvhkV0KSYD6e+rs+BM8IoISJVjAh
         rRWNzpVGMy8RZ2BgkOZrwOPlxKJDlIA1era9oKIx3quDe/9JkFyl/t0BcUl9OCYIY2LG
         JjF/gOO8ADPC5YIBe8bJ25PK7duvjOu3YMmJwd0clSJy70/jJOBpiHdda8l6cTfFmcU+
         V8kQ==
X-Forwarded-Encrypted: i=1; AKwUvBwss1OfMxMPiKsjJkx4PzMBcijxRSAGjji8y8negqBrn5SjgjMTFPFrAtv7c+NtK8nHGB2FzUOjgyRPBJY=@vger.kernel.org
X-Gm-Message-State: AFuF++mAR40MZOMEWrHlbP5eoL2ECxvT4mN4wpp8HPiKI92Vhn4vkFlR
	ThLkYLNH93lIm6+ErTwl1TZnFNykYyYjjKzPGlbunnj1d2RCMwBXs7Uu
X-Gm-Gg: AYBFou1lo7ZNPZY44dwgsetX5kg4RwnJs5aS5l9XfhSy1qXMkK5hk6YCNCqO4TJ0109
	dmCreZUsiCB6QVaM9+i0mbL72Je8lJsjCJfanea6fxnNjgR0H2cYbtbCmUUWsdP7eyTBfV6jjfY
	HuSoo5XCpno/RRPMMLutrb4xWiqy34ZvSZAjmtE6c7DoHi3Bd0aoJ1FyuuVpXhn3Jvk1yTleaYJ
	QAomKALN7rEN5Ul1LeUXREuF8BWEzvA/J22UCZeQSwcAkQJg4e+BpcP+Cu3yLoMtz6j5vEOgP/U
	v5Zb5nyOgejIBCRJ/aoU7mxB1qYlv5WMEee7f7szMuOzYQYNLOSnckLrEzT/pgduYQaYJ78o+mv
	tXGKTMaUsGhAuLvP56oKS/mZeOCDoK8nqTtfCYnX4beN3hCLcA53k5gTT4/fdQDuApvaP6O8b9s
	D3p5HBOw7g3h8r4R6zTCaZh5M43wk6SxFYMdFUGBCnlkOiwUbRmqDWPrH2XtdK9FwNijhOKfD/q
	vCmSw==
X-Received: by 2002:a05:6000:40c8:b0:487:403:f2eb with SMTP id ffacd0b85a97d-4871e263f5dmr9591011f8f.17.1789754269490;
        Fri, 18 Sep 2026 10:57:49 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48724562aebsm268461f8f.14.2026.09.18.10.57.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 10:57:49 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	CK Hu <ck.hu@mediatek.com>,
	Jitao shi <jitao.shi@mediatek.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/4] drm/mediatek: Add support for mt8167 Digital Parallel Interface
Date: Fri, 18 Sep 2026 19:55:26 +0200
Message-ID: <20260918175736.355305-3-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260918175736.355305-1-l.scorcia@gmail.com>
References: <20260918175736.355305-1-l.scorcia@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for the two DPI blocks found in the mt8167 SoCs. One of them
can be routed to a DPI connector and another is directly connected to the
HDMI IP.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 drivers/gpu/drm/mediatek/mtk_dpi.c     | 23 +++++++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_drm_drv.c |  2 ++
 2 files changed, 25 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
index 0e4f430de983..9012adeb63d0 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
@@ -1114,6 +1114,10 @@ static const struct mtk_dpi_factor dpi_factor_mt2701[] = {
 	{ 64000, 4 }, { 128000, 2 }, { U32_MAX, 1 }
 };
 
+static const struct mtk_dpi_factor dpi_factor_mt8167[] = {
+	{ 64000, 16 }, { 74250, 8 }, { 160000, 4 }, { U32_MAX, 2 }
+};
+
 static const struct mtk_dpi_factor dpi_factor_mt8173[] = {
 	{ 27000, 48 }, { 84000, 24 }, { 167000, 12 }, { U32_MAX, 6 }
 };
@@ -1163,6 +1167,24 @@ static const struct mtk_dpi_conf mt2701_conf = {
 	.csc_enable_bit = CSC_ENABLE,
 };
 
+static const struct mtk_dpi_conf mt8167_conf = {
+	.dpi_factor = dpi_factor_mt8167,
+	.num_dpi_factor = ARRAY_SIZE(dpi_factor_mt8167),
+	.reg_h_fre_con = 0xe0,
+	.max_clock_khz = 150000,
+	.output_fmts = mt8173_output_fmts,
+	.num_output_fmts = ARRAY_SIZE(mt8173_output_fmts),
+	.pixels_per_iter = 1,
+	.is_ck_de_pol = true,
+	.swap_input_support = true,
+	.support_direct_pin = true,
+	.dimension_mask = HPW_MASK,
+	.hvsize_mask = HSIZE_MASK,
+	.channel_swap_shift = CH_SWAP,
+	.yuv422_en_bit = YUV422_EN,
+	.csc_enable_bit = CSC_ENABLE,
+};
+
 static const struct mtk_dpi_conf mt8183_conf = {
 	.dpi_factor = dpi_factor_mt8183,
 	.num_dpi_factor = ARRAY_SIZE(dpi_factor_mt8183),
@@ -1342,6 +1364,7 @@ static void mtk_dpi_remove(struct platform_device *pdev)
 
 static const struct of_device_id mtk_dpi_of_ids[] = {
 	{ .compatible = "mediatek,mt2701-dpi", .data = &mt2701_conf },
+	{ .compatible = "mediatek,mt8167-dpi", .data = &mt8167_conf },
 	{ .compatible = "mediatek,mt8173-dpi", .data = &mt8173_conf },
 	{ .compatible = "mediatek,mt8183-dpi", .data = &mt8183_conf },
 	{ .compatible = "mediatek,mt8186-dpi", .data = &mt8186_conf },
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index c86a3f54f35b..64c87221d931 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -802,6 +802,8 @@ static const struct of_device_id mtk_ddp_comp_dt_ids[] = {
 	  .data = (void *)MTK_DPI },
 	{ .compatible = "mediatek,mt8167-dsi",
 	  .data = (void *)MTK_DSI },
+	{ .compatible = "mediatek,mt8167-dpi",
+	  .data = (void *)MTK_DPI },
 	{ .compatible = "mediatek,mt8173-dpi",
 	  .data = (void *)MTK_DPI },
 	{ .compatible = "mediatek,mt8183-dpi",
-- 
2.43.0

