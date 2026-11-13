Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.227
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794604589;
	b=kD0rFvU8RfQ/zsO6J26pN8p++Bv3xyTF8wcOnl/OkzH3kWX2cepV83AlSK6We1IG0Dvz
	 O55aUew6ktVuTu+geVZrY9jvu+Rvr2yfWqT04TyN87czikqQ8jLKoLwMj8is0aRzT2Qy8
	 86l+AmLz1PlTr2JHGoAejEH8I7bSBS/XD2Q6Q/W+EDATsMRm1oSSRaiOm/MfN6ggYcK4o
	 g57ugtjkC8dC5K+DjnO9DSYnxC3e+wbRdzt5AnL0I+7P19ieP/KIjDycJIDDGPyyY3PmL
	 /dqt0j9A/N1S/42eaGp9bCxTY8jk/QU543A2+n2Y0kTsqzSH8q1i95kywGYWi2SWo2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794604589;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=PHTsOiFba6ZWwfEsqFlRZuTGWy47A40bsf3ARVLRXhQ=;
	b=HMDcH3zgdO4jfxHaKwst/9ej1+JMHN95jlWy9QxJO6IVgHyxJIYq7UL3/2I54wXNLtD5
	 fn82jXXX0y3uL4xVTYLQOYAZMHWDGN8VC0OYd1iatHW12X76CihnuE1kh8OnqwrgHYAn/
	 xpqSTfCliVxJOim+QHwaOwZUOvihCm31kcgBzA3W8P3YnqiunPGIuLQyBQgdjkQK8bp8k
	 8dSNyG3H6jOnHUeC1mQDUSkUDctn1YpJXPfA6+cHtXY4OSyfvq8/S4Pp2t5OUv/oCw+a8
	 OD9w86IdsuERzME3Thl40oV+4cTkE4Id+wrE3BoWgmdZeKCG6K0AnTCY9se4ah2TeTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=LO2cRfgN;
	arc=none smtp.remote-ip=209.85.210.227
Received: from mail-pf1-f227.google.com (mail-pf1-f227.google.com [209.85.210.227])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E86AA606A8AE
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 21:16:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E86AA606A8AE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=LO2cRfgN
Received: by mail-pf1-f227.google.com with SMTP id d2e1a72fcca58-8b3577deeb0so724693b3a.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 13:16:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794604587; x=1795209387;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PHTsOiFba6ZWwfEsqFlRZuTGWy47A40bsf3ARVLRXhQ=;
        b=tAGMArDBQxyHXxxoi97hFBGqpoOyJgbzC0d2nuqr7H1EeiRVPXz4x7Ij1c47wjO11M
         Q+2JrEyE9rb9Jiy9ORX9Fv7F5aV89xpQuDgeXHLmUNoeBgI+VV8lIyMOhjqfMt4UNxkk
         Wp2mqaf+Q/RvHMbiJTMEK9BrBU91en2EEjZwy43L/y806SFCea6H4HMIeSVv4glVmxRb
         aXx3knS9LghFPWUcHKVu9AEDu98F+mviOmhyb19DYefSzuJvHMUhKkZTdLk2O4qxk3fC
         dtnNZ6Lg5mYXerEiSO0/1VxRDFARJzxk76Vw87XrQdu9fCue3Ivs1DEi/9ulFrKfg0Xe
         TeyA==
X-Forwarded-Encrypted: i=1; AL+hErFSKXb801GE6Pj0LMAYVbZPDmib52Tf1QhRzRHeu8lR8gFbGIDfXnh85ifdEuLJr0tG7SzPkC5VCcdkZS4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8iw+4Dy026DIqeyVcHiGgfw3xcVcaBZ32O07gnD1fYDzHmyxYN
	d+aWutPghWTKlDwh8TmjEfamS9N0uwut8WpnAKye1aeCx8si6lRCM+7dOHruipZvb/G2XaypIvG
	4gISUhJ7JubeDz8N4468Odr8txfiBtJeIlYFHAkOAGcFUFo8eAKf3SY1cy+b3DwLizF0P9LPoKY
	mxODUfYE1pcYiN5/vhTUYSdY7bEJkdueCeO4WIlBY7ZCFhNMjttZOfsXhUUuFy6Pb4TQvTKgkk7
	EYvZ3AzW3ufKnwLYA627Kuh
