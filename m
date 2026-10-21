Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.19.144.207
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792603708;
	b=dlpEZB3w3qe7Z+zA4c33zFhnVfYSBNt51cf1pZnRLQblLaC7MlS/ex5C5Y2wxCdoU3Ry
	 s7+zERoWVcvEbud0npW2XzoBk5givq8BYmcSa+XabABpqPzdDsGinUOvld4cvSXz8W5E5
	 /ZEoUk1O/iNEKeS5kQMQ2AKX70Qju7V/sMBm3t6oyn8oO5eppS52rLrqh16LSwQIuAVGf
	 7yoP3Qi5+v1SakMOctAihsn5XK1tGEFhJhri06bWCRCnQZfqeKOL5XQHTHu4844G4fEPG
	 KHZtWIgYsYP2o2W++x9CpatzCR+0G4MLjzF9dy294Znae+outexRQjujJpsNTvI2/JQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792603708;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=7nFUjZYDapTkbLCvTjG9bKTgAC6ACt8mMkSnyt4ocuA=;
	b=h+OQ4E/B/H0EMzDMO8cI95NiplsWcREn51lwwQfKn+1VsTDdr4CrtUe+BhZkKiPSJoMi
	 2fUVPedgrvhiMI9Y6Ai1eeUWl8O/ttI3R4N0oZur7tub6uG6GwFHg9FYqkJn/tvC/j4nF
	 nYKPkdodT8x7ZSGw7lPjQWb6DM12c9iyhhBS9dsR8EA0MoYYEMBMje9rE/uoiMjmmlGno
	 k0+jGZWx8k0/aVFPsqdyPxXkF9P3EyIDSy/obvLFqvlWRkpBgf0koJqnpTyK+62148mYi
	 KC+g939xYRYnoalM/1oy+UtW/Gd1gX20gnxa+6e8IOl7QrFc5/61NKgdsRRlrpGE3rg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=dkimrelay header.b=XkatiXhW;
	arc=none smtp.remote-ip=192.19.144.207
Received: from relay.smtp-ext.broadcom.com (relay.smtp-ext.broadcom.com [192.19.144.207])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D78C0606A33A;
	Wed, 21 Oct 2026 17:28:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D78C0606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=dkimrelay header.b=XkatiXhW
Received: from mail-acc-it-01.broadcom.com (mail-acc-it-01.acc.broadcom.net [10.35.36.83])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id F187FC0003E1;
	Wed, 21 Oct 2026 10:28:26 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com F187FC0003E1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1792603707;
	bh=9qnWNVbt/BUNu2NxqN3Isa5I+n4msAp7wLc+YfU7eU8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XkatiXhWZKwZefxO2F3+tevZDehgywbxiS9iscb/yr4RV0dB1TX3ci1YGLfvDlLbZ
	 0oPMNwf8exIhJ1nOw3NporSeTQz1yarAVG7YtzuyDKkQIEDrgmEHFmE3pXwC4fE6yK
	 QV+nIbQ2pwn9N4iVauVfKDU/cvgNY+tjw+1qxGYY=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-acc-it-01.broadcom.com (Postfix) with ESMTPSA id 91B61AEA3;
	Wed, 21 Oct 2026 13:28:25 -0400 (EDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Alan Stern <stern@rowland.harvard.edu>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Yendapally Reddy Dhananjaya Reddy <yendapally.reddy@broadcom.com>,
	linux-phy@lists.infradead.org (open list:GENERIC PHY FRAMEWORK),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list),
	linux-usb@vger.kernel.org (open list:USB SUBSYSTEM)
Subject: [PATCH 3/9] phy: broadcom: ns-usb3: Coordinate NSP USB2 and USB3 initialization
Date: Wed, 21 Oct 2026 10:28:12 -0700
Message-ID: <20261021172819.668120-4-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261021172819.668120-1-florian.fainelli@broadcom.com>
References: <20261021172819.668120-1-florian.fainelli@broadcom.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The iProc SDK holds both USB2 and USB3 cores in reset while programming
the USB3 PLL, then releases USB2 before USB3. It also enables the USB2
IDM interface clock. The Northstar Bx initialization used by NSP does
not perform the USB2 setup or retain the SDK settling intervals.

Implement an NSP variant with the coordinated reset sequence and
interface clock enable. Sharing one PHY between the HCDs lets the PHY
core serialize and reference-count initialization, preventing a later
host probe from resetting an already active USB2 controller.

Retain the downstream delays around reset and MDIO operations, and
leave both NSP cores reset if programming fails. Keep existing
Northstar Ax and Bx reset behavior unchanged.

Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 drivers/phy/broadcom/phy-bcm-ns-usb3.c | 55 ++++++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/drivers/phy/broadcom/phy-bcm-ns-usb3.c b/drivers/phy/broadcom/phy-bcm-ns-usb3.c
index b40033144080..b3b5b74ead09 100644
--- a/drivers/phy/broadcom/phy-bcm-ns-usb3.c
+++ b/drivers/phy/broadcom/phy-bcm-ns-usb3.c
@@ -44,12 +44,14 @@ enum bcm_ns_family {
 	BCM_NS_UNKNOWN,
 	BCM_NS_AX,
 	BCM_NS_BX,
+	BCM_NSP,
 };
 
 struct bcm_ns_usb3 {
 	struct device *dev;
 	enum bcm_ns_family family;
 	void __iomem *dmp;
+	void __iomem *usb2_dmp;
 	struct mdio_device *mdiodev;
 	struct phy *phy;
 };
