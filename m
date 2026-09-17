Received: from mail-pj2-f20.google.com (mail-pj2-f20.google.com [74.125.227.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06B334DDB22
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 18:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789671133; cv=none; b=LDTWDpVhuEffRsC9bddvzj11zVUrya1xR1kGCGC3vFQ8nvozgrrPfeSfwoOGsvyLkPrq33O1mLOsc394t0dzbjeyrvkBi6cYXVok3q9vmZ465NTK0ZbkHfQUZA1InXLi3HWfQtLERlZVluaPcD7JozdhkNZuBlf0T2WttpSWTto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789671133; c=relaxed/simple;
	bh=njI0Vg2kOdmWdWb4y8lHpI6W6+rIKolqjl46KofA73Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SaWJ02vhFdtVxHBDxXg1X7Wl/NAlwctuNFfR3hEUnaa3eZslgofeRVq8QVKeRYfuQAigHxiBwxgm3iJ3w+nSvSkSeyFZ3RbeGx2ElX6R7m/e9JSasiCYUHy/NpvkTrCTOAfjCXiboRLlOs7o/+f7DINRxg06uR7tCm9ZjMVTkX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EMOM4GAA; arc=none smtp.client-ip=74.125.227.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EMOM4GAA"
Received: by mail-pj2-f20.google.com with SMTP id d9443c01a7336-2d747ed9866so10841785ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 11:52:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789671131; x=1790275931; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y81t7BgQ+dtg+VKzZrcT7SMjZASx7AevuRrRDGaFD9s=;
        b=EMOM4GAAdJcgbqj70PnbMo6DNqn7N8XSE+0U3JRmEOMcn7i/8JOTlwggS//OqRr9uj
         AEIpR3PEkZWANrZpd5rDEpWXAYdyFQFF/HUR+9m/K9GhN46B2YMwpBYprCNf8FNNah6i
         1KhrLWHloyMWHn92YdoCQ4patrheqXkSXzjACi2u9MO1Dlud7I9SzmrQEbKSwGFPY/X+
         urlXC1DkS/r/DgvwR0LFmtPAH+PAi+ln0T8IM8pfaJW+7mVl+dZYjLVa+GMoNs+tTPkx
         3+Qa89aMpUPkK6XvYnyXzmSSpC/WaajvVecSQc+YcHMOYvYFiFYHs7S/6jRKB9ygiNqt
         cUBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789671131; x=1790275931;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y81t7BgQ+dtg+VKzZrcT7SMjZASx7AevuRrRDGaFD9s=;
        b=nhqi5Ph09VxMFYZtmXovm4cI0vmgYyl1GOsGzps6TkqplWkIqwC9QIn2ndl/Tqch2m
         gRDAwu6xSDy273470keQa5n265fTcStWh9k067G8Zev1yGxCKXqnTLnWW7LqIr/hzqbh
         F+iMac9ehKTxsICDK/28vnVvbi+3FnstB2n38k8SiRLIt8QsjfmYc8nMFra2BVwZMozg
         rsVSyPwZG6bbpCq7IlM+WUd0g1dU/rG/5/Gb83iXjhWKoYsbidGZTRXq0vwFEiwurBlq
         KZn5/VXoYvXIUYu3w/c1meC+/SoKbSLM1/Yy4F1c5+4Z+cs+LFnKyWQVa8t6T1EyATVd
         yTTw==
X-Forwarded-Encrypted: i=1; AKwUvByVRrHjdRhVJ7aSGIOlYRz0fkUl6OPQuLYqkMg9q1zQpbCLKtpsf7MIdLzCUKCy3+TafcyXJdm0odww6Jo=@vger.kernel.org
X-Gm-Message-State: AFuF++nR2DAFEeeDbJcrp4UjxmR+xbR8J7xCklTh1A7t3WdmiNlcBtLJ
	38EQbLZNW0BTOH9d1KEczf8P8IpYtiZa5tQZ8zI2ORmpxauDGqqjB7JE
X-Gm-Gg: AYBFou2jhDsNvbdTA6L+p+fdcSsdfU/qfQ5R/nBGhcTbP2tkO69qP3QBhcf9UGu14YK
	1K0oz2xcMJd425ZQsNHhrTdbfTnsTomAPXI+ZcyeGfP/Ek55HuaQE9MB4x81xQoBDO0tmzVfawT
	FqjCl+ooHuPJqp0UhOCOL1HBAeSYvvOyzkoNO03qPJgx0PDG3WsLEGT8QI1r+rOM5y3Z6q3n7fN
	2QHHpI+zadDboH/66pEAbJ6Kh3dY0e6U3xQSlCpJWVHtK+APVDbwCnmkMIhSbzO8gvcj9DAhbpG
	NdC3CL5XU6Esy0aKrdaxRJHYyqAAXLjKoeDcVQOc/CbpicnqKx6nWrM1dbHR23TzbGkR+Vr0Ys5
	Eupi3WDJU/RKLdg36E816XaHsKddL/dyMj+ugjhoU4Cnnr37T/PbcybIQZaUYuTtp3TALjNOEwM
	hPU77WkHi7V8pw+bk5+2+6SISNkuZSRFeCeUMMarqs8qJlQC0Ymm+tdMkWdMMpJ8aV9oFuxFMbX
	iK4a3t3vZ60t1AhHNVixa7NxA==
X-Received: by 2002:a17:903:32c5:b0:2d9:2fc9:5706 with SMTP id d9443c01a7336-2ddb1ab3aabmr3003155ad.2.1789671131159;
        Thu, 17 Sep 2026 11:52:11 -0700 (PDT)
Received: from d.home.yangfl.dn42 ([2a09:bac5:661a:1232::1d0:c5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd89f331b7sm31032655ad.82.2026.09.17.11.52.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 11:52:10 -0700 (PDT)
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
Subject: [PATCH net-next v3 3/8] net: dsa: motorcomm: Check port type with runtime info
Date: Fri, 18 Sep 2026 02:49:50 +0800
Message-ID: <20260917185010.3189199-4-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260917185010.3189199-1-mmyangfl@gmail.com>
References: <20260917185010.3189199-1-mmyangfl@gmail.com>
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
 drivers/net/dsa/motorcomm/chip.c | 39 +++++++++++++++++++++++---------
 drivers/net/dsa/motorcomm/chip.h | 11 +++++----
 2 files changed, 34 insertions(+), 16 deletions(-)

diff --git a/drivers/net/dsa/motorcomm/chip.c b/drivers/net/dsa/motorcomm/chip.c
index b527a9cfd3e8..bcc9542370c2 100644
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
@@ -3928,13 +3937,21 @@ yt921x_port_config(struct yt921x_priv *priv, int port, unsigned int mode,
 		if (res)
 			return res;
 
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

