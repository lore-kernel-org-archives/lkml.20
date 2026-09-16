Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C15EE4B8263
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 16:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789577028; cv=none; b=kSrwaYiR8O8ItX7QGJFy2ByWOAnAq8L8H/npeJJN63T3BgHWEeQJoEiQb4LUBCpBQT9SSNSunU5+LAJO36kJoifk+mzn30c2ub9btTCdApBlHtevcqQIQPkSmM8aUh8s+LnFUUtwJZULYqDsgHlJzOzyNPq6LNcupFlVPtfI55Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789577028; c=relaxed/simple;
	bh=MCurz1LhxhbfRsPZRv1fgE6bTlasRPCfgz3NdkDubv0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z3T7akDa/qNS6ahgvyN9ey6P1IWhE6KRFsLBYyDaYiH+ElC4c3ssnzjkAqQAke2EY6lKGiPqKEDQYb5rrUPff5/eRGj9JK1qvSi+yCVwLZmLRT28NAVerRo5u+Ltawni//9xjx261l/b96borg9D70j+cm6r/gg6JgiKqNkpTIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E/KD3Mf3; arc=none smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E/KD3Mf3"
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-8674704dab1so1338060b3a.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 09:43:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789577019; x=1790181819; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KtEJkdfTsz7PKT9363OYIZ/7x8QutK8/+4IHsILR5ac=;
        b=E/KD3Mf32LHDJcoMGhwZkQGhph5D57ihZm0EJh95v3NE4kjIldSVqONVPS5wpoE4/S
         1l+onsn7b7mjW+tWCiRj9zZLL+PSo4XxFUnAfyJCUsnn796h8rkZX6WGbEMppUH5H9En
         kWrh36/LmMKs1nsFTQ5F2kq1qvxRABOj0jcVdpJCOR7tmTBzXTJijdPz8kB4XfL7fb4b
         SUYLkYZ8GPPHtUWYCT3h0QgNObiSke+pJnKitlOcqHZJ520MpFQHMO+Yprhgs2WdRBMJ
         GH1T4GrHfMkwKZoXyvjwLqU7TMmP0qUJhrDj4MwAtKtItu/h3ds3kEEBoPxitXThOyEx
         O3Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789577019; x=1790181819;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KtEJkdfTsz7PKT9363OYIZ/7x8QutK8/+4IHsILR5ac=;
        b=hcaLsa4CJc4bBr8sF4xeeZMS7m87+t8NuzRN10XPeyIoCU0ylBIHV056Z577jTRTH3
         uKt1pLFz/GfPkuFCAkHI8xPXONV7JyeZ0XuvgtPVm/r49hcYrKfMOOERbpW80yzzRe9/
         Jdz1aVHsAo9xa3CLp7dfuxWhBz0r9SRwxy60fD+HVAYT6kZbUMKpkYFhS80UYE3xQtB/
         2TG9kAb4GghEvFcECIjxTDmKDP526LHQ4B6Yxi6TFLhDMBmuQwYVaTCnGC+8CBOtrH+N
         CbmFjO+jKAA56qy40qDNC8PQlVNIaNQbPllDCatQnEHEzLWPbVHZ1/H3MATJ0jTQx+DB
         VQTw==
X-Forwarded-Encrypted: i=1; AKwUvByOtO/y+jy2pV4RHPSHkX4Y2/nUk32ldelSaE0bsmNnLkShBAL0o19XBHJCkR0pCLp4bDuWrxXd7fMdCyA=@vger.kernel.org
X-Gm-Message-State: AFuF++lBZoxOXAFBX44jJEuW+OpQfBPWi+Nwl+dQPOzfESGZ4pIC/xjE
	zw1jYUaD6xnND/wS+RHJ1zKsmMxSK7X5d5RcB5oXbiZnmy2W5Gd12BPh
