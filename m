Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794842893;
	b=AOSOQvdH/vxDGEHQ6cQHwpThHF3ybnSE8qQyEPLe1X35e9kZ1Duqj8T0b9Z+00J8x304
	 AQW1Kmy22kahNBmwha6Ldzl6ALtv1qFWNIvDdWrUnOexInJ7wCHBlyyfJ/6lG3CqcGhs4
	 dve2Jfr2PXhSkhcc3eXbVGz02+eyxCS2u1khS8HqDFR5QlkyAWYt/PTjHQRWYW8K4iLIa
	 jW7wbKzHQR+VrkF9xwzoR0mTqEenvYtrslrmVszPcCKhCPQdlGFHqadtLrTpGv1RR90fg
	 BGTYA8mkqcWbk3cbH8oW9OkEWOpvsOfMK0n7paeU5INJEnrNQ1Wa0HadnbyQCK1S6zw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794842893;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Last-TLS-Session-Version;
	bh=SuEFiNcp59oinyTRJDhBZEloO8wBbsl1tv0A9wdn0hk=;
	b=xrz/sfEWFruXyxswJMA0kXzYC5V4hTCcSIsAd86iBuV1BKMXzz3hlk7SBTaUd/y0e49j
	 cbVvRPK/46aRhKyNH3xgp/oc4kwY6XeIdJRd3V+fNeIXfoyvElwZN2wvzNJWIDTidspJg
	 MyeIpewZ7Sa88lIvh5RDhRziTtlvBqhezqh+4JNR37u/E+thL3PUTIFfXpf7K5QF0XCWN
	 VyMb0E8/G4DRGHWrx3Rszki4J1nFtJsg4HWfpZhg2DU/tJPjhEqcoD0OwAljlJA3jqf+X
	 Il1wa2gFzUNMyOwGdXSmmzaK86+TBnqMcYzb8xEnK2cpfko+5Z+MlfBzMdwOWratG5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=SxnHZqRE;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABA8D606A895
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 15:28:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ABA8D606A895
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=SxnHZqRE
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 6B47E1A169B;
	Mon, 16 Nov 2026 15:28:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 390646023F;
	Mon, 16 Nov 2026 15:28:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B635011BC0D9C;
	Mon, 16 Nov 2026 16:28:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794842890; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=SuEFiNcp59oinyTRJDhBZEloO8wBbsl1tv0A9wdn0hk=;
	b=SxnHZqREMCZsroeL2ATb30HVSCsLvFHOounjpAaemoFnmzUsReQoWEFli3tkfiDS5xG2QR
	RpYvl0NygBvF2TfPV/v9drFTyqDHASEHFpagVRLLeS7PSWuwNXqqz9FaedxAZABwdkfnJ1
	NPtriiZLD2xCbvnBVuMCRimm80PrkZiJg7+nLgBiy1G3BHPyPL1ypmKe+0khDL9IWKQGu3
	pM4S+sP4Tum97t5zFHQxWSM9mR5fY+q7CkpgPIQcPmgRdzky1k5xpcRbgAPIXh8X7BGIry
	nc7cBjnXSMUKm0467jlQU9Ot7YhJtoyBp5iFZUbL3irOM4NTVm45JsKAs1HnoQ==
From: Paul Louvel <paul.louvel@bootlin.com>
Date: Mon, 16 Nov 2026 16:27:04 +0100
Subject: [PATCH net-next v2 4/4] net: phy: marvell: add RGMII-to-Copper
 mode configuration
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261116-marvell-phy-rgmii-v2-4-e04dca67e89a@bootlin.com>
References: <20261116-marvell-phy-rgmii-v2-0-e04dca67e89a@bootlin.com>
In-Reply-To: <20261116-marvell-phy-rgmii-v2-0-e04dca67e89a@bootlin.com>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Herve Codina <herve.codina@bootlin.com>, 
 "Paul Louvel (Schneider Electric)" <paul.louvel@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794842859; l=1938;
 i=paul.louvel@bootlin.com; s=20260313; h=from:subject:message-id;
 bh=2l5oMzXH+scX08Gvc0D3OEJ8LMAGR2j8N4VB8pOdCEo=;
 b=42GjufwWYJT5s0O7wuP9zKe8TQQN1h7ZI/CLJbxUgSc8PkzdPSTLKmu5Gp8nsKJOCNkeCQ6ql
 iywfNEwj4f4A0cc9vFtHYZor8KX9hlCfvUwoPI3HPYIPFNPMAzyAQ82
X-Developer-Key: i=paul.louvel@bootlin.com; a=ed25519;
 pk=eLW50NT18UAvUT5cAcYf88zNbBCZDLFXuptpyLVhVIU=
X-Last-TLS-Session-Version: TLSv1.3

The driver currently programs the mode only for SGMII-to-Copper, based
on the PHY interface mode.

Some MACs connect to the PHY via RGMII. Add code in
m88e1510_config_init() to configure the device.

Do not overwrite the media interface mode configured via
m88e1510_port_configure_serdes().

Signed-off-by: Paul Louvel (Schneider Electric) <paul.louvel@bootlin.com>
---
 drivers/net/phy/marvell.c | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/drivers/net/phy/marvell.c b/drivers/net/phy/marvell.c
index a72d307eaf12..9748fdd843ff 100644
--- a/drivers/net/phy/marvell.c
+++ b/drivers/net/phy/marvell.c
@@ -1341,6 +1341,23 @@ static int m88e1510_config_mode(struct phy_device *phydev, u16 mode)
 	if (oldpage < 0)
 		goto error;
 
+	ret = __phy_read(phydev, MII_88E1510_GEN_CTRL_REG_1);
+	if (ret < 0)
+		goto error;
+
+	if (mode == MII_88E1510_GEN_CTRL_REG_1_MODE_RGMII) {
+		switch (FIELD_GET(MII_88E1510_GEN_CTRL_REG_1_MODE_MASK, ret)) {
+		case MII_88E1510_GEN_CTRL_REG_1_MODE_RGMII:
+		case MII_88E1510_GEN_CTRL_REG_1_MODE_RGMII_1000X:
+		case MII_88E1510_GEN_CTRL_REG_1_MODE_RGMII_100FX:
+		case MII_88E1510_GEN_CTRL_REG_1_MODE_RGMII_SGMII:
+			ret = 0;
+			goto error;
+		default:
+			break;
+		}
+	}
+
 	ret = __phy_modify(phydev, MII_88E1510_GEN_CTRL_REG_1,
 			   MII_88E1510_GEN_CTRL_REG_1_MODE_MASK, mode);
 	if (ret < 0)
@@ -1403,9 +1420,11 @@ static int m88e1510_config_init(struct phy_device *phydev)
 	if (err < 0)
 		return err;
 
-	/* SGMII-to-Copper mode initialization */
+	/* RGMII/SGMII-to-Copper mode initialization */
 	if (phydev->interface == PHY_INTERFACE_MODE_SGMII)
 		err = m88e1510_config_mode(phydev, MII_88E1510_GEN_CTRL_REG_1_MODE_SGMII);
+	else if (phy_interface_is_rgmii(phydev))
+		err = m88e1510_config_mode(phydev, MII_88E1510_GEN_CTRL_REG_1_MODE_RGMII);
 	if (err < 0)
 		return err;
 

-- 
2.56.1

