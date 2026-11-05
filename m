Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.65.3
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793845267;
	b=oiegw2G3Pkhd793JGwBoeOoeYmVM8Yi2HCo7OZpDkVbsWRxo/pHOvaqmu30uWykGaHGU
	 YfaauigyOIm1D3CbS4N9d3tA4UgbgSOjA+P+6/8NktcXnIABj++9EhcUG8622e+i45246
	 Ykx1tVcjwpMSMFbeMtREYpQn0GPR8SQKHMLghhRYH/DqvKvvHfYpjbKuQACDDi95CPlTQ
	 uK+mOHFmClPvq1KWl2bh7YwOZ14sCWpqZWPHP+UNVUZM6fsKWeaLtom0Kjf1X7/TGWV/U
	 7DWPUTCh4zesbmPwTufO8cH83A7Mr+QVK+QuLag61+z/Zi/iMqJsFXv8qZcpphqq8mA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793845267;
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
	bh=nB/lJ/2bzW+3FxT/7Z+gmnR4HU3zOiZA+iQ+cgYNiIc=;
	b=1Eh8XCRu+eoYtSP7bD/CCPMyRxE23CG1YrnS9dq1sItjt24bNTiXiu+tXRs15d2w8OXJ
	 7t11npJUCCLVEGEoCy32ujwLKfjZoZkO+gw+9zbN9fcMdgl+X/R3KORnFYM1YQBlouXXD
	 W9RqB+zUQQ7x2K7jSJKOi/Q2VGGWuxEeexW1Jd9hoP41pbNQ7HI2Z4McgfRSeZXss2+qQ
	 lom2THWUu3a99g8kglT+yRHXQAPVhjz7HQw0+s/N1MZoxz9UJxzNYwobPRiiScNdRF9cB
	 kYZi+U1FYXIv+sy+ateSpzrSg+hpwRpOubq52I10IFVK88uyX+JWd0MZUCOFdHYJ/TA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cn.bosch.com;
	spf=pass smtp.mailfrom=cn.bosch.com;
	dkim=pass header.d=cn.bosch.com header.i=@cn.bosch.com header.a=rsa-sha256 header.s=selector2 header.b=A3x9vHVy;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.65.3
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011003.outbound.protection.outlook.com [52.101.65.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0D7A606A328;
	Thu,  5 Nov 2026 02:21:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0D7A606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cn.bosch.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cn.bosch.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cn.bosch.com header.i=@cn.bosch.com header.a=rsa-sha256 header.s=selector2 header.b=A3x9vHVy
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C7lV4GXWGdT/czZ8IaFrhIzZb1dRy7Kf0ymMESr9mmhuPxOq32EwSptpzYUR0G9IatEPl5oyesjWGVxtcwBaSdEQcQjIDL+ZCSiU0tslVyCwjFAD7rtjcrp9vQSDCSDuZQwnojuL074uprY2OcBhOACgZS4mQVnlRg26h4+wNGryqx3crJ8daiKqSO8hrkVGeu+iEuqWidLlR5m2jzwU+U3XA2ubKkAxqHd7IX0sBbW7t8cOwZF2lefCl4iiseEwNL0YCev9gzUWx8fb27TinHMVFQza1DvKbfP9DJqXWvAO7ymCwR2EEvvBbU9fbarhSuhR8gcWTXdclTEzmq2g0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nB/lJ/2bzW+3FxT/7Z+gmnR4HU3zOiZA+iQ+cgYNiIc=;
 b=Y/1Y00ODzWpq/FP9Zn5Dg96ZCAr0uiH3ni7F/ZRUJusBFnMohT50+T2XtbPP9LzHrL7bl355SC9vguC8/XMSaBlv7/l2TsCDPD7iI9NwH4EVrlvp2u07a4451s2ZWeeRnU/NyaAFSdHSPsX/RGpPHtwLBTrCHbVsqCyK6/cZnftpgcUJNPq4sCtJHtzE+53qw2p6PLtHvjt+LvRDxgID6prgp5Wpky/mzXlazkVX2/Esuq58+tAJ+m7QZUriu6ap/ALAhRsRcxXPzbDKz3gQPCgnmUPvzDwFCvl8RxdVXkn58RuOeJFeY0evdgMgMgvoAWcJ1OTvCvRyG3KH6oh+Mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.205) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=cn.bosch.com; dmarc=pass (p=reject sp=none pct=100) action=none
 header.from=cn.bosch.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cn.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nB/lJ/2bzW+3FxT/7Z+gmnR4HU3zOiZA+iQ+cgYNiIc=;
 b=A3x9vHVyQCA5D2m5w6b7BVxcrUBc94znaZT5alpiALmPMxYlDQSmvmK/FCDuAzbYsQO3Y3/6kuMu2tsHob6qg7OIvRvKdtcbU+jWRuAH46Uh2oo9VbU1IHxA2KOqDcYv8RtxYDjJK8f5sB8zTU0E4bzW96qr/eS500veNT8pf6DOotX1OxHb83A0Qsi6dBDzmTggJeQsyxF60cSGs+fhIV0hjI89n8xB7y2XUqOJJy/647QSDPgvhwDtI21QvlrZ28/y8eSZBMH4j+iFBx6oVaxtlkSnMMdmEfANqzl67ZsQRTMFZzsmWBmui/8lAbwID2xeXC+vOxLmCu/UUJcgNg==
