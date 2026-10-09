Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41D894E80B7
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 18:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791568801; cv=none; b=ItNUsWeOwlgzNAegsR9ymfHoQ7Hpcwg0h1JYcMvdkkPJX4pSglnIqflSGwN2iDKL0NNqC/Z5pl7Y2obiHoIM6plzUEo5TPzplGWWzqwojqI6O0Rwrq0/10Eb/OFhwwIi6sndU7/4DHoS/SkA3PIp/R1EuUZVZuQI3LKBtNoP3E0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791568801; c=relaxed/simple;
	bh=Gti7K1/QhSFZ+eoHXW5S9feHyQSr76WRiZbHs3IHiuk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jSwJhhGPnS6PpyfnseSnYD5+P7OxD3u/AvGWz7mm8sYeHpMdauDM719TT38GLvYBaMNQfs2f+b6ifmvJ1/egjKis5Wf9PWA9Olt8Et1BvuHfU9lSGiuUlywVJLv0gvdNOnIITaH8FD1jfWMsDSXbaaOBeJ+QvUyXDx6iTO9sgeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CZXClu4B; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CZXClu4B"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2dd76b1361dso44113275ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 11:00:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791568800; x=1792173600; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MvJvV0aRiulY6uBfalnUL+2S3Yp/YxHHNwR6ZIhHX3M=;
        b=CZXClu4BhIRDHZQx0u5Owf273gdg82RSyVaX4XTrnqWXuscNhRCiPMGQ+CsK26egPq
         ukS4gv1pYLedlevClDjwsa+9Liqqwd0W6sxgtxwCe8TbJKptYXPydooa2hVdp3wlkJZj
         1ilN+C8rgh5dETYVpsAAAQVKwWHe4Zlbg1ztDzcamBv8WtV2tlaRHEEzN+f0U815mfUx
         HyGBd68emKevW8nthP3XMIYSltSsPtJa6cm2lUR1viMRltP83fSRa2QpSwNCvhRHvWFt
         dseoa2v0ol1ARTm+AiVL3d81A1w0rjUteMmtzxSBciuaYXGPxCn/XwVWcKvWkOrMGKT/
         KQ4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791568800; x=1792173600;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MvJvV0aRiulY6uBfalnUL+2S3Yp/YxHHNwR6ZIhHX3M=;
        b=qYOK5VmaQPLaq/3frMvdprZoGrFe4ChUrgreyEvh90D4dbTd+/Xv4D9QfgrJ1LqsOy
         4HiQ2c4aD+gTClKXco3sHVANdH8JohgLT2NMcjoDPQ8Rm0Kr0wv3ksiMIkIFKl/gmLfG
         jRsJHx08k4NQ+e+0BKpj05q0s1g9Os4pht3H7s7wZJ2i7MbP7afB5gRDpLbo5JVC5161
         WXGte40cxBVYy/nibX540NmL0JWGvDWnaLGk/WEyVYuU/SgrX4Syf54lsQRbbrY/tcgQ
         iA5Dfy6XsJo6XWn3ZFdLj8AVwtSwbaN4pLGPDyXGUx4SAJcFXC/00Kqvqc0lxVduzmYt
         pnXQ==
X-Forwarded-Encrypted: i=1; AKwUvBx4V1hagJrGda7MZnRB3XfWKiBPb31dtkCIfVO2+YPIA2ei3tGi/upIDVFnO4ag00ERW5GZceBSAiPN5bU=@vger.kernel.org
X-Gm-Message-State: AFq9FYIzdXjXYBfErU43JhYrZ/5k3+WAbRl/gPX4+BTcsbmB9VsYg8oM
	PuFGdeBsG5e559EPsLUdtE9UtxK6yNNHuZPvLczd9d09AqQduIBLGmEs
