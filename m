Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B412246A5F2
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 11:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792149649; cv=none; b=XzHo9Q403Awro7Y6lwV40V8K2FS5ZHCjjA+iQYcZR+HceT24zz3b2yt2iKAakjjo7LBEbD8bHQENIBukhJVhyzsI1BqDIvhdzyl/7VOmuXJyNKAeI0zH8SsJ+yaEGpWGQP2oICJkLn8rdXtchiT+IXUZWFnkOxmVUzzaTaufEfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792149649; c=relaxed/simple;
	bh=tmWFUe4O5IyO+8CbBVqEmkvkD5jfEE2Ew7bX38+bRZs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DFb0C6xGGh5EG9Crc7nz5eeoXVm0ugMgf4H3OVWE5XGi+JRzyFG+jkHQUi6366XI6n6sKiB//17FhkCUytbY/8YF6GYK8/zZLaYr4i2Eojc05Cz0Fz92iIsg9FUNiANyFQ1rQlTBZTpZJzEjGk6GDgxiCIPieZ2d+19+mGDp9gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=lUCuhSfi; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="lUCuhSfi"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6a0a4aa99bdso8107151a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 04:20:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1792149646; x=1792754446; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vzZ+drt3dgf4DTiJO8FECQLY/kCD4mxzJHRqbEltdUk=;
        b=lUCuhSfietg2C8LyHurFBaVzhMwIbAYzKaSOx2g6NH0Yy2Tj+BBfsKT+jatlkONlhl
         /ieXeipWVY7GM/xQ3GJW/q6ZbQmAZOdY843Dek4dXJU+Zowb3ecANaT/NYNQo1HBO9eg
         rgXnfIlFE/mqi8zagoeEdiVj34uXLGT2Fi8ql4JdB7e0wGo5O61ASBBvjXRJ5E7vjRxT
         2/MsmBAI3x2mlaBACDVOaCXVIVD384gmIWWgyc9ZcUtg5KYRCsjkTBC8JxD7MmENRc6i
         YH1mTK0ia8TpYj91BAxJbwevjQIHbnTG6k2HSUf3bHvzyHweTrAeubaIgJ8bkDC7yDid
         7cog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792149646; x=1792754446;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vzZ+drt3dgf4DTiJO8FECQLY/kCD4mxzJHRqbEltdUk=;
        b=s5rvmjj5w5zlPAfmlCPRyW5oIv77ikqZsVD80c0N7uSGHk6uVjItZ25L7HI/jrBNRB
         gXtm4XWLlSgNCiWN7AlKMwB4krG5yTb9Y4HkoYvk5rPawyiJlNMOkrJKiA3Amme5A0iN
         lF2sr3hO7JCrWjOK5fml6gfiObo1fhW/nYqqj+s81eP4MLJ/YTMlRd8AiSNKTJR+6TP1
         rXANAsBY1IRI0ZevihknN2Ug5VQwgI7w5fWlCq2xleV/XGDHXr+EuIK0pXIO1Z6AIU4/
         NKPG0UlFQNjp//GcprOKa+h3DMTw6Zphjz28BrLD1r1K5R9vsCXiaDnMkYjhrY6Cs6iB
         rHDg==
X-Forwarded-Encrypted: i=1; AKwUvBwo70VQjTAGkywORt66Rmwawf96McnUjnU/DlbLG96VdgqHBiKoUTtGo2uapO8KTWbIbmzEw0a+z7U0344=@vger.kernel.org
X-Gm-Message-State: AFq9FYKHUZxtr65VoRsfLdDTi6yCnNQ1oi4WN5rJjr36kpjhfHM5Xwgp
	lqiU9zU35KlECWJmDuQziEE8OJ48h8YHz9cAGjcbebDiLl6p3t13I03cax/Fzt/hDzE=
X-Gm-Gg: AYBFou1kmAiypolNdQydfINCbVFAOzxTPkvIH9+igSAAwlh/4jtYs1ErGNQnHK4YeBI
	S+F8t75rVgr7RSZS5vGx5eweNTeMTEInKaKJ0zKnaKCJxptx0Ut1GGRCH2QIpBz/tcftYtXXcRR
	S+SQV0rvYUj/TKv4rS2OhB2jIn8/VlWQKdWqgAwYfC3SM20WSpTQoVOmdLIL5jyjJ6yi7ZHGk3s
	XvT1+ATzjpIO6o6zeq6XbrzmHWIFMvogCESYLhCIdT3HsAH1OvUDl3Fb568ryEpJtqMeMNE1q0V
	JPDlRPWbRjqlAx+BPhB6ZU8cfKYfTXHiazGlH4em4ebY9I5098lQ+2ipBhjFKM9v0WZuiuiEkP5
	nRifPKe7Lo5V1iNukGK6xqF+Qi32nY1pJLobPR7VsPDgQ3bbFSOcxwRc6z5JDLERIRxNEBgoY1j
	9pZHY7mcbQp/JQg18KnaPqNh5fCHhBBwFsE4NS7cWWluqULc51p/TX+bvrZo8mdYaBGcJq77mxB
	JTsnfQubDqh3dg9VpKAovOdOxaCZ5Kbfg+HcW7MUopXldraEpwfpL/3ypRTk1t6bbs8CgGWi/81
	5vlA+H49fMebhG2R7M8rC2u9aXqQ