X-Gm-Gg: AYBFou18vneDljp50uVWDtXIDvnLL0tdiABaIoktrJstv9Fj8nCG3FrdgRhPgkqm//E
	HCGLI8dG9HR036gWQg8MbKIDKbjtBwkYCyRCkOOTDvBPF/T1HPO/3ZJ39vDRrsL5xv7f0VJWvDp
	+MeqaXNM6X9Xy+TVgrsK0EhiPqZ6ygQ3FHUi/l9a7Ad3B5mkmupAggakIdbqsQaZlY3EmGXzKlQ
	fnwpDyyXFnVX+HNWAYDt/qQwuA+crB1DhG8A7XHHoWm22ypX0Hljy8vA3HKSS6vLgv9o2NfLw8T
	uiwysAo1hHQHLAzyxiGP64fcAdl5gV8KCAr2LYBjnWCb0wCtqQcWVSX/PmcqSeWnYz4Xp0rd/tL
	QLYVfmjAmhwqM8hrM8LgE6LgCZYqowf7GkXtsPg6kfGz1Bspiaxkjql29BidumSf65XZZBIiwFK
	xr7WWDG7mXprDmHTJeRV/hDfnzdO/etYWvj1jZx1j7DDY=
X-Received: by 2002:a17:90b:993:b0:3b0:e2a9:3466 with SMTP id 98e67ed59e1d1-3b1b09fa555mr2341481a91.16.1794604587218;
        Fri, 13 Nov 2026 13:16:27 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-123.dlp.protect.broadcom.com. [144.49.247.123])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b1b63e7242sm1163020a91.4.2026.11.13.13.16.26
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Nov 2026 13:16:27 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91f03ea17f4so32955126d6.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 13:16:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794604586; x=1795209386; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PHTsOiFba6ZWwfEsqFlRZuTGWy47A40bsf3ARVLRXhQ=;
        b=LO2cRfgNagUTWjZSHehygXGp8qyYvwxgy17UBqHpdn4tKpszLg+YuHj7pFg+pL/HKz
         3lqdJPWxQb4nfaz+AuBD+EGAVPlO/yKPtQulzv3gofhWW4va3/WGP5qdxUPwG3xuJzqI
         3qO/++fIkOC7uICtKODN0dpgu6xQy6ESiayxk=
X-Forwarded-Encrypted: i=1; AL+hErF7dtzoLChtigWycDeAuG1awJ4AXN5AXID4yWH0fTtS1GFa0+nN403YOginDj2XJ6s+8BMcratxN7sXw78=@vger.kernel.org
X-Received: by 2002:a05:620a:260d:b0:93e:c12c:9dd0 with SMTP id af79cd13be357-9494bcc0b81mr694607085a.80.1794604585743;
        Fri, 13 Nov 2026 13:16:25 -0800 (PST)
X-Received: by 2002:a05:620a:260d:b0:93e:c12c:9dd0 with SMTP id af79cd13be357-9494bcc0b81mr694600985a.80.1794604585130;
        Fri, 13 Nov 2026 13:16:25 -0800 (PST)
Received: from stbirv-lnx-1.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9494c8f92bbsm273474385a.40.2026.11.13.13.16.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 13:16:23 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: netdev@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Carlos Soto <carlos.soto@broadcom.com>,
	Justin Chen <justin.chen@broadcom.com>,
	Doug Berger <opendmb@gmail.com>,
	Nicolai Buchwitz <nb@tipi-net.de>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org (open list),
	Mlody12 mlody12 <kudzo51@gmail.com>
Subject: [PATCH net-next 3/3] net: mdio: mdio-bcm-unimac: Add Clause 45 support
Date: Fri, 13 Nov 2026 13:15:54 -0800
Message-Id: <20261113211554.2058181-4-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261113211554.2058181-1-florian.fainelli@broadcom.com>
References: <20261113211554.2058181-1-florian.fainelli@broadcom.com>
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
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

Add Clause 45 read/write support to the UniMAC MDIO bus controller driver
by implementing the read_c45/write_c45 bus callbacks. Each access performs
the two-step C45 sequence (ADDR cycle followed by a READ/WRITE cycle) under
the bus lock and switches MDIO_CFG between C22 and C45 mode as needed;
MDIO_CFG is only written when the mode actually changes.

