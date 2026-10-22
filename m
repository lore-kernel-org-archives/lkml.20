Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792709840;
	b=T29jik4V2XqC1vo3j5WPWer/a8FqYNS12KlxP35Z8L9/8AunDzbyDUUHObdo2BGQg7Hm
	 hnCYXtBefgCnpGEyPAvk3L//vzskYL32nWAv8qhl8oc//kNpXJ6VorgjaN5MhbZI9gmxi
	 pFoVbvFIbYqgALWmUQadvNBGDEC5qnzNmGD0QNF4QVzb5Ewpz7F03DYnCbzIx5pN4mqGh
	 1ShgqE6OOxpPfCFj05LHemvKVwSM+pcPz5mK1T9cAcj1OHrqQqYukK+kpjuqgECYGD9zE
	 xRTa0rYBhQI4V4E5hh1WYX37ZoYKXLlpViwF9bidX4D6GXUPChHWtrR4pTdFXYB79kQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792709840;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=LZQ/9I91mNUcuhP0G3lEHnlf3oltqe6NJe/9E63RKNY=;
	b=ZPb49XLA97dBgarwHfAYnH9cAGjcZI4FXT3Zod14YeMH9aw8lhdepVmUZ88fjFscXmdo
	 YtdH3AYYg3IOwe4QvV0Ir87MlmxSk2Kb2JxUT14V/pTajpXYOmWvX3ifBboctozCz5LS4
	 gy1reepooau0qfhO1cf+MAdyR5JuiH/HwOkW9ZH96zqy30dedzk6fu2QVuDGQTt6zdhif
	 8edvKz0m56wMKs/uJw4B7t3Llvw8x0/rwvHwp55dinALDOIIzcKBZWEeVCInJTkNyPWRP
	 VNEXaOUfvKYeL7ZKhlMHF/u7qRlPEHd58rY//7Q/TMo/ckv0REzpHRdGzkkvLl8ikIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=HA5KHy0t;
	arc=none smtp.remote-ip=209.85.161.97
Received: from mail-oo1-f97.google.com (mail-oo1-f97.google.com [209.85.161.97])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD1C160A2605
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 22:57:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD1C160A2605
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=HA5KHy0t
Received: by mail-oo1-f97.google.com with SMTP id 006d021491bc7-70059e4dab6so206136eaf.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 15:57:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792709839; x=1793314639;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LZQ/9I91mNUcuhP0G3lEHnlf3oltqe6NJe/9E63RKNY=;
        b=cYXQ80+6l7jap37aEKes1ramJl+a7YgL5ubzxuwO9yE44aMvxyhAke7rqMEc78uW3g
         Z9Kvyoq6zl593Rjfr5VmKC6viCuTe4wSMMOSfR/B2kBhYg9QNvWwNoDKI/i7oHC5knNp
         fSKkl3K8mkkKnh5vTfotL+KqQg/xCNIPv5mcn+VUd+5l08Udk0tN3J/RaPUt3Z1gvG3Q
         6ezJJ0Vmu+HDA/Fn4XlO0xN6XfjsJzaW3jQSN389aNANKsio0KOeIxtbk6sxXznHI6tB
         qq7qqk8/V5BsCjw1p50UG+xyOyeIWe++puM2+Qp3D9fhmejSeo6Sf6I6y4xi6n4CGpVX
         fZhg==
X-Forwarded-Encrypted: i=1; AKwUvBziONAr2vmstiJg/k79s7TFfG3XYGjD/zYvVYWCx2oGl3m3kGULbabqPNSpNtcYEcCTFZ1Y7QCss7YrzoU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKPGhbYdOf4uay6j8+PMBR2e1obUo3ZtND3P6PYdiENjKAWBNPK
	2fAZRn9aDmH6Yc6BxVgxFL508R4WtvbVOBBLvYK/ldl/nvoUc5+nRbXcekUNW0CIcguMmrOZdzn
	VdFPRtXodxnPFvN/IUsVNMSw3fwI7WLotX5mvbCbcQRVpBNK2zFH2nty+p566Iu3VqWAMU6D9n6
	Gg+J3nPPNvqc5LArDbi6Y8V4ksRJj8RjCxL9w97kqmjoEALC3/VSPYrymNTvi+tFwOwOcS12O5+
	1zZPJJvhTVJAbULutCV7Fnp
