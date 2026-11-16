Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794842890;
	b=DSOWN8Pe5LJu3JsAHzaAhOtKhz5+TbfP3DvQJnm8PvAOpn9XdgnmOnd24UJUoGSocwbi
	 5UghhCqf8ymOTDfdInQzvE2q5as09+7b54lRtZiBUskpEg2ubCfIQp4Tn4uuCjqLuyS6N
	 BsS7EoK0Z4izVMzwgunZD+2yIVDii9Ze7eaUURfrdumZIHvPWWK8nKfXTrAgLZnm5IUhM
	 T9VHc9qUYTTY9+RlwGYu0yV8EshV+gSY10HXUQ1rA//p/PNcWK3kOwfW7431A9lSt8j3a
	 Zk3YOzv/01SRI8Lh6KlCN9kakKUboGq6GWUCLcUUDJDPjtC6/vQ+ucQxBfC817RjVnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794842890;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Last-TLS-Session-Version;
	bh=yC/f2io6eZKSrVGjvDAHaktUlHU4Pk438pSIJ1p28Ao=;
	b=LZQQaHCLyC62KMrhZLocoxCTg+0nBa4z4px2k84E8KPK8GpAQehnDrTd8wlJqptcMC0+
	 vi0A/b6fVbZszBdolto5uz5D45oITnF0pm8IRGiYfMoaW4MsbaDBRS7f3bhEFOHzXYisF
	 VNrdZFtz9FEw9LZ+CV5lYm70HO/scdlQ0bEbrYuTbMPmkP/5jMrxVSD8IU54XnRm/DelN
	 mxZ1uQTK4ZwlKmUYfVE8h9tx+iiFgmM/mNEJ/qkDIOnyNGzZ9NHnmdvMMnN6qiLLxs00l
	 V7Nvz/0CY15IMAqkfr+aGcyO/e/rpXPry7SXD5AfAr1OVLsAxkaM3FXC96VLy5opa+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=iQ7Ey4rh;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED7A2606A32C;
	Mon, 16 Nov 2026 15:28:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED7A2606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=iQ7Ey4rh
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 6B3641A169A;
	Mon, 16 Nov 2026 15:28:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3EF586023F;
	Mon, 16 Nov 2026 15:28:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2143A11BC05D6;
	Mon, 16 Nov 2026 16:28:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794842887; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=yC/f2io6eZKSrVGjvDAHaktUlHU4Pk438pSIJ1p28Ao=;
	b=iQ7Ey4rh7HgwJP04umqitHXktQqBG/1UKjVRSgzktzNt/qrQ/7H4VAVUtYn76rH8uJEaC/
	3DgkaOyXz01tSkCV6cfDJ+SkTh1ttZXw7n3l6V1Le6ZpE03PiV/ROzjD6q5uXD41fUEY4H
	/RSg1vsv800TttFPpsI3pOzvgw3s6bV0DcQch4MYceMQ18ooEVg5Fp6EtBzdsD6Lb0y7ei
	HPBakaqNhsc2bs4DuyprTHq0EfJ/7B4ShQ3yYYNfpj+dTlrkMne8wWV3qmy8/lYeTwoqYZ
	gHgeH35aiHG3lqGG4vYw9cCtAxAgzsPuUaEuAyR/ASXZMTZ2gGbLpFIQY3qJTA==
From: Paul Louvel <paul.louvel@bootlin.com>
Date: Mon, 16 Nov 2026 16:27:03 +0100
Subject: [PATCH net-next v2 3/4] net: phy: marvell: factor out EEE errata
 initialization
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
Message-Id: <20261116-marvell-phy-rgmii-v2-3-e04dca67e89a@bootlin.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794842859; l=2645;
 i=paul.louvel@bootlin.com; s=20260313; h=from:subject:message-id;
 bh=qO+OjKyPmYC8vKg/bipZ1FOm35/M91eBK3S0UR6g4yU=;
 b=olJcHuYbkQ6LcqSXFg8AP3743x8Q3Q1QrtoUSBq252Y0tQsRLHgjowRuJGtoqcBxzEEZDJ1Ym
 mz6BRbehFhbBGlb/7iMbON3xdDteONc4ZOUJuBghI5HBMfOMEFfACap
