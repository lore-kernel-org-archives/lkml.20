Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C5113542F6;
	Mon, 21 Sep 2026 06:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789972535; cv=fail; b=iz79FO47XZYF76bNQ29e0vcSPMwAIFbliCZSXXquc86KOOsaxisB6cleJDRstb/vngkRJNCwr5PcTQEIL5qdwyV5u2WjP3YuIrE1LC9VlXm0kwHohqF7pujzZfT74ySgMve5zE1IbLDSX9P/c+8PAYCK+4ZrlqrRCzbDX/Ea4jE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789972535; c=relaxed/simple;
	bh=TrK/NgCE5AcXGhHcCTAxHZd6eYtbq16bawMRszJAfMA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=guZ2RWt8CLCnHQ2H+LElJXUhUt3tZ9o8CUleo2l+OYB4RHA0T++VygbyEM2m57YBidWJgq7VM3MicK7vorqxnHQxkqwUIvB19lLh0BgHlwmRf0EpCXgKCMdnLj9CKx4qCHX1cG3x0E/hnM3redQOimzhwOotrDBewIFZ6TF/zaY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=qAxssB3E; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=L8DE6czZ; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="qAxssB3E";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="L8DE6czZ"
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68L3ZbCS4049209;
	Mon, 21 Sep 2026 01:35:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=QaQFJBupYn8a2
	JRBQy+mTeYlD2vfa4TeC3icNHYznjc=; b=qAxssB3EN1tgXGfhteVQDl8pNytIW
	BAhtYOEuPjxiN1FOYv66tBn8XNQQ3zr1s1zOb8XmL0v9WhS9/Tms3UfrkuLzm2PC
	KXGJzY7/ZWzbDsRyvqpyqoGBG148KxTBDT7W4scBe78YOzaW9+/u+eBZJ1M73gUf
	8WCJb19lSti1ujhHPPZV+K6Rbq5K7zseVUXUTJMJpI0IFGsDRoXsDKi2NmTiCJmB
	t0JcatK8CHclmJ9OOxXBzewyGCgEI8o+ou0A3DkfY5+wDHYgM+mttXHT7uaRxTgQ
	9K2pr6Pjixobaf8J+NUaHQwW5Sk2kdx5Rzu0Gr82WD79gQ1ZnjuuR5lgg==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010051.outbound.protection.outlook.com [52.101.56.51])
	by m0384305.ppops.net (PPS) with ESMTPS id 4gtcbnmkcs-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 21 Sep 2026 01:35:20 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IbhD77TRBuU1yQWAtuY7c80i0gtuQiVOfeBG+yJzdRiPcyaa+6d+GwSFQCPpd37qKPvzdYOiyqLMvOGIMtlweVvY5mO8g/C0p46ebGPRCdHQhAaQHjsXPHPqwuDCB3xcsKunLgPKbJbeLpQaCToYOKq8lNqZB9AyQDLgDrsX+PqUeqJcQTL62hMl0ZF9BIANTi7c+289ek4jhQtFpMNlcZeeAMBCY0GEU2VwSdoTFF/3ned7H9kYu0NyxyMyktONiy9OtKRIuKyke+grS7xa/bsh+oI9QOn98v0VTG7MqfNySHZc45/Zv43gGSScAk/TG8BlRN4k2DA0pabHYorCPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QaQFJBupYn8a2JRBQy+mTeYlD2vfa4TeC3icNHYznjc=;
 b=rNRpcPjuAO27UP/0BgVrCV3LqUkFn6JZLArSt9xX+ELaQbqjVnK5WnKN0yt2cXSUTu4WuaESZ3yyNJxV9gDlRyFq+R/yUJd/osv0n5k32aE7uIQErWUQfy82LhDCJje0z6d5S2SY5SsgQB8er7pyjKotJt3Txh2IW9+7HsYjqyhLwrRO0UqNJ3+fxHM/HtSjpYiIwHOhRh055gvbuJHgsmlYrh9KiGz19LJ68uAfwQyOpJrYsR6AqoiDQek5n7ijUYs5purfhTW40AMozz7433VJeEx/L28laTCBkTuMPUi2Yzu89qcZKaM6fdimZrOa5RHo/MbfReouRl0bc0N/Iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QaQFJBupYn8a2JRBQy+mTeYlD2vfa4TeC3icNHYznjc=;
 b=L8DE6czZgOmK1SHGAg3Rg7nYUlhpB0pa1wjkUQR3rMKWYoDduVMkjSVPUOWHvgBLP43jwsk06cDbNdwWG33aeDEPrnpaXuB14s/PhLoLGKGjaoIexM7X0GuKHnt+2QCGuEZot5QeeyL6z2xlU9dzb97jwDIBKbk7px85wdw6Tyw=
