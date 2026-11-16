Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.99
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794864912;
	b=Nyo5KFDdEYgrtqC6zYVA0AchpdPPqNhGtPB2nefF3sfCdxLkhiG50YvCbUG4+43auvIO
	 eqDHikc7Ui4nb+SDH/cfyhxyr3KWhkJsmH/uJ3TkytI8vRSnNA13y16LH47rN1fWZZCVk
	 TnerczPP/jVOnDsPND8PB4G5JazZtil69xXeGE9VKNo/jNwGlvlhVaLFHoWO0mtUeXRlg
	 sKCYQj65iovkkZQJLJZGnNg/bLF9w42LYAS4No4DhvNy7cGg2uGPmexsui+iDyXjNz9Yf
	 IkIIeUa3wRs/4fLO1W4O4DTJCrGwvWzEsic2+4eP9oWSSW+fMbxX3uo7xw8vyIVqkwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794864912;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=Q9toRHBa6MBu8qE2ThH7+Bc5sQBwNumh+43a7Mu4fio=;
	b=Midw5SgTp7SB6SOUZ5f7bu7n9lbmAH1Qwxs3x2jMyH7QdKxaaPSm9MlVZkGbYvQAcoU/
	 uyw0k3a6bV53zMqUMBN6JzVmbNdi2r8kBVYUft4CGne2Na40OwdqCYOHV5eQgsb3gn8Je
	 oYxTJWQCW1eAukBWfrFwml3qQ02k2lhTdYR6TQzN8xM8F/PufwjoDS47fK8gYdEdP0l8s
	 r4ROYJ1iXjGvfeg8NMDqUEV9CVH0THqsezy5m33u9YzLznIlIG0D1SVICXFf3VosjGOv5
	 tIkuC+oB+riF8rBi24ARGwbtWWE8uDodIC1qH8mx/3I+dlDaNqXDT5rA+IKcQ9QWREg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=WevZLBeM;
	arc=none smtp.remote-ip=209.85.217.99
Received: from mail-vs1-f99.google.com (mail-vs1-f99.google.com [209.85.217.99])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FF57606A32F
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 21:35:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7FF57606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=WevZLBeM
Received: by mail-vs1-f99.google.com with SMTP id ada2fe7eead31-7cc0ccc2fddso1107868137.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 13:35:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794864910; x=1795469710;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q9toRHBa6MBu8qE2ThH7+Bc5sQBwNumh+43a7Mu4fio=;
        b=UhicPqEX3icT7fj8VEHRy4FqodwmdH+lZfNaLWUuWqcXbRt9RN16cI7xiWcBCOdlMj
         23F3J6yC9aZ2KYCeg5th3AQ/Ah9fpeLUczjJ4DQY9mHx8hgvYrZYc59sO9SOTGEuoSAc
         eCuX5ZUShvLLISmPNhcz53GtZpQqh+fUO6X1R5TvCCo5MFe6PSnZwlNiKTiqP+B9CMlg
         Yfsv7Jx9UxnSxBFAocO9Fc41oKAzZ0MsmccrJphAnSgxx5DFpf81LWvQ1fSeX1VXv01i
         MGYzn8XUrRWeYfFPN97jTik1IoaAVDNvOuBGmcUT9W8RJTqnYIzEsfzqd1yOg5SjiQar
         mAtQ==
X-Forwarded-Encrypted: i=1; AL+hErEB6McMdH80NDC8C+xDC1x8qC1zDS/b0p4UYwe6B3oIFL4TPioDzf2mS+FQWCovV55/KPkiDmgcP2EBMp0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/h7Y+17ai3QJGFpAdBJD+6YULeFEm4Zfi4aI+JeArpoNt5Vv/T
	OyOFiI/RjswjVEce6E+9nno8L+KxynHF0dTgxDOnvetTsjUu3uXLO5KbjyN8wElkSKYNTYEUVHA
	q6c/B8e2YLlakQdepx/7P8Hd78I04xNNhmPzLPbTscunRxCPf8lnkYNsW1dUimi4H6kE2txp5/3
	YxbUbmu3D6Ducx9imtwaA35SalCOMRDQNka4pzLjZ1KxzqkPEGL0DnWlPJP0DwBbDTMqK6e0+4c
	g/Idr11NrCoGlG2p1Xw64/8
