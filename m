Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.100
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792709844;
	b=mMSG/NMYzdTnLDzHf7W/fLC1OB3WOmzRYRfeMifP8r7tYy5ajPqxQioPwYCzECtElxU3
	 zSBfkFc0rV/dCZM2L2UUG+R6VSJMwQpPdKEAC3u6PsNr8qZEWnBdPm68j8l34Q2w4z3+O
	 GuU39hRyFP49KL4XCTD/2+tZQ/fs9/20Y4ShfgS1VFycwN6QOskVD7ft/pCD8HbrKhlM6
	 KieklDuV5g1idZs9DSYbtdD5l77myUPdub/guHRzvO1CFpkO2wLfQFmM2lvSAUB+fo8H9
	 f8SeO10O4aVSowZi9BQpi5ddpg3lnutyKlV9kZF2Q6TnmwF5FlkFajevVrW1o09Uuzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792709844;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=aSf7v2rxYowjbHfTF1igam6+hD/KB7/9ZuB9AjIMtM4=;
	b=g4dPqYJBirxeLhpWz3KoBsEPLl2z8QsB92VRpZDUGopk7DIp17ykXjJoc2pJIFSk6yED
	 4agYX3UWjAWTZs9C9/mfEdLdWYaz6ehG1gqeKGr1fRcce11eXxfzG+Ypa1CIxHdosWt0C
	 UOn0CDdAmxDI4KJ0shjrgwc46ReQdh6KJjCL0esiegqF1CYYgkjuQHQTURmA3vI+sap8W
	 VEwAHDjZyJV953qamO0cWjpYALNF/soehcSBHCrrIX9jMgtd3j05n3DRUoEHwkDlbdq+f
	 U4AyLjKWNl4UMM8Q6oSLZPKyGXc0mXNlRjXAT+/GafhibZrnKHjsOV0S75lyaWSWULw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=FX5T7wFz;
	arc=none smtp.remote-ip=209.85.216.100
Received: from mail-pj1-f100.google.com (mail-pj1-f100.google.com [209.85.216.100])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 061F360A2604
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 22:57:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 061F360A2604
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=FX5T7wFz
Received: by mail-pj1-f100.google.com with SMTP id 98e67ed59e1d1-3acd21ba21aso268454a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 15:57:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792709843; x=1793314643;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aSf7v2rxYowjbHfTF1igam6+hD/KB7/9ZuB9AjIMtM4=;
        b=Kg+lKkbquzuq9mPV/zb5DGJHvrzb18OikczrwWblayw/ebxBB96Y6FJ8oMhy6ytrPD
         L/OIH4jXY5/w0+oU/69wz7dT3HqRXEo6J+O2Xo+c6J5LWH2rotbhmMZ0wESLKr9Em9KS
         8laTRw3E8gp4ngThW2OOcZEauSUyWNmrt7/z/TbxGazJVGF6cXjTa2IhtJEslkFiUNnC
         SAQ0B5fZCNdoeDYtcEMl63/LJVU3GCi1veMCbyUmV47IEZzH8BMP9JNJmbzzwSIyeJf2
         r707hZIGguxcvV4YC/eKrm8zZiEjphyCyMkv1G2xTLVF1d9N9EvdLj/zSYtE43fJIkN/
         tp7Q==
X-Forwarded-Encrypted: i=1; AKwUvBzDpgiAz7M2BGHz3HFDEgcj6HgLgv76UAj/0KZYgwu7IO+i+oMuaVa1U/+gFvqNReJBz8RSBBhobev97kQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJwQI77EjiPHfsNa1wzqnUbxXwqqcgOIU8PSz1izlSag6KNDvQW
	/QEpSiiFbu0pkUBUI2ICcYwMIiAiS+giOscWG+N1O2/JZbYgLlAIPf6i0W1RX49hy8k3qJzWnxf
	yNo4rgxuT677yfYba7wPYsv/KpceSrbv5z/ZwebUTUDECjaLkoRwsk5tceCnAYWwDItq3552ID6
	zO2teS/tWKvs6Y5nrm7V8LcO4P/CmeXK1XWMkVwgtOIt7WajwD9AmoKLJbOAcBZMFOowx02zSUt
	oskqht25wxs0D/MBS51arX3