X-Received: by 2002:a17:907:3ea0:b0:c3f:98d4:dfd0 with SMTP id a640c23a62f3a-c3f98d4e648mr377283866b.45.1792149645861;
        Fri, 16 Oct 2026 04:20:45 -0700 (PDT)
Received: from threadripper-fedora-workstation (dh207-15-194.xnet.hr. [88.207.15.194])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c408e32c075sm63947666b.11.2026.10.16.04.20.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 04:20:45 -0700 (PDT)
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
Subject: [PATCH net-next v2 2/5] net: phy: mxl-gpy: add MxL86211C VDDP supply
Date: Fri, 16 Oct 2026 13:19:33 +0200
Message-ID: <20261016112033.949026-2-robert.marko@sartura.hr>
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

Read the VDDP supply voltage and configure the MxL86211C MDIO, MDC,
and MDINT pads for the matching 1.8 V or 3.3 V level.

Keep the shared GPY driver buildable without regulator support; only
the MxL86211C probe requires the supply.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
Changes in v2:
- Replace the MDIO regulator provider with a VDDP supply consumer.
- Set the pad voltage from the supply's reported voltage.
- Keep the shared driver buildable with CONFIG_REGULATOR=n.

 drivers/net/phy/mxl-gpy.c | 63 ++++++++++++++++++++++++++++++++++++++-
 1 file changed, 62 insertions(+), 1 deletion(-)

diff --git a/drivers/net/phy/mxl-gpy.c b/drivers/net/phy/mxl-gpy.c
index 089a1a9e5bc61..fbac7c49b4759 100644
--- a/drivers/net/phy/mxl-gpy.c
+++ b/drivers/net/phy/mxl-gpy.c
@@ -14,6 +14,7 @@
 #include <linux/polynomial.h>
 #include <linux/property.h>
 #include <linux/netdevice.h>
+#include <linux/regulator/consumer.h>
 
 /* PHY ID */
 #define PHY_ID_GPYx15B_MASK	0xFFFFFFFC
@@ -110,6 +111,10 @@
 #define VSPEC1_SGMII_ANEN_ANRS	(VSPEC1_SGMII_CTRL_ANEN | \
 				 VSPEC1_SGMII_CTRL_ANRS)
 
+/* Packet Manager Control */
+#define VSPEC1_PM_CTRL		0x0c
+#define VSPEC1_PM_CTRL_MDIO_VOL	BIT(14)
+
 /* Temperature sensor */
 #define VSPEC1_TEMP_STA	0x0E
 #define VSPEC1_TEMP_STA_DATA	GENMASK(9, 0)
@@ -140,6 +145,7 @@ struct gpy_priv {
 	u8 fw_minor;
 	u32 wolopts;
 	u64 rx_errors;
+	struct regulator *vddp;
 
 	/* It takes 3 seconds to fully switch out of loopback mode before
 	 * it can safely re-enter loopback mode. Record the time when
@@ -390,6 +396,61 @@ static int gpy_probe(struct phy_device *phydev)
 	return 0;
 }
 
+static int mxl86211c_configure_mdio_voltage(struct phy_device *phydev,
+					    struct regulator *vddp)
+{
+	int voltage;
+	int val;
+
+	voltage = regulator_get_voltage(vddp);
+	if (voltage < 0)
+		return voltage;
+
+	switch (voltage) {
+	case 1800000:
+		val = VSPEC1_PM_CTRL_MDIO_VOL;
+		break;
+	case 3300000:
+		val = 0;
+		break;
+	default:
+		phydev_err(phydev, "unsupported VDDP voltage: %d\n", voltage);
+		return -EINVAL;
+	}
+
+	return phy_modify_mmd(phydev, MDIO_MMD_VEND1, VSPEC1_PM_CTRL,
+			      VSPEC1_PM_CTRL_MDIO_VOL, val);
+}
+
+static int mxl86211c_probe(struct phy_device *phydev)
+{
+	struct device *dev = &phydev->mdio.dev;
+	struct gpy_priv *priv;
+	struct regulator *vddp;
+	int ret;
+
+	vddp = devm_regulator_get(dev, "vddp");
+	if (IS_ERR(vddp))
+		return dev_err_probe(dev, PTR_ERR(vddp),
+				     "failed to get VDDP supply\n");
+	if (!vddp)
+		return dev_err_probe(dev, -EOPNOTSUPP,
+				     "VDDP supply requires regulator support\n");
+
+	ret = mxl86211c_configure_mdio_voltage(phydev, vddp);
+	if (ret)
+		return ret;
+
+	ret = gpy_probe(phydev);
+	if (ret)
+		return ret;
+
+	priv = phydev->priv;
+	priv->vddp = vddp;
+
+	return 0;
+}
+
 static bool gpy_sgmii_need_reaneg(struct phy_device *phydev)
 {
 	struct gpy_priv *priv = phydev->priv;
@@ -1406,7 +1467,7 @@ static struct phy_driver gpy_drivers[] = {
 		.name		= "Maxlinear Ethernet MxL86211C",
 		.get_features	= genphy_c45_pma_read_abilities,
 		.config_init	= gpy21x_config_init,
-		.probe		= gpy_probe,
+		.probe		= mxl86211c_probe,
 		.inband_caps	= gpy_inband_caps,
 		.config_inband	= gpy_config_inband,
 		.suspend	= genphy_suspend,
-- 
2.56.0

