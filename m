Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794331181;
	b=XS9KHIrl7o7QjItqvgf0nSuFD82Q3yiLfHSZHqVqJleXPGBK+mDDyX5hQZhzyktra6B3
	 /XAbWkKrc9FLh+LMtCYocpSt4A/+9UhBWdQWHzI6DapMTgYLaogHZT4oxUvY+JsIPr8vO
	 4oH0FTpwy3bVk9xBgZu4ITpfD6KdkrZWbxSRjkxwmUNsnvN8iw9DEDdkbcomhF0/RGm/K
	 O9KUiSEaqgAR8CN8GrZAy0tFiVEjWCS5iHnPvH7HLcHFdMRsM5ORPAZLwZdDJvqimT4nQ
	 YAvimNZlGi1tiNNkn0/CrcwYnY5Vq4qWaoFJxixX+65hIzkwJFGLcrJI/VpEaww8CTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794331181;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=vLFtwTlQiX1kBL79qQ7wRkTkfPyk318x5Lu6zEB3kgA=;
	b=rrP0SsITI8YeYCLnRlNEdg9gJu4vxv71f30d2+oep+7+BJzmlk01ftDKcaTEjWo2C0sN
	 X+yD3ObptQ6mYjp63WCFbmciuFCdbrL7JGzfIpx4NHs/10eCmHrwd1d2et87qRFzAKuFm
	 DoSvoi61lRqnk5bFLlVzmZWjd5gPDp8i6s3U9eY2fBpLXakVGSDYKmScX6fDAe1fijPNQ
	 PMG+Ld2El6ZW2h5say8kKpEi/K1YoUTghd7uNEP4uALAj9JfvFMl4hY78QP/P/eSl75Xb
	 AR9jS1d58lZT3xJ8jeOxM5qFn8oHB0CqZ96QhSBrTlC4PkNVUyiLyywy4g5EGG3qQ8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=mAYKqsm9;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E154606A335
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 17:19:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E154606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=mAYKqsm9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794331179;
	bh=cEdOypZJGYYFaGv+bcDJnJcN+5GsC8u8XziW0E9RE2s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=mAYKqsm9ZOnzXlda1nPeTj2Ncisqjvl1U+P9t6ev7BkqUgqVqMP4DEG6xwc47tQwT
	 IMLJWyZesRDqzoTdM3aD42GPQskf3bGy5KxyrFZgzNtHNe6SDXfEZbjChbJlh+fint
	 nXPN88xEwsidV9G6u50EFeuxvpusnZw3y1wKbXyYrk3OjMSUn4IFYe7eENY1cTR/Cq
	 hz23vehC89Jkq59apl5ebU4vyJkqdQmp/iYOY6B2rhWhJjbJ1bLkgmugvfC1xrv0pC
	 LlUh2MEqxDTZ0A6rIsef0+HqzFOK9cwI96QJPE4txkfJaQnsYJBIWjPUlWC7KFrdZu
	 W5AqpIXPgWljA==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 56CE117E0F7F;
	Tue, 10 Nov 2026 18:19:39 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 0E4CC480031; Tue, 10 Nov 2026 18:19:39 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 10 Nov 2026 18:19:16 +0100
Subject: [PATCH v5 3/6] phy: rockchip: inno-usb2: ignore reset_control
 return codes
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
Message-Id: <20261110-phy-rockchip-inno-usb2-clock-fix-v5-3-d2e24582ab22@collabora.com>
References: <20261110-phy-rockchip-inno-usb2-clock-fix-v5-0-d2e24582ab22@collabora.com>
In-Reply-To: <20261110-phy-rockchip-inno-usb2-clock-fix-v5-0-d2e24582ab22@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 William Wu <william.wu@rock-chips.com>
Cc: linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Igor Paunovic <royalnet026@gmail.com>, kernel@collabora.com, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2877;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=cEdOypZJGYYFaGv+bcDJnJcN+5GsC8u8XziW0E9RE2s=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGrzUioU83y55RoTcW5M4EslBdwW6sK1ipqKr
 dtG6ZQTX3KkjokCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJq81IqAAoJENju1/PI
 O/qapDoP/i8/CpMikDpZoqzjI0sxHyT9WjX7mRUHxuokQDn0KhQ5GF0zcPJUmmR+FCVtLVyy5t+
 mxuypXYJrmu1A2DQejqdpgKpjWy6KBTRRI+lXBI33uW0wMWafP+ZFhg63RUn16zRI+GR6XswxL3
 uclKwZRgy3+iEcsGlQ5M1nTnUyjXnMTpwZhNsyF57JYKEpFFey7minYTVXjtRBMXVeG8KV4V/Gs
 YtJ8inxOR8tyeYJZeFlrkqy9Aqpk7gMmobflFktUZJp5uncL2UaUPShU7xzFm3oNa6AZH/Hd4sp
 3SoDSyDs9RfIaqHhTENfkyCJeiASxe1PCd3Oha7hAK1Rr0yOaDMaF/BLRq3gm24vEFGlRZDbAxu
 pP4wMqZZCd4JudlNUgCUufPigJBvkhSWvWM8WellnAXLnO2Rc5d9umtDMGKRQHkea9tyaCRNkF2
 noqAVuQY+nbtpbBXLiONqOEAqw6o0jiBNZsMksD2HRXzuFECUbih4fBG816iL9YV/U+Ytd+jB9W
 mQjjYHtIZ19rMtDkKxoXQdPjfZbMFbmu4ib+/tznc0uIhWGk2EQmvwEwt0ZKxjdFQpeQm0X0yP2
 5cumy1AbUAa6OTprXTWd5LQjLsLmj2YkPLgY4wgLnmzIIzaUPXjkMie4ccA03IUW4uGFEUd2LpH
 dslJEkUf96da5jTH+tz8c0A==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