X-Gm-Gg: AYBFou2kbElfu4vD5+VWglwXlNsrHaEY1KW30h6JJ6G/W/l+m8zWAtoh/4d0ltsLYr/
	V6hhGfQt2U/NhMhmy+SyTfwrox1kdZ/jgH8b6WaPMFU0bHwt6YSF4iWFxQxf2ojUNb6oVVZxqRU
	u8S+bhMD58CDxeVztrEAzu0hJzBoYSD22klh0GZXdOf/zf0rFkAnP/58PiI+iJjeUkGYnf4q9uL
	a/VR6Bzyl1mXJVmc2lLNDVd5Ob44seKLrMYyZEaw17MSF9vhOLUW04CHPkgVuwFy+T/YZxVtT+v
	0UhrufkIrMMVPqJUigCkPAD9tqrDVq+quhDjyk/vre+03vvWw97lZioP9+kWfDEaiMdF46VAcq6
	ttHuBwJhRGb1PycvOT8JZwncotTr9pYFUHOO6OTDWwKjc8M2ROnZPdtnAPdPv0yByRGMDpHImkT
	eUb2nhic/XIgpIV58MiPDQw3MZeOpc/U/KrYla96fC0FI=
X-Received: by 2002:a05:6820:7609:b0:6f6:3762:5fa2 with SMTP id 006d021491bc7-70b88b9c891mr432731eaf.86.1792709838789;
        Thu, 22 Oct 2026 15:57:18 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-125.dlp.protect.broadcom.com. [144.49.247.125])
        by smtp-relay.gmail.com with ESMTPS id 006d021491bc7-70b8b357dc7sm4277eaf.34.2026.10.22.15.57.17
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 22 Oct 2026 15:57:18 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91bebff9fcaso8930156d6.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 15:57:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1792709837; x=1793314637; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LZQ/9I91mNUcuhP0G3lEHnlf3oltqe6NJe/9E63RKNY=;
        b=HA5KHy0tDbYh93rNm2fK8GiW7bg1d3sbZ/Oq+nku+aq/RfWAF8gpJzzzS8TKIIaqAC
         mGIcgXVFr1xmrmhi1YSchcgyuWQUV5bM4tnj2DFh1MeZfQEmSg25a3oxmBDEvzkUx2H6
         9RhVtJ5P43E2lB/ajCbIrNMWGS5xyApDXS4Z4=
X-Forwarded-Encrypted: i=1; AKwUvBx3ogBAmyFcu0T92OkZzrJNUq9/CrmSf1jar61ZOh2ok/2wBAhj71napSKcrDucN2KR2UBVLS1YVe/PQd8=@vger.kernel.org
X-Received: by 2002:a05:6214:2526:b0:91c:359a:3263 with SMTP id 6a1803df08f44-91c3a643b9emr4215726d6.7.1792709836718;
        Thu, 22 Oct 2026 15:57:16 -0700 (PDT)
X-Received: by 2002:a05:6214:2526:b0:91c:359a:3263 with SMTP id 6a1803df08f44-91c3a643b9emr4215546d6.7.1792709836304;
        Thu, 22 Oct 2026 15:57:16 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c395025d0sm4501656d6.5.2026.10.22.15.57.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 15:57:15 -0700 (PDT)
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
Subject: [PATCH net 2/6 RESEND] net: dsa: b53: manage SerDes power through the PCS callbacks
Date: Thu, 22 Oct 2026 15:56:52 -0700
Message-ID: <20261022225656.1387306-3-florian.fainelli@broadcom.com>
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

Powering down the SerDes from mac_link_down() prevents the PCS from
observing link recovery. This also ties PCS power management to in-band
802.3z mode, leaving SGMII and other negotiation modes inconsistent.