Received: from AS4PR10CA0019.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5d8::19)
 by GVXPR10MB5933.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:4::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.4; Thu, 5 Nov 2026
 02:21:01 +0000
Received: from AMS1EPF00000090.eurprd05.prod.outlook.com
 (2603:10a6:20b:5d8:cafe::1c) by AS4PR10CA0019.outlook.office365.com
 (2603:10a6:20b:5d8::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Thu, 5
 Nov 2026 02:21:01 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 139.15.153.205) smtp.mailfrom=cn.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=cn.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of cn.bosch.com designates
 139.15.153.205 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.205; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.205) by
 AMS1EPF00000090.mail.protection.outlook.com (10.167.242.87) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Thu, 5 Nov 2026 02:21:01 +0000
Received: from RNGMBX3003.de.bosch.com (10.124.11.208) by eop.bosch-org.com
 (139.15.153.205) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Thu, 5 Nov
 2026 03:20:54 +0100
Received: from WX8-V-0006W.wx.apac.bosch.com (10.183.144.211) by
 smtp.app.bosch.com (10.124.11.208) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 5 Nov 2026 03:20:51 +0100
From: Kaiwen Zhang <kaiwen.zhang@cn.bosch.com>
Date: Thu, 5 Nov 2026 10:20:27 +0800
Subject: [PATCH 2/2] arm64: dts: imx8mn-bsh-smm-s2/pro: Increase backlight
 PWM frequency
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
Message-ID: <20261105-b4-bsh-s2-dts-v1-2-8586d0ba44dc@cn.bosch.com>
References: <20261105-b4-bsh-s2-dts-v1-0-8586d0ba44dc@cn.bosch.com>
In-Reply-To: <20261105-b4-bsh-s2-dts-v1-0-8586d0ba44dc@cn.bosch.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, Sascha Hauer
	<s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
CC: <devicetree@vger.kernel.org>, <imx@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Kaiwen Zhang <kaiwen.zhang@cn.bosch.com>, Jihu Si <Jihu.SI@cn.bosch.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793845230; l=971;
 i=kaiwen.zhang@cn.bosch.com; s=20261103; h=from:subject:message-id;
 bh=hVaoYLwv7M8JqhuM7fE+iGx/CDnORN3k/zcYeb1Zs08=;
 b=ODcdJHr+zIvsZhEvUHm008uTwTuprimigyLobX4iby1bo9SG5SgXl3CshrKZd2PaW4rheLVOB
 quRDfubztU6C4JPkFuMImW4/5DhfOFxh30wA/sVPmkOs35w4jkLHWyV
X-Developer-Key: i=kaiwen.zhang@cn.bosch.com; a=ed25519;
 pk=8Ap+lAs6RrhqKlHTUdPD/pH0z8/aAuWeDjMasYu4huU=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF00000090:EE_|GVXPR10MB5933:EE_