Asserting or deasserting reset lines for the Rockchip MMIO based reset
controller never fails. Drop error handling for it from the driver to
simplify the logic.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-inno-usb2.c | 31 ++++++---------------------
 1 file changed, 6 insertions(+), 25 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-inno-usb2.c b/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
index a705c4b18bd4..6b3104901695 100644
--- a/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
+++ b/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
@@ -290,23 +290,12 @@ static inline bool property_enabled(struct regmap *base,
 	return tmp != reg->disable;
 }
 
-static int rockchip_usb2phy_reset(struct rockchip_usb2phy *rphy)
+static void rockchip_usb2phy_reset(struct rockchip_usb2phy *rphy)
 {
-	int ret;
-
-	ret = reset_control_assert(rphy->phy_reset);
-	if (ret)
-		return ret;
-
+	reset_control_assert(rphy->phy_reset);
 	udelay(10);
-
-	ret = reset_control_deassert(rphy->phy_reset);
-	if (ret)
-		return ret;
-
+	reset_control_deassert(rphy->phy_reset);
 	usleep_range(100, 200);
-
-	return 0;
 }
 
 static void rockchip_usb2phy_clk_bulk_disable(void *data)
@@ -559,9 +548,7 @@ static int rockchip_usb2phy_power_on(struct phy *phy)
 	 * please keep the common_on_n 1'b0 to set these blocks
 	 * remain powered.
 	 */
-	ret = rockchip_usb2phy_reset(rphy);
-	if (ret)
-		return ret;
+	rockchip_usb2phy_reset(rphy);
 
 	/* waiting for the utmi_clk to become stable */
 	usleep_range(1500, 2000);
@@ -1479,16 +1466,13 @@ static int rk3528_usb2phy_tuning(struct rockchip_usb2phy *rphy)
 
 static int rk3576_usb2phy_tuning(struct rockchip_usb2phy *rphy)
 {
-	int ret;
 	u32 reg = rphy->phy_cfg->reg;
 
 	/* Deassert SIDDQ to power on analog block */
 	regmap_write(rphy->grf, reg + 0x0010, GENMASK(29, 29) | 0x0000);
 
 	/* Do reset after exit IDDQ mode */
-	ret = rockchip_usb2phy_reset(rphy);
-	if (ret)
-		return ret;
+	rockchip_usb2phy_reset(rphy);
 
 	/* HS DC Voltage Level Adjustment 4'b1001 : +5.89% */
 	regmap_write(rphy->grf, reg + 0x000c, GENMASK(27, 24) | 0x0900);
@@ -1501,7 +1485,6 @@ static int rk3576_usb2phy_tuning(struct rockchip_usb2phy *rphy)
 
 static int rk3588_usb2phy_tuning(struct rockchip_usb2phy *rphy)
 {
-	int ret;
 	bool usb3otg = false;
 	/*
 	 * utmi_termselect = 1'b1 (en FS terminations)
@@ -1524,9 +1507,7 @@ static int rk3588_usb2phy_tuning(struct rockchip_usb2phy *rphy)
 	regmap_write(rphy->grf, 0x0008, GENMASK(29, 29) | 0x0000);
 
 	/* Do reset after exit IDDQ mode */
-	ret = rockchip_usb2phy_reset(rphy);
-	if (ret)
-		return ret;
+	rockchip_usb2phy_reset(rphy);
 
 	/* suspend configuration */
 	regmap_write(rphy->grf, 0x000c, GENMASK(20, 16) | suspend_cfg);

-- 
2.53.0