Implement pcs_enable() and pcs_disable() so that phylink controls the
lane lifetime independently of individual link transitions. Remove the
MAC-to-SerDes power callback and perform read-modify-write operations
under the register mutex.

Fixes: 0e01491de646 ("net: dsa: b53: Add SerDes support")
Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 drivers/net/dsa/b53/b53_common.c |  8 ----
 drivers/net/dsa/b53/b53_priv.h   |  3 --
 drivers/net/dsa/b53/b53_serdes.c | 70 +++++++++++++++++++++++---------
 drivers/net/dsa/b53/b53_serdes.h |  2 -
 drivers/net/dsa/b53/b53_srab.c   |  1 -
 5 files changed, 51 insertions(+), 33 deletions(-)

diff --git a/drivers/net/dsa/b53/b53_common.c b/drivers/net/dsa/b53/b53_common.c
index 3f8f956aab82..09de3520e71a 100644
--- a/drivers/net/dsa/b53/b53_common.c
+++ b/drivers/net/dsa/b53/b53_common.c
@@ -1630,10 +1630,6 @@ static void b53_phylink_mac_link_down(struct phylink_config *config,
 		b53_force_link(dev, port, false);
 		return;
 	}
-
-	if (phy_interface_mode_is_8023z(interface) &&
-	    dev->ops->serdes_link_set)
-		dev->ops->serdes_link_set(dev, port, mode, interface, false);
 }
 
 static void b53_phylink_mac_link_up(struct phylink_config *config,
@@ -1672,10 +1668,6 @@ static void b53_phylink_mac_link_up(struct phylink_config *config,
 		b53_force_link(dev, port, true);
 		return;
 	}
-
-	if (phy_interface_mode_is_8023z(interface) &&
-	    dev->ops->serdes_link_set)
-		dev->ops->serdes_link_set(dev, port, mode, interface, true);
 }
 
 int b53_vlan_filtering(struct dsa_switch *ds, int port, bool vlan_filtering,
diff --git a/drivers/net/dsa/b53/b53_priv.h b/drivers/net/dsa/b53/b53_priv.h
index 29cca7945df7..cebbebe4ae0f 100644
--- a/drivers/net/dsa/b53/b53_priv.h
+++ b/drivers/net/dsa/b53/b53_priv.h
@@ -54,9 +54,6 @@ struct b53_io_ops {
 						      int port,
 						      phy_interface_t interface);
 	u8 (*serdes_map_lane)(struct b53_device *dev, int port);
-	void (*serdes_link_set)(struct b53_device *dev, int port,
-				unsigned int mode, phy_interface_t interface,
-				bool link_up);
 };
 
 struct b53_arl_entry;
diff --git a/drivers/net/dsa/b53/b53_serdes.c b/drivers/net/dsa/b53/b53_serdes.c
index c90894877626..87771e3788f7 100644
--- a/drivers/net/dsa/b53/b53_serdes.c
+++ b/drivers/net/dsa/b53/b53_serdes.c
@@ -107,6 +107,39 @@ static int b53_serdes_read(struct b53_device *dev, u8 lane,
 	return ret;
 }
 
