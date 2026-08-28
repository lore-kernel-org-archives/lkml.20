Received: from mail-m12741.qiye.163.com (mail-m12741.qiye.163.com [115.236.127.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0508E3537E5;
	Fri, 28 Aug 2026 07:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.236.127.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787900861; cv=none; b=mZsjAM9LQKaMNAa+vdfLWF5lKyBWHgRx+sPibjNVLRyKK6Qi6mGATGmm3svqsSF6PHb3qAj99zdekbMNj2k/tgaktftplDhNOj1gcrUnq1kMxWiOSv+ZqlKzg7iA/PAgjA+60OI2LgpZhVE2awojQm3vJm9RYqVK58wyRYto5is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787900861; c=relaxed/simple;
	bh=EGc2jTS3oA/w9O5c/npYY+tNjKBHzGb7vkKuG05Wbbc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cy1nA6qaVx9HTePUjAzJeLjt0pXHDnRSM+3qX28g/KlKs8oM/fcoEE8z3ARAPA8FnzNDRhuS4vrFm0uZRzULwIqq6sVfTa6zNv3vWpW24MOrme744HFS/h6DfG606AiGSfhgqZQes4iD7fzd0vYDykjgx8Q607T+uhUynNdloOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=KVkwSm5d; arc=none smtp.client-ip=115.236.127.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="KVkwSm5d"
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4bab2d5be;
	Fri, 28 Aug 2026 14:52:09 +0800 (GMT+08:00)
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
Subject: [PATCH v8 4/5] drm/bridge: analogix_dp: Add validation for samsung,lane-count property
Date: Fri, 28 Aug 2026 14:51:52 +0800
Message-Id: <20260828065153.590802-5-damon.ding@rock-chips.com>
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
X-HM-Tid: 0aa04723e4b303a8kunm9cc188d5188370
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1kYFggdWUFKV1ktWUFJV1kPCRoVCBIfWUFZGU1DSVZOHh5MTEpCQk
	saGUhWFRQJFhoXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0
	tIVUpLSU9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=KVkwSm5di3V6qSiThNRmucxAg335yGzJyOAchgHUR/WdaUY42A0nLiI6EVs/yylLilGbMJLmnLKwQ/VTt2u2ENAygyJqa62QdkGGlbBLdzWfOI4oMFC+fEeh+AjTYvhj2Cg30WqlBe3Fw0nW/Fm1ypcYVVZP7AYNtZawTtHSOwQ=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=sufZXYFvhqt99gCkQ0mCK5s0oy3fyCr/7BG8YjyOEgU=;
	h=date:mime-version:subject:message-id:from;

Add validity check for samsung,lane-count to ensure DT-provided
lane count values are specification-compliant.

Suggested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Damon Ding <damon.ding@rock-chips.com>

---

Changes in v5:
- Apply DRM DP helper API to check the validity of DP lane count.

Changes in v6:
- Rebase after the new commit for restoring mandatory properties
  samsung,link-rate and samsung,lane-count.

Changes in v7:
- Add Reviewed-by tag.
---
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index ddb15d6de05f..a74c855936b2 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -1274,7 +1274,8 @@ static int analogix_dp_dt_parse_pdata(struct analogix_dp_device *dp)
 			return dev_err_probe(dp->dev, -EINVAL,
 					     "Failed to get samsung,link-rate\n");
 		video_info->max_link_rate = val;
-		if (of_property_read_u32(dp_node, "samsung,lane-count", &val))
+		if (of_property_read_u32(dp_node, "samsung,lane-count", &val) ||
+		    !drm_dp_lane_count_is_valid(val))
 			return dev_err_probe(dp->dev, -EINVAL,
 					     "Failed to get samsung,lane-count\n");
 		video_info->max_lane_count = val;
-- 
2.34.1

