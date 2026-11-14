Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794621654;
	b=Nvu464+8FQmYUnCh95Hpbq3WDr2aI4OfdxP3v+EUTF1TthV/HUIa9TulgPShsIP8dJDg
	 Z1v1Ewx1x+BT2VCHXaJ7PHkm7zk6tqfF3REXUMRT4GslhepMZBD1UlO6xYfMTW5HTjFzS
	 LUfWxGK2y4bf7ypfqHMbzD4Fqp6E+0Wkkak5zEy+B7rKl3ip6/xSWrhaQ/Og2aIcnWCxc
	 JBtzK1ITJaq0dcGVLTJ9sO43MTANxH1dQ/63kMOTC/R/ZBf1h19T3MVLYPS26N7S/GH9Z
	 LJZMTkYc9wQ2yuBzxFmXFw3KwUEjDcl2+NBCZCP827X/65ayDqx5nyTyoirGNOibb9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794621654;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=2OSpRSMY5S7gJ0YlvoZIj+BjbDx5rDvM6lPm/wqvFII=;
	b=fcHwP0sb7FqzGuVLI6MOypB0IVT4pI/zegMgCwsOKJ0cMhNFkWX1PAQq1y2a0wSjgCDy
	 Oap9FOjshwllKAg5cQUqSzbhAjeadNdjIv9jHwFlZZV77Aop09ONMn3YIv8TQDS/tsani
	 H7XCE3ngfqslCu0MooWPsmxmISAEVy9gc7ZwbThxbsadYXpKfZEdwi2WsoJFxvR1zrL8g
	 YIuTEyjvIMeWTUWChhWAECL30SM/BlLIxIbL0tn/OZk7CIsTXnMq0e7+ww4UAzaFwbVHX
	 im+Q5m6y/6glBK3xH6S4v5SBGiiZxdO1VIO1NMYOAheImKG6nipGAOcux73uEodu2PQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=MNplbPlm;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B4F7606A330
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 02:00:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B4F7606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=MNplbPlm
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794621650;
	bh=vCRDwnWAmUXifR4KoaHyZqwG4bnpG8tRLsDIqivw6G8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=MNplbPlmmEifVRXBMuTOWacph3vYjvvdzUpcc2Hbp8OYut02GGqklR2RkcoK4ywrt
	 TO0V0uun2O6PioHbZKXk84GdlmPfQ+Xp7nH/AsJotVjlmxTTd0CGHn4jkh1a378pY6
	 noKT2yCZ0SgOIsuvZYRmha4D2qVTVFGZSaPbTKZjgaVBVoSaouhQCvs59ZUcQmtm6j
	 IIgrM0Vx6nRrIM92Cj6xsNzYwO1ikKwyWcgfvix+vzUbzguVXxOp/UcgiXpmc/dKA0
	 zZRMuLv9M3s1HNCJKQXKcGIyCOnSbokPGug3kDvWNnjYeAv5tqawJ/jBerUl1pZmAA
	 Mt3gr91MA6Blg==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id BA47517E0CD7;
	Sat, 14 Nov 2026 03:00:50 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 77CC1480035; Sat, 14 Nov 2026 03:00:50 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Sat, 14 Nov 2026 03:00:31 +0100
Subject: [PATCH v17 4/7] phy: rockchip: usbdp: Fix power state handling
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261114-b4-rockchip-usbdp-cleanup-part3-v17-4-1af5f566408e@collabora.com>
References: <20261114-b4-rockchip-usbdp-cleanup-part3-v17-0-1af5f566408e@collabora.com>
In-Reply-To: <20261114-b4-rockchip-usbdp-cleanup-part3-v17-0-1af5f566408e@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Zhang Yubing <yubing.zhang@rock-chips.com>, 
 Frank Wang <frank.wang@rock-chips.com>
Cc: Igor Paunovic <royalnet026@gmail.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, 
 Alexey Charkov <alchark@flipper.net>, 
 Chaoyi Chen <chaoyi.chen@rock-chips.com>, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=7335;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=vCRDwnWAmUXifR4KoaHyZqwG4bnpG8tRLsDIqivw6G8=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGr3wNLuHdkH4aRhKJgrhS5XJr3BNnbPLn5sz
 bX464rZWHOmaYkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJq98DSAAoJENju1/PI
 O/qaIvAP/3oT92PUeOAwmig7lR/lfbV+MJNa3P+wG+YkZoAMH3iSPQETpOvNmkjWjuBW1IXe3mb
 o7MjiuAhPd3/NUeQywv6sja2XdBPmMKjG1xaWTt+hMoanxG7NbPs8ou//KocCw4yfUNxkRyL1MT
 5FHKsK5QCzvhIPMsqPNmBMRSIOnde6QHss390k5pqbMEAgIkrVgGyaPwBL/CindxCF+fVAE7lSY
 LAmADmMnMFGM2XtfrMEJ3h/94xRkI5F4/jROwPQVi3CJ8U3A2XODKViyqJTC5y5uvLHY58GR0Jn
 w/Vm0Uv9ZdBdC+gQ41DNbzDftYGPvu45c4mIXWSFwGGaUQzf/DRPIBDdjO0hoFguDcuyTSlyetn
 iOIABN1tf2CNsAkSUpBKiWyBaEE3ZYPRJ+hkE1qcZABUeFq70T/kCjxh9fEoJS9RL5aghW0xOMH
 LAbQd5jdRTF5MLYcZ7iIghvIIqPqUeLA38VMavc7Ezg1GTcMuq4wJdZ+Ri0XRFyLHLnYnRS4MQB
 qg4CfDUUikX6nXxmCMI1DhvRo7ivvgOWLfADVRPS2f+VtwPcXcoZkUjrb9YPM/OoA/8qR2KylaK
 r75qF8KvrMmqmq268bLek79iHYjtIByuAKObDwQuTa4iqMvqxLE6g+E1/EvYEkbHE+WzT7gh5Kd
 4fRuQYA3Ys6Mant3R2ckq7Q==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