X-Gm-Gg: AYBFou2v+LX0iJUwiv8bHdRVLCkzJTJcMag1DRhwDP01Lr38ZNX4R/2NpZounjIhQsV
	a7WVnpuifss7KOVVy/au/80oSlrXDu/6nHIKzuFDAb1MnyraOq/n/sgA6YTRXqWP0pe5hnKc31B
	IhEJAr0oWEMMXT+x6CuxdtJlSTV/jH0wssr6pobDUgpktCwj0J/fmdugqQsH+gbZZAAmjZd0bmy
	g5RMS9pkhkUt5+xG/iy3S/pgVa5np3H1ES5qiaW7q9uG9BMi/Y2OHEygzNudPGaCYcOhI1jhQyr
	qJ0+QMGPF+4zNcKPN4Ep1/sstFiVPmgFSaUc0w0XzDAJglYkVYp9GVNW3g9kwJCEUqAwnRXcz9K
	5vgBNUNV5VOdRV6IdEJKtOv87EDPwOC3WupdRom3VXVtNEoDzHo9RyUIeLSuAOXWKpz92UbnBHH
	fCP5yhmxA5yiPNE6AsLxRG7nCzT5lgSCmZ5FrneOYR138jmMcV4NNRYPVvdb1KvkK0vM1LZFsts
	lnvPBZ0XcVhPDzY2z7jIYYs0A==
X-Received: by 2002:a17:902:ccd1:b0:2e5:a350:34f5 with SMTP id d9443c01a7336-2e842dfe6c1mr25314525ad.51.1791568799559;
        Fri, 09 Oct 2026 10:59:59 -0700 (PDT)
