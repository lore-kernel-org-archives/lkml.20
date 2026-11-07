Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.127.116
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794013821;
	b=CM6gqtu7Kbmo6kHOq9Nu1OHIFcbSdRhOorIKsrxehJgb8EgrCHG1wSwTCiYZ3ZyoOKPF
	 FLwJKLgaJJ0Icfus3sHL2iAswloO2zRiQh9fLH0Xjs6KWzL5hKbYs9tpoOrHOiuCjJSaT
	 u2/eE+F+eHSUTPTHLzHhRFwll/CLjUyItnFoWm/e+wzuWe6sv40G99xC0ny67whQ9hqaw
	 P1N04xyophVXr6RHqpZPnUVzeKVE+hbKFLhEL1ZOjpNMBp9/O5ifov5K7BjkncFhZ75hB
	 y2HY+yJCPGZkLdFG5gNF2Gr3EVogRGRdguJfExM4KIR+/TRfLycLTVrLuIKicOYqoxQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794013821;
	h=DMARC-Filter:Received:Received:X-MS-Exchange-Authentication-Results:
	 Received-SPF:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:Content-Type:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=ozacI6w9b+9oPYAP1o8WF1OBV3+9w+asASKPg0by3T8=;
	b=EDo6l2as8y6JwTDXoLBbxYrx7CcQ5a02XwwqMTpkntNf948+nh6eHyV0zSL6fxadDgNC
	 sSs5WlHbiCkVpXOJiAJS78SJRxopyh0XLmQQkNDwqa3n80T+a4XyMvf4DzelpIiFFlCXp
	 fY5tIDKl31p0dHduaIZX5+jRRGIQ0puPRKpf5dgnAyPXl2saV6r0KRK/CBRcW8Qal55rP
	 wSq+TuTmP2j5YFlGp/EF118dBDzh21mLxLNxckAbRk8AGgdty4tt90tcOk0VDxn1pG//4
	 o5/0H1AIMxTHyKSfZUELgMGtJNg6HVvvfmWeei0kyp19f+yqQND5UEZRN7Un96DqZcw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=cixtech.com;
	spf=pass smtp.mailfrom=cixtech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.127.116
Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023116.outbound.protection.outlook.com [52.101.127.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1191606A32E;
	Sat,  7 Nov 2026 01:10:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1191606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=taHRQtYBIrLUDYscUR8uF2lf3KdouhkgC4IFUjMgf55HROWC2HNdqGL7jEa9JWAjmxdWFqdZmjPiIWdg1ouWSyMeeJJ8mC5jMAv8f/AbTgGV7IhzGujDo2nazRGsJSNJziJ7vBQxON6u/wTdkmoqF7ZrkIAQXSh3gf1VzVHdAFADWONw8pN4DlzzKGPEWDo6Bs2lwMV6Sd9b0RU3/k0XVORbu5ErBTdeI3MyY1wix0JZ6LsOqOUSuNjQL2v5xzfVEuHcMMouS2FDoeIzQH0D9mm9kuluTKOR3oAv0aCaNlztdpEH5Zz6KSG3sIhiNjcwVfGLIoK3TesijsRTVqLr5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ozacI6w9b+9oPYAP1o8WF1OBV3+9w+asASKPg0by3T8=;
 b=syd3a8Td6EZS5HLGdHUUanc4TmMiKahpIzH46NEecNeY4kij7Kkh7i1GUEe76P1W19eP4JlQWIww65P+vHxcdjKwPqdJ0go/kvGK+AiqnfF9DKYhHtv1R3MXewnRs6UoNH3LRJguYuK+xgvksfkPieMNvK4sa4FEIunTbaFFYe3JCAPM2YEQI/VtE/xprPCvcwyOGFqt0JHaEr49P33wYsaWwyavaY/JRPwyGGku8d/XHQRDvi50Xr01+30flrKFURYFOcUw3vBX9xJAKOfFR5N4Rfm8ZoPPscFWkqf9BL7qW8yERd2OMhMfrV5qWgitz5HxLiOmk5S2eb6txZuowg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from TYCP286CA0261.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:455::12)
 by SEYPR06MB5400.apcprd06.prod.outlook.com (2603:1096:101:8d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.9; Sat, 7 Nov 2026
 01:10:15 +0000
Received: from TY2PEPF0000AB87.apcprd03.prod.outlook.com
 (2603:1096:400:455:cafe::28) by TYCP286CA0261.outlook.office365.com
 (2603:1096:400:455::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.11 via Frontend Transport; Sat, 7
 Nov 2026 01:10:14 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 TY2PEPF0000AB87.mail.protection.outlook.com (10.167.253.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Sat, 7 Nov 2026 01:10:14 +0000
Received: from gary-System-Product-Name (unknown [172.16.64.55])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 1FBA24102E6B;
	Sat,  7 Nov 2026 09:10:13 +0800 (CST)
From: Gary Yang <gary.yang@cixtech.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Fugang Duan <fugang.duan@cixtech.com>
Cc: linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	cix-kernel-upstream@cixtech.com,
	gary.yang@cixtech.com
Subject: [PATCH 4/4] arm64: dts: cix: add RTS5453 PD controllers to Orion O6
Date: Sat,  7 Nov 2026 09:10:12 +0800
Message-ID: <20261107011012.3655873-5-gary.yang@cixtech.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261107011012.3655873-1-gary.yang@cixtech.com>
References: <20261107011012.3655873-1-gary.yang@cixtech.com>
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
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PEPF0000AB87:EE_|SEYPR06MB5400:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 482731da-ad29-4842-a3ef-08df3c6be101
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|82310400026|36860700016|261021121427099003|261102123227099003|56012099006|261009223027099003|261026140227099003|261022105027099003|261028144727099003|261026121527099003|18002099003|22082099003|261022075727099003|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info:
	fvzy5I6xbBOOqWjMFpuPR7JcxkYEZmXc5R3PoYmNwg6Q3zvqwy7AzG1m8JLviecHZoFPhboiOKV0fa2QBi8ZJbAk3HeJ80RyfbdjvBl6kpaIRBiSJPrxsgUMYTl3VH6w6cpSXnA/iGLMKDNp4V812ql9Ydgll2jERR5pxeKC5nqrfIUhG823mLoNEUTIF3j3+6hiL5pnL54sBSwEbPf8z4kCRk/tEyP/YHnNLolGx9PI0lGYhKkp3PIRczFa3h6lI1uX4LDLXUgXlrnpDbz7VvrtUVtXxfwP7YPpbQN50VZUDdojgxZeW4J02TzGZmjU1OyJB8vkQvHHxJkDiTzbO6CAWpz0b/7dUKD+vwLeEbYKHrF/5TN2q7CYEeAaclvWy8fu1XOrgYKSq/wpYC0WmMd5jLpbNXqAeToNiiYwFgwFxM6mo3160DUKQvqXEkDd5k6lm+4dVzyk8mPOk4vRMjoK4ixoTtZ3Dj7ncqEdk1HsDvcw2C8vlSQjYUJ2fOe4Rvaw+98JD/v2vEwB0g2FUBI4owUGWCoOpXEvJnjt54qdiVS2YX4khdIg9VWUydp1vC/qq1hd9devShVG+xhGH1TUUIeUmzXjLvvT4tFi5rvi3zcRVbHV2/z5DMYd0QSlokBpSe9RJSUqtoed2Surgx80V4WFZ2m3IzforJKUDWLGfQVYLKKuaq2gxXvHJh3B95mHD0EcNHmZ6gIKBflm1g==
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(82310400026)(36860700016)(261021121427099003)(261102123227099003)(56012099006)(261009223027099003)(261026140227099003)(261022105027099003)(261028144727099003)(261026121527099003)(18002099003)(22082099003)(261022075727099003)(6133799003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	s+wMPUc+g7Mhws9bUxKnEn1hUOxDZw/B/ha/sBfSQFpOWhomIkwXPDjDpj+rnjSaYtuAJhcKJo92FnWuObUMVPwTaL9MeQl/cwqWX0KEEbSY4wM6QuqhVJgPpv3+FOfzPL4yxCRtSpeuq0zJnjItBwOOHmL9La9TEqvX5MjKpIjVys2odsStfuzGsYv1pF0S0BnqeGJUwgYa0tt7ggBkLizt5vefZYT7rdUOvzolQni7SIMtbcaWHCOOBIVxTPkCy8y88jiuxNIL7ZnH5oYmb6dNRURvCHU+ATKtRPYV+aGZhreqm/WtLGzIdVqMhwrZ316kQKHcFjYNehawt3iPSeSIkdecCUVO1PKkutdIKAvwaAXzHmipq1rWIkpIQQ9dbM8rlDy8K6BPIpqEgS7e+iKSrQjuYxA6RPS+YgaGEb9r46uPHzVR5sQ9I8Xa2oTo
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2026 01:10:14.1988
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 482731da-ad29-4842-a3ef-08df3c6be101
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	TY2PEPF0000AB87.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB5400

Describe the two Realtek RTS5453H port controllers on the Orion O6
I2C1 bus and add the I2C1 pin configuration.

The controllers route orientation and DisplayPort mode changes
through the USB/DP combo PHY lane switches, but that PHY support is
not upstream yet, so the connector graph endpoints are left out for
now. The Type-C ports are still registered and reported, only the
lane switching is deferred until the PHY nodes are available.

Both controllers report through the same level-triggered interrupt
line, which the driver handles with a shared interrupt. The I2C bus
runs at 100 kHz because the RTS5453H I2C interface does not support
higher rates.

Signed-off-by: Gary Yang <gary.yang@cixtech.com>
---
 arch/arm64/boot/dts/cix/sky1-orion-o6.dts | 51 +++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/arch/arm64/boot/dts/cix/sky1-orion-o6.dts b/arch/arm64/boot/dts/cix/sky1-orion-o6.dts
index e39c87774c12..53c66ab30679 100644
--- a/arch/arm64/boot/dts/cix/sky1-orion-o6.dts
+++ b/arch/arm64/boot/dts/cix/sky1-orion-o6.dts
@@ -52,6 +52,48 @@ &fch_gpio3 {
 	status = "okay";
 };
 
+&i2c1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_fch_i2c1>;
+	clock-frequency = <100000>;
+
+	status = "okay";
+
+	typec@30 {
+		compatible = "realtek,rts5453h";
+		reg = <0x30>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		interrupt-parent = <&s5_gpio0>;
+		interrupts = <8 IRQ_TYPE_LEVEL_LOW>;
+
+		connector@0 {
+			compatible = "usb-c-connector";
+			reg = <0>;
+			data-role = "host";
+			power-role = "source";
+			try-power-role = "source";
+		};
+	};
+
+	typec@31 {
+		compatible = "realtek,rts5453h";
+		reg = <0x31>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		interrupt-parent = <&s5_gpio0>;
+		interrupts = <8 IRQ_TYPE_LEVEL_LOW>;
+
+		connector@2 {
+			compatible = "usb-c-connector";
+			reg = <2>;
+			data-role = "host";
+			power-role = "source";
+			try-power-role = "source";
+		};
+	};
+};
+
 &iomuxc {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_hog>;
@@ -66,6 +108,15 @@ pins {
 			drive-strength = <8>;
 		};
 	};
+
+	pinctrl_fch_i2c1: i2c1-cfg {
+		pins {
+			pinmux = <CIX_PAD_I2C1_CLK_FUNC_I2C1_CLK>,
+				<CIX_PAD_I2C1_SDA_FUNC_I2C1_SDA>;
+			bias-pull-up;
+			drive-strength = <12>;
+		};
+	};
 };
 
 &iomuxc_s5 {
-- 
2.50.1

