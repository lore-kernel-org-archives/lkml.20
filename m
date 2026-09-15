Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6412247A0D1;
	Tue, 15 Sep 2026 13:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789480203; cv=none; b=Li6a551Oh1qT4dVOvKDKxgUOGDN2Yh6xVUnlZdzGZCNhdE7B3pS8O9g3wHS2PA3kcd+SRP1JFz4pB7YiIeSFmeHZiohrLK0dbFHYFSGcmQ6YGaLPGUV4Ul/StINL+6wXokX7N2oZ/EBqsoK1KvB7SWy34WRml93E4rj6I53P1+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789480203; c=relaxed/simple;
	bh=UnafG6WVYfNQdZQ6MnttjKf4JKywJdob+S2exj7Gm4w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=juhsWNlP/RsZ2b8n2Nj60zWthK/yzFmPijmUXMZwloLz5NuUhNOWt4QcaL2eO38kZAA80LxQS3SLl/Tl1lU03B3f3lgaM0Pk/UkbUU8lIMgcbUB4o4r98b7rJyrAqCBY6Lv+PHIxi+jf4Ej+Uuy52QccTkIca7FshdMWnmpKwYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=YnWnp6kR; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="YnWnp6kR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789480198;
	bh=UnafG6WVYfNQdZQ6MnttjKf4JKywJdob+S2exj7Gm4w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=YnWnp6kRXwgoN1xsnCBZQnxPpTkI2j1KOR40duYfzfoIL0umPqeoDXSwznt/ilsEB
	 qK6vtjXS2u3yGtAxoUOXcHD5zaTEO9k+IdmycByMebLKM+DIalkItCWSy/OMzenpKu
	 fbvn3XveFpHTzTrJgUBK6FLz1dtYiKAWJSp7T7Hc6ddzrDOYspza965/iKAAGrmtrt
	 FoQJOBIHmZWx0G5QX+kh2FRPgO7/rUZg2FhmUReZG8yfdD8LgEQUb48qagxyJn0mXX
	 b7v7h7i152XR24+p8BCE810/SsiF2vGZRAEI96p2muQPxzDeuCLqyVVfjwxlL/Rc1N
	 IW+UOW0yyvG4g==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8040D17E0A32;
	Tue, 15 Sep 2026 15:49:58 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 2EA7C480031; Tue, 15 Sep 2026 15:49:58 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 15 Sep 2026 15:49:51 +0200
Subject: [PATCH v15 04/16] phy: rockchip: usbdp: Fix devm_clk_bulk_get_all
 check
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-rockchip-usbdp-cleanup-v15-4-80e2c11d1ce8@collabora.com>
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
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1722;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=UnafG6WVYfNQdZQ6MnttjKf4JKywJdob+S2exj7Gm4w=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGqpTQUqeqG6Mf1w9I3YCMtzPDXfcQtRFM1xW
 +j6XaWsHLxd5YkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqqU0FAAoJENju1/PI
 O/qa5igQAJ+eNDZzR1H3qV7s7rudtb1vag4zvdXkoiFthFjDLjU9lgTk1xga2L0N5WKiElkAC8v
 i+jGVp9BQprY11oyM9aoEluS6FIt3HTrgxvwsp6FjgkJGpjk+7EQfahjSfsGnt4S97f77PE4AS+
 yM6VUF/SuyATviLe+SKpoJwwG7F/+/QIZHQ2fzCGbuh39SsUBR0DdPOY8OhQPYtPm9qFn4sJvpe
 PcsQemgNR8HS12MF10i07UoqfvM/nv50u5JBFW7c3UJbrMhD3amppoBrkTIMK9A2bzdeNZ66mGB
 1+ekuntcxmspPvE/yMLKkmJECkZCgPEPXqOSFl7FeS489AExm4ssleo1Fob2OyvQ/wGEwlOtQYs
 LRaUUXTnNRWBddX3I8Yep0bIgH/r4CPRpXk04cV9ZgXRIio5gGFKMTHqAhDJWoB9TdW4xO78jCJ
 OQdalD3w5CwRIJHzyYCDUOYWrPltTzyyhAdUs/wOcQrcE2qB9fnwzd1qqBtdPokPf5PXDXX4qrB
 X/ge2axd0Kch/6UzLdYZoMfWZLj7QtWRzyldbjgY0u0it16xRMU0ALx1yKpjupx1kA7JmMuj5Xq
 FMgXhA1vmpS+2qclU2GXHqiqjWQY8BYlMcy23YNCtAj5Ib12N7rlZKKmslxbCmaIDq5a1t+T1kM
 RpWnU0N5ItIcMl0CkwsArGA==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

If devm_clk_bulk_get_all() returns -EPROBE_DEFER, it is replaced with
-ENODEV, permanently failing the driver probe instead of allowing it to
defer. Avoid masking the error code to fix the issue.

This effectively drops returning -ENODEV in case no clocks are being
described in DT. This special case will now be handled by the follow-up
check searching for "refclk" and exit with -EINVAL.

None of this will be hit in practice, since the driver is only used by
RK3588 and RK3576 - on these platforms the DT is validated to contain
the clocks and the clock driver is force probed early. Thus there is
no need to backport this.

Fixes: 2f70bbddeb45 ("phy: rockchip: add usbdp combo phy driver")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/linux-phy/20260612164107.C7DB21F000E9@smtp.kernel.org/
Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index da0fa75fc9f0..c6cda0b80bfa 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -426,8 +426,8 @@ static int rk_udphy_clk_init(struct rk_udphy *udphy, struct device *dev)
 	int i;
 
 	udphy->num_clks = devm_clk_bulk_get_all(dev, &udphy->clks);
-	if (udphy->num_clks < 1)
-		return -ENODEV;
+	if (udphy->num_clks < 0)
+		return udphy->num_clks;
 
 	/* used for configure phy reference clock frequency */
 	for (i = 0; i < udphy->num_clks; i++) {

-- 
2.53.0

