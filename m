Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794446298;
	b=oAi3jc1L2gE4HP4eNdb8ArFDSqeFuYrJ2N8WEJ3+V1Z1Xd8x0ZxSgvRI+jqg3+OEkCJF
	 B5xM42CJzG3XvYwbWTDXkN77mvJgQLM9zLJOV5FBn7yjKG/BoAVCREiKplM1oYoknAeJx
	 wIqdWdQhaAcukH1B0Bs2pvGSttUmBj/4AogkLRFTnWy7TfpKi1wZATIu4njbqTLgCliVi
	 za5D7JwxiC0UUXF5FNKVLq/8Uw1CwqdMaxjWPYfyRtCipVqHmfvM2BEvAgeoiS2FLlOZt
	 rA8QK+Hfh5c3IhTVhKTtuMaBi94PAYYr1zSax39HDp7PQoEG12yo7FfZrSoJrB+BsIg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794446298;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=giOynWrj1p05vkyeYCyHdpu2lu3LEmA+NcfUzFVBsw8=;
	b=kYNg9yhNXoFgBPR8ksERMebNnBNx06bT8ljKCJupGqe+Bv84TB2dO7lrhiqrWIe7MRTZ
	 Y0xmg3g0RnsIpaw0BKyRSX7Sjzep2kOpxpIZIWbfDkJlp4NVUWtxfWjtyoTG1AddbxPDi
	 NAaL/PHNftvZoJGO/J+Bm52aGXL3y1XrJvSOmH4XXM4sBOeGPd5jKneW41X5LSEG7BYiy
	 AU6Z3/lYJN6//Agt21JTiIhgjGgVtYiA1b8SkL6ajd/+stv8u5xXsgCg0aHIhdWhTfDLc
	 ybAy+ECRO+G1yHbOTfrMsFdOpQc3fiKWzGx1fGb5b9el2GARrvTFcVxB1vljhdn93Mg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PkXImLPd;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9DDD606A321;
	Thu, 12 Nov 2026 01:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PkXImLPd
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794446297;
	b=mqFDIgPyD64w/jounPZJvg1RMgEoPNK/KT2rUpladn7VRFKI5OKlD+oNitpepIj5GpsI
	 Ciqn4oc3DH544l0jBNQ0NvO1KEwYYfrNKDoik6e3tN3D/NJrBO65iNFOZnjEb1S/H7uIG
	 xsvXMgx65gqbmWlE00oHx/Ks/JUZAMiVCzvgCCaItPie3OFefQ3B8csl2b6nFb4HPgG29
	 /uDKJeqq+Vc8frplKT5lTowmZaBgesZ7sQEDGZrsLBk20zE9SjMKbFkd0IsxWzcqVppEn
	 2ZKhnW2hCjd2Tkn6Pi6xBMCPKYXNY5b+UKD96N252kHORXKmV58myCEFzYYZyQBi/RQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794446297;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key:X-Endpoint-Received:X-Original-From:Reply-To:
	 Content-Transfer-Encoding;
	bh=giOynWrj1p05vkyeYCyHdpu2lu3LEmA+NcfUzFVBsw8=;
	b=t3KTQ03rfxlud+5fHcHXXm8QYtzXxIRJe+NyIYrbpV6oYucbql+jOtD5bCiGO2302Jor
	 LzwWbmIfl7mMOMKDsFD4KmKf0WSBtCJYIGDz57ajiGNL+g621N8e3Of8ik3mttcIEW0BS
	 IWffr7d7HYUOZ74Shg95PTEOyKZm9iX3UW9+BUSkBVqXv7y+XmUAdTgef6UYuCAoxqeXb
	 UQ60pVGfSYl7IowWtO64QhhCheMqrd1xFSuTTFNiDQ/0COVMB4lQdS9tvCjjhAbDLljlq
	 K2GUV4OFGwH4s/K9vezVtxKI7TOJ8GLm2NyYsCnf60A5eGQMhIa6EUop0izmAnoCRxg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1B4AC1F00A05;
	Thu, 12 Nov 2026 01:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794446297;
	bh=giOynWrj1p05vkyeYCyHdpu2lu3LEmA+NcfUzFVBsw8=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=PkXImLPdE+XOnRYLkukGVZzArbr3fLPccyriXx3W5y9dg5ZYo8EHPfJN5Yngw3eYz
	 QB61jmbaAHOz1bDIWUSV6/8tNW+vBMOuirNWAsGPaLT6oHy02+GCPNjwVD2OopQ/Pl
	 WWN4w9I2Y1KH3TavxJbM6/HvEK/o3KyZ17wBsiXDca5ug8sIW1hUiKkRFn9wYTROB5
	 0UVjgZVp4x5ypXb4iPDJzTcfIEH8X638t0g0mfdLhYIPRmI0Ga6xRw9c4KkhGfg7ei
	 8y3RFPq0mU8vtLGJaogvZlCUzCetrc5vDyoTuv2ZjXIowhKWQ0w8ieIl7Li5O4n2Sa
	 MxjkuRyL8Jyaw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id A206B491AB;
	Thu, 12 Nov 2026 01:18:16 +0000 (UTC)
