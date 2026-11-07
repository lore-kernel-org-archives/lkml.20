Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794053860;
	b=LPiTd0PUL2un2tWTfLzIOWZ1C5/8bfmrhgPy+UcVFnUyIGi/brCVt3goRoYtoo+iHPfs
	 WZOK6c2b5lkFi1oapLslZzoLLDBFh0plMoWLk2R8e+cmXM72gBcr/yu3AFxJG5ug9MxxT
	 z2lwOVWE5coLf3K8zsg8aLXdXmmun68P669A/6fxJxF9XBkVtvTgEaTAdrvRTSEa1Vdeg
	 lU+EvFIukxuwa0v+kpZdbHnaVtjbr9ZP4ZrXm7HMcGgkp0D/ECJ9IqaZpaxnd55wZmPs0
	 FPLSbnjVSHWGi/6+Acu3sB8nxjGjj+ynDyuHR4bUXScmLLIxbBhN9ikkQ3GqQZG7GFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794053860;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=pQyY8GK5R5URCxxYgWhFyAs3C+EHxICa0tbkBaq1Rkg=;
	b=uQs144atcROrZWgMzeOr8Bvc/VJ3dm6k3KR7v7gF5CD4Do689oGk4svriZJMUm/XZoSz
	 nP5j+xz7jq0VAboTb/1+AfwurEV9Buqn7xBm28CtRdzQM9wBRdj9F7eWt7XqCFzrd+JjE
	 kBSiMZVHd4OkEkxymfxvT+Zdl91pBWJqXrQxnk3RSt05cCXxCXPo2v6LoJYG7Qsw2+ymi
	 U0gWuldB5BRKW0q+xw+OR1Uy5bdABsE18Fs6TJjg1bkQQ+RIpP0+Coa172AGPTurIbI5L
	 r7MBaeJbCVGDTJMWf3A06/9vQ22hchz0HcrGvPRM1NIhNN+2TMeGl8vCoXKlr5eYWgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fnWoj5Wg;
	arc=none smtp.remote-ip=209.85.214.182
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2445606A32D
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 12:17:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2445606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fnWoj5Wg
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2e987b4a710so1985475ad.1
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 04:17:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794053859; x=1794658659; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pQyY8GK5R5URCxxYgWhFyAs3C+EHxICa0tbkBaq1Rkg=;
        b=fnWoj5WgnG+gBWgE/Z4AdjYVoRR4mw+/ESMVszeO33AHTJiKQ6409K3eH1dT9GdMHZ
         HkcAUwMkoBmOJcfRouN1NFi7t/g9uTygn26A//T1daPYlhEDL7gCohzbXhskpnCGn+MG
         skSXGnkNaFGBWZVnYzCdKehlxf4TTC/TTceeE+cpuDMbi1zCvp2Q0+dcZ1EoMzajnWAf
         h4vxGF7B8dm3LU/IggGSX2fJBkWaIVAzuKj4LRdx4x9dCLYLOzQXJ79DoP/rCBwbCS4f
         2l/MgmO6fR9QLmoMdplYCAXZim6jSBtFAhzU6aHgdDMihuE6ADLFNWaU31cc7qg1sxvh
         E+Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794053859; x=1794658659;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pQyY8GK5R5URCxxYgWhFyAs3C+EHxICa0tbkBaq1Rkg=;
        b=07hf9ole3s2Va7ip6Wz6Q4W3+/eIVHKPdfZW5yrMPgTwVqfhlILa20lFR5WvMUFJsJ
         zgRhGOz5aJfklckun75i2hysWEzV/DOGA+NtVy+5SAhsXHkgUeWkeEdmrEzQZZlH8Iar
         LQGipsoOU0ZW0iBbKH2Ntw+IiIVxAOd5ryTPpWI3gq0NMBl9PdOdjy0aLG7qlzDH8luu
         jDKkxivMLmRV7c/AGnd4psdw0OcEAKRSrioc8CxHFlX9ML1NuU86Ti5qaeBjEz7Rv3SA
         DOOZIWaf6mUs8tmNGOgVelRc5r/kNC9nkQiWY+A5clFfq9zlCbdC8c5q8I/r72wyi+GW
         WXvg==
