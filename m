Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2AF63C0A1A;
	Wed,  9 Sep 2026 21:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788990517; cv=fail; b=b1DOdJdSphItxZ6lGlDa8sPARjuyLZEPNGhuSe6jnRBPzPWZ/gIEemXAz30ZNTOSZ4CdTumIqKE35J7EfX4fOK22Gfgh3pDmxPdeJGmNdnP1uo7mCo885SGEkFar3k3EnJqTuW2V1fivnEePMTdgVC51wsjIRfMWzBLxduSdo0s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788990517; c=relaxed/simple;
	bh=a4CnEHLVN+I+LZgonRyR3jlufVEQsEMpGxUdGl4F40Q=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rORn0f/wESOECHYB5rm5OvwvZGClOHFgWf6xlPaQoSpC50IwFB/lurWdhbKiGXWxOSQOlGonSJopRT9w3jQJK8kuykvMDavo8uE6TRGJY837wqEZ5wemzyGbXu1CEb+obvi4URnz95GCx38PHn8rp8F/Qamc31idiEa9CsAyW2A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=KCQK/NnX; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=nlq5KcgK; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="KCQK/NnX";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="nlq5KcgK"
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689JG1Sl1367326;
	Wed, 9 Sep 2026 16:47:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=nyxUzoxxPO4yRoCrXnuhmU792gTXqclRayGbW+XZQ
	Ds=; b=KCQK/NnXOA2uQBTjMh6g8vma1iLWbZYFiSkJbH2ND/dROx//nMt8hCoaH
	2GU/PVVMHHkUsN3pJ2T4scevqmIWkyKR4uuo766cEP5dy53EC7M4C05DyiFT63W7
	kIuKlbJl0ZR6OeZdMeHwDDAm1hEYxHYpOyuoR0uSXXuxTuqSKebx6s07wm2afH+t
	qbIYqckPdH9vJhuXG+ZfiVxgZhuEcYANxaKk4HtkP3kNufYz+9Zd5gumbIGYynXP
	NXDxv8RR/z17jg9ePp6ola5HqcDWfB9ExiaxhVMWiJH2potmzfDX81WatTBBIYCP
	JpBpBYzOhswYlcmwBrf/cSG9Q8giA==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011061.outbound.protection.outlook.com [40.93.194.61])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gkcxg13gd-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 09 Sep 2026 16:47:52 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s0+dvsqF5G/f/IjaCOLmDoaOTTmZCja/PQFzapBrOTC3xIKkF11PLLdF9AJezie6EuAi8AZLlPJ94nsEhcayfUpfelAFsHK++nTEsvLp2AAK6h13gbeXbuAethoEnVrqJh0vkmg8FzdL/lPFYq4V2lpbmCnI8b5qQ8btwxZ6ZR23es3Gh4yxXA1iAUdShQXCw1XU7ivS2zOhtKaXpA1Ndky05Qi2f6yVvF2gKHcF0fMRJCFiAS6QwMQO2yjkr6n1x0ZwTX5hJIft+NS2p/a411VCcQcRfb7itYveTeBvLz/Ni+Obs1RdZjg2bShgfIM5LAOWVbISJkdKYpCZ4/+y0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nyxUzoxxPO4yRoCrXnuhmU792gTXqclRayGbW+XZQDs=;
 b=Q0dt3ltASTT89pQDZyHXmzHxR71V9NY6MkkOxDlV7xlw0I2X8NFH1YqF9w988sBkJk2pYgBIcGw0s64oqwgDCfWCUhl/b6lhnSiyvvKGSnsgVHFoRMKegZoxcisdDPNlnzP5grMo7x1C2mEDVST2ivT8bVrCs8GxC+NV237zobBcP6w/t+c+A/3pAfqn00Ix0WoUy3WE9djlT50Talt6i3Zz06kSFNZ88lzYQ705bep7OxQa79u3MXBvvKnS3DppsXWQSYqUnzUiBwAz7y4yUpcxVfzJgUKUtE9Q0fSWj49Wv+ly2g+20h0IGoNrRUapbQ8OKGuKmt8ozFavDsRWNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nyxUzoxxPO4yRoCrXnuhmU792gTXqclRayGbW+XZQDs=;
 b=nlq5KcgKOrE4OLldHRHkc6s5VfjYP66+A23yMNNhj1YukbOvh8lDw3zje6/uQwmJYS5TCmvPD0EsnQ3ywzuvgDXNp/OKp7EL26l0gAk4gkURjcnxzx5xV+ZA2mX7RMgQGR0xsjtmtD1XMIRMxHBGm8Q5kAXnGrItHyv3rTwPZtA=
Received: from BN9PR03CA0651.namprd03.prod.outlook.com (2603:10b6:408:13b::26)
 by DS4PPF9FE99AC64.namprd10.prod.outlook.com (2603:10b6:f:fc00::d38) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Wed, 9 Sep 2026
 21:47:48 +0000
