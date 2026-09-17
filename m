Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AB3A4BB26D;
	Thu, 17 Sep 2026 11:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789643789; cv=fail; b=Yrsu0S83wNWIH58HMQ9IifWp/Vp6XZARNQaa3lUkJwHgWh955whlmRYxXp/g/6MHEUNriidH8LYAkvY173+BR1zWSCiER6y94i+vVKrm1QmSPUMtQLHEvHQu+e8tCaZi7jzlFN0dldzLt1LDJ1W4aiciFy+KqSmws4CxRez0bJY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789643789; c=relaxed/simple;
	bh=fSpGbMSUhdBt0g2meAtFps3VWhajXDCqyRCp9i1nGlw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Po7FuSlWa1J9G5GtA6olOnE3iubZDXiMhk5W540Hl3CdCmAcqrzruzvHa6Mgdtf1xqYGLkhMpPDWVQcOyaohO6I0gcLVfq3ldjfSJxsdVzVZMeSSZdKpv09zWVT2WLHXCLjdoH5VRq4O8SZJJ1xYu7Skn/bLFgcYc3EoyYgofVs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=et3NeRzs; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=ugyLdTdd; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="et3NeRzs";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="ugyLdTdd"
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68H9aQME1070889;
	Thu, 17 Sep 2026 06:16:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=y96XFJV+2RJ6e
	LQ5IuFtifuJt8kY5hFqR269fe4eT9E=; b=et3NeRzsJyu8TDu/GSE3PoYVlTLPC
	TqaiWunBx+SZbAYiCHcP5/17zfd9ZjDvLfy9jr30SNZlaH0+g+Y1twELwA7Oo6SD
	UxK87ZPBUFxciij5DW+UxCNNlkMvx1cmjmSuVQAbiwRQZcaZSRInV24Bet85Na/x
	ZiFRErxkENUxZsSbdK8mF9A5flM1lFA8LpB3G2BEkesGB22lVBy07CdJVCqigxwx
	NrEKE4XTgEmsn9znZVISnomw+XGBMKQfi2s2kF/n3u5J/vEB3VwekS5eGInUG2Ye
	GMFmt0WtlFNYEnV2yddj3SICImv9LME6egdg2m3qu68MUu5mas0XOA0PQ==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011018.outbound.protection.outlook.com [52.101.57.18])
	by m0380145.ppops.net (PPS) with ESMTPS id 4grcds0yqe-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 17 Sep 2026 06:16:13 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZwlozS8edAgC7RkdmgzaNafG36zTRHIc87mJu2HmZWc30KgGx2ewUYjMY4IFxFj9wz6FrPGFQYmi1/pUizza7mmp6H9aM6o6pj/Tf6pY2oKZZavoCeyqi5T4964hXbiTeNBc9EX5W4Sp8iUxay6nqILi/tiJ7UcJHMlrT/PGBK/ZHdExFt1akGUNZ1smWND/pFi1pEEbgvKFYumw9bYGx9hCXC/xIP2wM3NDw4hKm4f04z1OHDMfwa0HjMuWc1rwIPurgQCmV4w+lfO9QeP+I6vq8SucUjgYKyHp1aeltNXk6Dk+XjkKQXaHXt+XMfKaIXes/yytGtyiuQclCrPveQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y96XFJV+2RJ6eLQ5IuFtifuJt8kY5hFqR269fe4eT9E=;
 b=C608WF6oVgmGfL6PbMQCKxJZ96/DqpLzpfRk7JcOGwbC5/WU/JNAhS4vZ96cncesuS7ATf4xv+/6MIfEd2uIGKWFaS0jeLbs/J4UQaNTasP/qHSIelZtQFZCqBVxTPBSSE3FB1ye7TJ7190xN6o2Scuao+F8Napp1aZ3xKWn7/Bl/n5hGNzIGB8YAXFAf8fLSVAoco9jPWGwvqWttMS1g8AKU9xv5iRgp/jRl2wOKcps/tO0vJ817//BmK26zlbD+rBgYMfBtLKhqIxpWTaKXAS8Kv/1NGjlQP1Hi55OpiLVsK0qnxVYNGV+R27AXbZgcYKnUVqMBdJ0sWFXHZ0Zxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y96XFJV+2RJ6eLQ5IuFtifuJt8kY5hFqR269fe4eT9E=;
 b=ugyLdTdddq8I5NEAZRu6yWA18auQtsNdyb5gDZz4b+IOn65vs0jXLcPcTudacjMOcZUDVRtjj/mTyub3OEM6l/hbjUcf5QjY7F94GzBb3rdVvDq7yHxxyWfQZQXeObYAxY9JkYlCwHfqJeeXNZKqB0XCLS0V6rvjAyaOa95WArs=