X-Gm-Gg: AYBFou2hY5nvdIn+MezmVLLW5SpaEGhhlXzdN3Wu2sjAxIn2taAHbBM9q7EJfYMNTG0
	zxkqpdaqBCx/SLVQgCDpK2flABQafpOZNCCXt/O/xujaSu03YoFogZCuh9xsdD0SatT48o79gQW
	BjwU1zHLWfjSM11z5CAcMDG7d2yzo3W2ou2DuADQ4y/+8LwEfX3SqdEHe2eA5lfdU3DGWD6LhG6
	8tIFZ5hkp34bR4oI4ch9A9MYZViv5ePFy4fTHShlcfO+xa5fH+eRKG1fDlI6JrBGtWvCDVsosqC
	FbHE0U+Hj3861W9bLlSvdO8vNHhQtsI8C1FGiQtFp/ahL2F6vitCEzoQnJ/9qgJzHpg1BGh6Grg
	CiEtOnk8hmxvlbm+/B+vExwn9qXWvHHnoNu/F8fv7bozq7LFvXu05xeGksKj4R7P+l9/Njc/qhp
	Vn83j9OEQExLxlk8pVBEzYA9H2h8B9o3fLj9Vym8S2+EZMQzAwVj+ki9HxXXOf2xX6JT6yvsCgG
	OPRXYPcabudhe075WHPkPm28w==
X-Received: by 2002:a05:6a00:440a:b0:86b:922d:6aa with SMTP id d2e1a72fcca58-8723adb0210mr7433422b3a.1.1789577018741;
        Wed, 16 Sep 2026 09:43:38 -0700 (PDT)
