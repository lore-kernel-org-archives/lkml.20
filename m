Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3567F562604
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 15:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790092500; cv=none; b=UF/2jotTwcVXWCPQ6kn1k9krbi7mRxTc1ZiO9Q729xF+XoKWf85KA30x4EvkhZxOC2a3hEsnMKtjiK3ga9rZorMoOgAs94JYc2BHEmeecQwzaFqYik/ZtjuNoCVHw0xmW2l2XRk7JOs4ke7+S0vucocZjkhsSN9rvt/1ixMYzO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790092500; c=relaxed/simple;
	bh=vK6OFxVujsLdxAnbev7MwgtHj3nRNI0wcI0BQy7x/5A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=WrN6cSCqn5CHPWWg0+1iIeMTZtV2pj6Zjg/2T7/APz5l+hHWTiideQstHJcsttLq6J2RGLdOtnZavCcD++bspUL2icqSNWbNNi7QjLWEtQE7S4xRfs0KWCksJWTTUlIQHuyx/HvtCNBkXOhTboh1/ME13GyOvNxfuXnX2utBM6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AC10UTal; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AC10UTal"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49d097b4939so23302335e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 08:54:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790092497; x=1790697297; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=wT5mWkdgUm/hzbx3Bgoqr9BADbbojUu1G/tndNF4lm8=;
        b=AC10UTal0u9LPBxGdc4R1fnt9DRQUNGeyE0nC1rdjfNxpHRgwylj9RUYDgbGzlQSbd
         flaNNm0cT79sOAeWR/DjIcNgi2xYjuoYlhthv2bGgCML9Jeis0oo9yV/bzBYtK28FEqD
         s6iIgnAaAvXaZ2CtqZehoza18ZoeoUtfWVYiAzLD1r4ibA66rsJnZXE14H0Od+LbIVF9
         WMjZoEw6BEODBbHo8S9oOKaM7n81FLa2MdevlYJCChxXItWXJ5uVMlHfLwnhJl6O5jeH
         mcx4fIJ4U1h7Qps7oh/HF8+tnZeb1g3sTZ72HRX6+zcuS2CG2K+1IUc2OYlHxWZw8cz8
         E4/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790092497; x=1790697297;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=wT5mWkdgUm/hzbx3Bgoqr9BADbbojUu1G/tndNF4lm8=;
        b=DJcmiO1WH3CMU27tOBtkt9uTu0GgNo5xsuVUNCP8Ogx1qbirGbueiDT4ubMoHx9WgR
         OQ4NVdgGWgKJbs7vOFw1y7GJ2mQ/0EBdHH20kv0qbjBuhydGUg8TrpcMbHmbGxGh0Ur+
         fET0W3xtYVZRSvgnB1GV87orDpSJb6mJzQcAX2CbRKjHW1AKSWZ+1S8jyw1NAEkn45cB
         Jp2rN51DppjPFt6j+dMG9pn47qBS7JCED72EcQWefebQYAn5hPSKP7nqN4eYo+qfDEE2
         kGR+0Zs0b83VZZ/Ql3AvosW1jQH52nWZFBJYcg/p9tHNlu3eMfqw7gs62mk/0ngbwq2m
         86qg==
X-Forwarded-Encrypted: i=1; AKwUvBwbMhBFpGK142WAUFO5qzxmGwHX/KTwwA6LNz1w08fM+G14qSfJPwEI74jtuJVnvifT/O0RSjGGNLDgVJI=@vger.kernel.org
X-Gm-Message-State: AFuF++ke5G5T5Zztnwg6AOI/BcUZJxdvTtInwNzw91fzSVGitAafbPKm
	yIMLjGU3eYn0LUjUO+TRT8DgbKCPZqP3PkhSMDhzFpExBIQVBSDgcVUl