X-Gm-Gg: AYBFou0ul3frspbr1MkZrpG4SzKXrJtsNGUOo+Evtc1gpNgdcmOPOAIubPhm29nbpcD
	UfbrW5P8lfz6qqiVO2yoXv/y+nn9Za3pM9+a1ItUdBqflpDfsAiMVaOrZKrRfIvnsIJof4LLshd
	vsyM7evfrExVlTFTZRh5BigRNzWfEy4Uzv9wFkbsHkm5E1biN/719J1jsCyOxsLzh+Y64GVJDAJ
	iI5/NosrhC8pE6JfhcXcV+07dXR8BDzm8jko35lRldIfg188B22zwMrfxl6JD1kBzSsgWuQZJxP
	0kb3ZHikAz6nRX8pAFzlFu+SMrEqinKgmVubyvuQ5/LLwXHaEruZW4Bp6GRfdAhAgp5yPvPklzQ
	BizAXdzcnPcsTP7L+FU05Yd9V/pKUKPYIesX0Cy2DFgl9lpVxVHfUg1asGeUXZE0lQLD3zksopS
	NmO4ll1j01Jg8JyQ85kdcnK4gWdPi0Lx7SnJFNHBKMyj0=
X-Received: by 2002:a17:90b:180d:b0:3ac:adce:60c5 with SMTP id 98e67ed59e1d1-3adce7a67bamr244142a91.23.1792709843412;
        Thu, 22 Oct 2026 15:57:23 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-125.dlp.protect.broadcom.com. [144.49.247.125])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3ada49252d2sm2988763a91.8.2026.10.22.15.57.22
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 22 Oct 2026 15:57:23 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93caf7856ffso53492385a.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 15:57:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1792709842; x=1793314642; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aSf7v2rxYowjbHfTF1igam6+hD/KB7/9ZuB9AjIMtM4=;
        b=FX5T7wFzJPLEShF9NVLC+dPC9aH3FtQ/4rhEsEPIfzgJcQvd3Z0KObAls1ChxVBPKT
         Oy+VG/gRdxwyYjTlwJW0ukK1sBaWSKMrDnm27vrwrWL2X1Sl87L+tJbKodRxPVOLl+I8
         RSDhHfTy1POEEO7ottUEZuYuah+eJXds/6fsY=
X-Forwarded-Encrypted: i=1; AKwUvBxpNy3YcvdYPYnVz77Mx9VUQ51aRqRr2xQzrnlpszkR3Lmr1KunA2d4i2aP0/9JNmODzo2A9tcBP1WtzOg=@vger.kernel.org
X-Received: by 2002:a05:620a:1a05:b0:93e:4bbf:cc32 with SMTP id af79cd13be357-93f6f7c2d49mr173783885a.35.1792709841685;
        Thu, 22 Oct 2026 15:57:21 -0700 (PDT)
X-Received: by 2002:a05:620a:1a05:b0:93e:4bbf:cc32 with SMTP id af79cd13be357-93f6f7c2d49mr173780785a.35.1792709841105;
        Thu, 22 Oct 2026 15:57:21 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c395025d0sm4501656d6.5.2026.10.22.15.57.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 15:57:20 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: netdev@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Jonas Gorski <jonas.gorski@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH net 4/6 RESEND] net: dsa: b53: configure PCS negotiation and forced link parameters
Date: Thu, 22 Oct 2026 15:56:54 -0700
Message-ID: <20261022225656.1387306-5-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261022225656.1387306-1-florian.fainelli@broadcom.com>
References: <20261022225656.1387306-1-florian.fainelli@broadcom.com>
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

pcs_config() currently only selects fiber mode. Configure the Clause 37
or SGMII advertisement and BMCR autonegotiation enable from phylink's
negotiation mode, clear isolation, disable protocol auto-detection and
select the MAC side of SGMII explicitly. Report changes to phylink so it
can restart negotiation, and expose the supported in-band modes.

Implement pcs_link_up() for forced speed and duplex when in-band
negotiation is disabled. Use the receiver hold and TX FIFO reset sequence
from the downstream robo SerDes driver, clear its vendor speed override,
and restore the receiver and FIFO even if programming fails.

Leave analog and PLL initialization to the existing firmware setup.

