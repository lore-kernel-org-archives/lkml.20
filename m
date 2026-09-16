Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80768468C26;
	Wed, 16 Sep 2026 11:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789556931; cv=none; b=G6vUrjPrMNDQJ4FfyRSmh5wL8Rcvq+3pP0PwEE8ugxzhH2j2lSAAQp/GwzfBpujKDZi0GDlinUoSWqipJKUDWcjP27r8xplYeEMYIJeT8kL9poWSN7BpJNcIH3y0lMGHG8S7d9CpBq55I1kK4JngIipCMRk5Dv/VA99XS8eM17c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789556931; c=relaxed/simple;
	bh=S18Wt8OCBT/Toj4x1as/oaeMCjT/wxmXL5K5vBQ9i0Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UB7bBo2F1goGgY3ukNCR/n2kavj1HYQj394lZx09aiSp0k50oglQ6B5mYOskgYXc7rAzmA2dpsmetyUP3wLHijWI6OoxVdz22O1gC77/pP0WUShyI5NID/fzF4uvj6h5tGEh1CONmuGjin+GZgkNSMURDNXUDYI94s7VXOQj0d8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=QR4rhSxG; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="QR4rhSxG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789556908;
	bh=S18Wt8OCBT/Toj4x1as/oaeMCjT/wxmXL5K5vBQ9i0Y=;
	h=From:To:Cc:Subject:Date:From;
	b=QR4rhSxG3jgjp67LkTy/0VkkL4C0fOL4cy1P+IpKhjzcytnvpSumv4wByq1GBAdHe
	 0gb1ETXA5zDRyaDVGQxGiLrDQsDSWQg7D+TXpAZ4gRLNxyqCPrMLH3K091gS884Htd
	 H/Fwe0elHAN40nArALCifeRbXtV6VtBfSjS05ylRWAQLv3XW73/BHf/NP1xJH60XAE
	 OBU7tJd9GKWMLf7Z/AT3wF2M5QUKFtMD82Q03uNpzNOAdIfqYh4gq0zdUYHC5EYdvi
	 yJjN7jamVX2NEpah8WV5qbMs0zzfSeau6CqZaF1dE1+iAC6oRZBTJBvxUBAR3XdsM5
	 gPO5PhnfWIvfQ==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 242C617E07DB;
	Wed, 16 Sep 2026 13:08:28 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	jitao.shi@mediatek.com,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com,
	justin.yeh@mediatek.com,
	jason-jh.lin@mediatek.com
Subject: [PATCH v9 00/13] drm/mediatek: Add DSC, WDMA, MT8189/96 DSI support
Date: Wed, 16 Sep 2026 13:08:12 +0200
Message-ID: <20260916110825.102631-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changes in v9:
 - Moved dsi/dsc component discovery in correct mtk_crtc loop (Nikolai)
 - Fixed operator precedence bug due to macro (Nikolai)
 - Added RC_MODEL_SIZE programming (Nikolai)
 - Added SLICE_MODE register programming (Nikolai)
 - Used slice_count param in mtk_dsi to calculate PS_WC (Nikolai)
 - Changed DSC RC params to DRM_DSC_1_2_444 (Nikolai)

Changes in v8:
 - Fixed offset for LCCON and LD0CON registers in MT8196 register map

Changes in v7:
 - Added full drm_dsc header inclusion in mtk_disp_drv.h (CK)
 - Moved CMDMODE_WAIT_DATA_EVERY_LINE_EN to commit [9/12] (CK)
 - Removed constification cleanup from mtk_dsi (CK)
 - Performed cleanups on commit [4/12] (CK)
 - Split maximum link rate parameter moving from MT8189 support (CK)
 - Split SRAM/QoS support from MT8196 support commit (CK)

Changes in v6:
 - Fixed .remove function name in wdma (ugh...)

Changes in v5:
 - Clarified commit description for WDMA binding compatibles addition
   explaining why Dimensity 1200 is not compatible with MT8173
 - Added missing mediatek,mt8189-dsi compatible in mtk_drm_drv.c
 - Added fix in mtk_dsi for failing device_reset_optional() producing
   a possible use-after-free issue

