Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B2BD3CC337
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 10:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790762691; cv=none; b=kdb1InWNCf28BKF5uEcbxBYflaFzLYaEATXbao0OPqvcmt4B4gdNDA0Cck/j34kNYUtZoHJo67mpxYRWbJhLzRuEL2J5ZmhBXyKxirwuz/fzrXs1jrSo0Riju+TSU03qCiMD8rHmr7x8gBmOedZxwu6iBvG8t8JNCwogYLpYJrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790762691; c=relaxed/simple;
	bh=dTzeao4Dd5OND0GFZlXDfRJt+V35QYWZ01gw5rsf1aI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RQ7PMU5iICQtLB9bSMD3QgWPm8roHNmJmVFAIElnoXgEv9ZBz8NyR1/XERxK0h9gerjX0HagHzXcWRlcaPgQEvr+bRCo18DJDLzQhPbfrFJOJ2xGxjx/AYjwvclh40yQ+T4tMP9qdydcqbU8DCxcon4PrBBU2+w3IF2Gr5AZ8pc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=NycWLSNS; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="NycWLSNS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1790762687;
	bh=dTzeao4Dd5OND0GFZlXDfRJt+V35QYWZ01gw5rsf1aI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=NycWLSNSQWt2gBDHw4Xxt5Dl8WX3/OLH+gU5+QPxIlg5uPuFlEx4ak7KtC8/tj34x
	 yIggQ4G1olUVAjEc3uFK/sGoyLROKWF2TS5E+mr+d6EW895Z8k5ei+Mr71k/g8uydX
	 DpmMb63QnIh6wCMT9XZlulxBADhB1R5IaJUtRax792ZX9BothtbfRBuqZcb+Ol1u3p
	 5MbVjYYnCQt+20bEQbT1dtSJ3vHVmvWP3Ko9Bz33i8L24sD6T2oVFtK6iW48lUcHpC
	 gIbyRLPIpDn09sLLGnZFF/a0RtIqoBEQ5ZPxVMFuNmN1fzbpXFcmn5kJSav+ESlW/s
	 IMDz1jQILrC3Q==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6172D17E0D7E;
	Wed, 30 Sep 2026 12:04:47 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 0F83348002F; Wed, 30 Sep 2026 12:04:47 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Wed, 30 Sep 2026 12:04:31 +0200
Subject: [PATCH v16 2/7] phy: rockchip: usbdp: Disable USB3 port during
 normal power-on
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-b4-rockchip-usbdp-cleanup-part3-v16-2-bc144f80afc4@collabora.com>
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
 Igor Paunovic <royalnet026@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1272;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=dTzeao4Dd5OND0GFZlXDfRJt+V35QYWZ01gw5rsf1aI=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGq83r62Ywt25O8C7r5dkleorIchz5/SfqtiN
 ly/K7ZYGK89VIkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqvN6+AAoJENju1/PI
 O/qalSgP/0DEpnv4T8CQb4/ODMflyZilWGGtRXqBMGAbu6WeyieqnW6/soqBWG6i7MrYS76/DK8
 lIhu5zmw8YhJuq9lani6Kk+gqeGlACp3pKbeG91Jgj0S9982wZdm+2ceUoiPX+hG5oF5LEzJRna
 Wydcfp10z155iDYTfWAySRMLtzrvPVCiLRztuFJrAeJ3DvOEVSc4xlv9MU3E3f5xQesnGiKF6ud
 +zK7d75LkbeCX8BuMSYB6DSAO9eBWKSeTBCHKizy6+XKUA9OcW5GZjMWw6XgbSFoQtByD02pvF5
 Ku4PXBwndtKJmGmh0t4feNcO+vEt9pp+JfKDHNFKVdTz5d661mPdRZux025+uznyvbWeiU7LAP1
 vCUbIH3XZnxqqUjqLaJvSq7iNwBFB/zxKWsWblDPqpYCdkLsnDUpFQ2x9n2HdtNB79tk1pyscPF
 725KUQILV7DXW2Y9hLTXE8Yeqd2ir30g21AgdhDwIZAlUoiLcNAXSmD9+E9xu07SeZlw2sM/H5R
 E04cKj4vAPjBBgdwfBUwYNDSqmsfUdtnL9aU2jgwxw38UQ/ZgsXcW6E06NSE818xcQM9RpPh9U8
 HvhfdmP1fpLu1EFJudY2RZtY1I/kwnfCfa7yR93ZRZ6yQ/H6dJoeKGm6WMv+AAGmdKuD/70ct02
 hLdOY5G+yJDUjK3LEf002LA==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

In the reset path, the USB3 port is disabled. This re-routes the clock
going from the PHY to the USB3 controller. This adds the same to the
normal power-on path, so that it behaves exactly the same (except that
the clocks routed to the PHY stay enabled in the reset path).

This hasn't been done so far, as it requires the recently introduced
PHY reset infrastructure to avoid the PHY PLL not locking during
startup.

Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 5e457f28269d..0f39982c70b1 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -1006,6 +1006,9 @@ static int rk_udphy_power_on(struct rk_udphy *udphy, u8 mode)
 	if (udphy->status == UDPHY_MODE_NONE) {
 		phy_notify_reset(udphy->phy_u3, PHY_NOTIFY_PRE_RESET);
 
+		rk_udphy_u3_port_disable(udphy, true);
+		udelay(10);
+
 		ret = rk_udphy_setup(udphy);
 		if (ret) {
 			phy_notify_reset(udphy->phy_u3, PHY_NOTIFY_POST_RESET);

-- 
2.53.0

