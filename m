Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794461500;
	b=Bk1v9MotIjf3CC63iLpEDpuBVswt5OjQv2VU2BSGmrE3p6EAF8XgTXdwQ1jcSHSZ9BU+
	 wdiJgQ4gu681/r0iyg9EqTzICGnDYLsLuTW114AIfWBeWyscje5qTxmB9rBVKK/xCWfRo
	 HnBZaW8nsfrrUYIBZzgG6xj4cbU+4dxkacIL7zXvha2R4DOvYtu3+RABRpDPP0Q+muskF
	 rxLZqZ2UbapvLlpAjqDEleLbtME0VY/D1KI0FfFSb19VOb9Ldm27lIochCKo/9fV8RHfT
	 wLXNArWB1iNoMKo2QdaeVekPt2jLUBVJhKP4k/H5HZssvKrXbW29pZAWl6yl1Zcs0Dw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794461500;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:Content-Type;
	bh=Rfsj+mkMU5HisFsm77mg0jonXRyMv0ZwUqc6im3PJmc=;
	b=xgBKKcOv/Kq/lF/HGnfH3BpaT1mKO5El5BV3Ep3v8KGlJ4KKS2gImXf5oY6y8bgNA6v1
	 Z/YjYAOZjZRxBqAXRAcBnHYSLsVpRHyb6svX1W/JTtaokzDvFX9qLM+dE8TmUaLjnxuOV
	 47eg0m7FFcSCJPa8WWs4LY6XR8LX6ihrbAnXnfBuBY1kCMeiVvLyvmYlhtpPEji6MbIJT
	 MhCVKPUkdGOFBkf8MUO51TX3IWFavCTDHefJ41SCacQ4q253+NFHj9u6b7+9ZdLDyJkuy
	 JWeSV6xcK517UF9tkIHDGBobOPVjPzNUKQZSudBqKZv1FCxDVGRJsWgr/JMrgOG7B+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=eYFqueRe;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E82E2606A324;
	Thu, 12 Nov 2026 05:31:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E82E2606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=eYFqueRe
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AC5VS1Z03463058, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1794461489; bh=Rfsj+mkMU5HisFsm77mg0jonXRyMv0ZwUqc6im3PJmc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=eYFqueReyfllCNq0gxQB/gg+JWd/vHf4JLRvJ3httC6UQVdT9t55NiuKeDci4mC61
	 aKALzK99Tg+/CCHo51hIdF8RRnTb935DUXAQ8u83xPXTYHL3f7Wdet4KRkLjkeZBVM
	 KkpVsXjFUHIvMmk1AZmHRJroLiU067g1ObvGQ5pQNT7OtUOIOXJOXS++agI3sYT7hf
	 huc2RO/785GBicxipaQElVAw3H90Yabs/L3Fvt2hrhFpFdoSe/GGyRmfXZzhyEYX5K
	 7pY1XuG0XNe3q5Mj35bPfgdQJ/FIuRfwPhR5pdJ99c5vHZqFfYwZET2OGmrlmO9Hv4
	 my79n7pANOyrQ==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AC5VS1Z03463058
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 12 Nov 2026 13:31:28 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 12 Nov 2026 13:31:28 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS06.realtek.com.tw
 (10.21.1.56) with Microsoft SMTP Server id 15.2.2562.56 via Frontend
 Transport; Thu, 12 Nov 2026 13:31:28 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <p.zabel@pengutronix.de>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <cylee12@realtek.com>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<james.tai@realtek.com>, <cy.huang@realtek.com>, <stanley_chang@realtek.com>,
	<eleanor.lin@realtek.com>
Subject: [PATCH v16 1/3] dt-bindings: reset: Add Realtek RTD1625 reset IDs
Date: Thu, 12 Nov 2026 13:31:26 +0800
Message-ID: <20261112053128.561149-2-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261112053128.561149-1-eleanor.lin@realtek.com>
References: <20261112053128.561149-1-eleanor.lin@realtek.com>
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
Content-Type: text/plain

From: Cheng-Yu Lee <cylee12@realtek.com>

Add the device tree bindings header containing reset indices for the
Realtek RTD1625 SoC.

