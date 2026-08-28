Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D10AB353A74;
	Fri, 28 Aug 2026 18:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787941476; cv=none; b=T86XYD9AsyLbzh7zowYG/Yccf8GZMI06LKnsoFxf4tGbkEpGXs1RQTIom+30kV+cd7Nr8j/yMVkzxFrbzQRoJtcZrsHTS1Si8UmB/FQJxVCA1q4RhshV/7UOdIeUOFf/JSFv2JV94wTlZKEtC2Fa7je7W3WU6cT52p1mSdiPUPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787941476; c=relaxed/simple;
	bh=l+nBGPULbxhyr/PagIwYffNWegikca8YJNHx5+ze5zU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bft80x+ipDt4fWgBHrPmqKKIW37kWgAUWZ0vsUhDlYSnsyJyLQlmckCpYhdVuOWbTRtwb2z04WdJxssPot3Nr3zuVSMRXdDKPff06RMM2UKypXoHtuUTvTjqK7Wgzi17GXfg/5I/LwOrJ+yrDzCMTD58yM0XmcHzdA/XAoW26Xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=n/T3fWWo; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=VmsDwdVw; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="n/T3fWWo";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="VmsDwdVw"
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4hWmxj6D7RzMlC5;
	Fri, 28 Aug 2026 20:24:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1787941465;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iD1rS5EjcQmZcEhrhcQ9DyPs5ERHj0pb6khnJ8s9qok=;
	b=n/T3fWWo1aLPxQpj+Edu9YzyNQTrwy+TY/XMxImdWGv5iivfZm3xeDB91bcrFrRcLXwvPm
	DF5gk4IAQFQL1brbpz7icezk8SyNfyVVo3jCvn2P3BODQI5rHsUQ879eEqkPKo+85a9F6u
	N0BAQ0p/dZb7vsdNs7gYt9vvGBHJsRQWW9rd7vm3IhvQKZvmv86277ROaK7dbi0POH/mob
	73nRsCH3N/SAf+konJYkVLU95FbwYVImxwiUuNHZ442lbdTmiHGrTenhDinsPLEYFm/aKr
	f+GPomoGMjvu7Ml5r7j3wFRR0YHJAXjRyg45Xar4pGeQkuUzBWtGiONF+GLhcg==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1787941464;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iD1rS5EjcQmZcEhrhcQ9DyPs5ERHj0pb6khnJ8s9qok=;
	b=VmsDwdVwABvMfxaKd7Vz0B090V/DkR+WaUXL/vQBETdkK1C/f2qmbQRghG/W8Tpec+mgt8
	jwojUsumJIbEksdHpGND9M7qmPRz0oa5nPn1IpJmVXBjctK6BXLc9oWDMBjTbpZgTtqhuN
	AQte+QofwFJh3NflA63aOSdm80TXC6fqLiKI/PmeHoQ+D8Eb0IGPCdaLLj9JjAcCizqEJT
	+AYOLSn1gBp6T+jkmN2n+LUbpwRxtpzaqQxx7lUFDxNj1ooj9vzR3Nv/OFiDGxVOAGlnRA
	1lZiX9wtLjlC3XKQfM5iDOMWrNwWJ6uGMXHU0R5jVQvfD+t9RAE+pOU8ZnoAyQ==
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
Subject: [PATCH v5 2/2] usb: dwc3: dwc3-generic-plat: Add Renesas R-Car Gen5 DWC3 xHCI USB controller glue
Date: Fri, 28 Aug 2026 20:23:25 +0200
Message-ID: <20260828182415.388367-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260828182415.388367-1-marek.vasut+renesas@mailbox.org>
References: <20260828182415.388367-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: aptgfjytc9rnmgmxgtxf44ehfb3yawck
X-MBO-RS-ID: 97b189517dc149d5cfc

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
---
 drivers/usb/dwc3/dwc3-generic-plat.c | 55 ++++++++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/drivers/usb/dwc3/dwc3-generic-plat.c b/drivers/usb/dwc3/dwc3-generic-plat.c
index ca69ac0eb07ce..3994a6d93b9de 100644
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
+	if (speed <= USB_SPEED_HIGH)
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

