Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792709838;
	b=fJ1Sj7CprHZrvEVhtiUrG3y2MXxiEmrA97imKhUbBuuIQiTV4bxDeQ3IRGeddXWrrRKJ
	 042jVVunXTMsxLkWN9WCaKC/F2aipkHP8U9WPQlBevw/a1cpD3rrgl+gnFpoatnyIVWOo
	 IimhFC0E4/xB0ztAv+rZ7/3XO5HXjb8JrMG4sVLWUter4OvV+DCaqIiFfPI34IFSyaOXn
	 6aTRRlRXHce/EMHpy9e4BU63lmXbqH5KDQuhJA7s3fRgSO/Omyamx2xOUZL0USDOEwaSS
	 bw49i6yUiEFs/dAwvFiYW4eVCFY7eHIFC60hkGHb9LBtnRUIgtxuDlZusS+h18FVZkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792709838;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=h8gPfI9JeQ9XOUZVTcwz6/7mOX9l24c3JGDHItgBJZ0=;
	b=ttj2uNFISyGbcRejv3TtenllVbE7ApKTUwgHrUq6dcU1Bmx2ifoaWclkZOhFAJx1MPP4
	 /W6Jxb/gq5MiopC+KEIsxmCZGwlhfjjybLN8zdrxSPAQ9t7F8mF3AiGPo2nSlq5KMLrPA
	 FCUSUed3ztfhBEoRAGGLyRz/E+jzgE9M63sRRUeS1NyaQe5P6Ya2FzbfZYhBTEB8dvaaz
	 vJNpt5wNYkTK/5FgrhM9YDEwAuL3OC4jKoHJZ9+dPworANvZ7/kNh1/u3qvC7SRHSOIM5
	 4RPETqz5he7x5P4zgqW3D90DA/0mwGJAwEt6pAXAYgQ3GwZ68YaA0wfJokN55z+CwRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=UwrIjysM;
	arc=none smtp.remote-ip=209.85.216.97
Received: from mail-pj1-f97.google.com (mail-pj1-f97.google.com [209.85.216.97])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33133606A33D
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 22:57:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33133606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=UwrIjysM
Received: by mail-pj1-f97.google.com with SMTP id 98e67ed59e1d1-3acb512a7a0so173879a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 15:57:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792709836; x=1793314636;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h8gPfI9JeQ9XOUZVTcwz6/7mOX9l24c3JGDHItgBJZ0=;
        b=gKovZSuvM7ownXIF9Oxzb9zuebPxoP4luPd3bF7d4SPuHQoupGHMiNYB8jOaMtlnUw
         xN/Al2vB+MqKFk9jxNParoyTFWwDtf+faUA8tntqY8WomScTvwBP1suOE6m+SSpvuSLi
         GuYAVrTTKxT97WX6yc6PiHQAUWcvzPG1I7fmCC12kQYfsahY5EsLWqn00RzJg2zinQHY
         pkDpm3Ms0eWsxB+zVA5HxoZkHCJHoXi4fMkGKBhm16e0qrHwaxhdUeX8KxJe5iWGiRgt
         j/fErU0p/kwgX8NHdwcd8RUuevie5GwR1BjHuBqdLSRJ9pNMbGB+kmHF8ayxFd1o3XEV
         3NlA==
X-Forwarded-Encrypted: i=1; AKwUvBxjqwROLGoo6cZQmDon4U0MyvdGslqUBAKdwnhBpwYdkvfWoZY1hwVpL3lOJH6//vXds3E0DWrL6m3yRSo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJo3FWsSaZc6e2CPGzWKeYmaZ0AqMPDfHlnABxLsEkAKnSgYLBZ
	1vnMxKjltE6MBks6MbLV/jYLAQL8eWXP+Y13vq24kITudhf/MC4Sa+/GndY12XEMAaqKyYPcUrB
	P8wuVcfMGou3Vk4/LGzhNaDzNpfJ6CpAqJHcNF/ClB7RzOEcVAoN3G0RcO7seJmvNOm6Oqj9/Qv
	WgCQaDvaDMwwb1smwMk1Pf65bHgd9GYikx6O5umdJgRY5iB8fy/dcu6AdW/VsDRUDYFSt9Qk1cH
	iqviGAseB0JvweSZxeFCwgL
