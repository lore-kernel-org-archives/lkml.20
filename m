Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F07443FD11;
	Wed, 23 Sep 2026 09:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790156163; cv=fail; b=K9fMluNa/B+fVdRxW5dtKnxgwTh77U0mpFLb+V1S2oEITEDwquQ4BImFu/UVTKFb6UGFp+WsqrhEBCRl89gl7dYCnkTlPWaPU6Ghqb53qM2pNthv1RWsN0uCyqZY89hR0p3awzVv7fzZf2j0NtXvoGlVoVTZ80kiLoH0OWP0kcQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790156163; c=relaxed/simple;
	bh=ws3TB3HewkR6dqPs0vpo64ZmbwMA201OcHPxRnNvAKk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Gn/zxX4TsyNBtZ0SUqMjJK7qCOdRh6ANNbjXZkM2ReFYhSAOGaWlm+UG45D80uy1YSkkp+6SrTa8G4X+kwxDywOSbEyRLg4vA3/vPguurEUQpAUriDbjxe27IK4JDRGSR1NlxQYug+lHofCOTcYxKTIu0jOHJncXyhDVTR0tthk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=ZPDds/ij; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=DaiP72xx; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="ZPDds/ij";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="DaiP72xx"
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68N8JGGM775676;
	Wed, 23 Sep 2026 04:35:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=4RMVkz8R/sVMCFCMEF8BHnaunoVRvgacbjqSGdY9d
	Ao=; b=ZPDds/ijBO64hDiwZZVIOYvA6rAIc+pKYerfCD7gOsCYawfVvfdB6MCFf
	gzT1kApKvSuFIGRa/YQ/GebjgjBk3oZ3CHOqVIz5pp7NraVcCxgCfrM3jHlVOOZk
	Z0Ps0HuYrFsQ9SNVRaNEefa750PLs2H7yInzXY2LayzH2DyEg5AhF1rBZJn0/z/+
	3O+AUsWAZ1dbGJ4eqXjEnZFAq0zXjgTjWSXrA1XYLt84W2KNZKlXqTQvu94YVbOI
	JHWFsnS7u5TFtnBM8ZJBzxdEux70W67AKJFQhxBf2mNeTBVCkoYPQwiPrHvWt75J
	Z0xZPx/fN6ePMrz2FVcI7dG+BxT/A==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011029.outbound.protection.outlook.com [52.101.57.29])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gv2ycu2cd-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 23 Sep 2026 04:35:40 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=upVEdVidN89eHfR3671lM5q/ngasOKSVe98GNFV1DZBX4AgV237pvxwkDtmeZL1wNXJhw9WYZpMrHwcC6m3tsJYl24EEVteCgESX9Oi3gPr3yM86JodJjCkcF0oYylZODq/a65j2g7urazicTvO9Kh49vBg5f+1+5IADYvXdXTIimySZnUHJ9MZmtyU39FHmeSM7PdTwqE6NMgk7eUeKzCW/KElycnJ2XPUgJsdOm2GUV5/vm5M4AxYKW8iIDKiQpSdHWFm+UHGdRZkWU9VwzNJchsmLdzY/KeKYZf5rqlDNyydL9RdGBBpgNPhKtrkrlb8PGw/meTcdAAWzXYjH9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4RMVkz8R/sVMCFCMEF8BHnaunoVRvgacbjqSGdY9dAo=;
 b=rZLKeis7fL2+iIrYpuNOZ1G46xv8oKWmwsrVeWQaIcvH0AB5xc9lhS5pDpEpXaaZvOmnMDmGvScrAxJ5466nrs2ea+Vc/kVnf8MbCsvhngB65ZFtjeuoezFWhjdnfkwd7MKGKOGXu1CafqMhOyQQbu2Ys8sF+pzgb6Ed3fO3oHeR12ramG8a6unRxNYJgzaeflE0EOxCfbBzAnKopmc7D+OxjkFxVkUwbAFrI4XKggaEuDugfGvMQDt3dUYbrJOjY+OVOBEw3T2Mc8WFBgyVBEIrmZoN7ACcP3Tzv/QVcaLd2JgCIXJiCeSVuvSmk1zewHZ8IrFDGXZ9odUjaBpvag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4RMVkz8R/sVMCFCMEF8BHnaunoVRvgacbjqSGdY9dAo=;
 b=DaiP72xxT+33LBGkQbku8yqKwquTxMKHYQMPwEGt3OGMGibvSkMqhNgeOC0nn4dfaZzoHawfRFnWWP0/WRpkfCacptgAzg4HiZFkj49EiLiWICx8zkXjEjMVu8V+t+Vb11afG+b6eUoShev/adS6J1ZqIz/5/Fp76fdJ4dV/iXM=