X-Gm-Gg: AYBFou2awgUBWN63Vymt16Xxk/dLlp1IPK8lOVs9E78roueBDEtCoRKUnp+rSW8qWwM
	yOGXqUVas7gmSskjS7qvD1bygKBfd/Z37LSZsXaSKoa0kDzHPkfcYvW6Ixv4aSaMNFiVMckFvvx
	OS0rAoaX5NYyWLkc+idsq0JuAg9PDEmqLr+ZswXau0iZHSdDo9st2TBfOa2oTbeE4B45PH0qqAk
	D8S+Vc2VKnJQTbswhKF0P3vblyHIulPR0PLkv0hH/Q3fj0eEYF1wJPlyYFQuTyWjEhkvUk0Pci8
	6acP4RyAQCo8fIQdAnloZui/Iw3H8tRfO6efs9x/KYiDTTk719qlXRJ2wneXivUapSHGjkkSus8
	MAH06Y88b7nhHLHNm/6zlBaTNjsM9Yqwgdig/aZ4slxeuk4r3SroADUg4N7iJP3qTTJCc+GAs6C
	I2PlklnpQSnKS97Jg01uPXqXZeO6sOlaFQrznwHrzw2ZCak1+3Z5sJN/TqyyUZvzxodsY42FwgO
	rBreysFFLCHafDYRVtTkArBAy1wkwJBTN32cPE0pCrE26Jfv9Afhk+RpECAzMzj5MXPTxgtrBiL
	VsSveBDM+hvUK1eQA0PvGEgjdfHaCM7PQUcoE5r05sbi
X-Received: by 2002:a05:600c:19cb:b0:49e:8184:f619 with SMTP id 5b1f17b1804b1-49fc57410f2mr203367475e9.22.1790092497265;
        Tue, 22 Sep 2026 08:54:57 -0700 (PDT)
Received: from localhost (89-73-120-30.dynamic.play.pl. [89.73.120.30])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-48862793528sm5067667f8f.36.2026.09.22.08.54.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 08:54:56 -0700 (PDT)
From: Patryk Biel <pbiel7@gmail.com>
Date: Tue, 22 Sep 2026 17:54:46 +0200
Subject: [PATCH net-next v3] net: pcs: enable autonegotiation for
 10g-usxgmii
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-b4-fix-pcs-lynx-an-v3-1-dda3ac4e499c@gmail.com>
X-B4-Tracking: v=1; b=H4sIAMWksmoC/33NTQrDIBAF4KsU152iJpXaVe9RuvBnTITEBA2SE
 HL3iqssSpePN++bnSSMHhN5XnYSMfvkp1BCc70Q06vQIXhbMuGUC/rgFHQLzq8wmwTDFlZQARp
 nmb2jbA0KUoZzxHJS0TcJuEDAdSGf0vQ+LVPc6rfMav8PzgwYCG6FaCRD5dyrG5UfbmYaK5f5m
 Wh/ErwQUmtm0UjhqD4Tx3F8AfbuuJYBAQAA
X-Change-ID: 20260820-b4-fix-pcs-lynx-an-3fd1d5e94ce6
To: Ioana Ciornei <ioana.ciornei@nxp.com>, Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Vladimir Oltean <vladimir.oltean@nxp.com>, Patryk Biel <pbiel7@gmail.com>
X-Mailer: b4 0.14.2

The Lynx PCS USXGMII setup programs the replicator advertisement, but
does not explicitly enable and restart in-band autonegotiation or program
the replicator link timers.

This leaves the PCS dependent on firmware or bootloader state. Systems
which do not get the USXGMII replicator preconfigured before Linux may
therefore fail to negotiate the link correctly.

After programming the USXGMII device ability, configure the replicator
BMCR with reset, autonegotiation enable and autonegotiation restart. Also
program the replicator link timer registers using the value returned by
phylink_get_link_timer_ns()

Co-developed-by: Vladimir Oltean <vladimir.oltean@nxp.com>
Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
Signed-off-by: Patryk Biel <pbiel7@gmail.com>
---
Changes in v3:
- Add separate link timer macro for 10G-QXGMII (1/4 tick rate vs USXGMII).
- Select link timer macro based on interface mode.
- Link to v2: https://lore.kernel.org/r/20260824-b4-fix-pcs-lynx-an-v2-1-9bb1dec96f0b@gmail.com

Changes in v2:
- Reorder local variable declarations in lynx_pcs_config_usxgmii().
- Move USXGMII replicator link timer configuration before the autonegotiation restart.
- Use phylink_get_link_timer_ns() instead of hardcoded USXGMII 
  replicator link timer values, converting to 3.2 ns register step.
- Link to v1: https://lore.kernel.org/r/20260820-b4-fix-pcs-lynx-an-v1-1-62d66391eaff@gmail.com
---
 drivers/net/pcs/pcs-lynx.c | 53 ++++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 49 insertions(+), 4 deletions(-)

