Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F7365540B3
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 13:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790083206; cv=none; b=BW+TPPaJPJrD52RxsZpAMEtPPCx14etj5PtzBK2LnW0iebNc5UepD45ZAqISh9J/nEk22PPdcOxuCdzsSLUwCp52s1gXbduHn6A5GL5Q12zaiVFbbuu0JYrPONCJcDHYTmAlr5UhnGzp3FXDfDZrfrV+9aAvq/4Ry6QGDSdopz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790083206; c=relaxed/simple;
	bh=gsZuiBomw3OKmUFOOZhVWmaCJMauX66p+dFd5DJwGMw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r5FtZ2g7rEKqWPJqPKgZT7lfWGlD21vP8UadJPNfL2VqGO5hZgMWWLeoVTxuU56dX/pUAu9srbV4qowk8LoTCI82ypBuklQcZQxKClm7Dm4yoK23VxaNfX8JTAUtV9s0VMq/IrrMXlM9sb45Auzv2uWIUzIxy4trQ7MrCPrvS6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la; spf=pass smtp.mailfrom=lex.la; dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b=SYyPRLPA; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lex.la
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b="SYyPRLPA"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f6350faaso2282020f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 06:20:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lex.la; s=google; t=1790083202; x=1790688002; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WM/b3m0dUk2cSRvU8lTJOAFjkhu3257/FQCic/mBT/0=;
        b=SYyPRLPAYd52HJR/59Bsd8Q39z4geiy+V/3vca1I/EX5gZ4GhHOO/7A8R4GNJFFcvf
         +MRvLrZ6xYpYmU/h8ODjRPKyZ4BxwktgpmWGfb5AfwunEERYW5aPqVCw9AdwIoq46t8W
         TryDakjsOnmZOP8357uaUtt+zmKYN6gkiuhkUcHChRXG30FzJ3XrcA/imQgFlVFlKNTN
         ds2nNyycuLsyS2dBkDbAYYHGf8aHAF8doTcj/2dmbYGmJFbh8le/z6oAM+oD7mhn6G+4
         TmNUv54ynW4bqG7JapZMwtOJncVmymy08HLU+lv2Sgt0JXKVaZWCAvl591S+BHXubDhQ
         NfKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790083202; x=1790688002;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WM/b3m0dUk2cSRvU8lTJOAFjkhu3257/FQCic/mBT/0=;
        b=v97BgV6cUiC2S10S0Wigu0OOWgBy6TCR0V14qUPCK3LHvCvdMGhGL/oVGaH/9w5LU6
         TFScQEC2GufwDuK2RAlyNF5CtKGHIbuLg1t4s+6AOvQ0nBC2KJPIIRfj2GDWAVgE8GLQ
         99ilxx01kGJLeR5q6QNOpSG0e2qm0v0KL905QPzZChvAAIVPywy5iTSM6KfrkWtxwr6I
         Lv5nw5/ie7c2+XeVfSLWs4l/4BxVWTY8UsvcglXuqfLExCHE4sY7nk8A1n/6vXcn16SR
         Ddce5ioxxHiPooWlkLFVNDtd8fjw55dbXBnln2Kn0q6koL09/YS0RagroKSdYvMbKTrc
         1qWA==
X-Forwarded-Encrypted: i=1; AKwUvBz7dz/BZBJQ9r8i8DKGpMeCcQ0viVoO/fz9EBf6TDkmMP/aItaKVDby0YZ261EHlYuFOt62yXr/0fZqo70=@vger.kernel.org
X-Gm-Message-State: AFuF++kobW2uz05RPugNmsVU+YAVoQA55hA+4sIpSUQTTB+oo6/T5AWb
	DQuHr+McQ4P9gKefDbGDdd9otadkanPczfufXtRgRmVKC1RuIJ1N2ImO6NOhILFlheA=
X-Gm-Gg: AYBFou3mpnXJvnTUuPBiSM3/3ZUcJ7prWkgef7eaJYN0chwaj8Kt8ZTktRcZIFEF5PE
	hIqT2pIpVho4gxjXAnBV1Wv4K4kEj7CsXWq0c3wR3MkBon+Jv7up+T0lZLjo0NKQSjnDmmD3Yav
	xsMRCLpSH7fUy1zoWXGPErXPdw/rrud+Vl+zSkjed/Kh9fAT3Aw/Evs8pIct0InxX04PX7t/jQh
	QaAbwHaUpM0ztpz2kAfj/BNoYYFNwB7d7XijSNGZTCxOalh/9rbgtA5OcFq/+7ZKAopLfch4HwL
	ynNKf0+HeyGK4nVDyKZSkWb8V5tSHPigHgqX/LoFn0z50VmL+1d5pMV6oZ4oJbX+1STeFcNr76H
	Wu3IlnEuj/7p/1HmrUfFcSC4eKUhqtXM5NBM/bHbOPgOZu9R44uBvIeXxm0C96dLCbZNdu+ve9U
	NjT7voeiHfEUOKUAEItk61zMBG0abb7+pAPd49NOz3D1eYneKtrg==
