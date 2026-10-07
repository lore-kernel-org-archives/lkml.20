Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A56134041C
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 18:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791397277; cv=none; b=Ku3cuMI0GJGgMKmyb/PDAwMjx0NhO2vKomQcl3zRB9C/8PlP6V6ffPThZsLITs8Vuf0yH0jGmpzz4zgWZDilR/SdMKZjDUKzBZKAuKtp0sNTNXjTs2k0wvpreqXfDZAPbqtoFPsTFK/zR4ZEcCcbkBHGs1xHvSrCFBNDE4fa66k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791397277; c=relaxed/simple;
	bh=Nrf1YDM+DHXNlm7iRVDD+KL8xnbrZmtwsna5FgXWzk0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=j9TasExB4LwrNMXYb/iVjWKNpvsVYTtT1hDwmoq2YLiZZDfxLEJ50dNBCEtNer7RVjOBWi120qlqArSQeajBuTz7kZT03xx3xOBAvtuufGKbpVdthPgnYMsH3oL2ajuOWbbSxJ9RoVG+5eD6hIbR+pZiPaxiApmLH/DaO4eZi8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p3RuL73Q; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p3RuL73Q"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3a89d1ca907so1120447a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 11:21:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791397275; x=1792002075; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nKSKlzqYN/O2yAt1o5xzoyGbTxhQiLSVcfOd9AG52bQ=;
        b=p3RuL73QGPaKSbVoO6IR1fVvMW9rLv+H7nykMoCDGy5w38edy7Cbw9lFgEgb6DvKML
         2pkrhnZBus/znLtjYh3wUI3V9PRFh/QGucdUkAFFCm6n7XSDKTcUzmAWryJSmcygWdSX
         9TMAed4LupExk6YFRZauIi3cVrqo4omI49M/215Y14eZPkauj59o3dFZNdSU3O1KKCUw
         pgYAn335Sh/YorG9KJhGcSDbtGkCM2GVJhmRpsVxZEBbSRedVJ2gF2Ean4QI+Rs7NhPY
         RUOufVwSWAHDado/Ajsjp5yVkNdjJwPjARnutZIvnBoms3LMBR3wEdiyUUBxMhBPizEZ
         JigA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791397275; x=1792002075;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nKSKlzqYN/O2yAt1o5xzoyGbTxhQiLSVcfOd9AG52bQ=;
        b=YMr6il0C7ON0QN5hxIQs7i9uKpsWTxECltWsHpaknGoyQU+6jhw8E8GvNPw1aymJzt
         9hcbpPIxhXi9R2B3Li8njrFP+AssK1IqHIAHddy4HvHn5n8DasJ4514NZGfJ/JzNfDKB
         OjtKBxwwTyPCraDiSFevZJjWbIqgPECkbt9BadbGcpNj8lCUhhAhS8h1sdML2j1B6Klh
         g+0Uo7x4UPwnOHee9TULmi+sHKuYAnEbSGIMG+cRWxkosINUtlZ27zSeXR9uMQX9upLU
         t8BuNLic3U/+UpGkwOuLRPTU+2DIHbSG9PIABLJWFyZ+QrQu79Yd+nAfxqa4fXOufBlU
         HRlw==
X-Forwarded-Encrypted: i=1; AKwUvBzAyZzAA7Kft08jBmOnPBLS3eaak8QS8+iFmrzdWGrCglOGUs+dTEc698wPtZhNx4rThduMLbVk4gI3yuE=@vger.kernel.org
X-Gm-Message-State: AFq9FYK/ftImpxvgjl/5q2B2SkM1khwuOK7wTmrAMjIZKUapfV+S+6rB
	GzXyb8NTHyTdQ3kKiCoyK7A1DD+/XFTZxmp6n4HROC01iyQPxJiQjPf5
X-Gm-Gg: AYBFou3peXFwCy4sZN0HLhMA4L+c730cU/NJXVWZoMFh8rmk08sLm1KLFQM1YK5GYmy
	tvqULh68pj+fyXS94OpnD65uCQVZNnkIuFC/wzPu6j3r2eugoB2OM+2gDbtN4QNSnCqU9zfCaw3
	gYvh1xMaVRcSZY4Eg+4Av3i4+IT390DslGAHLfr15vl3kDAxiD2ftFOOxt9Z73IvAohtD0Rirck
	7XjW8HoNe8tcb9waiIp4W6oCubmSIaKgpctkXlggQVwddF6cfKv7Tp3jfBQzyj8CPgDRwQn96iq
	JL5nCYWgbpzA3daDFN1batQAcSFOKxk5igU67n9THQ7aR/IBx1ALc/ph+Ubn0q7QBG+pAhh09oK
	NpqkMt9b8G/zz84Oyo8HaUEH2U4H6qaUc1ZPh7JKYHCZS6fzrW4R5UCc9F3Vv0aXdNZNDva1ThI
	Aet2nS7vSHuxMUR4mPsxudEOKKzfDH9byyZ3m2YqSYSEpRljDJ9IGhczAdFfZxy0TOmLX/BPwJ0
	kFX18Zfj3pR8V02vSblq/QIHoTKMmIHFi88Rfb6uMJhZgqOJXt2fu7KZVgsciN5URaPfaVR3T07
	+i7Clr8rihddu0Ik10o08nj6AbqfcVxHLojrACtn1QeiOf9Z
X-Received: by 2002:a17:90b:4b07:b0:39e:6a80:b793 with SMTP id 98e67ed59e1d1-3a8a0de64famr3014829a91.35.1791397274686;
        Wed, 07 Oct 2026 11:21:14 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a9ff7aaf8asm642007a91.6.2026.10.07.11.21.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 11:21:14 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: netdev@vger.kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Michael Stapelberg <michael@stapelberg.de>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH net v4] net: phy: marvell: keep WOL_EIE across interrupt reconfiguration
