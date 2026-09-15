Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7384C3DD867
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 15:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789484788; cv=none; b=MUlOVJ3beMU/G1AXvDkKxx3Vjx++UZDd2vgjAUekfbyTK4j7hA5uo/mt2DETELQqctgITWTbhUC+I937m53hRMqMQpo35tv1BhQsvtcZNSsRaftTPQGf9kGytqIOte6BtekQiQtgiveQy4Pka6u+8G6Ck6ZEmJSnnGqZdpOa9YQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789484788; c=relaxed/simple;
	bh=vdDrjiEKTnq8slqmHla/LpW9vq2n25PPqUvoUhamiMQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=byXlD4bzzsAoiQ1KbeV2+snOYGliXin4N33I8XhZWq/rn0G8G7de1Gnl7m0Ws9eLlKBUV900gDalJvjVwLiZaqFZIgN9LfGwqRLYsVpfzeybsGvjcpjk//MRO/3PxYXICkcW+N26M6DIrEjQCgpJccX3QYUM0yri9YL3LVQVHXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=FhfQjAhg; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="FhfQjAhg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789484779;
	bh=vdDrjiEKTnq8slqmHla/LpW9vq2n25PPqUvoUhamiMQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=FhfQjAhg0lWML77et9kXBWSd5sfDPyE6PFUtoHVlknqJy62TEb880BWmyHAuc3KK5
	 6pS2wP9eBc/V6oreidb7ZsRqUQPzFXxJQRuQOjuQlrex79xD4n0TofL9JDVGG5rdUQ
	 PuLckLl4tz+J6iFC+jrbCYKzSNMYUxxeN9G18S7st2x9R69q/Y3Ue+Qq82z1MpdX3V
	 dYNuCw5BJKiETRoCCsSoRMLe9Sz6ad08UtCmXhDcEyqm8fO+B1hBcfE5aLBCxpgqXi
	 z4dLvKCTL5D2Jm31HM+mdqc0HynQgh42YxXxhTNJexgbovIIVeEztZU/heFzkydKHR
	 TiTzPRYXB5gyw==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id F0F4A17E0D69;
	Tue, 15 Sep 2026 17:06:18 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 6989748003A; Tue, 15 Sep 2026 17:06:18 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 15 Sep 2026 17:06:10 +0200
Subject: [PATCH v15 07/11] phy: rockchip: usbdp: Hold mutex in DP PHY
 configure
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-rockchip-usbdp-cleanup-part2-v15-7-8d507cb1174f@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1410;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=vdDrjiEKTnq8slqmHla/LpW9vq2n25PPqUvoUhamiMQ=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGqpXuqrmUDFinw2vWcKL6ny6SsFGri9AYUGu
 KzPMzkbCqtWW4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqqV7qAAoJENju1/PI
 O/qavLcP/iy8kD8BxsxRSSExBieSYJ7mX+nm1nU/sMBnd/P5uibVB+ikcDSHJwmFa6F/jBDkuih
 okv5kV1hwXqNEPaeRpAYrj68diheqS0OiWukcFYT0Dd7OntOLo4RmAhl4UPOpYH11gGN9Yj1ZBw
 qxtNd678Qe6MwW0FX6ngUEgmeg6m07+Grp9ZgkKJ52s59eY61akScTZzjRAwHrwkhW8plj5yV6D
 MlEL6xpUvLKQaV3Je1QOjk9Jyd4G9By/weBDqBf0pEbpWwvKdh2U9BB7d6C6qdQogsCLiArfCRg
 hCC5ZdQWMEJvZS0OSDr89fTzkv28bB83dn0XArLaGUE1Faxg9ZKe/R/WQqIKXk1+Yjs+V3e1r38
 fZziwwxTKzHQkr+8DmkBka4c/T6EvyNqdqFrlXX8Ob3b3edWcOPd+0/5p5fqqFTeEvX/O1a7Xnt
 nbeFqtJ122shPQFXWkfQG/PJ20+cxUroPdASFP3pgevnaz128pzX7kAIoKCBQWYlhlmvbKwpg71
 oBG5Uu3heHpt7jOrt4TJ5drH9Nk4wjuAXO+eEyibmmjwhxzkAzk21XMQQLS5TWIrZyqC4JlLdcp
 9pzC0B7nAPJC7BqqIqPATbMASyzqrXvpVgXYqcnCUBRPNODquO1IOvcFLNEyy2MDJf3BhXvF63i
 8YfPuVxn+Ha5Qck75l5wroA==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

rk_udphy_dp_phy_configure() accesses some variables from the struct
rk_udphy, which are updated independently from the USB-C framework.

The USB-C mux/orientation switch functions already hold a mutex to
ensure mutual exclusive access to the struct rk_udphy states, so
simply hold the same one in the DP PHY configuration function.

Reproducing problems due to this on real hardware would be really hard,
but could be possible when quickly re-connecting the USB-C connector.

Fixes: 2f70bbddeb45 ("phy: rockchip: add usbdp combo phy driver")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/linux-phy/20260612164627.23D391F000E9@smtp.kernel.org/
Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 9864024b9c0a..2888a0a97088 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -1153,6 +1153,8 @@ static int rk_udphy_dp_phy_configure(struct phy *phy,
 	u32 i, val, lane;
 	int ret;
 
+	guard(mutex)(&udphy->mutex);
+
 	if (dp->set_rate) {
 		ret = rk_udphy_dp_phy_verify_link_rate(udphy, dp);
 		if (ret)

-- 
2.53.0

