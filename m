Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794459245;
	b=Jiy/iFaYul2G/jS6djhSHwmUy11OBXWyaW/gsY0+DmiZltq3LJMwvB0AcVl0YBzqlS4P
	 //1TKgjms5OIbXL0odTannNEoENldT1B9cQrr8HLcD2oRp0LG1LhoFC/4g777iLAiCU4i
	 rvXIDa5WOlG8pfgpyNaj3pq0Y15wy6KQ651zB5U53skkyxiECQNjBjV+b6OwNH2BNXSSB
	 Uh/WtowRr7o+XXoSTSHFhUmY7RqnZiehidPIB2O6R/WHF2VFKWlrc2X7xjkrwzLgG4bT8
	 +T/z3PpjmAf6RiMDCsGZR5993HtvPaCCdu4C04/OXcZRE0zsCtAtVtRJbK3ZROfhY1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794459245;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=LZWh9LU/nAWUZuRUFQR3AdsNrL+pqhM3F3VmMPsPiXw=;
	b=o/6UbrGK9USIB6wFYQONHczO3f28jfCqIPU8AJCMiH/jKC64yyShJh0ir6+Fnv8BsaSN
	 NKpUU/GXRA3z257QgbG0u5wfotkiNGbXX5AQOpM0vwMznowd5WCY3sqA6If9V2oUrQBc+
	 DbLqptkY6Gjas9evVHGA+NasmNA+esg/pe9gWunipPY5RJ+OTfw8shsxQPLxzGoUTPt9I
	 gcOaWYN8zEnfyDWxrdXOf7nedweTFEEEpjXDORhAky7i//Xbviiv2K9Bm3gclTiSTKW8n
	 twUrls3GKtmmhA6qgsQP6HcHU9UWWP9CofM0SjEVvTLRw5c5ktSwgM07Rb+1eQlMxYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cOJwvI4H;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27EAB606A33C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 04:54:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27EAB606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cOJwvI4H
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-372bdb942dbso4970239eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 20:54:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794459244; x=1795064044; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LZWh9LU/nAWUZuRUFQR3AdsNrL+pqhM3F3VmMPsPiXw=;
        b=cOJwvI4H1fuGqx3IBEmnw66lr/EHRfalL5K7ukBFmIhkkh+E0e+ZWajfEwB+rjEToz
         oiwb8q8/ZvB9L6AKSqVcVM5C9QrNywcG1puUkEBTJuMghwTNMPsJrX3w12vMvo/Ej4Cz
         Ms9oHFriv6yQ2gdQkiNX/l02DJAjzAmchLLIZP0bShC9bWTJ+zpIsU1Q5BfCkt5BXDzm
         xQG5AYnH7Wwrre/aJr3BuSNZVIxbS9s/9YXQ3LBwE6yVUDhbRUrWlLLvmDDFXZ20sUPJ
         jxV0m4zj1Z7CFNcuFyaTSs7T87F9EPio+l4jb7HdOr2JdJc2frvQBLy3Ll7L5tjCyqXq
         eYyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794459244; x=1795064044;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LZWh9LU/nAWUZuRUFQR3AdsNrL+pqhM3F3VmMPsPiXw=;
        b=Mn7JxCPO0FU+BSo/d5t4u4aHqJ5Oxgq/MmZLxB9oPOWzWsnVYdP+tGmT1j8PJHDDN0
         FhwF4BTuZYxvUiwkvu5rqqos6rZT6N5XjNq9wGdP8Pl9GUF2RnZHczyT1/iBcVV34Pki
         cFCiUsptWrqMPYfYQb83OoaPxzVITthbMWCu9QIWlbhrrZyfCHlVHyyM+9CLwiRMPsM1
         xabYHB6lb8UA5LYgO+IjzVCvfLsEljinVDd1c33yMyWfBB3AxT1jOcytXnCIxahPNClE
         gCbOeNrWdaaqKwiEs9FHJZPf4NL9EM73Vw2CdEH2G0ty1JdEV5gpZWNArgXkFyfSERkS
         A7hw==
X-Forwarded-Encrypted: i=1; AL+hErH/GlZFZiEpE98uU5o5NE+7wNirQlEtgQoBqU3Ow0DUcb7oW3PBtNryXuFvVn0h547WUmnXuN5A4Qau3Sc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9PLHlctBMNx9R+vDGus2iuWJb2gZjHqEj7/aGMlyQ6emvnkLmR
	myXbueI0IuF2e3ymdg+AHpoB5tE6TjX72Sa1ts/YibrXotRovTJ6OgcI
