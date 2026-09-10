Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011067.outbound.protection.outlook.com [40.107.130.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 833EB4A207F;
	Thu, 10 Sep 2026 15:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789053279; cv=fail; b=d7KUCBO+AqIUkA+73q6KyVrApsvldVwf3VZpNXgzpHkH/pWxm3dtUMx6alBPRY1ON6Eabgv9+N+BhWRsR8NAnoq9lmuv7tv7i8UEF8eGK2oSyqomCDKA5qpG+7lCkSaTcAnuhjBi9+aI87RTsfZgJ39z8nRFsXGRp2mrmtXE+ao=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789053279; c=relaxed/simple;
	bh=C7j8Ef93HoeS4ELgctk42esiuDYEkqRjMghRdUlNeVc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=g/Rw4LVNB6Qr7ZJFVPRMIRaCVPRoyDi8I2Y1ZvkFWanKFn1ccj+Skv2urvkKofQwUVgeYUeAr+/EAMdaczJgPkwcFjJnrr1AYd3bBRCwFScMdAYJWUv8DeZ3X8H/VWtnUY9rLwgij4pTvcu7rWi0qGazDWJKXap2OZGHTy5096Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=N1klzqkA; arc=fail smtp.client-ip=40.107.130.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="N1klzqkA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=de/R6vtyhjEz/6+rXGlH3BtxqfYq4mGcV2ODFF79aI/jxwdmboWgEmnhFU7PPeTllFk3e2c0XXCXQF57KvElS4pJeBmvusLHvUAkc9hoKww17/vsUiPTvPIhXj/kKfwNseWlw+Zon/vEOIcN5peDskio5uqjTmd1cc68VaodY2d62paxC2W4MeRDIVwxAPZzVPTmP617VuQu9skYjzZyj1p2eGdY0ncFWHGujZmRYDhZHw5kiVC56laf5VieGUKUTqHlyjAsu8xvLjeoGC6KuM2vDlRbKGa7oaIZmjK87ET34EK3En7uxLZXSVpM15Msiteywt3arSecdnflCzcsVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bkECvjPYOX3wPrKx9OcExkvbVe1e1qMXOX5r+nCzWnw=;
 b=v6De9sTEFd+TjYcDa3L7ZsEEsWX7a4PTCjbrmceab1i6MTKyjNw00MiTTKWdLhKLuXTPMkS7kTHAwBJ6l4BMGbin8ymBiqZbIj245DMLuAAxv5JAnxdzqyVUYAF1ivf9RvwsGfsD71mN/TsEcqp92hI68rVX+ZUuUp3L70J5OlYlR4dCAjCWTSC3OfjyLZnSNxlU9qYSGAqehbVO7hzXHGXoCn8twldDEdyXz2Bi87IShNhtvYxECCRIwURPzXpPAPNuUXUDf3pNERyQVklfF5GiOnp0CIYnUiG5CEMBnKmuBWt7IcakfBaJXVu0fLG0C6DPjUV+iQynmmAPcL6RLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bkECvjPYOX3wPrKx9OcExkvbVe1e1qMXOX5r+nCzWnw=;
 b=N1klzqkA63K3Clc+MvhEmxe7Am2FhZxc9mBDtON3/3u/eRU3KCh2QEaFUHf4NV1iqnQdQFL4QrAhKJzqGmZ88FFj/x43w3P46/1eaASsfMLw6mGWCklkZ5KG0kiOtAyKrNPnHXm5s/fnn6MzYYrCF6AuinEmkUmrHGwVm6BYyeFW+WFh8ddLounUc3zd49m2ln+I//uJqj85UwZ1kpb3Lr30tz2JJK2j2p7DRthIptrfPfyI9a3OMksz87SCefOORP2OlEgm2l8tTXEp8f8Mo5oYN3i9TZhQr4GaSQS+Gtvud96AReyulRfwHKHeWqoeHbQjMrbkSs5aAdN086lJLQ==
Received: from DU6P191CA0030.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:53f::9) by
 AS2PR10MB7658.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:641::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Thu, 10 Sep
 2026 15:14:28 +0000
