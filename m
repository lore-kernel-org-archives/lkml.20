Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C96047CA8A;
	Wed, 23 Sep 2026 09:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790156315; cv=fail; b=BKYMM8IFXqwd7IQtp5Yals9t+Km2EdAlqQw6XtznFtB64H4gqDUw2g8ZWGlbOa7QLJEu5htNAMtJgIqSZUYu6Fsc1Dzqb/4aA6YVYiAAJvR772JLYv2fCWPFCL60K/MZz7A7kvf9mGQDpFKHn6g34NQ4XylwQh39Th97izCDZyM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790156315; c=relaxed/simple;
	bh=ux02B79EitqTU75VuhA7K9xBKtBk0zgWBFSm3yOzqZw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=k/OlYUFOCcXAccBstp6+yGXNuLuyeSYlYVb3GmMGiaurQ1O70sWwLte4+B6aCKs8U/0lHdSKhL1HS9eEftTEeUCxiGTM7fBjFzLOW48UL6wAgVeS1WtU/JXQYZPsHVMDeSJ4S/7S4Fcy1gB4TBb2Lqu/XWkFuL1t/wtlBiyVnvY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=P2DS4Nz5; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=gldwSgNZ; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="P2DS4Nz5";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="gldwSgNZ"
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68N8JQGc461505;
	Wed, 23 Sep 2026 04:38:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=E+qet83aC4TgjCl67BImAKi8r4B8rog2mcykatxVc
	I8=; b=P2DS4Nz5rXnge9YENqYupSLi2bh9/Hd0u+GfL4i7TFWV3olBTSgpNMR1V
	dmS9Ub47xGcO00O8VngU3zWA+OmECCOjTpCFLgHrUS45kpXaqEZTeAIrSkfY1uoj
	RnAIuCKfcs9WyLaVRZ+vavWRXN5dRtO/WgOzu+ABhepCpYG1RltrDr5QgKShltX8
	swkYIyZzLiR5qFn0NpDGkLOrzwSdyQ5gIxNmZCLu9E2xxLiE9morfB5ep20lkRhi
	qOHRaWjStiztF4IeBkbdkxfpOBVsbwdtffxM6I/5dej57ZKiu3OMbO6pA9fh3PsT
	51zMWoGPFCZ4EGC1YFtHC8ACcmkkA==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013069.outbound.protection.outlook.com [40.93.196.69])
	by m0380145.ppops.net (PPS) with ESMTPS id 4gv3tsavvj-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 23 Sep 2026 04:38:02 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DwDE1cgRRmBjXR1D6FHvuE8t9BXxSZ7ljk59zihYdI/mWMeTBh3zayBAZydjx59WCgGxd6pcfbY9yGzx7eJKq/yTD1ew9hFG9cof7FA00ZYizBxX/4szmFVrgYmN1aYvqzO9ltDcx3PWeGWPIjF2SC94gMT0nd6zb3Fclk4NlZJLzX+N60rUmFZy/RL/zbnt4CCP7d8PvtQcGqWU7ox8N38CgQnBzyUz2hPi0ZMhPCyp+HIwQs7SoTyNisUoisFvGJLLhwRho0/4L+CRupj7FeEAAQ1Y224xBoaYeXZrTaxQAtETcW4eep6QIgfgnFkGBCyWowm1PmIATkD2q+JZCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E+qet83aC4TgjCl67BImAKi8r4B8rog2mcykatxVcI8=;
 b=VA896+zho8SYaIkGgKmJeVi2603Gy2FYTlS/nvRvVx61shnN8HdeDea0zLJJo2onr9kBmOQumzbdklfEOd9x33/5t8FSbQtub4oI+L60x3XLw0wZKAyRn1gbDVptwE94Wq/TJf4wOEPjLDtc7G3m1DTSTSu+38Y/bjTn2Jey/s+7A871tEZ6+2u7qZdmPJNdXFiEfP2sr+kDGUcSMQizoT4Ls+wtX1191DAfaRbf9WG7srv+io4DBf/fHc/U29sm/1YmtvKSsrkcmO2nZh8hDVFZC4s7/WCQunRIxrQWrQd/e3xWjwhP5CiqHEp0udvzxGqScpxNE/TmEVtjvKDiKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E+qet83aC4TgjCl67BImAKi8r4B8rog2mcykatxVcI8=;
 b=gldwSgNZg6NcmE4274v8DmHvnDCNUZXAzicMExhs6p6vq7ow3/Mvy45aVJwTynT+Xh58B1ltF1BOOCREUKPqQKgRcMJSJfcFcn69G6l1SAGkboTLpP2RRlSkskoF3iHHD4ZhLv8onUSB8WotchSz5CJoaj+xDhUAEyeMtLOyTx0=
