Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011061.outbound.protection.outlook.com [40.107.130.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 295DD28030E;
	Wed, 30 Sep 2026 07:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790754625; cv=fail; b=aXQlnE/i3kklop7C7L3NhjypG57RWQpQtW3T+mpL8qXvOCvypjMDHr3LAi0iLSMUSVhZbUUG9OCxlrV6MB+/vBsOsdpBgsKBXofJxThOPDuT9kskcvZj0KFRdH1tB2diRjPPakO+QFggtiLvbc1Ur7HjXDZxnvN0F1vNZg6cRxA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790754625; c=relaxed/simple;
	bh=KLsHJoZSsz2L4ApokMhjKQyTSR07IEcIVI1Afic2g1c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=svoBtc70xAclNQ3Q11BruYk/ZwGPLnEag45QBFNS9LAs7LBX9GOzKgPqN7kj35SRfC2+kQljvBGyXeXtuWGQ/v2dpOSaM8SZv0Y4mwaRFnamky6MkToye/2GUyVkIVXfLvPniUFlLxIo5iLCacPHBkYNpSnkzzCBmIgw4KRC9Kw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=QCi8EXkW; arc=fail smtp.client-ip=40.107.130.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="QCi8EXkW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CvhojN2jNvXNI5KErf0yMjD6i+ZPI0OKn/KK14iVnij9i3fozZmwA8GarEb6tveotKf4JnZ6yPAC81gku8QNf4Lp0Z21yIPaIjAe7bZMXXxPy13zUNXoxsRFdUUHMI6f8xrgWKWml8sALQvQtcaPx01Z6/j5ttBO2EPF9VYYhCWtfJXpXqJUAGTGGZNFj7rGZJDvUKmDqOnboFW2eH9DWJM1T0kPw2qBY2QYopn255a4Xgnkrj65hv2HM8m8jzZYU+mX9GbA2FAWJGzEK966nxG1MlK6mA6FNzvbnBnlrYLPNaQR9gi2CqqnrrAXl63zrK6Z7ptoota+SBFNP4qJLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tp6aNA+99gIovrTYIbvbggc0NMQ1k2zHjaAq2GcyNHQ=;
 b=NJUJgLVoKzYwibujCMmSRwaHGgC/30+s6cPlR0JDYg7InfxbM2YlxICYM0n+7b5Cq1X7yI/7PRANhOwG3ihK9Sen73Mzpxk2Ki+hcNt7dtmx2yim+rH11LcdGwDL8YnHNVu1VtXclhCH+TcOfvJiJf38mkjIkZDFfu7P+Sz1bzA5s56dtCQwNSsY5d6dz5UbGVFxXBUyQ5zCGgS649K6tF+uMlRynJNh9CFtCzQq58PZZp4SteL4ASu3kQMgNS5yxgw7boYSmdXnHx+cCirsw03yqHOHu3P3wP5RXl7Z1KCEOQgUP3bx5Lm9JQogF8I21AeXV7GfN9iyJV/qlf7XQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tp6aNA+99gIovrTYIbvbggc0NMQ1k2zHjaAq2GcyNHQ=;
 b=QCi8EXkWBOhV0gyLvj47dV9GG7mZfyYk1+fnu/K58hhK1e1swgapg8GGABjgP8ULRwJZItSkc3mbEsVa8vTFS1Wus1fx5vjrvyXQLBIRVIkCbifeWwWMhU4GnUZH8ThiHzywS6259OQJW+duZ8+oUaYYsFaLpeBHLUYPbVc7Dj6gaYIbTaF3rXanIoKFjMhTUWbUmyW+iH95LxZFR83qYJBDl0okxbJJVzzzPEW8+bt9oxuzftu1raB5ANbI97aTx7GC9sD9s7cg5OwIoHi5DQKRhKiaU3iO+TLKbBFoywc950yv68pxw3WFoR9d/LTRuvpgBwZhaBlafr2tTBDF0g==
Received: from AS8P250CA0022.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:330::27)
 by GVUPR10MB9725.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:35a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Wed, 30 Sep
 2026 07:50:16 +0000
