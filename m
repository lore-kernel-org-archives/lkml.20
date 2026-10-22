Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.99
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792709846;
	b=BEOhzGAXNhg1nX2OzmGBxaqhCgwYqJWjb7Y0xaVzhmN71V63z+Nmmut4x5Pxz+f4nbtR
	 ryHDHkfsSo/SA4VkQ3gfOZVBPr8ONpTCC+HJNzatIAivkd8ACg7oDCQAckkJzNAPzTEFD
	 4wV/jrVGXF6BG1qZgA56f9QHpHo4MajwiNZmWvvAIoCdoa7XZ79LWsvbUZJ9Ze560Q5WD
	 cjVU39HeJUgi4o36LWnfAN0QkV/6DkvVNI60TgEaauw4p32h5b36JOt4kdd6mS2kfcF6y
	 Ui1wW4utsLAFNhdrVLs4vyneTHEVv7ixUN3Q0mFqnxp7hrImx8ndPLvO1YoATA9kJqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792709846;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=WigrYeX8rfIc0uBYkqlaE73MENE+ioOdixBQzIPPQ94=;
	b=MAN8Ib56PpQVwO3ypHo4AS3ehtNSXaH8eQdg+7tsGv5598VlpXqBlz7STbm7HZvIve/2
	 gTEuPGyGXeJz6sGw2xOMQJjUtPLxUzg/NmPoPCiEd8ize8P0ZPGKIDCvl7fLyzsjcOSTQ
	 7rwoRnEuwgOjgd8l+FQZ8q5n4yfoGL8EUWN7Bftw+uHPQE06iBFIr6QT1BHwthCE6F01/
	 /ykcYRa4kHq5sK1XDcShKajdivIpGyW66wtkBkkDVO2FnoAG0PMuKT8jEHLoqHOQbvjf0
	 qgrszu3QGMpHXAk4k5il9HLx4Fr+XF9ss3dLQfQne1GdyFmoSnfVlP2iw8P/MMDEy1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=VmYwkCdl;
	arc=none smtp.remote-ip=209.85.216.99
Received: from mail-pj1-f99.google.com (mail-pj1-f99.google.com [209.85.216.99])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 765ED60A2636
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 22:57:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 765ED60A2636
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=VmYwkCdl
Received: by mail-pj1-f99.google.com with SMTP id 98e67ed59e1d1-3acdcfa2bd3so248129a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 15:57:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792709846; x=1793314646;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WigrYeX8rfIc0uBYkqlaE73MENE+ioOdixBQzIPPQ94=;
        b=w2IUCvRCRXtzLGe75v+bloEiNyyZwBmysfjmN+G5wLmwNSam9A6kJFwNLyOoZJwU3Y
         d5GijfYlUeZySaX48lqHgof0e0iMaKhQOJ1kf/oke0WnVJcYDhLqqQHM5c3aJo5ZtSMW
         h06SkGw0W//cZ4gietzEM4ncs3D7WVKD0QpESQZNBrQrqJgnOiYnzRRChgnP17847WqZ
         1xT4L8ahrqZPmI0WQki8phsSRZNA1/Ou/L9ZfVuIEQdPmhCV+lOwGo1WIG7/ai+ssUf0
         x5+ogTU///AqfhRMkda247s6iLTXf3Ar9oq3zxSEHNvRp4BiREMM144FA8jH/nkBhOtD
         CAew==
X-Forwarded-Encrypted: i=1; AKwUvBxmu/r0dKJBRiFFlfPv1NCnPcz3MlQsYosbud6Ah77EdTWogD4MLMoHHgjNIcJxwRrOmhFDeuuMb/s/WSs=@vger.kernel.org
X-Gm-Message-State: AFq9FYKumqxjIKOjaZxKIQdslhMZc3rebTdCc6Y5SjAwGCKJGAHLEcyq
	VsyjuXQHB8xkW+AJzCiAqd6eTuY9CTiuhSEhMsMtFHg4pHcH8fq+t3kl1koQOoRn7gVQYn/711m
	/3Ey4wclsd+3pAgOYMKlYp/vdIXIY6MqUkuJ4pEHbazf19uf+jgXkuf1JqMSM7DhEb/5+J+W/nE
	EAE/kT/Jc4TyqoTTO9i1HeFsfCdIOgPF6KgNHxlcAyN2h1Z69P+9wZo46Rqed/4Yqq0nTPosr0M
	f/eTFNVL5sKkeNwT3FA8Ske
