Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D60C91684B0;
	Tue, 15 Sep 2026 00:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789431229; cv=fail; b=rECpuBiAzFEwFXrCzjxIWTl0SVaXi9hP4fdrgeRhdPyywqDTRPjt6kXyftRElscCn6Ks56L+0FknS9uTs9nozF3BhKY3aCv+doRmTL6POsZDJGGrX/SUzqhjxzva0EMJXkbpSZK+aGIp1Dx9kmXTujDa0Q0ELGqCj/TB2eWMpzk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789431229; c=relaxed/simple;
	bh=0IisqP9dBeAQjOJbIrfRNhjhmKuTSrWAWDX6RVMHLv0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=T8zq8+LIBs+aqqo8MciyANlPYRBy8VLwaqVc9cjrNVq2URQzFcDUnoDINB0/Im+F3tXiRNGfrw+11POBSy3rrmpBOHRShd4NtqZmmZMicu9WoJrzHz6xyf4fB+XXo3TYnz7bljL4rKt+aSMuumcTwbU2asHwaOZGI714XoMwOk4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=aFUAvcPz; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=XSWo1/x+; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="aFUAvcPz";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="XSWo1/x+"
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EN0mhr2556126;
	Mon, 14 Sep 2026 19:13:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=6KS4hN4o6AFR6
	Y0Z4BlAZl5mk/e7DUv45ud1/eNKU5g=; b=aFUAvcPzSEn3poSwCVhYKsPzwF7of
	0OxFuTxAvmly/NvgBs7TN5Za3SEjMQ7/5Zdwm6BqSlheUq6pKByoicMAtw6ywJUe
	yeR4fJLVFqRc2VCrNOYgUE3JfKvwjQURTtZlAsKNjmgoa43TfiXirISdI14Ze2dk
	I398YnBRQUThEif/xN3NHwF0/SZlpsDNtCJXj7b8ZkYDVx8WJtou6FNAk2i4NqPw
	a1ye9r7kIBtE4MpYrmfsWHN3SFzXAkPSmtODtgM5xaMV/psrh1dtdjHj3IKyDizl
	e5ZBMiceysX+7/L89vdV23t1ynyurEtY3iiWO2bu1VKCW6oaOaptgpfZw==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011001.outbound.protection.outlook.com [52.101.62.1])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gpm40tfhs-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 14 Sep 2026 19:13:32 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y2CJKPY9avK27I92BsYP6Ii/bRgtQUibWNjZU7jcq4S7DSNqxf0XP4ikHRGTTqivXNBmVRuCp7z3x/6TflmX7S3A+DLHxwNWHHUMLeSIjjK8RzIY3EXu4ztvKGR/qmZUJDuwQnJrVr7ay92lce6NUPwt1f7o8YmW5G+y3rlbP1+zBUjT0yYwm1/5BGFYc88X7t85q/2/VIiimbMjRw/V6/N+kCm9FEOYFBM5+dZIbZpHZtqJuEK/MoODKodbVamG4SCm3tk1lq8PJIvJNL6am1SQIHuRWqehGHk/lIGG5HqcS9EYBDYHJnIU5PBiz9uTvH6hXfx1ipdtsyR+1c5hcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6KS4hN4o6AFR6Y0Z4BlAZl5mk/e7DUv45ud1/eNKU5g=;
 b=rkmSNXQGYjiBS5/lFOreoWk1o3cMoCWaU1obaRJoD2gbW+fbaVO1g98CuWAcpaKS+/Cz+/0pJnI0qWYYd0dGDk8ICWDfNUs80gfzvhdAuwmVLPtBy0gNOBaXeynZlLsdfVZdACl08gn8X9f8MgOufWIojUw5CAETnuiX4gDfDHbKH+RjVleyJnSP3tkSW9f5wt9s94imsbUYutcMLCCdnLFUqZ5iutkvC0qkWgz5Aj4fDPCzcNg1P/gqhvThBpMlkZMcniDsHx4Y9wAdba800KTRBSoomu+CW1dCSwC3gGAuVeaKeyWB/qenOlucoW7pxTNYY4YLmDZulrlPHEX0aA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6KS4hN4o6AFR6Y0Z4BlAZl5mk/e7DUv45ud1/eNKU5g=;
 b=XSWo1/x+D5M+LUEg58VwImFdMIpm+nkJwbY6SgUY2aNNEpKzm8Ttc12ZhkTr/fnej4Vtp+EXZgyuKBqFcOmN7NO3pNrSo8RERQ89o0zt30gbdVdO3joSQfmC+vbgx0D+DzYpeNG1AEhAFQUan2aiYUSSloh09UwZHxgR5r6vHYM=
