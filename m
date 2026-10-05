Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D2F0282F24
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 00:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791160740; cv=none; b=ktXLC3dmxUCNBtUrPA1RPWOLzQmVokhveLcjdDld150QTp55MhP7es+B4184Khlfba+UKdDQQchHJ664DpsAdynZOd3wQMahL+pUCEpkfFH0xCZUwn/derBUmeAkLVq6i/q1KbJk69gCx2qy2q6bamAhEwAAWPi7AC5ZMXcYsxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791160740; c=relaxed/simple;
	bh=piFUhSsVM6dznBeqHDG8mXOwHyyVgOt/aNawLBe88SU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JsRutqKu7u3y+ExGgS3F3G861cr4bN0HmmBVzwYmhE1n3E1RDeOLFrdqowxFAu4Ri037duzRuQ1FlstzoQRGKMNUZoGjLm+5FGluWtkXTpJpDVrOxam26qjKTXcEInac9uxfBduj4aguOAR/GxULzISKlhLqfxdzI7Ik1T7M34s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=eaZhnhth; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="eaZhnhth"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1791160732;
	bh=piFUhSsVM6dznBeqHDG8mXOwHyyVgOt/aNawLBe88SU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=eaZhnhthgS6/VNZck0EfG7GtyNIfAGW05btR4TsbW9TBaXcX8BDeYEc8BJIjyBCKs
	 bxGCok9u1tYjY/QIKCV5p+1XVpEbN18NejhkG+QgSjrZyYRM/OkOCfCEZLnCEcRIXS
	 I8Rtb/ATqQGFutT8mt5KanrASK0nOAmpJTop4FisGmIi2Q3IghPXvb/Aq3TEyT//nt
	 Nbl2zO3XYvqYBo7oB2OVYRRaSN3Sss1XcXAbzHW629XHbFng8wAFgaHtRck/4ReLPz
	 vmqupu3Y9iN8vehsFIC6lUdO1a0UQv8r4xAOd8ioQdp0/sAEeCMejMY++M98vaY1T8
	 VS38dqAyCKCvg==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8268F17E1274;
	Mon, 05 Oct 2026 02:38:52 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Mon, 05 Oct 2026 03:38:11 +0300
Subject: [PATCH v12 10/16] drm/rockchip: dw_hdmi_qp: Avoid spurious HPD IRQ
 thread wakeups
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261005-dw-hdmi-qp-scramb-v12-10-195157ba0b40@collabora.com>
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
 Diederik de Haas <diederik@cknow-tech.com>, 
 =?utf-8?q?Robin_R=C3=A4ber?= <robin.raebi@gmail.com>, 
 Igor Paunovic <royalnet026@gmail.com>
X-Mailer: b4 0.15.2

The RK3576 and RK3588 HPD hardirq handlers read shared status registers
and currently wake the threaded handler whenever any bit in those
registers is set.  This can wake the HDMI IRQ thread for unrelated
status bits, and on RK3588 can also wake the thread for the other HDMI
port.

Mask the status value with the SoC-specific HPD interrupt bit before
deciding whether to wake the threaded handler.  On RK3588, select the
HDMI0 or HDMI1 HPD bit according to the instance port id.

No stable backport is needed.  The issue may only cause spurious IRQ
thread wakeups and does not cause functional breakage.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/20260702151346.5A4EC1F000E9@smtp.kernel.org/
Tested-by: Diederik de Haas <diederik@cknow-tech.com>  # NanoPC-T6 LTS, Rock 5B
Tested-by: Robin Räber <robin.raebi@gmail.com>
Tested-by: Igor Paunovic <royalnet026@gmail.com> # RK3588 Orange Pi 5 Plus, dual HDMI
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
index 456bf2f194d7..dff400233154 100644
--- a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
@@ -34,6 +34,7 @@
 
 #define RK3576_IOC_HDMI_HPD_STATUS	0xa440
 #define RK3576_HDMI_LEVEL_INT		BIT(3)
+#define RK3576_HDMI_OHPD_INT		BIT(4)
 
 #define RK3576_VO0_GRF_SOC_CON1		0x0004
 #define RK3576_HDMI_FRL_MOD		BIT(0)
@@ -64,7 +65,9 @@
 #define RK3588_HPD_HDMI1_IO_EN_MASK	BIT(13)
 #define RK3588_GRF_SOC_STATUS1		0x0384
 #define RK3588_HDMI0_LEVEL_INT		BIT(16)
+#define RK3588_HDMI0_OHPD_INT		BIT(17)
 #define RK3588_HDMI1_LEVEL_INT		BIT(24)
+#define RK3588_HDMI1_OHPD_INT		BIT(25)
 #define RK3588_GRF_VO1_CON3		0x000c
 #define RK3588_GRF_VO1_CON6		0x0018
 #define RK3588_COLOR_DEPTH_MASK		GENMASK(7, 4)
@@ -348,7 +351,7 @@ static irqreturn_t dw_hdmi_qp_rk3576_hardirq(int irq, void *dev_id)
 	u32 intr_stat, val;
 
 	regmap_read(hdmi->regmap, RK3576_IOC_HDMI_HPD_STATUS, &intr_stat);
-	if (intr_stat) {
+	if (intr_stat & RK3576_HDMI_OHPD_INT) {
 		val = FIELD_PREP_WM16(RK3576_HDMI_HPD_INT_MSK, 1);
 
 		regmap_write(hdmi->regmap, RK3576_IOC_MISC_CON0, val);
@@ -381,6 +384,8 @@ static irqreturn_t dw_hdmi_qp_rk3588_hardirq(int irq, void *dev_id)
 
 	regmap_read(hdmi->regmap, RK3588_GRF_SOC_STATUS1, &intr_stat);
 
+	intr_stat &= hdmi->port_id ? RK3588_HDMI1_OHPD_INT : RK3588_HDMI0_OHPD_INT;
+
 	if (intr_stat) {
 		if (hdmi->port_id)
 			val = FIELD_PREP_WM16(RK3588_HDMI1_HPD_INT_MSK, 1);

-- 
2.55.0