X-Gm-Gg: AYBFou2msZGeGzpK+Gk5TmGPeVZxsFZb9f1bX7lYjg7qPO3tSNBpz/2HkU96nU41IUF
	QWQsWVCj4TTTUAMK5/hgJIGU8dS/H2HXNYpHcbvPtAuMuqkcua8kkhxTFCHNGuyFpC0w7vd8MwZ
	x0E2g4tlin7yL1xqpFdjPxeaxikCXsphodyKgkKycBYcMoxEPaNoGTQJkS/5AT9x6lHc51zKxUa
	1YQI6qKmNRrner53rS6WWGj71zsxtKo49HDeB+fgdf8KORKl8lQoP3SBGB5hyRuXTj7cvL5hX9T
	NrvXNWADpEjCUPfYq1fjq5BcSTSOI9q5shITUxWsOfp3b2UstwGchZheLqHARfciuCnzZDGsLnE
	3uqCnr7Al4/GxAWsZ70FDDqXOVoDfuIKFhpvcjO1yk1TiuhOyQI2v6p/Q7t4uUkX0zvYdsau+uM
	x8hoy2ZHEo1V9n1XHeRhdj0x7Jd76BGMF6c5rn5VF6kxI=
X-Received: by 2002:a17:90a:e18e:b0:3ac:4291:f569 with SMTP id 98e67ed59e1d1-3adcddb48f6mr281190a91.8.1792709845756;
        Thu, 22 Oct 2026 15:57:25 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-125.dlp.protect.broadcom.com. [144.49.247.125])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3ada49252d2sm2988823a91.8.2026.10.22.15.57.24
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 22 Oct 2026 15:57:25 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f2373e9b4so32701285a.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 15:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1792709844; x=1793314644; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WigrYeX8rfIc0uBYkqlaE73MENE+ioOdixBQzIPPQ94=;
        b=VmYwkCdl4XKs+YUrmZi3jDmtRs9GLsZ9Vgmmi1WHqIvIMYsa9EER6eezdnZD6R8BW1
         zMvAVhUIQWedBT6ZEbKfrbJCuSXLtHZOSMZKhRLUEW5vH4+EjbsXNoJUFRojyCiOzFua
         avnIe7PXzPoRCdSitfknqPe4uGRdDc6FSdpKQ=
X-Forwarded-Encrypted: i=1; AKwUvBxWjXMmZwBngfFhuHoghtzY3ZlJvoEO9s2C10JJHIAHlAnKAkKoAKDcwhI/sfudzzuxwl3N+FVAZK0hP/I=@vger.kernel.org
X-Received: by 2002:a05:620a:6082:b0:93e:e2ec:3bf with SMTP id af79cd13be357-93f6fa10572mr142966285a.78.1792709843841;
        Thu, 22 Oct 2026 15:57:23 -0700 (PDT)
X-Received: by 2002:a05:620a:6082:b0:93e:e2ec:3bf with SMTP id af79cd13be357-93f6fa10572mr142964485a.78.1792709843241;
        Thu, 22 Oct 2026 15:57:23 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c395025d0sm4501656d6.5.2026.10.22.15.57.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 15:57:22 -0700 (PDT)
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
Subject: [PATCH net 5/6 RESEND] net: dsa: b53: report link state through the PCS
Date: Thu, 22 Oct 2026 15:56:55 -0700
Message-ID: <20261022225656.1387306-6-florian.fainelli@broadcom.com>
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

Decode the Clause 22 BMSR and link partner word with the phylink helper.
This respects the negotiation mode, reports the partner advertisement,
and resolves Clause 37 pause from the configured advertisement instead
of unconditionally accepting the vendor status register's result.

Notify phylink through phylink_pcs_change() from the SerDes port interrupt,
using live PCS status rather than MAC link status, which can be overridden
by mac_link_up/down(). Remove the now unused MAC notification helper.

Enable PCS polling as a fallback for optional port interrupts and for
negotiation completion after the initial link-change interrupt.