X-Forwarded-Encrypted: i=1; AL+hErG8B9SvjmmH1DEtfX8+MH+avTtdltEDyYtfn+wwgHGhoQLyD3EWsfNcoyBMpVdiVlyZoswxNfbvs6lY22Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z8AKCwoRL6CIi/2ZsjS7Ryv32NeIGOY/B4XDXA5AB//KrUIwumk
	jdWdmC/TXxq8du3OpLVQzDGBthrntbAfyYWE4LGKgr2nyxbLLRl3VMOr
X-Gm-Gg: AYBFou2ribhtXnKh7zMokwVpLwZpVTODZjEaChGhDvdOeEhOK5e+igi/FvquKLoUBj1
	5/NpEV+M3iSnl3XaCN2gpnEtwqTLDmPR2w6pxLux6B7GEbBnT7MRG4Rt+OMvlpermG+xqwA4kWM
	6fajJIdqwKaqJIbxDgZgQX/9z2naAjnzbkFa2d+Spuwea0jo3dsPELrpSeD89BSf0xc5glcmYIA
	APDCKsmnQF+Pi+C+nPQjoToMWKAHuk68y8zONmRuuK9mKWD9JUZ7sFTR/QauyJxWnC3a8Gxa6mk
	iEsFdDyrsMkoUVbed31aGRclpsAgQdGBkACDodo+2o8vXn07KS7bEAwVRPSp5HVy7ZI5StqE6tt
	Y9RaJsK+PNZt4aTQBgXT6NQePyOee+vBsXu9q0PSQZ8LnE5DMZUyotdEg3k2EmpvglhvEopbj8q
	4ptWJAv4dCgv/VeSDJ3HK0ERwSepczrD3/g/XiW4RTgVThu5hGRGOWA6AeU+UKAkt6R7PbcyCS/
	H6gIe7UKVuoqQ/DIba87VZnRxEsd87B3PuylfyrdLiEypccJ3LECbCaen88di/0okWhuJrEJo3Y
	CBn5r7ZUTfF5WXrKOjGgcIH/7CCd7mF7m0aGRKMfqmVXpcTYo2f+fg==
X-Received: by 2002:a17:903:1a67:b0:2ed:1df2:8b3e with SMTP id d9443c01a7336-2ed67c21c21mr13449005ad.34.1794053859129;
        Sat, 07 Nov 2026 04:17:39 -0800 (PST)
Received: from d.home.yangfl.dn42 ([2a09:bac1:76a0:28::1d2:30])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed47d5f35asm12773555ad.49.2026.11.07.04.17.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 04:17:38 -0800 (PST)
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
Subject: [PATCH net-next v4 8/8] net: dsa: motorcomm: Support BR_FLOOD and BR_MCAST_FLOOD offloading
Date: Sat,  7 Nov 2026 20:16:29 +0800
Message-ID: <20261107121631.1040612-9-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261107121631.1040612-1-mmyangfl@gmail.com>
References: <20261107121631.1040612-1-mmyangfl@gmail.com>
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

Let the hardware flood the unknown unicast / multicast for the port if:

- the switch carries only one bridge, otherwise frames hitting FDB entry
  from another bridge will be dropped;
- all other ports in the bridge have BR_FLOOD / BR_MCAST_FLOOD enabled;
- the port is not hairpined, as the hardware never floods back to its
  ingress port.

This should cover most single-bridge usage. Other data paths remain
unchanged in terms of behavior.

Signed-off-by: David Yang <mmyangfl@gmail.com>
---
 drivers/net/dsa/motorcomm/chip.c | 180 +++++++++++++++++++++++++------
 drivers/net/dsa/motorcomm/chip.h |   4 +
 2 files changed, 150 insertions(+), 34 deletions(-)

diff --git a/drivers/net/dsa/motorcomm/chip.c b/drivers/net/dsa/motorcomm/chip.c
index e41fe4859bfe..5fed5b5a2feb 100644
--- a/drivers/net/dsa/motorcomm/chip.c
+++ b/drivers/net/dsa/motorcomm/chip.c
@@ -1185,6 +1185,8 @@ static int yt921x_userport_standalone(struct yt921x_priv *priv, int port)
 	 */
 	pp->hairpin = false;
 	pp->isolated = false;