+/* Return one if the register changed, zero if unchanged, or an error. */
+static int b53_serdes_modify(struct b53_device *dev, u8 lane, u8 offset,
+			     u16 block, u16 mask, u16 set)
+{
+	int ret, old;
+	u16 new;
+
+	mutex_lock(&dev->reg_mutex);
+	ret = b53_serdes_set_lane(dev, lane);
+	if (ret)
+		goto out;
+
+	old = b53_serdes_read_blk(dev, offset, block);
+	if (old < 0) {
+		ret = old;
+		goto out;
+	}
+
+	new = (old & ~mask) | set;
+	if (new == old)
+		goto out;
+
+	ret = b53_serdes_write_blk(dev, offset, block, new);
+	if (!ret)
+		ret = 1;
+out:
+	if (ret < 0)
+		dev->serdes_lane = B53_INVALID_LANE;
+	mutex_unlock(&dev->reg_mutex);
+
+	return ret;
+}
+
 static void b53_serdes_error(struct b53_device *dev, u8 lane, int ret)
 {
 	if (ret < 0)
@@ -202,32 +235,31 @@ static void b53_serdes_get_state(struct phylink_pcs *pcs, unsigned int neg_mode,
 		state->pause |= MLO_PAUSE_TX;
 }
 
-void b53_serdes_link_set(struct b53_device *dev, int port, unsigned int mode,
-			 phy_interface_t interface, bool link_up)
+static int b53_serdes_enable(struct phylink_pcs *pcs)
 {
-	u8 lane = b53_serdes_map_lane(dev, port);
-	int reg;
+	struct b53_pcs *priv = pcs_to_b53_pcs(pcs);
+	int ret;
 
-	if (lane == B53_INVALID_LANE)
-		return;
+	ret = b53_serdes_modify(priv->dev, priv->lane,
+				B53_SERDES_MII_REG(MII_BMCR), SERDES_MII_BLK,
+				BMCR_PDOWN, 0);
+	return ret < 0 ? ret : 0;
+}
 
-	reg = b53_serdes_read(dev, lane, B53_SERDES_MII_REG(MII_BMCR),
-			      SERDES_MII_BLK);
-	if (reg < 0)
-		goto out;
+static void b53_serdes_disable(struct phylink_pcs *pcs)
+{
+	struct b53_pcs *priv = pcs_to_b53_pcs(pcs);
+	int ret;
 
-	if (link_up)
-		reg &= ~BMCR_PDOWN;
-	else
-		reg |= BMCR_PDOWN;
-	reg = b53_serdes_write(dev, lane, B53_SERDES_MII_REG(MII_BMCR),
-			       SERDES_MII_BLK, reg);
-out:
-	b53_serdes_error(dev, lane, reg);
+	ret = b53_serdes_modify(priv->dev, priv->lane,
+				B53_SERDES_MII_REG(MII_BMCR), SERDES_MII_BLK,
+				BMCR_PDOWN, BMCR_PDOWN);
+	b53_serdes_error(priv->dev, priv->lane, ret);
 }
-EXPORT_SYMBOL(b53_serdes_link_set);
 
 static const struct phylink_pcs_ops b53_pcs_ops = {
+	.pcs_enable = b53_serdes_enable,
+	.pcs_disable = b53_serdes_disable,
 	.pcs_get_state = b53_serdes_get_state,
 	.pcs_config = b53_serdes_config,
 	.pcs_an_restart = b53_serdes_an_restart,
diff --git a/drivers/net/dsa/b53/b53_serdes.h b/drivers/net/dsa/b53/b53_serdes.h
index 3d367c4df4d9..6c851838457e 100644
--- a/drivers/net/dsa/b53/b53_serdes.h
+++ b/drivers/net/dsa/b53/b53_serdes.h
@@ -107,8 +107,6 @@ static inline u8 b53_serdes_map_lane(struct b53_device *dev, int port)
 	return dev->ops->serdes_map_lane(dev, port);
 }
 
-void b53_serdes_link_set(struct b53_device *dev, int port, unsigned int mode,
-			 phy_interface_t interface, bool link_up);
 struct phylink_pcs *b53_serdes_phylink_mac_select_pcs(struct b53_device *dev,
 						      int port,
 						      phy_interface_t interface);
diff --git a/drivers/net/dsa/b53/b53_srab.c b/drivers/net/dsa/b53/b53_srab.c
index 83a03fca142a..9988a83fa7b7 100644
--- a/drivers/net/dsa/b53/b53_srab.c
+++ b/drivers/net/dsa/b53/b53_srab.c
@@ -493,7 +493,6 @@ static const struct b53_io_ops b53_srab_ops = {
 #if IS_ENABLED(CONFIG_B53_SERDES)
 	.phylink_mac_select_pcs = b53_serdes_phylink_mac_select_pcs,
 	.serdes_map_lane = b53_srab_serdes_map_lane,
-	.serdes_link_set = b53_serdes_link_set,
 #endif
 };
 
-- 
2.53.0