Restructure power state handling, so that the function uses sw_mode and
hw_mode to figure out the actual required hardware state. This allows
any path updating either of those modes to simply call
rk_udphy_update_power_state() to get the right hardware state.

This makes it a lot more obvious what is going on and also fixes a few
potential resource leaks identified by Sashiko as a side-effect. For
example if USB3 is requested by software while the USB-C is in DP-only
mode, things are decently handled after this.

Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 122 +++++++++++++++++-------------
 1 file changed, 70 insertions(+), 52 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index de8f01bd0467..fc3c4104dcd7 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -173,10 +173,10 @@ struct rk_udphy {
 
 	/* PHY status management */
 	bool flip;
-	bool phy_needs_reinit;
+	bool phy_needs_reinit; /* lane mux changed */
 	u8 hw_mode; /* modes currently supported by hardware */
-	u8 status;
 	u8 sw_mode; /* modes currently requested */
+	u8 status;
 
 	/* utilized for USB */
 	bool hs; /* flag for high-speed */
@@ -1029,70 +1029,93 @@ void rk_udphy_register_reset_handler(struct phy *phy,
 }
 EXPORT_SYMBOL_GPL(rk_udphy_register_reset_handler);
 
-static int rk_udphy_power_on(struct rk_udphy *udphy, u8 mode)
+static int rk_udphy_update_power_state(struct rk_udphy *udphy)
 {
+	bool usb3_port_enable;
+	u8 target_mode;
 	int ret;
 
-	if (!(udphy->hw_mode & mode)) {
-		dev_info(udphy->dev, "mode 0x%02x is not support\n", mode);
+	/*
+	 * Initialize PHY mode according to the hardware setup (either described
+	 * in DT or negotiated via the Type-C controller) instead of requesting
+	 * only the needed PHY side, because that would break the USB/DP data
+	 * streams when the other PHY is being requested. This is not an issue
+	 * during the Type-C negotiation as that happens during the hotplug phase
+	 * and not during normal operation. Also disable everything if the
+	 * software has not requested anything, as there shouldn't be any active
+	 * data streams in that case.
+	 */
+	target_mode = udphy->hw_mode;
+	if (udphy->sw_mode == UDPHY_MODE_NONE)
+		target_mode = UDPHY_MODE_NONE;
+
+	usb3_port_enable = !udphy->hs && (target_mode & UDPHY_MODE_USB);
+
+	if (!udphy->phy_needs_reinit && udphy->status == target_mode) {
+		if (udphy->sw_mode & UDPHY_MODE_USB)
+			rk_udphy_u3_port_disable(udphy, !usb3_port_enable);
 		return 0;
 	}
 
-	if (udphy->status == UDPHY_MODE_NONE) {
-		rk_udphy_run_reset_handler(udphy, true);
+	/* Avoid to re-init disabled PHY */
+	if (udphy->status == target_mode && target_mode == UDPHY_MODE_NONE)
+		return 0;
+
+	/*
+	 * Inform DWC3 driver, that we are about to reset the PHY, so that it can
+	 * assert its PIPE reset lines and avoid DWC3 getting into a buggy state.
+	 * This is intentionally done for a PHY disable, since that also changes
+	 * the clocks routed to the PHY.
+	 */
+	rk_udphy_run_reset_handler(udphy, true);
 
+	/*
+	 * Disable USB3 port, which among other things re-routes a DWC3 clock to
+	 * avoid SErrors when the DWC3 registers are accessed while the PHY is
+	 * disabled. This is only done, when the DWC3 is running as the accessed
+	 * GRF registers and in PD_USB.
+	 */
+	if (udphy->sw_mode & UDPHY_MODE_USB) {
 		rk_udphy_u3_port_disable(udphy, true);
 		udelay(10);
+	}
 
+	if (udphy->status == UDPHY_MODE_NONE) {
+		/* Power up (incl. clocks) */
 		ret = rk_udphy_setup(udphy);
 		if (ret) {
 			rk_udphy_run_reset_handler(udphy, false);
 			return ret;
 		}
-
-		if (!udphy->hs && udphy->hw_mode & UDPHY_MODE_USB)
-			rk_udphy_u3_port_disable(udphy, false);
-		udphy->phy_needs_reinit = false;
-
-		rk_udphy_run_reset_handler(udphy, false);
-	} else if (udphy->phy_needs_reinit) {
-		rk_udphy_run_reset_handler(udphy, true);
-
-		rk_udphy_u3_port_disable(udphy, true);
-		udelay(10);
-
+	} else if (target_mode == UDPHY_MODE_NONE) {
+		/* Power down (incl. clocks) */
+		rk_udphy_disable(udphy);
+	} else {
+		/* Mode change => re-init */
 		ret = rk_udphy_init(udphy);
 		if (ret) {
 			rk_udphy_run_reset_handler(udphy, false);
 			return ret;
 		}
-
-		if (!udphy->hs && udphy->hw_mode & UDPHY_MODE_USB)
-			rk_udphy_u3_port_disable(udphy, false);
-		udphy->phy_needs_reinit = false;
-
-		rk_udphy_run_reset_handler(udphy, false);
 	}
 
-	udphy->status |= mode;
-
-	return 0;
-}
-
-static void rk_udphy_power_off(struct rk_udphy *udphy, u8 mode)
-{
-	if (!(udphy->hw_mode & mode)) {
-		dev_info(udphy->dev, "mode 0x%02x is not support\n", mode);
-		return;
-	}
+	/* Ensure USB3 support is enabled when supported */
+	if (udphy->sw_mode & UDPHY_MODE_USB)
+		rk_udphy_u3_port_disable(udphy, !usb3_port_enable);
 
-	if (!udphy->status)
-		return;
+	/*
+	 * Inform DWC3, that we are done with the reset, so that it can deassert
+	 * its PIPE reset line. This is sent in pair with a PRE_RESET allowing
+	 * consumer driver to do paired resource requests (e.g. clocks) in their
+	 * notification handlers. As we reroute the clocks, its also fine to
+	 * send this after completely disabling the PHY.
+	 */
+	rk_udphy_run_reset_handler(udphy, false);
 
-	udphy->status &= ~mode;
+	udphy->status = target_mode;
+	udphy->phy_needs_reinit = false;
 
-	if (udphy->status == UDPHY_MODE_NONE)
-		rk_udphy_disable(udphy);
+	return 0;
 }
 
 static int rk_udphy_dp_phy_power_on(struct phy *phy)
@@ -1105,7 +1128,7 @@ static int rk_udphy_dp_phy_power_on(struct phy *phy)
 
 		phy_set_bus_width(phy, udphy->dp_lanes);
 
-		ret = rk_udphy_power_on(udphy, UDPHY_MODE_DP);
+		ret = rk_udphy_update_power_state(udphy);
 		if (ret) {
 			udphy->sw_mode &= ~UDPHY_MODE_DP;
 			return ret;
@@ -1135,9 +1158,7 @@ static int rk_udphy_dp_phy_power_off(struct phy *phy)
 	udphy->sw_mode &= ~UDPHY_MODE_DP;
 
 	rk_udphy_dp_lane_enable(udphy, 0);
-	rk_udphy_power_off(udphy, UDPHY_MODE_DP);
-
-	return 0;
+	return rk_udphy_update_power_state(udphy);
 }
 
 /*
@@ -1349,12 +1370,12 @@ static int rk_udphy_usb3_phy_init(struct phy *phy)
 	udphy->sw_mode |= UDPHY_MODE_USB;
 
 	/* DP only or high-speed, disable U3 port */
-	if (!(udphy->hw_mode & UDPHY_MODE_USB) || udphy->hs) {
+	if (udphy->hs) {
 		rk_udphy_u3_port_disable(udphy, true);
 		return 0;
 	}
 
-	ret = rk_udphy_power_on(udphy, UDPHY_MODE_USB);
+	ret = rk_udphy_update_power_state(udphy);
 	if (ret) {
 		udphy->sw_mode &= ~UDPHY_MODE_USB;
 		return ret;
@@ -1371,13 +1392,10 @@ static int rk_udphy_usb3_phy_exit(struct phy *phy)
 
 	udphy->sw_mode &= ~UDPHY_MODE_USB;
 
-	/* DP only or high-speed */
-	if (!(udphy->hw_mode & UDPHY_MODE_USB) || udphy->hs)
+	if (udphy->hs)
 		return 0;
 
-	rk_udphy_power_off(udphy, UDPHY_MODE_USB);
-
-	return 0;
+	return rk_udphy_update_power_state(udphy);
 }
 
 static const struct phy_ops rk_udphy_usb3_phy_ops = {

-- 
2.53.0

