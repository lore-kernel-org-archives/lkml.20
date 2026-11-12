Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794459215;
	b=viNwchJxTVv6i0HrNHE3DR7F0tSKs8ux5nP5qBm/o48/nD8EPYDdejsDWN46Ufwr2Fla
	 7gVC/IdI07kPY+uHFNYUXvLRlBRZ8h9Xd7VEssZ1bRKvm6fcCGByxEEeFZkmjDYoj8lj1
	 ghGwbzB18plxd8h8j/eugaTeEiNAMn++3/5ZlO9OgHgHpSwjSEWX8C6wVYMkj8RTAbwDP
	 HLFyCpgGr31mbnn2dh5VfxzALPhWCjNLil6GE3yFLQNINqzybBzeOi+eW1vWd4alKn0s6
	 2YHsrWhvbGjzHMtp0H1MZBmzqiraF+ZiuQC5fKcTWqJwfi3zGJztXLS/qZZ7ZWKVjyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794459215;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=jFIH548lIGR831rTuuZKYy9OsQLDm4lptzmx0LF/Teo=;
	b=aDqMLS5CRqw/NmOe7f7YdFwtOlKeL3ZRfny3qQRv5h2ZqIde0PHZ83SZDQOSSvbMu1b6
	 00t+rgF5X2GIEtniZq03dhcxib25ARjcfRsb1TfjtmjwirRFUK1vIU6FBjncdYZU2oucG
	 YRaCU7DSFwflsEwC/wPgzWb1x3V8IfOQsLC24QpV8DGd2kF6jxBBZT3vz/+fMqS6FdfaF
	 JRR/+KbXRnTOFluJQghM4DwEnhyY7CrY3CRmZvZNbEvJmEVIIiAqCBt6bp9n5d2laxsnb
	 gJxVxUx0alU/K+lqDQZ14HfckoHL/WQQIM0mAk/lmZFZDfa3Xjr7B1Ok64M1rD5C3Xg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NIQGBmX+;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E98D606A324
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 04:53:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E98D606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NIQGBmX+
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso8192271eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 20:53:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794459214; x=1795064014; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jFIH548lIGR831rTuuZKYy9OsQLDm4lptzmx0LF/Teo=;
        b=NIQGBmX+gB/td2jTgeQJHS0l1U0N/7qJuZlSzsKPGmZCC+pLoqfGjKXBa+PU9VNzd5
         T1yQ47rp63xSNQ934qqBgiakvDT+bzaORp5BUpEq8gUz1JrL0guNlq81FgmVNPJb8DLY
         FIqWful2hr41vzOOOpoO/urDxhfD2YbEcEW4e7JNxC34f4RaxWgXB4xpYAKVMd1CBCgL
         IMH5sOaVzmXAd5V8QVe8wqfOIQ7KGm62bPrWyDtcUaPZN0wmqYw+FNC6S6Y9Y/R2+Fxr
         rwpW/+x4C116FN0mPtG7B5zzkklM8rHdh4BB3jfGmWrltm1fvd2uxtkV++S+4qVnHwZL
         /k5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794459214; x=1795064014;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jFIH548lIGR831rTuuZKYy9OsQLDm4lptzmx0LF/Teo=;
        b=M0PRcuH9um3/rqKA5FmzfiA3Ox9QPKP0EkvRm4kDhkD7H6onkjXpyiEN4B+v+dldsu
         PiXtKsfmJiJs4PLT38jPVyQ7or75r7Qti5KIWxKoOQnY8pHVYeGfTNYbGZd+4oTWYVPL
         hiMtgKY2ImsN6ZML4TmCZAnKv0kAE7MaBKFfvYe4TiW1hrMiqSgZ8Nefq9rzW7Xcm+73
         InDBypcFQcznP+A3n9ldiFZz6c1Sa0ctPG58HJI+As14z6sTb0Sc3EIb8zeeCbypNsNp
         ejKbPsAbXDCiM1p/3qkOhjTrWgwTGxPKuSI2xSKMkITns9YLr0244eNT855vQTWjzisJ
         u+Ag==
X-Forwarded-Encrypted: i=1; AL+hErFuCeiAgAoryqRTBLWBwX93g4VmaA7rrBtB6NZltmn5LbmkO0WsUhdJibPHIm5JuBblyuc/wOLbamZ342s=@vger.kernel.org
X-Gm-Message-State: APuU4Z8hpQf4A1i6Iboc6DP6gNaxbICU0RQl5pfz0wB/6WQ886uYo6tx
	CKjMRMt0FCdwrHDHu65AuRTSeKUY0yr/ARQBNg5PNa+nr3DJCkYog3oL