X-Gm-Gg: AYBFou1QsENWHUjnp/Ij6B174U3v4UFrcZ6k1jnOR6/s0IlmlBRlyaQGxv5RAMtshTn
	Xr7qeNvJt8uVLz1O2a0nyZgi8td/GOZWJLvVHnP/TvsP18UQ+dksYD+wWqad/hYtS/6ir/78bVT
	iw4DGmd5MjW4jU2I2SjUP8A4p6+GrzwU7M/nKxRq6lH2VsOmGvHkB6R5LrnrKoA7d9XpVm6/NSQ
	nE8l1IpRaStjbozMg2MFNgBZ58Z4/gHtHKHVe5htVgHTfKd/e5g4RDhspivkWTQvBZ9tVUykpt8
	YpjeTDmtJZFDZVuMGwD+a/bgmcQpwcUup551cAJgAnldAajoENS5Cv1G9YJeYlb7lvV9nT3hamy
	e+xaNhagW2yaNHF6gTed+TaZHbX2Elxadml4CHfEgDZbgDdskeKwrE9ACrUCN4xKmGnUC2be6O+
	Y6t5f4BUj9fU0i2kh8XweQDBYKX0wbK0IdZ+wtshFHYaw=
X-Received: by 2002:a17:90b:5647:b0:3ab:5758:3757 with SMTP id 98e67ed59e1d1-3adce0e3825mr259153a91.61.1792709836434;
        Thu, 22 Oct 2026 15:57:16 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-120.dlp.protect.broadcom.com. [144.49.247.120])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3ada48fbd4fsm2997747a91.5.2026.10.22.15.57.15
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 22 Oct 2026 15:57:16 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-917baea8e5dso7399456d6.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 15:57:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1792709835; x=1793314635; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h8gPfI9JeQ9XOUZVTcwz6/7mOX9l24c3JGDHItgBJZ0=;
        b=UwrIjysM19iId6G/Rnif5y/xVCCeBLph48QCTrP6pscMB3s5t1HIYLSYi7n+C+gkDC
         rVr8gre86GXlJfU0VcCUgiTqeK8Bo5oIGlGa97mbafVxIiNr2nJWIx0jT/SmWDfelpJS
         r8GaUkW4nTamzKsZC7Ybbn6o0HS4Gl6N1VdQU=
X-Forwarded-Encrypted: i=1; AKwUvBzrnP6AE5boX+6zRXaT85mjd+BusXW8drQ6e5adK5e+ajZKWH4KQbc2NJNLhx1j1zaOvwQ0R+SNFw7NSDg=@vger.kernel.org
X-Received: by 2002:a05:6214:b6a:b0:91c:20ef:2020 with SMTP id 6a1803df08f44-91c3a63b1aamr4204826d6.6.1792709834605;
        Thu, 22 Oct 2026 15:57:14 -0700 (PDT)
X-Received: by 2002:a05:6214:b6a:b0:91c:20ef:2020 with SMTP id 6a1803df08f44-91c3a63b1aamr4204486d6.6.1792709834117;
        Thu, 22 Oct 2026 15:57:14 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c395025d0sm4501656d6.5.2026.10.22.15.57.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 15:57:13 -0700 (PDT)
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
Subject: [PATCH net 1/6 RESEND] net: dsa: b53: serialize SerDes register transactions
Date: Thu, 22 Oct 2026 15:56:51 -0700
Message-ID: <20261022225656.1387306-2-florian.fainelli@broadcom.com>
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

The lane and block selectors are shared by both SerDes lanes. Taking
reg_mutex separately for each register access allows another port to
change either selector before the data access. Hold the mutex across the
complete transaction and use the raw bus operations while it is held.

