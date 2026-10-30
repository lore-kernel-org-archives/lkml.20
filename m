Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.224.81.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793342983;
	b=fNBdOkBzcfwlcWX0MIiHyM4U/tvHwptIAnXZZjcSr4yXRPY85WFbL/IdNtMvpNQx0B5x
	 8/TuCwONObjlJ7NAAEsN4r7eB35LVK4jB359xRq8noAMupxPCVAFlbXNbfAhwvCZl+v5F
	 tSlcMkrRWFQ3tqnK0VrVqo5IODak2UqEOETi4LjED1zTY10ZF5/ODyHFau/Nb3IRA6EQX
	 Smkmc/t854UbIbGg5Vr+o+ZZqmOXHRWHzWHxCwioWunKbd4W3IvBcaTHMA0zAGmLZEFvD
	 Dqf5qMD07XxpxrVioBppBpmu7DyhIuJp0ReEKWKHQPgK0jWg7bRRuQNVg+l9zwE2pjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793342983;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 X-HM-Tid:X-HM-MType:X-HM-Spam-Status:DKIM-Signature;
	bh=tCtH0nSoUz9rfFDR40EGktb2UZ4joiDlZGZt7iSx0Yo=;
	b=g2jLtGeWY+vOzPzfJL6D1hA3C+d/LqKztGEFYtFB7diPN+yq354c4HgjDKjCrmOckV3E
	 QHVYDhLEXKDxbQwpYMXdDGhB177m15dEvotGWdhkSIW6eB3CXkoudUeL/tvOx1RJPt4nL
	 P2NsLGltEU2qChjWCV1OBmKZ5ddsaulfTFaXU8vbe4z7CjvWK+IE22/BbvJtPVkB15L+B
	 Y0CKiiNxzZxGyQdfpHKESQpMj4/PNwmbP+073eZTJFY4iqYPTkNb7zK2Sv4wS1xra4pvN
	 GyCEoioBmhpRg97CqFanEIc6zWPZCnVvYXrir17GEh3KPpvxCOAtYvY+UoL15RoaHVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rock-chips.com;
	spf=pass smtp.mailfrom=rock-chips.com;
	dkim=pass header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=Fm1KqGWl;
	arc=none smtp.remote-ip=156.224.81.173
Received: from mail-m81173.xmail.ntesmail.com (mail-m81173.xmail.ntesmail.com [156.224.81.173])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3A4F606A327;
	Fri, 30 Oct 2026 06:49:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3A4F606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=Fm1KqGWl
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 52e796933;
	Fri, 30 Oct 2026 14:49:31 +0800 (GMT+08:00)
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
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	Damon Ding <damon.ding@rock-chips.com>
Subject: [PATCH v4 3/6] drm/bridge: analogix_dp: Add support for RK3568
Date: Fri, 30 Oct 2026 14:49:02 +0800
Message-Id: <20261030064905.2248999-4-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261030064905.2248999-1-damon.ding@rock-chips.com>
References: <20261030064905.2248999-1-damon.ding@rock-chips.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa18b921e2003a8kunme14bef997940c
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1kYFggdWUFKV1ktWUFJV1kPCRoVCBIfWUFZQ0IYQ1ZNHkgZShkeQ0
	sYGExWFRQJFhoXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0
	tIVUpLSEpKQk1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=Fm1KqGWluv5KCKlbJrxdOt5Op5MhL5IaYsAMBGb41c4GB9/0jg6Yo9q//rup4zak5YzBDQsIB7aKSMTHN7fes0w6OL6led9OMrCCxK3xg/0MHo9mbgCzHIupCjIZ4OZRs+/aF46vteIxDc6OoWSgCAwMjPEc6TQdpnemfX9l+KI=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=tCtH0nSoUz9rfFDR40EGktb2UZ4joiDlZGZt7iSx0Yo=;
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
index 6df6963740d2..8bb4c48aa3b4 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -1319,6 +1319,7 @@ static int analogix_dp_dt_parse_pdata(struct analogix_dp_device *dp)
 	switch (dp->plat_data->dev_type) {
 	case RK3288_DP:
 	case RK3399_EDP:
+	case RK3568_EDP:
 		/*
 		 * Like Rk3288 DisplayPort TRM indicate that "Main link
 		 * containing 4 physical lanes of 2.7/1.62 Gbps/lane".
diff --git a/include/drm/bridge/analogix_dp.h b/include/drm/bridge/analogix_dp.h
index 6033137b651e..e05ff4bd689c 100644
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

