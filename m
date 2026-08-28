Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF89D3BBFB6;
	Fri, 28 Aug 2026 18:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787942547; cv=none; b=tQ8sM4WY8Dv84puz+kdyyR8a60KmTT3R1jQl7vy1IO3Xcnn59CIA4TMaxXK5z6Fvb5JOhnTCi9aUeQAK6Fh+f5NCQR2aHPI7f+VTxJHCgAg7txe4O5ZGwHiXXydNoN4eUpSChOAm1PYg6k6xCU5KZ2BZD+w4BoJIpAF+6EShgpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787942547; c=relaxed/simple;
	bh=yERQd7CrGL2elLzXIkxAt+7AvqSWJIDiOonb+WSoylM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZRnBet/x55DTmz2Cmf7SUfu1l5X68vfCLpkavWtYNL2mDOzgmwFUZPPl6FiPSBVEIc+tNufX/A+xFPyn41PntKded5JhZQRCP4TxqfIUaevj1Ddnaa/5UlwcGDANiM/uctxYedTABvehlHRpynxF+sYnuL4H9VQYQmOf726N/9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=E2R0YXuG; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=OJQO60/0; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="E2R0YXuG";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="OJQO60/0"
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4hWnLR3H9MzMlNH;
	Fri, 28 Aug 2026 20:42:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1787942543;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Zm3NbsteeWdEZmBEcT49G0e4M82kmTZ1uA8dJjBQlI8=;
	b=E2R0YXuGH3XNodGB8P2QUL7FxSRVqaxYNN6IH0NkAPwGLrn0Wi5xpXw5UQGZ50OoLfy5v5
	1ApcUN8l0vS0a4lUfs9qhzrNGTQD8CQrAhAnB9ftZoKZebLaxjQ0CFQNSl7aaysGywbxGm
	SI6N2YlXonIXaeH3F+DXI3XrjSVZy0DFZzvcrdUI4FAANVxobYbwFaW+APsaBtJZC7jZO0
	98b76C/E/60juRxa2lvD+xenbN2wnQC8h6a1ehyEY/qNKA0A0/ZsdhhSvMiiUwVKSwO5r5
	rfOmzsRUR1/hr+/qoZjGWMZz5Wgqs99l65l1uXo4IA6xv408lxb9lyuAXFkeLA==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b="OJQO60/0";
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::102 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1787942541;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Zm3NbsteeWdEZmBEcT49G0e4M82kmTZ1uA8dJjBQlI8=;
	b=OJQO60/0JngR19xCnE4BeXU74ITrv7CyLxKbD1D0OBmR0cvHjewscG20EBZL10LDSDyGY3
	4s9YpwZeQrOxVkIkh8vqNk77I4HYtirYyNjHpK3LsH5wpuRdqrKEga/k+bCx5jyLERcuir
	rCV5PSqCuWVPvmah51AYk0Aa2wy1X0Ur4/AXVjtuiOG6Wc7zVufMCt6m/GSg7ZDzrRaSCv
	wdeE+Cj7SFr53xZe9mRgsAwoav8XhIzUOD1QSu3AGt8y2Ey5uEdZk56qVf7pESQJnGT2vE
	37ANzayYc+WdPaq+CEVZ/w6PsSDLR+tqA/9BkUDGiOz1RTJnpS1KpXydiQoqQg==
To: linux-usb@vger.kernel.org
Cc: Thanh Quan <thanh.quan.xn@renesas.com>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v6 2/2] usb: dwc3: dwc3-generic-plat: Add Renesas R-Car Gen5 DWC3 xHCI USB controller glue
Date: Fri, 28 Aug 2026 20:41:46 +0200
Message-ID: <20260828184212.395082-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260828184212.395082-1-marek.vasut+renesas@mailbox.org>
References: <20260828184212.395082-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: a4ojx31sjw1ri198twmrxytjccq7i1ad
X-MBO-RS-ID: 8feda06b6f3e3bb5c27
X-Rspamd-Queue-Id: 4hWnLR3H9MzMlNH

From: Thanh Quan <thanh.quan.xn@renesas.com>

The Renesas R-Car Gen5 SoC contains multiple instances of DWC3 USB
controller with glue logic wrapper around them. Extend the generic
DWC3 platform driver with Renesas R-Car Gen5 glue logic specifics.