X-MS-Office365-Filtering-Correlation-Id: 93454b3a-9d30-4138-16fe-08df3ae36f96
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|23010399003|1800799024|82310400026|36860700016|261022105027099003|11063799006|56012099006|261021123027099003|261009223027099003|261022075727099003|261026140227099003|261021121427099003|261028144727099003|261102123227099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	UVM6nQ61crcarZjKgC1pL01yuRv+fPsIfdboR/dcfCsYwc0+UJT3beYTD8pMa4sbt3VWpFxNoN4Ku5ZeRts54jnWKtKzzRMZzYGa+dBJ3Z1EyWb5lqE6Alr3vl6UCDmKCN47+6N2+WM5NJY9GYFlzy3N33USxHe6q7cgD0Y1ZG12wXl30ENwmAGv/AXzLoAk2Ux0LmpTa396Dfs5fFao6sg0pwjMY2/nRHjgQLZzmDO1zEL6Hm0Lr3XImG8hb2OBWka4T8SnBL5xF5Ns+KvxjAvxKuM/NV09kTJtKiKUQo3952S8d+RSa67d9eXtnf5SEQxjWr7VjPM/jEOlFmRY4eFm6ve3rfteabe409vJHWfyLa96C3sA1uOd9IaIoNH8fGPQXn1wvR+QYmz1Wz3itEMlU9j3C2MYEbm4wkuXuzV/73EYkYB0pXdsjugH+ihlHWJ//wl3R2k/wSTafXFhc2yitKnb8zLRuU9j+L4zhS6YInr4PpzNGzUYp+Tgp53AEbwHd7BcpMOeYiNZmYuXNgZWR4VIfu/rDbGS5JaYaw8JuMg5i6WB7zvxPI87GZEBN3X9rOUDPd/sfF2bRimHjlW8DLGbW9b8+ozBAdczcuVx9mn62Al83tc+0CjbyVPdMhvQtPGt+GtkAqmDRyevb1hq0FX19Yuqzu5x/MN0Ry4bt7TQX7ke/U9TnGnc1hhomJaL4qP2FU4zI9DK8myUcw==
X-Forefront-Antispam-Report:
	CIP:139.15.153.205;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(1800799024)(82310400026)(36860700016)(261022105027099003)(11063799006)(56012099006)(261021123027099003)(261009223027099003)(261022075727099003)(261026140227099003)(261021121427099003)(261028144727099003)(261102123227099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	+zcX+Jf3yjOV0xJ4fGKwyBUkL5YvaQITmKF2JAJ342Hvvbn2JzwRfIO2ahoBSCwkVRQTRi45YV+DMFQMzaGi+sHku2QVei7ytB62GyP2GMDOqhJ4vjsItZ6HYII9PRUtmcvMrpTJYrWEe1qMUIZWY+Zxb40uDPBR+mc6mPCb9IcDSJ5tQO1jcxnlNrLssyF0v3XkqdNlmk/AXGdW9UyXDD2Xte0YDh1IxohYONA7sXlNceenmfkenxRNZHlg1+XWE1jvUyEpQ3EsYHOxW1mB75+iJY4VF8cQAo3YuhmN+ICljiKffG88R5nfTViPaNrDp8J5XfP+QI5MuxYvq3qe9nWtOe3NAHlI0EnseVL8xR+auE/D8avX3Q3NAu7//cd+p8wkAjCeRhZE+z+n0yUq1mfEJqvQrERlCUV/2hHuZGvB2Guhhxv9mqI79fDAyreA
X-OriginatorOrg: cn.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 02:21:01.3279
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 93454b3a-9d30-4138-16fe-08df3ae36f96
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.205];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF00000090.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR10MB5933

Increase the backlight PWM frequency to 2 kHz to reduce the risk of
backlight flicker.

Signed-off-by: Jihu Si <Jihu.SI@cn.bosch.com>
Signed-off-by: Kaiwen Zhang <kaiwen.zhang@cn.bosch.com>
---
 arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-display.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-display.dtsi b/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-display.dtsi
index 98dec3c42060..75aa71bebf4f 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-display.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-display.dtsi
@@ -34,7 +34,7 @@ framebuffer-panel0 {
 
 	backlight: backlight {
 		compatible = "pwm-backlight";
-		pwms = <&pwm1 0 700000 0>;	/* 700000 ns = 1337Hz */
+		pwms = <&pwm1 0 500000 0>;	/* 500000 ns = 2000Hz */
 		brightness-levels = <0 100>;
 		num-interpolated-steps = <100>;
 		default-brightness-level = <50>;

-- 
2.34.1