Received: from BN1PEPF00004684.namprd03.prod.outlook.com
 (2603:10b6:408:13b:cafe::46) by BN9PR03CA0651.outlook.office365.com
 (2603:10b6:408:13b::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.8 via Frontend Transport; Wed, 9
 Sep 2026 21:47:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BN1PEPF00004684.mail.protection.outlook.com (10.167.243.90) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Wed, 9 Sep 2026 21:47:46 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 9 Sep
 2026 16:47:44 -0500
Received: from DLEE211.ent.ti.com (157.170.170.113) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 9 Sep
 2026 16:47:44 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 9 Sep 2026 16:47:44 -0500
Received: from hpz2.dhcp.ti.com (hpz2.dhcp.ti.com [128.247.81.105])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 689Lli0H1072162;
	Wed, 9 Sep 2026 16:47:44 -0500
From: Judith Mendez <jm@ti.com>
To: Judith Mendez <jm@ti.com>, Nishanth Menon <nm@ti.com>
CC: Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Garrett
 Giordano" <ggiordano@phytec.com>,
        Wadim Egorov <w.egorov@phytec.de>,
        "Robert
 Nelson" <robertcnelson@gmail.com>,
        Tony Lindgren <tony@atomide.com>,
        "Nora
 Schiffer" <nora.schiffer@ew.tq-group.com>,
        Stefano Radaelli
	<stefano.r@variscite.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Moteen Shah
	<m-shah@ti.com>
Subject: [PATCH v4 04/15] arm64: dts: ti: k3-am62a7-sk: Set SD clock pin as OUTPUT
Date: Wed, 9 Sep 2026 16:47:32 -0500
Message-ID: <20260909214743.899477-5-jm@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260909214743.899477-1-jm@ti.com>
References: <20260909214743.899477-1-jm@ti.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF00004684:EE_|DS4PPF9FE99AC64:EE_
X-MS-Office365-Filtering-Correlation-Id: 72290f1d-fcc6-47c2-21ef-08df0ebbfc5c
X-LD-Processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|1800799024|36860700016|376014|7416014|10067099003|3023799007|22082099003|18002099003|56012099006|13003099007;
X-Microsoft-Antispam-Message-Info:
	7EL9bi/pgeqc3G/A3c19bvR9bKsJHfQ37Q27+nRj6jVuglZRTOb9yG/Z/ACRgT8Z2UCPVuYMPFyKIQ1m/bQEFmZeB2nzbfHX09HQEx25+vVQSPQTcTgu28Q+5QZq+kIuF7jjlod2t52N1YlgRJSkvcdYUwZiI2dw6b30Ahrh20xJnXAq+AY8FnQllPODgn5XVbhXDp7HAucst5fchIORUMlDVbBeVuaaNLBV/6vtc4auNyuxsTvL7POOmiMzXi0Dx050+STnwj+9tHFh9JuEnoJG2K0MTlkGaxt/+o+KuFEOemhEgYzWaAG+6k8Bhhji/0I+5T8/ynAcvRd8e6x/Asi6f6/VmHGfa0F2OO1CgGQY72XmF2WrZ48msQ6DdvVNv6g66cXxeRYMFhl41N/DOJ+FW5WgJTqfutLwn/pkcL6mtBCamMW/UfzUdsAti69bcwZ+EOPnT1c35LzCcmgHOoGPwks8mHQb9T5bumgNdUgYTqr2yfwoubVjj3qO65AHX2N7XA0VTHBp594PE8gu7ukJw/mkpz183iTg/XnmnzxOOYnNu4wTCcXBQsQV01TGbdyb3ROaIPcbCNvmwgZo2Jf84rqo3OzrBNSJU7efrGx1XON0cd4U7e5XMKmpsmGIptyPOJ8seGE9Lp7XKf9oQHR4YOjSjpExWotHE3Hyke81i42e4bGCGgQorhKnq2Z/DSIUAHMEmDVu17QbeseB9A==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(1800799024)(36860700016)(376014)(7416014)(10067099003)(3023799007)(22082099003)(18002099003)(56012099006)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	vKIbxMQzZfGW/JHCu7Bts0tnkZOSYA9F6oGlQjQnHWJ5Ptn5xVHwlc8t5tFvfCfqsylsquln9CkyXM5zFDtowjaUIUET3QfCa8KTfVMMmWTPNO50gYn5RuAfxfgGmsfvzxuBPcW3ndmYlHkFkcnMdh7LNim+OVTxAJYLWIgvgP8ubBjsieDr5Mm93FQcSjR8CN+9gxDGswdoT8bDKKXQn+G7GmsPOzTi0ChMxhFCXdFWADvPis+pq20XyH1rdztusdwugU4KewxzPpr6oMHiJ9/vJrauLrAuKSF9a7beB14eO2qXfld6jnt7XXdE98akEpm3VsM8wAGYz6i2euYrL0frhzDApr1f8JQBOPQTX9bi3sd/QKbEEu9dTV/60QlNYLLT9aSRrtyVnzzGhIsDK8kyi93XobOmlxBUSlchXj9vk65iMPR6TfnE/CqXbVMi
X-Exchange-RoutingPolicyChecked:
	0uM4wSBRoiuw/BTysd95PevAWvI6KzmkMHttWe7tM1cdon7il5Qtiabo1QsmXelK8MLkfyN3MaEpRK5ihENlpFrE8Rl7A5UAkgx8cL4EAbPqwSfLgz++GRIEep21ZO32/j8L8oKJuEPAPYQ3bhGTfIrQV0u0DWp3OAswV1S2Xuhr72QNbxm9rnEeCxAntAfOdyURL/AACW9DxbnzaevGigBo87rUPG9Hk4vl4zxdD0wP5bhr1ONsT8b2349FGi4InXKMQnK8+hXuYH6qNNY1CyV3DEvLnAKQfdD+gj+QbGufMikED44ZT00Zz1UkHfGFiPao56DgvLUZ4mN1XcszYw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2026 21:47:46.4190
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 72290f1d-fcc6-47c2-21ef-08df0ebbfc5c
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00004684.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF9FE99AC64
X-Authority-Analysis: v=2.4 cv=MpPHeGae c=1 sm=1 tr=0 ts=6aa1d408 cx=c_pps
 a=k4cRz1n5LqTufC1gTxF42g==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=sozttTNsAAAA:8 a=VwQbUJbxAAAA:8
 a=zsX9326DvithsK7MvMMA:9
X-Proofpoint-ORIG-GUID: sMtsesl0e16_UyY_UCWxre9LbUx1f1Fm
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDI0NCBTYWx0ZWRfX4xYy3hdA9JJx
 l4uY3NnMBf3nTdyzKtLErlCmHbpI+b0UfKrqBelDLHdRfHLzjNasmqWUuwpGIt9KOuyBgcqMey6
 8Zr6HwBP2Tzwifb7Mgdjy6epMJ2K+Jg=
X-Proofpoint-GUID: sMtsesl0e16_UyY_UCWxre9LbUx1f1Fm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDI0NCBTYWx0ZWRfX78rrNs1Z/66P
 fhksms4bBb04pbisxf+STwjuGp76YC3Ms1X6vSCrExr+mxKempOV+64WOztdnsLduLQTYsoJvWo
 Q4vGx1y3Q0rOTmWSPwLW1RYhPJlQ34qLLXQzjVGEwLR4mCyTT6x94SnVUPpx+6bKDYzHMB+G7kw
 PzOrM+r7FR21PdCEFthRBPIEre73S6IQTYxtyz25h6ItcTPfGs6RVoiomuhDnQXYixJarMZzzI+
 SPoP1wW01k3UcftNxbZJ0MT9yDCNtOrsHBKapo9nk+spdvNVBcZaRAlwKcc1rb79ZMZ7DkUxeh9
 fDvlIwA+roqzG+nonxOsKMruV9aC2FFp51y8EiZF8OQTjvDw7zwxZRhHU7X8wMOmahQfzEjyuMN
 slQ6Now0+4UpH8wgiGtLyENb87JnsyS0oFV1n5EHJHQA56bIKPQYzNrfTPWPaV3KPxFuxYTpOtq
 K238fAXmrYrw9soh+rA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-09_01,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 suspectscore=0
 malwarescore=0 impostorscore=0 phishscore=0 clxscore=1011 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609090244

MMC clock pins must be configured as OUTPUT-only per TRM [0] with
receiver disabled (RXACTIVE bit = 0). Change MMC CLK pins from
PIN_INPUT to PIN_OUTPUT to match documentation.

[0] https://www.ti.com/lit/pdf/spruj16 Rev. C: Table 12-257. MMCSDi I/O Signals

Fixes: 38c4a08c820c ("arm64: dts: ti: Add support for AM62A7-SK")
Cc: <stable@vger.kernel.org>
Signed-off-by: Judith Mendez <jm@ti.com>
Reviewed-by: Moteen Shah <m-shah@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am62a7-sk.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
index f6778f9798d40..e63c5200a2370 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
@@ -344,7 +344,7 @@ AM62AX_IOPAD(0x1f8, PIN_INPUT_PULLUP, 0) /* (AC2) MMC0_DAT7 */
 	main_mmc1_pins_default: main-mmc1-default-pins {
 		pinctrl-single,pins = <
 			AM62AX_IOPAD(0x23c, PIN_INPUT, 0) /* (A21) MMC1_CMD */
-			AM62AX_IOPAD(0x234, PIN_INPUT, 0) /* (B22) MMC1_CLK */
+			AM62AX_IOPAD(0x234, PIN_OUTPUT, 0) /* (B22) MMC1_CLK */
 			AM62AX_IOPAD(0x230, PIN_INPUT, 0) /* (A22) MMC1_DAT0 */
 			AM62AX_IOPAD(0x22c, PIN_INPUT, 0) /* (B21) MMC1_DAT1 */
 			AM62AX_IOPAD(0x228, PIN_INPUT, 0) /* (C21) MMC1_DAT2 */
-- 
2.34.1

