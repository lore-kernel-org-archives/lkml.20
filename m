Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9EE92DA749;
	Mon, 28 Sep 2026 03:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790567100; cv=fail; b=A4+OpOd69Cqa05xAAMsa/rJXhCKwRvxZ88DfwqK9jjVmduCewHQLkq3a0WUAtBNoURHVkGiiyA+Z9VKeuhVYhpeMKyKre1SSw5aFPMeG0Y8xZaSMpx4wWEeP9vn1QCyzEAiFdrflWVHXRwocY2mGyj1GW1KXCsERwf8bRkzdDOw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790567100; c=relaxed/simple;
	bh=pwCJgc9/93KCYtWQgAbs0YVH29KsgLEGrBDoDQ64PKs=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=JBW/dIDxaFHFHOyq36SVO6YkMTbt0LXVsAKXvoJV80Pb1HRdRb76OD2v9Wtz1mB1w8F8BaylKHUIXA3t4VWti0thsQ3ZuCuS+cQCJKHJl1smmIFbjOcyHWmTJ1/7JJtWKmve/9aEvjbpdv6sDQVdz/7mllh6i+zGo6u6CqH7axo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=Vtur7KqP; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=xEij7+FQ; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="Vtur7KqP";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="xEij7+FQ"
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68RNuHYM2775738;
	Sun, 27 Sep 2026 22:42:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=LQf+6tTm0xmSE
	eedUWgy4jPWdWm7X5aq8dSyLlNcrf4=; b=Vtur7KqPoQNVjcSys0vA3U0D74mfE
	n8b3/qtSVCEVMZX/NORt77ACgz634ohc9DjXALskRvPsVRCN8eYjjMTccgY4HT2B
	t/ecJ1XeaE2jMjFVyB3s3E7Zrm86376amAFYSkxl1/jzJzERSAELMIAmdTcFDvQi
	N/U2kknSnB+Cnfp69TB43GWWnP90mCKPq0nsbwfqNQU0opv2QVOFOn64uV+yps+m
	6V87gE8NJ0vAblvMlI4tA+PpEo62lpZYz1XEAjoFRubxBm7vCQ3va/53n6J1DATV
	Fk1byc8fkjZgydYqTWoC7cwFKyhaMKO7C3HXbhKK6uQ0pfJ/WPh0PJ5sQ==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012010.outbound.protection.outlook.com [40.93.195.10])
	by m0380145.ppops.net (PPS) with ESMTPS id 4gxy2nkbu5-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 27 Sep 2026 22:42:28 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y3PjDZoNew//bYOwEaHrz/zu6Ysh4k1ECvxYIhov8Y7wZVGMpM3vFkfygnc9ezb9vdmxJNY6VILjSnKoLaK8RZpc3n1unBYkNuqQXwfzK0+hJAnA81rz1dTfM5ig/SchWHxzFO+G+csM6hcTxWd0z2JtYNpWoovh+u3IjfB/Vsg7AoGSswT/6hTkKXNPZkiciLQ7LuV0qEHfWzFxLGJ935KC5SZbn6F6bKJf0btTBJUTvEeRIoWcQ83aRDFOzwf1k+nvktIWT6/qu3TFXhTtYzcLOWies162FwQBPSmVehGqsy/uZtnWPDiHN9eHrHiC7qGbQJbINb5zrncZDOV32A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LQf+6tTm0xmSEeedUWgy4jPWdWm7X5aq8dSyLlNcrf4=;
 b=flDmV1WKpj8lB+sjv0UwJJda44ARxfsjBQ302BGoVCAvm6ewNxCq9p4HXGOmG/ZlvUhdXLIl8kudNtOF9tm2V/NlWTD9NgD69FPP4t7xWkaIiu3u+BQFy7EF56EpJ5Cl5FHckYNPXT8XWgm1GP8ngGcAT6MEufiMl15WAexEQj7p+JrUUAs1xh0lsGJEKKbRgrOsEo7nTzTJUy5ilFOWlhjclQ0uxoxHg6/ke1pypIfD327SWGdmrggO3lHVFy4xRIqawJYZNCFkUZqREG9n5Y4B2MUhR2ZXAkU9xTKf0hn84hQT+yQgN7MGiZ/KbDe8uI4hFFO7T4P9Bt2ZTq8L6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LQf+6tTm0xmSEeedUWgy4jPWdWm7X5aq8dSyLlNcrf4=;
 b=xEij7+FQpXhM3Lx04OYlRPy053YxX43Ik3kgehhMfKMhT9ysDDGgWClfjnDSp4Qdd/iv11VSrSVXkv7ISVopI/ntL3+ho9SGxCO0P8zFq/zJkSYc6T1PnR0wwvrcuNQO1eYy37IxvpuUiP8fvrTy/3I2YUpVv2pIHuLjQbwQk/Y=