Changes in v4:
 - WDMA: Delete the .remove() callback from WDMA as not needed anymore
 - WDMA: Add comments explaining no bus errors will happen if writing
   to INT_ENABLE, INT_STATUS registers while unpowered or unclocked
 - Return error in mtk_wdma_wb_atomic_check() error conditions, oops!
 - DSC: Fix dsc_pad_num calculation (missing parenthesis...)
 - DSI: Change dsc slice check error to dev_dbg instead to avoid spam
 - DSI: Correctly cleanup dsi->dsc upon component_add failure
 - DSI: Make sure the CKTX_CKL_WC register is correctly programmed in
   DSI w/DSC case

Changes in v3:
 - Changed mtk_dsi DSC implementation to use a different DSI_PS
   setting function for compressed or uncompressed, as the dsc one
   is way simpler than the regular one and becomes way shorter
 - DSC: Fixed missing PPS 19 register write
 - DSI: Anticipated call to devm_pm_runtime_enable() to before
   registering the DSI Host interface
 - DSI: Anticipated installing IRQ handler before registering the
   dsi host interface, which wasn't a problem before, but now it
   would be one because the interrupt is being enabled when binding!
 - DSI: Fixed some possible calculation overflows that may happen in
   MT8189 and MT8196 because of the higher supported resolutions
 - WDMA: Use devm variant of pm_runtime_enable()
 - Change WDMA interrupt handler to allow signaling WB complete even
   if there is no specific vblank callback installed to avoid very
   long timeouts (in any case, WB is complete for real even if there
   is no vblank_cb, just a bit useless without, but still complete)
 - Fixed WDMA register writes as register id was in function signature
   for mtk_wdma_ddp_write_dst_addr() but the function itself never
   used it in DISP_REG_WDMA_DST_ADDRX() macro

Changes in v2:
 - Rebased on next-20260706

This series adds support for:
 - Display Stream Compression (DSC) for DSI and DisplayPort for both
   legacy (8188/92/95 and others) and for Kompanio Ultra MT8196 SoCs
 - Write DMA (WDMA) Engine (for legacy only at this time) as a step
   to enable Writeback support (coming later with a restructuring of
   the entire mediatek-drm driver)
 - Newer MIPI DSI IP revisions, found in MT8189 and MT8196 SoCs

AngeloGioacchino Del Regno (13):
  dt-bindings: display: mediatek: dsc: Add MT8196 compatible
  drm/mediatek: Implement Display Stream Compression support
  dt-bindings: display: mediatek: dsi: Document MT8189 and MT8196
  drm/mediatek: mtk_dsi: Cleanup encoder if reset fails during bind
  drm/mediatek: mtk_dsi: Enable interrupt at component bind time
  drm/mediatek: mtk_dsi: Transfer register offsets to per-SoC const
  drm/mediatek: mtk_dsi: Move max link rate parameter to platform data
  drm/mediatek: mtk_dsi: Add support for MT8189
  drm/mediatek: mtk_dsi: Add support for SRAM QoS setting
  drm/mediatek: mtk_dsi: Add support for MT8196
  drm/mediatek: mtk_dsi: Enable PM Runtime on probe
  dt-bindings: display: mediatek: wdma: Add compatibles for more SoCs
  drm/mediatek: Add Write DMA (WDMA) Engine for Writeback support

 .../display/mediatek/mediatek,dsc.yaml        |   4 +-
 .../display/mediatek/mediatek,dsi.yaml        |   2 +
 .../display/mediatek/mediatek,wdma.yaml       |   5 +
 drivers/gpu/drm/mediatek/Makefile             |   2 +
 drivers/gpu/drm/mediatek/mtk_crtc.c           |  21 +
 drivers/gpu/drm/mediatek/mtk_ddp_comp.c       |  64 +-
 drivers/gpu/drm/mediatek/mtk_ddp_comp.h       |   9 +
 drivers/gpu/drm/mediatek/mtk_disp_drv.h       |  28 +
 drivers/gpu/drm/mediatek/mtk_disp_dsc.c       | 449 ++++++++++
 drivers/gpu/drm/mediatek/mtk_disp_wdma.c      | 628 ++++++++++++++
 drivers/gpu/drm/mediatek/mtk_drm_drv.c        |  10 +
 drivers/gpu/drm/mediatek/mtk_drm_drv.h        |   2 +
 drivers/gpu/drm/mediatek/mtk_dsi.c            | 794 ++++++++++++++----
 13 files changed, 1830 insertions(+), 188 deletions(-)
 create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_dsc.c
 create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_wdma.c

-- 
2.55.0

