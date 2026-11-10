Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794331182;
	b=JRbBtV8VL7uBcZdQo87RSJZOkaf+bqTxCITinAxFhk/KMYyawlqgm1yBlKulRmnQWwDP
	 fdE6u0WXvYzaC0EBDM399SX5lnoX8mGQyLh2A35y0bbTlJLY8ivXC0UwXT7pmaNG+lmXu
	 G5BP+he2s6bYs4Yr4O7ir+Cd5O8qXs8gA4BKg3vnZXO9IXF/rSTv0GuDGJlcbxiKTCrDs
	 8gRzXNlo7aZAozcNNu+YxlwsuQg/G7cPNUMIs+GLnsA4LHdpN0IegwQRYsqcdLxj7zxC3
	 FxIqq5h64rPvLo6B2+mDtDs7eCGM39mI4T2v23X0VPqEedcvCO3sQdLgUWWJ4JGHCMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794331182;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=VLMaLOIGDpPWQhOl5QwmJfkFKKpinmsBvnfF9mF6n28=;
	b=M9rDEiVnYfIhNrCBCU0EdyUiHdOWIrvFNX4ULihfoF1q8fwKAD3SHUevHb048+INEJnn
	 eTYWyjRPFmmamMxPCqpb7UGGt76Q/YX4kNBhK7Hnbc61fsAA3WaJd89bT2XduNeJkcqB7
	 v3VnGeFExASQQIxY0SxVxatlJKaW2yBBTYTDFXdOCODQ/vrN1G6USrOS+Bas4tFhYYVNc
	 Lg3lKJkeiBTMEwzkHxYBJPb3Azr6HtE5tAUWrNBMI3d1Vs9kutdlTLIXv+SSGVZXg8fZa
	 FNIoJbQnChQ3tImL37Xi1DLHTw9D5miqebA2DCuhm78UBa0ltqqDxDllI6ow8KffpAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=GhHCXmZ+;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C76A606A325
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 17:19:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C76A606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=GhHCXmZ+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794331179;
	bh=lzg3ATuvIQKGevYeKwotKHhiIinJaL2gVdL5rndNdYM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=GhHCXmZ+96ZZkJ/OUmhfyeyvp+Kh10NmIa7UY99OBzXJQjzlWEDlOlCd0bB9qROvy
	 CNnSzQDPCaW/o3bqQi475V8+Jevf10BZv4XXeug0EqnjvRaDMmwTwuS9vyi0OyFgQw
	 IDJDpchVWI8z39MbGeQceV6+OTJiwMCqNX4IdP82GHm8THtbumgpezAgY+wN0qBZcO
	 iP1sEhJo46TW6hIck+5xeFRhJZ/4pQLeZnxxFnICb3Kr4aPSCl2U0dKf51hJWf3jmo
	 yV3X4PAy4GLTi4SElg4Gr3yo9SCPtN5Ie4eWUl0FwzeKfQ7bCJwel7CQhygh3Hwa9R
	 sokhdASiveWZA==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 58AD517E0FA5;
	Tue, 10 Nov 2026 18:19:39 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 0FF5F480035; Tue, 10 Nov 2026 18:19:39 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 10 Nov 2026 18:19:17 +0100
