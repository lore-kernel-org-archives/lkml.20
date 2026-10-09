Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7025E2F9D98
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 00:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791507358; cv=none; b=dbkXK0nwSeNoO/CgyNviKUfqruXzcv0HO1C78a5nlDx5x740YT0zmwnhqC+et369dKjivYbGGijLl0KSXZ90ZKBEDMV0X0Va/bDjcpDJehneCw/PSj8m1Kh4B/RFNDiDXXEWpr05Nv32whICXl/SMEgc6OPxPygivWgPJQiVv2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791507358; c=relaxed/simple;
	bh=JXPVqttvvX6plFtTAXjvqOhVSR9/yO7AFcR4A3BClpI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZEV0OXwPV/4rSZBu91duHBFWsZTMtsYn85/1sAeSATMDFktXCvHdV4mUKBBGEqxCSGBqGKOFBZnCqsQGvoOdFtQgg2H3QteWXQuZz37xldwb9jqgjTjNRA8UDws044IY5t1AhPlRVPejZbPxiuMtunL2pqVeML6Is5F/TrKAHG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XWD5Fr7H; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XWD5Fr7H"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2e812e2b31bso7899735ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 17:55:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791507351; x=1792112151; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=04vfIiU20tq2if36IO5LbwjL3l6PLEbsF088tIv0Xr8=;
        b=XWD5Fr7HkF4qZ6eRJhjuxAPoe1MREQgay2fB9W2vxOE8dl07E6OaUxeCVVC78tISE/
         PVjQ9iUiiwk+zfpZK2Odg2C9Hutj0SDiCA9y4eSgMc3tIsJRa3ns6/L0EeD2lxC+hWdl
         f5B3h4d51nBEecYNAw3xgUQk/IynGcP9lIgKuLktlBMxWcF/nfHGZUMgxeCO6Mgn9t30
         SUp3m1sEeAD6YHvb4UzkJ+lde041iz4UiYS0ilRzjFF/cf1oEeMegzGIQHddwMIkcQo6
         NCj5ewfOAGrStY+Mawaxm/LIpsr/mEh1RWghYu8bVI3MEd/QbzXom+kRDWEfdev0B3tF
         9RGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791507351; x=1792112151;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=04vfIiU20tq2if36IO5LbwjL3l6PLEbsF088tIv0Xr8=;
        b=m6Q2n5gj5ZJibzG/dutuxFhvU9Qm2eu2sYI5UMAxBhRg23Tm2PEXCSss222P+ba+S0
         zGGrhX4E6H+XX4O8/FzSK0T4+utz5kKmog81ETq7cJ1LtcxV0r4k2+9V4ZYwyBEv7GUb
         oBJ0lQCOAMpDOQsaXDHWeyFMC1ARXdGKCDinbyQGy+aQQSaxo2ELU4mqykNsOW9KW/OJ
         2LvrMDroRNjjJocxDjklGLJM39VaueAHBERPh8EtzB/6AKAbwO/Iuw1/NVL38GK50Ku/
         oadhK15LzSwUBY/u2utF27MflyDN1glm4RUuP1lqMovcji2F/Kz51r+JVVHKOcCW45Wc
         Mb1w==
X-Forwarded-Encrypted: i=1; AKwUvBzVzMoNbwSF2CBpahm8lZd6R16EGBSZ1/gm7ps674gaZWUfBkBJHSLkuW9ftdhdItAR/XmVhjg4dlssp+g=@vger.kernel.org
X-Gm-Message-State: AFq9FYJBsCPUlZjxbtD+xWjgIEwU16Yjk3NCoT/QGQt8I/DH43XONDOG
	Mpv4eeG8WluyFnr23a3OpmLZ0QVoYeEy0rKH64bommvyL6KOesbiWN98CF4wRRfRGuA=
X-Gm-Gg: AYBFou02ykyfPncj2mD/P8FMTQLJc7CBZ6UYr0fINwc56EZQQocVeiteporCOOQumKT
	DrpM2+Qd3HOhFuWOVSRm7G5OzuCzAOHeh/TtxCp61eqiNWBal7qr6zwr6b2oAAqI9sLM9TSg47d
	ecUK6M09w63IJcNQXpJ6aTRX6gumLvG/AXmSSaQ8yHs1c3H0tnvy1IzVQUrVgab4UULJo/ixvXy
	irX7kPM5mBsr1ZtIQ5ezToPLbUUtwmYBTqEVwWcpAB7v5Vw9cuhMqDtUXD1vwE38QmZfHlmpfVW
	/52wnpxtepMtPYAal++JbGEJxgdqUOLFTNzuGdZbz9EvkigpLwlEp5RQbVWCOeZvV30EFhjoDkw
	MPGjoumqw6OH+CUpS2FemeFJbdnzXFF02SeqJ43a+WJ4Qfv83Tb0rhFDXrPOGtHLIQLca7jnV+C
	2ecT+WpKqXZXGN6uCbnRLMes3mob+RoJ3ZW0RtwwEmNOOhQrqiTxGA1V2TgJwiUO2clmjM2lIZ/
	Fl1HWKTZ1jDevlqXxRCd3fEWGIscejNUKUv