X-Received: by 2002:a05:6000:2409:b0:487:489:7af1 with SMTP id ffacd0b85a97d-4871e3645a7mr23836578f8f.48.1790083202495;
        Tue, 22 Sep 2026 06:20:02 -0700 (PDT)
Received: from remote-01 ([84.17.55.230])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-488627929a4sm4085220f8f.35.2026.09.22.06.20.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 06:20:02 -0700 (PDT)
From: Aleksei Sviridkin <f@lex.la>
To: netdev@vger.kernel.org
Cc: andrew@lunn.ch,
	andrew+netdev@lunn.ch,
	hkallweit1@gmail.com,
	linux@armlinux.org.uk,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	olteanv@gmail.com,
	Thangaraj.S@microchip.com,
	UNGLinuxDriver@microchip.com,
	steve.glendinning@shawell.net,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aleksei Sviridkin <f@lex.la>
Subject: [PATCH net v10 1/4] net: usb: lan78xx: register the PHY interrupt with the MDIO bus
Date: Tue, 22 Sep 2026 16:19:52 +0300
Message-ID: <20260922131955.4175785-2-f@lex.la>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260922131955.4175785-1-f@lex.la>
References: <20260922131955.4175785-1-f@lex.la>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The interrupt this driver maps for its PHY is written only into
phydev->irq, while the bus table mdiobus->irq[] keeps reading PHY_POLL
for the same address. That table is where phylib records what the bus
described - phy_device_create() seeds phydev->irq from it - so the
number lives only as long as nothing else writes that one field.

Put it in the table before the bus is registered, so that the PHY the
scan creates is born with the number, and drop the write to phydev->irq
that phylib then makes by itself. Fill the whole table rather than one
entry: for 7801 the address is not known until the scan, and for the
other two phy_mask leaves only address 1 readable, so a loop costs less
than a second switch on the chip id. A devicetree PHY node still
overrides that.

Found going through the drivers that keep a PHY interrupt outside the
bus table, so that the restore on detach later in this series has a
number to hand back here as well.

Assisted-by: LLM
Signed-off-by: Aleksei Sviridkin <f@lex.la>
---

Notes:
    Compile-tested only; I have no LAN78xx device.
    
    No Fixes: tag on this one. On its own it fixes nothing - nothing reads the
    bus table back until patch 3 - which is also why it sorts ahead of that
    patch rather than after it.
    
    lan78xx_setup_irq_domain() runs before lan78xx_mdio_init() in
    lan78xx_bind(), so the number is already mapped where the table is filled.
    The fill covers the whole table because only the 7801 case leaves the
    address open until of_mdiobus_register() has scanned; 7800 and 7850 set
    phy_mask a few lines above, so every entry but address 1 is unreachable
    and writing them costs nothing.
    
    The fill is a default rather than an override. For a PHY node that
    describes an interrupt, fwnode_mdiobus_phy_device_register() writes the
    devicetree number over the table entry, and into phydev->irq, once the
    device exists. That inverts the old order, where the driver's own number
    was written last and won. Neither in-tree lan78xx PHY node carries an
    interrupts property, so nothing in tree changes, but a devicetree that
    described one would now be believed.
    
    Teardown order keeps the number live for as long as it is read:
    lan78xx_disconnect() detaches the PHY through phylink_disconnect_phy(), and
    lan78xx_unbind() calls lan78xx_remove_irq_domain() only afterwards.

 drivers/net/usb/lan78xx.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/net/usb/lan78xx.c b/drivers/net/usb/lan78xx.c
index cb782d81d84f..d7472d894c8d 100644
--- a/drivers/net/usb/lan78xx.c
+++ b/drivers/net/usb/lan78xx.c
@@ -2092,6 +2092,7 @@ static int lan78xx_mdio_init(struct lan78xx_net *dev)
 {
 	struct device_node *node;
 	int ret;
+	int i;
 
 	dev->mdiobus = mdiobus_alloc();
 	if (!dev->mdiobus) {
@@ -2118,6 +2119,10 @@ static int lan78xx_mdio_init(struct lan78xx_net *dev)
 		break;
 	}
 
+	if (dev->domain_data.phyirq > 0)
+		for (i = 0; i < PHY_MAX_ADDR; i++)
+			dev->mdiobus->irq[i] = dev->domain_data.phyirq;
+
 	node = of_get_child_by_name(dev->udev->dev.of_node, "mdio");
 	ret = of_mdiobus_register(dev->mdiobus, node);
 	of_node_put(node);
@@ -2892,13 +2897,6 @@ static int lan78xx_phy_init(struct lan78xx_net *dev)
 		return 0;
 	}
 
-	/* if phyirq is not set, use polling mode in phylib */
-	if (dev->domain_data.phyirq > 0)
-		phydev->irq = dev->domain_data.phyirq;
-	else
-		phydev->irq = PHY_POLL;
-	netdev_dbg(dev->net, "phydev->irq = %d\n", phydev->irq);
-
 	ret = phylink_connect_phy(dev->phylink, phydev);
 	if (ret) {
 		netdev_err(dev->net, "can't attach PHY to %s, error %pe\n",
-- 
2.53.0

