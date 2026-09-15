Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50DEE480979;
	Tue, 15 Sep 2026 13:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789480211; cv=none; b=afKwTqz+pd35RkI6p5BJwtgE42boIHK6LI6iMEEhkBgr4ajBtYGze3XjmYiPK22TlUmzC6zevGaH+cs4FakdDFAVY+rGUet/oOrd7q23vBcZL8F3DldGnhOVRxOXo63KZVdkRsECWEtHEdbTCqIiWOjnLDaKj9Bfi2ZjdO2zpP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789480211; c=relaxed/simple;
	bh=4oCqXMxVsoIyOffGedtIRbbdIb/gE7Hwhb2soSG3s0k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=juIgrYFQOVJ8CkHmzBHb05kZiNnYNycaeCQgflwhoBINmF0Z6LQ+gTpG++m4WqJ4n2+eBeqCbJXQ6LLaVasdI3bDmR74J8lW+kpsr00KvuAh5a7SZgtUcaEKv9Lqhfkc9YJj5thTA8C7zma7DVXqPyoW8UmULD7oVkKq0RG2xoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=okbQGXNc; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="okbQGXNc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789480199;
	bh=4oCqXMxVsoIyOffGedtIRbbdIb/gE7Hwhb2soSG3s0k=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=okbQGXNcdKbvdFRXh6MisO4zRMxjQ+o9Hdd6EsP3T+WbqHtXfxBbD+1MOtVygwfz5
	 +bOD8t0cCxhkwHqeIJfXp0XtCax4Qbu51/Ge9vhglRUr9xYnbHXdZWR2cvBC7aa10g
	 jFuqIN3Gn3hXPppvTbC41d45e3dCo26xVQJFHvu8+HZX2jT2jNeN7J/d0vL06RaR+C
	 vUM2iRceLCbLWfTW+ltJqqCpzmV68lxqLevL77K8Z1jGquP+jmatOmZ5EL6tPy9Ote
	 /JJVmxjU82cxbjG+/SXFB1H0w6Ip8RSp2WD/H62IY138pMnQOtXVDTj5tHT4+JJ7No
	 9Pqd6/wJvlChg==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id F415017E0E6E;
	Tue, 15 Sep 2026 15:49:58 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 3E30A480052; Tue, 15 Sep 2026 15:49:58 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 15 Sep 2026 15:50:00 +0200
Subject: [PATCH v15 13/16] phy: rockchip: usbdp: Rename DP lane functions
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-rockchip-usbdp-cleanup-v15-13-80e2c11d1ce8@collabora.com>
References: <20260915-rockchip-usbdp-cleanup-v15-0-80e2c11d1ce8@collabora.com>
In-Reply-To: <20260915-rockchip-usbdp-cleanup-v15-0-80e2c11d1ce8@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, Frank Wang <frank.wang@rock-chips.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: Andy Yan <andy.yan@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Yubing Zhang <yubing.zhang@rock-chips.com>, 
 Alexey Charkov <alchark@flipper.net>, Igor Paunovic <royalnet026@gmail.com>, 
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@collabora.com, devicetree@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2076;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=4oCqXMxVsoIyOffGedtIRbbdIb/gE7Hwhb2soSG3s0k=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGqpTQaY6fxS4bdODL0YA+d228P6N18rkZrJS
 +1o792WF0UHJIkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqqU0GAAoJENju1/PI
 O/qaookP/3aBDQDQAKSTVuEWLQwC5RLE/YY8exHHuAL2TwtpAh2DUB3OJcjSUMACS9Faepyx9v3
 0jVmK7xNFP7QP1k+pZvo+0l8adbumMey5OKUCc096dmhUvf6onqfDcukaflBLxJR+Oup7Bw0BTg
 SLmnHvfionGPA0tX7Pm2X0n+O9MHKyZJZz+9bYhGKUhFSn9NIbTzJwJ8VASdm2XUGZV0dpUyEWS
 WOsSvrqILnw+XW/PgDoWcRyi5bspeu9N+aG0GP7dW2dJL19mmFCz+MoIwFKlhQmPDqn1HTk9OwX
 hQVA7PE0LNlFOKUBxiHyF6jJlFJNgk7Et5Bo8ALYj3cxxE+Hh3SQXrIS/Gqync9/ycTBW8+stvw
 1FiPnPH4yTS0QJq7SiuADPyOJ5Eu96AD6wjokadEkGR2hxzi5bjtKvoOZWDWiHKmJ85HY8VQeYm
 fkJILPXPWOEzsUhNZvITQ2RHIN8QQPl8Au1gmGcr37GGJkKKLjdcH0Fm7HJmWigbfsazxXtvZoH
 qfAaP8xopnOPdHssCw3iyuY3rmDYKFKyrqz3/L+vhGdB+9x6V2FRWFCzFsk5T2MIUxv36z6pkPP
 rkHNC1UEpveg8m1k/rUl5y+t1yYIQC89EXfEOQHIo9Ec5RHqdTpWB1ImIwIWOQk2Z/shb32QZ0A
 ilulJEWc4fgvBGTSHLksoMA==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

The common prefix for DisplayPort related functions is rk_udphy_dp_
(with a final _), so update the two DP lane functions to follow that
scheme.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 2af7c3878714..9dae41239e48 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -544,7 +544,7 @@ static void rk_udphy_usb_bvalid_enable(struct rk_udphy *udphy, u8 enable)
  * ---------------------------------------------------------------------------
  */
 
-static void rk_udphy_dplane_select(struct rk_udphy *udphy)
+static void rk_udphy_dp_lane_select(struct rk_udphy *udphy)
 {
 	const struct rk_udphy_cfg *cfg = udphy->cfgs;
 	u32 value = 0;
@@ -573,7 +573,7 @@ static void rk_udphy_dplane_select(struct rk_udphy *udphy)
 		     FIELD_PREP(DP_AUX_DOUT_SEL, udphy->dp_aux_dout_sel) | value);
 }
 
-static void rk_udphy_dplane_enable(struct rk_udphy *udphy, int dp_lanes)
+static void rk_udphy_dp_lane_enable(struct rk_udphy *udphy, int dp_lanes)
 {
 	u32 val = 0;
 	int i;
@@ -1048,9 +1048,9 @@ static int rk_udphy_dp_phy_power_on(struct phy *phy)
 	if (ret)
 		goto unlock;
 
-	rk_udphy_dplane_enable(udphy, udphy->dp_lanes);
+	rk_udphy_dp_lane_enable(udphy, udphy->dp_lanes);
 
-	rk_udphy_dplane_select(udphy);
+	rk_udphy_dp_lane_select(udphy);
 
 unlock:
 	mutex_unlock(&udphy->mutex);
@@ -1068,7 +1068,7 @@ static int rk_udphy_dp_phy_power_off(struct phy *phy)
 	struct rk_udphy *udphy = phy_get_drvdata(phy);
 
 	mutex_lock(&udphy->mutex);
-	rk_udphy_dplane_enable(udphy, 0);
+	rk_udphy_dp_lane_enable(udphy, 0);
 	rk_udphy_power_off(udphy, UDPHY_MODE_DP);
 	mutex_unlock(&udphy->mutex);
 

-- 
2.53.0