+	pp->flood = true;
+	pp->mcast_flood = true;
 
 	/* Conduit ports should by controlled by tagging completely, skip
 	 * setting isolation to preserve the one-way isolation installed
@@ -1209,13 +1211,17 @@ static int yt921x_userport_standalone(struct yt921x_priv *priv, int port)
 	if (res)
 		return res;
 
-	/* Unrelated since learning is off and all packets are trapped;
-	 * set it anyway
+	/* Unrelated since learning is off and there is only one possible
+	 * destination; set it anyway
 	 */
 	res = yt921x_port_set_pvid(priv, port, YT921X_VID_UNWARE);
 	if (res)
 		return res;
 
+	/* Also unrelated for FILTER_UNK_UCAST / FILTER_UNK_MCAST since all
+	 * packets are handled by software
+	 */
+
 	return 0;
 }
 
@@ -1232,6 +1238,96 @@ static int yt921x_userport_bridge(struct yt921x_priv *priv, int port)
 	return 0;
 }
 
+/* ports_mask is optional */
+static int yt921x_bridge_flood_set(struct yt921x_priv *priv, u16 ports_mask)
+{
+	struct dsa_bridge *bridges[YT921X_PORT_NUM];
+	struct dsa_switch *ds = &priv->ds;
+	struct dsa_port *dp;
+	unsigned int count;
+	u32 ctrl;
+	int res;
+	int ret;
+
+	/* Offloading is only enabled if there is at most 1 bridge - see the
+	 * cross-bridge FDB mismatch below. (0 does nothing, of course.)
+	 */
+	count = 0;
+	dsa_switch_for_each_user_port(dp, ds) {
+		unsigned int i;
+
+		if (!dp->bridge)
+			continue;
+
+		for (i = 0; i < count; i++)
+			if (bridges[i] == dp->bridge)
+				break;
+		if (i == count) {
+			bridges[count] = dp->bridge;
+			count++;
+		}
+	}
+
+	ret = 0;
+	if (count != 1) {
+		ctrl = ~(u32)0;
+		res = yt921x_reg_write(priv, YT921X_FILTER_UNK_UCAST, ctrl);
+		if (res)
+			ret = res;
+		res = yt921x_reg_write(priv, YT921X_FILTER_UNK_MCAST, ctrl);
+		if (res)
+			ret = res;
+		return ret;
+	}
+
+	ports_mask &= ~dsa_cpu_ports(ds);
+	if (!ports_mask)
+		ports_mask = dsa_bridge_ports(ds, bridges[0]->dev);
+
+	for (int type = 0; type < 2; type++) {
+		unsigned long targets_mask = ports_mask;
+		u16 flood_mask;
+		u32 addr;
+		int port;
+
+		addr = !type ? YT921X_FILTER_UNK_UCAST :
+		       YT921X_FILTER_UNK_MCAST;
+
+		flood_mask = 0;
+		for_each_set_bit(port, &targets_mask, YT921X_PORT_NUM) {
+			struct yt921x_port *pp = &priv->ports[port];
+
+			if (!type ? pp->flood : pp->mcast_flood)
+				flood_mask |= BIT(port);
+		}
+
+		ctrl = 0;
+		for_each_set_bit(port, &targets_mask, YT921X_PORT_NUM) {
+			struct yt921x_port *pp = &priv->ports[port];
+
+			/* Hardware never floods back to its own ingress port,
+			 * keep hairpin port trapped: the software bridge does
+			 * deliver a flood there.
+			 */
+			if (!pp->hairpin && !((flood_mask ^ ports_mask) &
+					      ~BIT(port)))
+				continue;
+
+			ctrl |= BIT(port);
+		}
+
+		/* ACT_UNK is fixed to TRAP for every port, see
+		 * yt921x_chip_setup_dsa().
+		 */
+
+		res = yt921x_reg_update_bits(priv, addr, ports_mask, ctrl);
+		if (res)
+			ret = res;
+	}
+
+	return ret;
+}
+
 static int yt921x_isolate(struct yt921x_priv *priv, int port)
 {
 	u32 mask;
@@ -1306,6 +1402,10 @@ static int yt921x_bridge_leave(struct yt921x_priv *priv, int port)
 	if (res)
 		return res;
 
+	res = yt921x_bridge_flood_set(priv, 0);
+	if (res)
+		return res;
+
 	return 0;
 }
 
@@ -1322,6 +1422,10 @@ yt921x_bridge_join(struct yt921x_priv *priv, int port, u16 ports_mask)
 	if (res)
 		return res;
 