Also skip the BMSR workaround read in unimac_mdio_reset() for children
compatible with "ethernet-phy-ieee802.3-c45", since such PHYs are not
expected to respond to C22 accesses.

Note that providing read_c45/write_c45 also makes the MDIO core scan for
C45 PHYs at registration time, on addresses that are not masked and do not
already have a C22 device.

Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
Co-developed-by: Carlos Soto <carlos.soto@broadcom.com>
Signed-off-by: Carlos Soto <carlos.soto@broadcom.com>
Co-developed-by: Justin Chen <justin.chen@broadcom.com>
Signed-off-by: Justin Chen <justin.chen@broadcom.com>
---
 drivers/net/mdio/mdio-bcm-unimac.c | 105 +++++++++++++++++++++++++++--
 1 file changed, 98 insertions(+), 7 deletions(-)

diff --git a/drivers/net/mdio/mdio-bcm-unimac.c b/drivers/net/mdio/mdio-bcm-unimac.c
index 15a9880c3573..25f54ee754f9 100644
--- a/drivers/net/mdio/mdio-bcm-unimac.c
+++ b/drivers/net/mdio/mdio-bcm-unimac.c
@@ -24,10 +24,16 @@
 #define  MDIO_OP_SHIFT		26
 #define  MDIO_RD_C22		(2 << MDIO_OP_SHIFT)
 #define  MDIO_WR_C22		(1 << MDIO_OP_SHIFT)
+#define  MDIO_ADDR_C45		(0 << MDIO_OP_SHIFT)
+#define  MDIO_WR_C45		(1 << MDIO_OP_SHIFT)
+#define  MDIO_RD_C45		(3 << MDIO_OP_SHIFT)
 #define  MDIO_PMD_SHIFT		21
 #define  MDIO_PMD_MASK		0x1F
 #define  MDIO_REG_SHIFT		16
 #define  MDIO_REG_MASK		0x1F
+#define  MDIO_DEVAD_SHIFT	16
+#define  MDIO_DEVAD_MASK	GENMASK(20, 16)
+#define  MDIO_C45_REG_MASK	GENMASK(15, 0)
 
 #define MDIO_CFG		0x04
 #define  MDIO_C22		(1 << 0)
@@ -96,7 +102,43 @@ static int unimac_mdio_poll(void *wait_func_data)
 					MDIO_CMD);
 }
 
-static int unimac_mdio_read(struct mii_bus *bus, int phy_id, int reg)
+static u32 unimac_mdio_c45_devad(int devad)
+{
+	return ((u32)devad << MDIO_DEVAD_SHIFT) & MDIO_DEVAD_MASK;
+}
+
+static int unimac_mdio_addr_c45(struct unimac_mdio_priv *priv,
+				int phy_id, int devad, int reg)
+{
+	u32 cmd;
+
+	/* Prepare the addr c45 operation */
+	cmd = MDIO_ADDR_C45 | (phy_id << MDIO_PMD_SHIFT) |
+	      unimac_mdio_c45_devad(devad) | (reg & MDIO_C45_REG_MASK);
+	unimac_mdio_writel(priv, cmd, MDIO_CMD);
+
+	/* Start MDIO transaction */
+	unimac_mdio_start(priv);
+
+	return priv->wait_func(priv->wait_func_data);
+}
+
+static void unimac_mdio_set_clause(struct unimac_mdio_priv *priv, bool is_c45)
+{
+	u32 cfg = unimac_mdio_readl(priv, MDIO_CFG);
+	u32 new_cfg = cfg;
+
+	if (is_c45)
+		new_cfg &= ~MDIO_C22;
+	else
+		new_cfg |= MDIO_C22;
+
+	if (new_cfg != cfg)
+		unimac_mdio_writel(priv, new_cfg, MDIO_CFG);
+}
+
+static int unimac_mdio_do_read(struct mii_bus *bus, int phy_id, int devad,
+			       int reg, bool is_c45)
 {
 	struct unimac_mdio_priv *priv = bus->priv;
 	int ret;
@@ -107,8 +149,19 @@ static int unimac_mdio_read(struct mii_bus *bus, int phy_id, int reg)
 		return ret;
 
 	/* Prepare the read operation */
-	cmd = MDIO_RD_C22 | (phy_id << MDIO_PMD_SHIFT) |
-		(reg << MDIO_REG_SHIFT);
+	unimac_mdio_set_clause(priv, is_c45);
+	if (is_c45) {
+		ret = unimac_mdio_addr_c45(priv, phy_id, devad, reg);
+		if (ret)
+			goto out;
+
+		cmd = MDIO_RD_C45 | (phy_id << MDIO_PMD_SHIFT) |
+			unimac_mdio_c45_devad(devad) |
+			(reg & MDIO_C45_REG_MASK);
+	} else {
+		cmd = MDIO_RD_C22 | (phy_id << MDIO_PMD_SHIFT) |
+			(reg << MDIO_REG_SHIFT);
+	}
 	unimac_mdio_writel(priv, cmd, MDIO_CMD);
 
 	/* Start MDIO transaction */
@@ -136,8 +189,8 @@ static int unimac_mdio_read(struct mii_bus *bus, int phy_id, int reg)
 	return ret;
 }
 
