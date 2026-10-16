Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9847847D44C
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 11:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792149659; cv=none; b=BwM4gVpBFL51oI68NXjvvhmcNkFKtCCJbFqL1aSo6MUKwZu+WMJTQFBBIOOzDN6aFykxpw/gZuUzX7E59BWz5+b7MsowXF70pcYjW3SJV7WGHHMpyf13/8gyrrBEAMo4uf1K9ZAhns3bnPNrgLyi6EiZleC9Gu5EWe4kvxz1IqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792149659; c=relaxed/simple;
	bh=TwsVE1aW6IYLHbieh7/8b/SGuVK/PYEkGTgqLNdREec=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cz0dVzSx9yGgo7bG0K/cRR73n3/tedANRena/yAmKhV7I/eSb44UrEXM2kJ7khJrzCdwG2jgpvZKGosqbfPx5SuJqQ2uHwOn5gRxeC/nvR7wCpuJLdbn+OSpMQwtyl+19otaYZlYZL6shJb/fQ3yRUQcpic8xIfXKkaFsOWMJus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=LkHPf6Bw; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="LkHPf6Bw"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c247f6687dcso63672466b.2
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 04:20:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1792149648; x=1792754448; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/TeYqrIujJ95SPFhaCqHpArM7/zgqye+YpqAutM7XFY=;
        b=LkHPf6BwJ+QPoAOObQeQAhxNFfcssKfqoAXdDO6qzJvvpoM5wd1j9VjtwBHu6VrofH
         ++R20/g3qRprnKvldoWzki71BDLQOo4+/0hMl/TowixAWRJlG5J5iWzT88FhblIahUBk
         4/LcXToUjyNCIJZKqGXQXp5tFZNhJc9Fe2pHbsgtH1WagKVLVzeYKgooQM1sL7+3QoMN
         SMO0mVKvNj7lYcZfTvNsCKZ0UlODO84KwviD3N3vXOyxLZmJNwtZ9GuxZeeiiXKfqwxs
         4evND8oRDm1Q2UzP0Qp4sBlQWDhXf9w4YUVt9WSceG6faCxhjHvgvRXl0SO8yh88eISr
         jpfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792149648; x=1792754448;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/TeYqrIujJ95SPFhaCqHpArM7/zgqye+YpqAutM7XFY=;
        b=wmeqxXmBHhHSPT/5XvM0gs+ntW8z71C5ReJShKiuJ/nZ34O0T8P0m/o4IS5s9RmQg8
         XxLcExcWjJKwUjQRN7FAzmrXXctzAHFuWc8qVfXDfUNsKjm4ivAXmUOLjvDGCA2gIGS+
         TazlNpAfm+yeT/L9vD6smuhH42vJosn+oIU6PH69s6qtdbHtJPbqbEIpv+u8HgVm036P
         ALcEjbFumPYF9leFDlSrZjI+qbTxRnkglrAlXY/c10R/ZsIp+SS0dHaqTNnTFAt0ORlo
         ZMnhFg1Vm/RIp4UrGRbLz7WdFR4w7ty/VeEu13CMMYIqTxwx4m4tP19m1A9tdcY85pyo
         gVgw==
X-Forwarded-Encrypted: i=1; AKwUvBwp9SZTGzuxIgs8tAp4wS7/DRRzapInvo5ZlZsd2biXVJrY8TI5hXVFJcXWwO31hKugpUgohY1f/ohg7K8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLjDEpJGhe5vxqL8fq/W7X+sWqvuI37KQeML+2gZEKxgLX878SI
	vjTDjoYzbkYKhNZ1G4iuaTMSpbnk2fEmFEcMwqqf5Hm9cPezlwqqG0rLrP8bZxKbQUg=