Fixes: 79396934e289 ("net: dsa: b53: convert to phylink_pcs")
Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 drivers/net/dsa/b53/b53_common.c | 12 ------
 drivers/net/dsa/b53/b53_priv.h   |  1 -
 drivers/net/dsa/b53/b53_serdes.c | 72 +++++++++++++++-----------------
 drivers/net/dsa/b53/b53_serdes.h |  5 +++
 drivers/net/dsa/b53/b53_srab.c   |  2 +-
 5 files changed, 40 insertions(+), 52 deletions(-)

diff --git a/drivers/net/dsa/b53/b53_common.c b/drivers/net/dsa/b53/b53_common.c
index 09de3520e71a..b04f9d5f0525 100644
--- a/drivers/net/dsa/b53/b53_common.c
+++ b/drivers/net/dsa/b53/b53_common.c
@@ -1522,18 +1522,6 @@ static void b53_adjust_5325_mii(struct dsa_switch *ds, int port)
 	}
 }
 
-void b53_port_event(struct dsa_switch *ds, int port)
-{
-	struct b53_device *dev = ds->priv;
-	bool link;
-	u16 sts;
-
-	b53_read16(dev, B53_STAT_PAGE, B53_LINK_STAT, &sts);
-	link = !!(sts & BIT(port));
-	dsa_port_phylink_mac_change(ds, port, link);
-}
-EXPORT_SYMBOL(b53_port_event);
-
 static void b53_phylink_get_caps(struct dsa_switch *ds, int port,
 				 struct phylink_config *config)
 {
diff --git a/drivers/net/dsa/b53/b53_priv.h b/drivers/net/dsa/b53/b53_priv.h
index cebbebe4ae0f..6028440e1358 100644
--- a/drivers/net/dsa/b53/b53_priv.h
+++ b/drivers/net/dsa/b53/b53_priv.h
@@ -519,7 +519,6 @@ int b53_br_flags(struct dsa_switch *ds, int port,
 		 struct switchdev_brport_flags flags,
 		 struct netlink_ext_ack *extack);
 int b53_setup_devlink_resources(struct dsa_switch *ds);
-void b53_port_event(struct dsa_switch *ds, int port);
 int b53_vlan_filtering(struct dsa_switch *ds, int port, bool vlan_filtering,
 		       struct netlink_ext_ack *extack);
 int b53_vlan_add(struct dsa_switch *ds, int port,
diff --git a/drivers/net/dsa/b53/b53_serdes.c b/drivers/net/dsa/b53/b53_serdes.c
index fc20e211e67e..c7f3e131f2de 100644
--- a/drivers/net/dsa/b53/b53_serdes.c
+++ b/drivers/net/dsa/b53/b53_serdes.c
@@ -291,50 +291,44 @@ static void b53_serdes_link_up(struct phylink_pcs *pcs, unsigned int neg_mode,
 static void b53_serdes_get_state(struct phylink_pcs *pcs, unsigned int neg_mode,
 				 struct phylink_link_state *state)
 {
-	struct b53_device *dev = pcs_to_b53_pcs(pcs)->dev;
-	u8 lane = pcs_to_b53_pcs(pcs)->lane;
-	int dig, bmsr;
-
-	dig = b53_serdes_read(dev, lane, B53_SERDES_DIGITAL_STATUS,
-			      SERDES_DIGITAL_BLK);
-	if (dig < 0) {
-		state->link = false;
-		b53_serdes_error(dev, lane, dig);
-		return;
-	}
+	struct b53_pcs *priv = pcs_to_b53_pcs(pcs);
+	struct b53_device *dev = priv->dev;
+	u8 lane = priv->lane;
+	int bmsr, lpa;
 
 	bmsr = b53_serdes_read(dev, lane, B53_SERDES_MII_REG(MII_BMSR),
 			       SERDES_MII_BLK);
-	if (bmsr < 0) {
-		state->link = false;
-		b53_serdes_error(dev, lane, bmsr);
-		return;
-	}
+	if (bmsr < 0)
+		goto error;
 
-	switch ((dig >> SPEED_STATUS_SHIFT) & SPEED_STATUS_MASK) {
-	case SPEED_STATUS_10:
-		state->speed = SPEED_10;
-		break;
-	case SPEED_STATUS_100:
-		state->speed = SPEED_100;
-		break;
-	case SPEED_STATUS_1000:
-		state->speed = SPEED_1000;
-		break;
-	default:
-	case SPEED_STATUS_2500:
-		state->speed = SPEED_2500;
-		break;
-	}
+	lpa = b53_serdes_read(dev, lane, B53_SERDES_MII_REG(MII_LPA),
+			      SERDES_MII_BLK);
+	if (lpa < 0)
+		goto error;
+
+	phylink_mii_c22_pcs_decode_state(state, neg_mode, bmsr, lpa);
+	return;
+error:
+	state->link = false;
+	state->an_complete = false;
+	b53_serdes_error(dev, lane, bmsr < 0 ? bmsr : lpa);
+}
+
+void b53_serdes_link_change(struct b53_device *dev, int port)
+{
+	u8 lane = b53_serdes_map_lane(dev, port);
+	int dig;
 
-	state->duplex = dig & DUPLEX_STATUS ? DUPLEX_FULL : DUPLEX_HALF;
-	state->an_complete = !!(bmsr & BMSR_ANEGCOMPLETE);
-	state->link = !!(dig & LINK_STATUS);
-	if (dig & PAUSE_RESOLUTION_RX_SIDE)
-		state->pause |= MLO_PAUSE_RX;
-	if (dig & PAUSE_RESOLUTION_TX_SIDE)
-		state->pause |= MLO_PAUSE_TX;
+	if (lane >= B53_N_PCS || !dev->pcs[lane].dev)
+		return;
+
+	/* Use the live PCS status, not latched BMSR or MAC override status. */
+	dig = b53_serdes_read(dev, lane, B53_SERDES_DIGITAL_STATUS,
+			      SERDES_DIGITAL_BLK);
+	b53_serdes_error(dev, lane, dig);
+	phylink_pcs_change(&dev->pcs[lane].pcs, dig >= 0 && (dig & LINK_STATUS));
 }
+EXPORT_SYMBOL(b53_serdes_link_change);
 
 static int b53_serdes_enable(struct phylink_pcs *pcs)
 {
@@ -440,6 +434,8 @@ int b53_serdes_init(struct b53_device *dev, int port)
 	pcs->dev = dev;
 	pcs->lane = lane;
 	pcs->pcs.ops = &b53_pcs_ops;
+	/* Port interrupts are optional and may precede AN completion. */
+	pcs->pcs.poll = true;
 	__set_bit(PHY_INTERFACE_MODE_SGMII, pcs->pcs.supported_interfaces);
 	__set_bit(PHY_INTERFACE_MODE_1000BASEX, pcs->pcs.supported_interfaces);
 
diff --git a/drivers/net/dsa/b53/b53_serdes.h b/drivers/net/dsa/b53/b53_serdes.h
index 2c2aa5eaa985..4016b24bcda4 100644
--- a/drivers/net/dsa/b53/b53_serdes.h
+++ b/drivers/net/dsa/b53/b53_serdes.h
@@ -119,8 +119,13 @@ struct phylink_pcs *b53_serdes_phylink_mac_select_pcs(struct b53_device *dev,
 void b53_serdes_phylink_get_caps(struct b53_device *dev, int port,
 				 struct phylink_config *config);
 #if IS_ENABLED(CONFIG_B53_SERDES)
+void b53_serdes_link_change(struct b53_device *dev, int port);
 int b53_serdes_init(struct b53_device *dev, int port);
 #else
+static inline void b53_serdes_link_change(struct b53_device *dev, int port)
+{
+}
+
 static inline int b53_serdes_init(struct b53_device *dev, int port)
 {
 	return -ENODEV;
diff --git a/drivers/net/dsa/b53/b53_srab.c b/drivers/net/dsa/b53/b53_srab.c
index 77e81e1a414a..56da3dbaf997 100644
--- a/drivers/net/dsa/b53/b53_srab.c
+++ b/drivers/net/dsa/b53/b53_srab.c
@@ -374,7 +374,7 @@ static irqreturn_t b53_srab_port_thread(int irq, void *dev_id)
 	struct b53_device *dev = port->dev;
 
 	if (port->mode == PHY_INTERFACE_MODE_SGMII)
-		b53_port_event(dev->ds, port->num);
+		b53_serdes_link_change(dev, port->num);
 
 	return IRQ_HANDLED;
 }
-- 
2.53.0