Subject: [PATCH v5 4/6] phy: rockchip: inno-usb2: use devm for 480m clock
 registration
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
Message-Id: <20261110-phy-rockchip-inno-usb2-clock-fix-v5-4-d2e24582ab22@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2525;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=lzg3ATuvIQKGevYeKwotKHhiIinJaL2gVdL5rndNdYM=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGrzUip7f7ctZiukiWR+RZ2QIzTftpUrmC1eu
 1q9ljFi2JaGuYkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJq81IqAAoJENju1/PI
 O/qa0ycP/jIOrs1Iv0UMuuf8xFvcKaergyfdQwPhNvjcZ6nJ9o5B5hsA81H4VnBl41gibw6nqx2
 1RuIEy/8AMxTYSATKgdj5Im1hqFClK9ae5mIsyKvlaoGnQrPZUeBBVh4Y3qoY8vzr0sQlh01VcN
 K9RyaCUhJnJSwX2qjjDubMW/aQ95zgC6YUFTv0b4ffwcYwcUg0zfEJzdpWxzR7RxAKHeXS+AxD7
 pfXe3wh03e/r/Omxwe/SleL8Y8kOa8HIiLNCqh++bAEvCnxuCphOLtDROF+5W1vXqRqBl5oYb2P
 oKXbNLCK+IJ5esBGpjHD//IzsDbNiZCpXiIpTXbQckNNhXWoLC8Swe7yQq+LldydH+Zb/i/ttgH
 cLhGOn/ohKDqhDzfQDRP35qlONW2/TRC8sp8oKf+mk4Wyoc0Qd4p4SP5PRASIvylNdwSehqTdgb
 iIx3UEHmi0ocNQFJZdgbkaQiOUMK2If90B2LovmM58iepLFMa5j/TZYAa3NBMe7B3R0VYbvxsJm
 DPpravvYU5jnbyHZ1diAWpCpLzoOixzNKH8MIbol54Ez2V+atIwOG+SzthktQQZIz95euJ+Ep4p
 /oUFrLTYlrdW21jOuhc/jK12wp5TZ22AXfU0fd9w/rIORd7adKsI93vxuafdlc+m18qYZ9jEw7f
 pRfh0xgtVFV0yGGr0evgy3g==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

Replace the open coded device managed resource handling for the
480MHz output clock by using the modern helpers provided by the
common clock framework. This also switches from the deprecated
APIs to the HW clock API as a side effect.

No functional change intended.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-inno-usb2.c | 32 ++++++++-------------------
 1 file changed, 9 insertions(+), 23 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-inno-usb2.c b/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
index 6b3104901695..4c0feb6b20ad 100644
--- a/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
+++ b/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
@@ -374,14 +374,6 @@ static const struct clk_ops rockchip_usb2phy_clkout_ops = {
 	.recalc_rate = rockchip_usb2phy_clk480m_recalc_rate,
 };
 
-static void rockchip_usb2phy_clk480m_unregister(void *data)
-{
-	struct rockchip_usb2phy *rphy = data;
-
-	of_clk_del_provider(rphy->dev->of_node);
-	clk_unregister(rphy->clk480m);
-}
-
 static int
 rockchip_usb2phy_clk480m_register(struct rockchip_usb2phy *rphy)
 {
@@ -389,8 +381,8 @@ rockchip_usb2phy_clk480m_register(struct rockchip_usb2phy *rphy)
 	struct clk_init_data init = {};
 	struct clk *refclk = NULL;
 	const char *clk_name;
+	int ret;
 	int i;
-	int ret = 0;
 
 	init.flags = 0;
 	init.name = "clk_usbphy_480m";
@@ -418,22 +410,16 @@ rockchip_usb2phy_clk480m_register(struct rockchip_usb2phy *rphy)
 	rphy->clk480m_hw.init = &init;
 
 	/* register the clock */
-	rphy->clk480m = clk_register(rphy->dev, &rphy->clk480m_hw);
-	if (IS_ERR(rphy->clk480m)) {
-		ret = PTR_ERR(rphy->clk480m);
-		goto err_ret;
-	}
-
-	ret = of_clk_add_provider(node, of_clk_src_simple_get, rphy->clk480m);
-	if (ret < 0)
-		goto err_clk_provider;
+	ret = devm_clk_hw_register(rphy->dev, &rphy->clk480m_hw);
+	if (ret)
+		return ret;
 
-	return devm_add_action_or_reset(rphy->dev, rockchip_usb2phy_clk480m_unregister, rphy);
+	/* acquire a clk reference for internal power_on()/power_off() use */
+	rphy->clk480m = devm_clk_hw_get_clk(rphy->dev, &rphy->clk480m_hw, NULL);
+	if (IS_ERR(rphy->clk480m))
+		return PTR_ERR(rphy->clk480m);
 
-err_clk_provider:
-	clk_unregister(rphy->clk480m);
-err_ret:
-	return ret;
+	return devm_of_clk_add_hw_provider(rphy->dev, of_clk_hw_simple_get, &rphy->clk480m_hw);
 }
 
 static int rockchip_usb2phy_extcon_register(struct rockchip_usb2phy *rphy)

-- 
2.53.0