Propagate bus errors instead of returning uninitialized register contents,
only cache a successfully selected lane, and invalidate the cache after
failed accesses. Make the PCS callbacks fail configuration or report link
down on read errors, and reject out-of-range lane indices at discovery.

Fixes: 0e01491de646 ("net: dsa: b53: Add SerDes support")
Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 drivers/net/dsa/b53/b53_common.c |   1 +
 drivers/net/dsa/b53/b53_serdes.c | 148 ++++++++++++++++++++++++-------
 2 files changed, 115 insertions(+), 34 deletions(-)

diff --git a/drivers/net/dsa/b53/b53_common.c b/drivers/net/dsa/b53/b53_common.c
index 0880310c9ce3..3f8f956aab82 100644
--- a/drivers/net/dsa/b53/b53_common.c
+++ b/drivers/net/dsa/b53/b53_common.c
@@ -3203,6 +3203,7 @@ struct b53_device *b53_switch_alloc(struct device *base,
 	dev->ds = ds;
 	dev->priv = priv;
 	dev->ops = ops;
+	dev->serdes_lane = B53_INVALID_LANE;
 	ds->ops = &b53_switch_ops;
 	ds->phylink_mac_ops = &b53_phylink_mac_ops;
 	dev->vlan_enabled = true;
diff --git a/drivers/net/dsa/b53/b53_serdes.c b/drivers/net/dsa/b53/b53_serdes.c
index 7460122f6abc..c90894877626 100644
--- a/drivers/net/dsa/b53/b53_serdes.c
+++ b/drivers/net/dsa/b53/b53_serdes.c
@@ -22,47 +22,96 @@ static inline struct b53_pcs *pcs_to_b53_pcs(struct phylink_pcs *pcs)
 	return container_of(pcs, struct b53_pcs, pcs);
 }
 
-static void b53_serdes_write_blk(struct b53_device *dev, u8 offset, u16 block,
-				 u16 value)
+/* The caller holds reg_mutex across lane, block and data accesses. */
+static int b53_serdes_write_blk(struct b53_device *dev, u8 offset, u16 block,
+				u16 value)
 {
-	b53_write16(dev, B53_SERDES_PAGE, B53_SERDES_BLKADDR, block);
-	b53_write16(dev, B53_SERDES_PAGE, offset, value);
+	int ret;
+
+	lockdep_assert_held(&dev->reg_mutex);
+
+	ret = dev->ops->write16(dev, B53_SERDES_PAGE, B53_SERDES_BLKADDR,
+				block);
+	if (ret)
+		return ret;
+
+	return dev->ops->write16(dev, B53_SERDES_PAGE, offset, value);
 }
 
-static u16 b53_serdes_read_blk(struct b53_device *dev, u8 offset, u16 block)
+static int b53_serdes_read_blk(struct b53_device *dev, u8 offset, u16 block)
 {
 	u16 value;
+	int ret;
+
+	lockdep_assert_held(&dev->reg_mutex);
 
-	b53_write16(dev, B53_SERDES_PAGE, B53_SERDES_BLKADDR, block);
-	b53_read16(dev, B53_SERDES_PAGE, offset, &value);
+	ret = dev->ops->write16(dev, B53_SERDES_PAGE, B53_SERDES_BLKADDR,
+				block);
+	if (ret)
+		return ret;
 
-	return value;
+	ret = dev->ops->read16(dev, B53_SERDES_PAGE, offset, &value);
+	return ret ? ret : value;
 }
 
