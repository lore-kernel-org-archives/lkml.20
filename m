Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.85.16
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793281337;
	b=fEICBDgmCr4Ox2bGvrUQIy0Lig+TXa7kduw0FoJTjjMJ+HMGBHCnhvODJUFbSWt29LqP
	 FkCP9UB4tVdHNwVSTKTEsZbVlRziTZ9lSOXwGbvgYzKsFsU+PWu4Uxs0DWPZnYB6DG0J3
	 kWe4DNahNDbZAz2ibv2QvV5wqrwhwVW4rei494XNVhayvox+x6BE1OvF9IszBEfMQ19Xa
	 HjXGnvCyr5CcH3zbPGB9Feedx5FxfiA5HhL938U/CjS9hZznplRn4IdURqpa+xKkRaKU8
	 5El9ZkM0JQoNyB391k4ggdA/TWOYZ+kUA8+dhi5jtbE6+xduvjSuVM3xN7ehX8kq66w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793281337;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-ID:References:In-Reply-To:To:CC:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
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
	bh=HtrsMB1RjM1MBDhb0CEcq1/Q0Z0cEZH0EfimO8/yelg=;
	b=Gs9USmLTAO8UcELB5Vb5m8vlbj8NB3tnkD1DFsodBZYqmjz6oDPYCWW+c3LGOQaovxUm
	 emaF2/FwBQG+CpUtpDfh41byVLM0F28m3jaCvqL/kiS5vRZs1xgw5rj3PYrSTcNQUp38/
	 NOcv8npQU11phz3rENdmRSS2qzGRaYqzerVfA8zIunAw1Xp0e5LNT+jyuEsxgjgw1Y1qt
	 mXIFEKjL/XS/6pkGNtZOSAnbN7GsXcqy7gytD0t0YpKovVRamaRa0BbNWSjjlLT3XTnIY
	 YA4fXZITGHBcGa7WmA3H5iz2mDPXjQXeFvKajwYx7eAvMnHrIzc48QXgQKT4PKDYrdQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=fail header.from=gmail.com;
	spf=pass smtp.mailfrom=amdcloud.onmicrosoft.com;
	dkim=pass header.d=amdcloud.onmicrosoft.com header.i=@amdcloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-amdcloud-onmicrosoft-com header.b=UL9zNsVl;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.85.16
Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010016.outbound.protection.outlook.com [52.101.85.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9E2C606A32A;
	Thu, 29 Oct 2026 13:42:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9E2C606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amdcloud.onmicrosoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=amdcloud.onmicrosoft.com header.i=@amdcloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-amdcloud-onmicrosoft-com header.b=UL9zNsVl
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lhi2EFOGTW1dpqOR00xc1imA+dE/JKFPbZYY6XQVBMeihY6jGIdeegZk0YfGEaJU5U2Et1G1kcO3MP7J6WZQS9bnuFILhmWKmvt5TGe0Y1czqf19Hl+AbVfm+eooc/hb75yJGKYNltwmWWS2utjRD/ZtNQVECTW7+smqxyO+iAeloKk/zrOZ2Id9R/yrMDAoZh0ZwQ9Et5/rMQNERpsPqj8Epb5uNoqh1M6MM8V34N47tnEKSr8jP9GWgq744OXHjayB6M10dNnozLQZbObBocr11RyXniI6bK+gXIFP36//q877QN8ZIleJ06AETVvuy6H/rFBOBkUiRYCT5vOmcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HtrsMB1RjM1MBDhb0CEcq1/Q0Z0cEZH0EfimO8/yelg=;
 b=jvl92/mZcRvFxjnZRO1X7NIPsUYx1w74bTosD6gn7pXLhm2AtPoNkK+zyEBKaG1T4ZE7hJhEgM/h56VvM2w1K8vmW/wAjqwLydAWTAPy9u75vQ7zAzYyryqyZzr4HYUN+9fP3wl3FY7ingL36XqHU7fRxh+XzIAn6IMpImXHhb8iqRg3Q5t4i/Ga3Rdv79VGJpyq1zu5wTpwQ9sCE6U6egM7ZSbtPvBEHe/Y9Xv44hDhBG8+EHvTetKDR48/D23o74sNhe8yy5aeEgWoB8Dui5CSpxtpIvllgDYAEZ8Ay9GoLPee1X6bvVfeUS0N3vEFFDZqRYvW9hsU1hQDb6NCXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 165.204.84.17) smtp.rcpttodomain=aspeedtech.com smtp.mailfrom=gmail.com;
 dmarc=fail (p=none sp=quarantine pct=100) action=none header.from=gmail.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HtrsMB1RjM1MBDhb0CEcq1/Q0Z0cEZH0EfimO8/yelg=;
 b=UL9zNsVlYFL43wEEWkuUEM5DT4S9BcflRIm3j+WLHyGs+JUr+T8wDbpR81ynKfjfG2D72kLNAShDt/K6VIG1REY2dEhbxTJTLQ5wGVg6d5WehnvEizTp1M3DKqh1f6wMgXJhL+i7d7StYQJPkqyIvC7TA6OMmP7jAZ4PmnmFmyeUsbIMVU76sFMvv3u7KCUoXqZHZYR5AGh8UjXX8wN6N3t/X1HrYLefhUelfy/vSL3r3+mtl70OtGsi7uw9GO2WISzjrn6r+zMwGq0z5RfYCu47F4rv6MQNOlB1nzlWnPqZ6d3g1fiFks+RWFofDozGQHhIsFCSFfLuKw6mObE9ZA==
