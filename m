Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E02F54C6815
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 11:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788868165; cv=none; b=qHhscoP9TwKEESLLeQhMyBynvksEc9RM9os77KJLL8LvFJO9b7a0n7kY6phADN+2ho9jdXb6ABuAigIlK4nlCKQo64NMW3y6xDbkRZRwrTg1T69nl9y4v7flM/5oMDv/bXQXQ+oGGbVV00ZHsdoSdA651yEfPRhOLtU/NFkFZRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788868165; c=relaxed/simple;
	bh=pPkX4ZCSOgGVsg5wOyPs3LJcvlwM6gg2e2JrTSH5rCU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=d7oCLk6YMHm7u15vlEW93lZQNCnGZveSp+B/i+MgrchLtFCe8M5StuoA4E8dkZdlq6vtOCA5By8iqDguMl9QvKl7k0Hts/Q9P8nF3Ly0q/2QAJNDfo6EyqHdRRc4dkSg6zrEvWbiiG18zgGV/hd/WdKRD5QCVo2n1EgZ2iEKJFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=njWvoyXs; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="njWvoyXs"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-853e2610bb4so3433757b3a.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 04:49:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788868150; x=1789472950; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FWahjOLZeOuA8y53+RJiiKikhM2zkWT0npxwrvNlESQ=;
        b=njWvoyXsy++OblNaNx2XgOVj+mC7Wzrphy673SpgN4TjO5xhqdinr9oDqAblXsjm4Q
         sEJvnLBcZ/XS1OVx9KlJBLb10s5xBF3RX43p46AmK4l9DONpOHjY5SyM8mFX1++U6AW2
         SGcLTOiAupYSZjW14GPCopvDYKCLdbvOkrBwxM9lr8ElAQP2GoSshbhFERaprr3MTML9
         az2p0sNkylNbKl9McvbW42rH1J9IFScSNR/Cc7XCD5o6i1D5mD6U4nsbI/4HtiK5jA7h
         ugTcSDXcgZEQ9tkQLg9ZUYwD1SyM8NLmsXiZY7b5hBLDM7XENYGQpitPSgXj0qzv1TwJ
         b8HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788868150; x=1789472950;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FWahjOLZeOuA8y53+RJiiKikhM2zkWT0npxwrvNlESQ=;
        b=lc3E6uI4dgozR+l3ALjuxlcc43WJZGWVov9fdQnK8DxXvmZmkPGeA7zZzSCTq4UlX3
         r3yt9VIA0Qw5flGlEwgYVRD0kLECQkSPdxnhUtTWIy0xW6G7ltps9DD4Q2iBx42ZQzN3
         QIzdVhriMNdmVyqGxk0yGQgK8z0GVHODC4UlDq+6fiVdrRRhBQsu60mha4IiyUjwhlWB
         WZ1cVl7sy0psXPHcDzede0ULtMHMCn9/1Szb8pDMHPf6bkrfyva8LiQ21yPgb/+U/qQh
         iwpLmeA8p9wEEjLvBZ8EvTBVCjDQy22YnoPzjQvckxUIjpbgpRuLmqbtAh0Ux17hi1pJ
         gtEg==
X-Forwarded-Encrypted: i=1; AKwUvByAZ0FIvwJfoWCrsGxJR6yXFIaO6X3eRttQklYLAFuePA+707AH+5DLZHGVrjSd53tLsy+MDMcFUe+g2Hg=@vger.kernel.org
X-Gm-Message-State: AFuF++khMIPcm6cura5EF4+wPEUfo21Corvzt7O5UOFS3V0EBVIKJr18
	9Hjagn3cpke1aXMPJmG4Xhfun2T5UMn0QHmj4ivazlWNNCyUXHEVDh4=
X-Gm-Gg: AYBFou0aLS5o+7PKK9LBHBGz5KjU0MkgnVlr83uZyFv9OztLnlkcxYBCL/FbZboDOM7
	zDKQ1dG8IMkX6ei34r0uIWbRX64rlfqR3OZFEsw6E92hT72DGRBolHGKvyq3iKveNkpi//3jW0A
	+uUaa/JTKASKUMeL02tFr07pP7sEGc2HYiS6gPqXDAC5CzHN5FARs3tHTBC+1mWHAofjUM8IPMt
	b8m959PPGmSLWbBwrJ/wWxdMOZTbMCowhuoJ7YGJwdoA5uFkZrs56wDIYRFLow3OPnygi/WEInC
	H2wmWSxUbyl6sHxVXtaG76h9KZSGfwS34egIVrg2ur9dpJPuG0sbSqrslvpIBB1lX5+uIBVzjRr
	KAU6wJDCAAuJiZtgmfud1a5W3pum1A7rkhwUdsL18bKuq6Zvl0GxyBCaSJ+eeK8UH1eB7jJ4ers
	VF12MSReVRKOYs1/AsLI9JmJfAxB0F7k6mO3A2P/pi7eRuYIlLOr2g7u37FRgLLVEv+O1KM311X
	kQusISfABIadlM8pUO066oilfI=