-static void b53_serdes_set_lane(struct b53_device *dev, u8 lane)
+static int b53_serdes_set_lane(struct b53_device *dev, u8 lane)
 {
+	int ret;
+
+	lockdep_assert_held(&dev->reg_mutex);
+
+	if (lane >= B53_N_PCS)
+		return -EINVAL;
+
 	if (dev->serdes_lane == lane)
-		return;
+		return 0;
 
-	WARN_ON(lane > 1);
+	ret = b53_serdes_write_blk(dev, B53_SERDES_LANE,
+				   SERDES_XGXSBLK0_BLOCKADDRESS, lane);
+	if (ret)
+		return ret;
 
-	b53_serdes_write_blk(dev, B53_SERDES_LANE,
-			     SERDES_XGXSBLK0_BLOCKADDRESS, lane);
 	dev->serdes_lane = lane;
+	return 0;
 }
 
-static void b53_serdes_write(struct b53_device *dev, u8 lane,
-			     u8 offset, u16 block, u16 value)
+static int b53_serdes_write(struct b53_device *dev, u8 lane,
+			    u8 offset, u16 block, u16 value)
 {
-	b53_serdes_set_lane(dev, lane);
-	b53_serdes_write_blk(dev, offset, block, value);
+	int ret;
+
+	mutex_lock(&dev->reg_mutex);
+	ret = b53_serdes_set_lane(dev, lane);
+	if (!ret)
+		ret = b53_serdes_write_blk(dev, offset, block, value);
+	if (ret)
+		dev->serdes_lane = B53_INVALID_LANE;
+	mutex_unlock(&dev->reg_mutex);
+
+	return ret;
 }
 
