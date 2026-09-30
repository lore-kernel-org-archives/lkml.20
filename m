Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010053.outbound.protection.outlook.com [52.101.84.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0962D4477FF;
	Wed, 30 Sep 2026 07:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790754623; cv=fail; b=Hd/Hr3BLUSw40RIjMfYz6dTweMf+85ErBxjtJBjyZmvKV8RMrcMSK8dBnk7pF/zZpWLXBWLqjbEWj/n4AA8glqC+c1QE66OXNTjSDJDj0j29zaiswL/gWm7X5Or/iR9VvW77ShxLIAERcA1myN6q51aNURBlgUpgLu4PwLNDJ+o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790754623; c=relaxed/simple;
	bh=C7j8Ef93HoeS4ELgctk42esiuDYEkqRjMghRdUlNeVc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=lcLX4rTotEtw4y+noVkhbvWTDfPXEWpY/nZPwQL0CkgwtCdIt5Z0Z6i5/k+2NV+QYvjYHycLuZZcYuOdY+gutsEuxPOQvCXFVq+5gwjsyWIiNeIAPDCndoyQ65AZfiyq8c/pv/C1vZYP6F4f4C5PKCIfOEgVsO+kWmqrsKSv83M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=jnsUN1WX; arc=fail smtp.client-ip=52.101.84.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="jnsUN1WX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LQwtDpnfMGs2a/bAltHr57dD52SwN6+MeOGh2jxKwJcSnhdpTt1dH2tHOrME6LwM7MUZrzUY6uq2Fkz9+NOWxHEQNz5wHysET4WBgKorxFVS6HG0d4bIXee3jKfZUDaM1b6J231i3hGTChPdzOCuGi+AA7sMJzlK9JcO0EGGqzN4MJ1Lih/7iy48ADkFE2PIYMb2alieG4xecsX4GkiLoiGHHK/6GkNPuTuIWMbFioxigRUEVP2AEXCSbxVwmQWeSVg/TJxCrvrWEhFNqmYDYIYi4OVrUGtRuFxi3GHmjh1HBsaZri4DaxZP/awV1SzHR4E4wUlAiid3Ol3CxO9nRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bkECvjPYOX3wPrKx9OcExkvbVe1e1qMXOX5r+nCzWnw=;
 b=Iz9wf6KGQadcG1QOStdXjb1848kK+khO/eqOvQH1RMPQEO/bfrdjyr1etUStU/st1vxE3dtR018t/NS4MHQgfOzHS+Im4jHrYiVnIc7Af1WV5wmBijp1Kzd/t6aWlDHTr6WsLmYf3i0yfrRX1gRTGK+bpoeHbx+EaYbZaRAiVp5jPhcX3wmn/iqDv6JjkTiNn8Q9imSb1VzPdGZGJ4xJdyo1TUSz4oNP9TzKGvtbpVNI75UmhiYYv0oTtx1KbQEd1ygjFQ8NPG+anCy1KN/J1ilRP8HPJAiz3GecKRlneKJEx7iL4oC6WmKgbM+2Kyl0xdbUvkJKnnkGU7jr8naA8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bkECvjPYOX3wPrKx9OcExkvbVe1e1qMXOX5r+nCzWnw=;
 b=jnsUN1WXIoYLjsBGZY5bZl+ClSL8/ErWw3C7hnIWWKvnRpnM2R3f1qy0Xqnnd/YzGWqh4Gdq5dfcexvBGHurS83JB8sV6oOTYq5p4aPLuiT61q0QLj4BxB0zOJOuh72Hm/MY9H0jnzpgtmk1RZv7SEsL6PKO0ojMx1IrtuAIbQK2FCa+MiiCqZ7O7w0uun5RpIZoSev9KB3UzNu3R31hGtYUdkMLh/NCridlFPU/42v/TKwzxa40nZr7AB1P9g7X3E/QS4JmDrZ1gFQiycapd34gFQ962+FKuGIZg+69uV5/ikth0TwSglNDU53mxRkB6RV6z0mAdvLwMmvHocBfww==
Received: from AS9PR06CA0691.eurprd06.prod.outlook.com (2603:10a6:20b:49f::8)
 by AM7PR10MB3975.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:137::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Wed, 30 Sep
 2026 07:50:14 +0000
Received: from AM1PEPF000C1AD7.eurprd02.prod.outlook.com
 (2603:10a6:20b:49f:cafe::4a) by AS9PR06CA0691.outlook.office365.com
 (2603:10a6:20b:49f::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.15 via Frontend Transport; Wed,
 30 Sep 2026 07:50:14 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.59) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AM1PEPF000C1AD7.mail.protection.outlook.com (10.167.242.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Wed, 30 Sep 2026 07:50:14 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Wed, 30 Sep
 2026 09:56:46 +0200
Received: from localhost (10.48.87.93) by STKDAG1NODE1.st.com (10.75.128.132)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Wed, 30 Sep
 2026 09:50:13 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
Date: Wed, 30 Sep 2026 09:49:48 +0200
Subject: [PATCH v2 1/5] ARM: dts: stm32: add TAMP backup register in
 stm32mp131.dtsi
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260930-upstream_tamp_nvram_dts_part-v2-1-bd73158ce46b@foss.st.com>
References: <20260930-upstream_tamp_nvram_dts_part-v2-0-bd73158ce46b@foss.st.com>
In-Reply-To: <20260930-upstream_tamp_nvram_dts_part-v2-0-bd73158ce46b@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Patrice Chotard <patrice.chotard@foss.st.com>, Simeon Marijon
	<simeon.marijon@foss.st.com>
X-Mailer: b4 0.16.0
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM1PEPF000C1AD7:EE_|AM7PR10MB3975:EE_
X-MS-Office365-Filtering-Correlation-Id: f267727b-fd73-4905-847e-08df1ec7768b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|82310400026|36860700016|18002099003|22082099003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	PlYz6ajMmVcpuz10aGObqqGnpX6myNyUvZ7dy8CeWhP6Kgtim83FzKksRfz8Bmk4nYmXtNujLbZuGZY1HsvEMcrtU8+kljhMYCCsEtPVlZBKUceggQ/8z2ZAiSlc5CjLdJO1eq6yQZgp37iRQNg00WQ8Yd9IHwhY9YfT57rOP5ty4JNpfDRx93PlXi0ncJZHmmy4piMzguhy4pqFBEObKVGW3knVB2cXBLo8RSFj+0+v7wnBVE29En5IWIZaw8oVtNfK+UVOFlt86RrRyhBGVKe0CgiLQkW9z6DdUCsbY3Ci2dzaD3Sj5jdOZs+ODLZszhUQMfIcrgP4ejqwiHj63ha3YmLIfdw/ZFYAdO+Llu3ZVjl14WpxHVAXwCqs8lgn8YSJJ9iwDfcXXD3nr2AM/UmcXTMfTpiEOFDL9XH26vcjmt87yKdiJz6Rh7zJt9alyt8EKDgL5ma0OsUTQJTe8IdLLDKPRwHGyFUdl0EEu0K+nHlSr/qTXih4cg2fwDQLZp/GpU7ZjN+cTTxPQEyrv+3E8/pQvUea2I6aBMOQPvancz9zhmqe1e0g+6tvZFil6y6u1UCbvOSzQ3Dbop4IF/P/woMZ+bttZtzAjGyL2rz43gpN+k3zUgiqvi4vVhzXmWyQWAElhNmX/30J4A+P6PW+RGh/gPBvXsqJf3L88bosATQ5hQR2sLwRjJ0k7L7xR840gBpjoLxKFg6OgHNAig==
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(82310400026)(36860700016)(18002099003)(22082099003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	7pNP1/dNB47bz2QcCyH2VAEQAGuABP189Frd5aN9aPR/9/zFWesmEoBH7kqWoh0zM7Gc7sgUjRme0x7TClNeeEmOBHkxHx5bZKgLT3ZFl8vYTpCu9bAXZy1MCcKlKO1DeI2fmobY5vNe/+Xt0ou6khWwTt4c2Nack4/qGKHYdtpGuiJJ34O290LOy1AUo4gU1kuzcUnPv6Px76OR/eIZVBcO8pdPyJXMMZs0a+vQoZbY0wcpWufMl1Az78tdArbn2nxX0ntQ7fFW5gYaOdlJrJw+ua8OjjSt6vPk8rGuB2pM0GzlY4U0U73ln5ZTR2yhTOUsbQsV0vwF0VL+Xt8xqVnkM4kJbFRl6WQ83ypTCXCPKvWS4iadNraOg4NdvpNCrl4FVMMhyBZSf7el/7UIWEtZkME1lwsqSq2RUBn2u3D62KednkcLy21LWMNFVWJd
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 07:50:14.5247
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f267727b-fd73-4905-847e-08df1ec7768b
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM1PEPF000C1AD7.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR10MB3975

From: Simeon Marijon <simeon.marijon@foss.st.com>

TAMP backup registers allow information sharing between different
software components/execution levels.
They are described individually as nvmem cells.

Signed-off-by: Simeon Marijon <simeon.marijon@foss.st.com>
Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
 arch/arm/boot/dts/st/stm32mp131.dtsi | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32mp131.dtsi b/arch/arm/boot/dts/st/stm32mp131.dtsi
index 83ae59b73dd0..b37c22b1379c 100644
--- a/arch/arm/boot/dts/st/stm32mp131.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp131.dtsi
@@ -1918,5 +1918,39 @@ gpioi: gpio@5000a000 {
 				gpio-ranges = <&pinctrl 0 128 8>;
 			};
 		};
+
+		tamp: tamp@5c00a000 {
+			compatible = "st,stm32-tamp", "syscon", "simple-mfd";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			reg = <0x5c00a000 0x400>;
+			ranges;
+
+			nvram: nvram@5c00a100 {
+				compatible = "st,stm32mp15-tamp-nvram";
+				reg = <0x5c00a100 0x80>;
+
+				nvmem-layout {
+					compatible = "fixed-layout";
+					#address-cells = <1>;
+					#size-cells = <1>;
+
+					saes_secret_key: tamp-bkp@0 {
+						/* see saes secret key feature */
+						reg = <0x0 0x20>;
+					};
+
+					boot_mode: tamp-bkp@78 {
+						/* see boot mode selection feature */
+						reg = <0x78 0x4>;
+					};
+
+					boot_counter: tamp-bkp@7c {
+						/* see boot counter feature */
+						reg = <0x7c 0x4>;
+					};
+				};
+			};
+		};
 	};
 };

-- 
2.43.0

