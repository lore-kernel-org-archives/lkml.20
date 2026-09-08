Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D35912D3727;
	Tue,  8 Sep 2026 17:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788887259; cv=fail; b=XR4Pyhuw4VDHo7/XzKunaRDCFyv/u8RdVv/Eijr9iCA2+n9tQxalvKUoj5FhUYc3MsdqAbtMWMrnEp7X7gSc0j4L+l86EVGRFyuNBE6vOJWg2Jp+o3gGRkiz0rBQDy1mhgv65IwHiCMyPzOTqBOly2C2pPUVvI9Gdm7Qo7zGFo0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788887259; c=relaxed/simple;
	bh=OIVx9s1riWx+UqHLDTsfy9bVYljiqga492giQMeC3rQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=bbybdklys03TqkoM1MIDa4ewcQ6iYksTj7gP1X8e9yZ2EPCTYOotDO4eRhpd+w1btHPRk57h1zQNi617/kza7H0BLZlKKXLQXf+n6BxN/8k3iY21FYVh753pn0H+mNxti1UavBLn82YbK7vLaC6MXQtWYSmHbMTBU+jWX4gfB3s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=pdGkXfB0; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=a4WP7O+I; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="pdGkXfB0";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="a4WP7O+I"
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 688EkPfO173220;
	Tue, 8 Sep 2026 12:07:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=WJVyonQPf03US
	X4RK1at4qTPhvvjwTnMfMX3BXM7FEc=; b=pdGkXfB0jTlL4+q2U0+7pYMSHAEur
	T/yxsHJ/q9oj2BdN8f+VsVbW0+muvfWTjI79oA5ZzIz+GMaoe7STyjKfWPpDwxxu
	NNCy1lTopAtjTEZ7Qq8ErnadQGvq9ZsxFqqrIFkK3qAr2ivZ/YbRb05711mKpcQs
	a1USrv3Hb8dPf4Se0a0nlr4PIC1GIOwz/fI4hVCXBwJ4rDoaRXA3JlShler266At
	bz54JqVFif3nEeLjVAfaZHDI85k5wwxbikjTKRExzILEES4L90bBB7HX2ZTUAG2H
	cg2VP8Rd0PCYRcrYAkrXJmNdvmk9VczI+Ru0wNV51+lDJqs27ohwBzxpg==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013016.outbound.protection.outlook.com [40.93.201.16])
	by m0384305.ppops.net (PPS) with ESMTPS id 4gjkdmsjnr-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 08 Sep 2026 12:07:32 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X87UTHjXrQK+ebvQw89GPYtTgUVdCd2sfo1EM61HFNexSVjfkOMse1tiCaGZMU8FYKONZJ42fufgj2eW/oNn2nffN7OBksdJMGNP86yRVlc2L5bREoujONgLc8L9uf+PDyrmhUiTjMu7bimY67MGH7jhRZ78bUu7hI6YX1PrwiMWChqmBq+ZunqnGtyKWjDhaHlWGrbNCZ8dZCfsYCzyfINV30VTS84AQNFadxbc+Fv1ouT35KH8DqRQmMfa7PSZw78gBN4W2C4GQcRlZ86pulICZaI08+pOy62oWbET+sA0bHEYray0IDL3enlddOVFHGyeqjGED4o/Obk9vIIRrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WJVyonQPf03USX4RK1at4qTPhvvjwTnMfMX3BXM7FEc=;
 b=UjKWZ7gAJmUUfx+HENqePFpgtsl8Nhb1GrKv+E2HY4tLCc1TdWdzDY+G+juVz5LuHB+gh6P1fJSiw4nFl21+udr67ZSVdsUahreWNeELIdEqViaTp2zdFT+CKaOxsjDQ2ztfmmKbEO5aWbnpjGjaxtenBs2R8WiPTmoWW/ps4I4uIECG5AEeD4fofHqVZmwPTAMJVnP+sJFplt+KFdNquNQNh+EOTeqHd9PrdXEKJbVt1mIP57wsVYD5y8/rnYmqeugIqG2PhHIYS7Uc3NnAQWzOzt1/xS4Q4vd0NBDRzSBQdMCZvD18zM1+XMeXIswvBxxJLGyYHy1wQPLg04Y8zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WJVyonQPf03USX4RK1at4qTPhvvjwTnMfMX3BXM7FEc=;
 b=a4WP7O+IKfbN9ZWYJlRWeWwjCTxCBRNt4hjS1f0vEV7/Po8l2jVosEGEkrsOXPZ5ZbAxnNi3jm0kMleocqG/PnOalXhu43JX8HvKfO1FQVTsqPS+I5Naf/82M06k5MsOGJ2UM4Cbw0F1V7CWzcmPaxhkrCUk8+wfGnkEz93Fpyo=
