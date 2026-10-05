Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5694D2C1788
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 00:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791160743; cv=none; b=AjLivuqIOLtLDb2159mSlgpQ64Zb71r8ldwX2rUJIdKXyYiUghsNsFKZTDedI0cIQt7RytHhCJVHhXcsI9rv42vwCjtikea1nRlbT559Ej6bvs+C8L0ThOELxZBBgqSykuNANHoEfGsWkGuKpS1Akmu0grhEFb8+jdhdAKwZP4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791160743; c=relaxed/simple;
	bh=5Tbl051iQw5Twim/Kfk4s89QMKZl/6G/TabrhRKEN6Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GMFE8fhqwTKEQfmyrdtD66Tej5Tm09xBtwHsvmZtmEikiFTZYW4YK+UYj5NitIbdsjeDzkQWSMItSW/7aIvLdn9waLXug59rCov1peIp1XKu48Gu0lT9KDWCCgOwA6aIjKJn7hCcRX8BZUmE7etR7Sqa1lLcBP/6lKISdYNIpvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Aoky8+HZ; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Aoky8+HZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1791160736;
	bh=5Tbl051iQw5Twim/Kfk4s89QMKZl/6G/TabrhRKEN6Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Aoky8+HZQ+dSA+I5mld+wOpuwcTh+VZBZu2jmmUPgJmGCWxv2nb+X2t99C/FUPcZ9
	 idcfKpl7fepWIMaso7XgD967wI6sez7LsyVTx+OmjjHvBOxyNzhiG35TRZWbrB1pD/
	 iyK4BDTzFgcZQ2Df+J9IpW+MO145/8QurC5zNaX1cJJBgI8MFPQTFdvSOi5m1SeveG
	 UwEauCr4mG8SVxtFRaYV6HPEKfewq/efxH9yi0tny7yH1sEz2kQ2jKDXd/9AALvLSB
	 3PJDrsEquQa4bYQVBVhZ2uckjqfThoK1hYIdyX9tB2p04++fMBTPKBEWgVPOGl/BAS
	 X8VQZvgVNlddA==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id EF00517E14D1;
	Mon, 05 Oct 2026 02:38:55 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Mon, 05 Oct 2026 03:38:16 +0300
Subject: [PATCH v12 15/16] drm/rockchip: dw_hdmi_qp: Use
 dw_hdmi_qp_hpd_notify() for HPD reports
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261005-dw-hdmi-qp-scramb-v12-15-195157ba0b40@collabora.com>
References: <20261005-dw-hdmi-qp-scramb-v12-0-195157ba0b40@collabora.com>
In-Reply-To: <20261005-dw-hdmi-qp-scramb-v12-0-195157ba0b40@collabora.com>
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Algea Cao <algea.cao@rock-chips.com>, Daniel Stone <daniels@collabora.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Maud Spierings <maud_spierings@hotmail.com>, 
 Diederik de Haas <diederik@cknow-tech.com>, 
 =?utf-8?q?Robin_R=C3=A4ber?= <robin.raebi@gmail.com>, 
 Igor Paunovic <royalnet026@gmail.com>
X-Mailer: b4 0.15.2

Notify only the affected connector instead of polling all of them, and
ensure .detect_ctx() runs on reconnect to recover SCDC state.

Tested-by: Maud Spierings <maud_spierings@hotmail.com>
Tested-by: Diederik de Haas <diederik@cknow-tech.com>  # NanoPC-T6 LTS, Rock 5B
Tested-by: Robin Räber <robin.raebi@gmail.com>
Tested-by: Igor Paunovic <royalnet026@gmail.com> # RK3588 Orange Pi 5 Plus, dual HDMI
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
index 1c547016ee00..f2a1ea8dfefa 100644
--- a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
@@ -24,7 +24,6 @@
 #include <drm/drm_bridge_connector.h>
 #include <drm/drm_managed.h>
 #include <drm/drm_of.h>
-#include <drm/drm_probe_helper.h>
 
 #include "rockchip_drm_drv.h"
 
@@ -398,14 +397,8 @@ static void dw_hdmi_qp_rk3588_hpd_work(struct work_struct *work)
 	struct rockchip_hdmi_qp *hdmi = container_of(work,
 						     struct rockchip_hdmi_qp,
 						     hpd_work.work);
-	struct drm_device *drm = hdmi->encoder.encoder.dev;
-	bool changed;
 
-	if (drm) {
-		changed = drm_helper_hpd_irq_event(drm);
-		if (changed)
-			dev_dbg(hdmi->dev, "connector status changed\n");
-	}
+	dw_hdmi_qp_hpd_notify(hdmi->hdmi);
 }
 
 static irqreturn_t dw_hdmi_qp_rk3576_hardirq(int irq, void *dev_id)
@@ -792,8 +785,7 @@ static int __maybe_unused dw_hdmi_qp_rockchip_resume(struct device *dev)
 
 	dw_hdmi_qp_resume(dev, hdmi->hdmi);
 
-	if (hdmi->encoder.encoder.dev)
-		drm_helper_hpd_irq_event(hdmi->encoder.encoder.dev);
+	dw_hdmi_qp_hpd_notify(hdmi->hdmi);
 
 	return 0;
 }

-- 
2.55.0