Signed-off-by: Thanh Quan <thanh.quan.xn@renesas.com>
Co-developed-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
Cc: linux-usb@vger.kernel.org
---
V2: Extend dwc3-generic-plat driver instead
V3: Handle maximum-speed as optional property, test for USB 3 PHY
    non-presence to determine whether the controller is USB 2 only,
    consider optional maximum-speed DT property, but if it is missing
    then default to maximum controller capabilities based on the
    presence of PHY phandles.
V4: No change
V5: - Drop superfluous code comment
    - Drop duplicate speed >= USB_SPEED_LOW test
V6: Reinstate speed >= USB_SPEED_LOW test to avoid triggering on USB_SPEED_UNKNOWN
---
 drivers/usb/dwc3/dwc3-generic-plat.c | 55 ++++++++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/drivers/usb/dwc3/dwc3-generic-plat.c b/drivers/usb/dwc3/dwc3-generic-plat.c
index ca69ac0eb07ce..e8586c40d5006 100644
--- a/drivers/usb/dwc3/dwc3-generic-plat.c
+++ b/drivers/usb/dwc3/dwc3-generic-plat.c
@@ -71,6 +71,55 @@ static int dwc3_eic7700_init(struct dwc3_generic *dwc3g)
 	return 0;
 }
 
+static int dwc3_renesas_rcar_gen5_init(struct dwc3_generic *dwc3g)
+{
+	struct device *dev = dwc3g->dev;
+	struct platform_device *pdev = to_platform_device(dev);
+	enum usb_device_speed speed = usb_get_maximum_speed(dev);
+	bool usb2only = false;
+	void __iomem *glue;
+
+	/* Wireless USB is not supported */
+	if (speed == USB_SPEED_WIRELESS)
+		return dev_err_probe(dev, -EINVAL, "Wireless USB not supported\n");
+
+	/* No USB 3 PHY in DT means this is surely USB 2 controller */
+	if (device_property_match_string(dev, "phy-names", "usb3-phy") < 0)
+		usb2only = true;
+
+	if (speed >= USB_SPEED_LOW && speed <= USB_SPEED_HIGH)
+		usb2only = true;
+
+	glue = devm_platform_ioremap_resource_byname(pdev, "glue");
+	if (IS_ERR(glue))
+		return PTR_ERR(glue);
+
+	/*
+	 * The datasheet describes initialization procedure without full
+	 * information about the registers. Therefore, the source code is
+	 * based on the bare metal code shared by the board team.
+	 */
+	writew(0x211, glue + 0x26);
+
+	/* USB2 does need additional register programming. */
+	if (!usb2only)
+		return 0;
+
+	writew(0x11, glue + 0x81c);
+	writew(0x0, glue + 0x81a);
+	writew(0x1, glue + 0x802);
+
+	usleep_range(10000, 20000);
+
+	writew(0x0, glue + 0x802);
+	writew(0x1, glue + 0x2a);
+	writew(0x1, glue + 0x81a);
+
+	usleep_range(10000, 20000);
+
+	return 0;
+}
+
 static int dwc3_spacemit_k1_init(struct dwc3_generic *dwc3g)
 {
 	struct device *dev = dwc3g->dev;
@@ -231,11 +280,17 @@ static const struct dwc3_generic_config eic7700_dwc3 =  {
 	.properties = DWC3_DEFAULT_PROPERTIES,
 };
 
+static const struct dwc3_generic_config renesas_rcar_gen5_dwc3 = {
+	.init = dwc3_renesas_rcar_gen5_init,
+	.properties = DWC3_DEFAULT_PROPERTIES,
+};
+
 static const struct of_device_id dwc3_generic_of_match[] = {
 	{ .compatible = "spacemit,k1-dwc3", &spacemit_k1_dwc3},
 	{ .compatible = "spacemit,k3-dwc3", },
 	{ .compatible = "fsl,ls1028a-dwc3", &fsl_ls1028_dwc3},
 	{ .compatible = "eswin,eic7700-dwc3", &eic7700_dwc3},
+	{ .compatible = "renesas,rcar-gen5-dwc3", &renesas_rcar_gen5_dwc3},
 	{ .compatible = "starfive,jhb100-dwc3", },
 	{ /* sentinel */ }
 };
-- 
2.53.0

