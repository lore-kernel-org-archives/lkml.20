Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7386E49A3D6
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 13:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790860386; cv=none; b=MN9LjwjqUTrsU1x3pRhlDMcJvuS8/UC3STUviSOMGlnO33XZTbT5/Pk23H2rKIxaYFU49UzCgPQp62REIw3AdTTS6/1Ezoql3vXsl0b7hCAjRob1gcW28vjrHhSgDGRk45LuAGl+euR7ALvq7yZJ5V/WKZp3uKemHLtZlcZRooE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790860386; c=relaxed/simple;
	bh=5XO4+Z/1+hdw3bMiXqY2f1DDo59APA0LsBUWvx837K8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=E6gHGmg0KGl/fZaFlJmfMOZIwzT2LEyRYvsdCK4Z92vYBeSq1DeoRnDp4Imc6lXW8EM7VZ5wWPmVl4ifLmFZFClbTfATMRRkBtdd3DEQhaC1J5Rc9iFsRG4W8u2dxUIBvds2sPgOA+61M2L5QVVsOB8GxZG6X5yDH66s27qZkeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=EBfQWZjQ; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="EBfQWZjQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1790860382;
	bh=5XO4+Z/1+hdw3bMiXqY2f1DDo59APA0LsBUWvx837K8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=EBfQWZjQkcKOGjBXy7PWvd0Ctnh1SQJK4hikBHeQpItKV/pUtRzVIWRJgLTCD3HIF
	 MHOo9V13GdkTzLIRzc4QiZM5QSkMf1q+sKw3XKizIZ9Fv9ELYKH6utu53pHQdEK0/I
	 720nHqlg/r9weHPB1utNo6e/QhFk6LlcYCfqqQXaCX5HORCqEGQOrvMXR6maYxh7s7
	 C/Hcj/Qe3FRHziN1ifyGkoFqpdfF3uE3KQNuxsu+i8PNFc3iIeTh8MG7zYqsbC7Iug
	 jRBT+6p+3mkolK9979E8Y7tLURIFqhtdKNMZhcE0OvLs8iX32GFvd0juFbDvLbPo+b
	 9qrIlK0WTL9Aw==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 71B9317E04B7;
	Thu, 01 Oct 2026 15:13:02 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 23FE1480029; Thu, 01 Oct 2026 15:13:02 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 01 Oct 2026 15:12:39 +0200
Subject: [PATCH v2 1/4] phy: rockchip: inno-usb2: simplify and unify PHY op
 debug messages
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-phy-rockchip-inno-usb2-clock-fix-v2-1-e01bf509359e@collabora.com>
References: <20261001-phy-rockchip-inno-usb2-clock-fix-v2-0-e01bf509359e@collabora.com>
In-Reply-To: <20261001-phy-rockchip-inno-usb2-clock-fix-v2-0-e01bf509359e@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Igor Paunovic <royalnet026@gmail.com>, kernel@collabora.com, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1821;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=5XO4+Z/1+hdw3bMiXqY2f1DDo59APA0LsBUWvx837K8=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGq+XF2cpqRApg/NxLB8f2UY1JKPXvsdMrsqJ
 3hdqlBZM+SyeYkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqvlxdAAoJENju1/PI
 O/qaxZ0P/izObD4JaPKuCw910B22PzL37LsNJtN97B2mNAw20e/0j4CXmCl3qZ6NybBg3t0AccL
 ekbR9rrzUKw4BDot/GDvnYUDEbE/dkcgBkLK8GJc1fJkq3fbeki9wG3kP7YzGqDm9cWgxNTqUcn
 ++oCj4v2TFKzqr7mjOgT7hJJm+AuGsJXsj62XpmdXGfbwy0GMrT8+93tzeT2mRgUdt8D3xL2NCp
 yEUYf6icJDcVVXFVU7zBNciIYBYIbc9PELZi23nPQFWCufHpxmu745Yp6SjGzRRPwf0lrUeHvvS
 454TnQFpwBBGT+ivV6c6NW2TI0B65YNYz4hv8HXje2Q5W3ENz0MZ0lkCmreubAZJAnCcy6MF0Af
 eXdSGE1Y69kPjAbvRSanmL0/E1Wv/jMdNMMFogXtoSUOakvP4SkhWeA6LSBbMUk6GUXlo8o6F/Z
 01Tg4NY0wExjzcml/fL5eOkJxE6dKDV8mc3xavL1PdQFPqHSDP+OrV9nFJwDMYsvnf0BhAraeGt
 dcFU1/3Il+CRTB+4v+Y2SGva9mjcOhitcU0GUCk6nLPBmDoE2o/qJCQp3ct+yBVIQzvjeyEvzk3
 glbdkd8bQfPWzNLYe/JF2xUCo5Vxqgf0dJ/hlEqNDKPKCXMzM1ut7EdJaW4Ws2d0GxwrjTQ2IjM
 kcC1TFzJ8MSOyyVMIPz8qHg==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

Add debug message for init/exit in addition to power_on/power_off and
avoid the useless extra dereference in the existing power_on/power_off
to make the prints consistent.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-inno-usb2.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-inno-usb2.c b/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
index 7d8a533f24ae..0ab054ee84cb 100644
--- a/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
+++ b/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
@@ -508,6 +508,8 @@ static int rockchip_usb2phy_init(struct phy *phy)
 	struct rockchip_usb2phy *rphy = dev_get_drvdata(phy->dev.parent);
 	int ret = 0;
 
+	dev_dbg(&phy->dev, "phy port init\n");
+
 	mutex_lock(&rport->mutex);
 
 	if (rport->port_id == USB2PHY_PORT_OTG) {
@@ -592,7 +594,7 @@ static int rockchip_usb2phy_power_on(struct phy *phy)
 	struct rockchip_usb2phy *rphy = dev_get_drvdata(phy->dev.parent);
 	int ret;
 
-	dev_dbg(&rport->phy->dev, "port power on\n");
+	dev_dbg(&phy->dev, "port power on\n");
 
 	if (!rport->suspended)
 		return 0;
@@ -632,7 +634,7 @@ static int rockchip_usb2phy_power_off(struct phy *phy)
 	struct rockchip_usb2phy *rphy = dev_get_drvdata(phy->dev.parent);
 	int ret;
 
-	dev_dbg(&rport->phy->dev, "port power off\n");
+	dev_dbg(&phy->dev, "port power off\n");
 
 	if (rport->suspended)
 		return 0;
@@ -651,6 +653,8 @@ static int rockchip_usb2phy_exit(struct phy *phy)
 {
 	struct rockchip_usb2phy_port *rport = phy_get_drvdata(phy);
 
+	dev_dbg(&phy->dev, "phy port exit\n");
+
 	if (rport->port_id == USB2PHY_PORT_OTG &&
 	    rport->mode != USB_DR_MODE_HOST &&
 	    rport->mode != USB_DR_MODE_UNKNOWN) {

-- 
2.53.0