X-Gm-Gg: AYBFou2JbgfAIrMgxsS+y7tifFEITaBMfC2cqUngNaryNYylaU7Zd2B7Pdqw3PgUvdk
	KMPwtaW0F4u85bmsXl1CoWXUzjQWR5jH8u31LYTFPCyeFV5W0nY0P6dM0J1VwDyLA1/pd5PW6eI
	dKLIoSse8MZuA7RpIOfPdKKztM4AGKBMW+xti68G69kNxfU8pgW4yQ8w40LWx0zxT8Xyjsz9H5A
	XV0TOSgYTNqY4dXe3p0KTfHVgEq8r/TD7A7XOkCEYGMhM+K+U/jp8UsvhBXTNjV9BU+CErIZ/0P
	g7OVwEhg20gWy/LO9m5bq4cboe5swvjzhvtabul7f+WrDAKq0GO81+RW8m1MfSVtHHvYQrqSns3
	ATzzgh7a9IPcZXIM/ozhCllzSSHYxfaKutgYl2+3lp+X8bdzkxhXw/Zcl/Yl2ls92KPvhJl2jlI
	Q/h3CwrEJ+2VrE0youZ46xqqiA4g/nJH4rKJuFp3lBtcxEaEUbSK1aDDKDS5XtnAIm3rKFeSHni
	vd3Sql2QFDa2Heh1VTa/0rKgFRBKjnPIrjO63yE8kQ59ZFph8FODs3aY10f1qEbZNGTwR9ja/DW
	643dDzYJ9m5wwFdduhwdKL+lH4GezA==
X-Received: by 2002:a05:693c:69d5:b0:369:f961:ccf8 with SMTP id 5a478bee46e88-37686175110mr5574040eec.19.1794459244294;
        Wed, 11 Nov 2026 20:54:04 -0800 (PST)
Received: from eldorado ([2600:8802:b00:1f88::287])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520cfdfc6sm23921585eec.17.2026.11.11.20.53.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 20:53:58 -0800 (PST)
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
Subject: [PATCH net v2 08/12] net: au1000: restore receive filtering before enabling RX
Date: Wed, 11 Nov 2026 20:52:50 -0800
Message-ID: <20261112045301.3669532-9-f.fainelli@gmail.com>
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

MAC initialization overwrites the receive mode, dropping promiscuous and
multicast settings after a watchdog reset without notifying the network
stack. Restore the requested filtering before the control write that
enables RX, avoiding a window with the wrong filter.

Factor receive-mode programming into a helper shared by initialization
and the receive-mode callback. Hold the address-list lock before the
device lock through initialization so the filter snapshot stays current.
Protect callback control-register updates with the device lock as well.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 drivers/net/ethernet/amd/au1000_eth.c | 23 ++++++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/amd/au1000_eth.c b/drivers/net/ethernet/amd/au1000_eth.c
index f127c0184036..67f4899c34a6 100644
--- a/drivers/net/ethernet/amd/au1000_eth.c
+++ b/drivers/net/ethernet/amd/au1000_eth.c
@@ -683,6 +683,8 @@ static const struct ethtool_ops au1000_ethtool_ops = {
 	.set_link_ksettings = phy_ethtool_set_link_ksettings,
 };
 
+static u32 au1000_rx_mode(struct net_device *dev, u32 reg);
+
 /*
  * Initialize the interface.
  *
@@ -704,6 +706,7 @@ static int au1000_init(struct net_device *dev)
 	/* bring the device out of reset */
 	au1000_enable_mac(dev, 1);
 
+	netif_addr_lock_bh(dev);
 	spin_lock_irqsave(&aup->lock, flags);
 
 	writel(0, &aup->mac->control);
@@ -736,11 +739,14 @@ static int au1000_init(struct net_device *dev)
 		control |= MAC_FULL_DUPLEX;
 	}
 
+	control = au1000_rx_mode(dev, control);
+
 	writel(control, &aup->mac->control);
 	writel(0x8100, &aup->mac->vlan1_tag); /* activate vlan support */
 	wmb(); /* drain writebuffer */
 
 	spin_unlock_irqrestore(&aup->lock, flags);
+	netif_addr_unlock_bh(dev);
 	return 0;
 }
 
@@ -1034,13 +1040,12 @@ static void au1000_tx_timeout(struct net_device *dev, unsigned int txqueue)
 	netif_wake_queue(dev);
 }
 
-static void au1000_multicast_list(struct net_device *dev)
+/* Caller holds the address-list lock and aup->lock. */
+static u32 au1000_rx_mode(struct net_device *dev, u32 reg)
 {
 	struct au1000_private *aup = netdev_priv(dev);
-	u32 reg;
 
 	netif_dbg(aup, drv, dev, "%s: flags=%x\n", __func__, dev->flags);
-	reg = readl(&aup->mac->control);
 	if (dev->flags & IFF_PROMISC) {			/* Set promiscuous. */
 		reg |= MAC_PROMISCUOUS;
 	} else if ((dev->flags & IFF_ALLMULTI)  ||
@@ -1061,7 +1066,19 @@ static void au1000_multicast_list(struct net_device *dev)
 		reg &= ~(MAC_PROMISCUOUS | MAC_PASS_ALL_MULTI);
 		reg |= MAC_HASH_MODE;
 	}
+	return reg;
+}
+
+static void au1000_multicast_list(struct net_device *dev)
+{
+	struct au1000_private *aup = netdev_priv(dev);
+	unsigned long flags;
+	u32 reg;
+
+	spin_lock_irqsave(&aup->lock, flags);
+	reg = au1000_rx_mode(dev, readl(&aup->mac->control));
 	writel(reg, &aup->mac->control);
+	spin_unlock_irqrestore(&aup->lock, flags);
 }
 
 static const struct net_device_ops au1000_netdev_ops = {
-- 
2.53.0

