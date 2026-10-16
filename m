Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9764B4DD3C5;
	Fri, 16 Oct 2026 18:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792176218; cv=none; b=uPZp8zIUtLp0VZpaYsV7ZPXTv0I77OX4d+jBSie36aU8M5tZsnFavNl8sbKM/dC+lrdFEPTCMKP0guR7O97ShO30XYgx9rXCwNxe9s8vP00WFtDKyNVv8wASHMxIFg4f+QdgB61PDJJfYRwLWAYM0e00nyccuA0iOuAH2uyLBmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792176218; c=relaxed/simple;
	bh=MCl1FOSpA7SuW3bd8m8Pvr5oVKQyNd3+SnOXH7ZFde0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ezp5UFF5LD8YJDcYLU7O7eQKjvTYyw4jmm+a2QfTZlaENT2nhJelOEL8rlA6MyjO2KVu/qbEOZRt3EyZXQmfoNoHn+GuHfAgj+ZkEl8j7xXR4ZeCnatkAqn8oqdExDucvxkARoQjYBd3m5c/Xj9DmR7Z0b+e81wBlRcc1Boh6DQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=N3YdvkfF; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="N3YdvkfF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1792176214;
	bh=MCl1FOSpA7SuW3bd8m8Pvr5oVKQyNd3+SnOXH7ZFde0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=N3YdvkfFtlAzFIvHxBuVWJX08Bv7wPQFBlNtMFjU38IUoCeJHw+xK8ekJzaRjgFwH
	 bBHqzCy0PiFTwgV6lEXD/T0Kbf5B7s9FS3ItmTOC4EIANGjyS5ReukQER5VX0gtB4K
	 1lBuuuro9TbJgkNL9MOCF63QN2gPeua3gvxKZVDLmWadR7bHz4v5kF8ay+c+rgpZg+
	 qRg3nGxcb0fp0rvtdHjMB+olas9rUP4Rb8UULl/uHw4hcuen0CzQ23gQXbVbeeOtbD
	 TZjrIQmFvoEjV1+8b834CDjcmzS0LlNw9hxlJWNpvgxUJcG8vwecE2OEtNDyF70+bc
	 9pX3gNyfOduiw==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A990C17E053D;
	Fri, 16 Oct 2026 20:43:34 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 60EA7480027; Fri, 16 Oct 2026 20:43:34 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 16 Oct 2026 20:43:17 +0200
Subject: [PATCH v17 1/7] phy: rockchip: usbdp: Track PHY power state
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-b4-rockchip-dwc3-rockchip-glue-v17-1-876f96893e2f@collabora.com>
References: <20261016-b4-rockchip-dwc3-rockchip-glue-v17-0-876f96893e2f@collabora.com>
In-Reply-To: <20261016-b4-rockchip-dwc3-rockchip-glue-v17-0-876f96893e2f@collabora.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Heiko Stuebner <heiko@sntech.de>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>
Cc: Igor Paunovic <royalnet026@gmail.com>, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-phy@lists.infradead.org, 
 kernel@collabora.com, Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2390;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=MCl1FOSpA7SuW3bd8m8Pvr5oVKQyNd3+SnOXH7ZFde0=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGrScFZ3Ur4zZ+Tt3G48Cu2ihGhAUpGxSC5eE
 XI+tzsRbk3MzYkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJq0nBWAAoJENju1/PI
 O/qaJGoP/1QHU92xgEVKTF6Y5LWJTxRM4u5xPlfueWx51HNKcN+KpdZEIMNFUd2OFgAz0uTxvOW
 LFDraEyjU6I7ZPXU3I9LgABFJ3ZxZvs/irEvADh/6v1dEyUdC9rl1lMTAlsVWTsagnUhKjhbYbZ
 Pt32lPHifP7s6LtrQw+PWGI9bPp4UUhVVzyLGBKlxSVjO4BioBylllPDmKzGcFx4gK6gmG/efsv
 Kzk3CNEtcWBSgAHiklHRPY2d/lQMhVqNYgwC2cSFZ0l7LdSbI+0+LP/5p7e4bpKUMejAHK6Ph22
 pRf7QSWm04exFefhzw8GfUWYrEYiLTo9PXQ4WFASy/pvpkzoKkAQsUsTF5v6qkWcsBlKAezXFzA
 pqLP+Ov+rHX1yvzIS2a1hKTIZNR1G8m+WzsMjRU5N8RIljPnQKt4c5dB1EDppQKPLVLAkelKMoD
 yUO/ZNXjG1RtiN6PkyZhdyIoa9UJoPCstzCRlG6FAelPYGqJ8MEAm7MzCOsdSqeUZcQ98j+t+o+
 74Wmzc3n11TefOdAN7BgHzYcyFVT8m9IBmbTWdcBt24hiy8UiIYSJPzL0HhEXAnJCSsbdzgYAeP
 J++i+jeX77y6n1RMv0JRgPdI2Go5MTvFhd2AurNqvr5Pr+DmcnjP47WYgIG3SAy5M5yHDHOGd7I
 /Fd/xTTYmFB+impmTd0YmRQ==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