Received: from PH7PR10CA0018.namprd10.prod.outlook.com (2603:10b6:510:23d::15)
 by DS4PR10MB997622.namprd10.prod.outlook.com (2603:10b6:8:318::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.8; Tue, 15 Sep
 2026 00:13:30 +0000
Received: from SA2PEPF00003AE8.namprd02.prod.outlook.com
 (2603:10b6:510:23d:cafe::98) by PH7PR10CA0018.outlook.office365.com
 (2603:10b6:510:23d::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.9 via Frontend Transport; Tue, 15
 Sep 2026 00:13:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SA2PEPF00003AE8.mail.protection.outlook.com (10.167.248.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.7 via Frontend Transport; Tue, 15 Sep 2026 00:13:30 +0000
Received: from DLEE204.ent.ti.com (157.170.170.84) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 14 Sep
 2026 19:13:04 -0500
Received: from DLEE200.ent.ti.com (157.170.170.75) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 14 Sep
 2026 19:13:04 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Mon, 14 Sep 2026 19:13:04 -0500
Received: from hpz2.dhcp.ti.com (hpz2.dhcp.ti.com [128.247.81.105])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68F0D4Lr3103663;
	Mon, 14 Sep 2026 19:13:04 -0500
From: Judith Mendez <jm@ti.com>
To: Judith Mendez <jm@ti.com>, Nishanth Menon <nm@ti.com>
CC: Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH] arm64: dts: ti: k3-am62p-j722s-common-wakeup: Add GP_SW1 efuse node for silicon revision
Date: Mon, 14 Sep 2026 19:13:04 -0500
Message-ID: <20260915001304.3781247-1-jm@ti.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AE8:EE_|DS4PR10MB997622:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ec92395-fc75-40ed-bd29-08df12be2c06
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|376014|23010399003|1800799024|56012099006|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	S44D4FSkwcb7ZhZRF2CG1NHVuOh0CYgn0IN8pJi8DyRUVF/qVur8OTLWCRltdtYRwitcGU/PnSHQXAD72wmC/q743qcZ/U95JxIxn+zhTU0mDmSaO2Hx2CrUCD+v1ESgrVUzDOKmwc34YOUjctx6kAYVLxws0OxBAnT/nwOM/RGtZm/esV6v8e009zbwv0NJ7uPTW7eUxmJM9QKRsz8gtvItkc3KxCvIkjXi+04JXsFng26Rgmfwlc1sTTJwsRxuULX+EM1u2PJVNel4QNOdmlKgGmIN7GaUchRRTJi/xNrLHKFyi1VJ9j45q3JQ+NaRUqRn3Oh2L4olyvKllVumv5pEqIDxbtQYEUVHOhZc2SgfnU+BgvF/c/Td3MmcjR0SDcQYz8oPZhV++911F/xwMsVHv/9C3q+3G2OEqMJirC7goT/K7CZuF/YDjw2WbtpKUiNuhenlfJwfemxQ96LFCt1vlmG1qs4iM8HX6XthgsXAOgM+rPaMNA2X3zbx4sblARsmMvbXintf2LmHNCnXkIlojonfXm4cuCkjofA5cshbVcVnpgGR5cLy3bDsAKqy33l7eGZtCmz6DJMP9x0bQvM9vH3+gJE3SkdjfNksIQ5fEbq5QTfunYr1sDNcvWhU1mKbcoOStzWyI5qdoeZHET16/AaoNO9nLc1axV5eYyje3xeJoDoHvSedlB4kQZUko4N0tgrz+A5Gwms69XyBuw==
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(23010399003)(1800799024)(56012099006)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	9vSPMBespqQ3H3lX6g3N7w9nHk/ppvIV2LWxN13cYiAu8FoJcE9XGHdXoDxMg3AkKcPD/6HmQJiXLK26rgDLRIi+OqRebgevJxQLDRXpI9If1NOt/Stq+jK1h/0zCPVzs9Jl+Gi8uYYovwySrkLnBgIxiuU352JMfetT6QEvOpemgfNuOqJ11yTt7vjVqP5X+p3eGYG2R3hWe/AZOcq13pXYJ/S8QDaNrLhCyn3M0/CPUOMGxgBjcW1nHIri/bkQxWl/cb1WL2OqRN+l7Rz4TI5+JtU11ZQCTfm+aT046kVncBCBJGZ5Bwg68vn6Au+a8+UBOd168FrK/mfAkY4pjfENmMgjHcTunFaOn0RLTkzSdw8WmpbaDTxrfcuZgyHn4U3emPEiI0iS3JRQkItW1DRJE/9F2JUxSXPajvW6EIQXrLCWqqpk/dLJwrvt2TiE
X-Exchange-RoutingPolicyChecked:
	ZcaSYdRowapER8RCeluaGkv5Vl9mY0GT7jB6GvatI8M2bwCTS0oJm5ephVJeOzlBICmnnUsQK9Mweg2spB8UEkBhYZPfIHvUAsQY7dhikMleg2IrBdWYyfeOPtxp1UtaW9u4wBUf8PXViqQfJYmbKts5A5nazwjvCDWBdwPwt9NSENHrZqEbUaxrVmSpy6ytRBwsm3zjRv19vepDOXduHC9zFymQBNhDr2qs/0LxySmGc0yC/F7JNpULLq7VLC7Ooh5qOjHFu8iaD8g54/b1oKyrxM8E/Cg37BXqK+H9By5lh1qrZDaVs2upErArcIA40bYhSu6KxxXvvVfs3xQN2A==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 00:13:30.0913
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ec92395-fc75-40ed-bd29-08df12be2c06
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003AE8.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR10MB997622
X-Proofpoint-GUID: fIq6ziCrjnOHjKiIPIxqRUyV5XYwd0rd
X-Proofpoint-ORIG-GUID: fIq6ziCrjnOHjKiIPIxqRUyV5XYwd0rd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDAwMSBTYWx0ZWRfX7dI509UsU9dH
 o9kxOEjFdMH9SV21cHym3NBI9oLE0fzpzjAL6zir1wzLiRfaSo5whGD92+DjZmgV7CAGNh8/U2z
 oWAMpattvnjmioyqWr/lEZWpomTRRVkcCaWVgTAZXn9ZnEkzHkAI5XmiWnyPmxy3Dw518eSTiv9
 xqie8MHzZiIuNWQe9xWcyXF6YG01SNuKJEPyqMhJOu8rclP1xxF5EkEx8gO3gQ5pIihzm/mIk6T
 vEA9vP3aRztCtelTh/XxpjYhbcpyWy3q/BLM4OEL0r5e1y0dqvBxR9e/onvXJbZ/XX9ImfS2NE5
 QaIko6epUT2jEiKdi7iknR+KSb93skOzrMY3tpuEpbkQML2iL88pRJYL/u/hh9zLtsisBb0Fxro
 a5FpO2TYR7svqEMmcjm/+dnR/6f1xJqTyZwOTRcl9YXDW6uOzGMjnBKrVTgA6JgezZ0+PCjm6q1
 pQx2oChOVp258HG7aEw==
X-Authority-Analysis: v=2.4 cv=JIyuIMKb c=1 sm=1 tr=0 ts=6aa88dac cx=c_pps
 a=erT4cWMnywdrD7/NC3b1Og==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=sozttTNsAAAA:8 a=GvMEbn7G9XZo1yhYGLcA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDAwMSBTYWx0ZWRfX43N5ZtGeZBos
 w2k5ViGtquUB1d+lSimLT7v+E0zeviG5jfa3rPNrMXEIkne3Z8uIY4exfZh3hLg4s8VjcAP6nQu
 xzq0yp1wv9jrM0kYYWnY396TVzj8t4U=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_05,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 lowpriorityscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609150001

Add efuse node for GP_SW1 register at offset 0x230. The GP_SW1
efuse register is used to determine AM62Px silicon revision.
Reference efuse cell from chipid node via nvmem-cells.

Signed-off-by: Judith Mendez <jm@ti.com>
---
 .../boot/dts/ti/k3-am62p-j722s-common-wakeup.dtsi  | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-wakeup.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-wakeup.dtsi
index 8612b45e665cf..0f00e9d87f8ba 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-wakeup.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-wakeup.dtsi
@@ -19,9 +19,23 @@ wkup_conf: bus@43000000 {
 		chipid: chipid@14 {
 			compatible = "ti,am654-chipid";
 			reg = <0x14 0x4>;
+			nvmem-cells = <&gpsw1>;
+			nvmem-cell-names = "gpsw1";
 			bootph-all;
 		};
 
+		gpsw_efuse: efuse@230 {
+			compatible = "ti,am62p-efuse", "socionext,uniphier-efuse";
+			reg = <0x230 0x10>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			bootph-all;
+
+			gpsw1: gpsw1@4 {
+				reg = <0x4 0x4>;
+			};
+		};
+
 		opp_efuse_table: syscon@18 {
 			compatible = "ti,am62-opp-efuse-table", "syscon";
 			reg = <0x18 0x4>;
-- 
2.34.1

