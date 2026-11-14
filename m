Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=23.88.97.239
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794653485;
	b=1EO8GETXbCkZzq8n6tY4ivFJooEFblTI2GaxulLI8+pJ6gWrWDKE1ygtghTeBIyXJVQb
	 39AEIdhbHyLojEYZDOsXPTYwPwwm+EoT7Jo0N98YOaMOvFegUAasEU0Vw0YtGhxlkbHt/
	 0EzyKP/JwJq6PGSzZHsKW5n/79fKx1a957KrRH7gt5+3Hidwh+usScS3Dqarkyc4d/HO7
	 jAjh0GGMpa99WCuwaBDZ8jjNNA3vTkUUs3gN94kl0ovekQNq0ACFQV9d9pMcQnc6hj1Vd
	 zLP8HgiJnqmLaZ3oNJIbTVIohF1e7WChdLNkquvvD4WgcMBkh+4VxWZp3umHNoWG1tQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794653485;
	h=DMARC-Filter:DKIM-Signature:Received:X-Spam-Checker-Version:
	 X-Spam-Level:X-Spam-Status:DKIM-Signature:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=GygRlI01+cPXv/DoLTlbQ1cIRi1q+Mc9UFQJg7H+g0U=;
	b=wB6TgfNXO/xsk96+NSFY8afJ+YOOFr66HQBvytX4gf41RxqcrkUpIfc1YI81ahP5cMT0
	 EQkMlP45XcXJKFfLak0FzmTR4fGZq6cbBZcr49B1Y667D2XmkgwICyZvF+ACAVa/knzbW
	 hulfQyNhVmO0aPitgdEj+bZ6Y+Iv1PaqDcAASsitEZrXjLNwCyvBs90A5QLMrV3MbjvZi
	 L1EYr7JF9m8LR9KTw89DeUK4wFqvQKUKTZRoFD28sOTLAfl8T6gOMMho+qCs2FTcJ4kbo
	 T40/yhB53IU1zwhtQE/XAbocinx2WccrZsjfzAkndT0gXHCjVON9GhwO5EgWGasB0Yw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=birger-koblitz.de;
	spf=pass smtp.mailfrom=birger-koblitz.de;
	dkim=pass header.d=birger-koblitz.de header.i=@birger-koblitz.de header.a=rsa-sha256 header.s=default header.b=JbCkue2A;
	dkim=pass header.d=birger-koblitz.de header.i=@birger-koblitz.de header.a=rsa-sha256 header.s=default header.b="S+TDbq2/";
	arc=none smtp.remote-ip=23.88.97.239
Received: from bkemail.birger-koblitz.de (bkemail.birger-koblitz.de [23.88.97.239])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2861A606A339;
	Sat, 14 Nov 2026 10:51:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2861A606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=birger-koblitz.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=birger-koblitz.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=birger-koblitz.de header.i=@birger-koblitz.de header.a=rsa-sha256 header.s=default header.b=JbCkue2A;
	dkim=pass (2048-bit key) header.d=birger-koblitz.de header.i=@birger-koblitz.de header.a=rsa-sha256 header.s=default header.b=S+TDbq2/
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=birger-koblitz.de;
	s=default; t=1794653483;
	bh=P6OG2gM1klz3dLoSZQfBExeLecMGKof44yOnBaFhd8k=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=JbCkue2Al9pyYlNIt0JElOB1q/zIVAgPoxRw/gEvRXmM/rJIUEqQDiRHHO02XQb2I
	 t8YrZ9MlT/H1wIqp0/a98H1i3cXM8wJBDD40O1xSQASgOI9rmo2dyGFXhyLuiyefz7
	 bboDgIZwENcOrbRzgKjdc4/Zksj0RdjTN35zf/crkh+Ft/ke8u8PuEGobBOzlFH0H7
	 dvpyZdvZfoW+MizTMtZtSqT9+hVtQXO7CDjzaIlDE6C1E8VZmjT5UioWqz1EWO3PRT
	 kL7dpJib21iHUHbO5QOCr/zs+O6L58J11wr5Xn9Yy5y9TxxrX0dAu4q9YCpmpKtEUC
	 YqMQEaBPoLYfA==