diff --git a/drivers/net/pcs/pcs-lynx.c b/drivers/net/pcs/pcs-lynx.c
index da4f99059eef7722a5c3bf32df490940cc1135f8..6d94f92a3332959bc4d39969a8ad781ac06951af 100644
--- a/drivers/net/pcs/pcs-lynx.c
+++ b/drivers/net/pcs/pcs-lynx.c
@@ -20,6 +20,12 @@
 #define IF_MODE_SPEED_MSK		GENMASK(3, 2)
 #define IF_MODE_HALF_DUPLEX		BIT(4)
 
+/* USXGMII replicator link timer step is 3.2 ns (312.5M XGMII columns per sec)
+ * for single port mode. For quad port mode, it is 1/4 of that.
+ */
+#define LINK_TIMER_VAL_USXGMII(ns)	((u32)((ns) * 10 / 32))
+#define LINK_TIMER_VAL_10G_QXGMII(ns)	((u32)((ns) * 10 / 128))
+
 struct lynx_pcs {
 	struct phylink_pcs pcs;
 	struct mdio_device *mdio;
@@ -158,6 +164,9 @@ static int lynx_pcs_config_usxgmii(struct mdio_device *pcs,
 {
 	struct mii_bus *bus = pcs->bus;
 	int addr = pcs->addr;
+	int link_timer_ns;
+	u32 link_timer;
+	int ret;
 
 	if (neg_mode != PHYLINK_PCS_NEG_INBAND_ENABLED) {
 		dev_err(&pcs->dev, "%s only supports in-band AN for now\n",
@@ -166,10 +175,46 @@ static int lynx_pcs_config_usxgmii(struct mdio_device *pcs,
 	}
 
 	/* Configure device ability for the USXGMII Replicator */
-	return mdiobus_c45_write(bus, addr, MDIO_MMD_VEND2, MII_ADVERTISE,
-				 MDIO_USXGMII_10G | MDIO_USXGMII_LINK |
-				 MDIO_USXGMII_FULL_DUPLEX |
-				 ADVERTISE_SGMII | ADVERTISE_LPACK);
+	ret = mdiobus_c45_write(bus, addr, MDIO_MMD_VEND2, MII_ADVERTISE,
+				MDIO_USXGMII_10G | MDIO_USXGMII_LINK |
+				MDIO_USXGMII_FULL_DUPLEX |
+				ADVERTISE_SGMII | ADVERTISE_LPACK);
+	if (ret < 0) {
+		dev_err(&pcs->dev, "could not set USXGMII replicator config\n");
+		return ret;
+	}
+
+	link_timer_ns = phylink_get_link_timer_ns(interface);
+	if (link_timer_ns > 0) {
+		if (interface == PHY_INTERFACE_MODE_10G_QXGMII)
+			link_timer = LINK_TIMER_VAL_10G_QXGMII(link_timer_ns);
+		else
+			link_timer = LINK_TIMER_VAL_USXGMII(link_timer_ns);
+
+		ret = mdiobus_c45_write(bus, addr, MDIO_MMD_VEND2,
+					LINK_TIMER_LO, link_timer & 0xffff);
+		if (ret < 0) {
+			dev_err(&pcs->dev, "could not set USXGMII Link Timer 1\n");
+			return ret;
+		}
+
+		ret = mdiobus_c45_write(bus, addr, MDIO_MMD_VEND2,
+					LINK_TIMER_HI, (link_timer >> 16) & 0x1f);
+		if (ret < 0) {
+			dev_err(&pcs->dev, "could not set USXGMII Link Timer 2\n");
+			return ret;
+		}
+	}
+
+	/* Configure autonegotiation */
+	ret = mdiobus_c45_write(bus, addr, MDIO_MMD_VEND2, MII_BMCR,
+				BMCR_RESET | BMCR_ANENABLE | BMCR_ANRESTART);
+	if (ret < 0) {
+		dev_err(&pcs->dev, "could not set USXGMII replicator control config\n");
+		return ret;
+	}
+
+	return ret;
 }
 
 static int lynx_pcs_config(struct phylink_pcs *pcs, unsigned int neg_mode,

---
base-commit: 10cfa109c880092df32e396647b4afdca9be8350
change-id: 20260820-b4-fix-pcs-lynx-an-3fd1d5e94ce6

Best regards,
-- 
Patryk Biel <pbiel7@gmail.com>

