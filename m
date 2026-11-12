Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794459262;
	b=V5jIsPsNxVSmFvUg+8lpcC+KQoOGw23tbaiA6kUwVu1tmAZMfMJdUkexusiTdqWDThUV
	 w0+fUDgkA8h+Rm+ttfL+teP9enq2P7/+RW92PFE1Xf2yZdGk4pWtnVYSVB/uXmTaSFeWW
	 bYkBRyNOxl/kaScb5g1v/iayNo32gFP+xVY3bGbx9O/zpCJwIaCWPsmg1ZBmt1YUrnYqF
	 HojjuDAcBAZCwIv2lBi3Ur8w5WFI7odOfwBHK/hfhTzuHo8c4Xeuz7vOW+KPwEEF9KS+w
	 2Qnm0oI+qxA79cGw0enkejFGSdoHPGpQdGDG0qYNGW1hYr4PL/dBqJVn5A3PjiOXNxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794459262;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=qvUR5N5zKOCVhfOIkYeVqQzWv23vnIRuXnDClDfRP6c=;
	b=kJ3hTlj9a1sMao7ONVCGzbTt/5UZ7PIvVl+hrh98irE/Rv1SwsqFZTBtF5N+CVrVx0bH
	 +qiUP36hRaZU8NI4Zm1HUK2MFXeZNYbphwIdQpUTrGCjrhdFKXR+Lnzg5aSYix64PiC/y
	 W6WTdgS5du60Li+KB78oXMboFocueMb5rdeWHUQdcRYIZVkVEP4UjpR6uiapvao2r493l
	 INb4XCdmP3TOsks9ujscP3hpZGi0vvDp5BF0ZSTHvUVWXn4eLg4W2syWHEf5ZSZ2PHjSA
	 D5hB2tNxaUnERdxWw/1t5he1aGMMtllPda/OqbpeQ3/BBOPXuCDhjq9GTe/5wQLuj2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vxOvM81O;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE7B0606A898
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 04:54:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE7B0606A898
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vxOvM81O
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso8193219eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 20:54:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794459261; x=1795064061; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qvUR5N5zKOCVhfOIkYeVqQzWv23vnIRuXnDClDfRP6c=;
        b=vxOvM81OAZY0jnBX+TWPk/FQHy9bLvKQT0klCx+oBGc4K/28t28hCS3QTue8hRuPy1
         /KCfBloBsKb3HO3trPP2UkwSoHppvWpYCaZBLjqj+0yjHCHYQELgzCPlHOwgXxXgNqgf
         CS+mgLp4pU1kBpIR75ynbBrBpLmf75IktdD8cVpmnIOLCSCisZ72rlPGIVL3+/3tgCMF
         gN27dxLPEpXcAd9N+sQI0z+En0fSikB52+5S/TZiW6tvQiDRksdHMq7L9sFKml7XLBm6
         gsswf4UTlbkqJzciJ1NloyhrfWCkNVQUFke7v5h9SgiaXHhds/umRQa4LhgBb76/jhdv
         ONYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794459261; x=1795064061;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qvUR5N5zKOCVhfOIkYeVqQzWv23vnIRuXnDClDfRP6c=;
        b=yzzvo1yL8Uqw/6xeD+5xTE5WM9Z07bjC0xZuU8aEwKNq/0W2gmN9yS/i9+YHY2ICO3
         BlYF5bbgn4J0+GN1sB/w0LAAVCDJLxSid23B4nG3XbTWR2s7r8QzaJ5cd5PnDODee1yF
         Ffhsi/wW3tn+6Ud5ZEXcd4hLPevAsX8+2vSWEXnC/ySDef49a8igSXp2UYHQdgqFStQO
         uj/gXBcttlasYl+sZ0ACEoaZwthxwVlmrwkBPYe7w6qHJ2UFqtE7L7Lytk3iYYIXCkPK
         mVGGg0iRtl0quTWmFG12Rk1LhcZ8462fsD7YOEhpBH2e4G85ArIOEPQkKBVsxc0ih07g
         CJbw==
