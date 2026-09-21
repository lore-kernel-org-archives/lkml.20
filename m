Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ED6A4FDA6B;
	Mon, 21 Sep 2026 18:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790016570; cv=fail; b=QcN3mQVNiOI/fiRp4xbKHTwkfOOdjXnNPNi/c7H7KGT4YxEQYj5vcxBx6aeTSymi+IQ29yurRTTT3z0vMqYyIHciT7nW2eLNUiij1xODO7nnyNAnK/dcXlLFcB8k0zpkcNSW0cPAj08stswUS4XZs9W+oGrPPs3UZDkESCBtQCE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790016570; c=relaxed/simple;
	bh=7oifqgJ2eTJ6ITlmBe/5HfouOGMJKCKSylVj0WTb14A=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hQkSu1ovDa8do77oZ5uo7nMo0JHDFBO7ohdzsXi4tD/n7lHc2vqJ1bP0Xmmg2BrqQTjIUKwHKLmOmcDMdfzIiU/gNYqNrPn42hNJ0MItRdbTomPirm1sFMVc5qAuSQWy8fczkMdplThdnHqeBTERyvA1ML92ZFttQ7tKn2vUmRw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=asNgwf1I; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=GktptX80; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="asNgwf1I";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="GktptX80"
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68LIUALQ260300;
	Mon, 21 Sep 2026 13:49:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=mjrg0WtDpxbszpMGjZgCkRdY4lpWQE/3NZVUBei1K
	V4=; b=asNgwf1IYWqyHnpXfowQDcPT5TvtADnbiWSYBj+I7oVk3XQW7QuBZaAyi
	HoUExwoq+7kSf3oOU7TRofAOiEVTFvjESMwYNdV2KEukJoLrlQ5uGKvg4J5jB2vL
	vAw+MT/3ZUBVj/MmwJMQFhvFwUxbHDvCRMWWI0u5Zj3cLFpQD/6jYrPADDB4794Q
	auQZdUbWmdqqy4AGTX2o+e/tle+3aqaGtUk7twXFBz3W8Tb97WWaiUxcc/Pm/79V
	cZZbsbKsPBroGlpsQf4jnX/LngdIaX56s/ps3GU7EqQRTE6WaYSP/KawXHbVDZpO
	cXbryrAwQf711ux7AL2r0MOsJmpQA==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010017.outbound.protection.outlook.com [52.101.85.17])
	by m0380145.ppops.net (PPS) with ESMTPS id 4gtbdnguma-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 21 Sep 2026 13:49:23 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jX0wNOMq/o8ghsr/VNp+2Eh8FAQqb/rpm7aqWwGcrBhe30bfaqG/ePIFbdZ+5of9PUi0TS3Coy3gCq9Nov4j2PMx98SJc7EFruqNVmbcq7ewIaqE27shERWzg2Jc+u1A/4wYQI4BI/R2e+5Ke0/xU6wzMMTgbKe+4Q5IGlELN/dLvFCnTEeKUrG4BFl3FFmkd4CrdUKHEz1Uad3N0AMvNBGngyVL92RDZ5qpeMh8bV61nr719yG0HXsIz9YMBbuM6MTFyoFw1azw+gfWLqe+MJwNpkgMsvzT1RTbdJrsQNs3v1PjweKx+mt+KOFD04LNJwxfz2rz7dGet9HKZynITQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mjrg0WtDpxbszpMGjZgCkRdY4lpWQE/3NZVUBei1KV4=;
 b=HamU6Jca4FCjY7y1MtIDSGwBENlQuerWXNxMlkYtLy+iUcK4WhoO7+itSwDEGvQzfZ3EJSA1cfyDcaaOEwGQUba70Lx+IuFcwS40Z9PlraI7jtm19JqhlrIX1pxDTtbgJkTph1LzDSglbNg4yt8SNauX6ld6wUEGaAed4Xqcy9NT/z9hL/9fiwNL8Aflpwne/zFxuo+SSaTdXtS3S/X95PlkEDLSBkeiHhwkOXw/yiGRbKqoi+d7yv76nFiQGz4BIj12Va7P2JBSnTtYCvx/JZ+pKgaiWMPv+7Ca0a9hAWxCN1AW7DtOax/Id+4Ss57hZVCeUyhX28QoNqgrpDKlEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mjrg0WtDpxbszpMGjZgCkRdY4lpWQE/3NZVUBei1KV4=;
 b=GktptX80qC5CcqSdoKgzGKZm0rehmvAvvmqiet6sBzcJQMpZh29w28pmdOkO+cRM2CVpYagCwjfq0RvgOWqi9GOqJ+Jk86oNeUti1ziHJzTVPkM74HBW4WoXU7oBqeQ6jB8Lq1coR68DVYcxllam7N9CByqfey2alJh++9qls/U=