X-Received: by 2002:a17:902:f70f:b0:2df:35f1:8771 with SMTP id d9443c01a7336-2e842dfe4d2mr2440645ad.54.1791507350458;
        Thu, 08 Oct 2026 17:55:50 -0700 (PDT)
Received: from d.home.yangfl.dn42 ([2a09:bac5:661c:1246::1d2:d1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e84219e8c9sm1374625ad.23.2026.10.08.17.55.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 17:55:49 -0700 (PDT)
From: David Yang <mmyangfl@gmail.com>
To: netdev@vger.kernel.org
Cc: David Yang <mmyangfl@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next] net: dsa: motorcomm: Add BR_FLOOD and BR_MCAST_FLOOD support
Date: Fri,  9 Oct 2026 08:55:38 +0800
Message-ID: <20261009005542.72860-1-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Let the hardware flood the unknown unicast / multicast if all other
ports in the bridge have BR_FLOOD / BR_MCAST_FLOOD enabled.

Signed-off-by: David Yang <mmyangfl@gmail.com>
---
 drivers/net/dsa/motorcomm/chip.c | 142 +++++++++++++++++++++++++------
 drivers/net/dsa/motorcomm/chip.h |   4 +
 2 files changed, 122 insertions(+), 24 deletions(-)

diff --git a/drivers/net/dsa/motorcomm/chip.c b/drivers/net/dsa/motorcomm/chip.c
index 91cc5647f2b6..980d066a4bea 100644
--- a/drivers/net/dsa/motorcomm/chip.c
+++ b/drivers/net/dsa/motorcomm/chip.c
@@ -2616,6 +2616,7 @@ yt921x_dsa_port_vlan_add(struct dsa_switch *ds, int port,
 
 static int yt921x_userport_standalone(struct yt921x_priv *priv, int port)
 {
+	struct yt921x_port *pp = &priv->ports[port];
 	u32 mask;
 	u32 ctrl;
 	int res;
@@ -2643,6 +2644,17 @@ static int yt921x_userport_standalone(struct yt921x_priv *priv, int port)
 	if (res)
 		return res;
 
+	mask = BIT(port);
+	res = yt921x_reg_clear_bits(priv, YT921X_FILTER_UNK_UCAST, mask);
+	if (res)
+		return res;
+	res = yt921x_reg_clear_bits(priv, YT921X_FILTER_UNK_MCAST, mask);
+	if (res)
+		return res;
+
+	pp->flood = true;
+	pp->mcast_flood = true;
+
 	return 0;
 }
 
@@ -2721,6 +2733,61 @@ static int yt921x_bridge(struct yt921x_priv *priv, u16 ports_mask)
 	return 0;
 }
 
+static int
+yt921x_bridge_flood_set_type(struct yt921x_priv *priv, u16 ports_mask, int type)
+{
+	unsigned long targets_mask;
+	u16 flood_ports_xor;
+	u32 filter_ctrl;
+	u16 flood_mask;
+	u32 addr;
+	int port;
+	int res;
+
+	ports_mask &= ~priv->cpu_ports_mask;
+
+	flood_mask = 0;
+	targets_mask = ports_mask;
+	for_each_set_bit(port, &targets_mask, YT921X_PORT_NUM) {
+		struct yt921x_port *pp = &priv->ports[port];
+
+		if (!type ? pp->flood : pp->mcast_flood)
+			flood_mask |= BIT(port);
+	}
+
+	flood_ports_xor = flood_mask ^ ports_mask;
+	filter_ctrl = 0;
+	targets_mask = ports_mask;
+	for_each_set_bit(port, &targets_mask, YT921X_PORT_NUM) {
+		if (!(flood_ports_xor & ~BIT(port)))
+			continue;
+
+		filter_ctrl |= BIT(port);
+	}
+
+	addr = !type ? YT921X_FILTER_UNK_UCAST : YT921X_FILTER_UNK_MCAST;
+	res = yt921x_reg_update_bits(priv, addr, ports_mask, filter_ctrl);
+	if (res)
+		return res;
+
+	/* ACT_UNK is TRAP for every user port; see yt921x_chip_setup_dsa() */
+
+	return 0;
+}
+
+static int yt921x_bridge_flood_set(struct yt921x_priv *priv, u16 ports_mask)
+{
+	int res;
+
+	for (int type = 0; type < 2; type++) {
+		res = yt921x_bridge_flood_set_type(priv, ports_mask, type);
+		if (res)
+			return res;
+	}
+
+	return 0;
+}
+
 static int yt921x_bridge_leave(struct yt921x_priv *priv, int port)
 {
 	int res;
@@ -2733,6 +2800,12 @@ static int yt921x_bridge_leave(struct yt921x_priv *priv, int port)
 	if (res)
 		return res;
 
+	/* By the time port_bridge_leave() is called, the port is already
+	 * unbridged, thus we cannot recompute flood flags for the affected
+	 * bridge. This leaves some sub-optimality, but the flood will still
+	 * be handled (by the CPU).
+	 */
+
 	return 0;
 }
 
@@ -2749,6 +2822,10 @@ yt921x_bridge_join(struct yt921x_priv *priv, int port, u16 ports_mask)
 	if (res)
 		return res;
 
+	res = yt921x_bridge_flood_set(priv, ports_mask);
+	if (res)
+		return res;
+
 	return 0;
 }
 