X-Gm-Gg: AYBFou3NgJoNtqqssU/mbb+8DVRig0R3+tIUKpjPtar+iHJPh/2uh6FDEGuf9xxOG8L
	54VFdXjNifEwn/J2LiOf/g6UYecIbGdNEu4HsJF1zgX/tVjVxSK2YDTtpvJi3+bdB4YEMtLUPoJ
	10paXvuMF/lB+dyAd1p40XjXGNqzoUxGRZ2+V8l83EdJz9SLi+DUbA9LGezNY2L+WtJ9c5UM0Be
	TSYHFEmZqifrUIF/wjZCU/QBsVparK1Mc3iDJjLJ0UjRqXwhZki156s03qQzq++aLCubVX7d5f/
	FrAKNY6oWUY/1Pme6MYq3KMojYQ6kEmgjnYu1buMH74QUJFD4E3QpF3CVRUAFDpNCChSGrxnTR0
	8t8nx8CSzJD5PHhJyjhTIMa7l1in1pcjKJ6GFc/ZFR1YkuzvXAQWTXQHpDynQL7djMFwp8vQZ5w
	V+eK4HUfK4Pshz9oTrPlGj0bI/+AE6gJDbJc2ZXpZtP3FmnKTcTU4qGqwNxIIg/jDeWs6jmxvN9
	jenLY+cq1sCwQ+8Dy05wshtJXSnntiz1h5hr0wpig0S+RyK1yW9NIJc6JvySdsgZnKa77tByaKK
	wQFFKmULbNk1wTJPRoCnKq9xB7sR
X-Received: by 2002:a17:907:3e8d:b0:c26:36c4:858e with SMTP id a640c23a62f3a-c31aa018731mr1977506066b.25.1792149647314;
        Fri, 16 Oct 2026 04:20:47 -0700 (PDT)
Received: from threadripper-fedora-workstation (dh207-15-194.xnet.hr. [88.207.15.194])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c408e32c075sm63947666b.11.2026.10.16.04.20.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 04:20:46 -0700 (PDT)
From: Robert Marko <robert.marko@sartura.hr>
To: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	lxu@maxlinear.com,
	hkallweit1@gmail.com,
	linux@armlinux.org.uk,
	michael@walle.cc,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: lrosu@maxlinear.com,
	luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH net-next v2 3/5] net: phy: mxl-gpy: release MxL86211C Super Isolate
Date: Fri, 16 Oct 2026 13:19:34 +0200
Message-ID: <20261016112033.949026-3-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261016112033.949026-1-robert.marko@sartura.hr>
References: <20261016112033.949026-1-robert.marko@sartura.hr>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The MxL86211C can be strapped into Super Isolate mode, leaving the PHY
halted after reset until software releases it.

Reapply the MDIO pad voltage and release Super Isolate in config_init,
so both settings are restored after each hardware reset.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
Changes in v2:
- Move Super Isolate release from probe to config_init for resets.
- Reapply the MDIO pad voltage before releasing Super Isolate.

 drivers/net/phy/mxl-gpy.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/net/phy/mxl-gpy.c b/drivers/net/phy/mxl-gpy.c
index fbac7c49b4759..8bc119655f104 100644
--- a/drivers/net/phy/mxl-gpy.c
+++ b/drivers/net/phy/mxl-gpy.c
@@ -114,6 +114,7 @@
 /* Packet Manager Control */
 #define VSPEC1_PM_CTRL		0x0c
 #define VSPEC1_PM_CTRL_MDIO_VOL	BIT(14)
+#define VSPEC1_PM_CTRL_SI	BIT(12)		/* Super Isolate */
 
 /* Temperature sensor */
 #define VSPEC1_TEMP_STA	0x0E
@@ -422,6 +423,23 @@ static int mxl86211c_configure_mdio_voltage(struct phy_device *phydev,
 			      VSPEC1_PM_CTRL_MDIO_VOL, val);
 }
 
+static int mxl86211c_config_init(struct phy_device *phydev)
+{
+	struct gpy_priv *priv = phydev->priv;
+	int ret;
+
+	ret = mxl86211c_configure_mdio_voltage(phydev, priv->vddp);
+	if (ret)
+		return ret;
+
+	ret = phy_modify_mmd(phydev, MDIO_MMD_VEND1, VSPEC1_PM_CTRL,
+			     VSPEC1_PM_CTRL_SI, 0);
+	if (ret)
+		return ret;
+
+	return gpy21x_config_init(phydev);
+}
+
 static int mxl86211c_probe(struct phy_device *phydev)
 {
 	struct device *dev = &phydev->mdio.dev;
@@ -1466,7 +1484,7 @@ static struct phy_driver gpy_drivers[] = {
 		PHY_ID_MATCH_MODEL(PHY_ID_MXL86211C),
 		.name		= "Maxlinear Ethernet MxL86211C",
 		.get_features	= genphy_c45_pma_read_abilities,
-		.config_init	= gpy21x_config_init,
+		.config_init	= mxl86211c_config_init,
 		.probe		= mxl86211c_probe,
 		.inband_caps	= gpy_inband_caps,
 		.config_inband	= gpy_config_inband,
-- 
2.56.0

