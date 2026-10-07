Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013041.outbound.protection.outlook.com [40.107.162.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 464E53B5DEE;
	Wed,  7 Oct 2026 15:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791386150; cv=fail; b=QhfVF9GKcedlZtFDbTvAzFb6ZdJzFIus1OF7HGD5/8U/QDOff8gxZ4ub5nNvVML8kgIIbg1b8D1EqkGP8ygv0u4sZIR0wNO1mhsGs0HnyrKtwVvJOLvs7GOIopgwUI9jD6f9+0RlUko4Z6wn0huTBZpLby7V2zrjuPgt4QovGxA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791386150; c=relaxed/simple;
	bh=gPLjOnmbQHsplRYGrfriD5D94GOB4pvQeyf9MkuPjtQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Vuu808tmIn87XKS4+t9IFhSeeOd9d+7cE1Bz0nqvfKowfFk6GdKE1PWeR9TtD/eGVMReph6iTGfEI7anZk7YhntSYERpIzDAvyoIBEaEhxK5DHppydI5GVe3KptLOrcFfMt8ETlNrCU1XJlpGV4cIKKDw+E6/UK5aKuklmhrXBM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=cVcGhl6F; arc=fail smtp.client-ip=40.107.162.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="cVcGhl6F"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PDTNbzHFn1jRPTu79zUIPXrjqvGSvLa0gSZG3erYPdJNg1q1AtlSk2LTAzbPHIQjDaB5XxZFEWbSI7InaAI7kCDEwOsEzDVx7aO3uHiRqONiKXn3cwxqMbsc4SqobW50HdOxev43YOQKAlzsPIUZcGmOLi1tgziTRzVtH2/iBf6kNrr/lrBlgpx8UlY1ZUo00VLTBL0pzn7NbiGVgY8d1+g0fz1nSmkdZE9TRz0DrnYOIJPAXX9LQ4PgcwaohvL0sXp8IC8adUt7UErWig8H3u3ivLl5x7OBqvJJmzlhMc8MAOsQmtWa3JX/xlmAL/gSYxVe4zfYsV1YC7I6cqwkGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vH+Z+pzHxMibTm5Z/LhR0DSoNRxSlbkVc/LP4nzMgnE=;
 b=Dv7IW5CdIjUqMUsUWaFNvdRQkveCOEQiB9tRfsojTxGzDqrmQ7B+jfDphzi3qsYxxbhCqkKkbMuVEiYAaxrGtfwlHTvQmbH0XtHG+lxOvLl8L9yfqJu3GUsmEOB/lPhZLeI1j09A9MA31KOkV0Lah6+KhoNpHLRD5Ym7qgCE3p33mTvtlVhvA7vP/JJGEQL3vkk/ozNMtsweYOg9c3uMxMMV1PawW3jqqOwHZigvBVC5ReQtfK8tZ110VHKHIB/dcjRWW5V/EgI30UOOX3DtmcAWOiByzZBolyx6IKgk0m1ydIVi9+vqeLREC5y1CMMLY1m8NyrIrybOY6vJlYx7aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vH+Z+pzHxMibTm5Z/LhR0DSoNRxSlbkVc/LP4nzMgnE=;
 b=cVcGhl6FyRoWJ4c6AFsvAGk9IqEiGT8WbEF7muWncTOVUJWjf5LPe/YFwe7Tgeh/IX/TmH26t04hopDDEcmIpS/9v2BlMNECvNfg1v9Aha8ezeKytop/7kzszobF2KzcTLJbE0chHR+dftHcgM3bAxSAiexzmIURnGTmhC1GrA9fCzoDsuKNo/zH0j9ZL6LUmeViCf/1uZdUD/vC9jiuxblXr4YKSP14ChShVZa/Jr1wH7k6b9cNpK8Ecdc/GZrQdT7sR62OmWO+Vte2zuFhU6RmWOMDqOKSPvcP9DGDTUiCSPsYFSYIWpUgRv43sq1DVrctzVMji6ZDbEjt6Q8FYA==
Received: from PR3P193CA0023.EURP193.PROD.OUTLOOK.COM (2603:10a6:102:50::28)
 by ZR6PR10MB992206.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:910:d4::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.15; Wed, 7 Oct
 2026 15:15:36 +0000
Received: from MI3PEPF0000848D.eurprd03.prod.outlook.com (2603:10a6:102:50::4)
 by PR3P193CA0023.outlook.office365.com (2603:10a6:102:50::28) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20
 via Frontend Transport; Wed, 7 Oct 2026 15:15:36 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.59) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 MI3PEPF0000848D.mail.protection.outlook.com (10.167.240.148) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Wed, 7 Oct 2026 15:15:36 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Wed, 7 Oct
 2026 17:21:00 +0200