Received: by bkemail.birger-koblitz.de (Postfix, from userid 109)
	id B134D489E4; Sat, 14 Nov 2026 10:51:23 +0000 (UTC)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=birger-koblitz.de;
	s=default; t=1794653480;
	bh=P6OG2gM1klz3dLoSZQfBExeLecMGKof44yOnBaFhd8k=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=S+TDbq2/mKtfuB5To0yDOxJYLsL4IJ0H+ysPqSKapuTNO+hdkas8XV7UG5omxu6ES
	 LP2hhORwQS/iG5iYI4Zs+aNl325lSpb88OK86Gbx+HougY248f9oDqeKHHWM3FgCtk
	 SRbcAnZLEEa9eoSz3ZUizEgDLVxHAC+j9OD5hz7hyXJRITOIGLg6rLb3+RqTejxWvb
	 YKl6oWZg0KI+siW2ls3e7K2Nlgdg+IlhMHzwl31znmPyztiX5KgYadIIx1y7t1Wj0b
	 az/1Jpn9bvxEFC3km/bxw/+emAgrp9RjsYlcXqDaCCXLWL7zRitu1ZCqBVpxm06KzI
	 EVsDq7AGNH9oQ==
Received: from AMDDesktop.lan (unknown [IPv6:2a00:6020:47a3:e800:271c:c6c5:9fde:77cb])
	by bkemail.birger-koblitz.de (Postfix) with ESMTPSA id 6ACB9489AB;
	Sat, 14 Nov 2026 10:51:20 +0000 (UTC)
From: Birger Koblitz <mail@birger-koblitz.de>
Date: Sat, 14 Nov 2026 11:50:58 +0100
Subject: [PATCH net-next v21 02/13] phylib: Add support for PHYs with
 broken forced mode
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
Message-Id: <20261114-ax88179a-v21-2-c2d34410bcbe@birger-koblitz.de>
References: <20261114-ax88179a-v21-0-c2d34410bcbe@birger-koblitz.de>
In-Reply-To: <20261114-ax88179a-v21-0-c2d34410bcbe@birger-koblitz.de>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Russell King <linux@armlinux.org.uk>, 
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
 Eric Dumazet <edumazet@kernel.org>, Eric Dumazet <edumazet@kernel.org>
Cc: linux-usb@vger.kernel.org, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, 
 Jianhui Xu <neuromoments@gmail.com>, 
 Emir Beganovic <beganovic.emir@gmail.com>, 
 Birger Koblitz <mail@birger-koblitz.de>, Nicolai Buchwitz <nb@tipi-net.de>
X-Mailer: b4 0.14.2

Add support for PHYs which only supported auto-negotiated
speed modes. This prevents a kernel warning and stack-trace within the
phy_state_machine when PHYs return -EOPNOTSUPP from config_aneg()
because they do not support forced modes.

Signed-off-by: Birger Koblitz <mail@birger-koblitz.de>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Reviewed-by: Nicolai Buchwitz <nb@tipi-net.de>
---
 drivers/net/phy/phy.c | 7 +++++++
 include/linux/phy.h   | 1 +
 2 files changed, 8 insertions(+)

diff --git a/drivers/net/phy/phy.c b/drivers/net/phy/phy.c
index fce9bc7be3304b408c9f3ec9b5b95c76d3680a88..079c53516f424ca5f8d50292f1912af04b45b07a 100644
--- a/drivers/net/phy/phy.c
+++ b/drivers/net/phy/phy.c
@@ -354,6 +354,9 @@ int phy_mii_ioctl(struct phy_device *phydev, struct ifreq *ifr, int cmd)
 			switch (devad) {
 			case MII_BMCR:
 				if ((val & (BMCR_RESET | BMCR_ANENABLE)) == 0) {
+					if (phydev->drv &&
+					    (phydev->drv->flags & PHY_BROKEN_FORCED))
+						return -EOPNOTSUPP;
 					if (phydev->autoneg == AUTONEG_ENABLE)
 						change_autoneg = true;
 					phydev->autoneg = AUTONEG_DISABLE;
@@ -1190,6 +1193,10 @@ int phy_ethtool_ksettings_set(struct phy_device *phydev,
 	      duplex != DUPLEX_FULL)))
 		return -EINVAL;
 
+	if (autoneg == AUTONEG_DISABLE && phydev->drv &&
+	    (phydev->drv->flags & PHY_BROKEN_FORCED))
+		return -EOPNOTSUPP;
+
 	mutex_lock(&phydev->lock);
 	phydev->autoneg = autoneg;
 
diff --git a/include/linux/phy.h b/include/linux/phy.h
index 21afc2082b1741ff276a9588246c2f98351464f5..f1b1ad1dd82f5c51ddd2f0759666e17802894c96 100644
--- a/include/linux/phy.h
+++ b/include/linux/phy.h
@@ -64,6 +64,7 @@ extern const int phy_basic_ports_array[3];
 #define PHY_RST_AFTER_CLK_EN	0x00000002
 #define PHY_POLL_CABLE_TEST	0x00000004
 #define PHY_ALWAYS_CALL_SUSPEND	0x00000008
+#define PHY_BROKEN_FORCED	0x00000010
 #define MDIO_DEVICE_IS_PHY	0x80000000
 
 /**

-- 
2.47.3

