Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5215E4AA57A
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 15:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789486394; cv=none; b=gBj6577bTg4endYQYrzgwKzeQRUqKPRaP729BXiLs5C9qbJa09Fxjx2mxCkMxBwo9CcpTtcE2MQYboth8OgIc0gyRYWZ5rhlPNMtpzM6M9vAeV6b6V7g3u1fZsmg6/9NiPPQYW5TH6SYRLl+8DJsXXzto1nmVm6Z3gNsDcyJvPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789486394; c=relaxed/simple;
	bh=gCTESeIDJUjWAEYhTqkRMrTB/sg5xcKMCHph/xlPFl8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pBg+yb4CtwonM0gd62e8pvkASfnd0SYgYF0ILcxKnqHOoBMT7pTtdC3E8cgl1xD8EreMw9cNWmNRdHiwqVlJlA8XBWRR/6ARZ0IfJ8XhHgf8UELJe481SsGWH5XXFE3mT/gdXjNMakHzJSBgEMyZSKdbqhw0Ot9qjZ2f8iOyTlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=gMHOGcBT; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="gMHOGcBT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789486380;
	bh=gCTESeIDJUjWAEYhTqkRMrTB/sg5xcKMCHph/xlPFl8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=gMHOGcBTe+3KiF2p8LfYW/7n5jMPBg8HKWFnriCJJ+F5zOUnelLiI6kgoUJtRHWFl
	 snrxRVRXzpdDsWy12rXt5q+DIxMEJfj+4txXRhLLZ0ARENq32dXwWGcHtO8+oEAhue
	 C8t9kg01sv/5rlgGDfgnGThU6vziXeSWdKjFBY04oXdqWQ5ZuayOkgabPRmyXKJUfZ
	 GYvHgl0lsAjAbiEktGFLkbEXPK/WyJ2TSoa0rU5FYb13ECr2QLjwGyZgWSMBuArQAu
	 En4Q6UfTO36RY2f6M0aYlZCTZWuqvmv7Yp8oT7ClnRfQRDEt7nHX9JMQK4fOAx3P/0
	 I3SJHnq6xEAFw==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 08FC417E0C7E;
	Tue, 15 Sep 2026 17:33:00 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 6F576480035; Tue, 15 Sep 2026 17:32:59 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 15 Sep 2026 17:32:52 +0200
Subject: [PATCH v15 5/6] phy: rockchip: usbdp: Re-init PHY on mux change
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-b4-rockchip-usbdp-cleanup-part3-v15-5-9ad90a456953@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1119;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=gCTESeIDJUjWAEYhTqkRMrTB/sg5xcKMCHph/xlPFl8=;
 b=owJ4nAFsApP9kA0DAAoB2O7X88g7+poByyZiAGqpZStvFDuWqgsEKyzypKm1acU5stY7XHAJi
 6UGs8NdagYcCIkCMgQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqqWUrAAoJENju1/PI
 O/qa2lMP90/6e6Ti2nTfc0+qiub8SSs4ashZT0drMWcqyqBhVKF1iPOeOQ8b6eUVSBNgXvoe6qn
 LmS2FyT8T11thocP+tXJ2irNZVhWCVYBGfZF7SkWMBXHRUf4xvHuqooQ7D8X4JNT5iQ0M8HWn90
 fhSjL+DGTDP5S0e07MYNvl1hC1siDa+xaQY3Ic/eQajw6/V785hrfffRvFKCS5BTqJ8by1zDsJk
 MMyk0IvlZ8h84wmB4BaxWvE6mm6IaNPkf7tZVgFWrwbpLml44QcX1+9SfTIIU9IngF8f0DJ/b4M
 DBhEi1fMLS4kipVohE76tF7woD5mN/iVec6MbBXx0QXaM3+HbSvm0zQFaAJAY12B4nKq1C96cOE
 y/atF+dYeQdeihnu2FtEStlL8OcB0QDHmelSMYunLMTFuAXi9Qevgfea2xaPFG8wU6mboYDEJ2a
 qFhrmfVTVZ7mbN/dQ5QoXuEPra2ju3QRwSjFTdZWai/bCy9H8l3Ji8LERlevKOA0R5bsO9S0YcT
 snau9Dzbo0SVtst33CycMD/LCH/MajJqxjAgvsJMKlJ1bMOgylsmUgmxSx9FSas3LpBtHsndFMm
 OWgwx7MBl+DjUn5dJcL137rs8WEUqBF6h0Y2kWInt2KJOQB75k6rlUG7arLitln6P2wDyi5PYBc
 /+kQIq175iRKtdVgTmCxY
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

Ensure that the right part of the PHY are powered up when the
mode changes. This ensures the PHY is re-initialized in the
following two scenarios, which are currently broken:

 - cable orientation changes without DP being involved
 - switching from DP-only into a mode with USB support

Fixes: 2f70bbddeb45 ("phy: rockchip: add usbdp combo phy driver")
Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 867f356f394d..ca01c1112c0f 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -1391,7 +1391,7 @@ static int rk_udphy_typec_mux_set(struct typec_mux_dev *mux,
 
 	rk_udphy_set_typec_state(udphy, state->mode);
 
-	return 0;
+	return rk_udphy_update_power_state(udphy);
 }
 
 static void rk_udphy_typec_mux_unregister(void *data)

-- 
2.53.0