-static int unimac_mdio_write(struct mii_bus *bus, int phy_id,
-			     int reg, u16 val)
+static int unimac_mdio_do_write(struct mii_bus *bus, int phy_id, int devad,
+				int reg, u16 val, bool is_c45)
 {
 	struct unimac_mdio_priv *priv = bus->priv;
 	u32 cmd;
@@ -148,18 +201,50 @@ static int unimac_mdio_write(struct mii_bus *bus, int phy_id,
 		return ret;
 
 	/* Prepare the write operation */
-	cmd = MDIO_WR_C22 | (phy_id << MDIO_PMD_SHIFT) |
-		(reg << MDIO_REG_SHIFT) | (0xffff & val);
+	unimac_mdio_set_clause(priv, is_c45);
+	if (is_c45) {
+		ret = unimac_mdio_addr_c45(priv, phy_id, devad, reg);
+		if (ret)
+			goto out;
+
+		cmd = MDIO_WR_C45 | (phy_id << MDIO_PMD_SHIFT) |
+			unimac_mdio_c45_devad(devad) | (0xffff & val);
+	} else {
+		cmd = MDIO_WR_C22 | (phy_id << MDIO_PMD_SHIFT) |
+			(reg << MDIO_REG_SHIFT) | (0xffff & val);
+	}
 	unimac_mdio_writel(priv, cmd, MDIO_CMD);
 
 	unimac_mdio_start(priv);
 
 	ret = priv->wait_func(priv->wait_func_data);
+out:
 	clk_disable_unprepare(priv->clk);
 
 	return ret;
 }
 
+static int unimac_mdio_read(struct mii_bus *bus, int phy_id, int reg)
+{
+	return unimac_mdio_do_read(bus, phy_id, 0, reg, false);
+}
+
+static int unimac_mdio_write(struct mii_bus *bus, int phy_id, int reg, u16 val)
+{
+	return unimac_mdio_do_write(bus, phy_id, 0, reg, val, false);
+}
+
+static int unimac_mdio_read_c45(struct mii_bus *bus, int addr, int dev, int reg)
+{
+	return unimac_mdio_do_read(bus, addr, dev, reg, true);
+}
+
+static int unimac_mdio_write_c45(struct mii_bus *bus, int addr, int dev,
+				 int reg, u16 val)
+{
+	return unimac_mdio_do_write(bus, addr, dev, reg, val, true);
+}
+
 /* Workaround for integrated BCM7xxx Gigabit PHYs which have a problem with
  * their internal MDIO management controller making them fail to successfully
  * be read from or written to for the first transaction.  We insert a dummy
@@ -190,6 +275,10 @@ static int unimac_mdio_reset(struct mii_bus *bus)
 			if (addr < 0)
 				continue;
 
+			if (of_device_is_compatible(child,
+						    "ethernet-phy-ieee802.3-c45"))
+				continue;
+
 			read_mask |= 1 << addr;
 		}
 	}
@@ -301,6 +390,8 @@ static int unimac_mdio_probe(struct platform_device *pdev)
 	bus->parent = &pdev->dev;
 	bus->read = unimac_mdio_read;
 	bus->write = unimac_mdio_write;
+	bus->read_c45 = unimac_mdio_read_c45;
+	bus->write_c45 = unimac_mdio_write_c45;
 	bus->reset = unimac_mdio_reset;
 	snprintf(bus->id, MII_BUS_ID_SIZE, "%s-%d", pdev->name, pdev->id);
 
-- 
2.34.1