Received: from BN9PR03CA0559.namprd03.prod.outlook.com (2603:10b6:408:138::24)
 by SJ0PR10MB5582.namprd10.prod.outlook.com (2603:10b6:a03:3db::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.13; Mon, 21 Sep
 2026 18:49:19 +0000
Received: from BN2PEPF00004FBE.namprd04.prod.outlook.com
 (2603:10b6:408:138:cafe::87) by BN9PR03CA0559.outlook.office365.com
 (2603:10b6:408:138::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.13 via Frontend Transport; Mon,
 21 Sep 2026 18:49:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BN2PEPF00004FBE.mail.protection.outlook.com (10.167.243.184) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Mon, 21 Sep 2026 18:49:19 +0000
Received: from DLEE205.ent.ti.com (157.170.170.85) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 21 Sep
 2026 13:48:58 -0500
Received: from DLEE214.ent.ti.com (157.170.170.117) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 21 Sep
 2026 13:48:58 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Mon, 21 Sep 2026 13:48:58 -0500
Received: from b-brnich.dhcp.ti.com (b-brnich.dhcp.ti.com [128.247.75.1])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68LImtif3523558;
	Mon, 21 Sep 2026 13:48:58 -0500
From: Brandon Brnich <b-brnich@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <afd@ti.com>, <b-brnich@ti.com>
Subject: [PATCH v3 2/4] arm64: dts: ti: k3-j721s2-main: Assign SRAM to VPU node
Date: Mon, 21 Sep 2026 13:48:48 -0500
Message-ID: <20260921184850.3810018-3-b-brnich@ti.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBE:EE_|SJ0PR10MB5582:EE_
X-MS-Office365-Filtering-Correlation-Id: 641dae76-484a-4c1d-c905-08df18110b45
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|376014|82310400026|23010399003|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	HKbEhpsvxpxMyHcF9EvXgbxccQq9VaTFpFS3xEIrOdL0xgTVemk/rNpPR9bHSg/2CRrldLNf4MfubDVGyrb3/j5fL6Eqf9PJj2dEKn0jdrmgN80GDX3giLt6KEd1UlMnJmIhD0YqgyeSia4KlWhHmirfu2dDEjm0g6ULZrPcrZBqk+1XtqcaHsSqfULuuTfxbzWJSQYZK7cCaZxlo5tF+m9gWd0A1qqTZVvrhZhV1k9tv6UqkrSn95fKSRY20SifXbMwzPispAtcU05OhAx3ngxoxW99nzNfmn8zno8D4hFWez8ap4ZzVd6oB2uJ0R5AMmdxf2pQxNb/OriTRXmdK3OrIXRFcFHr/D5UOe8axKt18xC51lQ8H07p4VjdvWKcmk575SFRT8QU1jkZKWIwzFqvuG+XaMN8jXanNVteJ/LoC21BCB4qEDSyEYmClc4DNCEhGu21nSklAkEHQXVolV8KwajxECBjkxVKPdIXKCeASOvjeDKCEvX/5rvgtk59JP4rJeA8xd0TJA0ysbcyDcG5xEnu+s5LQRmO/nlcI8Q5F8sWzxh3VnULlzDkKNLmmJfQFZUFHggpM1O8w4G9CkD69Xhaw5WQJvekF718IfqXzBIjtp6Trmx+enNKhXvsGEgmEUbymtotCr1LU6f39OxGbLz4Pq1zmNluZBAcxUTDLfvSVI/J3b+teQx7PyHlgd1lZ2bLaU8tWvu+tT/KRQ==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(376014)(82310400026)(23010399003)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	CdGeubMDR70MoPlu1F03mWVf+nSjmmyxZtJZH0FsNKuSbKQ7y5OOJgeNccFkmFcn9iIcnrbAcW9PUSBVNQ6+D9UK/TUbHW5eiVrTE3XgShXNuBAMsqFD+7dDNNKkfoyRGBfzfnIG0YI1/nwViOg9Ms81be08n05GqaBfn+Ca/BiMckYXvCkNoLrWmY/uwKL60+qsPktV7Wv+kv/RcU3fE86dLPAA/dpjW8517uxLyXIEm/YeftLwku4VLQL7K6lmKscjREc3TUXrhdzwPUDyFWgNoLW6xPcSd8GGJwfBe2PX7jmfUgJaCNzoFzKLhRgQr3THpe8t5CSa9NLX+Q+OnmrOwfTMx+KybQpoS8OU8DW8CfyKOk43XFy9Z3mw5f0UzM/oXAoox7jLphoVNSNa10epHcEMTISubstKrdZ3KEvjf0pDtKTSjfpIun8B6NBF
X-Exchange-RoutingPolicyChecked:
	Kfn0SKZzh6fKMtBmApCF/AQwOr+etR3aWQ0f2d+wPXA4dZWYyVk7ZkDwV/K21/eytGm+Dr2sB1lCmBY37nn9dS/NhNhrKslqsrW8HZxwMIN/K8bejJIAaCI4iVSACESHWCBXdak8ARc676/UWcynVNuD3cECzRxaiKf3pl5nch41wp4sBmk4/xJYBuFX4Dr3MMgNh69HN1fE/ZKE5mq08c6eTbZaVUEwyRPoDCrfFGUH9X56yax8Cau+IeHglCFBFQ5lN1pxENj0nbVy95kkG7FqsqupEr51yesYhY2eAUoLfEXe4CVRN1zrrK42YUuOqF71Rm4WTR2TdwC1vQHeeQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 18:49:19.1390
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 641dae76-484a-4c1d-c905-08df18110b45
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF00004FBE.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5582
X-Proofpoint-ORIG-GUID: JSJPUJmhhYhPeXQyBFLbFlM3lJQxvAkz
X-Proofpoint-GUID: JSJPUJmhhYhPeXQyBFLbFlM3lJQxvAkz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDI3NCBTYWx0ZWRfX6CCEg25D4ozA
 RK6agb4vq1BXbosC8cv9o361qsat8IL2AtoppGIv+6rW549Dna1vOrhxL1h51kka2XGUmyPWfRf
 C7yQhdP5qVY2+1NsdE2Lftv2V6W6LOZPUkRQPqOWU4bESpdud3Mou8+QDpU1ajpouOCk5Xijmf/
 TgwrCTxw9IdsXWPCWrTTzKpZiwym6SsWlIMQ+dj867aClN1sbq1SdTdHOEH5RRCosD48dmNRgdi
 YLLz+49mPsCibfI8FrspxMQTSwv180hC7CYwiPBKE89Xm6jmsOwc4cbu9ZOYtrDTQ8fTSLtUviQ
 gBBW4w1Cg+ax737yn998QqhLs7q31Ykr+t0rfFfL6EyvTA8NO+KMDKwiAYlsgWPbOGHUUyubatZ
 ERvjMK4xzjuptjdOXXgsfpSfrcM7NhQ/boFdE4aOhkrrjWnX55wt61lwEcFKiaTUYwo4hMyXyen
 UyfIX40NajguAipUYWw==
X-Authority-Analysis: v=2.4 cv=bpDZl0ai c=1 sm=1 tr=0 ts=6ab17c33 cx=c_pps
 a=+9lCAQqCkh6G/pz+5LnHJg==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=sozttTNsAAAA:8 a=s826d0Vf4ljoQKYSzyQA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDI3NCBTYWx0ZWRfXxwkpfSmB3icu
 IrjRrJp5vUAZxo6BtO5KaDuMw5O+5D2EeuIdJQ4LZMNt85FHrXJ77+iQItW0PF7XrAUYs9fHp/A
 oBf/FpaMqOLEVr+wtKx2Km1F7Gh0dSI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 clxscore=1015 lowpriorityscore=0
 suspectscore=0 phishscore=0 bulkscore=0 impostorscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609210274

The Wave5 VPU supports connecting to on-chip SRAM through its secondary
AXI interface. This allows temporal buffers to be stored on a per-stream
basis, reducing DDR memory traffic.

Signed-off-by: Brandon Brnich <b-brnich@ti.com>
Reviewed-by: Andrew Davis <afd@ti.com>
---
 arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi b/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi
index 1fd173a68c0b2..233aedcbf2ec3 100644
--- a/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi
@@ -716,6 +716,7 @@ vpu: video-codec@4210000 {
 		interrupts = <GIC_SPI 182 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&k3_clks 179 2>;
 		power-domains = <&k3_pds 179 TI_SCI_PD_EXCLUSIVE>;
+		sram = <&main_navss_sram>;
 	};
 
 	main_sdhci0: mmc@4f80000 {
-- 
2.43.0

