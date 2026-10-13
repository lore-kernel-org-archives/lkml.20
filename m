Received: from mail-m15577.qiye.163.com (mail-m15577.qiye.163.com [101.71.155.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8252839FCD7;
	Tue, 13 Oct 2026 12:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791896113; cv=none; b=paQCylsRVMZeGCUbwzsbgexCSdH3gJANmzA6CmG+azQjiaq0kC17YGXIDmWdJ5LmLEN3V/ekmrWCgTr6d9tJ4hJRlvYv+gYdcV6lfMp4iWhfkoCR5RPH4Pg8qNSlxYlIQMUXCu3RZiLn9PRsBvZtNjgamZPFe+uXqPtmoKUCQMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791896113; c=relaxed/simple;
	bh=AnAthsjkSgnR4B+FbP6J51fncLgalSaqmcFXA3ABq8o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=m9qnwiuinpbAIRr0flDPeSbhGMSlOOBGzHgDIcsncgylz00R3mhQZJznweZB+qHemG/fAn/4z1ALchCdbTLRDnZB/e6vI53S1tqINma8vvByBqODo920fpFTu23rsv50FOJHr+p8laJS6dp5CROkvE6zw+NKDn3I1P5QOfc975s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=JuzpEdyh; arc=none smtp.client-ip=101.71.155.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="JuzpEdyh"
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 50e2b9410;
	Tue, 13 Oct 2026 20:49:56 +0800 (GMT+08:00)
From: Damon Ding <damon.ding@rock-chips.com>
To: Sandy Huang <hjc@rock-chips.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Robert Foss <rfoss@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Dave Jones <s.dave.jones@gmail.com>,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	Damon Ding <damon.ding@rock-chips.com>
Subject: [PATCH v1 3/6] drm/bridge: analogix_dp: Add support for RK3568
Date: Tue, 13 Oct 2026 20:49:43 +0800
Message-Id: <20261013124946.1807886-4-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261013124946.1807886-1-damon.ding@rock-chips.com>
References: <20261013124946.1807886-1-damon.ding@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa1354ff96d03a8kunm2e7c128b3011
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZGE9CVkNMSBoeQkhPQk0ZGVYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pKQk1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=JuzpEdyh6q2PKnnzbV9fUvczxR9S9PF/ZyzTKgTb0ud+zFhStt531+OqzuMLXl605+r0H9XgG8RqEDNY1IWn6aQvry5gBYwayJgn5UNVGX+eLJopSEMUTZw8mTsYXhlk2fWTPlAWQnXDqUHa4LtHYVIQdA7ChPvOhQBRzw7F2h8=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=25k85pYDNNS/jLMeaSTi2zceBGz4hvcyKDt+za22gLw=;
	h=date:mime-version:subject:message-id:from;

The RK3568 SoC integrates an eDP transmitter based on the Analogix
DisplayPort core.  Like RK3288 and RK3399, its main link consists of
4 physical lanes running at 1.62/2.7 Gbps per lane.

Add a new RK3568_EDP device type and let it share the link rate and
lane count limits of the RK3288/RK3399 variants.

Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
---
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 1 +
 include/drm/bridge/analogix_dp.h                   | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index 90245d55d1d2..2aefb4615a4f 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -1375,6 +1375,7 @@ static int analogix_dp_dt_parse_pdata(struct analogix_dp_device *dp)
 	switch (dp->plat_data->dev_type) {
 	case RK3288_DP:
 	case RK3399_EDP:
+	case RK3568_EDP:
 		/*
 		 * Like Rk3288 DisplayPort TRM indicate that "Main link
 		 * containing 4 physical lanes of 2.7/1.62 Gbps/lane".
diff --git a/include/drm/bridge/analogix_dp.h b/include/drm/bridge/analogix_dp.h
index f152ca8c3218..7b5615ae0dc1 100644
--- a/include/drm/bridge/analogix_dp.h
+++ b/include/drm/bridge/analogix_dp.h
@@ -16,6 +16,7 @@ enum analogix_dp_devtype {
 	EXYNOS_DP,
 	RK3288_DP,
 	RK3399_EDP,
+	RK3568_EDP,
 	RK3576_EDP,
 	RK3588_EDP,
 };
@@ -25,6 +26,7 @@ static inline bool analogix_dp_is_rockchip(enum analogix_dp_devtype type)
 	switch (type) {
 	case RK3288_DP:
 	case RK3399_EDP:
+	case RK3568_EDP:
 	case RK3576_EDP:
 	case RK3588_EDP:
 		return true;
-- 
2.34.1