Received: from LV3P220CA0021.NAMP220.PROD.OUTLOOK.COM (2603:10b6:408:234::13)
 by SA2PR10MB4410.namprd10.prod.outlook.com (2603:10b6:806:fb::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.5; Mon, 21 Sep
 2026 06:35:17 +0000
Received: from BN6PEPF00000072.namprd03.prod.outlook.com
 (2603:10b6:408:234:cafe::2d) by LV3P220CA0021.outlook.office365.com
 (2603:10b6:408:234::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.12 via Frontend Transport; Mon,
 21 Sep 2026 06:35:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BN6PEPF00000072.mail.protection.outlook.com (10.167.248.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Mon, 21 Sep 2026 06:35:17 +0000
Received: from DLEE207.ent.ti.com (157.170.170.95) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 21 Sep
 2026 01:35:11 -0500
Received: from DLEE214.ent.ti.com (157.170.170.117) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 21 Sep
 2026 01:35:11 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Mon, 21 Sep 2026 01:35:11 -0500
Received: from akashdeep-HP-Z2-Tower-G5-Workstation.dhcp.ti.com (akashdeep-hp-z2-tower-g5-workstation.dhcp.ti.com [10.24.53.39])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68L6Z7xd1510900;
	Mon, 21 Sep 2026 01:35:08 -0500
From: Akashdeep Kaur <a-kaur@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <sebin.francis@ti.com>, <k-willis@ti.com>
Subject: [PATCH v2] arm64: dts: ti: k3-pinctrl: Add virtual GPIO select mux macros
Date: Mon, 21 Sep 2026 12:05:05 +0530
Message-ID: <20260921063505.3986565-1-a-kaur@ti.com>
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
X-MS-TrafficTypeDiagnostic: BN6PEPF00000072:EE_|SA2PR10MB4410:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c546c1c-dcaa-42d4-4db2-08df17aa8062
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700016|23010399003|82310400026|13003099007|6133799003|3023799007|10067099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	tEGLzC2Oev0QvErssvIA9wajUjfEqumqY5gEeRxB5tWgXITTPgNhTSWVvvGyS4t3WxX8y1G9H9rKaNkLpAC6XiMRfY/1Br/N36lOliU1P72PUDUW6H19CvtAp6YJHWPtLPAYGLxwN3+fSqLm0MAQ+27mbI0nsY3gnqKRH/HU3qWvUc+WjgUPeFBiw6nbES03HvBa8JafS9CrhR2ayeKV2EiNEErmJV7WyUaWnusxC1EtO5Ketyi5f6oXR3QQJY9yBsbDTE8QGlGc/rBff88qP0/Mcjs/GHus3k/wSRZxSW45v4iHQJmpXJ5WPPYhRQ8JtqYGBGewFs4F6zVUTcNIEFHuGC8wv4PvROVS98MGjfUb36oUmxlufpcgNrgTIxd6jH9IDJTdE5LREpt5JzHZLJ1uJZrP37lpINeUXIaF1ysxS4P5FvRyYOEG9sSRRC0bcMaj7EH7OJRaxTR2AyDNVb2azXgv5l5jaDhsz+b7t/91gIzVRbsc5T8zitKrDoUQ2I7uoNHAqUstqsvvATASQ66FmfrbRQIwnsRYUnuStvGD/J75x8rmowrVA5mAxqsIIitJpElu71iRKXPvKvJP017ZzA03snibZ0dmb5pWlAUoq9VW3Oey302NWGamvF/L2qeZQfIIiFny+ZmjvB0x6A==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700016)(23010399003)(82310400026)(13003099007)(6133799003)(3023799007)(10067099003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	PtJ6wDkONZ4/31sS5KdDcRIuQkhz5ULAcr7n+5iXVKfi6EXMRXwxS3dLaqgwT0zXFrbGjNVZHndIJqkuYXnXq4up9t+0/k9IYla6Cq2UhwY/XzxtnaM3c8CxIuPTwl2EYwYQCQPToDlKBoFPrtKRZOZ7ijaR4bbddh1vQJeTdadwDENlvf7Tw/K3lKAHcyMjwuJydHsjP9ovbwgnzwyvgCRf2t6qbEQTVRlOIeHa5R9aBpDtGHiFc/ETcpl4dJAI6A+eWTjO8CaP2yKz+nBSLKRp5/ih8XmrpOUHp7/EkkDtld+ejIK5RxsSlADJ7aivUaL5RdqsGxYFLc8MmbBK9oCHD6WJQmj9sWyy66AibriRoCekT7MzoutSwm20/AFtoXC8L+iPUZcXY8DoD4ND04VOn6xFO/N+DDUZ3JdmEyjAmvuKJ/VeJjoeA02NoF1r
X-Exchange-RoutingPolicyChecked:
	rD9DCG8BL3FYqgybtKnrIxxqTsd+7FVZp77jiWWTqOEKCnWDCes/WG10FKzcvK/Gy89wfXCsoxIY9jIRwSb2Zd9xXj5VxCZ4PzlqIoQ8b62I95qYH+C+083cLgBVVhdHmGyVJf3HQ6BuMKuL/54xVtANkQV3UHOBHRBMlFEvK2xfhhYL+Z8veb6ChForburJssi0FG8W6rEJR7TUuC6nyAljcX1/o65BsF4Ef0tBoZrXAlJF0FH2iFZrTkT/ZTfcz2gH8Wif+Vwd/KmQ8Yh1X0pXzmbsctYCA7pZqA4RI/hxJ6nqYskNBxek8YYEIDxYYQ5nSu+5K5LjmR4K774I/w==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 06:35:17.4537
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c546c1c-dcaa-42d4-4db2-08df17aa8062
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN6PEPF00000072.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4410
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDA5MyBTYWx0ZWRfX47M0A4VWXdFm
 2PTm9/RHZkDUyKUsN5WFZauWB90RNcAtFNnomSS0D7rRCA6FwtL2q0EioQHUUi1keg8/EQ8sUiN
 WJ09TQFxF0vErQ+ZvXWMUSkXKdgADMs=
X-Authority-Analysis: v=2.4 cv=P7CvFSAu c=1 sm=1 tr=0 ts=6ab0d028 cx=c_pps
 a=oox2QBUX2gBgMMQWkhdftA==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=sozttTNsAAAA:8 a=VwQbUJbxAAAA:8
 a=fbNvPRWCz3s4EN2JoQYA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDA5MyBTYWx0ZWRfX1T3iVrHrBC8Y
 /rSw4K4ML58xOWnMjlzS7j2KRl0Hb+Ylz71KnsaTyT9+jXpjchMnFwn1kQa/bfh1UX0U2Eh9EeW
 IZqrxEHGBPJTL3Qa50ELeFaeMyXqyV6ixfTLjHI+0cDoRWobQUxdtxVDC9ARc5xbIJFfemX4TvF
 X/6xDNvosYjNjdu4Qj4Qn7xIUWyjmgiFYLjAimDQ77seebeuXFW1crhJnudgsIwH270EigBTHvg
 ubs59B9S+0WygACoEjoh+Tgu7cwBPO+Vh5kPS6r/wdYX1hns6V1Lsz4FyVzJCn26nFuEKTI+Cx3
 Own4m6LQk4+S9Nv8LkXxoNZMiA4Q5U3OoknibY1e97m+/svyAwSTrXfdqkH58aUux7l4JusfdL0
 12uSA9PSx7myeHtrrCCEdJeHVrw+rWuKfuHYQSkXS6VfOzm/0srAV0828q2FlbKipbLupzkTEHb
 jStHt0UERAuBBRCMiHw==
X-Proofpoint-GUID: W0fJR12eXeOPzEg0Ysfe_FklvkbJkMvr
X-Proofpoint-ORIG-GUID: W0fJR12eXeOPzEg0Ysfe_FklvkbJkMvr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 suspectscore=0 adultscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609210093

Add virtual GPIO select mux macros for configuring the vgpio_sel
field in pad configuration registers. This field selects GPIO
controller routing. The meaning of each value is SoC-specific -
refer to the Technical Reference Manual for the specific SoC.

For example, on AM62L, values 0 and 1 select GPIO banks 0 and 2
respectively, while on J784S4, values 0-3 select different GPIO
controller pairs based on the pin. Pad configuration register
field details can be found in each SoC's Technical Reference
Manual (example: section 14.2.1.2.1 of [1]).

[1] AM62L TRM: https://www.ti.com/lit/ug/sprujb4a/sprujb4a.pdf

Signed-off-by: Akashdeep Kaur <a-kaur@ti.com>
---

Changes in v2:
  - Add all four PIN_VGPIO_SEL[0-3] macros instead of just two
  - Use generic value-based naming to support all K3 SoCs
  - Update commit message to clarify SoC-specific behavior
  - Link to v1: https://lore.kernel.org/all/20260917111539.3844577-1-a-kaur@ti.com/
  
---
 arch/arm64/boot/dts/ti/k3-pinctrl.h | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/ti/k3-pinctrl.h b/arch/arm64/boot/dts/ti/k3-pinctrl.h
index 4491898d8294..f6d262933fad 100644
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
@@ -111,6 +112,11 @@
 #define PIN_WKUP_EN_LEVEL_HIGH		(WKUP_ENABLE | WKUP_ON_LEVEL | WKUP_LEVEL_HIGH)
 #define PIN_WKUP_EN			(WKUP_ENABLE | WKUP_ON_EDGE)
 
+#define PIN_VGPIO_SEL0                  (0 << VGPIO_SEL_SHIFT)
+#define PIN_VGPIO_SEL1                  (1 << VGPIO_SEL_SHIFT)
+#define PIN_VGPIO_SEL2                  (2 << VGPIO_SEL_SHIFT)
+#define PIN_VGPIO_SEL3                  (3 << VGPIO_SEL_SHIFT)
+
 /* Default mux configuration for gpio-ranges to use with pinctrl */
 #define PIN_GPIO_RANGE_IOPAD	(PIN_INPUT | 7)
 
-- 
2.34.1

