Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 723193D9522
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 15:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789484786; cv=none; b=QZ2l1FrwHGk2QTtfNwEudG6C1mBaAQcveCjlz7LWNgbcGSavJsJO0vlP3Daaekn8SGoCsuvoaITobCbmf3ybUr5xuBzzxYFvsUgOKSY6SKtRjqOuwidY8iYVMm2zpZespFgp7xf6udeXhAbdXACxUH1ANT/WFnx1dol179kYZm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789484786; c=relaxed/simple;
	bh=qQRz0pWsFv0v+wwF9XnKP83GCZcDy8m7SEF9Z1JUkWg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fXYhfcPT6P6PCqpZvaef8E1UtvmMMG/lvOhqf1qhgNKNc6mX74wHw3NaWG96Cnu/IrBD8s3rVzLyzOxfFFWOPpeGXCh3irMIvE3O/D8qAoQpZD3J568w7s4FuAXOtE+0lMTOepbTq9jWKusODNnygQH0MTYaLAalOk3GSZqPTiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=IZzFJ41s; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="IZzFJ41s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789484779;
	bh=qQRz0pWsFv0v+wwF9XnKP83GCZcDy8m7SEF9Z1JUkWg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=IZzFJ41sNIcsD6gDXwKfZIaqsWtGHL892myyr4tp4MT+Q1E1Ew1OovNLW1YMKKdLs
	 Q6dub3RoyJUwfO2E2fh/HLOMF690Dqqlgw/FOvBEJHz/+ulZoXbAYaQXxB0t+iT/xH
	 pci0KaOW7xuDdIBOigd1qbdPOt0cBzaEZyS57qRA1uIOthNWLzLEyZek8s5cOugbb7
	 hGdo7/opjAcUT0Fm2m2lib1H98ArPpehsB+FShBJgZyRZ/cGbmZW6FMRbRZ3sjWFU+
	 nCqYqBAI2nkVjV3+El2SJ8bqCdo+VUndEI8BSxrcb/Dpuh5cj+2BfpwBE20S1KkuU1
	 wFfP3FDkik6Cw==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E562717E0936;
	Tue, 15 Sep 2026 17:06:18 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 662F4480035; Tue, 15 Sep 2026 17:06:18 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 15 Sep 2026 17:06:08 +0200
Subject: [PATCH v15 05/11] phy: rockchip: usbdp: Properly handle
 TYPEC_STATE_SAFE and TYPEC_STATE_USB
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-rockchip-usbdp-cleanup-part2-v15-5-8d507cb1174f@collabora.com>
References: <20260915-rockchip-usbdp-cleanup-part2-v15-0-8d507cb1174f@collabora.com>
In-Reply-To: <20260915-rockchip-usbdp-cleanup-part2-v15-0-8d507cb1174f@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Zhang Yubing <yubing.zhang@rock-chips.com>, 
 Frank Wang <frank.wang@rock-chips.com>
Cc: linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@collabora.com, Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Sashiko <sashiko-bot@kernel.org>, Igor Paunovic <royalnet026@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1828;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=qQRz0pWsFv0v+wwF9XnKP83GCZcDy8m7SEF9Z1JUkWg=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGqpXuopSxSweOFFqi1I5lfgjq6tGiHXzSZQl
 /0iqKNG52xNcokCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqqV7qAAoJENju1/PI
 O/qax5IP/08DtM+41mYSjMAB3XlU4teTJfYeLfsxRhzA9f01jke+hdmrU4D4991SSgCILA5V5o+
 ELgR194o4HfX7vkDIycsWkmX4mSaYsjvncsLc/ia4td/OSfjaM7YNHxkTvFWSFSJZqYwVrqPigP
 6u5FiwY54yzieiUauD5jJcpsUa4Z9SVi/BszMAnaZuh4Hti9A8NyS52i9vMXrv9LlXJIZOvWItT
 wnhTJ0N0oLzW1lN9lWxA2HZu3T6wQfKs0wduFZ1QOd5PUkPsmyiH+rq5zZmbmLrrlHnY0eNtK8k
 V3pifuqxrbcu/yapN75wMBHUzJEfCySSYk0Hu6Ifyk0J8kf25sHdmC2ZBXTO3L6typ8F3KuVeZZ
 VkjEHPmsLFAcpDo9F2DG3rAzoZJon6ASNDwsaLyBZTBtN1WK3ECxVc3F7xMsTue0d0C+QY7kJZi
 xrzqpwAaPoTiwuHtgmufQrb5mHZLXua8fYzg3dmqwq3lpzz5w5kPTs7x5kT0QKtueh/vipuWSnG
 NjycsWGRBdwAa1ihMeR+l67N2h1qGeoCzKgxzEE8FSCOoUu20NEaebIYk/e1tCO2mSSWtDcNOZ/
 sRwYCoR1iwqN8qKEHEyqxv8TJ93NfMBhgXudPTYEybFPC95Kbzu5RM9115c0+4NsyR4cX6wHcG7
 ZoGfC6Mfp0kBKviXcqXwxNA==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

Handle TYPEC_STATE_SAFE and TYPEC_STATE_USB Type-C state events,
so that the muxing is properly updated when exiting DP AltMode.

Fixes: 2f70bbddeb45 ("phy: rockchip: add usbdp combo phy driver")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/message/20260619155020.CC7361F000E9%40smtp.kernel.org
Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 4a073301067f..9ba571f7b9bf 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -1292,17 +1292,26 @@ static const struct phy_ops rk_udphy_usb3_phy_ops = {
 	.owner		= THIS_MODULE,
 };
 
+static bool rk_udphy_is_supported_mode(struct typec_mux_state *state)
+{
+	/* Handle Safe State and USB State */
+	if (state->mode < TYPEC_STATE_MODAL)
+		return true;
+
+	/* Handle DP AltMode */
+	if (state->alt && state->alt->svid == USB_TYPEC_DP_SID)
+		return true;
+
+	return false;
+}
+
 static int rk_udphy_typec_mux_set(struct typec_mux_dev *mux,
 				  struct typec_mux_state *state)
 {
 	struct rk_udphy *udphy = typec_mux_get_drvdata(mux);
 
-	/*
-	 * Ignore mux events not involving DP AltMode, because
-	 * the mode field is being reused, e.g. state->mode == 4
-	 * could be either TYPEC_MODE_USB4 or TYPEC_DP_STATE_C.
-	 */
-	if (!state->alt || state->alt->svid != USB_TYPEC_DP_SID)
+	/* Ignore mux events not involving USB or DP */
+	if (!rk_udphy_is_supported_mode(state))
 		return 0;
 
 	mutex_lock(&udphy->mutex);

-- 
2.53.0

