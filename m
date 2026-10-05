Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C03325B08E
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 00:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791160740; cv=none; b=ZdZjOoe81iIl7IhjRgSaS2Ib/yPuB7wfV4JU1jhwMawWL1lCNfLiORMlXerIDj77ZgG+1whHKG/+SXc46IrnPcnjzuQNsCPUhkRzu593gPTT7e26N+cIPXNBGE6FtG2DFxtiOJIO3Tme9omYgf2tzn3vc31aOPDbAROBa9S5iJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791160740; c=relaxed/simple;
	bh=OmuC3SuwC8OOCUyGgtbOzOcsvB6iXRpDbe8vWXSZbw0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=q1e71KhvkToG0H5Rcwtcjkb/0c2815mj8fA7jKQ1UWHPVdrOnXBMotBYJtr+t378q9xYigItSQeksreK02jSAksiK1pR0G+Agw9kuUXOhvHYF2lSFZlH0PD/0qYwK/l6z74crC9jIqFDUyYKDQIRFGylBpkCAsWsS8/Lp+Ml4Y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=bK9dkLlD; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="bK9dkLlD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1791160730;
	bh=OmuC3SuwC8OOCUyGgtbOzOcsvB6iXRpDbe8vWXSZbw0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=bK9dkLlD6vnDr08D2C7MyaM5MFohWgnHlvv7ecS3HPZFtA67vEF/HZSS9JHsmO0v3
	 6QnjDgkr1VlpidRwrhC/qXyUT+WZwBiH2Rm47UXnizZ5S0shBJRZXKOgRe+oPwS3Z0
	 mA3bhm7rN3DVF71EGTOFhmlOBJY4T/s+od2ZcFnm2faBFgoqJzVkmoIFn8R5rh/+p9
	 q0nFC61IySnewrkhRJoVOsxCEMUjZPEl5LaHzUEBlnX/ICEJTxLtOJWPwFhAxhdf6r
	 c6MtZF4eE/PQDyaY+/M8qdW9CamPH/8d5zVWOFmnuI5SwYb1G8Lqu7MY4KXSHB5Skw
	 ruZwMTaBdrrAA==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6AEAD17E0FE5;
	Mon, 05 Oct 2026 02:38:50 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Mon, 05 Oct 2026 03:38:08 +0300
Subject: [PATCH v12 07/16] drm/rockchip: dw_hdmi_qp: Cancel pending HPD
 work on suspend
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261005-dw-hdmi-qp-scramb-v12-7-195157ba0b40@collabora.com>
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

The HPD threaded handler debounces hotplug events by delaying
hdmi->hpd_work for 150 ms.  Nothing discards that work when the system
goes to sleep: drm_kms_helper_poll_disable() only disables the HPD IRQ
line via the bridge .hpd_disable() op, and disable_irq() merely waits
for the threaded handler, which has already returned after arming the
timer.

If the debounce expires during suspend, its non-freezable work may probe
the connector and read the EDID over DDC.  Since genpd powers off the
HDMI controller's power domain in ->suspend_noirq(), this access may
hit unpowered hardware and hang the system.

Cancel the work in the suspend callback.  The DRM device is registered
as a consumer of the HDMI device, so it always suspends first and the
HPD IRQ is already disabled by that point, meaning nothing can re-arm
the work behind our back.  No counterpart is needed on resume, as the
work gets scheduled again on the next hotplug interrupt.

Fixes: 128a9bf8ace2 ("drm/rockchip: Add basic RK3588 HDMI output support")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/20260723015909.7F79A1F000E9@smtp.kernel.org/
Tested-by: Robin Räber <robin.raebi@gmail.com>
Tested-by: Igor Paunovic <royalnet026@gmail.com> # RK3588 Orange Pi 5 Plus, dual HDMI
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
index 646a4cb96830..42f2627e1a05 100644
--- a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
@@ -728,8 +728,12 @@ static int __maybe_unused dw_hdmi_qp_rockchip_suspend(struct device *dev)
 {
 	struct rockchip_hdmi_qp *hdmi = dev_get_drvdata(dev);
 
-	if (hdmi)
-		dw_hdmi_qp_suspend(dev, hdmi->hdmi);
+	if (!hdmi)
+		return 0;
+
+	cancel_delayed_work_sync(&hdmi->hpd_work);
+
+	dw_hdmi_qp_suspend(dev, hdmi->hdmi);
 
 	return 0;
 }

-- 
2.55.0