Received: from BY5PR04CA0019.namprd04.prod.outlook.com (2603:10b6:a03:1d0::29)
 by SJ0PR10MB5567.namprd10.prod.outlook.com (2603:10b6:a03:3dd::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.8; Thu, 17 Sep
 2026 11:15:58 +0000
Received: from SJ1PEPF000037B5.namprd05.prod.outlook.com
 (2603:10b6:a03:1d0:cafe::a6) by BY5PR04CA0019.outlook.office365.com
 (2603:10b6:a03:1d0::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.11 via Frontend Transport; Thu,
 17 Sep 2026 11:15:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ1PEPF000037B5.mail.protection.outlook.com (10.167.244.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Thu, 17 Sep 2026 11:15:58 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 17 Sep
 2026 06:15:47 -0500
Received: from DLEE201.ent.ti.com (157.170.170.76) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 17 Sep
 2026 06:15:47 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 17 Sep 2026 06:15:47 -0500
Received: from akashdeep-HP-Z2-Tower-G5-Workstation.dhcp.ti.com (akashdeep-hp-z2-tower-g5-workstation.dhcp.ti.com [10.24.53.39])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68HBFhQv2890813;
	Thu, 17 Sep 2026 06:15:44 -0500
From: Akashdeep Kaur <a-kaur@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <sebin.francis@ti.com>
Subject: [PATCH] arm64: dts: ti: k3-pinctrl: Add virtual GPIO select mux macros
Date: Thu, 17 Sep 2026 16:45:39 +0530
Message-ID: <20260917111539.3844577-1-a-kaur@ti.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000037B5:EE_|SJ0PR10MB5567:EE_
X-MS-Office365-Filtering-Correlation-Id: 994a3170-192b-4b57-13fa-08df14ad0cac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700016|23010399003|1800799024|13003099007|56012099006|6133799003|18002099003|10067099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	k/KfUSlRcHxdb4FYO3AU7/kvGAF0Xcr39ROQzE1kbPkuQcTFRridrg5e2zInf8jSsPw4GmxJkal/MLOdjDRV9gOrSa8//fHLPHFFkrH6ZkB8CbwtndWGI85BTDuv/T75TmAi0VjgIbfANKvvWbfMTQICZMG4NeYiaJsqlxJJyOemPiYmmmWeD08Z/nKD+hMNqxKo3pvSbZ34FffiSZecUIqdJJG6M+599Nk2IyRhjLePBDjRhX+BUesFOouHgo1YzE4roTHQpGc7qW0gKaSFDdKo7v74uSv5EiyAM0jQIFrpWon3oGf2KflTwpkH6hBU9+8HDepjhmMLtQSrI9BdlRDpr1CFzV7MYVaad/wUsA84DruxRm6daTbWY1UyrPs6qhiVoevYJj5j+rvs41WVz2n9zP6Q2HQ0mON+lJLv8No6nKWBCO5rIjJfKzroPyJJlFYi/RrtZaQn9JdHZ/oBcURNrVd0Ps/azjkhUjEvQjQgGFEY2aMiLzXTsb8J//TDz1DSSj/fdIt4p+9+J8JerZyEQa+ODIPUM4ajy1cOGCSaIu6HF1xwAmdbRwigLcVQuL1yyNWV0QV44ghTE3TC0yfZgBaJjb5RjgVGRidzUaYeVZbg9g6VfHZVCWp+AYcO7ZVsZb8QJ8bDskUG8pbpzg==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700016)(23010399003)(1800799024)(13003099007)(56012099006)(6133799003)(18002099003)(10067099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	nehpvDMzjqBZq4T62621KI6/F1/gBlNCkXsYRUjzGUjz6Nfo9GqUSzKphrUVklxOI8yxpGGwhn7hmcFa+xNHRFusJN56i34i0dTFbNURRDtsRGLsz1qRWiuF5WSmvmc6aM1FG9HMyezHaabRdOFc9eivEsyCRpCjMPQsMwucPjuHV1AtY83SZXgIYVTGzadW5wSl1a2VrAU+vyAYtJRN3TuKj40ztuJziOaYwqAtmM+DSWfswCYboWxX8NxOv17koVlM9rA7xiVzPMOMIl6swPt0EUNdW4N3PRiG6U4b6FEm5X97IVnVD1VTQ+zhTN+8TLXp2d6abdZNDS4lZ5rx4RQG2oAAu4EtXMX/ohXUXsL8QT4KCOGVc4iDiW5EzqtuhmOgkzLTJs4bo/wKfuu+k4m4EX+dUIy7hX0U7Yoyg75plqtR19UK+wA0suqabXXW
X-Exchange-RoutingPolicyChecked:
	D7dmSd1TLIeqfDJtMgcAmLpyWC4gezWm/tt9vSWvBKngUy0worQ/YIOWbfUsDOjjytejex04b4Od86N+mBw3+EZDdxdkl2R6Z9n5FZKQH4fkSWW0SZ0CdloJvep1FBKjlftmwjqWTkSYswN+fK474ISfEBMp1HOkc2b1peb3fwLonuYeFvdAdMgBJYrQ/MRfNNrWzxzogYO1ndk+Fy5XsWQIJS7N5V4CVWFfwTIPuK3wFBBwAZrIhyLeoq9Y7g+5C6RbUKJsY/lGq1XM1aTqScS8GkLMrZ9E4yIUKhhujp81UkL2C6UKmomXSnn/vvJ0/Kf+i5SR2YpsYDiH9K2pHg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2026 11:15:58.3059
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 994a3170-192b-4b57-13fa-08df14ad0cac
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000037B5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5567
X-Authority-Analysis: v=2.4 cv=ZfGIpcVA c=1 sm=1 tr=0 ts=6aabcbfd cx=c_pps
 a=f2oOq7llzQIcdXl5NAnHtg==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=sozttTNsAAAA:8 a=Jz6ueludmhJRmjzU2zEA:9
X-Proofpoint-ORIG-GUID: m8os_1YEpyDsrHYPgqFnEHAj2Sx89CQN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDE1NiBTYWx0ZWRfXy4PjeC8raUru
 0QPc4jc3UU9yAKhxZ46dsMoFTI/McHOa7DWp/fWTL83bf/hEvP9ehfKodIoPPn/iQz2kg82f0f+
 GhUfo0AJY2515c1/s9weMTm7OjSdYx4xjjM1iFufyZxnSciNnOqjhSbVG0d5EGoizQEI1a6DLCJ
 dU4YVKIiGiqtV0pccqdQs/mpYRLs3fSAg0U5S9Czl3KUJ3hrbltb1VU7ZKxC3I2zv28AedJNyKJ
 MRvVjDrujOw/tAJIZIrzCpzlodaEaPCkkytgV21899y/FXLSJdYk3TwTUONTBrn5Nk3FK+XS77G
 B7x/hJ1OGxY/beY4puqCihmj2CSKqDgcq1gHBfwaUzGi/UyQOil19raBuFst/3zs+nM18eiIyvA
 sYzo2+LF+1ZZed/I2YeqCOQ07gosLSgF/8AVTmU1uujZmhnWDGgnzTy/e+qPxcOvYqebyBmCMGX
 nBtHrDrh6G1v16OifVQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDE1NiBTYWx0ZWRfXx6OyxRlOMYDH
 LNVdGiSVlztTa3/F1cLC329aJIqsWhtRmmukyzZcLdyRSwN8gYt5oRbF08L5nRZh2A/z2D/V8ih
 ioS3LVf3glsuJj1X2mD+QILVZc/tMUQ=
X-Proofpoint-GUID: m8os_1YEpyDsrHYPgqFnEHAj2Sx89CQN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 impostorscore=0 lowpriorityscore=0
 clxscore=1011 adultscore=0 suspectscore=0 bulkscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609170156

Add virtual GPIO select mux macros to allow users to select GPIO
controller bank for pins. The two GPIO controller instances in the
MAIN domain share physical pins, and the vgpio_sel field routes each
pin to either bank 0 or bank 2, enabling GPIO partitioning between
software domains as documented in Technical Reference Manual[1]. The
pad configuration register field description can be referenced at [2].

[1] AM62L TRM (section 10.6): https://www.ti.com/lit/ug/sprujb4a/sprujb4a.pdf
[2] AM62L TRM (section 14.2.1.2.1): https://www.ti.com/lit/ug/sprujb4a/sprujb4a.pdf

Signed-off-by: Akashdeep Kaur <a-kaur@ti.com>
---
 arch/arm64/boot/dts/ti/k3-pinctrl.h | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/ti/k3-pinctrl.h b/arch/arm64/boot/dts/ti/k3-pinctrl.h
index 4491898d8294..d42c466fcc7b 100644
--- a/arch/arm64/boot/dts/ti/k3-pinctrl.h
+++ b/arch/arm64/boot/dts/ti/k3-pinctrl.h
@@ -3,11 +3,12 @@
  * This header provides constants for pinctrl bindings for TI's K3 SoC
  * family.
  *
- * Copyright (C) 2018-2025 Texas Instruments Incorporated - https://www.ti.com/
+ * Copyright (C) 2018-2026 Texas Instruments Incorporated - https://www.ti.com/
  */
 #ifndef DTS_ARM64_TI_K3_PINCTRL_H
 #define DTS_ARM64_TI_K3_PINCTRL_H
 
+#define VGPIO_SEL_SHIFT         (4)
 #define WKUP_LVL_EN_SHIFT	(7)
 #define WKUP_LVL_POL_SHIFT	(8)
 #define DEBOUNCE_SHIFT		(11)
@@ -111,6 +112,9 @@
 #define PIN_WKUP_EN_LEVEL_HIGH		(WKUP_ENABLE | WKUP_ON_LEVEL | WKUP_LEVEL_HIGH)
 #define PIN_WKUP_EN			(WKUP_ENABLE | WKUP_ON_EDGE)
 
+#define PIN_VGPIO_SEL0                  (0 << VGPIO_SEL_SHIFT)
+#define PIN_VGPIO_SEL2                  (1 << VGPIO_SEL_SHIFT)
+
 /* Default mux configuration for gpio-ranges to use with pinctrl */
 #define PIN_GPIO_RANGE_IOPAD	(PIN_INPUT | 7)
 
-- 
2.34.1