X-Received: by 2002:a05:6a00:159a:b0:84a:65e8:137e with SMTP id d2e1a72fcca58-85ffe1099ecmr24926151b3a.17.1788868149800;
        Tue, 08 Sep 2026 04:49:09 -0700 (PDT)
Received: from ydg-Zenbook-14-UM3406GA ([2001:2d8:6467:d689:f6ea:9d29:b387:9ed5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86152d2ff5bsm5330169b3a.35.2026.09.08.04.49.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 04:49:07 -0700 (PDT)
From: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Russell King <linux@armlinux.org.uk>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	donggeunyoo.kernel@gmail.com
Subject: [PATCH net] net: phy: dp83867: restore the LED polarity after a soft reset
Date: Tue,  8 Sep 2026 20:49:01 +0900
Message-ID: <20260908114901.74637-1-donggeunyoo.kernel@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

dp83867_led_polarity_set() programs the LEDCR2 polarity bit for a
DT-configured LED. It runs once, from phy_probe() via of_phy_leds().
Every phy_init_hw() afterwards (phy_attach_direct(), mdio_bus_phy_resume(),
and MAC drivers such as fec_main.c) calls .soft_reset first, and
dp83867_phy_reset() issues DP83867_SW_RESET, which restores register
defaults. config_init does not touch LEDCR2 and the requested value is
not cached, so a DT-configured LED polarity is lost from the first
attach onward.

The soft reset is the only path that clears LEDCR2, and phy_init_hw()
always follows it with config_init. Cache the requested bits and reapply
them from dp83867_config_init(). aqr_gen1_config_init() recovers from the
same reset the same way (61578f679378).

Fixes: 447b80a9330e ("net: phy: dp83867: Add support for active-low LEDs")
Assisted-by: Claude:claude-fable-5
Signed-off-by: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
---
The soft-reset regression was flagged by an automated analysis of an
earlier posting of the active-high series. Compile-tested and
call-chain-traced only; I have no affected hardware.

 drivers/net/phy/dp83867.c | 22 +++++++++++++++++++---
 1 file changed, 19 insertions(+), 3 deletions(-)

diff --git a/drivers/net/phy/dp83867.c b/drivers/net/phy/dp83867.c
index 88255e92b4cd..c9c3b0062cc7 100644
--- a/drivers/net/phy/dp83867.c
+++ b/drivers/net/phy/dp83867.c
@@ -196,6 +196,8 @@ struct dp83867_private {
 	bool set_clk_output;
 	u32 clk_output_sel;
 	bool sgmii_ref_clk_en;
+	u16 led_polarity;
+	u16 led_polarity_mask;
 };
 
 static int dp83867_ack_interrupt(struct phy_device *phydev)
@@ -896,6 +898,15 @@ static int dp83867_config_init(struct phy_device *phydev)
 			       mask, val);
 	}
 
+	/* Restore the LED polarity dropped by the soft reset in phy_init_hw() */
+	if (dp83867->led_polarity_mask) {
+		ret = phy_modify(phydev, DP83867_LEDCR2,
+				 dp83867->led_polarity_mask,
+				 dp83867->led_polarity);
+		if (ret)
+			return ret;
+	}
+
 	return 0;
 }
 
@@ -1141,8 +1152,10 @@ static int dp83867_led_hw_control_get(struct phy_device *phydev, u8 index,
 static int dp83867_led_polarity_set(struct phy_device *phydev, int index,
 				    unsigned long modes)
 {
+	struct dp83867_private *dp83867 = phydev->priv;
+	u16 mask = DP83867_LED_POLARITY(index);
 	/* Default active high */
-	u16 polarity = DP83867_LED_POLARITY(index);
+	u16 polarity = mask;
 	u32 mode;
 
 	for_each_set_bit(mode, &modes, __PHY_LED_MODES_NUM) {
@@ -1154,8 +1167,11 @@ static int dp83867_led_polarity_set(struct phy_device *phydev, int index,
 			return -EINVAL;
 		}
 	}
-	return phy_modify(phydev, DP83867_LEDCR2,
-			  DP83867_LED_POLARITY(index), polarity);
+
+	dp83867->led_polarity_mask |= mask;
+	dp83867->led_polarity = (dp83867->led_polarity & ~mask) | polarity;
+
+	return phy_modify(phydev, DP83867_LEDCR2, mask, polarity);
 }
 
 static unsigned int dp83867_inband_caps(struct phy_device *phydev,
-- 
2.53.0

