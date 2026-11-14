Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794621656;
	b=pJ4hoK/jwGoN+owdxC5ysqEoblZ+YxJsRcduYqQL/Lwp0DjI96Vt8R74Zb2vlWSTmXGF
	 HdETkQ5Ewhos20otpt66Et/E0bGldHkXbOLejagrN0gjTtm63/LszZaTpqzgcL1DH3o9c
	 IkOxhtMTDvGjG1ImLyaO7TE9XTxqg/+0n1vN+BidT2awTLqFMHp1ZDDrgDAGfYPF4tZ7d
	 W7UlpLwb7XslRsG+QFVgZh2hTq4iBLKygI+fPi8F46r8PWalHocu+HU1nJ5iSREGOl/iE
	 DDesqMh8/8H/qRVNU1hQl8NWW2ABFAEgtct5d3fk11La8u3H0E2ejguG6c69sk3mpBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794621656;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=zCw8bN96kBrkLrGt+AxORKkqOqtso8rG8E/AmusHVr4=;
	b=XYZ2T1X+b4Nc9OQ6xr+v7jzLnGWoYpeXmhkCkaACQWiPxWMDfo/Zb7WxWjhWnppq9jic
	 awTA1yjzTIiXER+NaWCVRksQhtqams0u55e7tbvWrc34oT4k81ucaI+BUBkLadhnQyFq4
	 mfuGt655SGoGBNLlgDtVKdP7rPEqhbCToM0oI+GfIR/LlO2Kv45AS1W70ym0lQ0o9Lv+S
	 tkaoMaECeRYX6HrjKncCwr3MigIkQUeMUbt6XUX5paeUsTVpqlA2EEYUxdMQ6i/9Nwqj5
	 qhzzWWyBSw2qpdZoTWP7wxaRy0eFDp1KrhrEqVmHLNYYv+K/AFCyiT+PdngHYBJT7RQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=fdLZNZV7;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A714606A89F
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 02:00:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A714606A89F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=fdLZNZV7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794621651;
	bh=guL99/tNQ3l5LAN8xz939C1LfzX2QfHZ0dLroSC4pMY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=fdLZNZV7yvDOcPCZ9ZqKjdQ25u3eViMzKHmrCNPTJ6oilP1np7uGsWffGF16Rm8LY
	 Zg+AMJiDFapYqs+dMQL9HygbRbRLPxZjfd5yc6F718GrBssQkndhdmOQGIO75vRB40
	 OFSaFgARElTzayDf3TmZZo+kwx+1WPUul64Zkmzh8paJV/n6F0DsiRCnFg5lXKLhwj
	 MT1FLT+zPirB70k9GgEinHZBxeVPKC4e8L6YjCwv/4YexRvAMompLo5uBUJrTiOd+h
	 TMQcbScwme44AiViIu3ESswBgVu+h8V/icPP0ft9b6G4g6WoiBE+EGqYvlJumw2dU9
	 OSY1XANDDwtQA==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1B16617E0F7F;
	Sat, 14 Nov 2026 03:00:51 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 7D7EC48003D; Sat, 14 Nov 2026 03:00:50 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Sat, 14 Nov 2026 03:00:34 +0100
Subject: [PATCH v17 7/7] phy: rockchip: usbdp: Add DP lane setup to power
 state update
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
Message-Id: <20261114-b4-rockchip-usbdp-cleanup-part3-v17-7-1af5f566408e@collabora.com>
References: <20261114-b4-rockchip-usbdp-cleanup-part3-v17-0-1af5f566408e@collabora.com>
In-Reply-To: <20261114-b4-rockchip-usbdp-cleanup-part3-v17-0-1af5f566408e@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Zhang Yubing <yubing.zhang@rock-chips.com>, 
 Frank Wang <frank.wang@rock-chips.com>
Cc: Igor Paunovic <royalnet026@gmail.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, 
 Alexey Charkov <alchark@flipper.net>, 
 Chaoyi Chen <chaoyi.chen@rock-chips.com>, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Yury Smirnov <yurymonzon@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1747;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=guL99/tNQ3l5LAN8xz939C1LfzX2QfHZ0dLroSC4pMY=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGr3wNLSa1hbzApCC3yroH59KqUWYFQekdSPO
 2+kvNidcuQhlYkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJq98DSAAoJENju1/PI
 O/qajS4P/1pYvIg8bIDPeUl6HR9N6gl29wcF4S9rI8FcHlNCDijZBg0v9m2hnAu+u722kFawqLL
 NWaQictuTPwkeLVBj/E/nSaLUaIErVJBGAkKVondsARRM+LbQ1HrbJBnktp4mI6RLo2mpF0ZQJK
 BUe64MbJ8Qn0TOdM2BCtD5+kx8jJnYc7sED7C2wtCZF9AJOvsLoN95RZNbebS/Lyk1PEtSp0/jW
 6kqr2qbKvAAyzPxg03wr3O8tvvDB1CzhaTVDje8GIy0K5SCQ+dwpk6XrMTN+c2A2zEZqGPKxVXk
 j6rRToBOU2yckUTV+s3A//zzF5smkapKF0J1qUOdpwSHXRz5DbPSxolRZQ/NLeq4smo0ChT8TK8
 AmhGwUnUaKaXqZucM9pyGsjCrBHoqk+iKzfKkmlnNMfuglRxThhVR/yoWqCpaKgZ2/K2RveDQyH
 oDode39yhdev4eFaNcKVeuTBCgkoJEyJ4qKA0fnS5U9sxfVwRnSZ1qJHK8OpO098tH+Xhz4tfyQ
 GzmSc+SijYXA/Gmc8fvBFzIHBjSGXm4rKhGZGKCRXb9b12VyLrRJra4h4dhES+XH7JgvrJWWIwD
 AR5kga1YmLPFh2g13QGlI5fBF4oqorFmxvjUyI9845WSZtHsgG9XrEvjipuw8M9LAy40V2vcj/d
 Jf6vTLKLNHCP/0oJmOtQteA==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

DP lane map and AUX orientation are only configured in the DP PHY
power_on callback right now. This means when the DP controller keeps
the display enabled after a cable is unplugged, it will not come back
properly with the cable re-plugged in swapped orientation.

To fix the issue, we update the DP lane mux configuration in the power
state update. This gets some special handling, because calling
rk_udphy_dp_lane_select() accesses the VOGRF which needs the DP
controller's power domain enabled. It is active while the DP controller
has the PHY powered on.

Apart from that VOGRF may lose its state when the DP controller is
disabled, so we keep the DP PHY power hook as-is instead of fully
relying on the power state update function.

Reported-by: Yury Smirnov <yurymonzon@gmail.com>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 553b88c45108..d4a46078d049 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -1108,6 +1108,13 @@ static int rk_udphy_update_power_state(struct rk_udphy *udphy)
 		}
 	}
 
+	/* Setup DP lanes and the AUX polarity */
+	if ((target_mode & UDPHY_MODE_DP) && (udphy->sw_mode & UDPHY_MODE_DP)) {
+		phy_set_bus_width(udphy->phy_dp, udphy->dp_lanes);
+		rk_udphy_dp_lane_enable(udphy, udphy->dp_lanes);
+		rk_udphy_dp_lane_select(udphy);
+	}
+
 	/* Ensure USB3 support is enabled when supported */
 	if (udphy->sw_mode & UDPHY_MODE_USB)
 		rk_udphy_u3_port_disable(udphy, !usb3_port_enable);

-- 
2.53.0