@@ -63,6 +65,10 @@ static const struct of_device_id bcm_ns_usb3_id_table[] = {
 		.compatible = "brcm,ns-bx-usb3-phy",
 		.data = (int *)BCM_NS_BX,
 	},
+	{
+		.compatible = "brcm,nsp-usb3-phy",
+		.data = (void *)BCM_NSP,
+	},
 	{},
 };
 MODULE_DEVICE_TABLE(of, bcm_ns_usb3_id_table);
@@ -86,6 +92,9 @@ static int bcm_ns_usb3_write_seq(struct bcm_ns_usb3 *usb3,
 		err = bcm_ns_usb3_mdio_phy_write(usb3, seq[i].reg, seq[i].value);
 		if (err)
 			return err;
+
+		if (usb3->family == BCM_NSP)
+			usleep_range(10000, 20000);
 	}
 
 	return 0;
@@ -121,8 +130,18 @@ static int bcm_ns_usb3_phy_init_ns_bx(struct bcm_ns_usb3 *usb3)
 	if (err)
 		return err;
 
+	if (usb3->usb2_dmp) {
+		writel(0, usb3->usb2_dmp + BCMA_RESET_CTL);
+		readl(usb3->usb2_dmp + BCMA_RESET_CTL);
+		usleep_range(10000, 20000);
+	}
+
 	/* Deasserting USB3 system reset */
 	writel(0, usb3->dmp + BCMA_RESET_CTL);
+	if (usb3->family == BCM_NSP) {
+		readl(usb3->dmp + BCMA_RESET_CTL);
+		usleep_range(10000, 20000);
+	}
 
 	return bcm_ns_usb3_write_seq(usb3, phy_seq, ARRAY_SIZE(phy_seq));
 }
@@ -160,16 +179,35 @@ static int bcm_ns_usb3_phy_init_ns_ax(struct bcm_ns_usb3 *usb3)
 static int bcm_ns_usb3_phy_init(struct phy *phy)
 {
 	struct bcm_ns_usb3 *usb3 = phy_get_drvdata(phy);
+	u32 val;
 	int err;
 
+	/*
+	 * NSP requires both hosts to remain in reset while programming the PLL.
+	 * Sharing this PHY between all three HCDs makes the PHY core serialize
+	 * and reference-count this sequence, regardless of their probe order.
+	 */
+	if (usb3->usb2_dmp) {
+		val = readl(usb3->usb2_dmp + BCMA_IOCTL);
+		writel(val | BCMA_IOCTL_CLK, usb3->usb2_dmp + BCMA_IOCTL);
+		writel(BCMA_RESET_CTL_RESET, usb3->usb2_dmp + BCMA_RESET_CTL);
+		readl(usb3->usb2_dmp + BCMA_RESET_CTL);
+		usleep_range(10000, 20000);
+	}
+
 	/* Perform USB3 system soft reset */
 	writel(BCMA_RESET_CTL_RESET, usb3->dmp + BCMA_RESET_CTL);
+	if (usb3->family == BCM_NSP) {
+		readl(usb3->dmp + BCMA_RESET_CTL);
+		usleep_range(10000, 20000);
+	}
 
 	switch (usb3->family) {
 	case BCM_NS_AX:
 		err = bcm_ns_usb3_phy_init_ns_ax(usb3);
 		break;
 	case BCM_NS_BX:
+	case BCM_NSP:
 		err = bcm_ns_usb3_phy_init_ns_bx(usb3);
 		break;
 	default:
@@ -177,6 +215,11 @@ static int bcm_ns_usb3_phy_init(struct phy *phy)
 		err = -ENOTSUPP;
 	}
 
+	if (err && usb3->usb2_dmp) {
+		writel(BCMA_RESET_CTL_RESET, usb3->usb2_dmp + BCMA_RESET_CTL);
+		writel(BCMA_RESET_CTL_RESET, usb3->dmp + BCMA_RESET_CTL);
+	}
+
 	return err;
 }
 
@@ -225,6 +268,18 @@ static int bcm_ns_usb3_mdio_probe(struct mdio_device *mdiodev)
 	if (IS_ERR(usb3->dmp))
 		return PTR_ERR(usb3->dmp);
 
+	if (usb3->family == BCM_NSP) {
+		syscon_np = of_parse_phandle(dev->of_node, "usb2-dmp-syscon", 0);
+		err = of_address_to_resource(syscon_np, 0, &res);
+		of_node_put(syscon_np);
+		if (err)
+			return err;
+
+		usb3->usb2_dmp = devm_ioremap_resource(dev, &res);
+		if (IS_ERR(usb3->usb2_dmp))
+			return PTR_ERR(usb3->usb2_dmp);
+	}
+
 	usb3->phy = devm_phy_create(dev, NULL, &ops);
 	if (IS_ERR(usb3->phy)) {
 		dev_err(dev, "Failed to create PHY\n");
-- 
2.53.0