X-Developer-Key: i=paul.louvel@bootlin.com; a=ed25519;
 pk=eLW50NT18UAvUT5cAcYf88zNbBCZDLFXuptpyLVhVIU=
X-Last-TLS-Session-Version: TLSv1.3

The 88E151x EEE errata sequence writes four register pairs on page 0xFF.
Using phy_write() for each access takes and releases the MDIO bus lock
every time, and returning early on error leaves the PHY on the errata
page.

Move the sequence into m88e1510_eee_errata() and use phy_select_page()
and phy_restore_page().
This reduces the number of bus lock/unlock cycles and restores the
previous page if one of the errata writes fails.

Signed-off-by: Paul Louvel (Schneider Electric) <paul.louvel@bootlin.com>
---
 drivers/net/phy/marvell.c | 41 +++++++++++++++++++++++++----------------
 1 file changed, 25 insertions(+), 16 deletions(-)

diff --git a/drivers/net/phy/marvell.c b/drivers/net/phy/marvell.c
index d2c5d3c5ce7d..a72d307eaf12 100644
--- a/drivers/net/phy/marvell.c
+++ b/drivers/net/phy/marvell.c
@@ -1353,7 +1353,7 @@ static int m88e1510_config_mode(struct phy_device *phydev, u16 mode)
 	return phy_restore_page(phydev, oldpage, ret);
 }
 
-static int m88e1510_config_init(struct phy_device *phydev)
+static int m88e1510_eee_errata(struct phy_device *phydev)
 {
 	static const struct {
 		u16 reg17, reg16;
@@ -1363,31 +1363,40 @@ static int m88e1510_config_init(struct phy_device *phydev)
 		{ 0xb233, 0x214d },
 		{ 0xcc0c, 0x2159 },
 	};
-	int err;
-	int i;
+	int i, oldpage, ret = 0;
 
 	/* As per Marvell Release Notes - Alaska 88E1510/88E1518/88E1512/
 	 * 88E1514 Rev A0, Errata Section 5.1:
 	 * If EEE is intended to be used, the following register writes
 	 * must be done once after every hardware reset.
 	 */
-	err = marvell_set_page(phydev, 0x00FF);
-	if (err < 0)
-		return err;
+	oldpage = phy_select_page(phydev, 0x00FF);
+	if (oldpage < 0)
+		goto restore;
 
 	for (i = 0; i < ARRAY_SIZE(errata_vals); ++i) {
-		err = phy_write(phydev, 17, errata_vals[i].reg17);
-		if (err)
-			return err;
-		err = phy_write(phydev, 16, errata_vals[i].reg16);
-		if (err)
-			return err;
+		ret = __phy_write(phydev, 17, errata_vals[i].reg17);
+		if (ret)
+			goto restore;
+
+		ret = __phy_write(phydev, 16, errata_vals[i].reg16);
+		if (ret)
+			goto restore;
 	}
 
-	err = marvell_set_page(phydev, 0x00FB);
-	if (err < 0)
-		return err;
-	err = phy_write(phydev, 07, 0xC00D);
+restore:
+	ret = phy_restore_page(phydev, oldpage, ret);
+	if (ret < 0)
+		return ret;
+
+	return phy_write_paged(phydev, 0x00FB, 07, 0xC00D);
+}
+
+static int m88e1510_config_init(struct phy_device *phydev)
+{
+	int err;
+
+	err = m88e1510_eee_errata(phydev);
 	if (err < 0)
 		return err;
 	err = marvell_set_page(phydev, MII_MARVELL_COPPER_PAGE);

-- 
2.56.1

