Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C69CA23ABBE
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 03:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791687766; cv=none; b=LJKUmzQasMZVhSd/a0fBhNXWg5BCFRCHXBYFjX5gvxSbJ87VczOO+Ik70wEHTJtVTk0XCvI50nPLrG36/hqI9P+PF43kuPm9hgBaNSogdOgmrr0yto0qSB+Un73OHQw+LsNR0yxVXIuT+ErBAmjCjx+c+qDDUOc25B/f5a5PY7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791687766; c=relaxed/simple;
	bh=oKhxBRgHdjYAXMpx0jtk/R6RJvqtQL4qz2v0Y/aI76k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dWJ7CBHRpHpVPYEdMge2EZb8gG6EnRjtoOys9eLcAEJsBCF60gSKcSRUiyvHkapa7AwcCK9bO2FX0g0NZz9CmX5zKL1Zh9Arp5rbENm4AtU+dgcmSvgHsGeWI9jwh8mQxTaoMO+WYKA5IqEWCD1xUKl9RgH/aYlZu/t/hO9HN/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gi6jAxa2; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gi6jAxa2"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2e82462a3f1so4621615ad.3
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 20:02:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791687764; x=1792292564; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9DCLy4jF4I0VPwoovH8To1nKzlQLurgH916f6BmtgCA=;
        b=Gi6jAxa2tOgPt0Yey6UnGrqxi6S0p4xhqioaBVLRBpJ6itUX2m0pd9jAh61NFjTBU/
         YuIyTsLzrJrWavE4bZLohBvfMj6PjAR3zXSLyl5P9XKsvNgiKTBOTTBRmCEWb5ClcoDb
         7NrEWoEjJK3mwmnXkNqCIwUjpGKNaZn3LlAIJPgu298g7xV7EklaKwl2v8WI/iBCZhIo
         sdPMzlYJQuuNmFFGz4UCWFYPHX4JKAMEb9ey1zLK/4riJx+xtiObJS/2ZuL6IlkIBIIw
         32eZlNiCTtHus35XUaNCj6KCdEiMbIX9o7fv40aEHfuK99j+eMEH4pFd5WofRlX+oThW
         h7EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791687764; x=1792292564;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9DCLy4jF4I0VPwoovH8To1nKzlQLurgH916f6BmtgCA=;
        b=DVfQ8bZ8Z1rp0xocl8Ajz58ZacAUPwPASpoh5o4/GU374JGAupYbh6h/dW4q993MAF
         R4EON6UrsQJUWJXgUhDV2UnfT1HPZliOGZcN3kZJT/sc3p6Dga/w+4eCxymjDL7qJl3f
         SdFSlxXWKx3WU+7a7RUBtFjz2qaGgdBuPdqnE5/9sBxVr3x+GgklTcAbj5Q8etQUN7xh
         4DjLeDG/GSgSTai0xZ7M1BBR7pSCL82BahUshhFwclo+WCZoiIgnsoyrm3RTfOcS1fhr
         4VsNWsA8X7YOCDfuTYETYHNnKf/F8JA+UlKMTClPArY1uhm2zH5H+JskaDkCVRf3V/L/
         RzxA==
X-Forwarded-Encrypted: i=1; AKwUvByIBT4j1YMPoZpz+mGuSucwtBKPui/TQpms7Tx3x76pu7Ksn59uJtovGKyeJaUn3fL/wTD3v/hL5+jJ5rg=@vger.kernel.org
X-Gm-Message-State: AFq9FYIUukdg9NxC+oA+T3liIXKx/EPanNhayQiSmP83PZSChuHxgcxt
	GjPuX5ygrset1iPgwq28eDJq95enAzCuLlednrpBUBSROL8ZdpdpgTck