Received: from DS7P220CA0011.NAMP220.PROD.OUTLOOK.COM (2603:10b6:8:1ca::16) by
 CY8PR10MB6828.namprd10.prod.outlook.com (2603:10b6:930:9f::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.14; Wed, 23 Sep 2026 09:37:58 +0000
Received: from CH3PEPF00000012.namprd21.prod.outlook.com
 (2603:10b6:8:1ca:cafe::96) by DS7P220CA0011.outlook.office365.com
 (2603:10b6:8:1ca::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.16 via Frontend Transport; Wed,
 23 Sep 2026 09:37:57 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CH3PEPF00000012.mail.protection.outlook.com (10.167.244.117) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.0 via Frontend Transport; Wed, 23 Sep 2026 09:37:55 +0000
Received: from DFLE203.ent.ti.com (10.64.6.61) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 23 Sep
 2026 04:37:17 -0500
Received: from DFLE209.ent.ti.com (10.64.6.67) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 23 Sep
 2026 04:37:17 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 23 Sep 2026 04:37:17 -0500
Received: from abhilash-HP.dhcp.ti.com (abhilash-hp.dhcp.ti.com [10.24.51.219])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68N9Z3We1760658;
	Wed, 23 Sep 2026 04:37:11 -0500
From: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <Frank.Li@nxp.com>, <s.hauer@pengutronix.de>, <kernel@pengutronix.de>,
        <festevam@gmail.com>, <andersson@kernel.org>, <geert@linux-m68k.org>,
        <dmitry.baryshkov@oss.qualcomm.com>, <arnd@arndb.de>,
        <ebiggers@kernel.org>, <luca.weiss@fairphone.com>,
        <michal.simek@amd.com>, <sven@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <imx@lists.linux.dev>,
        <r-donadkar@ti.com>, <devarsht@ti.com>, <u-kumar1@ti.com>
Subject: [PATCH v3 16/18] arm64: dts: ti: k3-j721e: Add overlay for DS90UB954-Q1EVM
Date: Wed, 23 Sep 2026 15:04:57 +0530
Message-ID: <20260923093459.28125-17-y-abhilashchandra@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260923093459.28125-1-y-abhilashchandra@ti.com>
References: <20260923093459.28125-1-y-abhilashchandra@ti.com>
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
X-MS-TrafficTypeDiagnostic: CH3PEPF00000012:EE_|CY8PR10MB6828:EE_
X-MS-Office365-Filtering-Correlation-Id: a0f2967c-3d97-44f8-6d0a-08df195658bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|82310400026|23010399003|36860700016|13003099007|10067099003|56012099006|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	P/ZdoYWQxv8+seggyOkQVUs73NXWrL3Eo6S6OOU34J4hvrYddwKrCAcIzs0tm+thA28KImqG4naHSLWQ2CbUNzXnC6gcXoAbwgt8HlyRLBQ75/5yOufyUhcKTuXPjgDp+MowHbAv94gEfflVjnDbJ3L6/X2Q+vhKmZGgG15vtzkwrRWXi6HHWaUEGyPjsO5DwADH7XlpaNWMVH/wc7n/OBzuUN46Icbe57XBzp+JOguH3AUYBmBufeGLUGLaEdxLBEKmeRiX9WgdP1CWPDpi+g5yHAYEq6oe1LDiSGPcqamYcZYD9/O/THiK/uNZAEK6/Jds9Ad4Xd/cnczq2+y62JweD6yWFedWcR0jY91rVUXPxqVwGVPzclRP/HbLURx9zCwQyTRqm0E/l6OkAT2oRQbxu58kuIV8vZE+dxnybVWP+JNmI8uWkuMK8i7CBMqFK/VknnFgvAhMNvqS82XesoEAGnGDFEbBjb5/dsNxyKR87b7ZDOJc6UpKxVPVFkyZEj16eI0xuxtnHReHLo/S2egvJm2hKeEgXAOEJmfkNKVQ+oy/ZmQQb/cktiuyijvxkvKhby92etnFRR0yKk0WdV3MavLDwucoBRKWgZx6j8/Xg9WRS8riwmtfipMSd6gTQ6EkRiWqBQGojlQiORmpdA==
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(82310400026)(23010399003)(36860700016)(13003099007)(10067099003)(56012099006)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	XPTh70tszubaL8qDT7KLoS8wlEyh0739NYqPl51cg3sJP8PBwsUE91ATDSX6oL4kFOYdk9L+KZNhgxxFIKvQ67iVGBxFKfIZM18T/DkLT9CfklpvjKutnZ1+0bghB+as2ZbkzSKw/ljlR8JGlcFhYdF2elR7pnH30SnEX+sKI9IJ7fYiDrzfxaI6siEIh+cgAwgBClGikTKOCQTgl+QT2Pz3Lw8iu5cSDcTaX30AG6TJ7wmvve0WQ/dmBhNe1yWqNQs0WbG6CtzIo6ln7gRMPqxPh1Qy04fW12Cd2kUebiPZgT+9kBkAr9oE+Jwzyu2FEi9AKAtXG9G46J9F8ka/uNJVyWEdrHZeKoDewN6GLmXyUIfWQiqTt2SvxUHCy7ptObln481DjNxfOPREuoYKNm9cmk/B0xkeQt2OkCUUblDzp+OU2qzJx5GvBDsrFbtK
X-Exchange-RoutingPolicyChecked:
	K+BETTcMdcgHqPlRqf44/YNGgHX+G44jU5GcEsbJqB0XN6XzGM23aJKBNq0SnKe+pg00ObApSYBaba8fIN0wOU/QvkCAdWRLiZVjV/r68HNywBphwTszabcTWbkjlvujLu2zag/3KRLoSO1jchvbdS8oZpkWxaJ6Q2xa+HMmPUdIHH90OkmE5VyLJcXTTiphStk1CxWzt0GhWWwrqiN8Ml5z+tGhcPqgLHFb1fIFBRa1qRGRDrraQbD8hGjj4dHcjmEtVbmScebXknoe2fwGmYagMPz5U2OheMSqZCSZ+qTrKtV7cv1cQ5X3SF2wHQmGir6y38VX4jzVqbFs855t9A==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 09:37:55.5619
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a0f2967c-3d97-44f8-6d0a-08df195658bb
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF00000012.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB6828
X-Authority-Analysis: v=2.4 cv=INaXmQvG c=1 sm=1 tr=0 ts=6ab39dfa cx=c_pps
 a=M0SbpEVZuc+hi5PQWquR3w==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=gO1vWkAQAl3rybz1DQOp:22
 a=sozttTNsAAAA:8 a=x_qZaqpj4Dj6WOSpXzgA:9
X-Proofpoint-ORIG-GUID: SFFS0nVqLtDM-tGRyOoYKzYg0Arc6wLc
X-Proofpoint-GUID: SFFS0nVqLtDM-tGRyOoYKzYg0Arc6wLc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAzOCBTYWx0ZWRfX5pVVPrSatJv5
 YFpg+8vXyYHLs8iI9AgMygflYt0LeE+D0etgaiPwpwNHluEMRH0Vt/j/WUtKP493DwgNkupMXpR
 6pFpPu+lLmYpHXClYted1+QMWChpm/2pwI0tSjCUsHMmMpni9QiCz8gd63Or2fXxywPpmez1fYR
 TXmd6INI7QyLqMInUg7E/tx6nbHlZ0XAZcMYfFGqcfMadCTYgNDGXqHl7f68jZDgn7vun9/pGje
 jM4KT+ouc+U8PcKzNk6oMTBhGmYCyHILEVd4NnNPqoun2bahNuhcUIX4XKczMPeJHfiDcclzMX5
 s7zv/O/YR24vffPocgRhhRpwvMi8UCYlSoeorHF5HYzzZJ1yJpOH3iZMCnF5k3GUA4PMihJZd0T
 tT22yrblVYIK8ITA7gifHsu0IyAwjz3i6wf2Qu1RcVQ8G35oA71LAsxsTSBD+hpn2h4g9DvDnSv
 pHxgWdiMssEFz+UFucQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAzOCBTYWx0ZWRfX5l+g6OOTxQif
 fEelSJS5H4QnWAsUKCJipmj2ObQgJA0o2UE4lwfmC9l3nOrHmoIdxxV2+kjeZDD3nwFwmpwHA08
 7REPu2aP07pi00TXLhVDtj/ivaQbYtY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 suspectscore=0 impostorscore=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230038

DS90UB954-Q1EVM consists of a DS90UB954 deserializer which aggregates
data from up to 2x cameras over the FPDLink-III interface, and can be
used to connect FPDLink-III based sensors to TI EVMs.

Add an overlay to support it on J721E-EVM.

Link: https://www.ti.com/tool/DS90UB954-Q1EVM

Reviewed-by: Rishikesh Donadkar <r-donadkar@ti.com>
Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
---
Changes in v3:
- Rename fixed-clock node to the generic clock-<frequency> form
  (Krzysztof)
- Also rename fixed-clock label to lowercase
- Override CSI2RX port using &csi0_port0 label instead of the full
  &cdns_csi2rx0 node path, and drop duplicated properties (Krzysztof)
- Update copyright year to 2026 (Udit)

 arch/arm64/boot/dts/ti/Makefile               |  4 +
 .../arm64/boot/dts/ti/k3-j721e-evm-ub954.dtso | 83 +++++++++++++++++++
 2 files changed, 87 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-j721e-evm-ub954.dtso

diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
index a66d11359bd4..9d3ab69267a6 100644
--- a/arch/arm64/boot/dts/ti/Makefile
+++ b/arch/arm64/boot/dts/ti/Makefile
@@ -177,6 +177,7 @@ dtb-$(CONFIG_ARCH_K3) += k3-j721e-evm-gesi.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-j721e-evm-gesi-exp-board.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-j721e-evm-pcie0-ep.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-j721e-evm-pcie1-ep.dtbo
+dtb-$(CONFIG_ARCH_K3) += k3-j721e-evm-ub954.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-j721e-sk.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-j721e-sk-csi2-dual-imx219.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-j721e-sk-fpdlink-fusion.dtbo
@@ -425,6 +426,8 @@ k3-j721e-evm-pcie0-ep-dtbs := k3-j721e-common-proc-board.dtb \
 	k3-j721e-evm-pcie0-ep.dtbo
 k3-j721e-evm-pcie1-ep-dtbs := k3-j721e-common-proc-board.dtb \
 	k3-j721e-evm-pcie1-ep.dtbo
+k3-j721e-evm-ub954-dtbs := k3-j721e-common-proc-board.dtb \
+	k3-j721e-evm-ub954.dtbo
 k3-j721e-sk-csi2-dual-imx219-dtbs := k3-j721e-sk.dtb \
 	k3-j721e-sk-csi2-dual-imx219.dtbo
 k3-j721e-sk-fpdlink-fusion-dtbs := k3-j721e-sk.dtb \
@@ -551,6 +554,7 @@ dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
 	k3-j721e-evm-fpdlink-fusion.dtb \
 	k3-j721e-evm-pcie0-ep.dtb \
 	k3-j721e-evm-pcie1-ep.dtb \
+	k3-j721e-evm-ub954.dtb \
 	k3-j721e-sk-csi2-dual-imx219.dtb \
 	k3-j721e-sk-fpdlink-fusion.dtb \
 	k3-j721e-sk-v3link-fusion.dtb \
diff --git a/arch/arm64/boot/dts/ti/k3-j721e-evm-ub954.dtso b/arch/arm64/boot/dts/ti/k3-j721e-evm-ub954.dtso
new file mode 100644
index 000000000000..8db95c977071
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-j721e-evm-ub954.dtso
@@ -0,0 +1,83 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * DT Overlay for DS90UB954-Q1EVM FPDLink-III deserializer board on J721E EVM
+ * https://www.ti.com/tool/DS90UB954-Q1EVM
+ *
+ * Copyright (C) 2026 Texas Instruments Incorporated - https://www.ti.com/
+ */
+
+/dts-v1/;
+/plugin/;
+
+&{/} {
+	clk_fusion_25mhz: clock-25000000 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <25000000>;
+	};
+};
+
+&main_i2c6 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	status = "okay";
+
+	deser@3d {
+		compatible = "ti,ds90ub954-q1";
+		reg = <0x3d>;
+		clock-names = "refclk";
+		clocks = <&clk_fusion_25mhz>;
+		i2c-alias-pool = <0x4a 0x4b 0x4c 0x4d 0x4e 0x4f>;
+
+		deserializer_0_ports: ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				status = "disabled";
+			};
+
+			port@1 {
+				reg = <1>;
+				status = "disabled";
+			};
+
+			/* CSI-2 TX */
+			port@2 {
+				reg = <2>;
+				ds90ub960_0_csi_out: endpoint {
+					data-lanes = <1 2 3 4>;
+					clock-lanes = <0>;
+					link-frequencies = /bits/ 64 <800000000>;
+					remote-endpoint = <&csi2_phy0>;
+				};
+			};
+		};
+
+		deserializer_0_links: links {
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+	};
+};
+
+&csi0_port0 {
+	status = "okay";
+
+	csi2_phy0: endpoint {
+		remote-endpoint = <&ds90ub960_0_csi_out>;
+		bus-type = <4>; /* CSI2 DPHY */
+		clock-lanes = <0>;
+		data-lanes = <1 2 3 4>;
+		link-frequencies = /bits/ 64 <800000000>;
+	};
+};
+
+&ti_csi2rx0 {
+	status = "okay";
+};
+
+&dphy0 {
+	status = "okay";
+};
-- 
2.34.1

