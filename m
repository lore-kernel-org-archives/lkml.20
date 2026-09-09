Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F0603E40F4;
	Wed,  9 Sep 2026 21:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788990531; cv=fail; b=lkfsIMf4lPpBsnvHBXKEbNWdBi41YnUpn0oQ1NZwJIox1UyJL8mhoYc6j57sCKuI0jfYJGu3C7TD58y6QtDcsFwZAs5w21GpmzLtAeiF6VrjcgraIKuFhOW0tlp2i+TWWrnXcMGS92nxfw641MHvixmctyYuCVD/Hsg6pz8LG10=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788990531; c=relaxed/simple;
	bh=nJ3YKkNx8W/5Muy5caKmiS6QBXtZcb0MN39iY5J93uM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lZiAxdo5ABemMAXAKAkEvwk47FfBqcLdJ2CyX7l1CeRWV5njKQ6VnVMIpmJje9KjuSHTGBq0Hfb0mv65vRVGSPbubw8ZT9QdAxX9SKL5zSUjiGrK3qGqUUmssqjCCs3NhROr+kK3wrSYcW7AayMBmSMlmx6l4f/7ZLuCebh3P0E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=N5K847WF; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=OYtXPchf; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="N5K847WF";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="OYtXPchf"
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 689JG2Tl3382335;
	Wed, 9 Sep 2026 16:47:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=Gm7BZWlri76CVBX2NsWVyl7ZkPqkEPicjaeqvGYWb
	ig=; b=N5K847WFr1Di8A1oVMweTHcIG1V9eBL7yrBX3IYTYEXb4cdEGYPy61JuF
	PA3aHpRFEp+XHA+Nk/PQ1RnUw/sUNc+KGHSzbkT5YBmmTQHAM2nXsHaMW5j8pH3A
	TO9Gj9aiqhNnv/0UGpb/hpaIl2syZXHixzgTYBFTSKLnvTPnLmb2Q2L1GUiqPTS5
	H+iDIQSftwPtejsRFA22fXacbfyOM3EREIFpXS9pOaIhjw1hybJJiE6CT8bU0Qzr
	caBPwGW+ZMIZCGK2n99oF3pmzsmeo0pAaBmTA607pB3FlPaH2EyFdOYCwYW62ckp
	qK7LHlhMmVKj/6tOcqI5M+0dykr3w==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012023.outbound.protection.outlook.com [40.107.200.23])
	by m0384305.ppops.net (PPS) with ESMTPS id 4gkcxg92sk-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 09 Sep 2026 16:47:57 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E6QE7j6qKbCfdQmEZhKTjm429Swj3dLIvj3PHMkHLMLIgJV0Uq2M4uDcQc8emgIA/c2lxRj/IBu9Uuc7fSof0jSTJtZTid5Wbpn+pjbVUrRMIKmPZXDlnPo+aBQCRXnfowPGqHfHLAIu6Mh0ZDTTJMrTiszca0YCP3TiYfbBNmJ7gzNyw073DwPS6mtKP9wAS/XbG77ldrByjvLjkXOM/UaciSj7hkZX1ht7/DFilO9D9pi3QjFZZL2iTT007/rZj0bzeM9lHNND8j9iTH9jF4YTQW5xaf+9so0HVPUdQ7AQWFyjtu7Vb6rM5Zf1kshooPDxFguicLDpPtj04qMYpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gm7BZWlri76CVBX2NsWVyl7ZkPqkEPicjaeqvGYWbig=;
 b=rtx8bZTNGuWESMKLm/TMI+OBIZHrmi/E+K7J58pgj+ra+AsoxJQY1Mb7a5/sncf1utqAXKOA2oIiQuQUzyD8IK/LCUyP4A6w5pjPmDFXeg77w9vdIatMd5ifqBNcYJ/i1Zb4zVRtWCJRa3DJ3LipsvSdqJ99F5KIZVGAuAwG0fwqzLCViqDoW07p0hBYVjwEs3J6sFgTotmZUKoFIG4PMs1wOTTc6OIDkUDsTE7elxK+yIg1i6p9ofEyTG6VA1wVGUtIvdRDwBrOCyJJWiVkMTh/D540oxSnJJuFbufecaWANDnoOPBeR/nbmRRLtwkTZUPsCDy2pajzjx8hORdwww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gm7BZWlri76CVBX2NsWVyl7ZkPqkEPicjaeqvGYWbig=;
 b=OYtXPchf+dYWIrLSmNPkhTmMPFSuXNChErlKovz1/Y2tlBn8RlTjD0SFJWy/DN+BxypiM6dED6YkvIYfC6DWVYN0l/symDDmI5D3Y7WcRZkJ3fhGyMfOvZx8linnmlECv5WEjidANJMpViNON+LLLLU3u/RXBNJDfn1712ylHog=