Signed-off-by: Cheng-Yu Lee <cylee12@realtek.com>
Co-developed-by: Yu-Chun Lin <eleanor.lin@realtek.com>
Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
---
 MAINTAINERS                                 |   6 +
 include/dt-bindings/reset/realtek,rtd1625.h | 171 ++++++++++++++++++++
 2 files changed, 177 insertions(+)
 create mode 100644 include/dt-bindings/reset/realtek,rtd1625.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 93abbb315065..a47642615d59 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23551,6 +23551,12 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/net/pse-pd/realtek,pse-mcu-gen1.yaml
 F:	drivers/net/pse-pd/realtek-pse-mcu*
 
+REALTEK RESET DRIVERS
+M:	Cheng-Yu Lee <cylee12@realtek.com>
+M:	Yu-Chun Lin <eleanor.lin@realtek.com>
+S:	Supported
+F:	include/dt-bindings/reset/realtek,rtd1625.h
+
 REALTEK RTL83xx SMI DSA ROUTER CHIPS
 M:	Linus Walleij <linusw@kernel.org>
 M:	Luiz Angelo Daros de Luca <luizluca@gmail.com>
diff --git a/include/dt-bindings/reset/realtek,rtd1625.h b/include/dt-bindings/reset/realtek,rtd1625.h
new file mode 100644
index 000000000000..a906ab822f18
--- /dev/null
+++ b/include/dt-bindings/reset/realtek,rtd1625.h
@@ -0,0 +1,171 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (C) 2026 Realtek Semiconductor Corp.
+ */
+
+#ifndef __DT_BINDINGS_RTK_RESET_RTD1625_H
+#define __DT_BINDINGS_RTK_RESET_RTD1625_H
+
+#define RTD1625_CRT_RSTN_MISC			0
+#define RTD1625_CRT_RSTN_DIP			1
+#define RTD1625_CRT_RSTN_GSPI			2
+#define RTD1625_CRT_RSTN_SDS			3
+#define RTD1625_CRT_RSTN_SDS_REG		4
+#define RTD1625_CRT_RSTN_SDS_PHY		5
+#define RTD1625_CRT_RSTN_GPU2D			6
+#define RTD1625_CRT_RSTN_DC_PHY			7
+#define RTD1625_CRT_RSTN_DCPHY_CRT		8
+#define RTD1625_CRT_RSTN_LSADC			9
+#define RTD1625_CRT_RSTN_SE			10
+#define RTD1625_CRT_RSTN_DLA			11
+#define RTD1625_CRT_RSTN_JPEG			12
+#define RTD1625_CRT_RSTN_SD			13
+#define RTD1625_CRT_RSTN_SDIO			14
+#define RTD1625_CRT_RSTN_PCR_CNT		15
+#define RTD1625_CRT_RSTN_PCIE0_STITCH		16
+#define RTD1625_CRT_RSTN_PCIE0_PHY		17
+#define RTD1625_CRT_RSTN_PCIE0			18
+#define RTD1625_CRT_RSTN_PCIE0_CORE		19
+#define RTD1625_CRT_RSTN_PCIE0_POWER		20
+#define RTD1625_CRT_RSTN_PCIE0_NONSTICH		21
+#define RTD1625_CRT_RSTN_PCIE0_PHY_MDIO		22
+#define RTD1625_CRT_RSTN_PCIE0_SGMII_MDIO	23
+#define RTD1625_CRT_RSTN_VO2			24
+#define RTD1625_CRT_RSTN_MISC_SC0		25
+#define RTD1625_CRT_RSTN_MD			26
+#define RTD1625_CRT_RSTN_LVDS1			27
+#define RTD1625_CRT_RSTN_LVDS2			28
+#define RTD1625_CRT_RSTN_MISC_SC1		29
+#define RTD1625_CRT_RSTN_I2C_3			30
+#define RTD1625_CRT_RSTN_FAN			31
+#define RTD1625_CRT_RSTN_TVE			32
+#define RTD1625_CRT_RSTN_AIO			33
+#define RTD1625_CRT_RSTN_VO			34
+#define RTD1625_CRT_RSTN_MIPI_CSI		35
+#define RTD1625_CRT_RSTN_HDMIRX			36
+#define RTD1625_CRT_RSTN_HDMIRX_WRAP		37
+#define RTD1625_CRT_RSTN_HDMI			38
+#define RTD1625_CRT_RSTN_DISP			39
+#define RTD1625_CRT_RSTN_SATA_PHY_POW1		40
+#define RTD1625_CRT_RSTN_SATA_PHY_POW0		41
+#define RTD1625_CRT_RSTN_SATA_MDIO1		42
+#define RTD1625_CRT_RSTN_SATA_MDIO0		43
+#define RTD1625_CRT_RSTN_SATA_WRAP		44
+#define RTD1625_CRT_RSTN_SATA_MAC_P1		45
+#define RTD1625_CRT_RSTN_SATA_MAC_P0		46
+#define RTD1625_CRT_RSTN_SATA_MAC_COM		47
+#define RTD1625_CRT_RSTN_PCIE1_STITCH		48
+#define RTD1625_CRT_RSTN_PCIE1_PHY		49
+#define RTD1625_CRT_RSTN_PCIE1			50
+#define RTD1625_CRT_RSTN_PCIE1_CORE		51
+#define RTD1625_CRT_RSTN_PCIE1_POWER		52
+#define RTD1625_CRT_RSTN_PCIE1_NONSTICH		53
+#define RTD1625_CRT_RSTN_PCIE1_PHY_MDIO		54
+#define RTD1625_CRT_RSTN_HDMITOP		55
+#define RTD1625_CRT_RSTN_I2C_4			56
+#define RTD1625_CRT_RSTN_I2C_5			57
+#define RTD1625_CRT_RSTN_TSIO			58
+#define RTD1625_CRT_RSTN_VI			59
+#define RTD1625_CRT_RSTN_EDP			60
+#define RTD1625_CRT_RSTN_VE1_MMU		61
+#define RTD1625_CRT_RSTN_VE1_MMU_FUNC		62
+#define RTD1625_CRT_RSTN_HSE_MMU		63
+#define RTD1625_CRT_RSTN_HSE_MMU_FUNC		64
+#define RTD1625_CRT_RSTN_MDLM2M			65
+#define RTD1625_CRT_RSTN_ISO_GSPI		66
+#define RTD1625_CRT_RSTN_SOFT_NPU		67
+#define RTD1625_CRT_RSTN_SPI2EMMC		68
+#define RTD1625_CRT_RSTN_EARC			69
+#define RTD1625_CRT_RSTN_VE1			70
+#define RTD1625_CRT_RSTN_PCIE2_STITCH		71
+#define RTD1625_CRT_RSTN_PCIE2_PHY		72
+#define RTD1625_CRT_RSTN_PCIE2			73
+#define RTD1625_CRT_RSTN_PCIE2_CORE		74
+#define RTD1625_CRT_RSTN_PCIE2_POWER		75
+#define RTD1625_CRT_RSTN_PCIE2_NONSTICH		76
+#define RTD1625_CRT_RSTN_PCIE2_PHY_MDIO		77
+#define RTD1625_CRT_RSTN_DCPHY_UMCTL2		78
+#define RTD1625_CRT_RSTN_MIPI_DSI		79
+#define RTD1625_CRT_RSTN_HIFM			80
+#define RTD1625_CRT_RSTN_NSRAM			81
+#define RTD1625_CRT_RSTN_AUCPU0_REG		82
+#define RTD1625_CRT_RSTN_MDL_GENPW		83
+#define RTD1625_CRT_RSTN_MDL_CHIP		84
+#define RTD1625_CRT_RSTN_MDL_IP			85
+#define RTD1625_CRT_RSTN_TEST_MUX		86
+#define RTD1625_CRT_RSTN_ISO_BIST		87
+#define RTD1625_CRT_RSTN_MAIN_BIST		88
+#define RTD1625_CRT_RSTN_MAIN2_BIST		89
+#define RTD1625_CRT_RSTN_VE1_BIST		90
+#define RTD1625_CRT_RSTN_VE2_BIST		91
+#define RTD1625_CRT_RSTN_DCPHY_BIST		92
+#define RTD1625_CRT_RSTN_GPU_BIST		93
+#define RTD1625_CRT_RSTN_DISP_BIST		94
+#define RTD1625_CRT_RSTN_NPU_BIST		95
+#define RTD1625_CRT_RSTN_CAS_BIST		96
+#define RTD1625_CRT_RSTN_VE4_BIST		97
+#define RTD1625_CRT_RSTN_EMMC			98
+#define RTD1625_CRT_RSTN_GPU			99
+#define RTD1625_CRT_RSTN_VE2			100
+#define RTD1625_CRT_RSTN_UR1			101
+#define RTD1625_CRT_RSTN_UR2			102
+#define RTD1625_CRT_RSTN_UR3			103
+#define RTD1625_CRT_RSTN_UR4			104
+#define RTD1625_CRT_RSTN_UR5			105
+#define RTD1625_CRT_RSTN_UR6			106
+#define RTD1625_CRT_RSTN_UR7			107
+#define RTD1625_CRT_RSTN_UR8			108
+#define RTD1625_CRT_RSTN_UR9			109
+#define RTD1625_CRT_RSTN_UR_TOP			110
+#define RTD1625_CRT_RSTN_I2C_7			111
+#define RTD1625_CRT_RSTN_I2C_6			112
+#define RTD1625_CRT_RSTN_SPI0			113
+#define RTD1625_CRT_RSTN_SPI1			114
+#define RTD1625_CRT_RSTN_SPI2			115
+#define RTD1625_CRT_RSTN_LSADC0			116
+#define RTD1625_CRT_RSTN_LSADC1			117
+#define RTD1625_CRT_RSTN_ISOMIS_DMA		118
+#define RTD1625_CRT_RSTN_AUDIO_ADC		119
+#define RTD1625_CRT_RSTN_DPTX			120
+#define RTD1625_CRT_RSTN_AUCPU1_REG		121
+#define RTD1625_CRT_RSTN_EDPTX			122
+
+/* ISO reset */
+#define RTD1625_ISO_RSTN_VFD			0
+#define RTD1625_ISO_RSTN_CEC0			1
+#define RTD1625_ISO_RSTN_CEC1			2
+#define RTD1625_ISO_RSTN_CBUSTX			3
+#define RTD1625_ISO_RSTN_CBUSRX			4
+#define RTD1625_ISO_RSTN_USB3_PHY2_XTAL_POW	5
+#define RTD1625_ISO_RSTN_UR0			6
+#define RTD1625_ISO_RSTN_GMAC			7
+#define RTD1625_ISO_RSTN_GPHY			8
+#define RTD1625_ISO_RSTN_I2C_0			9
+#define RTD1625_ISO_RSTN_I2C_1			10
+#define RTD1625_ISO_RSTN_CBUS			11
+#define RTD1625_ISO_RSTN_USB_DRD		12
+#define RTD1625_ISO_RSTN_USB_HOST		13
+#define RTD1625_ISO_RSTN_USB_PHY_0		14
+#define RTD1625_ISO_RSTN_USB_PHY_1		15
+#define RTD1625_ISO_RSTN_USB_PHY_2		16
+#define RTD1625_ISO_RSTN_USB			17
+#define RTD1625_ISO_RSTN_TYPE_C			18
+#define RTD1625_ISO_RSTN_USB_U3_HOST		19
+#define RTD1625_ISO_RSTN_USB3_PHY0_POW		20
+#define RTD1625_ISO_RSTN_USB3_P0_MDIO		21
+#define RTD1625_ISO_RSTN_USB3_PHY1_POW		22
+#define RTD1625_ISO_RSTN_USB3_P1_MDIO		23
+#define RTD1625_ISO_RSTN_VTC			24
+#define RTD1625_ISO_RSTN_USB3_PHY2_POW		25
+#define RTD1625_ISO_RSTN_USB3_P2_MDIO		26
+#define RTD1625_ISO_RSTN_USB_PHY_3		27
+#define RTD1625_ISO_RSTN_USB_PHY_4		28
+
+/* ISO_S reset */
+#define RTD1625_ISO_S_RSTN_ISOM_MIS		0
+#define RTD1625_ISO_S_RSTN_GPIOM		1
+#define RTD1625_ISO_S_RSTN_TIMER7		2
+#define RTD1625_ISO_S_RSTN_IRDA			3
+#define RTD1625_ISO_S_RSTN_UR10			4
+
+#endif /* __DT_BINDINGS_RTK_RESET_RTD1625_H */
-- 
2.43.0