Received: from CH2PR08CA0020.namprd08.prod.outlook.com (2603:10b6:610:5a::30)
 by DSVPR10MB997844.namprd10.prod.outlook.com (2603:10b6:8:459::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.4; Wed, 23 Sep
 2026 09:35:38 +0000
Received: from BL02EPF0002992C.namprd02.prod.outlook.com
 (2603:10b6:610:5a:cafe::75) by CH2PR08CA0020.outlook.office365.com
 (2603:10b6:610:5a::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.14 via Frontend Transport; Wed,
 23 Sep 2026 09:35:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BL02EPF0002992C.mail.protection.outlook.com (10.167.249.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Wed, 23 Sep 2026 09:35:38 +0000
Received: from DLEE207.ent.ti.com (157.170.170.95) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 23 Sep
 2026 04:35:21 -0500
Received: from DLEE206.ent.ti.com (157.170.170.90) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 23 Sep
 2026 04:35:21 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 23 Sep 2026 04:35:21 -0500
Received: from abhilash-HP.dhcp.ti.com (abhilash-hp.dhcp.ti.com [10.24.51.219])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68N9Z3WP1760658;
	Wed, 23 Sep 2026 04:35:14 -0500
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
Subject: [PATCH v3 01/18] arm64: dts: ti: k3-{j721e/j721s2}-main: Fix indentation in CSI2RX node
Date: Wed, 23 Sep 2026 15:04:42 +0530
Message-ID: <20260923093459.28125-2-y-abhilashchandra@ti.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF0002992C:EE_|DSVPR10MB997844:EE_
X-MS-Office365-Filtering-Correlation-Id: d6562818-fbb8-4834-aa10-08df195606e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|82310400026|1800799024|36860700016|23010399003|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	n6cLdOttv4QNTTYsQoMKujkQa/VsU3RgAwe7y6ZaJCRD82ChQeezNNzwaGkhbVx3u4oUvJyxQFNxAMwO+jch0Omv+7VlpPkkWBwQGER1zTX/e8Lvrd69g3qTUh+PsoQxa3G/LD6VLwfturuPBtJbCKGT3P34sQ58Wl01cKYmDc4EyDrosk4b8j6AEbt4cuwbSr/Dp06dRYWHGS2H9z/UkHH3O5w1IiHhNMC5qYSpvFIcA99RZypjWkP6PXhKOBPDglJytYdsRA3ieEG2FKxx81dBwdoRhhuDaGM4SYUkuiRPuiBuPh1GWyqcidOb0YY2ldEJqG867OMRFHZ5mIghtEmiBMw8biEEqjTQc2W8NNO2qEQj/tEIJzCm4o+1sju2kcU/9aYdRzs9t/qPMiJQtn77UbvSjM7fcEDWjmj2SvS6lq0wVWNr2HB3zm9/JmdhKWjIh+j5WMNUoE7pVQLscRjbODSIFdG+a6eXKf8gTt6ulk51snUt3J5859qBhYRlDsBLPDWzg2coY2zL98r2gI84kPSyqtVF110GZ58gajaK7JE5tiCdUM09pJDp88Qzox0nOmku/FCLsFy74ye6jW7N/tMM9mSyS5L7D333LWTlyVJmSWyJkkMCwq9xAHfRgep+Fkmn8NpDFr/Kyz8Ie44C/bHI2ArLrVYQY4QNdHBgJY8ZTf4jVmO29BVEyE3qeyf5idwBuFkoTpASvTdCgQ==
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(82310400026)(1800799024)(36860700016)(23010399003)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	WfzzUHbDorj8FwGEHbkVu666ZG0MDrVykM/VhoO0R8dt+ijpKHXDD6YfDQRrhJ3sFrAXmaK6+/dpraNgz5olD4aYt3LZ4iHKLtGUuTgK2tIqgpFyyCKDh6/H210oFdrPALHe+qxItCmjOdApZ0uQKqhmMfMrGD6tc8QhCsLvBrFC+aW057UgHa+e6ANIdseec0tVHkf7vukVyFsHb8qE3RmleT/ksDomUbArQL1QyoFoPN2qjB46BOtFuMK+8bwVkvqwU5l6ZNSKm727vxfEC6ktzauUwEhnWu3DsSWjGZzpipS0/eQYB5AvtuDQ4o2SxRpf55I64l8qgB4j2Dawbz+Wgfkj8z0UeQWa+TgYbr8ZIwpHdLTEljhC26xvOV6P27NL2vxAxeZ3R78ukO2gThR0doD5x1j7DVq7Ug6lGpuNVg+UAy2Br4NCytiulpmh
X-Exchange-RoutingPolicyChecked:
	xan6lumLp58wmwKVi5f73DSXZ6e/4YY2LIq47fTbonL6/+fPQb89bDeEe0UbJ4VlXJKjWE7hyYp+Wxu7uNuQY2WHkVm6+w+o0NYW9zsJkASqkPz48IoV01sQON0x7coOtbiasBm0BUGXKbxAHALu35UgzJqlG0pnssl9vvH5r9bpox1fA1sS89RNn66WJmUCtt3+yL8NYh7Svkt1s8WJk4G4svl1B1ET5K99eG5K8FrXSfyrMFdmQziyuZhhhDWP7hh22LfU1qjriwJPI4BWtkVCecUh2VaGfqFAetmdmQDGW/lp3UWxxW6TXYaA5bDYmy8jhD3ENAJbeLyNBdhR1g==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 09:35:38.2166
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d6562818-fbb8-4834-aa10-08df195606e3
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0002992C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSVPR10MB997844
X-Proofpoint-GUID: zIUzCfxUKqEpk--wchRoGwYrJKYuhqVP
X-Authority-Analysis: v=2.4 cv=WZKZ+EhX c=1 sm=1 tr=0 ts=6ab39d6c cx=c_pps
 a=rDMf0xV6zgmXoNUq+bKLQg==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=sozttTNsAAAA:8 a=rxlWniGCUJbLCV5Uw4kA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAzOCBTYWx0ZWRfX8XkfAUA38DWD
 bTBQP7H5YVXq/PZaPLwL9lZDA9M2PgN829/sBB0KjqWIE8JDOFbtTqLqiximPaG6niTtXtm1SSc
 OJ1CRIeKCreAPKznaqP1Nb3rlmN+qKDvPw8TjG20I/nskUeT62+qaGj0AL7OeXZSX0z5OrCu+FK
 Xw/2L1Q2JUU0nhQS+k5s39hc9abAYZ7vLJrCUdZZnyvAFOouuNbTUj/AUm2TN1aBcQKtU1OKm4g
 dFGvxy4rMsgPsZRAQdX4PCgTXVL0EZAY2WgRXNOzsNp5BQirbmbXerUyUbiyJyytbFuEEqdl/n8
 zTunL/fhSHvZeXNHEkbEMjMc2/s13nGXepDQUBNIapnWgkTnZ00mfh4vGqm4PWmA41oiAjU2yW1
 7e30CNpR1iFGj3MXwOSSz7HAI80RZrrV0dwtIspwtmaOXrGM8ZDS9cJW1EmMcH0kfTfwhqRKNyC
 7N4WzwMichmZZTAHw5Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAzOCBTYWx0ZWRfXw4//DN/YKbQp
 sCMZyk9tXvRmHcJAVquJ0OxLG20ML98nXOYVYu9s2OikqtF9Zbl3yWER+BbmZIxF/vC5stlhlep
 zL2xy0G4FLdvutqm1JIT2O2a4sytGIU=
X-Proofpoint-ORIG-GUID: zIUzCfxUKqEpk--wchRoGwYrJKYuhqVP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609230038

From: Vaishnav Achath <vaishnav.a@ti.com>

Fix a few minor indentation errors in the cdns csi2rx clocks and
clock-names properties.

Reviewed-by: Rishikesh Donadkar <r-donadkar@ti.com>
Reviewed-by: Udit Kumar <u-kumar1@ti.com>
Signed-off-by: Vaishnav Achath <vaishnav.a@ti.com>
Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
---
 arch/arm64/boot/dts/ti/k3-j721e-main.dtsi  | 4 ++--
 arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi | 8 ++++----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi b/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
index d5fd30a01032..5a8414fc5751 100644
--- a/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
@@ -612,9 +612,9 @@ cdns_csi2rx0: csi-bridge@4504000 {
 				     <GIC_SPI 152 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "error_irq", "irq";
 			clocks = <&k3_clks 26 2>, <&k3_clks 26 0>, <&k3_clks 26 2>,
-				<&k3_clks 26 2>, <&k3_clks 26 3>, <&k3_clks 26 3>;
+				 <&k3_clks 26 2>, <&k3_clks 26 3>, <&k3_clks 26 3>;
 			clock-names = "sys_clk", "p_clk", "pixel_if0_clk",
-				"pixel_if1_clk", "pixel_if2_clk", "pixel_if3_clk";
+				      "pixel_if1_clk", "pixel_if2_clk", "pixel_if3_clk";
 			phys = <&dphy0>;
 			phy-names = "dphy";
 
diff --git a/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi b/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi
index 1228ac5711bf..5cac119e4292 100644
--- a/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi
@@ -1251,9 +1251,9 @@ cdns_csi2rx0: csi-bridge@4504000 {
 				     <GIC_SPI 152 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "error_irq", "irq";
 			clocks = <&k3_clks 38 3>, <&k3_clks 38 1>, <&k3_clks 38 3>,
-				<&k3_clks 38 3>, <&k3_clks 38 4>, <&k3_clks 38 4>;
+				 <&k3_clks 38 3>, <&k3_clks 38 4>, <&k3_clks 38 4>;
 			clock-names = "sys_clk", "p_clk", "pixel_if0_clk",
-				"pixel_if1_clk", "pixel_if2_clk", "pixel_if3_clk";
+				      "pixel_if1_clk", "pixel_if2_clk", "pixel_if3_clk";
 			phys = <&dphy0>;
 			phy-names = "dphy";
 
@@ -1307,9 +1307,9 @@ cdns_csi2rx1: csi-bridge@4514000 {
 				     <GIC_SPI 156 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "error_irq", "irq";
 			clocks = <&k3_clks 39 3>, <&k3_clks 39 1>, <&k3_clks 39 3>,
-				<&k3_clks 39 3>, <&k3_clks 39 4>, <&k3_clks 39 4>;
+				 <&k3_clks 39 3>, <&k3_clks 39 4>, <&k3_clks 39 4>;
 			clock-names = "sys_clk", "p_clk", "pixel_if0_clk",
-				"pixel_if1_clk", "pixel_if2_clk", "pixel_if3_clk";
+				      "pixel_if1_clk", "pixel_if2_clk", "pixel_if3_clk";
 			phys = <&dphy1>;
 			phy-names = "dphy";
 
-- 
2.34.1