Track PHY state requested by software for DP and USB3 individually
in preparation to rework and fix up power state handling.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index e748acdd2d31..db69dd24f73b 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -175,6 +175,7 @@ struct rk_udphy {
 	bool phy_needs_reinit;
 	u8 mode;
 	u8 status;
+	u8 sw_mode; /* modes currently requested */
 
 	/* utilized for USB */
 	bool hs; /* flag for high-speed */
@@ -1051,11 +1052,15 @@ static int rk_udphy_dp_phy_power_on(struct phy *phy)
 	int ret;
 
 	scoped_guard(mutex, &udphy->mutex) {
+		udphy->sw_mode |= UDPHY_MODE_DP;
+
 		phy_set_bus_width(phy, udphy->dp_lanes);
 
 		ret = rk_udphy_power_on(udphy, UDPHY_MODE_DP);
-		if (ret)
+		if (ret) {
+			udphy->sw_mode &= ~UDPHY_MODE_DP;
 			return ret;
+		}
 
 		rk_udphy_dp_lane_enable(udphy, udphy->dp_lanes);
 
@@ -1078,6 +1083,8 @@ static int rk_udphy_dp_phy_power_off(struct phy *phy)
 
 	guard(mutex)(&udphy->mutex);
 
+	udphy->sw_mode &= ~UDPHY_MODE_DP;
+
 	rk_udphy_dp_lane_enable(udphy, 0);
 	rk_udphy_power_off(udphy, UDPHY_MODE_DP);
 
@@ -1286,16 +1293,25 @@ static const struct phy_ops rk_udphy_dp_phy_ops = {
 static int rk_udphy_usb3_phy_init(struct phy *phy)
 {
 	struct rk_udphy *udphy = phy_get_drvdata(phy);
+	int ret;
 
 	guard(mutex)(&udphy->mutex);
 
+	udphy->sw_mode |= UDPHY_MODE_USB;
+
 	/* DP only or high-speed, disable U3 port */
 	if (!(udphy->mode & UDPHY_MODE_USB) || udphy->hs) {
 		rk_udphy_u3_port_disable(udphy, true);
 		return 0;
 	}
 
-	return rk_udphy_power_on(udphy, UDPHY_MODE_USB);
+	ret = rk_udphy_power_on(udphy, UDPHY_MODE_USB);
+	if (ret) {
+		udphy->sw_mode &= ~UDPHY_MODE_USB;
+		return ret;
+	}
+
+	return 0;
 }
 
 static int rk_udphy_usb3_phy_exit(struct phy *phy)
@@ -1308,6 +1324,8 @@ static int rk_udphy_usb3_phy_exit(struct phy *phy)
 	if (!(udphy->mode & UDPHY_MODE_USB) || udphy->hs)
 		return 0;
 
+	udphy->sw_mode &= ~UDPHY_MODE_USB;
+
 	rk_udphy_power_off(udphy, UDPHY_MODE_USB);
 
 	return 0;

-- 
2.53.0