Received: from DB1PEPF000509E4.eurprd03.prod.outlook.com
 (2603:10a6:10:53f:cafe::4d) by DU6P191CA0030.outlook.office365.com
 (2603:10a6:10:53f::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.9 via Frontend Transport; Thu, 10
 Sep 2026 15:14:28 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DB1PEPF000509E4.mail.protection.outlook.com (10.167.242.54) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Thu, 10 Sep 2026 15:14:28 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Thu, 10 Sep
 2026 17:19:55 +0200
Received: from localhost (10.48.87.93) by STKDAG1NODE1.st.com (10.75.128.132)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Thu, 10 Sep
 2026 17:14:27 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
Date: Thu, 10 Sep 2026 17:14:24 +0200
Subject: [PATCH 1/5] ARM: dts: stm32: add TAMP backup register in
 stm32mp131.dtsi
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260910-upstream_tamp_nvram_dts_part-v1-1-e2bca58a65f4@foss.st.com>
References: <20260910-upstream_tamp_nvram_dts_part-v1-0-e2bca58a65f4@foss.st.com>
In-Reply-To: <20260910-upstream_tamp_nvram_dts_part-v1-0-e2bca58a65f4@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: DB1PEPF000509E4:EE_|AS2PR10MB7658:EE_
X-MS-Office365-Filtering-Correlation-Id: e70a6881-b4df-40a5-f473-08df0f4e350a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|1800799024|23010399003|376014|10067099003|22082099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	NYzLKRSuV+Jcq9U9o+4yz6yQ35BHulnKLT5hO3z2CQv+n5T5gDw/D29g1yS7Q6fihXG7Ty7koQl3S1BjxGaFGd0/CVrmNAXPerWCxHcDUmd8CZoaaQRhv4xiBFfXMohsNx8yMPwIS+cbAfhLmw8ZxLqebTqKd6VHTUeLZk8RmX9wTiJzAbkQUCUwt0dIfkoKVOQFrkKU6BJBtGLTZDmcn/t7diWyDBe0nyznw3DYdARSRR+amFxKslfTqGiKc+hTVyCkrXvQakiVxwCC8H4JVlXFAUzUOdKlzjfINcY8g+My+mgsr5EG2dbnTjzNYo2tv2pIbno1ijw8EDAUds0u4q6BAay9xNEa3wu3jyiGP238ezFHINwUOOudD9+fqUxmrTTSXcqAFwk01HkiP8o9SVjZTWg9om1BlHh7n2mTiRr7x95Jw6Vym0wwwojKCmuzs/t0gXsqRzIKnoWlkGxH32dSiBbWl6AW2okR+ULnW1KIAm52jY0D4oIhBEq9eOKXzAUr+AlB2L04nJwvPiTmP0ss497oH+MhNGxjQmgGlTrUaAK99JCDKpWd/Vyc3K2nT2JStmTIRvJ+VcRUGe8boh+Gtlc162vgRtSZNHxDW/KQZd+z92+707qOCJ/zZudo1ysDeZIfXu7Zp/RNB/pAbbnJiqKMSTofHfRrvKEGfhMefQY3ljjR53m6d8rh5shWt2cjNBkoQy+IRmfkDa8mmQ==
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(1800799024)(23010399003)(376014)(10067099003)(22082099003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	v6Wp4h99NJd7IpkqcDozvtVcP2D4FvDht1sDC4FowVrlyDFjUWxxyWqd7F8+hpsyc49nBHjPrLcCg7LV6VjW8/yHsLLIKkiTqtRqRzYZNEdQRr1Nly8Q/zORjl9SyiJHVpl+wDmAPuUwXKYYnYaSTnWRP+Yszj5gNZyYnl/jUmlnCalm/ZKnKCcgVo0Ry7ihKDAJVVa0oRCLsRixLVWil29nDnBl3zhXyBXcQ4wd8ZJ0c77XbpC7EI4a3JRd3CIT/Qc6GwzKruumJqa/QUgkhq1Ai4fujNwEwK6hDoG15ZzJSY0JfYuEfND2BAK2Ld2TkaNTahaQDj59PN0cAghIB2xNt7fv8Xce5VIKmChN3kTJ1fZyFxSLFTmkKnqxaJbW1z/MRrORPVA2Nbvv6MSKuVby2wHUuk/URlmqKl6ttlVCY4jP6GL9fmNmD4Po4JKU
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 15:14:28.0461
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e70a6881-b4df-40a5-f473-08df0f4e350a
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509E4.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR10MB7658

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