Received: from localhost (10.252.9.73) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Wed, 7 Oct
 2026 17:14:08 +0200
From: Antonio Borneo <antonio.borneo@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
	<devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: Antonio Borneo <antonio.borneo@foss.st.com>, Amelie Delaunay
	<amelie.delaunay@foss.st.com>
Subject: [PATCH 3/3] ARM: dts: stm32: enable ARM SMC watchdog on STM32MP15 SCMI boards
Date: Wed, 7 Oct 2026 17:13:58 +0200
Message-ID: <20261007151358.1166329-4-antonio.borneo@foss.st.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261007151358.1166329-1-antonio.borneo@foss.st.com>
References: <20261007151358.1166329-1-antonio.borneo@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PEPF0000848D:EE_|ZR6PR10MB992206:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a796d07-2c20-41f4-872c-08df2485d6f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|23010399003|36860700016|10067099003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	KMO5i8OQzkCEAKLl+Jz+wQZVaqRrTb2iYEFpq2kgAT7ULfGZSJoETVhLaB0hGb4YDUizymuXFDL4wCZkAWWPp38ebtB7rCzHMdqavINN5IRJmoZxaX4Ck9tjI/wFQKgl9+JC4XR7C2Ch3FUMVvVsd+go645jPBriA3cV4AmkjnBLWewkJ4mixFSg4GO93UTDroDLi4jhukLutWl5wXyKSwlbRc6attD4Nuhnh3jRVFTkZEXnm6z80DpQm4YI10/5YzLDE1lbKWU38NxTOhlGzXbBl5aLUz7loEzBlalVdSvrgGAcs2Yybx7Rm49WhC6o1P4X729oSl6YPRSbAxoKH3fFGGKEP46gXAt6uLnYEE8/HGB8sXWRlCu/2UYMcmIWIsJVHKx5/Ubc9pcAeDYJUMkSf2koAedAJ9gWcHgGVaS160kscz0wdOS02GoEoc4/JApc1P78w84/XcMXQEP30SMu/wjcYvQwXDNzybtYYb+uoUzt8NbN/3Mrm043kN92lpG3B1/h6CyyqauhLr4lULQyIorINOGUcGd6yXivu3b2aXOnN7/2286dMav2P85XS3hlB2uodfbpIrgwPsGd7kFPva6AtdyUdycQOZe9ZP1AiYpaUtUWMzK00LzEPEwMddxXc+9tV3/JYh+nlJNlrMoqqKPKdwziW+OF9a3u9s54eUaJyxBS31Pt4F/wOdwqXBdV4FrrGL/fausaLluzag==
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(23010399003)(36860700016)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	byoNUy7St8CAwEf/CMuuDdaLEVwg/YHbXU7VAW70aJNKmvuwj1eBoA+aOXgSP8tSkyWEBam8klJitZ7JT0oonD2vefINMH0W/ow8xkf5mih7Zni3rb1QiMvazuIi1gX3qF4ZhERjjzJiGUk+7WVMLrh7RN7X5p2MiLMs6CCDkZzpJjT3UJxnIJH+HQvZAPC7sFXsw7C2jUJr0wVjaM2JdpA+YsYDJgVI+AoxNQy5eMUiFdQW5S6R8+H93Zv65i0Ni7fmhMdVd8QizyVIKxKY59KVNplOaKgkXBdcg+iRkb2U41UtysPY0tKfDTFWHj3uzFGfZ59QVt6YjxO0dYU2mJ192qYejiqGbkTcEuolAPHZOVH2j6CiYmXwXUXDjPvNqK5GUSHm1GvTkTT/QZcezJc8jCFIDGg2abDsE4abPEPo7MVTYd4LSZnfFk+HurxE
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2026 15:15:36.4734
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a796d07-2c20-41f4-872c-08df2485d6f5
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MI3PEPF0000848D.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR6PR10MB992206

