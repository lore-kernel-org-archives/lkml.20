Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.71
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794389072;
	b=LtgCl5kUV8PpRHTbCMqUbAE1T+TuqsrWPNfmEoBLYkCjd1JlB9bn3SYkP+Ju9LcUX9w7
	 RGx7KXcQ3UtGT3XQfFD29/TmB4hUchHrjTRD5JHBw9i8rip8sXgnRcctDSmnggoBoFeJn
	 BfhILirbiLiadxEdhqDfPbOHSxRxJPrCT1a2SIvcd+3OPlPvx8hYVCgEZcXCOgqR0C06x
	 CXDi1Wu3NDAn2FPIFLg+Tof2GxJX0bFApFzSfVIPA24/y+5chS/4bhbYFAKeR6sIGZPol
	 kK9wTmg16sPZIDpSO3M8DMBPR9nC/xK/adriIbC2YM86/GWpq52mOvCsePJSYWGaiCw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794389072;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-ID:References:In-Reply-To:To:CC:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Originating-IP:
	 X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=QUqfm+xAMCPKLkSrKzsAdGGrE1lDdFSu5YpNnDU6xK8=;
	b=ExhCtwXMhiyShp848UFxsx3Qx0bfHkNRVBq20o1/4GFjbU4Nd75Pzno2Kzq2FyWW0R3Y
	 Kz5Lu0D6QlvG4TbyFSqnUcUy3H8gCPW9Y2VFXovlX3lLSsvmgLucheHcrYCkEPqu4EiB4
	 zEsKkouFoPrjSx6G9MGeo9qGIX7315nm8HAtM/zgO0T8xR08JjACd9k8b9jtIPkX/qNWG
	 9nIKPJrOnE9EAOcxclTLbFZtL42LQQmM0+qrPBL2rTS/8PdMsSiDLWpaHZz7m5LoKUcIo
	 zuhfWf/otWACRbqX7/5JhTABPiIUAG117tESNrO/mHGhrVZFQ182eDG72I5gStYye8Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cn.bosch.com;
	spf=pass smtp.mailfrom=cn.bosch.com;
	dkim=pass header.d=cn.bosch.com header.i=@cn.bosch.com header.a=rsa-sha256 header.s=selector2 header.b=VOPXJ7OU;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.71
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010071.outbound.protection.outlook.com [52.101.84.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEF46606A32A;
	Wed, 11 Nov 2026 09:24:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DEF46606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cn.bosch.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cn.bosch.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cn.bosch.com header.i=@cn.bosch.com header.a=rsa-sha256 header.s=selector2 header.b=VOPXJ7OU
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g6N47vbs8tvtaH5HqFvLInJiFri4rh5MWwqbHluE/PTLRJ8qrSTOyD1bSfnDUCXbZxWEjR0SRwNI/M1BzrzGyWNV8ZtNPTkv9vgXQ/ATd41Vcl92cNfjNvk1PVP3cTM2B/NpvZhmAyqI3W8v3SkHDGARqXCM3DfYkq2AdNy0ZoxHsUJSYPQFHrsp8vC1Y0pJ6Ra1sPgZ0cnsZeY5JHAUIbeD3N7WyzeQFGS+sCIyJG9Dslj1/nukUX76RNDi1+VwqJ5yCd0CFFlSGPHbCbpELv/sZkGUW3s98JizrIy91pzmKIUE2NW29fBLK3w3GKVn+eNZX2FmDfdILYOHLWYMvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QUqfm+xAMCPKLkSrKzsAdGGrE1lDdFSu5YpNnDU6xK8=;
 b=W5pd3z/OYd0TU2s23nkMiThwcmLZM3u3X+b8QVaV9PQFOH1vVun7JzOwz9hVyBeZ1lbMEVp5jwojftVoxaF71EYIGHuA4ZIwTA099UzdxlZxZRAN7k9ggtPcBFUTAwufQTL618RIz5+jTaCd/+JSvA1NhIaV3YJyw5zPrbTzGDDkNzMVJ/L3dn8x7tnFrstuFsM/CujY7rO27rC9amDz097mOikAJbCYT+u2AMZyZbgEWQvkZ40sFmchUfMj6uyWa2ufmn3HAx4aYpx3a/hPW46z62nJGzcA4Rj6Lg8uRkQmZW+25NjdfQtKeVlut/TvHkVdt4iY/9QsmYysymepsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.205) smtp.rcpttodomain=gmail.com smtp.mailfrom=cn.bosch.com;
 dmarc=pass (p=reject sp=none pct=100) action=none header.from=cn.bosch.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cn.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QUqfm+xAMCPKLkSrKzsAdGGrE1lDdFSu5YpNnDU6xK8=;
 b=VOPXJ7OUBe6JwtBC0qCBAzx94lPeRSjsa3H95BYXfZTWsjXlfRL3tgTC1mlS3ptDe3hZfVzbdlQShAbnM9nxJO6ck6D5QFl90/9G7t2ABtelG/Be5Nxhsioe+AUZTDDoWT9MwvJBRR982bsGcAm66DdylKm/63L+r8i1fjKNBktQpa7U+j37wltJZ5RHGmBebLY491gDO38DKlKdeZHunw1Wgt43zY2YqZLx/t/HX2KL27vuuHP43UIAlxrZJDi/0i2FDiQKclLPDF05OPMHnsXXL0PfJa6PJKkDSUudh+7NL8XCdTEj0NG682t2gk/SsCQjvByHp010fCwjsI9rTA==
