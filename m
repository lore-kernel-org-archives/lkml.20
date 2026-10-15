Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazhn15010010.outbound.protection.outlook.com [52.102.161.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E25BA2FD1DA;
	Thu, 15 Oct 2026 15:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.102.161.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792079339; cv=fail; b=lcPGj7WfrvVpSlVH4spY+bvXQN6wIS4niK3GSAzssuN0XrZI8gdMF44MLarH8gd+0oriZuAhYpFVGetuOrVU6vjfu+DjF+p4Ois7EjGkDP50uzWme4UuvsN9pbVQJ5zGPV1A/1MeRGpGawD+uM0duwhzcRh9i5u8d+XikakSawQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792079339; c=relaxed/simple;
	bh=aAnX3tUXzg8c3JepJETxBz1iVT4R8k38TBpT7hX+0wo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=vB35QO8cApTqh3SgwHsg8UnSRo0aQINM6o2XFjqGamscAoTONIJ/hc3NJIF644UrXn5MMZQk47ksGASKiuFwwxVB2Fj87eMjRqc6yXrO+kOqNnvBv0Oq//5O7gk74ATCqR/thn9a2FwRSO+FSKy2d+Q9uSgD6MvWyOmP18Gn6p4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=fCCLYug1; arc=fail smtp.client-ip=52.102.161.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="fCCLYug1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=feDaLNGb9gqH29VKhHDBIETHee/AjwfzW4V0JKGqQ/aVudoaM+ffKtppv85K0uRUcx+Iv5WCaN8ADp7sSspkJlZPJjIszR8h+c8RVjDYnmWEurhwQFVJaIlEQh8RCR/sFo3ODbIOBwhrbDgAUhHb8tBVQplGYAHQPX3cpcOqi55r0U+3LpuWsrcDhsWasgrGhIgSZyrnKXq04i/upmnhyI/YLTA3We/S+EiaHdq02zF+LUepVSghsrFbKgNxnz/w5Nc/lPoUiE+FcGUr7A+ANvhr+fUsGffLPSF0CYZpHlhb1KB8N7nsV0GO0/19nxVtuDr4DNv2cnGICD4DgEtSOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EqmENMXcI7b5pSO+dFn25AJQGZxByo/WbHDT2v2TllA=;
 b=shTzC5hlHHyvO7N0KaYkRUFNpO9B8VbOMfuXJH5RFYQ0XuGuhJT1O2+Lu2x2qp6VU6GWtGuI8IYUHYfwxihOlN6u9FgA/APKNQjoo+mmOBHJCvMu0FtK7b6apDS9Yhu4eKWpUi+u9qpR3wWKssBu9WXBYowyLOU2cW7gpH0ybZELxSVz31N//cCw3t/SQpZz1Zjd5/QGw/5TF5cWcXYXipatU+ja+KPknmM/mo9CF+7RmWTykLFYgtaylEdTh3g0cpEXq4sqUU5jBhEQKMkXBM3tZ4dyopNGwMoHNU/uRcdhdrijpLZfPYK6EWxYBV/JubejLCUn6Noh5duTqs2e8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EqmENMXcI7b5pSO+dFn25AJQGZxByo/WbHDT2v2TllA=;
 b=fCCLYug1lH9M3V/ciEeWUppOE0TV+uMW4rMxQQlTYFEMqPreRGH5Sa0PEQBbx3c9xFtXhq9OD/gVsspVIZx17DMBjG7RqGU9uLwk5C67o997i4VqIjtaJs2dPY6dP5Vz8vFouy+uCRfLP6TEB/4llbXoGRfczHVFmidXWIRV26GG5ShcGutJxJxEmp4W36iXrK7bzjmqhmIFRaq+55/VGi+TLB0XIFtkzsdlLi29TXLi5LMR6YIpiO0XvZfk3aufrdT4346giqnsNl0zV6BDYLtRa/IEVFSxI4f2Z/l94tkH0QqzIVDsy+9xtYSFq/GTHEA6Dma6tUXHPAHlMOFmqw==
Received: from VIVP296CA0115.AUTP296.PROD.OUTLOOK.COM (2603:10a6:800:358::9)
 by DB8PR10MB3768.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:148::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.14; Thu, 15 Oct
 2026 15:48:32 +0000
Received: from MI3PEPF0000847E.eurprd02.prod.outlook.com
 (2603:10a6:800:358:cafe::86) by VIVP296CA0115.outlook.office365.com
 (2603:10a6:800:358::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.4 via Frontend Transport; Thu, 15
 Oct 2026 15:48:31 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.59) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 MI3PEPF0000847E.mail.protection.outlook.com (10.167.240.165) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Thu, 15 Oct 2026 15:48:31 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 15 Oct
 2026 17:48:45 +0200
Received: from localhost (10.48.86.45) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 15 Oct
 2026 17:48:29 +0200
From: Antonio Borneo <antonio.borneo@foss.st.com>
To: Rob Herring <robh@kernel.org>, Russell King <linux@armlinux.org.uk>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
	<alexandre.torgue@foss.st.com>, <devicetree@vger.kernel.org>,
	<linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: Antonio Borneo <antonio.borneo@foss.st.com>, Amelie Delaunay
	<amelie.delaunay@foss.st.com>
Subject: [PATCH v2 RESEND 2/3] ARM: dts: stm32: enable ARM SMC watchdog on ST STM32MP15 boards
Date: Thu, 15 Oct 2026 17:48:25 +0200
Message-ID: <20261015154826.1947492-3-antonio.borneo@foss.st.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261015154826.1947492-1-antonio.borneo@foss.st.com>
References: <20261015154826.1947492-1-antonio.borneo@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PEPF0000847E:EE_|DB8PR10MB3768:EE_
X-MS-Office365-Filtering-Correlation-Id: d45770ff-da52-408c-4403-08df2ad3c3a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|34020700016|82310400026|23010399003|376014|36860700016|1800799024|22082099003|18002099003|10067099003|11063799006|261009223027099003|921020|56012099006|12100799066;
X-Microsoft-Antispam-Message-Info:
	5zVCKgikxaaUbOTHLMva1PX/AlM767i/XNaAeG8+HXzddqFhqOZN1XB2ukoJmd+SxPDOWwBlvtpUm5nc8PBbuWLqqG+PrJPh5RDj+4DvaKllkx9suB/ysdTMLUOOhUtaXZytrWv0HaELH46MyHamv3H7n8gIL/ByxMTSB/jUUTfQ4L7tLSfx1e5QDDfWVRPUlb/q1NNMAqGBiKVArErv6CBNHplXr/4R1Vv3Ye45iXvWGevjrHKWzc6PqKvDqSId7nyi/HIzTj7qUILRDjiyHRAa1RdIQ2kbtProuFAPIIdHpMXCOpqHuVXuPr2OMk4ybr6EIlOCzw8g/dalndgcL37TAPLT6w9Aab7r/TYQX9QU7pY5U1k85CzYZUxrnZcUM7iOELJnk6OiqGZO/RYXSEF0FhjJo5H8/kmJVPXmvmzi4t2CJLY8sOOwppXDnHQzOP/U3/GwXzC+DhTZqyAcIsut6UqmiDWwbT7uxmi0bs2OYOGNX0gL7gOYb+hriI8WI+N5LjP17Gj9Y9cMWHipUmGvvT50CjbHG16z3zeeWLYLfrsHlFRoji7NvXQME6MW/Gsb5HfsDU3QJ+LbyZJeEMNvlX0H+oEfcF4UdkgPON9yOuaO04ngYAX12Cuou1/mhQjiSoM/yYi+3MSBfNE4m/EfBowaUQZ5CTNou/A3ju+GEXMGsfXCGob7YgmOF+u1lRQZbRlQ7E6KwRNukMJZkNZ1PjST+ai/bvB63YTRXipGs2yMHDOtcFOLqMLroSAE
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(34020700016)(82310400026)(23010399003)(376014)(36860700016)(1800799024)(22082099003)(18002099003)(10067099003)(11063799006)(261009223027099003)(921020)(56012099006)(12100799066);DIR:OUT;SFP:1501;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	b0VOGxdxVn37CUOznT1MEW9Rgielms6bcV6c5eYh9G5lS6zX5BE7EN9BQJ2lEkJcfoWfV87MGGXStq7WfayGjdT1ohNt8GiicsneGeOWHKE4hZaDZb3QYjVfhPwYwtV5bRg5gQWHkjLHOWXaFyNEq29IfF05jNrLyjgqhRxZ/oad0Z+aUr2uaY6FH+KPIJ512uws0sWWJ+yuSHeTNGwpSZwTgPbV9aTA7KM2b+xUJAybz8w7v2grgtQZILGr4L7c5awzP+MCS7rYdtc1CLjEAVuuqLzvGXd58rEd1Zh7AGzR4+GbPCxOd6TBeFHtJa/b9KWKBLi2O/NovvSZIDlSPKOEjwXYEX3slo28I0zyX925OEgQpGmm/CiBR/3tT2/T1hN4uc5/0G511KGj2lfDeWALns8wKFbP/KjJ9fEjfnzdZX+aYYLy2dChwgHw447p
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2026 15:48:31.8570
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d45770ff-da52-408c-4403-08df2ad3c3a8
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MI3PEPF0000847E.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR10MB3768

From: Amelie Delaunay <amelie.delaunay@foss.st.com>

On STM32MP15 boards from STMicroelectronics, the IWDG1 is secured
and monitored through OP-TEE.
Enable the arm,smc-wdt node on ST boards so Linux can control the
secure watchdog through SMC calls.

Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
---
 arch/arm/boot/dts/st/stm32mp157c-ed1.dts  | 5 +++++
 arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi | 5 +++++
 2 files changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32mp157c-ed1.dts b/arch/arm/boot/dts/st/stm32mp157c-ed1.dts
index 49dd555cc228c..05b7c664a4b15 100644
--- a/arch/arm/boot/dts/st/stm32mp157c-ed1.dts
+++ b/arch/arm/boot/dts/st/stm32mp157c-ed1.dts
@@ -145,6 +145,11 @@ channel@6 {
 	};
 };
 
+&arm_wdt {
+	timeout-sec = <32>;
+	status = "okay";
+};
+
 &crc1 {
 	status = "okay";
 };
diff --git a/arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi b/arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi
index 1a07ae09afb2a..ca888400b5a41 100644
--- a/arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi
@@ -144,6 +144,11 @@ channel@19 {
 	};
 };
 
+&arm_wdt {
+	timeout-sec = <32>;
+	status = "okay";
+};
+
 &cec {
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&cec_pins_b>;
-- 
2.34.1

