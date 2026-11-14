Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=23.88.97.239
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794653485;
	b=Z1NZ7G+Kj0yNSo0OB5545a6U77Dne0KM1IWYI1Z5OCGAmfxHKkkkbO1tXZprRK66xwEH
	 BcepKUQB6TIKIUTUIVgDOTVq4ku03ygfnFXM8gffcipeW3dbQz2Tcwh6oO+LmoxdRmiDT
	 ic0mCXbpV/LBFAaDrzllxjeRUdl8Tkm6AcOb7uQ1bAg69N17cwaQymH9ss6gGrimCjoHh
	 oSulM+BvdtsMhwDBowLbUI8z2c+V6aPT5JVkc7R/gDgGExC2bnnosBAhR6t6JTarJGtXU
	 MhbN5HdYm5AYWBsF6Y5RF1XBqt95AEe7eWD17q6w0RfMcYFyTlNp5FtG/H/3g9TRJRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794653485;
	h=DMARC-Filter:DKIM-Signature:Received:X-Spam-Checker-Version:
	 X-Spam-Level:X-Spam-Status:DKIM-Signature:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=Y0vnFLr9NVdVzAcxH7hDdXAlz1LVb2KF39oLRi1FjHU=;
	b=u9EKpG3HsEIua+vILy4I3434V7d5hFFQwvBrmXJtP/0eC91IBmiUG7A3mUyImg75lyl9
	 YFo6IpXlxs5pmg+mmLogxNmDXdCMmY3VjS8IEYaNmahhNVwfPng/YD0iLkEtMG+5u00SO
	 IqK/YZXGO4akAaRGgwP2c1X2uYRxuB2LPeHAAsyvnAmpDLqayEjaeGQJPDMhNXeLh9EHh
	 tymHm30YxjSawFZ7oxvcqGHbCn4EOR0tZMilkePgiljzov3f8EcccpzciYkjy1SKAvxhL
	 V0raV7kmLltGpbrSH/sPfl2Aej+5J1w1NnrmkacjVQDcGIn9xLieqk9ChjcHxRboeFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=birger-koblitz.de;
	spf=pass smtp.mailfrom=birger-koblitz.de;
	dkim=pass header.d=birger-koblitz.de header.i=@birger-koblitz.de header.a=rsa-sha256 header.s=default header.b=R64ssnlf;
	dkim=pass header.d=birger-koblitz.de header.i=@birger-koblitz.de header.a=rsa-sha256 header.s=default header.b=yENP5C8P;
	arc=none smtp.remote-ip=23.88.97.239
Received: from bkemail.birger-koblitz.de (bkemail.birger-koblitz.de [23.88.97.239])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89A0C606A327;
	Sat, 14 Nov 2026 10:51:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89A0C606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=birger-koblitz.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=birger-koblitz.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=birger-koblitz.de header.i=@birger-koblitz.de header.a=rsa-sha256 header.s=default header.b=R64ssnlf;
	dkim=pass (2048-bit key) header.d=birger-koblitz.de header.i=@birger-koblitz.de header.a=rsa-sha256 header.s=default header.b=yENP5C8P
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=birger-koblitz.de;
	s=default; t=1794653483;
	bh=JHVpqIHEQYTtPTCqBi7V+tKlbN727X4Zp5oF81OHkIc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=R64ssnlfOsgMUc4cJAVZwqb1hC1TkGg04eRbOzaxABREZQGNbvF/QnA7vPHr4Z65B
	 xGUOKhhwkMe7L2nFCLKpzoMa45vkeS7KlaFsf7uPa6CLvxo4TGZQNcgB5eMyRYklSb
	 J9zbnQRqSPHqwwIuNnWcMmwfgZsRUW7edNx0r4jV7PzgMy94I/CZD/wm+X4Byl2oKM
	 blBR4HllTu47+x7ToepPeSlyBKddy9w8nrVoOKrUaOYR5KqLOLCN4w/izzatin4eXQ
	 Gu0zXS5zyGuflANe7G75nXdYSJAm/JBcnYGzGtWEJk+hqmReBJ0MkoNY/eeFHpYIPY
	 YfMhywWVqPeWQ==
