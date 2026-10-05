Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5C612874E6
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 00:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791160741; cv=none; b=r+8LrjzzkqZs6UREeBf1p3Pr7z3u9at90EBzjz8qnuWwMnfj0vqIImB3EMs9yl4Q/zTohQcVZeHL4e2oEQH5x18/LBglvfLk5Qzp1LN4e1ammYf/zpJ4tsvCFokJ+F1Wozp69quYnbNDfFUOfdxDkZK2AQRDgB+ysvRWLBarako=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791160741; c=relaxed/simple;
	bh=owHsNVM0dvIItDRqvO4tVUDptJq+19rU1q/eyPIbg64=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JQCTqhPNS5akdrRm9cV7vgmXCsuBBygOQUjfx9FmhGxMB2OwpN9aChk5kKxe8RxoiDYhIkehNQIxi01MkFKqz+wajLUuOHtEQDvd6pzAFrK6rM5G5f0Or2H0Q7UB+RKKBmwjir2B9/68FwPqVrT2gBfpeNw+YCbNvEq94bqz0yg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=c6g58vfN; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="c6g58vfN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1791160729;
	bh=owHsNVM0dvIItDRqvO4tVUDptJq+19rU1q/eyPIbg64=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=c6g58vfN7hnIOEw6K8Dsr74QkZ5Ik1Ukn0Uge6+vCozNWP8CvQRgNo8oUDw/7fXGC
	 /v7gmnI/sS+7xYzazzZlACqEzFsVHLy1mUFQoxhFY9ifS/pyZ+2GUFt/1Y2SoGNiVf
	 kiB2Whi/ZQ0Pom8rlzZ5tX9L9jy656hBiQDnuGIiXn9mxB2Wm8LbOsM4c47nZoZ+Fx
	 Xstu8EgFk6BQunPluog5V17Ixeg4iLzRG8U0Fv4eWGr0pbiKCkAppL6IhVmrVPZlyP
	 4YAVPuIQyPUa70bJC1Bf7ktZyz5se3cHXtQyE9Ah+qqm+0dN9MOXmtO8E/zJntQlxH
	 hB+NmcoMEgzWA==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id BA0FB17E0FB7;
	Mon, 05 Oct 2026 02:38:49 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Mon, 05 Oct 2026 03:38:07 +0300
Subject: [PATCH v12 06/16] drm/rockchip: dw_hdmi_qp: Fix invalid drvdata
 access in PM ops
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261005-dw-hdmi-qp-scramb-v12-6-195157ba0b40@collabora.com>
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
 linux-arm-kernel@lists.infradead.org, Sashiko <sashiko-bot@kernel.org>, 
 =?utf-8?q?Robin_R=C3=A4ber?= <robin.raebi@gmail.com>, 
 Igor Paunovic <royalnet026@gmail.com>
X-Mailer: b4 0.15.2

The system-sleep PM callbacks fetch the driver state via
dev_get_drvdata() and dereference it unconditionally.  However, the
platform device is bound by ->probe(), which merely registers a
component, hence the callbacks may well run when no valid state is
available:

- Before the aggregate driver calls ->bind(), e.g. when the system
  suspends while probing is still deferred waiting for the VOP,
  dev_get_drvdata() returns NULL.

- After ->unbind(), or when ->bind() fails past platform_set_drvdata(),
  drvdata is left pointing to memory obtained via drmm_kzalloc(), which
  is released together with the DRM device, while this platform device
  remains bound and PM-capable.

Publish the driver data only after ->bind() completes successfully, and
clear it in ->unbind().  This ensures that a non-NULL drvdata always
represents live state, allowing each PM callback to rely on a single
NULL check.

Fixes: 128a9bf8ace2 ("drm/rockchip: Add basic RK3588 HDMI output support")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/20260702151550.8E14D1F000E9@smtp.kernel.org/
Closes: https://lore.kernel.org/all/20260723014811.1F9F01F000E9@smtp.kernel.org/
Tested-by: Robin Räber <robin.raebi@gmail.com>
Tested-by: Igor Paunovic <royalnet026@gmail.com> # RK3588 Orange Pi 5 Plus, dual HDMI
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
index 9c4cf68d79d5..646a4cb96830 100644
--- a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
@@ -683,8 +683,6 @@ static int dw_hdmi_qp_rockchip_bind(struct device *dev, struct device *master,
 	if (ret)
 		return dev_err_probe(hdmi->dev, ret, "Failed to init encoder");
 
-	platform_set_drvdata(pdev, hdmi);
-
 	hdmi->hdmi = dw_hdmi_qp_bind(pdev, encoder, &plat_data);
 	if (IS_ERR(hdmi->hdmi))
 		return dev_err_probe(hdmi->dev, PTR_ERR(hdmi->hdmi),
@@ -695,6 +693,8 @@ static int dw_hdmi_qp_rockchip_bind(struct device *dev, struct device *master,
 		return dev_err_probe(hdmi->dev, PTR_ERR(connector),
 				     "Failed to init bridge connector\n");
 
+	platform_set_drvdata(pdev, hdmi);
+
 	return 0;
 }
 
@@ -704,6 +704,8 @@ static void dw_hdmi_qp_rockchip_unbind(struct device *dev,
 {
 	struct rockchip_hdmi_qp *hdmi = dev_get_drvdata(dev);
 
+	dev_set_drvdata(dev, NULL);
+
 	cancel_delayed_work_sync(&hdmi->hpd_work);
 }
 
@@ -726,7 +728,8 @@ static int __maybe_unused dw_hdmi_qp_rockchip_suspend(struct device *dev)
 {
 	struct rockchip_hdmi_qp *hdmi = dev_get_drvdata(dev);
 
-	dw_hdmi_qp_suspend(dev, hdmi->hdmi);
+	if (hdmi)
+		dw_hdmi_qp_suspend(dev, hdmi->hdmi);
 
 	return 0;
 }
@@ -735,6 +738,9 @@ static int __maybe_unused dw_hdmi_qp_rockchip_resume(struct device *dev)
 {
 	struct rockchip_hdmi_qp *hdmi = dev_get_drvdata(dev);
 
+	if (!hdmi)
+		return 0;
+
 	hdmi->ctrl_ops->io_init(hdmi);
 
 	dw_hdmi_qp_resume(dev, hdmi->hdmi);

-- 
2.55.0