Received: from AM1PEPF000C1ADB.eurprd02.prod.outlook.com
 (2603:10a6:20b:330:cafe::91) by AS8P250CA0022.outlook.office365.com
 (2603:10a6:20b:330::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.14 via Frontend Transport; Wed,
 30 Sep 2026 07:50:16 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.59) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AM1PEPF000C1ADB.mail.protection.outlook.com (10.167.242.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Wed, 30 Sep 2026 07:50:16 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Wed, 30 Sep
 2026 09:56:48 +0200
Received: from localhost (10.48.87.93) by STKDAG1NODE1.st.com (10.75.128.132)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Wed, 30 Sep
 2026 09:50:15 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
Date: Wed, 30 Sep 2026 09:49:50 +0200
Subject: [PATCH v2 3/5] arm64: dts: st: add TAMP backup register in
 stm32mp211.dtsi
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <20260930-upstream_tamp_nvram_dts_part-v2-3-bd73158ce46b@foss.st.com>
References: <20260930-upstream_tamp_nvram_dts_part-v2-0-bd73158ce46b@foss.st.com>
In-Reply-To: <20260930-upstream_tamp_nvram_dts_part-v2-0-bd73158ce46b@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	=?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
X-Mailer: b4 0.16.0
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM1PEPF000C1ADB:EE_|GVUPR10MB9725:EE_
X-MS-Office365-Filtering-Correlation-Id: 8fc05c1a-55ba-497d-bcd0-08df1ec77791
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|82310400026|376014|36860700016|10067099003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	PkZ4F4DdemLl48fiLJf4cJgsiDHyJv83yy2kY624Ffp5BaU/RfcGgdK3Sbx88t1eY0cIEWBV8NELDGyI/M8wZP2qBximOtYic3dHNYfxznGN3DFxRem3qhSeWD2Yb+Hdacjvqa/sbLRDGdCQBXOuLSyGWQbIhvOLOdLMPPOO+fVO22ADEgAuBz4wFVk7Q5c26DdnKVSmBrDJcns3yBZQbqfdNHaPiKSFOvMLZdMs+Lf1Alu2ycbkz+4lrx28cYcYCDJi1FtSWOwd3WcxYgtvJgtr81eYqiVMdk8JKdda4kJ4Qg/zTuPGk8CY2IIhKriAEKPl8QtoV2XFcUvt1+vtxuVjgWSBudKWTk/0pESTyqDBvs0lL0UZIvslcDJD3RDbV6b5lCoDwp6WWr85DFtEBFGsZS0zAPJFTxp9dN8+qgMBQyj3hiHZBiylsF9XlmR6EyYAG+oFoOCfkWQb65R7Y4Y10AOEVt9cuBwLiRdj2Rl1RtUwIdWxOzu3+/DfRM3aSagSn66R5taRzbV9ZwwP100WnLbE2kqwIx+J07CklY/wzLCXuOxqEtZKXFkDu8pt9z6Rnw2gS4mRxQmqy4+3iqn3IqiPM3a+kVgOYhQHEe0kTDCRRoNRLeBo8Ew00MA5q7S/TcfD20h6/STG5Xv0tcKpaaJ2YS3od3q78ztS4whe7JdhR5fcOszk97IWHSw5p93C1rvjXOp3eVJ/5Xyb+A==
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(82310400026)(376014)(36860700016)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	iz808eJxeo1GtPss8+RUewoH0TIpbwMWD4ZMrFPiSjGiAqUnk7/bZLi2DkgWsqDyaBg+xjbRyHtGVDhNRB8IhPkCfLSHjrEHSsCe+HBqkw2W97k1HlVonye2qSmKyRohoNJURzoiQEoWeXNGiD5K71Iy1AGvUCvDE2pHPR5Ve7MmcKP5792RRm0svWL3akg3+bdLc+RAmfqj7zBgUHZyMy5xUZydcWAqGSR+MIYS65QrwlZiIYsCGD6nwy9oYoMjXNlZVy70kChwD21UnK5dtJCpqDWZL5KwcTkw3JZ6h4N87h7+lPHB0xk4VtZEDxqOWOnBeXoqlJ68ITkdwXZsRWtKAuDC9JeTuZ5QXHfe+VSsbcmZ/cdHKFgOLrkUaONVzBNlh/Jc++s7Zc/7A7Vy77nLvX/lwf3NYlUCZtBn2Z8y1xqxFH2usThpVTXLirBx
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 07:50:16.2317
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fc05c1a-55ba-497d-bcd0-08df1ec77791
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM1PEPF000C1ADB.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVUPR10MB9725

TAMP backup registers allow information sharing between different
software components/execution levels.
They are described individually as nvmem cells.

Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
 arch/arm64/boot/dts/st/stm32mp211.dtsi | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp211.dtsi b/arch/arm64/boot/dts/st/stm32mp211.dtsi
index 4bfd58b26b51..f9fe99dc90a3 100644
--- a/arch/arm64/boot/dts/st/stm32mp211.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp211.dtsi
@@ -133,6 +133,37 @@ syscfg: syscon@44230000 {
 			reg = <0x44230000 0x0 0x10000>;
 		};
 
+		tamp: tamp@46010000 {
+			compatible = "st,stm32-tamp", "syscon", "simple-mfd";
+			#address-cells = <1>;
+			#size-cells = <2>;
+			reg = <0x46010000 0x0 0x400>;
+			ranges;
+
+			nvram: nvram@46010100 {
+				compatible = "st,stm32mp25-tamp-nvram";
+				reg = <0x46010100 0x0 0x200>;
+
+				nvmem-layout {
+					compatible = "fixed-layout";
+					#address-cells = <1>;
+					#size-cells = <1>;
+
+					boot_mode: tamp-bkp@180 {
+						reg = <0x180 0x4>;
+					};
+
+					rsc_tbl_addr: tamp-bkp@184 {
+						reg = <0x184 0x4>;
+					};
+
+					rsc_tbl_size: tamp-bkp@188 {
+						reg = <0x188 0x4>;
+					};
+				};
+			};
+		};
+
 		intc: interrupt-controller@4ac10000 {
 			compatible = "arm,gic-400";
 			reg = <0x4ac10000 0x0 0x1000>,

-- 
2.43.0