X-Forwarded-Encrypted: i=1; AL+hErEDZeCW5q2lOQLapfW7lwnAlxU3WIVJ2G6V5csGIrA1rDZtIVuCjoeM+ly7gee3EFDDKC3dSFmYqCGyqMw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8S8aaiNQ7PhXIJDaGBu4M6bdlaz1tgZ+Thfx1cCn4EMyKs0A/v
	HSYuM/OIGYmKbN5iOunTWYqmWuKyFRzumE/1E5sta4fsf4fLyvhK7ZdJ
X-Gm-Gg: AYBFou00IZdyRGgX2dDdixAtKCZKMAm/FSwgqIB48VQ3ClkIOZg7sJq2A6B9As8Deo9
	nK8tKyF39lA17ZdMKQRaMwaF+ls+EE2rrEAtv+wnFr4CFZB01TR+Ob0UuGdz1TmO+x2HGGCJSAf
	9ff8CuazhPNVyQ1Zn3bS8k+tLaP0h1sRBMeT4ESD4y9Vjnq5Ie9Vkc+zTawhrXGypRm/Vw8gCLz
	tfnf9b6izGmo9zIjqbxTdCDxv7jiXPkPQXVFrxTzPX05uJBAI/m3P4ZVJEGiytCtnWPAKeeK4E/
	Vua9dLbWiiBv7UWixmHB253JiYhC9PRbM5BUyYeXCiT85wB1u1aU4umYWaK6nIU2+b5uj2m28mw
	J/uZ8ZNidkLFo0HdSw82D59Tt9kUxu+IEKEueSMW14pt+ttiAqeVqz5zU3pUDzOgzuz29ljyFI4
	l9Pj8Tez8FQky754pzmq+JNiTUFVDvfIwqR5IsnSx39rl0mOFmisiaz/bhFo5K/i5q8JE0dPiXa
	NR8BuzQu3l5SG1DGZpQyWw3W5vWrDYYC+oeh/3JXkTP7Xnfwdcd0xGD+JRR8MEdXA9St0Cmcyqs
	2H7k2c2+
X-Received: by 2002:a05:7301:7e0a:b0:36a:4a68:84e5 with SMTP id 5a478bee46e88-376850cff34mr4147957eec.8.1794459260793;
        Wed, 11 Nov 2026 20:54:20 -0800 (PST)
Received: from eldorado ([2600:8802:b00:1f88::287])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520cfdfc6sm23921585eec.17.2026.11.11.20.54.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 20:54:17 -0800 (PST)
From: Florian Fainelli <f.fainelli@gmail.com>
To: netdev@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Jijie Shao <shaojijie@huawei.com>,
	Simon Horman <horms@kernel.org>,
	Runyu Xiao <runyu.xiao@seu.edu.cn>,
	David Yang <mmyangfl@gmail.com>,
	Herbert Valerio Riedel <hvr@gnu.org>,
	Jeff Garzik <jeff@garzik.org>,
	Danny Kukawka <danny.kukawka@bisect.de>,
	Mugunthan V N <mugunthanvnm@ti.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	linux-kernel@vger.kernel.org (open list),
	Manuel Lauss <manuel.lauss@gmail.com>
Subject: [PATCH net v2 11/12] net: au1000: keep the MAC stopped until the PHY link is ready
Date: Wed, 11 Nov 2026 20:52:53 -0800
Message-ID: <20261112045301.3669532-12-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261112045301.3669532-1-f.fainelli@gmail.com>
References: <20261112045301.3669532-1-f.fainelli@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

phy_stop() powers down the PHY when the interface is closed. The driver
leaves MAC receive/transmit enabled on link-down and enables them during
initialization before the PHY resumes. MTX-1 can hang when the MAC runs
while its MII clocks are absent or still recovering.

Stop the MAC on link-down before phylib suspends the PHY. On open, clear
the driver's acknowledged link cache and synchronously resume the PHY
to restore its MII clocks and honor its recovery delay. Initialize the
MAC before phy_start() so the PHY worker cannot access MDIO or enable
traffic during setup. Leave RX/TX stopped until a link-up callback
configures duplex and enables traffic.

Use the acknowledged link and duplex cache under the device lock during
initialization, retaining it for watchdog recovery. Keep the reset-time
hard stop for paths without a preceding link-down callback. On resume
failure reset the MAC and release the IRQ; if initialization fails,
suspend the PHY again before cleanup.