Received: from DUZPR01CA0279.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b9::28) by GV4PR10MB920511.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:150:416::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Wed, 11 Nov
 2026 09:24:28 +0000
Received: from MAD0EPF000008AF.eurprd04.prod.outlook.com
 (2603:10a6:10:4b9:cafe::45) by DUZPR01CA0279.outlook.office365.com
 (2603:10a6:10:4b9::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.8 via Frontend Transport; Wed, 11
 Nov 2026 09:24:27 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 139.15.153.205) smtp.mailfrom=cn.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=cn.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of cn.bosch.com designates
 139.15.153.205 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.205; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.205) by
 MAD0EPF000008AF.mail.protection.outlook.com (10.167.241.184) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 11 Nov 2026 09:24:27 +0000
Received: from RNGMBX3003.de.bosch.com (10.124.11.208) by eop.bosch-org.com
 (139.15.153.205) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Wed, 11 Nov
 2026 10:24:07 +0100
Received: from WX8-V-0008J.wx.apac.bosch.com (10.190.167.205) by
 smtp.app.bosch.com (10.124.11.208) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Wed, 11 Nov 2026 10:24:03 +0100
From: Haoning Cheng <Haoning.CHENG@cn.bosch.com>
Date: Wed, 11 Nov 2026 17:23:20 +0800
Subject: [PATCH v3 4/8] ARM: dts: imx6ulz: Pull down BSH SMM-M2 active-high
 WLAN IRQ
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
Content-Transfer-Encoding: 8bit
Message-ID: <20261111-add-bsh-smm-m2-v3-4-4abdf10e9a7f@cn.bosch.com>
References: <20261111-add-bsh-smm-m2-v3-0-4abdf10e9a7f@cn.bosch.com>
In-Reply-To: <20261111-add-bsh-smm-m2-v3-0-4abdf10e9a7f@cn.bosch.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Frank Li
	<Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, "Pengutronix
 Kernel Team" <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>, Haoning Cheng
	<Haoning.CHENG@cn.bosch.com>, =?utf-8?q?Roman_Smr=C5=BE?=
	<roman@amarulasolutions.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1418;
 i=Haoning.CHENG@cn.bosch.com; h=from:subject:message-id;
 bh=fJjUIxydRHhBZgX21C/QRRVk4yZarNI2OIbJpeB5Asg=;
 b=owGbwMvMwCV2Lz9jvnXEsVWMp9WSGLK+mPDEb72qzlr+0UryaqlahOeDoyrnVyUV/tkif+z23
 PJk/gMXO0pZGMS4GGTFFFlUE7zPSl4NMJ02sxpuDisTyBAGLk4BmMiHGEaGtmVa69/3MTvH3b3X
 rGOmrMK+zLpvg9CSXP6KlksfvhQYMjJcEXjycNEvcaWfX9Ivc+8NTGNsbU5+wvr8z4Pviuy3K+t
 YAQ==