X-Gm-Gg: AYBFou2x3yzUO2OST2iSEsNC5+9RXpoehd7wjoitmCBo1AcqtZirqiZ7P4DUVvKaRW/
	fZtXfC2w+hnmv2EiWrjkSc6cpY7Jz5HgvHV9+j2FlQpuTweL/Nca7pbVbLb9FSNbxx66D32NRod
	oYpB8cjn0QPqZoaru6n/Z/gyhI96ZUPlFUEiyYZk6+twyqD+nqL2qSvMa9s6eZZtBVOJ6V61eTG
	fdtMshb3aRtkJdPpEyzMlt4kVQO7c9eVy4i3wrjSiwVCs0MHZk7+tQqq/hoPt04o4ZDye9B/hG+
	u+HmY5iI3vVAXA7NW4f+Or9dlEc/5IEjBjBehIvd8WfPMkFZP3PTEZ5IoWkkQtXSSFsM1AHgb40
	LlIcMzo+mFDNIxJzQFJqzmUI4x6CcL0B0KtFHhrf9q7GqXmIdduETR21xB/XoDklcO5AmMwgQJa
	8OSfx9NUMraYBuPzJsO408lzdCH0xXr0RrrNIHWUhGbx3q45rRVduU0u+FGWPULekHkMPak+Qgi
	sTZdlPpGWKCiiyiO3iJv+78OBE=
X-Received: by 2002:a17:90b:1a90:b0:39e:6a80:dd9d with SMTP id 98e67ed59e1d1-3ab3a9aa92bmr6112149a91.36.1791687763967;
        Sat, 10 Oct 2026 20:02:43 -0700 (PDT)
Received: from d.home.yangfl.dn42 ([2a09:bac5:661c:1246::1d2:d1])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab36ed0daesm10564389a91.5.2026.10.10.20.02.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 20:02:43 -0700 (PDT)
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
Subject: [PATCH net-next v2] net: dsa: motorcomm: Add BR_FLOOD and BR_MCAST_FLOOD support
Date: Sun, 11 Oct 2026 11:02:25 +0800
Message-ID: <20261011030228.2761810-1-mmyangfl@gmail.com>
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
v2:
  - fix build error
v1: https://lore.kernel.org/r/20261009005542.72860-1-mmyangfl@gmail.com
 drivers/net/dsa/motorcomm/chip.c | 143 +++++++++++++++++++++++++------
 drivers/net/dsa/motorcomm/chip.h |   4 +
 2 files changed, 123 insertions(+), 24 deletions(-)

diff --git a/drivers/net/dsa/motorcomm/chip.c b/drivers/net/dsa/motorcomm/chip.c
index 91cc5647f2b6..e48189f841a0 100644
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
 
@@ -2721,6 +2733,62 @@ static int yt921x_bridge(struct yt921x_priv *priv, u16 ports_mask)
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
+	int ret;
+
+	ret = 0;
+	for (int type = 0; type < 2; type++) {
+		res = yt921x_bridge_flood_set_type(priv, ports_mask, type);
+		if (res)
+			ret = res;
+	}
+	return ret;
+}
+
 static int yt921x_bridge_leave(struct yt921x_priv *priv, int port)
 {
 	int res;
@@ -2733,6 +2801,12 @@ static int yt921x_bridge_leave(struct yt921x_priv *priv, int port)
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
 
@@ -2749,6 +2823,10 @@ yt921x_bridge_join(struct yt921x_priv *priv, int port, u16 ports_mask)
 	if (res)
 		return res;
 
+	res = yt921x_bridge_flood_set(priv, ports_mask);
+	if (res)
+		return res;
+
 	return 0;
 }
 
@@ -2757,7 +2835,12 @@ yt921x_bridge_flags(struct yt921x_priv *priv, int port,
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
 
@@ -2771,36 +2854,48 @@ yt921x_bridge_flags(struct yt921x_priv *priv, int port,
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
+	dp = dsa_to_port(ds, port);
+	bdev = dsa_port_bridge_dev_get(dp);
+	if (!bdev)
+		return 0;
+
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
@@ -3757,9 +3852,9 @@ static int yt921x_chip_setup_dsa(struct yt921x_priv *priv)
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