Received: from PH7PR02CA0015.namprd02.prod.outlook.com (2603:10b6:510:33d::23)
 by CY5PR12MB6108.namprd12.prod.outlook.com (2603:10b6:930:27::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.21; Thu, 29 Oct
 2026 13:42:13 +0000
Received: from PH3PEPF00059619.namprd05.prod.outlook.com
 (2603:10b6:510:33d:cafe::ae) by PH7PR02CA0015.outlook.office365.com
 (2603:10b6:510:33d::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.22 via Frontend Transport; Thu,
 29 Oct 2026 13:42:13 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 165.204.84.17) smtp.mailfrom=gmail.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=gmail.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 gmail.com discourages use of 165.204.84.17 as permitted sender)
Received: from satlexmb07.amd.com (165.204.84.17) by
 PH3PEPF00059619.mail.protection.outlook.com (10.167.243.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Thu, 29 Oct 2026 13:42:12 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Thu, 29 Oct
 2026 08:41:53 -0500
Received: from [127.0.1.1] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Thu, 29 Oct 2026 08:41:50 -0500
From: Colin Huang <u8813345@gmail.com>
Date: Thu, 29 Oct 2026 21:38:40 +0800
Subject: [PATCH v10 11/16] ARM: dts: aspeed: anacapa: Add SPI flash VCC
 supply
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
Message-ID: <20261029-anacapa-devlop-phase-devicetree-v10-11-26ee3cf9d9d0@gmail.com>
References: <20261029-anacapa-devlop-phase-devicetree-v10-0-26ee3cf9d9d0@gmail.com>
In-Reply-To: <20261029-anacapa-devlop-phase-devicetree-v10-0-26ee3cf9d9d0@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, "Andrew
 Jeffery" <andrew@codeconstruct.com.au>, Ryan Chen <ryan_chen@aspeedtech.com>,
	Billy Tsai <billy_tsai@aspeedtech.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
	<colin.huang2@amd.com>, Colin Huang <u8813345@gmail.com>, Rex Fu
	<rex.fu.amd@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793281119; l=1484;
 i=u8813345@gmail.com; s=20260202; h=from:subject:message-id;
 bh=5PWO7D0zuBpdKoQ8bwidQqu/R+kIa6VCkTBo+x6SPOA=;
 b=fp5QncsJJX/ZkW22SPbEXyyMXB2w27xsr4nbPuP/YDPLIzEpQVtLLl0fwZGex91dUFCkalWxl
 DYzTo6f2xvRDFqn96tO4GqRnSb2mi6B/hK3XdsBywzvPuaJ9t86yKTt
X-Developer-Key: i=u8813345@gmail.com; a=ed25519;
 pk=Zlg0WqpCw4qbswOqamTBTXIchwR/3SnYZpy7rjaGMdQ=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH3PEPF00059619:EE_|CY5PR12MB6108:EE_
X-MS-Office365-Filtering-Correlation-Id: ca5d6669-ac48-4f83-f315-08df35c27011
X-MS-Exchange-SenderADCheck: 2
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|7093399015|48200799018|7416014|35950700016|82310400026|376014|261022075727099003|261021121427099003|261009223027099003|261022105027099003|261021123027099003|56012099006|10067099003|4128699003|261026140227099003|261028144727099003|6133799003|18002099003|22082099003|16102099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	dHljie09MiyGGAiIfCWJNxq0piF7i669WMJNC5aFkdszz15ds0uVt9Ji9yOFnwInGR2v1JW7+gFZSsUus0MDlfUJlGGtDBVBAEo5+9nHj9bCF+eXLKlkK49NINJSeJB7BbnfQlGknl6ENhTG6MpHb+bTnsAq08W2WvnuCO2p7MXbQ8JE93EU9RxvbuFVXOPmWcKhvOnUQC4+/Yw/2uIJ57jC2qOpcdw3Ydo6Sq8qfIfE91o8OqGsMNwE06sC5iMAcbzdFDGOH6Lde/UlKOFykWZ1/X2+oABt780d5JWwSZb8wzO4gXhvNn+SHElJQsZrglB/ej5/bVpjqpZFbPpfA+vUWEO6PavN7yMUw4FH+N9wST06JGPKwLkYWw74DMYBLvC35Hct/6Ri0SNFZAaK9f8F92dEesD517hH87J+VgfGtnzV2TFIa16XrEvCw/He5mWpDk0VfoG+8oaNwSV5IeNaUOVQ1PON89XJQOgNwSjxoHglhCr7Or+GkGde3dzeGlGP/6rSmzEvDZIH7nwoa4AWHQOHV3WcdN16AmpYJEMy/2abykEIAV45q0caRynY7JNvSjojKuc3bwwiT7wGG3BlO/xI6Q1vGIqi3Spdu+y2uEEYjh6v6XLXuNLBJoGD6arNPNeo/cpqex6gjSndJyi8S6sQGfsNHCvyduOweRPSbjYMzhDTbTYGFSg34OMF
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(7093399015)(48200799018)(7416014)(35950700016)(82310400026)(376014)(261022075727099003)(261021121427099003)(261009223027099003)(261022105027099003)(261021123027099003)(56012099006)(10067099003)(4128699003)(261026140227099003)(261028144727099003)(6133799003)(18002099003)(22082099003)(16102099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Nru3RRkxSLZWZepjz+cigQXLWKNL7FHqHJJEatw/tvp0vihtP/4M5P5d1gYAhX527UdUdU8yAR/ZhnOi0p3s3dDsgXjM4rVeexwYy+ai9PiQ1FOBcJKgLosmFr97xyn6HT3QU+RgE/nKSAXWheQ/Avn23txoWthJ5sCRctHf8Rj+aVyCnMlm6+I2xHe6zrwwIDkQUHhedQmppg99fHsTfuvXWOSgQwqpQKmLxKXkzfodago63nabikD8E6DP1bO7EuhBkUMnxmJb98op9C/iOXwgcIXgQJHDYGu2p/YZV12T3rxOf4O/5RL+gv7WnKV1ypEoJnFnctoQFI6bg4xo4S/JDySvYd5gt7amMi7o9K5SvgcfA5sWeX4Z1GJwFXRKcd4ZN8A4+V2W87+tsn9z79oUkWGsJ2GUe4mU8nbbg6ZBPv7P8Mc+gOkXUiWXyN2C
X-OriginatorOrg: amdcloud.onmicrosoft.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2026 13:42:12.8893
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ca5d6669-ac48-4f83-f315-08df35c27011
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	PH3PEPF00059619.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6108

From: Rex Fu <rex.fu.amd@gmail.com>

Specify the 3.3 V auxiliary rail as the SPI flash VCC supply to
avoid using the dummy regulator during device initialization.

Signed-off-by: Rex Fu <rex.fu.amd@gmail.com>
Signed-off-by: Colin Huang <u8813345@gmail.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt1.dtsi | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt1.dtsi b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt1.dtsi
index 5f9cfeec39cb..e429f7be46db 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt1.dtsi
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt1.dtsi
@@ -92,7 +92,7 @@ memory@80000000 {
 		device_type = "memory";
 	};
 
-	regulator-p3v3-bmc-aux {
+	p3v3_bmc_aux: regulator-p3v3-bmc-aux {
 		compatible = "regulator-fixed";
 		regulator-always-on;
 		regulator-max-microvolt = <3300000>;
@@ -170,6 +170,7 @@ &fmc {
 	flash@0 {
 		label = "bmc";
 		spi-max-frequency = <50000000>;
+		vcc-supply = <&p3v3_bmc_aux>;
 		m25p,fast-read;
 
 		status = "okay";
@@ -179,6 +180,7 @@ flash@0 {
 	flash@1 {
 		label = "alt-bmc";
 		spi-max-frequency = <50000000>;
+		vcc-supply = <&p3v3_bmc_aux>;
 		m25p,fast-read;
 
 		status = "okay";
@@ -1073,6 +1075,7 @@ flash@0 {
 		spi-max-frequency = <12000000>;
 		spi-rx-bus-width = <2>;
 		spi-tx-bus-width = <2>;
+		vcc-supply = <&p3v3_bmc_aux>;
 
 		status = "okay";
 	};

-- 
2.34.1