Fixes: 0e01491de646 ("net: dsa: b53: Add SerDes support")
Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 drivers/net/dsa/b53/b53_serdes.c | 187 ++++++++++++++++++++++++-------
 drivers/net/dsa/b53/b53_serdes.h |   6 +
 2 files changed, 151 insertions(+), 42 deletions(-)

diff --git a/drivers/net/dsa/b53/b53_serdes.c b/drivers/net/dsa/b53/b53_serdes.c
index d521050d7c8f..fc20e211e67e 100644
--- a/drivers/net/dsa/b53/b53_serdes.c
+++ b/drivers/net/dsa/b53/b53_serdes.c
@@ -75,22 +75,6 @@ static int b53_serdes_set_lane(struct b53_device *dev, u8 lane)
 	return 0;
 }
 
-static int b53_serdes_write(struct b53_device *dev, u8 lane,
-			    u8 offset, u16 block, u16 value)
-{
-	int ret;
-
-	mutex_lock(&dev->reg_mutex);
-	ret = b53_serdes_set_lane(dev, lane);
-	if (!ret)
-		ret = b53_serdes_write_blk(dev, offset, block, value);
-	if (ret)
-		dev->serdes_lane = B53_INVALID_LANE;
-	mutex_unlock(&dev->reg_mutex);
-
-	return ret;
-}
-
 static int b53_serdes_read(struct b53_device *dev, u8 lane,
 			   u8 offset, u16 block)
 {
@@ -147,44 +131,161 @@ static void b53_serdes_error(struct b53_device *dev, u8 lane, int ret)
 				    lane, ERR_PTR(ret));
 }
 