Received: by bkemail.birger-koblitz.de (Postfix, from userid 109)
	id 10D9C489E0; Sat, 14 Nov 2026 10:51:23 +0000 (UTC)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=birger-koblitz.de;
	s=default; t=1794653480;
	bh=JHVpqIHEQYTtPTCqBi7V+tKlbN727X4Zp5oF81OHkIc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=yENP5C8PjgRfWVvlBQoPY6dDhbbnnQotjxPUJWk95AUCL5W+qRATpiul8srtUeJOq
	 EoNp4wVHOTU8NIcWnBdSfJEtsHoKPHnUS492Bv2CuaYCqbLg7S1rSgdjL2PaKTbibY
	 KMa8FMLDY2Tix4eJjRrUUbD0CCsm8qA9DfwvGfH+d+o5hki50zXvb/goDHaQ38duYN
	 VZsuKL/fFISCjTyyx0BoSDrErOaVl3hz3TakzmYzgelhBkB8tEplmOv/g+5VTYLuLJ
	 FTwv+fX6SY6wUVDQmkItGgRJduTezH8aro4unjLG76Isdoq2/u4ZsvWzv/BANGmaPm
	 3Lly/G+qpireA==
Received: from AMDDesktop.lan (unknown [IPv6:2a00:6020:47a3:e800:271c:c6c5:9fde:77cb])
	by bkemail.birger-koblitz.de (Postfix) with ESMTPSA id DCFD6489AA;
	Sat, 14 Nov 2026 10:51:19 +0000 (UTC)
From: Birger Koblitz <mail@birger-koblitz.de>
Date: Sat, 14 Nov 2026 11:50:57 +0100
Subject: [PATCH net-next v21 01/13] phylink: Add phylink_mac_interrupt
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
Message-Id: <20261114-ax88179a-v21-1-c2d34410bcbe@birger-koblitz.de>
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
 Birger Koblitz <mail@birger-koblitz.de>, Nicolai Buchwitz <nb@tipi-net.de>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>
X-Mailer: b4 0.14.2

Add the phylink_mac_interrupt() function to phylink, which
passes a link-change interrupt received by the MAC to phylib.
This function can be used by drivers which want to avoid
polling the PHY and instead rely on an interrupt received by
the MAC when a link-change happens.

Signed-off-by: Birger Koblitz <mail@birger-koblitz.de>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Reviewed-by: Nicolai Buchwitz <nb@tipi-net.de>
Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 drivers/net/phy/phylink.c | 20 ++++++++++++++++++++
 include/linux/phylink.h   |  1 +
 2 files changed, 21 insertions(+)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index e885da1c28311a12a869e29ceb3c96886f31adc6..a87eaa2f3db5bef8fe56e12b90375bdb7f9c52e7 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -1616,6 +1616,26 @@ static bool phylink_link_is_up(struct phylink *pl)
 	return pl->netdev ? netif_carrier_ok(pl->netdev) : pl->old_link_state;
 }
 
+/**
+ * phylink_mac_interrupt() - wrapper for phy_mac_interrupt()
+ * @pl: a pointer to a &struct phylink returned from phylink_create()
+ *
+ * Passes a link-change interrupt received by the MAC to phylib.
+ * This function may be called in interrupt context, and therefore cannot take
+ * a mutex. However, it is safe to assume that the reference to phy does not
+ * disappear during the call, as only an SFP module may be unplugged to make a
+ * PHY disappear. SFP modules however do not support interrupts.
+ */
+void phylink_mac_interrupt(struct phylink *pl)
+{
+	struct phy_device *phy;
+
+	phy = pl->phydev;
+	if (phy)
+		phy_mac_interrupt(phy);
+}
+EXPORT_SYMBOL_GPL(phylink_mac_interrupt);
+
 static void phylink_resolve(struct work_struct *w)
 {
 	struct phylink *pl = container_of(w, struct phylink, resolve);
diff --git a/include/linux/phylink.h b/include/linux/phylink.h
index 3a88a69882a610afb868b55df6f6e77aea918649..a7b6294cc4a075bd2aaa43ed6484de17a6cb88b1 100644
--- a/include/linux/phylink.h
+++ b/include/linux/phylink.h
@@ -768,6 +768,7 @@ int phylink_ethtool_set_eee(struct phylink *link, struct ethtool_keee *eee);
 int phylink_mii_ioctl(struct phylink *, struct ifreq *, int);
 int phylink_speed_down(struct phylink *pl, bool sync);
 int phylink_speed_up(struct phylink *pl);
+void phylink_mac_interrupt(struct phylink *pl);
 
 #define phylink_zero(bm) \
 	bitmap_zero(bm, __ETHTOOL_LINK_MODE_MASK_NBITS)

-- 
2.47.3