+	res = yt921x_bridge_flood_set(priv, ports_mask);
+	if (res)
+		return res;
+
 	return 0;
 }
 
@@ -1330,7 +1434,12 @@ yt921x_bridge_flags(struct yt921x_priv *priv, int port,
 		    struct switchdev_brport_flags flags)
 {
 	struct yt921x_port *pp = &priv->ports[port];
-	bool do_flush;
+	struct dsa_switch *ds = &priv->ds;
+	bool change_isolated = false;
+	bool change_flood = false;
+	struct net_device *bdev;
+	struct dsa_port *dp;
+	u32 ports_mask;
 	u32 mask;
 	int res;
 
@@ -1344,36 +1453,48 @@ yt921x_bridge_flags(struct yt921x_priv *priv, int port,
 			return res;
 	}
 
-	/* BR_FLOOD, BR_MCAST_FLOOD: see the comment where ACT_UNK_ACTn_TRAP
-	 * is set
-	 */
-
 	/* BR_BCAST_FLOOD: we can filter bcast, but cannot trap them */
 
-	do_flush = false;
 	if (flags.mask & BR_HAIRPIN_MODE) {
 		pp->hairpin = flags.val & BR_HAIRPIN_MODE;
-		do_flush = true;
+		change_isolated = true;
+		/* Hairpin also affects flood flags */
+		change_flood = true;
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
+	if (flags.mask & BR_FLOOD) {
+		pp->flood = flags.val & BR_FLOOD;
+		change_flood = true;
+	}
+	if (flags.mask & BR_MCAST_FLOOD) {
+		pp->mcast_flood = flags.val & BR_MCAST_FLOOD;
+		change_flood = true;
+	}
 
-			ports_mask = dsa_bridge_ports(ds, bdev);
-			ports_mask |= dsa_cpu_ports(ds);
-			res = yt921x_bridge(priv, ports_mask);
-			if (res)
-				return res;
-		}
+	if (!change_isolated && !change_flood)
+		return 0;
+
+	dp = dsa_to_port(ds, port);
+	bdev = dsa_port_bridge_dev_get(dp);
+	if (!bdev)
+		return 0;
+
+	ports_mask = dsa_bridge_ports(ds, bdev);
+	ports_mask |= dsa_cpu_ports(ds);
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
@@ -2301,14 +2422,6 @@ static int yt921x_chip_setup_dsa(struct yt921x_priv *priv)
 	if (res)
 		return res;
 
-	ctrl = GENMASK(10, 0) & ~cpu_ports_mask;
-	res = yt921x_reg_write(priv, YT921X_FILTER_UNK_UCAST, ctrl);
-	if (res)
-		return res;
-	res = yt921x_reg_write(priv, YT921X_FILTER_UNK_MCAST, ctrl);
-	if (res)
-		return res;
-
 	/* YT921x does not support native DSA port bridging, so we use port
 	 * isolation to emulate it. However, be especially careful that port
 	 * isolation takes _after_ FDB lookups, i.e. if an FDB entry (from
@@ -2317,9 +2430,8 @@ static int yt921x_chip_setup_dsa(struct yt921x_priv *priv)
 	 * the "bridged" ports, thus we need to trap and handle those packets by
 	 * software.
 	 *
-	 * If there is no more than one bridge, we might be able to drop them
-	 * directly given some conditions are met, but we trap them in all cases
-	 * for now.
+	 * The flood action is offloaded to the hardware by fixing UNK_ACT to
+	 * TRAP and toggling the FILTER_UNK on the appropriate ports.
 	 */
 	ctrl = 0;
 	for (int i = 0; i < YT921X_PORT_NUM; i++)
diff --git a/drivers/net/dsa/motorcomm/chip.h b/drivers/net/dsa/motorcomm/chip.h
index ab6f28d057cb..98fe8250e99a 100644
--- a/drivers/net/dsa/motorcomm/chip.h
+++ b/drivers/net/dsa/motorcomm/chip.h
@@ -461,6 +461,10 @@ struct yt921x_port {
 	bool hairpin:1;
 	/* BR_ISOLATED */
 	bool isolated:1;
+	/* BR_FLOOD */
+	bool flood:1;
+	/* BR_MCAST_FLOOD */
+	bool mcast_flood:1;
 
 	unsigned short acl_cnt;
 
-- 
2.53.0

