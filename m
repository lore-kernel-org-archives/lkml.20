Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B1683C5DA1
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 10:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790762692; cv=none; b=sOvSKcLxnZvAERXCEjyisqFnmqgDQ+RP3QjlIdO90vXjewm2QeKFJssmsiHd4zbMUVqHpwpeFGqHd6nD2wN6wmSxkLYhjuuVJvTwMMMypLA6rNNzXhJV+ur2LYXx0/8w5z7w+fMsjs99hro9YEo1t69i/f+bpbah7jM418ykqX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790762692; c=relaxed/simple;
	bh=N/gfAH31l8mrKB/AS7h6cKPIeBrVPBLmkhBTL9KMgHY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CZO/DI2bomBj+JvpohBF4GM+eLresoxfQWdb1BUEOPPtLRF8fkz7WdRWZ0PsGU9+IIC1pptHhK6ElqQUSRky/9OvemR1m6JHWcRUNAs80GL9AxyH0V3tXWZxGZiIknjEMS3ECI9WLn+y/c6i9TxTrA5mlfZLeS5nVezVUwk0A30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=NzdKf8B1; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="NzdKf8B1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1790762687;
	bh=N/gfAH31l8mrKB/AS7h6cKPIeBrVPBLmkhBTL9KMgHY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=NzdKf8B1WdR5g8hVvGdAHZOjiAZCB5ntzf9T5s5EIgRwwr7vIHVwcSRlGj5LiMe/p
	 gwCfwg827oq5B4rtkJOj0pIEE54ly7lMYoRZqi9ROTvdhmK69brThK3GgRv2XTKCmg
	 Vy8/ztKegArNb+H4YEMjNeyQTyWv2LvjAYEEI22QnnWsTB1PRWHeAMiDvK9gD4AzZl
	 SLSucwySAyR37kvZ0q3W8aTKpmKLCfBVih+5vDymZRjFSNLeDGOQAtIa3ov0jCzTP3
	 jfYXIfnUpceryvV6+nlqqyFWdfu+LqfryS+S1k9nXlsCPJGhGEDDCAuVa3Dfdz8Db1
	 7EWbZHnBcsVtg==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 603F917E0D5D;
	Wed, 30 Sep 2026 12:04:47 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 113E8480030; Wed, 30 Sep 2026 12:04:47 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Wed, 30 Sep 2026 12:04:32 +0200
Subject: [PATCH v16 3/7] phy: rockchip: usbdp: Drop -EPROBE_DEFER hack
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-b4-rockchip-usbdp-cleanup-part3-v16-3-bc144f80afc4@collabora.com>
References: <20260930-b4-rockchip-usbdp-cleanup-part3-v16-0-bc144f80afc4@collabora.com>
In-Reply-To: <20260930-b4-rockchip-usbdp-cleanup-part3-v16-0-bc144f80afc4@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Zhang Yubing <yubing.zhang@rock-chips.com>, 
 Frank Wang <frank.wang@rock-chips.com>
Cc: linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@collabora.com, Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Igor Paunovic <royalnet026@gmail.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1574;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=N/gfAH31l8mrKB/AS7h6cKPIeBrVPBLmkhBTL9KMgHY=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGq83r7EPXloWqTEAU0T+XU9pKXT4yYtgyc3f
 avcsSV4rGMlbokCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqvN6+AAoJENju1/PI
 O/qaYLMQAJJuIMYvglmvGiIxtokwteqhIH/nYyTEIJS7Lr6tJxbxzZJ5rmOo1dXqnaDihdYmPuW
 z4HbZPChiZFR0MJqbLTvUWt1MQmcTGAOgapo0UAG2bf/R4Xhjky14zQRXv1EK3BazggM1WJh5+g
 gLXfNAhepDMrK2GUo5gXr6wuDwcRTO+4t6oudYkOX9cI6AYlQYFjnnS5/71OoUTPUdLSvYsqgE/
 MPFp5NWJ7dZ/SyHhk/TLKikA/M3yvQY2eAebRS6X1kLnO/Xg+nJE19UL7bK+y3f7IkTSsaNixcg
 fFHhcLmpgIkvOlTloI4LQuaCx9eGRcqq7q9WQf8Kd1aq/02MAgtnmwR6EgYWJcpnP0sfqUj/8yD
 4iDSy7Cbmx85/DZlAykydcpcheSqfrcNc3n39B41g98vcB9fup00VlXRYdlBLdgyz9C9a0kO3XS
 pJ3YoGP357zgZzui0UB+98WksFhzsFmTT0Ts0zOAkdvKResVZ99Ivq5iSV6EXfDRqM2y91jqLIT
 FvC1Lb0MJuCzDgq9pf4cjgFJUFkYEB1ezVq/XzYUcoulC2hJqHj/wDPm/X93rkZWX+Gok39W0hX
 msUX54gdWKPFOqUgiDyoRXHLYPDMS9imvZZ8Tfj+ZLSNHUm2+qndnKqMEQy/pefLpapYXsTf8oJ
 bsJvcW/mgOHdgCsci9ToxjQ==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

The hack to return -EPROBE_DEFER when the lcpll lock timeouts is no
longer needed. The driver now does a reset during its PHY init, which
avoids the problem.

Since rk_udphy_status_check() is called after the probe, it should not
return -EPROBE_DEFER.

Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 0f39982c70b1..144d83997a79 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -749,17 +749,7 @@ static int rk_udphy_status_check(struct rk_udphy *udphy)
 					       (val & CMN_ANA_LCPLL_LOCK_DONE), 200, 100000);
 		if (ret) {
 			dev_err(udphy->dev, "cmn ana lcpll lock timeout\n");
-			/*
-			 * If earlier software (U-Boot) enabled USB once already
-			 * the PLL may have problems locking on the first try.
-			 * It will be successful on the second try, so for the
-			 * time being a -EPROBE_DEFER will solve the issue.
-			 *
-			 * This requires further investigation to understand the
-			 * root cause, especially considering that the driver is
-			 * asserting all reset lines at probe time.
-			 */
-			return -EPROBE_DEFER;
+			return ret;
 		}
 
 		if (!udphy->flip) {

-- 
2.53.0