+static unsigned int b53_serdes_inband_caps(struct phylink_pcs *pcs,
+					   phy_interface_t interface)
+{
+	switch (interface) {
+	case PHY_INTERFACE_MODE_SGMII:
+	case PHY_INTERFACE_MODE_1000BASEX:
+		return LINK_INBAND_DISABLE | LINK_INBAND_ENABLE;
+	default:
+		return 0;
+	}
+}
+
+static int b53_serdes_force_link(struct b53_pcs *priv, int speed, int duplex)
+{
+	struct b53_device *dev = priv->dev;
+	u8 lane = priv->lane;
+	u16 bmcr = mii_bmcr_encode_fixed(speed, duplex);
+	u16 mask = BMCR_SPEED100 | BMCR_SPEED1000 | BMCR_FULLDPLX;
+	int old, misc, rx, fifo, ret, err;
+
+	old = b53_serdes_read(dev, lane, B53_SERDES_MII_REG(MII_BMCR),
+			      SERDES_MII_BLK);
+	if (old < 0)
+		return old;
+	misc = b53_serdes_read(dev, lane, B53_SERDES_DIGITAL_MISC1,
+			       SERDES_DIGITAL_BLK);
+	if (misc < 0)
+		return misc;
+	rx = b53_serdes_read(dev, lane, B53_SERDES_RX_CONTROL, SERDES_RX_BLK);
+	if (rx < 0)
+		return rx;
+	fifo = b53_serdes_read(dev, lane, B53_SERDES_DIGITAL_CONTROL(3),
+			       SERDES_DIGITAL_BLK);
+	if (fifo < 0)
+		return fifo;
+
+	if ((old & mask) == bmcr && !(misc & FORCE_SPEED_MASK) &&
+	    !(rx & RX_SEQ_START) && !(fifo & TX_FIFO_RST))
+		return 0;
+
+	/* Hold the receiver and TX FIFO while switching the forced speed,
+	 * following the downstream robo SerDes programming sequence.
+	 */
+	ret = b53_serdes_modify(dev, lane, B53_SERDES_RX_CONTROL,
+				SERDES_RX_BLK, RX_SEQ_START, RX_SEQ_START);
+	if (ret < 0)
+		goto release;
+
+	ret = b53_serdes_modify(dev, lane, B53_SERDES_DIGITAL_CONTROL(3),
+				SERDES_DIGITAL_BLK, TX_FIFO_RST, TX_FIFO_RST);
+	if (ret < 0)
+		goto release;
+
+	ret = b53_serdes_modify(dev, lane, B53_SERDES_DIGITAL_MISC1,
+				SERDES_DIGITAL_BLK, FORCE_SPEED_MASK, 0);
+	if (ret >= 0)
+		ret = b53_serdes_modify(dev, lane, B53_SERDES_MII_REG(MII_BMCR),
+					SERDES_MII_BLK, mask, bmcr);
+release:
+	/* A failed write may have reached the device. Release both holds. */
+	err = b53_serdes_modify(dev, lane, B53_SERDES_RX_CONTROL,
+				SERDES_RX_BLK, RX_SEQ_START, 0);
+	if (ret >= 0)
+		ret = err;
+	err = b53_serdes_modify(dev, lane, B53_SERDES_DIGITAL_CONTROL(3),
+				SERDES_DIGITAL_BLK, TX_FIFO_RST, 0);
+	if (ret >= 0)
+		ret = err;
+
+	return ret < 0 ? ret : 1;
+}
+
 static int b53_serdes_config(struct phylink_pcs *pcs, unsigned int neg_mode,
 			     phy_interface_t interface,
 			     const unsigned long *advertising,
 			     bool permit_pause_to_mac)
 {
-	struct b53_device *dev = pcs_to_b53_pcs(pcs)->dev;
-	u8 lane = pcs_to_b53_pcs(pcs)->lane;
-	int reg;
+	struct b53_pcs *priv = pcs_to_b53_pcs(pcs);
+	struct b53_device *dev = priv->dev;
+	u8 lane = priv->lane;
+	int adv, ret, changed;
+	u16 ctrl, bmcr;
 
-	reg = b53_serdes_read(dev, lane, B53_SERDES_DIGITAL_CONTROL(1),
-			      SERDES_DIGITAL_BLK);
-	if (reg < 0)
-		return reg;
-
-	if (interface == PHY_INTERFACE_MODE_1000BASEX)
-		reg |= FIBER_MODE_1000X;
-	else
-		reg &= ~FIBER_MODE_1000X;
-	return b53_serdes_write(dev, lane, B53_SERDES_DIGITAL_CONTROL(1),
-				SERDES_DIGITAL_BLK, reg);
+	if (!test_bit(interface, pcs->supported_interfaces))
+		return -EINVAL;
+
+	adv = phylink_mii_c22_pcs_encode_advertisement(interface, advertising);
+	if (adv < 0)
+		return adv;
+
+	ctrl = interface == PHY_INTERFACE_MODE_1000BASEX ? FIBER_MODE_1000X : 0;
+	/* Select the protocol explicitly and act as the MAC in SGMII mode. */
+	ret = b53_serdes_modify(dev, lane, B53_SERDES_DIGITAL_CONTROL(1),
+				SERDES_DIGITAL_BLK,
+				FIBER_MODE_1000X | AUTODET_EN | SGMII_MASTER_MODE,
+				ctrl);
+	if (ret < 0)
+		return ret;
+	changed = ret;
+
+	ret = b53_serdes_modify(dev, lane, B53_SERDES_MII_REG(MII_ADVERTISE),
+				SERDES_MII_BLK, 0xffff, adv);
+	if (ret < 0)
+		return ret;
+	changed |= ret;
+
+	if (interface == PHY_INTERFACE_MODE_1000BASEX &&
+	    neg_mode != PHYLINK_PCS_NEG_INBAND_ENABLED) {
+		/* The baud rate must be set before waiting for PCS link-up. */
+		ret = b53_serdes_force_link(priv, SPEED_1000, DUPLEX_FULL);
+	} else {
+		ret = b53_serdes_modify(dev, lane, B53_SERDES_DIGITAL_MISC1,
+					SERDES_DIGITAL_BLK, FORCE_SPEED_MASK, 0);
+	}
+	if (ret < 0)
+		return ret;
+	changed |= ret;
+
+	bmcr = neg_mode == PHYLINK_PCS_NEG_INBAND_ENABLED ? BMCR_ANENABLE : 0;
+	/* phylink requests Clause 37 restarts separately, but not SGMII. */
+	if (bmcr && changed && interface == PHY_INTERFACE_MODE_SGMII)
+		bmcr |= BMCR_ANRESTART;
+	ret = b53_serdes_modify(dev, lane, B53_SERDES_MII_REG(MII_BMCR),
+				SERDES_MII_BLK,
+				BMCR_ANENABLE | BMCR_ISOLATE | BMCR_ANRESTART, bmcr);
+	if (ret < 0)
+		return ret;
+
+	/* The MAC applies phylink's resolved pause policy in mac_link_up(). */
+	return changed | ret;
 }
 
 static void b53_serdes_an_restart(struct phylink_pcs *pcs)
 {
-	struct b53_device *dev = pcs_to_b53_pcs(pcs)->dev;
-	u8 lane = pcs_to_b53_pcs(pcs)->lane;
-	int reg;
+	struct b53_pcs *priv = pcs_to_b53_pcs(pcs);
+	int ret;
 
-	reg = b53_serdes_read(dev, lane, B53_SERDES_MII_REG(MII_BMCR),
-			      SERDES_MII_BLK);
-	if (reg < 0)
-		goto out;
+	ret = b53_serdes_modify(priv->dev, priv->lane,
+				B53_SERDES_MII_REG(MII_BMCR), SERDES_MII_BLK,
+				BMCR_ANRESTART, BMCR_ANRESTART);
+	b53_serdes_error(priv->dev, priv->lane, ret);
+}
 
