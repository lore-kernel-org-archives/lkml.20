Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.0
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793297800;
	b=aB1OWKCIwHNZQueEu7U72OpvqpMS7QvWJ7W/CJgwk+VukZXBP2yXMYTNtDMvutJTNDc5
	 S+1tF4kK9o/2+TrDW23SSJku5qQmSzQUKZfcmH1XLYC2DruwI2yt1PtuQDhF8RCh/b/+a
	 Ju446pYUisIKAys6NsxQVakjF0lowF1g48zENtMv0kAk/WLjNqOzjN+XOLmFoLpXoPkXL
	 jYHbuQFtyHNWreishkH5YZTrDYKmUT+FmXgLRPo7+f9Fe4u6g7nkzRkhfL+TzvdZ5YWXs
	 TS+VwpVuoQSw2SyZQfOcO64EDdvt3f7QOi8pCMOlXfxib4vjPTm1H7RaAAvxCIZ/mSA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793297800;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy:X-EOPAttributedMessage:X-MS-PublicTrafficType:
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
	bh=DjyimHyDKHdLalCOUCU3BISe0KO0hLT+Rc1+fcipm10=;
	b=0s0x4BmnEU58DnqkawBNDM3rdSLbY2UwatAzG5g/ob7qULlcf12gzXB1Stc0j3St6elZ
	 gkePfWuBr8DK5qPuOrxbw+U/cJqlELVMkI8O7Yrl0UnCxHGysZsrjC4+69rQRhM8aqy2O
	 QGANcDAD0li7i11+pFvdykmlpyEVnYES2kgeInfpl4t+FjZXhK8V71zO4yZlJQxjV1CMv
	 p+hTonoZq6p/S1F/VWXncBGLqwo8yMsRhtDVWZo3YNclcHSneM1D7khEXQL8+NUK5mz/F
	 4YahoFMPePDkLa4KOwegjvM4OsGq9kq4ZiCcNTusfG9tQGt7Fk98fluaYHUcCTwYqaQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=foss.st.com;
	spf=pass smtp.mailfrom=foss.st.com;
	dkim=pass header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b="E1AKh/2r";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.0
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011000.outbound.protection.outlook.com [52.101.70.0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36FBE606A324
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 18:16:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36FBE606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=E1AKh/2r
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DRDNobu3lor6jRuzWIl40av2sy/L7U+81kE0AhcXuekwCbvkGj17J7kaTsv60C5R0F6FSZkcqs2kwhuMXncEnyQLY28UOuJqhrpOU52NdMHFH/teE8kZralRo8nx4ZHpawhtrI0GNzIKxAQon8LPiqaob661LwlhvEJPTP6DiQOefvN/89cIbi/7PMZKDA+AKopk662QjRfBZkq2/9DEYv6NQIwLDjEm0r8z/9Z8Qv5DS5RpNW3uj+h36uJmFJLvpY8HU1utnpbKofA9eog5ZadOVor87rEIT0JqHGXN5/DBjIEuM7Rx0rdPBTTjy9ZagMHOdm8W2Ti/xMPmHfam7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DjyimHyDKHdLalCOUCU3BISe0KO0hLT+Rc1+fcipm10=;
 b=YHTJwnCob5zuWgr/YsvdDN5UVyMzlSU+Z9g0ohkrAjjE+HChpxdbddADLKpZO31beupEPJ5htsprZ7elvQvrNSFznVg7rrAGYoWBzrQSISqm3Vl49W4y/54Bw7hocBvSQBLOmLljtbfd8irL3m8QB29Y1WLM7H8uifkEAcdP5G512xumBFKW+AJzSMNnRs5bMddT+McckIxY2zEJIHC/D8Tl/tx2SD9Qb7p640OcKLFG0fjgV+kTwgoie6lLHstMf4e40te9+1zeyHKSVPjPJ4sWrEhzQsYYjS9HzusyPWei9kwi/IA9GGHDmn3Z6feEurix4QP9DWGhzg67iK/Jvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=arm.com smtp.mailfrom=foss.st.com; dmarc=fail
 (p=none sp=none pct=100) action=none header.from=foss.st.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DjyimHyDKHdLalCOUCU3BISe0KO0hLT+Rc1+fcipm10=;
 b=E1AKh/2rDcAzzQzRcnLW8Zu+wCg0kO3MvqB5TNw+Dhyq3ZcTedNOTAkKRylu2PlXbq6P1ll7jlq9V/+uavO3SDDmDBXOILXL77C869S3iMOGB1XGj0DEJCsmupFmol+VvPHfMOOH+JmjsKIgPTYllI+Xy2eNIoVzaUPSA0gQ+cGRohQJacYj1Ob1yPge7DFBu8nSRrE/eVY+7otGKhXmxDtV1eqrwiMARKeUKsj6w1I2qXTrDB4p4YCqMwl4p1uQx0knthLJqFwNmVZ4XduTDcx5j4PUMEIvPxpP79lx0Tiq+OOeM7+pqeKrb906IPB9HPQlGPA2VFVfHw3ZnPWRbA==
Received: from DU7P195CA0021.EURP195.PROD.OUTLOOK.COM (2603:10a6:10:54d::31)
 by MIWPR10MB761893.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:290:d6::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.9; Thu, 29 Oct
 2026 18:16:34 +0000
Received: from DB1PEPF000509EF.eurprd03.prod.outlook.com
 (2603:10a6:10:54d:cafe::58) by DU7P195CA0021.outlook.office365.com
 (2603:10a6:10:54d::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.22 via Frontend Transport; Thu,
 29 Oct 2026 18:16:34 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.59) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB1PEPF000509EF.mail.protection.outlook.com (10.167.242.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Thu, 29 Oct 2026 18:16:33 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 29 Oct
 2026 19:16:59 +0100
Received: from localhost (10.48.87.100) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 29 Oct
 2026 19:16:33 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: Mark Rutland <mark.rutland@arm.com>, Lorenzo Pieralisi
	<lpieralisi@kernel.org>, Sudeep Holla <sudeep.holla@kernel.org>, Ulf Hansson
	<ulfh@kernel.org>
CC: <dario.binacchi@amarulasolutions.com>, Linux STM32
	<linux-stm32@st-md-mailman.stormreply.com>, Patrick Delaunay
	<patrick.delaunay@foss.st.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH] firmware: psci: handle unsupported SET_SUSPEND_MODE in PC mode
Date: Thu, 29 Oct 2026 19:16:25 +0100
Message-ID: <20261029191624.1.I5f8f3d75a566b72250d629ac6f43cf0d387c0218@changeid>
X-Mailer: git-send-email 2.43.0
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
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509EF:EE_|MIWPR10MB761893:EE_
X-MS-Office365-Filtering-Correlation-Id: b54e4083-f915-4861-f2d7-08df35e8c396
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|36860700016|82310400026|56012099006|11063799006|5023799004|261009223027099003|261026121527099003|261026140227099003|261028144727099003|261022105027099003|261021121427099003|261021123027099003|10067099003|18092099006|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	DDeV0AW+jr6FQKPJDhjaJpMPksuivtsE5u/zUwZSqFwWyHB4P3Y/ZJV6Nq9W2FzXUhT1lIYlO68+1mhHyCBrPx3jjTXw7VNJM0yBjPktDH0j0ZB6/MLrAPqPSC0gl6fF9u0TtonO29N5Zx1yCZmddm2c4h0EpqafJUAzpFWdoL6yRG/OnLG69qEqMx1nJHTJHLChEyI5DXxK17ySlPK7egPwm2/hGwBQilNe98JyEv5Cr4CeX1DehbsJK4OuNlwqSXgiK9wzgxhHD7f/iYMzgVJgcpMMMVhdCRIQR+DkVW+Tw4xZ5rGaPmAHpUPsDXm79wDaOikEmlMmUP31gi/OVuEEgnpfhPJ2ZaLJzbVlmGbktd7lq0wUD8GEd5Ya41GLZiymyOCbjPwQd9TdH6wnjpI6Aer7TVZ3OiGZPPAW4xlDWOyl0EyECjlxskFw8+hnZ8ZR+sjQzr5bmAVOfzgPuEL4KzHIdOYBb/8vTKyxkAK64Hn3+RwEbNokVfoVH6oLhxEHCyAIHHl+TJLHOUtxlRxnH6EuAcUDObsFpT91LD7WEJInr3aaGn69RtUtPBR03hi87GOHKSMNnsPdEegLCXlxPRRdF9tFbMezDFu2hS/OnwAiTtlupf6MmSsyxRiIrUsajMtud+pGP9KibuY1QySChbqfWZzK4IYxtUjhO52vZNxFjSuGUekjeUqCYvIcSULzGEeOSajUiB7xv8ebeg==
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(36860700016)(82310400026)(56012099006)(11063799006)(5023799004)(261009223027099003)(261026121527099003)(261026140227099003)(261028144727099003)(261022105027099003)(261021121427099003)(261021123027099003)(10067099003)(18092099006)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Rryby/VrTG2H9kLgMcHKGjbKXSWxmHXzC1pBzeVox9Ox1yrqXUE56Zrm94rThTcf5gHIF68za25yjcsBBWvSt+psG4MwkvSdVV2U9MjdwHWew1p1dJnyDOEaPGA+4C/6CaMn0A71ueGzDrUbLHv6IZikTqXG510uei9lpv6bGUkav8vz7+2j4qVbDwSv4590DZPciUESYbt1neEaFbPhy+HPpd840hOUvNs6y/BksrsHsepdhJL4Oss99y4nlG9o2C/ZijPciZAs/SWNLwIdiRZEiHpc/uvOyzbZmmTHjKlETrSqMkcWlnjYGaXTmnq4SCPhi+Zqrnb99cQXVjWRpPfZBvdokmMlRb4hV8KXzhUZWZshv26BrNtVLdgy8GmGJmHCZpbEY7dDG5zabwkFqe/9Daou+it6Ikt6e/PI5irkYyCdKvq9WRxl7PZZrHcm
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2026 18:16:33.8936
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b54e4083-f915-4861-f2d7-08df35e8c396
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509EF.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MIWPR10MB761893

The PSCI specification makes PSCI_SET_SUSPEND_MODE optional. If it
returns NOT_SUPPORTED when Linux requests platform-coordinated (PC)
mode, Linux can assume that PC mode is in effect. Treat this response
as success so PSCI power-domain providers can initialize when firmware
does not support OS-initiated (OSI) mode.

Continue to report an error when OSI mode is requested but
SET_SUSPEND_MODE is not supported.

Fixes: 49fdcd7577ef ("firmware: psci: Export functions to manage the OSI mode")
Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---
This patch allows to Start Linux kernel with
- device tree using PSCI power domains
- with TF-A BL31 compiled without PSCI OSI support (PSCI_OS_INIT_MODE=0)

For example, since commit
9c8d852dabbd ("arm64: dts: st: add power domain on stm32mp25")

we have errors on STM32MP25 boards with latest TF-A (v2.15.0):

[    0.041800] psci: [Firmware Bug]: failed to set PC mode: -1
[    0.041814] PM: power-domain-retention: unable to remove subdomain power-domain-cluster
[    0.042130] PM: genpd_remove: unable to remove power-domain-cluster
[    0.042313] PM: genpd_remove: unable to remove power-domain-retention
[    0.042455] CPUidle PSCI: failed to create CPU PM domains ret=-95
[    0.042465] psci-cpuidle-domain psci: probe with driver psci-cpuidle-domain failed with error -95

and the associated devices are deferred, for example:

[   10.974374] platform 40130000.i2c: deferred probe pending: platform: wait for supplier /psci/power-domain-cluster

 drivers/firmware/psci/psci.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/firmware/psci/psci.c b/drivers/firmware/psci/psci.c
index e73bae6cb23a..610756e81363 100644
--- a/drivers/firmware/psci/psci.c
+++ b/drivers/firmware/psci/psci.c
@@ -167,6 +167,11 @@ int psci_set_osi_mode(bool enable)
 			PSCI_1_0_SUSPEND_MODE_PC;
 
 	err = invoke_psci_fn(PSCI_1_0_FN_SET_SUSPEND_MODE, suspend_mode, 0, 0);
+
+	/* when optional PSCI_SET_SUSPEND_MODE is not supported, assume PC mode */
+	if (err ==  PSCI_RET_NOT_SUPPORTED && !enable)
+		err = 0;
+
 	if (err < 0)
 		pr_info(FW_BUG "failed to set %s mode: %d\n",
 				enable ? "OSI" : "PC", err);
---
base-commit: c339f4010dea8b0d754f84ace70cd1b089878ef8
branch: master

-- 
2.43.0

