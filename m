Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794618169;
	b=yFxVLUglofVijVZPH8maz4I130FJse3Tcyk6Lx6FRo8N5X5WLGVg9weU5qYdsephw+T0
	 ior5+m/Ke8KuMw+AokbVr5WWXWPouopQBrJfC49O0ek0uXUhqtiWyrQsLhi4g1dSbjh9E
	 ZWf9J4yh8QlX5uAVerDKq9GJYcoaVYXN/MizbBiUMysNoL8OhI3xuJZ1Rvjpb9tf2xfIW
	 Logj51AAhLK7dZ4fuUzM+kD93z3dJYnqutVoOUMtGcPWUjFQveDsYe1s3Lz5D/wMeYste
	 3BCuyUT1ARz4mGeBBawofpFOSeWnOw8dSE4sQOy3v9FPdsn2b9JWo+YqInf/oSAnOrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794618169;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=jXCRl5od6/bd+8TATrwS6lLPDMeMCt8jrOi77H1L6As=;
	b=RQoOE1fPYsq9ka5qL+bowTDYkDkotzPjfvuvGG3UZ1di1ffO2I3x6T/pSTvT9BX1QEFW
	 my3+gfDsDKxdtjMVzFODJgdB2YdQrohhTTDEVvTxFZC19M/EzqGoDBM1F86sX5aWrtVp6
	 qkHTHRqBiIxxO/LGsCBRQGtRvBTuXhJaBwjIMyiyx+rPhLkuQTeTKeYF+8RbELd3d6dJ5
	 zkxw22pRp9asYYjR5vkShJRAy9z2LaP0kOIyf8Ct6L2JAXAESqAl5o83Po9M3s+3tHpKs
	 SipWEOlujIsGEO6jRgWa9NujEuHn/zZ1jt0+4MaZwQ0YB4FfkKxbTDdBX1vJiYP2yKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=cevfcFXe;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18BD1606A327;
	Sat, 14 Nov 2026 01:02:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 18BD1606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=cevfcFXe
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794618166;
	bh=sUG9ych+u8JRCPvClkQmNGRZbz6iFbmjqNm2EPiF2aE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=cevfcFXewlPtqKLSUYFBpFP1cWSglgoud4wItwWRsYqTOTIeMCwNLowO1igKI/RmR
	 VufOcXu919xCRw3SfiiVbcVaRAQFV4T8DZRfn2lAiA3ku9sG4V+xaY00zy2ymTTChM
	 TLb3KGSRmrBSUNgZtaNEw5muI3Uh5M/bQtl1UaXuE3byCjZkpHdL1eFXYQATRB+TFQ
	 CElIli/AxOyuz8mCLFAVNdQampQZXVJBshR+D584LinaUOqhbFt5V77NK1UnBrKzkH
	 Amp+3PiK48AgrPOKrHFrLi+vaOhJJxFgmCdmFZHXcSKtctoCRhHku+9OozgTIwYsAu
	 gLjF2qWsM0EmQ==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 08E0617E09BC;
	Sat, 14 Nov 2026 02:02:46 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id C172D48002B; Sat, 14 Nov 2026 02:02:45 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Sat, 14 Nov 2026 02:02:00 +0100
Subject: [PATCH v19 1/6] phy: rockchip: usbdp: Track PHY power state
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
Message-Id: <20261114-b4-rockchip-dwc3-rockchip-glue-v19-1-b79fb5f4b42a@collabora.com>
References: <20261114-b4-rockchip-dwc3-rockchip-glue-v19-0-b79fb5f4b42a@collabora.com>
In-Reply-To: <20261114-b4-rockchip-dwc3-rockchip-glue-v19-0-b79fb5f4b42a@collabora.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Heiko Stuebner <heiko@sntech.de>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, 
 Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>, 
 Chaoyi Chen <chaoyi.chen@rock-chips.com>, 
 Igor Paunovic <royalnet026@gmail.com>, Alexey Charkov <alchark@flipper.net>, 
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-phy@lists.infradead.org, kernel@collabora.com, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2524;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=sUG9ych+u8JRCPvClkQmNGRZbz6iFbmjqNm2EPiF2aE=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGr3szXBuJQq7BfqOKugr4c8R251lbULzRPpx
 608CreYNgHQuYkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJq97M1AAoJENju1/PI
 O/qamasQAKT/3JIgUbM6SBLv48AEunELYHOg/udHGqLuISEkCCGDXgaQFh9AS8jeMS12Arr3Vmj
 KZG6FqoxuQnA8/CAu/t2aNKvq0CbdE4Qevm02p0oe3kR3s7SAkzrwgC+/V2M/slWDsxhYG28Ql2
 SR9UDlOo+EfArP1lHqJ5zrgMq0eqKa1VfKq1kOvzwi6p+oB8ykEC47YZNtMtXV9q39Wgp/udNrk
 Nb+w0wblhMya3F+C5K4M/WgR+yLpwA9w4WzqHkxAgujhKvISmLvyWFdOB2pSz16GCrYWt4i5N73
 Yx/U4WHLnReVtHlpOA1v2g5tQn6N8rga775UXRnlAQYZ6Y46zw3e+LAn4oGQXUr0eH2Lzc6AvbB
 wXdHN4MKId0tZquZV4U9a9PgwG8Y+1TwjlxwbjW0p/FcWbUXKFV1ymrLiUNRObY9uMGzpl8PA7c
 D225d+mQHo2fqaEMopZlLqht9vOp41kF0MtFKfV2f8hz6xr8BjqaDt+IhZsYudoNkePCcgsMNrd
 Wzto5TRiZ2jDBDhMslZc95aQr2/ZdTso6sk3qPOl+dqetoWBQv8BwNBzFTUPhWkWQ0HxL+2ykqe
 TIGQMCqrufddEiF/AJCepG9jxXe/xUnkjDEo1At6u70B0JX/xMJYrpTsveBjPeuGXY+dn7oV0Rc
 jJcUSwK5/eScNAV9VFjkxYg==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

Track PHY state requested by software for DP and USB3 individually
in preparation to rework and fix up power state handling.

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Tested-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index e748acdd2d31..cb1f455accf8 100644
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
@@ -1304,6 +1320,8 @@ static int rk_udphy_usb3_phy_exit(struct phy *phy)
 
 	guard(mutex)(&udphy->mutex);
 
+	udphy->sw_mode &= ~UDPHY_MODE_USB;
+
 	/* DP only or high-speed */
 	if (!(udphy->mode & UDPHY_MODE_USB) || udphy->hs)
 		return 0;

-- 
2.53.0