From: Igor Velkov via B4 Relay <devnull+iav.iav.lv@kernel.org>
Date: Thu, 12 Nov 2026 01:18:15 +0000
Subject: [PATCH] arm64: dts: rockchip: Name the GPIO lines on Kobol
 Helios64
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
Message-Id: <20261112-helios64-gpio-line-names-v1-1-2ce53756753f@iav.lv>
X-B4-Tracking: v=1; b=H4sIANYT9WoC/x3MQQqEMAxG4atI1hMwRUS8irjo1F8NaCsNiCC9+
 5RZfov3XjJkhdHYvJRxq2mKFfJpKOw+bmBdqsm1rhcRxzsOTdZ3vF2a+NAIjv6EcfDfYZAOi7h
 ANb8yVn3+62ku5QfPO7juagAAAA==
To: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Igor Velkov <iav@iav.lv>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4082; i=iav@iav.lv;
 h=from:subject:message-id;
 bh=mxfTsSDkWYOFNeIUFLUD6qD7wTrjLsl+OXjto3i0uRA=;
 b=owGbwMvMwCVmNH1q96v4SmbG02pJDFlfha9nyr0qPrqV6fH2LaHnvsw23ecXeWbZ+g/idxaU6
 l1qWKYd1lHKwiDGxSArpsgy4ZDGrYwlV//6e5g/gJnDygQyhIGLUwAm8k2akWHuGimJPXIajY/3
 V8ZZFcnOlUrrv8uXbLLgjcrNhbcXnGJh+Cvaw9JhWs+yWfG4UOyJSaKyKz06z909X+u8p6PS5bE
 0KzcA
X-Developer-Key: i=iav@iav.lv; a=openpgp;
 fpr=90C228DA68A4D5FD4F4837E03297958BEA5F7903
X-Endpoint-Received: by B4 Relay for iav@iav.lv/default with auth_id=1060
X-Original-From: Igor Velkov <iav@iav.lv>
Reply-To: iav@iav.lv
Content-Transfer-Encoding: 7bit

From: Igor Velkov <iav@iav.lv>

Name the SoC GPIO lines after the nets on the Helios64 Rev1.2
schematic, so that user space can find a line by name. The auto
power-on latch (U23, an SN74LVC1G79 flip-flop), for one, has no kernel
driver: user space sets it at shutdown through AUTO_ON_EN_D and
AUTO_ON_EN_CLK.

A line that reaches a named net through a series resistor takes that
net's name. The SD card lines, whose nets are not named, take the SoC
pin function, and the two board revision straps are named after the
schematic's "Board Revision ID" block. Lines that go only to a test
point or are not connected stay unnamed.

Link: https://wiki.kobol.io/helios64/files/schematics/Helios64_Schematics_Rev1.2.pdf
Signed-off-by: Igor Velkov <iav@iav.lv>
---
Tested on Helios64 with the names added by fdtput to the DTB of an
Armbian 7.3.4 kernel: gpioinfo lists them, and every line it shows as
requested by a driver (LEDs, buttons, regulators, beeper, charger, SD
card detect, Ethernet PHY reset) carries the name of the net it drives
or reads.
---
 .../boot/dts/rockchip/rk3399-kobol-helios64.dts    | 74 ++++++++++++++++++++++
 1 file changed, 74 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dts b/arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dts
index f13ea2df7a30..329116e2074b 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dts
@@ -421,6 +421,80 @@ &gmac {
 	status = "okay";
 };
 