Date: Wed,  7 Oct 2026 11:21:12 -0700
Message-ID: <20261007182112.821061-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

marvell_config_intr() rewrote the whole interrupt enable register, so
the config_intr call from phy_init_hw() on resume silently cleared
WOL_EIE on the 88E1318S and 88E1510: m88e1318_get_wol() still reported
WAKE_MAGIC, but a matched magic packet was no longer routed to INTn and
the board did not wake.

Make config_intr update every bit except WOL_EIE with phy_modify(), so
the WoL interrupt enable is owned only by set_wol and always matches
what it programmed. The read-modify-write runs under the MDIO bus lock,
as do the accesses in m88e1318_set_wol(), so the two can no longer
overwrite each other's update. Have m88e1318_set_wol() clear WOL_EIE
when WoL is fully disabled, since config_intr no longer does.

The interrupt register layout is the same across the PHYs this driver
handles, so extend the shared handler to also claim a WoL event instead
of adding a per-PHY one.

Fixes: 3871c3876f80 ("mv643xx_eth with 88E1318S: support Wake on LAN")
Assisted-by: LLM
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v4: remove MII_88E1318S_PHY_CSIER_ defines.
 v3: use phy_modify()
 v2: resolved review warnings, including wol d.
 drivers/net/phy/marvell.c | 39 +++++++++++++++++++++++++++------------
 1 file changed, 27 insertions(+), 12 deletions(-)

diff --git a/drivers/net/phy/marvell.c b/drivers/net/phy/marvell.c
index f71cffa88406..5f9a43a4a063 100644
--- a/drivers/net/phy/marvell.c
+++ b/drivers/net/phy/marvell.c
@@ -55,6 +55,12 @@
 #define MII_M1011_IMASK			0x12
 #define MII_M1011_IMASK_INIT		0x6400
 #define MII_M1011_IMASK_CLEAR		0x0000
+#define MII_M1011_IMASK_WOL		BIT(7)
+/* Bits updated by config_intr. The WoL interrupt enable is owned by
+ * set_wol, so the config_intr call from phy_init_hw() on resume does not
+ * silently disarm Wake-on-LAN.
+ */
+#define MII_M1011_IMASK_CONFIG_MASK	(U16_MAX & ~MII_M1011_IMASK_WOL)
 
 #define MII_M1011_PHY_SCR			0x10
 #define MII_M1011_PHY_SCR_DOWNSHIFT_EN		BIT(11)
@@ -139,11 +145,6 @@
 #define MII_88E1318S_PHY_MSCR1_REG	16
 #define MII_88E1318S_PHY_MSCR1_PAD_ODD	BIT(6)
 
-/* Copper Specific Interrupt Enable Register */
-#define MII_88E1318S_PHY_CSIER				0x12
-/* WOL Event Interrupt Enable */
-#define MII_88E1318S_PHY_CSIER_WOL_EIE			BIT(7)
-
 #define MII_88E1318S_PHY_LED_FUNC		0x10
 #define MII_88E1318S_PHY_LED_FUNC_OFF		(0x8)
 #define MII_88E1318S_PHY_LED_FUNC_ON		(0x9)
@@ -393,11 +394,13 @@ static int marvell_config_intr(struct phy_device *phydev)
 		if (err)
 			return err;
 
-		err = phy_write(phydev, MII_M1011_IMASK,
-				MII_M1011_IMASK_INIT);
+		err = phy_modify(phydev, MII_M1011_IMASK,
+				 MII_M1011_IMASK_CONFIG_MASK,
+				 MII_M1011_IMASK_INIT);
 	} else {
-		err = phy_write(phydev, MII_M1011_IMASK,
-				MII_M1011_IMASK_CLEAR);
+		err = phy_modify(phydev, MII_M1011_IMASK,
+				 MII_M1011_IMASK_CONFIG_MASK,
+				 MII_M1011_IMASK_CLEAR);
 		if (err)
 			return err;
 
@@ -417,7 +420,7 @@ static irqreturn_t marvell_handle_interrupt(struct phy_device *phydev)
 		return IRQ_NONE;
 	}
 
-	if (!(irq_status & MII_M1011_IMASK_INIT))
+	if (!(irq_status & (MII_M1011_IMASK_INIT | MII_M1011_IMASK_WOL)))
 		return IRQ_NONE;
 
 	phy_trigger_machine(phydev);
@@ -1991,8 +1994,8 @@ static int m88e1318_set_wol(struct phy_device *phydev,
 			__phy_read(phydev, MII_M1011_IEVENT);
 
 		/* Enable the WOL interrupt */
-		err = __phy_set_bits(phydev, MII_88E1318S_PHY_CSIER,
-				     MII_88E1318S_PHY_CSIER_WOL_EIE);
+		err = __phy_set_bits(phydev, MII_M1011_IMASK,
+				     MII_M1011_IMASK_WOL);
 		if (err < 0)
 			goto error;
 
@@ -2074,6 +2077,18 @@ static int m88e1318_set_wol(struct phy_device *phydev,
 			goto error;
 	}
 
+	if (!(wol->wolopts & (WAKE_MAGIC | WAKE_PHY))) {
+		err = marvell_write_page(phydev, MII_MARVELL_COPPER_PAGE);
+		if (err < 0)
+			goto error;
+
+		/* Disable the WOL interrupt, config_intr leaves it alone */
+		err = __phy_clear_bits(phydev, MII_M1011_IMASK,
+				       MII_M1011_IMASK_WOL);
+		if (err < 0)
+			goto error;
+	}
+
 error:
 	return phy_restore_page(phydev, oldpage, err);
 }
-- 
2.56.0

