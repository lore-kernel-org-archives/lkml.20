Received: from mail-m15574.qiye.163.com (mail-m15574.qiye.163.com [101.71.155.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3C653D668F;
	Fri, 28 Aug 2026 06:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787900249; cv=none; b=mH3fXVLfbXFv1mTfzR4B6edgzaNUXeubzEl5SZ8rkYZsqacp09wJ2rONzOuPY4AjJdF8X61EznZ/V/enAUMQzmp6I0cDcNpAFyB9RLDefOwa+7PlSg6lGCnnPKapn4SIsgtUH1DbtsQgMFWSDckVTx4HM3d4jy8P76nDhoMbpQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787900249; c=relaxed/simple;
	bh=mowNlomkjWV8WhtYoTKyfiaWwBDsTac8oQVst65R16Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qASareZ+HQq3LAO2KNciJSsw1LwldyZha2wpPjmgJxGmEOY1VjotpyYc+Kh5FOhCivF7PGp1cW8dCoSO23S8Po22b3XTaUe2BClapYPWoID4gOMLmGwErTQYC1EZJX3OtN8sSu/JExSSLNeQuQFT7UFLpQutsPmyaVuHb0lAZc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=J3ln/bxy; arc=none smtp.client-ip=101.71.155.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="J3ln/bxy"
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4bab2d5a4;
	Fri, 28 Aug 2026 14:52:05 +0800 (GMT+08:00)
From: Damon Ding <damon.ding@rock-chips.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sandy Huang <hjc@rock-chips.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Damon Ding <damon.ding@rock-chips.com>
Subject: [PATCH v8 2/5] drm/dp: Add helper to validate DP lane counts
Date: Fri, 28 Aug 2026 14:51:50 +0800
Message-Id: <20260828065153.590802-3-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260828065153.590802-1-damon.ding@rock-chips.com>
References: <20260828065153.590802-1-damon.ding@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa04723d5e203a8kunm9cc188d518834a
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1kYFggdWUFKV1ktWUFJV1kPCRoVCBIfWUFZGk4aGlYaSEMdSEsZSU
	IeQ0lWFRQJFhoXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0
	tIVUpLSU9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=J3ln/bxybGTsOfkGBbZzKL9bXT2jZ9+ygl5ZAisrNMxtrVWSl2FG5ZFDMbj6iGPWwecOCgPNJFC+PF3O1qIsbsDr/VcpySVQUJRnOxamoNBrZvltJ9/Duo8jBMIzVAjRuvyhGVnF5/X9fvXA1sjPqaTYubqoh+eUn2HVj5d3WX0=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=3D3tCxbxiOqvsJFvLlKoOy9RkGLmHyoV0izPMCA9ZDc=;
	h=date:mime-version:subject:message-id:from;

Add a generic helper function drm_dp_lane_count_is_valid() to check
if a DisplayPort lane count is valid. According to the DP specification,
only 1, 2, or 4 lanes are supported.

This helper avoids duplicating DP lane count validation logic across
individual DisplayPort drivers.

Suggested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Damon Ding <damon.ding@rock-chips.com>

---

Changes in v6:
- Add Reviewed-by tag.
---
 include/drm/display/drm_dp_helper.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
index ab16c1be3900..5b05a7fbe174 100644
--- a/include/drm/display/drm_dp_helper.h
+++ b/include/drm/display/drm_dp_helper.h
@@ -139,6 +139,12 @@ bool drm_dp_as_sdp_supported(struct drm_dp_aux *aux, const u8 dpcd[DP_RECEIVER_C
 
 int drm_dp_psr_setup_time(const u8 psr_cap[EDP_PSR_RECEIVER_CAP_SIZE]);
 
+static inline bool
+drm_dp_lane_count_is_valid(int lane_count)
+{
+	return lane_count == 1 || lane_count == 2 || lane_count == 4;
+}
+
 static inline int
 drm_dp_max_link_rate(const u8 dpcd[DP_RECEIVER_CAP_SIZE])
 {
-- 
2.34.1

