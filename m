Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9170C4FD29C;
	Mon, 21 Sep 2026 18:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790016638; cv=fail; b=HfxmoByBWwAK2lOc/y6/N7HkfB0ZfoYGP/d+77uyJ2A+dPDCOFbKa3twwGLXILwomkxe/+B8pTsuRkjs23UFovibpZpE1pTOanz/tGLHkU3EY0DipwYYID7HLkyTxK6Yp1AEEwqS3X3JWNnnusSx+H23iGEI4sWydoYtw+jmQ6A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790016638; c=relaxed/simple;
	bh=In5T32+h+aB/jWMsYf4Kt6wgXSWm/JJydi8oFGaFyu4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jHdmxhKHZPP0LIYhEBQotMgfxO6UyEXoXi6mczahav+ddz9LBQ3FDnhlgapQZB0EQnR1OH0XKFNv+B6vMWsTXDpw/0aD9R/HAe1HHzZTYZODwaRG9ZgnDmaYMvrPX3KPoZINoccePXCP0gGJLliDVaI7Y3cXk51LfCEm804ESPc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=KfA4m/hz; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=G6hk7Tqj; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="KfA4m/hz";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="G6hk7Tqj"
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LIUM56605475;
	Mon, 21 Sep 2026 13:50:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=9iwZDqMcIrOi8XwmfqK+Tu198s21InhV3zrbPRV/X
	3o=; b=KfA4m/hzpLKCQd7yRKdR60EQozxIraZrem7p/wG8PiH7MhBUfVt4BGRhR
	QHThDW4eFp+hig1mRhf2zfFR/9m3FOovVPvlPJIZZZZT1MsgRfqhTia7Sq02R4A4
	/dvmHEGixS2KO1VrhOqXRr8dOTFRYkrJF3+7Uu8AB2DpFte7r65Cp0UEAofzd/8L
	muHVFUcsB+l7I+6ROmmBoQHjwzIpA+cbn6Que/Bi0a8BRsLaK6tXg49zYKW5OEVv
	9VNh80V0r9vJYEa25f0lfeducnyhcKZgjjGJVx+f1EVGIn4KCb5VQ7DzqLZD4nY1
	spFukf3+LeA2nMeWPvUpbYfcwmerw==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010045.outbound.protection.outlook.com [52.101.201.45])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gt9s5s3yd-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 21 Sep 2026 13:50:29 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pTrE/bXvY0wIcPyEIoauIPm6FALK90Ar9tr45YPn77hZGQBucrq3W3R45koQ0ZCNBXqUypdCTuwRRckVGkylYwVZ8ILNHSMwiv8/UMWTOWdWjqNqjw2QBp4IiLfBBUZej5+LeEIOe2SwZvMqCqRk1ff7VThnbe4G6tdFD2sLJhr/cB1D7BSgB8SJF3NnOCgnZzVbP7cgLoHv21ixmUFxNMJpfUoknyqb5qbwDSwfPuHC1nkpaMn+4QG1V3ara5tyXnZ2h9dn6EDMXHaXVRrj0VUaSlntnS1UkyZXLRCbTRpZ91bMCsOVFfgl/n199FWHz0tIDtt+8zQ0TPOxs6/mKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9iwZDqMcIrOi8XwmfqK+Tu198s21InhV3zrbPRV/X3o=;
 b=UAFKpLZFcFjo3Y0Tc6MwjoZlGnUZLjpo5TJf6umP/vDR5syuBhIf1N/nyBx5HA1b2owTE0GY5U2d1rU4N6f83oQkC3SmoXz+Ru9IVPo9quPc+n4OgOKdOvBa/FCC9Pw+mcDYP7bCt2pD2KRnqCgvgJkaO7Dh+l/QC9eXa4UQXbpKAw/FfKRYFyahEnudnlI2oo/9TykQHsl5BG7yq1sHEGA5W8FfUOsV2HK5Akbpv+OGxmqkiGUFnEqFW2SDzMZK88s0W9DISB5I8vLZr4wsXyPP9TBKFSY4Gn3o1CoXUcNh+YD6tpim1nSivDE68g048weBWH/VreUiKik1X4a8ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9iwZDqMcIrOi8XwmfqK+Tu198s21InhV3zrbPRV/X3o=;
 b=G6hk7TqjM9vGelDPiULnUX0BL4K+VS2oBsWVHRB3UYBwR7elnG8HRUplL40bb040tGtZufyEKOKgUKxpwVs5pH81ipHbeQ7zQzKU3niUD0i6bGV6n9cJMrrYgjBX5TSfvuPgP0sp6GkuW8Hsff3jyevXaFPibTnQ1ka7o7q7MZQ=