Received: from d.home.yangfl.dn42 ([2a09:bac5:661a:1232::1d0:c5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc50acc757csm1902278a12.32.2026.09.16.09.43.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 09:43:38 -0700 (PDT)
From: David Yang <mmyangfl@gmail.com>
To: netdev@vger.kernel.org
Cc: David Yang <mmyangfl@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v2 3/8] net: dsa: motorcomm: Check port type with runtime info
Date: Thu, 17 Sep 2026 00:43:03 +0800
Message-ID: <20260916164310.3168269-4-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260916164310.3168269-1-mmyangfl@gmail.com>
References: <20260916164310.3168269-1-mmyangfl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The yt921x_port_is_internal/external() macros hardcoded the port layout:
they treat ports 8 and 9 as external on every chip and count the dummy
ports as internal. Drop them and identify the port type using chip info
and runtime configuration.

Signed-off-by: David Yang <mmyangfl@gmail.com>
---
 drivers/net/dsa/motorcomm/chip.c | 61 +++++++++++++++-----------------
 drivers/net/dsa/motorcomm/chip.h | 11 +++---
 2 files changed, 34 insertions(+), 38 deletions(-)

diff --git a/drivers/net/dsa/motorcomm/chip.c b/drivers/net/dsa/motorcomm/chip.c
index b527a9cfd3e8..45c19d962458 100644
--- a/drivers/net/dsa/motorcomm/chip.c
+++ b/drivers/net/dsa/motorcomm/chip.c
@@ -3738,6 +3738,7 @@ yt921x_dsa_port_set_apptrust(struct dsa_switch *ds, int port, const u8 *sel,
 
 static int yt921x_port_down(struct yt921x_priv *priv, int port)
 {
+	const struct yt921x_info *info = priv->info;
 	u32 mask;
 	int res;
 
@@ -3746,12 +3747,13 @@ static int yt921x_port_down(struct yt921x_priv *priv, int port)
 	if (res)
 		return res;
 
-	if (yt921x_port_is_external(port)) {
+	if (BIT(port) & info->serdes_mask) {
 		mask = YT921X_SERDES_LINK;
 		res = yt921x_reg_clear_bits(priv, YT921X_SERDESn(port), mask);
 		if (res)
 			return res;
-
+	}
+	if (BIT(port) & info->xmii_mask) {
 		mask = YT921X_XMII_LINK;
 		res = yt921x_reg_clear_bits(priv, YT921X_XMIIn(port), mask);
 		if (res)
@@ -3766,6 +3768,8 @@ yt921x_port_up(struct yt921x_priv *priv, int port, unsigned int mode,
 	       phy_interface_t interface, int speed, int duplex,
 	       bool tx_pause, bool rx_pause)
 {
+	const struct yt921x_info *info = priv->info;
+	struct yt921x_port *pp = &priv->ports[port];
 	u32 mask;
 	u32 ctrl;
 	int res;
@@ -3800,7 +3804,10 @@ yt921x_port_up(struct yt921x_priv *priv, int port, unsigned int mode,
 	if (res)
 		return res;
 
-	if (yt921x_port_is_external(port)) {
+	if (!(BIT(port) & (info->serdes_mask | info->xmii_mask)))
+		return 0;
+
+	if (pp->serdes) {
 		mask = YT921X_SERDES_SPEED_M;
 		switch (speed) {
 		case SPEED_10:
@@ -3836,7 +3843,7 @@ yt921x_port_up(struct yt921x_priv *priv, int port, unsigned int mode,
 					     mask, ctrl);
 		if (res)
 			return res;
-
+	} else {
 		mask = YT921X_XMII_LINK;
 		res = yt921x_reg_set_bits(priv, YT921X_XMIIn(port), mask);
 		if (res)
@@ -3876,17 +3883,16 @@ static int
 yt921x_port_config(struct yt921x_priv *priv, int port, unsigned int mode,
 		   phy_interface_t interface)
 {
+	const struct yt921x_info *info = priv->info;
+	struct yt921x_port *pp = &priv->ports[port];
 	struct device *dev = to_device(priv);
 	u32 mask;
 	u32 ctrl;
 	int res;
 
-	if (!yt921x_port_is_external(port)) {
-		if (interface != PHY_INTERFACE_MODE_INTERNAL) {
-			dev_err(dev, "Wrong mode %d on port %d\n",
-				interface, port);
-			return -EINVAL;
-		}
+	if (BIT(port) & info->internal_mask) {
+		if (interface != PHY_INTERFACE_MODE_INTERNAL)
+			goto err;
 		return 0;
 	}
 
@@ -3896,6 +3902,9 @@ yt921x_port_config(struct yt921x_priv *priv, int port, unsigned int mode,
 	case PHY_INTERFACE_MODE_100BASEX:
 	case PHY_INTERFACE_MODE_1000BASEX:
 	case PHY_INTERFACE_MODE_2500BASEX:
+		if (!(BIT(port) & info->serdes_mask))
+			goto err;
+
 		mask = YT921X_SERDES_CTRL_PORTn(port);
 		res = yt921x_reg_set_bits(priv, YT921X_SERDES_CTRL, mask);
 		if (res)
@@ -3906,35 +3915,21 @@ yt921x_port_config(struct yt921x_priv *priv, int port, unsigned int mode,
 		if (res)
 			return res;
 
-		mask = YT921X_SERDES_MODE_M;
-		switch (interface) {
-		case PHY_INTERFACE_MODE_SGMII:
-			ctrl = YT921X_SERDES_MODE_SGMII;
-			break;
-		case PHY_INTERFACE_MODE_100BASEX:
-			ctrl = YT921X_SERDES_MODE_100BASEX;
-			break;
-		case PHY_INTERFACE_MODE_1000BASEX:
-			ctrl = YT921X_SERDES_MODE_1000BASEX;
-			break;
-		case PHY_INTERFACE_MODE_2500BASEX:
-			ctrl = YT921X_SERDES_MODE_2500BASEX;
-			break;
-		default:
-			return -EINVAL;
-		}
-		res = yt921x_reg_update_bits(priv, YT921X_SERDESn(port),
-					     mask, ctrl);
-		if (res)
-			return res;
-
+		/* The order is quite arbitrary - we can't return to a safe
+		 * state on IO errors.
+		 */
+		pp->serdes = true;
 		break;
 	/* add XMII support here */
 	default:
-		return -EINVAL;
+		goto err;
 	}
 
 	return 0;
+
+err:
+	dev_err(dev, "Wrong mode %d on port %d\n", interface, port);
+	return -EINVAL;
 }
 
 static void
diff --git a/drivers/net/dsa/motorcomm/chip.h b/drivers/net/dsa/motorcomm/chip.h
index 83e76cefbccd..fd552f7dced4 100644
--- a/drivers/net/dsa/motorcomm/chip.h
+++ b/drivers/net/dsa/motorcomm/chip.h
@@ -858,9 +858,6 @@ enum yt921x_fdb_entry_status {
 
 #define YT921X_NAME	"yt921x"
 
-#define yt921x_port_is_internal(port) ((port) < 8)
-#define yt921x_port_is_external(port) ((port) == 8 || (port) == 9)
-
 struct yt921x_mib {
 	u64 rx_broadcast;
 	u64 rx_pause;
@@ -936,8 +933,12 @@ struct yt921x_acl_blk {
 struct yt921x_port {
 	unsigned char index;
 
-	bool hairpin;
-	bool isolated;
+	/* SerDes in use */
+	bool serdes:1;
+	/* BR_HAIRPIN_MODE */
+	bool hairpin:1;
+	/* BR_ISOLATED */
+	bool isolated:1;
 
 	struct delayed_work mib_read;
 	struct yt921x_mib mib;
-- 
2.53.0

