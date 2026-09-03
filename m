Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74DDF4B2CCE;
	Thu,  3 Sep 2026 21:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788471055; cv=none; b=UUh05OU3p6y4Ct9AlG76/ee4kiZLzsIMxrWpg6MR26htDCtL02pTqC73PiTBMJiEXrIcXZjv2j/Bs3kj4hYUZmDMPpMAixvHAPeD9MepQS4xFaw9hq31/cq8zWraEE/CymCR/bTL37cv7mQPOij2Rl1VvpfVf25R2LvNsOPApJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788471055; c=relaxed/simple;
	bh=XkqN1IjRk04NwJ6TyxleolJqB05VK+OaICfHk08aPXQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TP3aIIjRdx9fHfN75dGHfyqW0WwQZYRYGA3rsw+zPONkAb8y2pXsT6llY5V8OWnpgswUBMw2YFJPFS4FgFJYEEITBzNHI53CFO0FbJXoE5sxMfO3drymM0SX3UL5XxUoFaNg7mTHhVo/BwaiQY/tjVdcZg9O0zRxtfv0Q0I9jyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=rkxrpc9N; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=EiXfFW8C; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="rkxrpc9N";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="EiXfFW8C"
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4hbXny5bzLzKn6X;
	Thu, 03 Sep 2026 23:30:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1788471046;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=l+4LUXQHvRUwo1jUDMgrbuAgaRkEPK5f7h1+QbzM+Io=;
	b=rkxrpc9NE8035ymTrGZHbEMEAWCc5Kwv+Ew2Dl8TaVqD8SPBwoVEtVCo5owEwInIPs8Uf8
	sOEWbuRaqQNTC6iHWKLDSQzB7shMK1+BPXJ2dQTk298cmuPNZ/RMDfen9KUUf5mgMpPXp2
	F9bg4nIdZ161goZ9MWsPSkksv/eBpZJE9dtfunP5Pgz+g5L2P1BU/xc/74uS5UA7ThuPsU
	GB2wg8CO+8EsJ/OGFaauEX13yulXLnGMejcbY6pU3bS4tV5vuWa0kkC+C1BUFsYqA4HG0c
	FeXnKwn5AlZgtqjUd23bIoCJViU6QyMNNFuRAWgrz8jIlKav8VdPcc99TG2A5A==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=EiXfFW8C;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::102 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1788471045;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=l+4LUXQHvRUwo1jUDMgrbuAgaRkEPK5f7h1+QbzM+Io=;
	b=EiXfFW8C6q/rK2EnO7iLDHiCxr78qaqfzL5GYrRkvuMolkdjUJgYdaFl85VksuQfRmKJcP
	cKklCSAE3XsGGjH6KS+66KtjBY/OKvR1n+ppXuCejrUfqqzaEEOc41KgpY3jUINZatbXfS
	GThKgZKZ49I1IXomYR/ndINohWLQeAozZVMMeRBrl5CpcK4e5RDfR6ZEsKvaSeh4SFdRF9
	14z6/zAyVx1iYTR95b5tMgHmBA5/XGI5QKu2TjOWCikn58vBwip1Xkoxm3mmGqESpFEiWl
	fGp/oPSWQit/gdO54oMuJoo1yJqtFbiO3LIgURL3nd4KRmk0m24lI9Ta6qu/NA==
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
Subject: [PATCH v7 2/2] usb: dwc3: dwc3-generic-plat: Add Renesas R-Car Gen5 DWC3 xHCI USB controller glue
Date: Thu,  3 Sep 2026 23:30:13 +0200
Message-ID: <20260903213031.314473-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260903213031.314473-1-marek.vasut+renesas@mailbox.org>
References: <20260903213031.314473-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: 45w35m6ik6oaop7ptyw74wj8mmyj4nnb
X-MBO-RS-ID: 6e8cb524237f119b4e0
X-Rspamd-Queue-Id: 4hbXny5bzLzKn6X

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
V7: Drop wireless USB check
---
 drivers/usb/dwc3/dwc3-generic-plat.c | 51 ++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/drivers/usb/dwc3/dwc3-generic-plat.c b/drivers/usb/dwc3/dwc3-generic-plat.c
index ca69ac0eb07ce..32497ab6f065e 100644
--- a/drivers/usb/dwc3/dwc3-generic-plat.c
+++ b/drivers/usb/dwc3/dwc3-generic-plat.c
@@ -71,6 +71,51 @@ static int dwc3_eic7700_init(struct dwc3_generic *dwc3g)
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
@@ -231,11 +276,17 @@ static const struct dwc3_generic_config eic7700_dwc3 =  {
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