Received: from d.home.yangfl.dn42 ([2a09:bac5:661c:1246::1d2:d1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e84219e74asm14167105ad.29.2026.10.09.10.59.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 10:59:56 -0700 (PDT)
From: David Yang <mmyangfl@gmail.com>
To: netdev@vger.kernel.org
Cc: David Yang <mmyangfl@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Frank <Frank.Sae@motor-comm.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v3 2/3] net: phy: motorcomm: Add driver entry for internal YT861x PHYs
Date: Sat, 10 Oct 2026 01:59:31 +0800
Message-ID: <20261009175936.428256-3-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261009175936.428256-1-mmyangfl@gmail.com>
References: <20261009175936.428256-1-mmyangfl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The YT921x switches integrate GbE PHYs of the YT861x family on the
switch-internal MDIO bus exposed by the yt921x DSA driver. Add a driver
entry for them.

The PHY ID 0x01e04281 is live captured from the switch-internal MDIO
bus. The switch SerDes PCS does follow the pattern, 0x4f51e899, though.

Signed-off-by: David Yang <mmyangfl@gmail.com>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
---
 drivers/net/phy/Kconfig     |  3 ++-
 drivers/net/phy/motorcomm.c | 39 +++++++++++++++++++++++++++++++++++--
 2 files changed, 39 insertions(+), 3 deletions(-)

diff --git a/drivers/net/phy/Kconfig b/drivers/net/phy/Kconfig
index d3835597e379..30e9d22c8d1a 100644
--- a/drivers/net/phy/Kconfig
+++ b/drivers/net/phy/Kconfig
@@ -363,7 +363,8 @@ config MOTORCOMM_PHY
 	tristate "Motorcomm PHYs"
 	help
 	  Enables support for Motorcomm network PHYs.
-	  Currently supports YT85xx Gigabit Ethernet PHYs.
+	  Currently supports YT85xx Gigabit Ethernet PHYs, YT861x PHYs
+	  integrated in YT921x switches, and YT8821 2.5Gbps PHYs.
 
 config NATIONAL_PHY
 	tristate "National Semiconductor PHYs"
diff --git a/drivers/net/phy/motorcomm.c b/drivers/net/phy/motorcomm.c
index 90a4f86f2758..7078c4a0225d 100644
--- a/drivers/net/phy/motorcomm.c
+++ b/drivers/net/phy/motorcomm.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0+
 /*
- * Motorcomm 8511/8521/8522/8531/8531S/8821 PHY driver.
+ * Motorcomm 8511/8521/8522/8531/8531S/861x/8821 PHY driver.
  *
  * Author: Peter Geis <pgwipeout@gmail.com>
  * Author: Frank <Frank.Sae@motor-comm.com>
@@ -18,6 +18,8 @@
 #define PHY_ID_YT8522		0x4f51e928
 #define PHY_ID_YT8531		0x4f51e91b
 #define PHY_ID_YT8531S		0x4f51e91a
+/* Live captured from YT921x switch internal MDIO bus */
+#define PHY_ID_INT861X		0x01e04281
 #define PHY_ID_YT8821		0x4f51ea19
 /* YT8521/YT8531S/YT8821 Register Overview
  *	UTP Register space	|	FIBER Register space
@@ -2538,6 +2540,29 @@ static int yt8521_get_features(struct phy_device *phydev)
 	return ret;
 }
 
+/**
+ * yt861x_config_init() - apply the auto sleep setting to the PHY
+ * @phydev: a pointer to a &struct phy_device
+ *
+ * Auto sleep is enabled by default and a BMCR soft reset does not restore it,
+ * so apply the setting from config_init. It can be disabled with the
+ * "motorcomm,auto-sleep-disabled" device property.
+ *
+ * Returns: 0 or negative errno code
+ */
+static int yt861x_config_init(struct phy_device *phydev)
+{
+	bool sleep;
+
+	sleep = !device_property_read_bool(&phydev->mdio.dev,
+					   "motorcomm,auto-sleep-disabled");
+
+	return ytphy_modify_ext_with_lock(phydev,
+					 YT8521_EXTREG_SLEEP_CONTROL1_REG,
+					 YT8521_ESC1R_SLEEP_SW,
+					 sleep ? YT8521_ESC1R_SLEEP_SW : 0);
+}
+
 /**
  * yt8821_get_features - read mmd register to get 2.5G capability
  * @phydev: target phy_device struct
@@ -3173,6 +3198,15 @@ static struct phy_driver motorcomm_phy_drvs[] = {
 		.suspend	= yt8521_suspend,
 		.resume		= yt8521_resume,
 	},
+	{
+		PHY_ID_MATCH_EXACT(PHY_ID_INT861X),
+		.name			= "YT861x Internal Gigabit Ethernet",
+		.flags			= PHY_IS_INTERNAL,
+		.config_init		= yt861x_config_init,
+		.soft_reset		= genphy_soft_reset,
+		.suspend		= genphy_suspend,
+		.resume			= genphy_resume,
+	},
 	{
 		PHY_ID_MATCH_EXACT(PHY_ID_YT8821),
 		.name			= "YT8821 2.5Gbps PHY",
@@ -3194,7 +3228,7 @@ static struct phy_driver motorcomm_phy_drvs[] = {
 
 module_phy_driver(motorcomm_phy_drvs);
 
-MODULE_DESCRIPTION("Motorcomm 8511/8521/8531/8531S/8821 PHY driver");
+MODULE_DESCRIPTION("Motorcomm 8511/8521/8531/8531S/861x/8821 PHY driver");
 MODULE_AUTHOR("Peter Geis");
 MODULE_AUTHOR("Frank");
 MODULE_LICENSE("GPL");
@@ -3205,6 +3239,7 @@ static const struct mdio_device_id __maybe_unused motorcomm_tbl[] = {
 	{ PHY_ID_MATCH_EXACT(PHY_ID_YT8522) },
 	{ PHY_ID_MATCH_EXACT(PHY_ID_YT8531) },
 	{ PHY_ID_MATCH_EXACT(PHY_ID_YT8531S) },
+	{ PHY_ID_MATCH_EXACT(PHY_ID_INT861X) },
 	{ PHY_ID_MATCH_EXACT(PHY_ID_YT8821) },
 	{ /* sentinel */ }
 };
-- 
2.53.0