Received: from BN9PR03CA0639.namprd03.prod.outlook.com (2603:10b6:408:13b::14)
 by PH7PR10MB6153.namprd10.prod.outlook.com (2603:10b6:510:1f7::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.6; Wed, 9 Sep 2026
 21:47:51 +0000
Received: from BN1PEPF00004684.namprd03.prod.outlook.com
 (2603:10b6:408:13b:cafe::5d) by BN9PR03CA0639.outlook.office365.com
 (2603:10b6:408:13b::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.8 via Frontend Transport; Wed, 9
 Sep 2026 21:47:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BN1PEPF00004684.mail.protection.outlook.com (10.167.243.90) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Wed, 9 Sep 2026 21:47:51 +0000
Received: from DLEE215.ent.ti.com (157.170.170.118) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 9 Sep
 2026 16:47:45 -0500
Received: from DLEE210.ent.ti.com (157.170.170.112) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 9 Sep
 2026 16:47:45 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 9 Sep 2026 16:47:45 -0500
Received: from hpz2.dhcp.ti.com (hpz2.dhcp.ti.com [128.247.81.105])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 689Lli0S1072162;
	Wed, 9 Sep 2026 16:47:45 -0500
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
Subject: [PATCH v4 15/15] arm64: dts: ti: k3-am62x-phyboard-lyra: Set SD clock pin as OUTPUT
Date: Wed, 9 Sep 2026 16:47:43 -0500
Message-ID: <20260909214743.899477-16-jm@ti.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF00004684:EE_|PH7PR10MB6153:EE_
X-MS-Office365-Filtering-Correlation-Id: eab295e6-0bb8-4d88-54e0-08df0ebbff37
X-LD-Processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|7416014|1800799024|23010399003|82310400026|13003099007|3023799007|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	aZy1+CYU3aEveg3nkL7hm7MDVNeQAuY6wcPPoFdWxwkXNnhKlJkKl4oJI2KnWug0flPK2cL/YbwPHYuEGCug/mKuU8q0UZlMV6kJbQ6VRxuceLDiQyIkif/J1omXz6rzkps7tReHgaHq55/egqpr/rLK6fK1VRVxLiuAW28SNyym180FQ6xoKbvpxwM7FfZkmDRS9f/mCU2/1EDBmgxsczjdCHfQpzA7tvZF/ZYxEj+7ljdF8RG2Lncte6tCoWEU9ongNw32yoYo4m4cBzlUOnui1kibUiWi15Q9OLXepiJSyCDwHTzyhL/G6FIk0MXTie1pUU0oGdpZGFL6fzAl38W7uKeHiW2T9EjRIUcNUgKlEaZiJ5IwYD1lUEp5LgHe3YQohKfmBKws3TUadmGGxQswi1PmWZNQtA4FsAXL8gEJgvGA0w+CsFY3AhwjJNBtASzDgbr6mbjMEahWyuvA1LaWnOuuYscGsrHTmczwe5HwD0hiyRnSswu0zCyeiJKMTcedZ5X7GQDeHhmNFhf/sNoO/Lw82MbpW90HzFeKns2lZjOHh3BqyTy5p/Kb1/DHGVvFGGKY7cu26god8opNl3vxZfpOvs8ap9yq2cCXYcfKG+kk7XxLdKZt/w78JATR9HdxSev99ZEjh/wtRyPsq1U/NJhnXSAm9SjKyMPg+arxLmwJWhytjSfwqaydtqDi+U2ZqoTc3n2se6kdLRG4ng==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(7416014)(1800799024)(23010399003)(82310400026)(13003099007)(3023799007)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	BmhxePhSGA+gHOCNuVVZJFR0uwi9wzam1exv+rNobBt+8nCbGaWRZOaHhn/Fu8/uW/0bNDxsxs+CCX1ueTU0eLNqCGa00HTFaVKYCCvnC99ZtULdUAxJo9mi4uFxFZ5eqdFuIpXs1IzQdhkUR3RKSlrXcR6iaUKfxL5ozuZgh21Z1KlkUI7EDuO7q9qTjQxNLTFAMEbbbWLBm3AnYhfi19Nxs16P/uEVxObADIe1EPoeguC9RPqVrf7pclLew3l9Q1v5OQ8lf2EAMD/vVYDAXstNpMIfk6SyhgR8goHob7uhdN8AjEtaMA5hvVzlvSqGIw9tOvFDW8lr1KU8b44y8INh4yOFOCLP/k+mYmCO7QO8rOe+nZywhGx9NSE3/Zr4GzeTVT91JUivRM4zH630WB84lYWBzlhqV/7bXaHZmt0kxVx46sDwh2410ulVGWkw
X-Exchange-RoutingPolicyChecked:
	ehHEpuR1DThMb6m0uupOw+z5tNlmI5pDMLZmjrHWkWnEZpyIhFqZx4VLtc6sntWm9dITcWK7Fb7YBkEHTWczESKOjkudBXDSAPF4ApsG9vMuP26Cy/2BF9DGa2CgtgFLODtKACjO/eli/JQ3YwQnFuMd/OOaqaFbrFwVN3Kd9W73A2tpDr/DpYjstlj+m1CHjiuplDY4at0YeY3ZqaZ4/GCyrZQZN43wpPJqxIrIUWmo7jkUPo7/Kp+a4lRbTJ81lTuQDEJfT58/dj9FQu0busT2tvmw9BXva0HwJk7Br1UbdeEu804Q3YNse3bfNkbePqt1nFxreWX0RhBrWfhTag==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2026 21:47:51.2203
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eab295e6-0bb8-4d88-54e0-08df0ebbff37
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00004684.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6153
X-Proofpoint-ORIG-GUID: Sn8d37sf0rJxsOnWSOKDmC3TdcFuNmx6
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDI0NCBTYWx0ZWRfX9DuPykyPbEg5
 HVYV//gkCTuVWO2H46fXO6IxwGhSiB8tpkDQFcsibGMkQcR1tSKhtOL1iD20aVXBchXYvhypDmT
 aFI9VJdVyCKUvY59AaT5UFWnn9PlEfc=
X-Proofpoint-GUID: Sn8d37sf0rJxsOnWSOKDmC3TdcFuNmx6
X-Authority-Analysis: v=2.4 cv=MqbHeGae c=1 sm=1 tr=0 ts=6aa1d40e cx=c_pps
 a=P2JTm3oOj23y55bZWJDDIw==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=sozttTNsAAAA:8 a=VwQbUJbxAAAA:8
 a=-8HbyNZDMOqAlo5_pCMA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDI0NCBTYWx0ZWRfX5P3cVsehXnQM
 t0jtRNKYhwVKKiDhXjJrztKzzUTeVyoA0jP1TjY+CLL2rwfHJQ/arLAMrudCenrZRSzFTNHPazm
 eV08BE5+g9uiN4XnCFgaI4mjp8D6e/FdcgiD+uekVocg6H2zkGmTLswD+lwlEOni6Pt+Lmmbste
 WD6l4yNVLIp0UxCeFzyxonKNzbBpZ9A/TjXlXWG9NHM6UXCAzx/ZXQeJBYIDrdSGbRj7XtOu4Z9
 4CeQP/EZkjjJfs5U7L3KMULG+mx0B+9q6GUPgrhWuzgzieVjF5c0vP08J662BteeWA8kZT++Xtb
 XwLK7jzldgEBPTio1GboOAOEHxLS+9GJbS2Wanr1lwXL7wbMDPyfnoyPXgMtweHEfzrl1Lb3Fhk
 J/owdDyWqOE/BJxAbarLwsjcBLRzgaIsC7YbcemrCgSefOOmJ5/yl1xqA/jUstpssxvlyoW85nk
 H3fshyrwvpKGzpDd6Dg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-09_01,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 bulkscore=0 adultscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609090244

MMC clock pins must be configured as OUTPUT-only per TRM [0] with
receiver disabled (RXACTIVE bit = 0). Change MMC CLK pins from
PIN_INPUT to PIN_OUTPUT to match documentation.

[0] https://www.ti.com/lit/pdf/spruiv7 Rev. C: Table 12-246. MMCSDi I/O Signals

Fixes: f1b3adade045 ("arm64: dts: ti: Add am62x-phyboard-lyra carrier board")
Cc: <stable@vger.kernel.org>
Signed-off-by: Judith Mendez <jm@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am62x-phyboard-lyra.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62x-phyboard-lyra.dtsi b/arch/arm64/boot/dts/ti/k3-am62x-phyboard-lyra.dtsi
index d6e70ee15938e..c9b3e0518faf5 100644
--- a/arch/arm64/boot/dts/ti/k3-am62x-phyboard-lyra.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62x-phyboard-lyra.dtsi
@@ -227,7 +227,7 @@ AM62X_IOPAD(0x068, PIN_INPUT, 3) /* (R21) GPMC0_AD11.MCASP2_AXR3 */
 	main_mmc1_pins_default: main-mmc1-default-pins {
 		pinctrl-single,pins = <
 			AM62X_IOPAD(0x23c, PIN_INPUT_PULLUP, 0) /* (A21) MMC1_CMD */
-			AM62X_IOPAD(0x234, PIN_INPUT_PULLDOWN, 0) /* (B22) MMC1_CLK */
+			AM62X_IOPAD(0x234, PIN_OUTPUT_PULLDOWN, 0) /* (B22) MMC1_CLK */
 			AM62X_IOPAD(0x230, PIN_INPUT_PULLUP, 0) /* (A22) MMC1_DAT0 */
 			AM62X_IOPAD(0x22c, PIN_INPUT_PULLUP, 0) /* (B21) MMC1_DAT1 */
 			AM62X_IOPAD(0x228, PIN_INPUT_PULLUP, 0) /* (C21) MMC1_DAT2 */
-- 
2.34.1