Fixes: be9dad1f9f26 ("net: phy: suspend phydev when going to HALTED")
Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 drivers/net/ethernet/amd/au1000_eth.c | 39 ++++++++++++++++++++++-----
 1 file changed, 32 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/amd/au1000_eth.c b/drivers/net/ethernet/amd/au1000_eth.c
index 8b7a88ceb3c5..d60430a3795e 100644
--- a/drivers/net/ethernet/amd/au1000_eth.c
+++ b/drivers/net/ethernet/amd/au1000_eth.c
@@ -456,7 +456,8 @@ au1000_adjust_link(struct net_device *dev)
 		/* link state changed */
 
 		if (!phydev->link) {
-			/* link went down */
+			/* Stop the MAC before the PHY can remove its clocks. */
+			au1000_hard_stop(dev);
 			aup->old_speed = 0;
 			aup->old_duplex = -1;
 		}
@@ -691,8 +692,8 @@ static u32 au1000_rx_mode(struct net_device *dev, u32 reg);
  * When the device powers up, the clocks are disabled and the
  * mac is in reset state.  When the interface is closed, we
  * do the same -- reset the device and disable the clocks to
- * conserve power. Thus, whenever au1000_init() is called,
- * the device should already be in reset state.
+ * conserve power. The device must be stopped before au1000_init() is
+ * called, but may be out of reset for MDIO accesses while resuming the PHY.
  */
 static int au1000_init(struct net_device *dev)
 {
@@ -727,12 +728,12 @@ static int au1000_init(struct net_device *dev)
 
 	wmb(); /* drain writebuffer */
 
-	control = MAC_RX_ENABLE | MAC_TX_ENABLE;
+	control = 0;
 #ifndef CONFIG_CPU_LITTLE_ENDIAN
 	control |= MAC_BIG_ENDIAN;
 #endif
 	if (dev->phydev) {
-		if (dev->phydev->link && (DUPLEX_FULL == dev->phydev->duplex))
+		if (aup->old_link && aup->old_duplex == DUPLEX_FULL)
 			control |= MAC_FULL_DUPLEX;
 		else
 			control |= MAC_DISABLE_RX_OWN;
@@ -742,6 +743,10 @@ static int au1000_init(struct net_device *dev)
 
 	control = au1000_rx_mode(dev, control);
 
+	/* Only use link state acknowledged by au1000_adjust_link(). */
+	if (!dev->phydev || aup->old_link)
+		control |= MAC_RX_ENABLE | MAC_TX_ENABLE;
+
 	writel(control, &aup->mac->control);
 	writel(0x8100, &aup->mac->vlan1_tag); /* activate vlan support */
 	wmb(); /* drain writebuffer */
@@ -916,6 +921,7 @@ static irqreturn_t au1000_interrupt(int irq, void *dev_id)
 
 static int au1000_open(struct net_device *dev)
 {
+	unsigned long flags;
 	int retval;
 	struct au1000_private *aup = netdev_priv(dev);
 
@@ -928,11 +934,25 @@ static int au1000_open(struct net_device *dev)
 		return retval;
 	}
 
+	spin_lock_irqsave(&aup->lock, flags);
+	aup->old_link = 0;
+	aup->old_speed = 0;
+	aup->old_duplex = -1;
+	spin_unlock_irqrestore(&aup->lock, flags);
+
+	/* Restore the MII clocks without starting the PHY state machine. */
+	if (dev->phydev) {
+		retval = phy_resume(dev->phydev);
+		if (retval)
+			goto err_reset;
+	}
+
 	retval = au1000_init(dev);
 	if (retval) {
 		netdev_err(dev, "error in au1000_init\n");
-		free_irq(dev->irq, dev);
-		return retval;
+		if (dev->phydev)
+			phy_suspend(dev->phydev);
+		goto err_reset;
 	}
 
 	if (dev->phydev)
@@ -943,6 +963,11 @@ static int au1000_open(struct net_device *dev)
 	netif_dbg(aup, drv, dev, "open: Initialization done.\n");
 
 	return 0;
+
+err_reset:
+	au1000_reset_mac(dev);
+	free_irq(dev->irq, dev);
+	return retval;
 }
 
 static int au1000_close(struct net_device *dev)
-- 
2.53.0

