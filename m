Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792578123;
	b=X38McnyIbKWGox2yhjM+W6sZHwtjf94sCZBB5FD5dfUSWolPT3MLTnnpzoOhW2HCUnhO
	 hb1qEw1YSm97XfEMEhTMd3YDjDjTf5dznqvXwJQ/JYYcua3fvcRjUEgESgOFTH5cnkKQP
	 xLEW2jk87vCIJjZE3d0lSyHk7qO9mCuHV8OfEwMUy8bDZ7Zp++Y72JjPlSPnKouggpnlq
	 suHQpcf7D6FYd26m12dWX+YhS8qYaP0cU5DHs/+yhQOeSsPZGYbL9eUCf0bPFGKWMDBz0
	 XHwp5guWHZGMtc2ACGt90/6qk1C9BxpNQwasZElWHpH1lQmE+uYpwbpi10zt+0J8QNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792578123;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=c6dok8n5LL6c4MopDmaxFHK/PDv9PBQ1ve5ozQwWb2E=;
	b=ZD+Ktph6IcHCh1XVG6XhDv6roRbTw8pcRQShmmCbdTwIveeqiOYPbX2iuLXbADK4am7Z
	 ZZJERabq6y2NtqEbl7huc+APzF6hXdgR/REdY0MIvRcWdjO2GxPnSzmB/IJqjJ2l4wymQ
	 b3ZdfHroEMgSvOLKnCqg7QLrbcZ4/36vmosMYJWaYrYeLs/3SQc2O2qMvNmF5bl9HECBs
	 +P+nPN+Tu+JwQ5TJ0hSzqGCHhrrYlrZLiXiS/hLjsYskGbeHMPme6ZnT2JxPIuGqhdmSx
	 /Eo/syVDAyUXWBkmFAYsvE1TKHLnrX61Q/L3CnuMwOQP6+8HMwSfZqel7V8Isu5C4mg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cknow-tech.com;
	spf=pass smtp.mailfrom=cknow-tech.com;
	dkim=pass header.d=cknow-tech.com header.i=@cknow-tech.com header.a=rsa-sha256 header.s=key1 header.b=bu88LMKg;
	arc=none smtp.remote-ip=95.215.58.15
Received: from mta1.migadu.com (out-15.mta1.migadu.com [95.215.58.15])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3816606A32E
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 10:22:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3816606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow-tech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cknow-tech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cknow-tech.com header.i=@cknow-tech.com header.a=rsa-sha256 header.s=key1 header.b=bu88LMKg
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=M7vQgWT3GoO7sduxULKgRFfbTcBneeSPs/0sueXAB60=;
 c=simple/simple; d=cknow-tech.com;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792578120; v=1; x=1793182920;
 b=bu88LMKgSTxv6LpzEV6zMT1oIN3YbHyyI+rZ2+bUVkAJ/4StqocrlrDPhTm5hKgGmg9jYwez
 wGddRvL7ngAQN2LsBuVpNloKuGP30jP0rM/YCAJnLTobxrxRtXnq30voD4jZ0Krxj+325L0Alyq
 gypcDQfhvLjKR2gdfO6wi8V0UyrB6m/BkKxmIEvMXI5KN/6SfU/ZkpoKylkAUzx4QLzrYcOHH9v
 cHM+Zow1zBBUGUWsy6LkvnmzF9v5cLW2mebefqkJ9pnzhRrUv6Cz609SY1uBvy3B1U1B8b25UQq
 QjfPHYZ2unoeFmabW+4O/0cZ7ExkIEvZ0pf15NVlBI5Pw==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id adc20fdeee7e491e;
	Wed, 21 Oct 2026 10:22:00 +0000
X-Mizu-Trace-ID: adc20fdeee7e491e
X-Migadu-Flow: FLOW_OUT
From: Diederik de Haas <diederik@cknow-tech.com>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: linux-phy@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Diederik de Haas <diederik@cknow-tech.com>
Subject: [PATCH] phy: rockchip: inno-usb2: Remove redundant dev_err()
Date: Wed, 21 Oct 2026 12:21:20 +0200
Message-ID: <20261021102155.609575-1-diederik@cknow-tech.com>
X-Mailer: git-send-email 2.55.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The devm_request_threaded_irq() function already automatically logs
detailed error messages on failure since commit
55b48e23f5c4 ("genirq/devres: Add error handling in devm_request_*_irq()")
So remove the now-redundant driver-specific dev_err() calls.

Signed-off-by: Diederik de Haas <diederik@cknow-tech.com>
---
 drivers/phy/rockchip/phy-rockchip-inno-usb2.c | 23 ++++---------------
 1 file changed, 5 insertions(+), 18 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-inno-usb2.c b/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
index e47b89015586..0a8a22e7aa9c 100644
--- a/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
+++ b/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
@@ -1183,10 +1183,8 @@ static int rockchip_usb2phy_port_irq_init(struct rockchip_usb2phy *rphy,
 						rockchip_usb2phy_linestate_irq,
 						IRQF_ONESHOT,
 						"rockchip_usb2phy", rport);
-		if (ret) {
-			dev_err(rphy->dev, "failed to request linestate irq handle\n");
+		if (ret)
 			return ret;
-		}
 		break;
 	case USB2PHY_PORT_OTG:
 		/*
@@ -1202,11 +1200,8 @@ static int rockchip_usb2phy_port_irq_init(struct rockchip_usb2phy *rphy,
 							IRQF_ONESHOT,
 							"rockchip_usb2phy_otg",
 							rport);
-			if (ret) {
-				dev_err(rphy->dev,
-					"failed to request otg-mux irq handle\n");
+			if (ret)
 				return ret;
-			}
 		} else {
 			rport->bvalid_irq = of_irq_get_byname(child_np, "otg-bvalid");
 			if (rport->bvalid_irq < 0) {
@@ -1221,11 +1216,8 @@ static int rockchip_usb2phy_port_irq_init(struct rockchip_usb2phy *rphy,
 							IRQF_ONESHOT,
 							"rockchip_usb2phy_bvalid",
 							rport);
-			if (ret) {
-				dev_err(rphy->dev,
-					"failed to request otg-bvalid irq handle\n");
+			if (ret)
 				return ret;
-			}
 
 			rport->id_irq = of_irq_get_byname(child_np, "otg-id");
 			if (rport->id_irq < 0) {
@@ -1240,11 +1232,8 @@ static int rockchip_usb2phy_port_irq_init(struct rockchip_usb2phy *rphy,
 							IRQF_ONESHOT,
 							"rockchip_usb2phy_id",
 							rport);
-			if (ret) {
-				dev_err(rphy->dev,
-					"failed to request otg-id irq handle\n");
+			if (ret)
 				return ret;
-			}
 		}
 		break;
 	default:
@@ -1491,10 +1480,8 @@ static int rockchip_usb2phy_probe(struct platform_device *pdev)
 						IRQF_ONESHOT,
 						"rockchip_usb2phy",
 						rphy);
-		if (ret) {
-			dev_err_probe(rphy->dev, ret, "failed to request usb2phy irq handle\n");
+		if (ret)
 			return ret;
-		}
 	}
 
 	return PTR_ERR_OR_ZERO(provider);
-- 
2.55.0