X-Gm-Gg: AYBFou2g92HmvlKL+6A2BxJ7Kw4OLLGw6QQ3PJ0Qg5t2Htq//qHAY4Tjg6YWsuqJIxr
	qLkGMutSK7II0j2A915GyRy+1pg1aKkGj+K031yEzBZu6KrW22bsdbKChUtPFqh4swbKUbEMUd3
	wstWzffHgWQpbOrsGqZbWGoy5bZmJMZbvJ3m56KSycxS1DPVcLiPHn5DheqFelUss2JLFuvU6je
	acARTh2TJuP08WDbA+2SNU7bs3EDX10CTKsW0wNEI7WOVblrZHdMx6pH+9f6UUwDVu7/lrIan/3
	+Bbku5pG37ekAQsrkB6adejHswNsLQHBdzuPegKD9DsOgiVIIohNpWPPaC6GUrUL5xo0mgAblyW
	BdZ4T4MRwSwPM17ybmR7mZecdvNvOgjfAzMyVwQPpwsp/uz/qftRWo6c/9/CzZ6iUnPnNfuowvq
	3BzsgTEOAzHAwwVoL9nm9EFDa5k8xibCsV4eCqyrlC
X-Received: by 2002:a05:6102:61c9:10b0:7d6:864a:5509 with SMTP id ada2fe7eead31-7d6864aac91mr1120418137.24.1794864910285;
        Mon, 16 Nov 2026 13:35:10 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-26.dlp.protect.broadcom.com. [144.49.247.26])
        by smtp-relay.gmail.com with ESMTPS id a1e0cc1a2514c-99e3389c647sm93844241.13.2026.11.16.13.35.09
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Nov 2026 13:35:10 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-53661e036a2so32864051cf.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 13:35:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794864909; x=1795469709; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q9toRHBa6MBu8qE2ThH7+Bc5sQBwNumh+43a7Mu4fio=;
        b=WevZLBeMOmOtoyL5E/4Uw8oQjvjPdHLK1DkZqNHmwQH2GVEmjPSHcActM72+3+ceS9
         3YnTBQj6M8UCjNAZU/RWK8SoISM2TYnGHui7WhSW7EsuRdg2W5DO+pOWEDIx4VJl9ENQ
         HmOkkGMKuCgOytFIedM897Ty7Z3eooJ9wnmkA=
X-Forwarded-Encrypted: i=1; AL+hErHJxOpMvq09bCVP84kGZffoqdfoTYSi0NdXbSOscApH31wd8+rJC25vf9CK+Mm+fPMsRgbPe/Yx39pV4hA=@vger.kernel.org
X-Received: by 2002:a05:622a:17c9:b0:53f:8b6e:5380 with SMTP id d75a77b69052e-55ac867bea8mr173364991cf.62.1794864909275;
        Mon, 16 Nov 2026 13:35:09 -0800 (PST)
X-Received: by 2002:a05:622a:17c9:b0:53f:8b6e:5380 with SMTP id d75a77b69052e-55ac867bea8mr173364461cf.62.1794864908749;
        Mon, 16 Nov 2026 13:35:08 -0800 (PST)
Received: from stbirv-lnx-1.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d34a139f6sm40744171cf.22.2026.11.16.13.35.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 13:35:07 -0800 (PST)
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
Subject: [PATCH net-next v2 4/4] net: mdio: mdio-bcm-unimac: Add Clause 45 support
Date: Mon, 16 Nov 2026 13:34:49 -0800
Message-Id: <20261116213449.1682731-5-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261116213449.1682731-1-florian.fainelli@broadcom.com>
References: <20261116213449.1682731-1-florian.fainelli@broadcom.com>
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
index df267bb82696..6059b32580c5 100644
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

