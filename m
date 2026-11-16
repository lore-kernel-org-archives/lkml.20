Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794842878;
	b=ctNKRLm0EkTYwDL+t+3bYkwhf96tuZYsSjmtJy7OTdRzjiybs4Kj6i2PAD8o1KJs5UPY
	 qsj70vnHTrFupJ+HRxTzIkqRlqrGwb5YhK29f2QgH+YVTPPQTU6RGlyEwa4ITT8Rf+1T9
	 jb+7XpIGYElhbAg3P87T7M/DccGA4DpB7u1Dj2Xzut5wrdMyqCFzcxyCcBwicpOEJNGZM
	 +7UyjvZJlKpIM5jSPJ3EI1YUVAa8i29wO8MkYeKb/NLhfItoUZmp7POEW8dK0bXcWTB+V
	 1eNiXXZvJKtpcTn8I1RpWZHMQajPMRn6V0uWycclJBT1ZzO7wjmOpk19+WMKt//fn8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794842878;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Last-TLS-Session-Version;
	bh=1rMcQy2uS7L+NAS/Xndw8zWtoDD1TaGXQ4VaLrfzUdg=;
	b=uPcYMM+n4ZUyhg3M7ByHWN3MKKTzElf/mAIFETCqoilGCboLyxY2mBxluXSzOhGNKv01
	 E3cmGnGJmYJo/8zW0SFdBSwIULoT0ZvUEmUm228BGt7xhsiyBhbSJrbxkA4uBqW/ldq7a
	 2pahxzyg+giOcj124MskzVOZ+D6u6pJwah+BfpfK+V23y7mwY7V5GIRGd4g4xaF2z5e/c
	 Q0lrwBTn6mpi4lUK9BNN9m1e3Mcy5wYgVuDArCdpeQhxKXbOEsqPQ2gjFpkG4AD3OmLm/
	 ZNKjJz2NtTD/eGGuDl2fBCOoZwVXELYdPoFmLgDICze+fJV1IS2za5L+lnS24JSl9Ng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=X1zwNjz2;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA6B5606A322;
	Mon, 16 Nov 2026 15:27:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA6B5606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=X1zwNjz2
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id DEA04C4EFE3;
	Mon, 16 Nov 2026 15:27:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E00906023F;
	Mon, 16 Nov 2026 15:27:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8021011BC0B19;
	Mon, 16 Nov 2026 16:27:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794842875; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=1rMcQy2uS7L+NAS/Xndw8zWtoDD1TaGXQ4VaLrfzUdg=;
	b=X1zwNjz2w6zsOqEbDa/6fUssCNRxb/a+g5deYdz+GwHf6D8PvEN2NQp4dK/eSKy7TLJEzI
	3qB6L7ShvOKSN54BSFAExukQjyuupLg9z80o5uvZiLYRN1zsQTg37rdO5hP6GH9I1LR1qX
	ddYtpcwvyQYHkkO7fUlsYHGxzX4sw2dlXTTf7C86a7wPWS21oRQFQf92LnsqjqHLOQlhCw
	1OrBsTyG9NIZVjTfkOFGKqHo5vqCQUlRnfd/aC0OX5cuCzUS7d/PD5YnNOx9Q4kZfq4YD+
	sEUnsDH4SwudhuklgNtTGxQw28CAPwC/xfrTXiuFg8CKHgOd/PiQlyzWvRKdSw==
From: Paul Louvel <paul.louvel@bootlin.com>
Date: Mon, 16 Nov 2026 16:27:01 +0100
Subject: [PATCH net-next v2 1/4] net: phy: marvell: move mode configuration
 into standalone function
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
Message-Id: <20261116-marvell-phy-rgmii-v2-1-e04dca67e89a@bootlin.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794842859; l=2233;
 i=paul.louvel@bootlin.com; s=20260313; h=from:subject:message-id;
 bh=PkW9oGzVYjO6jMam9gxr/9puYpDucljlNjFFDli78b4=;
 b=HJ0caxp34Yia2HeA9IKkVVPNjo6TilIBshYx4hB4GK1hWu0IuZ78mF9Ijr88383iugXKCSRIC
 hXvSF2yZwNLD79FsfOvVIZxuE+nKgOY3E7E+HAXlikQRj/H/i934zoZ
X-Developer-Key: i=paul.louvel@bootlin.com; a=ed25519;
 pk=eLW50NT18UAvUT5cAcYf88zNbBCZDLFXuptpyLVhVIU=
X-Last-TLS-Session-Version: TLSv1.3

Move the configuration of the m88e151x out of the
m88e1510_port_configure_serdes() function, so that other parts of the
driver can use it.

Signed-off-by: Paul Louvel (Schneider Electric) <paul.louvel@bootlin.com>
---
 drivers/net/phy/marvell.c | 38 ++++++++++++++++++++++----------------
 1 file changed, 22 insertions(+), 16 deletions(-)

diff --git a/drivers/net/phy/marvell.c b/drivers/net/phy/marvell.c
index 2c688d661297..aef5f8279133 100644
--- a/drivers/net/phy/marvell.c
+++ b/drivers/net/phy/marvell.c
@@ -1332,6 +1332,27 @@ static int m88e1318_config_init(struct phy_device *phydev)
 	return marvell_config_init(phydev);
 }
 
+static int m88e1510_config_mode(struct phy_device *phydev, u16 mode)
+{
+	int oldpage;
+	int ret = 0;
+
+	oldpage = phy_select_page(phydev, MII_MARVELL_MODE_PAGE);
+	if (oldpage < 0)
+		goto error;
+
+	ret = __phy_modify(phydev, MII_88E1510_GEN_CTRL_REG_1,
+			   MII_88E1510_GEN_CTRL_REG_1_MODE_MASK, mode);
+	if (ret < 0)
+		goto error;
+
+	ret = __phy_set_bits(phydev, MII_88E1510_GEN_CTRL_REG_1,
+			     MII_88E1510_GEN_CTRL_REG_1_RESET);
+
+error:
+	return phy_restore_page(phydev, oldpage, ret);
+}
+
 static int m88e1510_config_init(struct phy_device *phydev)
 {
 	static const struct {
@@ -3656,8 +3677,6 @@ static int m88e1510_port_configure_serdes(struct phy_port *port, bool enable,
 {
 	struct phy_device *phydev = port_phydev(port);
 	struct device *dev;
-	int oldpage;
-	int ret = 0;
 	u16 mode;
 
 	dev = &phydev->mdio.dev;
@@ -3685,20 +3704,7 @@ static int m88e1510_port_configure_serdes(struct phy_port *port, bool enable,
 		mode = MII_88E1510_GEN_CTRL_REG_1_MODE_RGMII;
 	}
 
-	oldpage = phy_select_page(phydev, MII_MARVELL_MODE_PAGE);
-	if (oldpage < 0)
-		goto error;
-
-	ret = __phy_modify(phydev, MII_88E1510_GEN_CTRL_REG_1,
-			   MII_88E1510_GEN_CTRL_REG_1_MODE_MASK, mode);
-	if (ret < 0)
-		goto error;
-
-	ret = __phy_set_bits(phydev, MII_88E1510_GEN_CTRL_REG_1,
-			     MII_88E1510_GEN_CTRL_REG_1_RESET);
-
-error:
-	return phy_restore_page(phydev, oldpage, ret);
+	return m88e1510_config_mode(phydev, mode);
 }
 
 static const struct phy_port_ops m88e1510_serdes_port_ops = {

-- 
2.56.1