+/* Line names follow the Helios64 Rev1.2 schematic */
+&gpio0 {
+	gpio-line-names =
+		/* GPIO0 A0-A7 */
+		"RTC_CLK0_SOC", "SDMMC0_PWR_H", "VCC12V_DCIN_GOOD", "USR1_SWITCH#",
+		"NETW_ACT_LED_ON", "PWR_KEY_L", "PWR_LED_OFF", "SDMMC0_DET_L",
+		/* GPIO0 B0-B5 */
+		"LAN_WAKE#", "EXP16_INT#", "PMIC_INT#", "USB3_ACT_LED_ON",
+		"SYS_GRN_LED_ON", "SYS_RED_LED_ON";
+};
+
+&gpio1 {
+	gpio-line-names =
+		/* GPIO1 A0-A7 */
+		"HDD_A_ON", "HDD_B_ON", "TYPEC0_CC_INT_L", "VCC5V0_TYPEC0_EN",
+		"USB_MUX_HS", "PMIC_SLEEP_H", "OTP_OUT_H", "SOC_SO",
+		/* GPIO1 B0-B7 */
+		"SOC_SI", "SOC_CK", "SOC_CE#", "I2C4_SDA_TYPEC",
+		"I2C4_SCL_TYPEC", "USB_MUX_OE", "GPU_SLEEP_H", "I2C0_SDA_PMIC",
+		/* GPIO1 C0-C7 */
+		"I2C0_SCL_PMIC", "CPU_SLEEP_B_H", "SOC_WP#", "LOG_DVS_PWM",
+		"I2C8_SDA", "I2C8_SCL", "USB3_EN", "USB3LAN_PWR",
+		/* GPIO1 D0 */
+		"PCIE_PWR";
+};
+
+&gpio2 {
+	gpio-line-names =
+		/* GPIO2 A0-A7 */
+		"I2C2_SDA_TEMP_EXP", "I2C2_SCL_TEMP_EXP", "SATA_ERR0", "SATA_ERR1",
+		"SATA_ERR2", "SATA_ERR3", "SATA_ERR4", "I2C7_SDA",
+		/* GPIO2 B0-B7 */
+		"I2C7_SCL", "SPI2_RXD", "SPI2_TXD", "SPI2_CLK",
+		"SPI2_CSN0", "", "", "",
+		/* GPIO2 C0-C7 */
+		"UART0_RX", "UART0_TX", "", "",
+		"SATA_SO_LV", "SATA_SI_LV", "SATA_CK_LV", "SATA_CE#_LV",
+		/* GPIO2 D0-D4 */
+		"SATA_WP#_LV", "PCIE_CLKREQ_L", "", "CHARGER_STATUS#",
+		"PCIE_PERST_L";
+};
+
+&gpio3 {
+	gpio-line-names =
+		/* GPIO3 A0-A7 */
+		"RGMII_TXD2", "RGMII_TXD3", "RGMII_RXD2", "RGMII_RXD3",
+		"RGMII_TXD0", "RGMII_TXD1", "RGMII_RXD0", "RGMII_RXD1",
+		/* GPIO3 B0-B7 */
+		"GMAC_MDC", "RGMII_RXCTL", "", "GMAC_CLK",
+		"RGMII_TXCTL", "GMAC_MDIO", "RGMII_RXC", "GPHY_RST#",
+		/* GPIO3 C0-C7 */
+		"", "RGMII_TXC", "", "",
+		"", "", "", "",
+		/* GPIO3 D0-D7 */
+		"", "", "", "",
+		"", "", "ERR1_B", "ERR1_A";
+};
+
+&gpio4 {
+	gpio-line-names =
+		/* GPIO4 A0-A7 */
+		"", "ERR0_B", "", "",
+		"", "ERR0_A", "", "",
+		/* GPIO4 B0-B7 */
+		"SDMMC0_D0", "SDMMC0_D1", "SDMMC0_D2", "SDMMC0_D3",
+		"SDMMC0_CLKOUT", "SDMMC0_CMD", "", "",
+		/* GPIO4 C0-C7 */
+		"", "", "FAN1_PWM", "UART2DBG_RX",
+		"UART2DBG_TX", "FAN1_SENSE", "FAN2_PWM", "FAN2_SENSE",
+		/* GPIO4 D0-D6 */
+		"SATA_SPI_FLSH", "AUTO_ON_EN_D", "AUTO_ON_EN_CLK", "BUZZER_ON",
+		"SATA_ACT_LED", "BOARD_REV_ID0", "BOARD_REV_ID1";
+};
+
 &gpu {
 	mali-supply = <&vdd_gpu>;
 	status = "okay";

---
base-commit: c3baae5f1a15645cddadcb2b9abddef5df291f59
change-id: 20261112-helios64-gpio-line-names-cab8814ed12c

Best regards,
-- 
Igor Velkov <iav@iav.lv>