Received: from CH2PR07CA0043.namprd07.prod.outlook.com (2603:10b6:610:5b::17)
 by SABPR10MB997941.namprd10.prod.outlook.com (2603:10b6:806:50d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Tue, 8 Sep 2026
 17:07:30 +0000
Received: from CH2PEPF0000013F.namprd02.prod.outlook.com
 (2603:10b6:610:5b:cafe::35) by CH2PR07CA0043.outlook.office365.com
 (2603:10b6:610:5b::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.6 via Frontend Transport; Tue, 8
 Sep 2026 17:07:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CH2PEPF0000013F.mail.protection.outlook.com (10.167.244.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Tue, 8 Sep 2026 17:07:28 +0000
Received: from DFLE215.ent.ti.com (10.64.6.73) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 8 Sep
 2026 12:06:36 -0500
Received: from DFLE206.ent.ti.com (10.64.6.64) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 8 Sep
 2026 12:06:36 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 8 Sep 2026 12:06:35 -0500
Received: from hpz2.dhcp.ti.com (hpz2.dhcp.ti.com [128.247.81.105])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 688H6Zge2860316;
	Tue, 8 Sep 2026 12:06:36 -0500
From: Judith Mendez <jm@ti.com>
To: Judith Mendez <jm@ti.com>, Nishanth Menon <nm@ti.com>,
        Vignesh Raghavendra
	<vigneshr@ti.com>,
        Tero Kristo <kristo@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH] mmc: dts: am654: Add 650ms power off delay for proper MMC power cycle
Date: Tue, 8 Sep 2026 12:06:35 -0500
Message-ID: <20260908170635.238775-1-jm@ti.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013F:EE_|SABPR10MB997941:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ada7a58-bdd1-4d6e-2e40-08df0dcba9c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|376014|23010399003|1800799024|18002099003|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	Cpg1deoLOARZoca91uc2oWecabNfVKEdrH6tLvFUWE+/Q6o+GJi8L3PQ9Q1PblBorURdeQCYm6DfNgeKB+m5PuxQLLDyuqgtWd+Ay/nlKIpYraPz3+f12uVNjTX8TEWSbGzi5dzrAa5xCE0tWBPjrYKU3W1cQEgvO8ILd4/PUOSBiYT+HPnnucExW2bcuqXjy51BKRueD9MZctGALwN9e3wqitQt8fyclQy2wqqBoQW3hg+a7ARyikExxdl7cV0+SIGQwH3AI9UDmxC1PXR0u0/Z41s79MejmJ986UeQpv64oC3TT0TTSn9jUb4L76xJj124DhBJJQFYR/V42jF5UdHrtpnRWYKDazD8ke+IeWjoqplrN5pys7MQ+Sh52lNFCxyBRr9h2Ik9u/vdr45yRNq113rkD5Q++WAyPySReKgetmQmcYFJ4J60dXGdKIg191H8CmVHbbeqOUfeOWAuJz9T8s31fBs1gI7IS9VU6xIPqtAwbTJE/bldkGcsh4rYg1IkVd0dhVLrCod1lw/BqBFke1Z6VKz1yxQf9A54v2ThWRoj5Pn+XwBMO6Uh4oXn30Z5mhjhECqCcYtWD7Emf/IWBfh4u5+iulmjIg8+KJqV6bOEgFdQP73wiXzHzAxTcfH8fV6wAtWFl/ml7aD4wRXFPgOASXDgR0VVG1sqY4IBpDvFQ3VG7LFRs+l0yQ+F
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(23010399003)(1800799024)(18002099003)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	DYQGsQhsS9OQ0L3t2yMdiCtms7jHrcIzJzDymYB+Li2B4B66EqmXtFxPQiRlguqgCmGsJcyJRumJJvDcZ1bZyBku8/O+0e0xeQ4vQhK8zNJ8U8XzQBDJMBajMKfVU0dMJnZ4pVS3aAE1gIFpb1x1r/fMyqULUnrbbuzBahD4Tb9e8J7FDiVF31ESUWxkS6i3e9aFNTg9R0HYnN7HCgZac6AGZgemIwYx0S/Q02pZupjiqLkFHG7z9VJfQ3keRdVMJF2nDLbjUQaBIfY3W1muM6O7zYew40cZ/Q0t6VAA8pLlNas0DV0Ge5QsbYX8SNjVOYDflehIBn7AmlYh9r2BwUjOKP7nGT8QpocMgqFRVyr7Gsgd3CJbRM3IcegWLBGEcrVEuzJAMZ10I87Dm8pKbHsH9I4V2tbXilmuYkiBrJZTbWFBikeesnyCERBIM3gY
X-Exchange-RoutingPolicyChecked:
	apHKN6TvkqPacjSLu9a1WcbqhY/mujSvLFHIAUIeHbHgY6QUepwFhUqtT14RhN3sdU/trQ7MoaEFimDt8i/5OSUpedzYYF0VD8W7Tmb8bAdNSQZxLFMzI0MIr/mxH+lA/gjJbVOIckGxnXaJ5e/LuxaCVJd7VVZCWPlZZ29OqwTUSQ1VAvAdvw/w1cMgdaLFX5qTqT7qW/ju1wJ79NFhc/HzRniz6ZgsfXhwLloqPqmjmEMcJ0Ose2DCaPk3gL5ZQaHY5LuymDPJZu52W6Uxt9dAaI2N7PZkoUfTN6LGmrZZNTQDk8e9YCvdMXj/Rl1cozeLED7yi1O+vOiJzzU5sA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2026 17:07:28.6937
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ada7a58-bdd1-4d6e-2e40-08df0dcba9c8
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF0000013F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SABPR10MB997941
X-Proofpoint-ORIG-GUID: CXEZsjyKlNjpwlyvkahlkaPmE-Hh_PlH
X-Authority-Analysis: v=2.4 cv=KpZ9H2WN c=1 sm=1 tr=0 ts=6aa040d4 cx=c_pps
 a=YOgfsySBG6Gh3lLixmEA+w==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22
 a=sozttTNsAAAA:8 a=lUCeq0Dp3Nc7E5BXnPwA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDE4NCBTYWx0ZWRfXxH2IJKbJ8uQe
 tX42dF0mE7/r8t94iVT448geuXWr0joA4m8asXKn+5J99QgQtDrItoQY8rxdlUk1ucok8JYFf79
 TjxQyOjQg8aExv0mg+BuIeJi2N15jvc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDE4NCBTYWx0ZWRfX1HWOrPq7YVsS
 jTmN2nmvWDLAh2oJn7BGsjkYoYUmSyxIHqieFbjJptkjN4IhmJ2pzzd40tykguhJ5YZnIuXOARh
 4iRKw6P051GRtn9/eS8iLmOmeJfbpolLiYxAWlNTM9WlfOiHBN1BDGWP9rFEueyCaEhYZFYf4Yj
 kn4UOVDPk17G8l2IhHWC9KhQ67JUVFU0XTFKmwxSAg5VMOCIpO2/7hF02oobUge1iZ0p5qMyG7h
 W2a1QyRFrIsj73+BCdk5v3+RF2oXw5oXIq+lve666/+JiES+ffjYciMtCsDNUzL8+phj3dvfl6v
 SR6SSZrheUiDfTn7qpQ7md+uyucpbsGwJ26vTaFWXpOyMrKM0F63KE9vm/HVpOjyv1+zgc5cAQI
 vu56z+NFX/a9zILJT68lfSNZPH9i5Qc89F91gDOPtM/TB5jnqryqD3Z6iIKpDoQUHvEGrNhvWTZ
 +NW8YDTg4kCV/l/3zwg==
X-Proofpoint-GUID: CXEZsjyKlNjpwlyvkahlkaPmE-Hh_PlH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 adultscore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080184

The AM65x EVM MMC1 VDD rail discharges slowly through RC circuit.
SD spec (section 6.4.1.3) requires VDD < 0.5V for minimum 1ms during
power cycle. Measured discharge time on this board is ~632.97ms to
reach < 0.5V threshold.

During boot, MMC power cycles between boot stages. Without power off
delay, VDD doesn't fully discharge. Card retains 1.8V signaling state
from previous stages. When U-Boot initializes, card no longer asserts
S18A in ACMD41 response (already switched to 1.8V). Host misinterprets
card state and forces 1.8V anyway, falling into a bad state and causing
a boot failure.

Add power-off-delay-us = 650000 (650ms) to ensure proper VDD discharge
during power cycles, allowing card to fully reset state between boot
stages.

Signed-off-by: Judith Mendez <jm@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am654-base-board.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am654-base-board.dts b/arch/arm64/boot/dts/ti/k3-am654-base-board.dts
index ca1300e130936..edcf039ccfbd0 100644
--- a/arch/arm64/boot/dts/ti/k3-am654-base-board.dts
+++ b/arch/arm64/boot/dts/ti/k3-am654-base-board.dts
@@ -460,6 +460,7 @@ &sdhci0 {
 &sdhci1 {
 	status = "okay";
 	vmmc-supply = <&vdd_mmc1_sd>;
+	power-off-delay-us = <650000>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&main_mmc1_pins_default>;
 	ti,driver-strength-ohm = <50>;
-- 
2.34.1