-static u16 b53_serdes_read(struct b53_device *dev, u8 lane,
+static int b53_serdes_read(struct b53_device *dev, u8 lane,
 			   u8 offset, u16 block)
 {
-	b53_serdes_set_lane(dev, lane);
-	return b53_serdes_read_blk(dev, offset, block);
+	int ret;
+
+	mutex_lock(&dev->reg_mutex);
+	ret = b53_serdes_set_lane(dev, lane);
+	if (!ret)
+		ret = b53_serdes_read_blk(dev, offset, block);
+	if (ret < 0)
+		dev->serdes_lane = B53_INVALID_LANE;
+	mutex_unlock(&dev->reg_mutex);
+
+	return ret;
+}
+
+static void b53_serdes_error(struct b53_device *dev, u8 lane, int ret)
+{
+	if (ret < 0)
+		dev_err_ratelimited(dev->dev, "SerDes lane %u access failed: %pe\n",
+				    lane, ERR_PTR(ret));
 }
 
 static int b53_serdes_config(struct phylink_pcs *pcs, unsigned int neg_mode,
@@ -72,31 +121,37 @@ static int b53_serdes_config(struct phylink_pcs *pcs, unsigned int neg_mode,
 {
 	struct b53_device *dev = pcs_to_b53_pcs(pcs)->dev;
 	u8 lane = pcs_to_b53_pcs(pcs)->lane;
-	u16 reg;
+	int reg;
 
 	reg = b53_serdes_read(dev, lane, B53_SERDES_DIGITAL_CONTROL(1),
 			      SERDES_DIGITAL_BLK);
+	if (reg < 0)
+		return reg;
+
 	if (interface == PHY_INTERFACE_MODE_1000BASEX)
 		reg |= FIBER_MODE_1000X;
 	else
 		reg &= ~FIBER_MODE_1000X;
-	b53_serdes_write(dev, lane, B53_SERDES_DIGITAL_CONTROL(1),
-			 SERDES_DIGITAL_BLK, reg);
-
-	return 0;
+	return b53_serdes_write(dev, lane, B53_SERDES_DIGITAL_CONTROL(1),
+				SERDES_DIGITAL_BLK, reg);
 }
 
 static void b53_serdes_an_restart(struct phylink_pcs *pcs)
 {
 	struct b53_device *dev = pcs_to_b53_pcs(pcs)->dev;
 	u8 lane = pcs_to_b53_pcs(pcs)->lane;
-	u16 reg;
+	int reg;
 
 	reg = b53_serdes_read(dev, lane, B53_SERDES_MII_REG(MII_BMCR),
 			      SERDES_MII_BLK);
+	if (reg < 0)
+		goto out;
+
 	reg |= BMCR_ANRESTART;
-	b53_serdes_write(dev, lane, B53_SERDES_MII_REG(MII_BMCR),
-			 SERDES_MII_BLK, reg);
+	reg = b53_serdes_write(dev, lane, B53_SERDES_MII_REG(MII_BMCR),
+			       SERDES_MII_BLK, reg);
+out:
+	b53_serdes_error(dev, lane, reg);
 }
 
 static void b53_serdes_get_state(struct phylink_pcs *pcs, unsigned int neg_mode,
@@ -104,12 +159,23 @@ static void b53_serdes_get_state(struct phylink_pcs *pcs, unsigned int neg_mode,
 {
 	struct b53_device *dev = pcs_to_b53_pcs(pcs)->dev;
 	u8 lane = pcs_to_b53_pcs(pcs)->lane;
-	u16 dig, bmsr;
+	int dig, bmsr;
 
 	dig = b53_serdes_read(dev, lane, B53_SERDES_DIGITAL_STATUS,
 			      SERDES_DIGITAL_BLK);
+	if (dig < 0) {
+		state->link = false;
+		b53_serdes_error(dev, lane, dig);
+		return;
+	}
+
 	bmsr = b53_serdes_read(dev, lane, B53_SERDES_MII_REG(MII_BMSR),
 			       SERDES_MII_BLK);
+	if (bmsr < 0) {
+		state->link = false;
+		b53_serdes_error(dev, lane, bmsr);
+		return;
+	}
 
 	switch ((dig >> SPEED_STATUS_SHIFT) & SPEED_STATUS_MASK) {
 	case SPEED_STATUS_10:
@@ -140,19 +206,24 @@ void b53_serdes_link_set(struct b53_device *dev, int port, unsigned int mode,
 			 phy_interface_t interface, bool link_up)
 {
 	u8 lane = b53_serdes_map_lane(dev, port);
-	u16 reg;
+	int reg;
 
 	if (lane == B53_INVALID_LANE)
 		return;
 
 	reg = b53_serdes_read(dev, lane, B53_SERDES_MII_REG(MII_BMCR),
 			      SERDES_MII_BLK);
+	if (reg < 0)
+		goto out;
+
 	if (link_up)
 		reg &= ~BMCR_PDOWN;
 	else
 		reg |= BMCR_PDOWN;
-	b53_serdes_write(dev, lane, B53_SERDES_MII_REG(MII_BMCR),
-			 SERDES_MII_BLK, reg);
+	reg = b53_serdes_write(dev, lane, B53_SERDES_MII_REG(MII_BMCR),
+			       SERDES_MII_BLK, reg);
+out:
+	b53_serdes_error(dev, lane, reg);
 }
 EXPORT_SYMBOL(b53_serdes_link_set);
 
@@ -213,16 +284,25 @@ int b53_serdes_init(struct b53_device *dev, int port)
 {
 	u8 lane = b53_serdes_map_lane(dev, port);
 	struct b53_pcs *pcs;
-	u16 id0, msb, lsb;
+	int id0, msb, lsb;
 
-	if (lane == B53_INVALID_LANE)
+	if (lane >= B53_N_PCS)
 		return -EINVAL;
 
 	id0 = b53_serdes_read(dev, lane, B53_SERDES_ID0, SERDES_ID0);
+	if (id0 < 0)
+		return id0;
+
 	msb = b53_serdes_read(dev, lane, B53_SERDES_MII_REG(MII_PHYSID1),
 			      SERDES_MII_BLK);
+	if (msb < 0)
+		return msb;
+
 	lsb = b53_serdes_read(dev, lane, B53_SERDES_MII_REG(MII_PHYSID2),
 			      SERDES_MII_BLK);
+	if (lsb < 0)
+		return lsb;
+
 	if (id0 == 0 || id0 == 0xffff) {
 		dev_err(dev->dev, "SerDes not initialized, check settings\n");
 		return -ENODEV;
-- 
2.53.0