Received: from BLAP220CA0020.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:32c::25)
 by DS0PR10MB7320.namprd10.prod.outlook.com (2603:10b6:8:fe::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.13; Mon, 21 Sep 2026 18:49:50 +0000
Received: from BN3PEPF00022BC2.namprd05.prod.outlook.com
 (2603:10b6:208:32c:cafe::5e) by BLAP220CA0020.outlook.office365.com
 (2603:10b6:208:32c::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.11 via Frontend Transport; Mon,
 21 Sep 2026 18:49:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN3PEPF00022BC2.mail.protection.outlook.com (10.167.248.213) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Mon, 21 Sep 2026 18:49:49 +0000
Received: from DFLE214.ent.ti.com (10.64.6.72) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 21 Sep
 2026 13:49:03 -0500
Received: from DFLE212.ent.ti.com (10.64.6.70) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 21 Sep
 2026 13:49:02 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Mon, 21 Sep 2026 13:49:02 -0500
Received: from b-brnich.dhcp.ti.com (b-brnich.dhcp.ti.com [128.247.75.1])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68LImtih3523558;
	Mon, 21 Sep 2026 13:49:03 -0500
From: Brandon Brnich <b-brnich@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <afd@ti.com>, <b-brnich@ti.com>, Udit Kumar <u-kumar1@ti.com>
Subject: [PATCH v3 4/4] arm64: dts: ti: k3-am62p-j722s-common-main: Assign SRAM to VPU node
Date: Mon, 21 Sep 2026 13:48:50 -0500
Message-ID: <20260921184850.3810018-5-b-brnich@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260921184850.3810018-1-b-brnich@ti.com>
References: <20260921184850.3810018-1-b-brnich@ti.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF00022BC2:EE_|DS0PR10MB7320:EE_
X-MS-Office365-Filtering-Correlation-Id: b86bd98c-eeff-4635-1249-08df18111d28
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700016|1800799024|23010399003|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	VZjqzTfYB/FQsuu4epLkOVLEFf0M8pJ32CMcI1Zdncl1DkXn1KJsDas1siw+u6cJ8r+Y55HRCpQHlN/0RQZxILQN9A1uEgz8oPAFIe5/fKqllep27JHKJ7VuDN84QoYuynLsscIjFJJGxSUEEX0rS+WjOogqtBXJapOh6bw33xnPr77kaPXgsH5abzeCGk5edEwhb9ToqjWkPWHtFoADrExS+mwxDt2oW7W8XsXiYQxKpqkdynDaTrGOO0pKqxH8iN4mlq489jmAx4RkqMkOskhBvcHctRDIQ9RLsShWL0pzsDkim9qOvQgtio/ajy0FmpqTn9vuPo42eTSXkaCIWUr2eh9j6CugsM4T0ypQCmUODoZXWAnrTIPPP2mD3D+xioVrwliob0q+Lrjgi3S++P7wZ0wGmtE3RWgcunapzTeMCHFWacNIwt7azv3GQTEREffap4ThDW/2/wE5z4V+icsyrd+3CGA3oIkoklufmmI/neZER2FxNFfPr1+cxYhc93IRhQmTOe3n0x2gqCKU48Dhu6T9DC5yOr6QHgbqt7ZZ8ZZH7wzdfjrNvbPxDoq6/WJyDHMW3LO+efXopEm94iWM6BKWptvT0g5ks9PqVEY91TGxYLi0yrUErVYmM2p1uUj5xrNfMW8XlftH+zxkKNsR7IHUZXvgezxF1iwbvlwSwoC77sScyrkEk4w9SZnMHXTzXjLD9laM9ZQBRrMy9g==
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700016)(1800799024)(23010399003)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ybhWG9bD6cBDgrvEJDjD4JNMXNSFcE8OSR/pi6zpS4lm3jQT6UYllciXUsm6NHb9FSXId6xTwNElf6S5RZDe+YhJScbH6c9dwyevo6yPNxZHsV87+j6OgkgwpmduzyRci6Ro5jLsGBnTpSWTuhJGouPP6UpXDkdlLmYiJw6/NfMGTvCVFK2tsAt9Hw2akx/BDSfDjgx2f16jnii4RH6Emj5OD7LfWZ8Lh0I88Ofa366f8AJWii0gwTWzvdJstao+qNhWQH8b8ilFYE6ECJcOM86e5qMi2uKmdvaV97EoULVbAhZvlN7WPm87MJI8EUUxUSU4P7S9mHfnPdyv4yZGkt/0eyzfsUVqKuPQXbRrZMm8OQC0l4HKADvRH1tugKDu1bS6JuPvx1hSBmA4csNLt1zbJmycvqWUpI4r5ECzHO20ngnWw3cq98bbx0RU7DuL
X-Exchange-RoutingPolicyChecked:
	JDu08YqYDLDR5aBigcT+5vmzPjepeUYRhIoZuHutNroXlX70QAP4h4YFEpK+ED+N9SPpjdZ8UMVrxoJK0lNxjCtuhwKvFeo5bg8zAsVd21cmREH1VgnUxWz9DZF7Wqvb93tbbPtum5KdCYkBNWe6gmTmrq9+jh/we5SSU8/UBqTL5uli1EqG0ipAqfZei0TSBOKC44ND9OdmHsT12c3L//6EwEdLSbh1TCz5Id/+y13c+GaXxAiHSAjzHyFAP2V4zUAf9xYhGmrA3SvtUnmbbZh6ss4e7bfcKbAkVpOEW/ygD/JW3qysLDccpz8PkAKvAECGSWUk4UwH17DymEln+A==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 18:49:49.1435
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b86bd98c-eeff-4635-1249-08df18111d28
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF00022BC2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7320
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDI3NCBTYWx0ZWRfX737XuQ8ytyCv
 KAP4q4Ed39F/kp67QC95CRL6LaHthu99PMiJ3gpd9N34zjb55GEHzfsM+vFxcEpS3BQFaigxPMS
 gb5Ant4hYR5zCgNRYzKLuaEavvk7dt7qK+dodz1sIcJTA+71MmGOl36PUxZPI1CN9KHuiLFfrju
 CdtCZ4G/dUItvpYjP7Pr5lxB+GBMjFi5CAhgTvy8e8mGBZ7qADNzVSAAESU4kV6hBgBLmy8frOV
 jDw1F1gAtEXYK9WdYF00YMfxn4OczZ74add8dmMuUZBAw1enAW/J5N7mIQhrYcC8uHbdH2853Gk
 MGNLxgl1ZsGCH0CXfr4vHUnGJuklsO1P5MoQ/5izw/6xBBgPsdb+N3jTzO2Q+KDLqlni/7mFFnN
 TADIDGsaIIAXRHf0ZDh7FQoJaKREy+rp6ivdKBeI8Lg2/Nzr5MOOMTQDI125m9fJ2BlkVFemn2v
 afMJHycj3U9sFsILeHw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDI3NCBTYWx0ZWRfX9LQLWbwOxbgF
 1PEPDu0f8P2o5MIn3bhMtq7USWQc+UDVTom7Uf558Q+UEQdlaCQkCfEMyIIXwoOGKqSP7QWgTwT
 5k9xil//OEIeFEmlLrlbR4MITIbAH+s=
X-Proofpoint-GUID: BL-Nva1wZAdbPbbq-HUPbZgXQWEnRjXS
X-Proofpoint-ORIG-GUID: BL-Nva1wZAdbPbbq-HUPbZgXQWEnRjXS
X-Authority-Analysis: v=2.4 cv=X6rHu2Te c=1 sm=1 tr=0 ts=6ab17c75 cx=c_pps
 a=yOesU4ZViNrJhpLvMmxu0A==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=fPAWb5peG099m5CrUpKH:22
 a=sozttTNsAAAA:8 a=s826d0Vf4ljoQKYSzyQA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 suspectscore=0 phishscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210274

The Wave5 VPU supports connecting to on-chip SRAM through its secondary
AXI interface. This allows temporal buffers to be stored on a per-stream
basis, reducing DDR memory traffic.

Signed-off-by: Brandon Brnich <b-brnich@ti.com>
Reviewed-by: Andrew Davis <afd@ti.com>
Reviewed-by: Udit Kumar <u-kumar1@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
index f130c7cb998d7..61e3588bbfdc5 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
@@ -1117,6 +1117,7 @@ vpu: video-codec@30210000 {
 		interrupts = <GIC_SPI 225 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&k3_clks 204 2>;
 		power-domains = <&k3_pds 204 TI_SCI_PD_EXCLUSIVE>;
+		sram = <&oc_sram>;
 	};
 
 	hsm: remoteproc@43c00000 {
-- 
2.43.0