@@ -2757,7 +2834,12 @@ yt921x_bridge_flags(struct yt921x_priv *priv, int port,
 		    struct switchdev_brport_flags flags)
 {
 	struct yt921x_port *pp = &priv->ports[port];
-	bool do_flush;
+	struct dsa_switch *ds = &priv->ds;
+	struct net_device *bdev;
+	bool change_isolated;
+	struct dsa_port *dp;
+	bool change_flood;
+	u32 ports_mask;
 	u32 mask;
 	int res;
 
@@ -2771,36 +2853,48 @@ yt921x_bridge_flags(struct yt921x_priv *priv, int port,
 			return res;
 	}
 
-	/* BR_FLOOD, BR_MCAST_FLOOD: see the comment where ACT_UNK_ACTn_TRAP
-	 * is set
-	 */
-
 	/* BR_BCAST_FLOOD: we can filter bcast, but cannot trap them */
 
-	do_flush = false;
+	change_isolated = false;
 	if (flags.mask & BR_HAIRPIN_MODE) {
 		pp->hairpin = flags.val & BR_HAIRPIN_MODE;
-		do_flush = true;
+		change_isolated = true;
 	}
 	if (flags.mask & BR_ISOLATED) {
 		pp->isolated = flags.val & BR_ISOLATED;
-		do_flush = true;
+		change_isolated = true;
 	}
-	if (do_flush) {
-		struct dsa_switch *ds = &priv->ds;
-		struct dsa_port *dp = dsa_to_port(ds, port);
-		struct net_device *bdev;
 
-		bdev = dsa_port_bridge_dev_get(dp);
-		if (bdev) {
-			u32 ports_mask;
+	change_flood = false;
+	if (flags.mask & BR_FLOOD) {
+		pp->flood = flags.val & BR_FLOOD;
+		change_flood = true;
+	}
+	if (flags.mask & BR_MCAST_FLOOD) {
+		pp->mcast_flood = flags.val & BR_MCAST_FLOOD;
+		change_flood = true;
+	}
 
-			ports_mask = dsa_bridge_ports(ds, bdev);
-			ports_mask |= priv->cpu_ports_mask;
-			res = yt921x_bridge(priv, ports_mask);
-			if (res)
-				return res;
-		}
+	if (!change_isolated && !change_flood)
+		return 0;
+
+	bdev = dsa_port_bridge_dev_get(dp);
+	if (!bdev)
+		return 0;
+
+	dp = dsa_to_port(ds, port);
+	ports_mask = dsa_bridge_ports(ds, bdev);
+	ports_mask |= priv->cpu_ports_mask;
+
+	if (change_isolated) {
+		res = yt921x_bridge(priv, ports_mask);
+		if (res)
+			return res;
+	}
+	if (change_flood) {
+		res = yt921x_bridge_flood_set(priv, ports_mask);
+		if (res)
+			return res;
 	}
 
 	return 0;
@@ -3757,9 +3851,9 @@ static int yt921x_chip_setup_dsa(struct yt921x_priv *priv)
 	 * the "bridged" ports, thus we need to trap and handle those packets by
 	 * software.
 	 *
-	 * If there is no more than one bridge, we might be able to drop them
-	 * directly given some conditions are met, but we trap them in all cases
-	 * for now.
+	 * In some cases, we may offload the flood action to the hardware. This
+	 * is done by fixing UNK_ACT to TRAP, and toggling the FILTER_UNK on the
+	 * appropriate ports.
 	 */
 	ctrl = 0;
 	for (int i = 0; i < YT921X_PORT_NUM; i++)
diff --git a/drivers/net/dsa/motorcomm/chip.h b/drivers/net/dsa/motorcomm/chip.h
index 25ff77054de3..85b658492f0c 100644
--- a/drivers/net/dsa/motorcomm/chip.h
+++ b/drivers/net/dsa/motorcomm/chip.h
@@ -801,6 +801,10 @@ struct yt921x_port {
 	bool hairpin:1;
 	/* BR_ISOLATED */
 	bool isolated:1;
+	/* BR_FLOOD */
+	bool flood:1;
+	/* BR_MCAST_FLOOD */
+	bool mcast_flood:1;
 
 #if IS_ENABLED(CONFIG_NET_DSA_YT921X_LEDS)
 	unsigned char led_duty;
-- 
2.53.0