-	reg |= BMCR_ANRESTART;
-	reg = b53_serdes_write(dev, lane, B53_SERDES_MII_REG(MII_BMCR),
-			       SERDES_MII_BLK, reg);
-out:
-	b53_serdes_error(dev, lane, reg);
+static void b53_serdes_link_up(struct phylink_pcs *pcs, unsigned int neg_mode,
+			       phy_interface_t interface, int speed, int duplex)
+{
+	struct b53_pcs *priv = pcs_to_b53_pcs(pcs);
+	int ret;
+
+	if (interface != PHY_INTERFACE_MODE_SGMII ||
+	    neg_mode == PHYLINK_PCS_NEG_INBAND_ENABLED)
+		return;
+
+	ret = b53_serdes_force_link(priv, speed, duplex);
+	b53_serdes_error(priv->dev, priv->lane, ret);
 }
 
 static void b53_serdes_get_state(struct phylink_pcs *pcs, unsigned int neg_mode,
@@ -258,11 +359,13 @@ static void b53_serdes_disable(struct phylink_pcs *pcs)
 }
 
 static const struct phylink_pcs_ops b53_pcs_ops = {
+	.pcs_inband_caps = b53_serdes_inband_caps,
 	.pcs_enable = b53_serdes_enable,
 	.pcs_disable = b53_serdes_disable,
 	.pcs_get_state = b53_serdes_get_state,
 	.pcs_config = b53_serdes_config,
 	.pcs_an_restart = b53_serdes_an_restart,
+	.pcs_link_up = b53_serdes_link_up,
 };
 
 void b53_serdes_phylink_get_caps(struct b53_device *dev, int port,
diff --git a/drivers/net/dsa/b53/b53_serdes.h b/drivers/net/dsa/b53/b53_serdes.h
index 6c851838457e..2c2aa5eaa985 100644
--- a/drivers/net/dsa/b53/b53_serdes.h
+++ b/drivers/net/dsa/b53/b53_serdes.h
@@ -22,6 +22,11 @@
 #define B53_SERDES_MII_REG(x)		(0x20 + (x) * 2)
 #define B53_SERDES_DIGITAL_CONTROL(x)	(0x1e + (x) * 2)
 #define B53_SERDES_DIGITAL_STATUS	0x28
+#define B53_SERDES_DIGITAL_MISC1		0x30
+#define  FORCE_SPEED_MASK		GENMASK(4, 0)
+
+#define B53_SERDES_RX_CONTROL		0x22
+#define  RX_SEQ_START			BIT(15)
 
 /* SERDES_DIGITAL_CONTROL1 */
 #define  FIBER_MODE_1000X		BIT(0)
@@ -92,6 +97,7 @@
 #define  TXFIFO_ERR_DET			BIT(15)
 
 /* Block offsets */
+#define SERDES_RX_BLK			0x80b0
 #define SERDES_DIGITAL_BLK		0x8300
 #define SERDES_ID0			0x8310
 #define SERDES_MII_BLK			0xffe0
-- 
2.53.0