X-Developer-Key: i=Haoning.CHENG@cn.bosch.com; a=openpgp;
 fpr=25604BCD19D5503596997B16DE6F689F3B58C6AA
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MAD0EPF000008AF:EE_|GV4PR10MB920511:EE_
X-MS-Office365-Filtering-Correlation-Id: cc818214-508e-4158-bbb3-08df3fd5957a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|7416014|23010399003|82310400026|36860700016|11063799006|56012099006|261022075727099003|261021123027099003|261026121527099003|261102123227099003|261021121427099003|261009223027099003|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	Uhv1RCRIPxnjR3f9hxcrKVmsFVY4SimaXgjRGdR9keUzy8HvDKdufLYRCKAyRVXvL0UrFA77C1xFFgmtpbQQMmaNjUBNGztBQwTodmrejuLTr0qH6MfeWKj4KaxpqdvQY0reNSFk2eUY8X45mN2O5E8ccRsiHn17HgsX3BS3QkUc7ue020xza/2AHYEL0jiuY1FDBoHQXpX/NCdC5IqEQPLJfTTGpUvKxpKcHwGMW2BYYrraD+I3EQnsoWtPi8QOlIdQcCk/a1Xu+GZ2DEoRUF65GTpRBalF1Bwp2gtBFlf0kG/T+ff5jIRsGSlQxIfiLxcqdjLAs2cX2Df8/rVIoo2tjnoB9n5VxiZULNKgOXQ5Q+C/DJNAY5RSlvosqv+K2UybqcagaNKw2vHQefIhmIWy2ovdLEfc/ccfaH9e51T01uW1zqmZtXQa+2yu2Y1kpvC7Ojpi3qTO8obnfhG0Iu5uwbE/KTJTLTLuQ4OeGVTUrmUrDUp+pRLNMWYOiCqPhcwFdLsja4/e6Js9hAAAP8CphKBj93VHUezW1nrX/3+gek+eM674J6DHq8bCDRyQuQRTfyF6IJOjY5gvixVmP5V8A7HHc/U15ilPV1jrzuXrWSFkW9F8dX/lUoSSKJ6Bf8WuzyzbcO7up8zDNQdKkFat+AjluY4wfrU+Biu+LXhJLE8mATZO5bkRwLwcxpICTcY/3mvUm2RJZjJe53kL8g==
X-Forefront-Antispam-Report:
	CIP:139.15.153.205;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(23010399003)(82310400026)(36860700016)(11063799006)(56012099006)(261022075727099003)(261021123027099003)(261026121527099003)(261102123227099003)(261021121427099003)(261009223027099003)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	IeKhLwEWRSq2QqYsrlmo7xtIKYeGRlPHd8QBdSjes+F8p5WCMH1ZJUyJtx+90av+kHbk1sIQ9jLd49x+5RM6tBrk/lrFdDxG2RnW081RivcP8mTyDdmGaqQKy3N+uJhqGW8BVYaozUamF+VZVlDRiqv7WoJe6cCQ0TlHbzrW8JqR/LZb2RtcTmZrorlu6NULSFcg256Aj4x+qOoAMBo3qEBcGbBKbH3gAXRnpjcjBZhrW1tlx1GuQPp+FUQ1eXSegEcaOOHxd93gO8/v4e3nVvAOcPnTpc/QKtqhnFJZt+GtWJQt8va8RqD26t/WMwW5LwrY8q1lURgyOdIaZ659EioXe6egC2puO5qJj5I8IrmeUIR4Min9lB9HSTn/KLYrlnt+5S2IfjoRRP09baetcVE8rTjOUX3UiG7LaPREI2UCAv3D+DmjxQv02rHMhAjs
X-OriginatorOrg: cn.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 09:24:27.7209
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cc818214-508e-4158-bbb3-08df3fd5957a
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.205];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MAD0EPF000008AF.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4PR10MB920511

From: Roman Smrž <roman@amarulasolutions.com>

The pin is active when high, so pull-up configuration can trigger
unwanted interrupts during module loading or unloading. Change the
configuration to pull-down to avoid crashes there.

Signed-off-by: Roman Smrž <roman@amarulasolutions.com>
Signed-off-by: Haoning Cheng <Haoning.CHENG@cn.bosch.com>
---
 arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts b/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts
index dabe17222f13..91c76909c086 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts
@@ -81,7 +81,6 @@ &usdhc2 {
 	non-removable;
 	cap-power-off-card;
 	keep-power-in-suspend;
-	cap-sdio-irq;
 	mmc-pwrseq = <&usdhc2_pwrseq>;
 	status = "okay";
 
@@ -148,7 +147,7 @@ MX6UL_PAD_CSI_DATA02__USDHC2_DATA2	0x17059
 			MX6UL_PAD_CSI_DATA03__USDHC2_DATA3	0x17059
 			MX6UL_PAD_SD1_DATA3__GPIO2_IO21		0x3029		/* WL_REG_ON */
 			MX6UL_PAD_UART2_CTS_B__GPIO1_IO22	0x100b1		/* WL_DEV_WAKE - WiFi_GPIO_4 - WiFi FW UART */
-			MX6UL_PAD_UART1_CTS_B__GPIO1_IO18	0x1b0b1		/* WL_HOST_WAKE - WIFI_GPIO_0 - OOB IRQ */
+			MX6UL_PAD_UART1_CTS_B__GPIO1_IO18	0x130b1		/* WL_HOST_WAKE - WIFI_GPIO_0 - OOB IRQ */
 			MX6UL_PAD_ENET1_RX_EN__OSC32K_32K_OUT	0x4001b031	/* OSC 32Khz wifi clk in */
 		>;
 	};

-- 
2.43.0