From: Amelie Delaunay <amelie.delaunay@foss.st.com>

On STM32MP15 SCMI boards, IWDG1 is secured and monitored through
OP-TEE.
Enable the arm,smc-wdt node on ST SCMI board variants so Linux can
control the secure watchdog through SMC calls.

Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
---
 arch/arm/boot/dts/st/stm32mp157a-dk1-scmi.dts | 5 +++++
 arch/arm/boot/dts/st/stm32mp157c-dk2-scmi.dts | 5 +++++
 arch/arm/boot/dts/st/stm32mp157c-ed1-scmi.dts | 5 +++++
 arch/arm/boot/dts/st/stm32mp157c-ev1-scmi.dts | 5 +++++
 4 files changed, 20 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32mp157a-dk1-scmi.dts b/arch/arm/boot/dts/st/stm32mp157a-dk1-scmi.dts
index 53e40e2f776b7..345c5694abf50 100644
--- a/arch/arm/boot/dts/st/stm32mp157a-dk1-scmi.dts
+++ b/arch/arm/boot/dts/st/stm32mp157a-dk1-scmi.dts
@@ -21,6 +21,11 @@ optee@de000000 {
 	};
 };
 
+&arm_wdt {
+	timeout-sec = <32>;
+	status = "okay";
+};
+
 &cpu0 {
 	clocks = <&scmi_clk CK_SCMI_MPU>;
 };
diff --git a/arch/arm/boot/dts/st/stm32mp157c-dk2-scmi.dts b/arch/arm/boot/dts/st/stm32mp157c-dk2-scmi.dts
index 0790ed426ebc0..8e32fa89c8a1b 100644
--- a/arch/arm/boot/dts/st/stm32mp157c-dk2-scmi.dts
+++ b/arch/arm/boot/dts/st/stm32mp157c-dk2-scmi.dts
@@ -21,6 +21,11 @@ optee@de000000 {
 	};
 };
 
+&arm_wdt {
+	timeout-sec = <32>;
+	status = "okay";
+};
+
 &cpu0 {
 	clocks = <&scmi_clk CK_SCMI_MPU>;
 };
diff --git a/arch/arm/boot/dts/st/stm32mp157c-ed1-scmi.dts b/arch/arm/boot/dts/st/stm32mp157c-ed1-scmi.dts
index 0a3894aff4aea..ac4d411005032 100644
--- a/arch/arm/boot/dts/st/stm32mp157c-ed1-scmi.dts
+++ b/arch/arm/boot/dts/st/stm32mp157c-ed1-scmi.dts
@@ -21,6 +21,11 @@ optee@fe000000 {
 	};
 };
 
+&arm_wdt {
+	timeout-sec = <32>;
+	status = "okay";
+};
+
 &cpu0 {
 	clocks = <&scmi_clk CK_SCMI_MPU>;
 };
diff --git a/arch/arm/boot/dts/st/stm32mp157c-ev1-scmi.dts b/arch/arm/boot/dts/st/stm32mp157c-ev1-scmi.dts
index c2b6efb1cbb74..6b26d87f7edef 100644
--- a/arch/arm/boot/dts/st/stm32mp157c-ev1-scmi.dts
+++ b/arch/arm/boot/dts/st/stm32mp157c-ev1-scmi.dts
@@ -21,6 +21,11 @@ optee@fe000000 {
 	};
 };
 
+&arm_wdt {
+	timeout-sec = <32>;
+	status = "okay";
+};
+
 &cpu0 {
 	clocks = <&scmi_clk CK_SCMI_MPU>;
 };
-- 
2.34.1

