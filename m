Received: from mail-pj2-f42.google.com (mail-pj2-f42.google.com [74.125.227.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EF303A75A2
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 22:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789682503; cv=none; b=s9rgbETuEWFMWiHljvAicLE3DM3Wk13uCdcze/47PqJa5rpnFhOt5LSyHMS0cxypIxU277bzcU5xMSjnegk9d0HE8TWiwHnKZwJhFj+Yth/MLrL7uVd3ambuRx/IgFelNSwPw+oG0DKooILKXT5sEMsKpmusNeBkcPH4EXK5ttk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789682503; c=relaxed/simple;
	bh=3FbVHQnTkGovq9MgVS1AQASJkqVSWyehhrk2OYOMakI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oAL04jvigWqs7ajYXw4iEPsMlO1PCcLGMlJbggOEH4kt32EKD3bqqvCmCqoCpPl26qTTlojeD06QTcq6xfXu4Jaw1KGt+cqfomziAeNk9NpDPRZiSI6aCLZ0eqCuExMAK2uUb2a4a9vdJf8BnTfhbYbGNxGty4EFIwnkTyenceQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p1mutKsU; arc=none smtp.client-ip=74.125.227.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p1mutKsU"
Received: by mail-pj2-f42.google.com with SMTP id 98e67ed59e1d1-396ccafb74fso137866a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 15:01:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789682500; x=1790287300; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=s26IKeArHLYvAsw8SAUC36S/S5ndCgDyvi2cfvHZSzE=;
        b=p1mutKsUJfYS5DICIzP1SbGJtbXs6bFz50GqM6/1fpxp6XCMpmNA4+uHR7YVV/NTYh
         wprRa08STJaxRoeBO/3JzSLB0YM7dZTkOZ/odqIeKfQNnMxMcMLAlIRh07Z5M46fRiTI
         WuE1hIaUOaHvVkc+vWJTU2z2VwsACDPCU+cLFumui28cxLbgNTiZFWL5BGB6iWfWvdUI
         AlplhNZdXvZ2N/3+S02EdoQPbA5RSrG56lZl+Ei93fHoONjBiXAlAhdym4++DcxR0Mn3
         95mdWWJc4/lFnMK2L93IBIkLPRnJW4MqCsgz2UJihk1Cg0vb5Vd7o+EmjnDbswaOgrSl
         ytDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789682500; x=1790287300;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s26IKeArHLYvAsw8SAUC36S/S5ndCgDyvi2cfvHZSzE=;
        b=pJiTdjUiG1hc+LcPU7Wv9uel+d1QLF8T1PEcp4mIXE3RZv0qZl6khjZsg5vcs1wQDy
         +fLICkLyGOr9CknBS4yXiU5vo8ww7Myn5oS6MRElnJd7+0+0onhe7KJhlkTIV1Mwq1iA
         BTLbb4FftLzKzOzIj9ui19hHzfxoaGv4uaZz43GXIfzDxMVo0UvGbwkeZj7yTylZFgB7
         5b45IkRoQVRHpaQ5924+JOkHr/py+cgNXzsU0gZvqWZsykHLk6wNpWm3jIuVjAliOZlB
         UhSikP5tozfWKTA2W2dRDRSlhxeqaVj8/s0jYOtrR1opcAsTa3gax3stTjK4aZpv/QMz
         /B6w==
X-Forwarded-Encrypted: i=1; AKwUvByP7XyVTdKuwn9KzNJey3kxmqgNmMjF3Lt+0AE/64mKFIqCC+r3OcTZJMiQPSLjoYK2Jx0MJsZ/xu+f4P0=@vger.kernel.org
X-Gm-Message-State: AFuF++nqsSepSplyRfMjP+HkUFbYcm+lDD0tECy1a7xbgcJGzF+/x4rQ
	Kgc1QnFebiFX6lJVWrxsho8PhUHKmRpJgCEvs5i5b+chItudpjbuyaIv
X-Gm-Gg: AYBFou1G3dNhESpxF8r+GDiXT/IbAr048C72ijkNka8HUS0QBhMXbp54igTVB3qbnoq
	MxqKfYcLKbdOM8yHVhPFfgHxZBdCBa9GZj77pr7pk1dDOp+g/YvJWyQUotTPazAR3C27awaX/jL
	LPFKg+/ir5AsB2w0bcKkj4cuaeUmQk1KOEFryEfhIqxATuJTH7Vp3+Iv+sYSwu47yPNfFE5kZQA
	tALpBXZzeqWsf+svOoqFv+oJQPIVZN008Qarag6ALv8ejk2G4ZQKQFTKErS2zGGqDaiA7iwZrV9
	KlEnWsH8hwaN5k0AHnv/G2nDjNXZ9RyNPz/dI5UClcT8EiR+HfLcm9BPDq6SI34xRP2BdG34VgL
	qpj2dXpcDtTs3sxJ+6t0u7Y07ML/TkuJlGG/ZOV0QeEXEV94OfPhV+XKqqFb+xSdoynU6Q+17GD
	Q/4L5Z8EznfGa1FnXKg9weGxZDkw7wCHyrk+fN0JqdLGVtMS60EGiWVrD7nxU25eCMYyPO1s1Am
	BhFGGwIWdav6k8UY0j9jYAXab+UdJbjSu+k2vWYFZzxpbPuzOcj9L9NzfvTALZjPVHwxTOsG7ew
	oaLz/NHfKLejwnVviGY21typw18RRI3ydnP4eQCEwo+o4qVrh598jToKQoA=
X-Received: by 2002:a17:90b:380b:b0:39e:4fec:d6e5 with SMTP id 98e67ed59e1d1-39e550707e6mr1200498a91.16.1789682499730;
        Thu, 17 Sep 2026 15:01:39 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14395cfb0b1sm14235004c88.5.2026.09.17.15.01.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 15:01:38 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: netdev@vger.kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Michael Stapelberg <michael@stapelberg.de>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH net] net: phy: marvell: keep WOL_EIE across interrupt reconfiguration
Date: Thu, 17 Sep 2026 15:01:36 -0700
Message-ID: <20260917220136.97017-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On the 88E1318S/88E1510, copper page register 0x12 is both the
MII_M1011_IMASK interrupt mask used by marvell_config_intr() and the
CSIER register in which m88e1318_set_wol() arms the WoL interrupt
(MII_88E1318S_PHY_CSIER_WOL_EIE). marvell_config_intr() rewrote the
whole register, so any interrupt reconfiguration (for example the
phy_disable_interrupts() on link down behind mvneta) silently cleared
WOL_EIE: m88e1318_get_wol() still reported WAKE_MAGIC, but a matched
magic packet was no longer routed to INTn and the board did not wake.

Give these two PHYs a dedicated config_intr that preserves WOL_EIE with
a read-modify-write, and a handle_interrupt that also claims the WoL
event mirrored in the interrupt status register. Other Marvell PHYs keep
the plain marvell_config_intr()/marvell_handle_interrupt().

Fixes: 3871c3876f80 ("mv643xx_eth with 88E1318S: support Wake on LAN")
Assisted-by: LLM
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/net/phy/marvell.c | 70 ++++++++++++++++++++++++++++++++++++---
 1 file changed, 66 insertions(+), 4 deletions(-)

diff --git a/drivers/net/phy/marvell.c b/drivers/net/phy/marvell.c
index f71cffa88406..0897cfcd6ab7 100644
--- a/drivers/net/phy/marvell.c
+++ b/drivers/net/phy/marvell.c
@@ -425,6 +425,68 @@ static irqreturn_t marvell_handle_interrupt(struct phy_device *phydev)
 	return IRQ_HANDLED;
 }
 