Received: from CH5PR03CA0005.namprd03.prod.outlook.com (2603:10b6:610:1f1::24)
 by DS4PPF66324196D.namprd10.prod.outlook.com (2603:10b6:f:fc00::d22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.7; Mon, 28 Sep
 2026 03:42:24 +0000
Received: from CH3PEPF0000000C.namprd04.prod.outlook.com
 (2603:10b6:610:1f1:cafe::c) by CH5PR03CA0005.outlook.office365.com
 (2603:10b6:610:1f1::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.23 via Frontend Transport; Mon,
 28 Sep 2026 03:42:24 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CH3PEPF0000000C.mail.protection.outlook.com (10.167.244.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Mon, 28 Sep 2026 03:42:23 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Sun, 27 Sep
 2026 22:41:21 -0500
Received: from DFLE202.ent.ti.com (10.64.6.60) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Sun, 27 Sep
 2026 22:41:21 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Sun, 27 Sep 2026 22:41:21 -0500
Received: from uda0498651.dhcp.ti.com (uda0498651.dhcp.ti.com [10.24.51.254])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68S3fHEw3232462;
	Sun, 27 Sep 2026 22:41:18 -0500
From: Sai Sree Kartheek Adivi <s-adivi@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <s-adivi@ti.com>
CC: <hnagalla@ti.com>, <jm@ti.com>
Subject: [PATCH 1/2] arm64: dts: ti: k3-am62l-main: Add ADC nodes
Date: Mon, 28 Sep 2026 09:11:07 +0530
Message-ID: <20260928034115.1084840-1-s-adivi@ti.com>
X-Mailer: git-send-email 2.54.0
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
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000C:EE_|DS4PPF66324196D:EE_
X-MS-Office365-Filtering-Correlation-Id: 8157bc29-0f22-4e67-325a-08df1d1281ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|23010399003|36860700016|1800799024|56012099006|10067099003|18002099003|921020;
X-Microsoft-Antispam-Message-Info:
	aDI/6f+oZ3OKS50IHG7JQn8jLiWQOOpYlWGP3d1bua2nPc5x0zmJtwWA8XyIVX9UNfwv2QGzznJe5znMY3wK44K+S5pHZzdV+vZQ6XjnCgP7tR5feHQUtLw9LXLcpsNYtGtFaICm7/1bzv4kUF0qEFstcuB/EpJ9U5GpJu0cKopifXNnXrIziTKFoWfwvGD6rLcEFsJGbX9Bvvf2YfFS4EiJe4vDjvlRVygdME4W37XCC+tPaSdVsOHNnN+aJ5q4GV50dKlkIjus8zK5PbbFV5VhOftaqDYIl4QeNRceqNYZe7hRPnBiEXvMV0mptzOwXDJZolWUXH3VOtBWrJgtk7yZ25dwR6LQlTKDuJfj+cJasGCirKUhLlRjfZLLZOrlA76VPpqIxWkgXRw5cSrup3a3GYNNOZpJrCVGFRiZrUVag/BdLgUxkqu5xFJECfJq3fQfd31lJQlLuD+XBV2QdHmd9fdMuWzra+hyztLZHdR6UV1Ty38jHc5CcKj+iZlTdnDCVWafH6rkRdVn3ozB3K40Fka6JeoZCYenwdEIHKvYG5N9qnCjZuB1RUsdiBgi9M/rcFHDvKykiZb6D0qI6dZtXOXTNhATRn/rivnDiuJFRUM12Rpl/qrud+H20NZYtAUlUVFHsXLq15HmH4TbOWosYBOdNbY8EiDW14Tt3LN1DmT7kD+UsPZgW/YqjiyDLZ1Fctkr8thmbkQbpUPfXIaDEnjdOiUFKoTQLIgsQhW6ARz3hv60sd/V/2LFS9W6
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(376014)(23010399003)(36860700016)(1800799024)(56012099006)(10067099003)(18002099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	x/k8GDkgqQWUvKi0s4I6vCqUtq9mi1sEgBoIXDEQWugi8ehJEvWNai7UfrX71q0VNrMS8sShZd/JV7q2uK2YeRAWOGOOmieqxqheS6QGsEAaIrc29xQd27flqj+xp98YdaYBLNShetKE1HVVm9fv5MUGjyVz4Ta+IGYiaHCRo6bjeVK0oc+ebso/T+SD1jqacxvSD1UxczQ+91tTTSs1WYVBS6QlDzQ7FQiquNcuiEnzmcD+DGdm9jfBsQGCWI5GhTZfO7RcbnebgNzKHAdXZjQcc0nXhK2KCKaRntWWr9aZl3aR7MuuuR3qzmXrQywazmfJFVrlWBsdr11p3dkEt0NqiYE8a+9dViwxneOTv4fJeecikBLiwcoaQu4akNiRoXW2YA9aK2Ign9vxBagNqtFjGjJlP9cIkKDvnWJ38QZzYc27hGEhoBedc8dNLNB9
X-Exchange-RoutingPolicyChecked:
	jM/pQWaIzjCdqBRsXLk6oI2f8SlrtQm1vbd1cZCDUumutqQ+FaDJcbMJrtrsRABdm/eAnR26DjleBjWm49S8HMzJbh3SchlC9vVfAm+XyPlHxMEz6WEZfGB0UXXOBrR9IASkIcSXe9P9LPLNo5rvr6H9THE1OurKNcsvQKybc9FEIBTve6P0kATh0ZvFIUsm0YDArfOCnhdrOVpfeeObUVGM/V4TrvfpTZGk57+nVhUKi0KDqEVX7ci3JiOCDAMGLRFE8n/0OC7pPQaA1Cn+V8z7wwcqEcHjxedBJkhn3kXz+rHLBxhzQ2a4sVbvtKRV2W/0Vj7b9/LDy4/nP/0wRQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 03:42:23.1184
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8157bc29-0f22-4e67-325a-08df1d1281ae
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF0000000C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF66324196D
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDAxNCBTYWx0ZWRfX85RWvHn5uX2a
 /0ikleKML+tH5D5yyoqulQc0Bj0ICshh+Y3d6DbprOZgjU1UhQxRQnbUZt1Vk/D0ib12PtozigA
 12Ovg3/HDStNcibAmiVkIEocrZjQ1R4=
X-Proofpoint-ORIG-GUID: bFiz-sJc0Hq1VqNu6Srga-LX5xNX_Urs
X-Authority-Analysis: v=2.4 cv=RLgmjIi+ c=1 sm=1 tr=0 ts=6ab9e224 cx=c_pps
 a=78/F3YNzMekUCeQDO2i9lQ==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=gO1vWkAQAl3rybz1DQOp:22
 a=sozttTNsAAAA:8 a=1W2rOTGOtkH3mYmU3pEA:9
X-Proofpoint-GUID: bFiz-sJc0Hq1VqNu6Srga-LX5xNX_Urs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDAxNCBTYWx0ZWRfX8+LS/vu5t6JK
 oyTl6lIAQ9D8R8jdNe5eZBD/CgTKCGG53RB7w2peQMXv0yjLMReqGuRQrxPGLzjkMmpUGkpcU9X
 ZXO+8yrp08B+o0q0gg15EN00bQ+vgrTLZwXz7RjxulN/+mJY5DwUllAYvlRZP/XQzCfMWRtK849
 xdQzhIqle7zJMl9KnjthfnDVWxZbhGPcRBBVqbgABn3iFvbHfc3JnRuKtiqzAUCeXOALGBzYQrb
 7n+3R4OhofyXF3eE54PX92bQaZYe62uwVN0HJ5NCEkCf9WzWnFyTdvz8h86nD+OYyWsyEgmjCI3
 oGoGTqHQYxjGNKFEPaQ5E0hoAB7+mYK9kT28UP/ej2HNN1L8EuqvYuImUpjhdPONpr2iZgrnmhN
 zuC0iIUKDGuJlODpuTEo1wbvdZ6vvzNTVj3fJvMoDn1wqguC1M8Ki61HrE0rzHFymm7Cffem4um
 Kg5LQCdDhhLAtKiP4bA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 adultscore=0 suspectscore=0 clxscore=1015 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280014

From: Judith Mendez <jm@ti.com>

AM62L has an ADC in main domain, add ADC node in the respective
voltage domain file.

Signed-off-by: Judith Mendez <jm@ti.com>
Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am62l-main.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62l-main.dtsi b/arch/arm64/boot/dts/ti/k3-am62l-main.dtsi
index 80615ca1e01a2..70157981aba5d 100644
--- a/arch/arm64/boot/dts/ti/k3-am62l-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62l-main.dtsi
@@ -544,6 +544,24 @@ elm0: ecc@25010000 {
 		status = "disabled";
 	};
 
+	tscadc0: tscadc@28001000 {
+		compatible = "ti,am654-tscadc", "ti,am3359-tscadc";
+		reg = <0x00 0x28001000 0x00 0x1000>;
+		interrupts = <GIC_SPI 253 IRQ_TYPE_LEVEL_HIGH>;
+		power-domains = <&scmi_pds 0>;
+		clocks = <&scmi_clk 4>;
+		assigned-clocks = <&scmi_clk 4>;
+		assigned-clock-parents = <&scmi_clk 2>;
+		assigned-clock-rates = <60000000>;
+		clock-names = "fck";
+		status = "disabled";
+
+		adc {
+			#io-channel-cells = <1>;
+			compatible = "ti,am654-adc", "ti,am3359-adc";
+		};
+	};
+
 	gpmc0: memory-controller@3b000000 {
 		compatible = "ti,am64-gpmc";
 		power-domains = <&scmi_pds 37>;
-- 
2.54.0

