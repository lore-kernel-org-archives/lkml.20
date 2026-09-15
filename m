Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C16A4B66D3
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 15:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789486388; cv=none; b=dLaumGWJMs5veS0xk2hFrzvDiiRqnecceDmFrbrQxUjazvzTqc4vSCeII24/zY4GV0wW/vYH9g3ikmkboetIfOdIu2tUqu9pIijcWQjwV7yd1KQzoPOR6OhB2I+TVzUy/griJ7AbcUlkP8osAPhxA5MvZn1X+7v+lkXJZI0UBQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789486388; c=relaxed/simple;
	bh=cyZeVWTFO2ule5P/ArzDBKigZ7GOelSZIx1KAmrbRzU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Tyuox7HUzmIGhjqKn2MBXkQ1c4dslGCyBAHUHIblNFZwlxJB3/db3GtenqjXJz3T9xV0v92XYXw63Pkb7IyGudezNr43jw4Vya4eTGRpiGyRTr9rI30e3uAGjy43rZD4IsIqFS4v4OhSTySN6sn1bCiC6lByD8TGPzR5Oyq1xQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=N9nFW81P; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="N9nFW81P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789486379;
	bh=cyZeVWTFO2ule5P/ArzDBKigZ7GOelSZIx1KAmrbRzU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=N9nFW81PbZXZsgb5uOhH6owOO2DLdrXcU8JSDPAarGcKPlBnlL7eY4WUr+NXWHBKi
	 4XMsJl6+6Gjdc+A4iwKR5yG+eEyKgTJiDLYAnDoMgSgChlFxrzNcs/imtTq8fhrmjF
	 2v1gGU7O1/UVhMfgG5lah4/+bhULXDrcu7CE+3rZ0usQQahZdbr/hAlkbN5s3jzWq2
	 VnES36I7YoqQ5ycCdxmVbo0awyk+AUUQNV2d3wPtpXp5ICQoj9ibrM0IXeWuwap7rF
	 MECP3ye5nn+nZPeq7U1sdjS7j/31CZ8C2iP3Ae1jlmZjmCTgOTHYb6nTCkkrhR04iW
	 SvP99+VZFQ/bQ==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A86A817E0082;
	Tue, 15 Sep 2026 17:32:59 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 6A1AF48002F; Tue, 15 Sep 2026 17:32:59 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 15 Sep 2026 17:32:49 +0200
Subject: [PATCH v15 2/6] phy: rockchip: usbdp: Drop -EPROBE_DEFER hack
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-b4-rockchip-usbdp-cleanup-part3-v15-2-9ad90a456953@collabora.com>
References: <20260915-b4-rockchip-usbdp-cleanup-part3-v15-0-9ad90a456953@collabora.com>
In-Reply-To: <20260915-b4-rockchip-usbdp-cleanup-part3-v15-0-9ad90a456953@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1497;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=cyZeVWTFO2ule5P/ArzDBKigZ7GOelSZIx1KAmrbRzU=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGqpZSs1cxOL/54Bz7DK6yZU9mrwVU2J5c2d5
 yPi3kKn+k7BdokCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqqWUrAAoJENju1/PI
 O/qa6sUQAIjrYErS6IHPpRuKdw+XTzMFitnc6m4UtFu+MlbQxxlC/jw/ZZVrmfd+6xhF/8TQwam
 QY8jAmJLXP8riGKRSSOJaEjY08Ejp28fxzEFNPaoSQkjm5s76+Fw5AORP1OtvoIEeZ0JBKyhNG/
 iy4CPTf2inOeG2PQdolkVEGIbv0TbE6LFpnSntdJlAfMFxmAPXrX/rnpESm7HesJDw+PKltWdq/
 zDZKm66sg7Zix9wBN+NQbs2418Tni9QOyYirtK360OPOasi/DFRAPCNISVwjfHlyiY3FgJWW1B5
 sFLrbUxdlpp7Lx6ZNjj3Mp8I9fB57o3VmTavQCLIxPXFZNAZugcq71we2cBj2w3nDceqDJAYtqg
 jMhoaC0N0BPguyFdq+wrwaZxs1v/mN4HbWVL5UcXd4lgX5dVml3BQ6m76KiX8cvOYFuWMzFglZ2
 ikHGOKQe/zGfWTDQ/ehSQU3e8Jmn36NiUWSxbSak3Hprgq+fdGQ/xO7lo1YxLn+SneRHESik2HP
 PbWvA6uAO3FgfljdexLqQNGHQun6L220Vwl7iKhYXmm/oSrFLkfGl0Kf1fgTnXNIZNWN4XsXOCY
 YxBxwXpTJIPdHxTC6GaMMPcEzgVW74YMml+7ZjLTPDw26u8XhzwYxEOHze9n4ZspQdRNY5bIuKn
 c50hKFsiuWn0gMy1HrpgzRA==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

The hack to return -EPROBE_DEFER when the lcpll lock timeouts is no
longer needed. The driver now does a reset during its PHY init, which
avoids the problem.

Since rk_udphy_status_check() is called after the probe, it should not
return -EPROBE_DEFER.

Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus
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