+/*
+ * On the 88E1318S/88E1510, copper page register 0x12 serves two
+ * masters: it is the MII_M1011_IMASK interrupt mask for the generic
+ * Marvell interrupt handling, and m88e1318_set_wol() sets the WoL
+ * interrupt enable bit (MII_88E1318S_PHY_CSIER_WOL_EIE) in it. The
+ * interrupt routines below therefore preserve that bit, so reconfiguring
+ * the PHY interrupts cannot disarm Wake-on-LAN behind the user's back.
+ */
+static int m88e1318_config_intr(struct phy_device *phydev)
+{
+	int val, err;
+
+	val = phy_read(phydev, MII_88E1318S_PHY_CSIER);
+	if (val < 0)
+		return val;
+
+	if (phydev->interrupts == PHY_INTERRUPT_ENABLED) {
+		err = marvell_ack_interrupt(phydev);
+		if (err < 0)
+			return err;
+
+		err = phy_write(phydev, MII_88E1318S_PHY_CSIER,
+				MII_M1011_IMASK_INIT |
+				(val & MII_88E1318S_PHY_CSIER_WOL_EIE));
+	} else {
+		/* Disable the PHY interrupts, but keep WOL_EIE set so an
+		 * armed magic packet still asserts INTn while the
+		 * interface is down or the machine is suspended.
+		 */
+		err = phy_write(phydev, MII_88E1318S_PHY_CSIER,
+				val & MII_88E1318S_PHY_CSIER_WOL_EIE);
+		if (err < 0)
+			return err;
+
+		err = marvell_ack_interrupt(phydev);
+	}
+
+	return err;
+}
+
+static irqreturn_t m88e1318_handle_interrupt(struct phy_device *phydev)
+{
+	int irq_status;
+
+	irq_status = phy_read(phydev, MII_M1011_IEVENT);
+	if (irq_status < 0) {
+		phy_error(phydev);
+		return IRQ_NONE;
+	}
+
+	/* Claim events from the IMASK_INIT set as well as the WoL event
+	 * mirrored from WOL_EIE in the enable register.
+	 */
+	if (!(irq_status & (MII_M1011_IMASK_INIT |
+			    MII_88E1318S_PHY_CSIER_WOL_EIE)))
+		return IRQ_NONE;
+
+	phy_trigger_machine(phydev);
+
+	return IRQ_HANDLED;
+}
+
 static int marvell_set_polarity(struct phy_device *phydev, int polarity)
 {
 	u16 val;
@@ -3817,8 +3879,8 @@ static struct phy_driver marvell_drivers[] = {
 		.config_init = m88e1318_config_init,
 		.config_aneg = m88e1318_config_aneg,
 		.read_status = marvell_read_status,
-		.config_intr = marvell_config_intr,
-		.handle_interrupt = marvell_handle_interrupt,
+		.config_intr = m88e1318_config_intr,
+		.handle_interrupt = m88e1318_handle_interrupt,
 		.get_wol = m88e1318_get_wol,
 		.set_wol = m88e1318_set_wol,
 		.resume = genphy_resume,
@@ -3925,8 +3987,8 @@ static struct phy_driver marvell_drivers[] = {
 		.config_init = m88e1510_config_init,
 		.config_aneg = m88e1510_config_aneg,
 		.read_status = marvell_read_status,
-		.config_intr = marvell_config_intr,
-		.handle_interrupt = marvell_handle_interrupt,
+		.config_intr = m88e1318_config_intr,
+		.handle_interrupt = m88e1318_handle_interrupt,
 		.get_wol = m88e1318_get_wol,
 		.set_wol = m88e1318_set_wol,
 		.resume = m88e1510_resume,
-- 
2.55.0