X-Gm-Gg: AYBFou2oZF495cOKsByNVnxgfGpPc+3PyDHxGD9z+c4MZgH7eMRfJKDmhfB4uQIzQ+n
	LSLEj9FITQ70yXq9Cvg+3ix821jmOr/9juEGJ/pc5XsEkZE5vuS20ad50MCrucn2fjfFppZv0bn
	SXVOJNbdKBLIprxKCTUIQFompMDlY5GVenCl7l8KDVp7YxOTw5NPJXoBVhTYK5t1BV1dRMHoU3P
	s8Ld+fsnuSHePaQnMseFElztbfuntb0VEKf2gGErfr78VjOIpF6Co1korGwGJ1gJa869936V1dG
	P9XYWvTuivhPMdc+2jQqd9N5ywXJb6uU+Qy9m7Xhdr+uo4glnrLTvWuZtofcyhnUfCZiSlccROX
	rqu21lkqluwbam6B9lLLJx1wyq13+WDeHYluM7ri391OA5Kc+1WUzf2KtLtHvzj/kCnsUAyT7BI
	z583SCj4EU+NmNiRTtpEFTxyecX3m6bsIsyTQDUztIpo7HA7mCGmThF7m1Bg8waZbc9jsg/Ugze
	WU8LB7RMtsnSd2g3LZAo+nt+NXzFGk8JzgDI9FMhTBkkMIIYXfRmgIuLPBS+snNmVuLPpKggsNh
	kvfaCk06
X-Received: by 2002:a05:693c:8947:10b0:36f:14ef:ad08 with SMTP id 5a478bee46e88-376850ced2cmr4362199eec.9.1794459214221;
        Wed, 11 Nov 2026 20:53:34 -0800 (PST)
Received: from eldorado ([2600:8802:b00:1f88::287])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520cfdfc6sm23921585eec.17.2026.11.11.20.53.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 20:53:30 -0800 (PST)
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
Subject: [PATCH net v2 03/12] net: au1000: disconnect the PHY before freeing the MDIO bus
Date: Wed, 11 Nov 2026 20:52:45 -0800
Message-ID: <20261112045301.3669532-4-f.fainelli@gmail.com>
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

Balance phy_connect() on probe failure and removal. Otherwise PHY
interrupts, device references and the attachment to the freed netdev
survive teardown. Disconnect before unregistering the bus while its MDIO
callbacks and MAC registers remain usable.

PHY teardown can re-enable the MAC for MDIO even if the interface was
never opened. Reset the MAC after PHY and MDIO bus teardown, before
releasing descriptors and register mappings. Skip MAC control accesses
when mac_enabled is clear, since stopping an already clock-gated MAC
hangs MTX-1. Always clear the DMA descriptor control bits and TX state.

The teardown corrections were identified by Sashiko AI review and
hardware testing, with OpenAI Codex assisting implementation, validation
and commit-message consolidation. Previously validated on MTX-1 with
opened and never-opened removal, rebind and traffic; both removal cases
left the MAC enable register at zero. MIPS build and extracted-function
ASan/UBSan checks passed before this series was consolidated.

Fixes: 0638dec01e89 ("[PATCH] net: au1000_eth: PHY framework conversion")
Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 drivers/net/ethernet/amd/au1000_eth.c | 26 +++++++++++++++++---------
 1 file changed, 17 insertions(+), 9 deletions(-)

diff --git a/drivers/net/ethernet/amd/au1000_eth.c b/drivers/net/ethernet/amd/au1000_eth.c
index 58bc8e1b539d..7063f9e5bc7c 100644
--- a/drivers/net/ethernet/amd/au1000_eth.c
+++ b/drivers/net/ethernet/amd/au1000_eth.c
@@ -584,14 +584,17 @@ static void au1000_reset_mac_unlocked(struct net_device *dev)
 	struct au1000_private *const aup = netdev_priv(dev);
 	int i;
 
-	au1000_hard_stop(dev);
+	if (aup->mac_enabled) {
+		au1000_hard_stop(dev);
 
-	writel(MAC_EN_CLOCK_ENABLE, aup->enable);
-	wmb(); /* drain writebuffer */
-	mdelay(2);
-	writel(0, aup->enable);
-	wmb(); /* drain writebuffer */
-	mdelay(2);
+		writel(MAC_EN_CLOCK_ENABLE, aup->enable);
+		wmb(); /* drain writebuffer */
+		mdelay(2);
+		writel(0, aup->enable);
+		wmb(); /* drain writebuffer */
+		mdelay(2);
+		aup->mac_enabled = 0;
+	}
 
 	aup->tx_full = 0;
 	for (i = 0; i < NUM_RX_DMA; i++) {
@@ -603,8 +606,6 @@ static void au1000_reset_mac_unlocked(struct net_device *dev)
 		aup->tx_dma_ring[i]->buff_stat &= ~0xf;
 	}
 
-	aup->mac_enabled = 0;
-
 }
 
 static void au1000_reset_mac(struct net_device *dev)
@@ -1287,6 +1288,8 @@ static int au1000_probe(struct platform_device *pdev)
 	return 0;
 
 err_out:
+	if (dev->phydev)
+		phy_disconnect(dev->phydev);
 	if (aup->mii_bus)
 		mdiobus_unregister(aup->mii_bus);
 
@@ -1334,9 +1337,14 @@ static void au1000_remove(struct platform_device *pdev)
 	struct resource *base, *macen;
 
 	unregister_netdev(dev);
+	if (dev->phydev)
+		phy_disconnect(dev->phydev);
 	mdiobus_unregister(aup->mii_bus);
 	mdiobus_free(aup->mii_bus);
 
+	/* PHY teardown may have re-enabled the MAC for MDIO accesses. */
+	au1000_reset_mac(dev);
+
 	for (i = 0; i < NUM_RX_DMA; i++)
 		if (aup->rx_db_inuse[i])
 			au1000_ReleaseDB(aup, aup->rx_db_inuse[i]);
-- 
2.53.0

