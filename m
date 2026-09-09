Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 991193CC32D;
	Wed,  9 Sep 2026 21:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788990517; cv=fail; b=DccLg4JVzWuE5F7JaU3JKPLvxlGU/kG3mvfPANrF9cOdgW3Zulh9YhejPNTgCthoAVAwbfYYLnLZx5+XVnlqXsYnH+utAO01P6/A+WejFjrV+PheJIyFJIgmT1VBVoo3vYJ9V5ZOtEapu/oTqv9WCsBQSGb9xZX1Q2E3OQ1OhAs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788990517; c=relaxed/simple;
	bh=v+YBLZ1GnjANOCJbCUPGCSABWZgWEiAtdBYGAtqGJyA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sypwDVuvEc3fZ6jnyrxSk5AN5t/tdGM+REb6ygj3WCmK13+L8bwcstkCXtd3CMhuCBdUnIKMAiXxnXjTzi41aZcflDjdrT5fA18coMPduK6HbrX0+gCXOkf3LHETbPkT3eAA4TYsqYqoHCg/P8oEa4toKb/LHvx3ry0GW4ioDbo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=nBN5WLGy; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=t4sknvQY; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="nBN5WLGy";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="t4sknvQY"
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 689JFvLD3382306;
	Wed, 9 Sep 2026 16:47:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=crCH9Dvc0GDaEM7b/W+eghhn+7OZsXLJ9j+ptdqWk
	S8=; b=nBN5WLGyfXe4Fr5XZ0ird57BzQwuk0mUEq4pPbSjpQvXcFHyD2xNexToS
	I0ROyWM0ipdMP7ByTF532XdwtQ7z2Fu6n0yOsmFQWCTTof1nJu2XSTU1uMwRh9mx
	MmepMEwYJcPVlCZneSKIJXk+e6xXCxApkJwqi6Gv63vh5KPsAqot1xZNIxWxBmzh
	fundqodBSdMXS5gysxMiKh44uALS4z1ZRvDfaq+b7+UQicurxWwXqd5gMCRQLbmc
	FQwoc7/Gr6rKOLOtkfM2ruK6ma0wyPLJklDyooZHJvjSXkAPbP7oJKS2GUgfDMyh
	r6IvP/1Eu8XKfRXIxP9RYKqb7NR1A==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013012.outbound.protection.outlook.com [40.107.201.12])
	by m0384305.ppops.net (PPS) with ESMTPS id 4gkcxg92s1-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 09 Sep 2026 16:47:53 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hKbQObwAoq0D32ELiyR8MFiWKw1M0rTe7w1/vrZHo8tSETzSNECpXEE9RgdFOSGMueLg3Y3pJ6ajt5XtW/l/FIlQ1RvQVr8KQmJmsBIT/WzfFpGIXFa7PD3b6h1deUE6C2Z13gYmPcUwaAZyqyG8D223wHrh2QsB8PiF+sN7YLFDQidFqUUoApxhj3XZsCuwkqKgVVRIlYjoc69dPOvaoNVIm9dLBUvIdTBAWDipVJkvOlKwA/zBSm0kkqGHHrmRw6+F0nWBxF+j/tKoV+nxcB+Vb5/iEmapSOVlFvZ9IM7Boa70O3xZR7Un7zdgnebiGdslSxtf4XDyp8q6TTeDxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=crCH9Dvc0GDaEM7b/W+eghhn+7OZsXLJ9j+ptdqWkS8=;
 b=rVB463XnFRDOimWFgEPpaMg1GFY14X/dh2A+y7d+ghjOCdHNcXU9+YX5ozkxsJBUtcoom2vWDm7NMdnIGBpUebLSHI1dmaMi/WSg4FqHRHYPtWK26mW4REetBVkhAgYPh8Ex0SaglQ2JjA7wFU61z60yFpOkhU5/r/LL8188uNVYf1iFAiDu1gdgR4wbPS6UVq0ApVA4gNWF+H975+Ldb2H3YNNAv/bv8/qLXQ1i5rKgAq4bd2Ik9It0y745AiP6Vqz3pDl4FZ+snGOeqbJDTuL21LI+TJjExUKUcy0Sefl2EjkKcg5Ssa3DuIZy8jBy0o6mSskNFkW+1RzzFx+OxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=crCH9Dvc0GDaEM7b/W+eghhn+7OZsXLJ9j+ptdqWkS8=;
 b=t4sknvQYcRxR6DGQtXi7dVc0mzBRLqw/xxW0GLzXBMz6ZJuTwWhXfKUoFvLAooPEYuLs8ER8fK20r84kSa5GoIPUaEXegXO6sK2DkP/1+dvdt072Pn8FsGSeAUSW5omjMuNCMYFgGPCo1ypE3A7Wlf1eFFtSecED+AX5YFRWBWQ=
Received: from BN9PR03CA0637.namprd03.prod.outlook.com (2603:10b6:408:13b::12)
 by SN4PR10MB997899.namprd10.prod.outlook.com (2603:10b6:806:4ff::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.4; Wed, 9 Sep 2026
 21:47:50 +0000
Received: from BN1PEPF00004684.namprd03.prod.outlook.com
 (2603:10b6:408:13b:cafe::24) by BN9PR03CA0637.outlook.office365.com
 (2603:10b6:408:13b::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.7 via Frontend Transport; Wed, 9
 Sep 2026 21:47:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BN1PEPF00004684.mail.protection.outlook.com (10.167.243.90) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Wed, 9 Sep 2026 21:47:50 +0000
Received: from DLEE208.ent.ti.com (157.170.170.97) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 9 Sep
 2026 16:47:44 -0500
Received: from DLEE209.ent.ti.com (157.170.170.98) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 9 Sep
 2026 16:47:44 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 9 Sep 2026 16:47:44 -0500
Received: from hpz2.dhcp.ti.com (hpz2.dhcp.ti.com [128.247.81.105])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 689Lli0G1072162;
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
Subject: [PATCH v4 03/15] arm64: dts: ti: k3-am62a7-sk: Set eMMC clock pin as OUTPUT
Date: Wed, 9 Sep 2026 16:47:31 -0500
Message-ID: <20260909214743.899477-4-jm@ti.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF00004684:EE_|SN4PR10MB997899:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a1b146c-5dad-401e-ec16-08df0ebbfed9
X-LD-Processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|82310400026|36860700016|376014|23010399003|13003099007|10067099003|3023799007|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	vnlN8pXUXESHl+zrP17XhmtoHMhOPjOLV9hp2TAYx5nU0IesmS0dwfJSGKAMt/hyuNRsejQBGJz4+CG6JHO7qATIGdEq9wP0RURFpwJab23Z19MPArnTKIAInnruWk6/GEnWFH1UkqulRebitv2C+6lIzLTlJTRiWZOI/IhIMFfWvgc/3GyyibPJTHfXx3jE3LDMJ0lOZPA/Wayb9wWPTfEXTGcbY2ljlbZZG/JRwe9VwPNIcJK2DTYpHqP+G8fKirMrDwTnJ1MKn+puhiav2thY7R5EtNuOYyFtS/37n3ifNuGIV/krpvbyPCHnt2unibu+BnBXFiKR1m9awtEYzoPBFEqJyrgZpnWrMcBCOTBWOfYfTLeAVJeOo5Q7nWTod2/a0QpYFFCxS2SnvTgNkLbsTwkrSK0Yq8oVQwLRLzscOUOuCXKFYuBmeSVDgrAt/ZAIF1nSo1MXA0EpgSXK7xx9xY/3A6D+oNblhOTb556QSfOayWDjNYp+uQrER9EaQWzTJ+XMG9/ZGP9lktYzE/R1TSSKsJxlmGN0ug6a52Wcu/yTRpyhWSVgThmkQWzptVzopFs0i3L8OKfC360lCpPUUpBwlTTpmgtx5EMvStIc0y3hTZwgGVsyYprz2i9reIWNI6fkSQubTg87eyuHoN1A+I707VJjdmRWTgGVPcuARrAcG3KCFtUZMfSW3rssXyMnKSx+FJJcbOtruX+TLQ==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(82310400026)(36860700016)(376014)(23010399003)(13003099007)(10067099003)(3023799007)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	IAs9DqQna2oBrgaMAWkZL7pzwBDM8qEqZYin0oNOCZch1wvrL8lmSW47s74JKDZJurrVshlEJWkjbtGXMa7nvLwLvV5yPu+dfj8wBV1qdhBA41P5uAFxTKCR3bWOUKiLuymPzO2zILUxSrb1Y01AxQLxQbq3thpQxZveBp1GO0dHYHrPBaT3eeRC1zupYCDw+98sKiLz92A7Dcg4jK4x2avD9mxfCC9Vsih8pdyKVdLwnwuKFI0jLmiQlkzkiisTc5ywU/n9wNBWZeMjgaCYe9bE/W0pRvQXSUuL2avNeAYnnF5iKAGeuiHipJCRh9ZQz+mEkOikDEVOfaG/7mXuHq5/Vi00RHXX6dImKvJ7x/Mwj5pBXu6+8VwcR6FRK7Uv4a3ocecQOmHADLJha2DKZKrPfE3XO0Fi6yryujAfR/8hdD+u4tDw0DkdHZoyyMVi
X-Exchange-RoutingPolicyChecked:
	IPn7QTrmZJ8rO6uVHTHqvuxiGPixlPFEml/ToOAVAk48np3MvmwKJK4KaFK+z8LyGhbdtucthOA3W/6bfGJ4ZZm9sErHsCeZ8g7pVrBI9l0+LenrlDRnkUk3+wWUBDgDRWWBWpmIeQkNPxnhY9OGyQD0eAAHZ/IP5sRtlP8TXQkUJZUPPdydr5cd/sbp7SQ+LOwG3fxdkQxcS+pKc0HrdYun7KlY6PSZdqfUtik3z5B4hgA1r4dnq2qkJmpjM7rKyd2QNDmzCjal6xPgl8+dkJDvaEbGhGvZ3k7sgauoqTi94qJUVCxBefojQj6Z5z2QcY/37gKv2HAZxrbJPdUoBA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2026 21:47:50.6107
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a1b146c-5dad-401e-ec16-08df0ebbfed9
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00004684.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR10MB997899
X-Proofpoint-ORIG-GUID: DRbnyNyMqKC8xiFUI0cUP6tNKM7-R1Yy
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDI0NCBTYWx0ZWRfX21/Lh8Cn9Rvb
 HYbD9tRHGLHVftKoqGDBsHzi9/p9FN8uSWjAVB0q3DBvSomYjLpjEqWyQOWv/VheclVzU7wWAwO
 HMrcc7sZ7J5A5hI2rvNqDnU//dEoC6U=
X-Proofpoint-GUID: DRbnyNyMqKC8xiFUI0cUP6tNKM7-R1Yy
X-Authority-Analysis: v=2.4 cv=MqbHeGae c=1 sm=1 tr=0 ts=6aa1d40a cx=c_pps
 a=4sSI7CCHlwd7s46xCM5yTQ==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=sozttTNsAAAA:8 a=VwQbUJbxAAAA:8
 a=py86r-KCYd5x2I3iXOkA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDI0NCBTYWx0ZWRfX2EVgJ3pxZmjl
 XtiaIjYD19iQJQCG+qglFclEaNMpcN831TkXSSBHw5ODgVKLJieBGPHUda1ce1D4ZSQ1bhZixQ4
 ao6IXn/NU0DkmywokrY1w3iVFMCgoeGKWRwAO/A3Hh0epsDAA1y5Y+us8KyXaTr4Ji1r+U2kfOK
 QDOSUdLGDLRRAtRaYrl37pcnb+YkCXkO9+HSXAezYO5+0pNQhhWiTPsyDY+23lUpOJaPDEBPKiD
 zp03HYrQISzq7MvzSArk8cGc6CyXseS+druRqNEStnFNRMZSyeJUTddcdJ2nCvH1XrRw/OndZWF
 1g5bXry30VG2JBdlHC0AYykoGodRrwAJvphWl19+wA+UgTcY1ubdlqQEpg5HhFw+hgOtViUszVl
 oJdhijbnltBx+aGyyQ1Sd5xwyD7Acs6VYbSxEk8//oWUsO5DC0deGwyV+aHSwnnVHBh029I1T51
 Qn3X+ZaCm76y6xvyGBg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-09_01,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 bulkscore=0 adultscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609090244

MMC clock pins must be configured as OUTPUT-only per TRM [0] with
receiver disabled (RXACTIVE bit = 0). Change MMC CLK pins from
PIN_INPUT to PIN_OUTPUT to match documentation.

[0] https://www.ti.com/lit/pdf/spruj16 Rev. C: Table 12-257. MMCSDi I/O Signals

Fixes: e041ec6e86e7 ("arm64: dts: ti: k3-am62a7-sk: Enable eMMC support")
Cc: <stable@vger.kernel.org>
Signed-off-by: Judith Mendez <jm@ti.com>
Reviewed-by: Moteen Shah <m-shah@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am62a7-sk.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
index b04636cab71c7..f6778f9798d40 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
@@ -328,7 +328,7 @@ AM62AX_IOPAD(0x0b4, PIN_INPUT_PULLUP, 1) /* (K24) GPMC0_CSn3.I2C2_SDA */
 	main_mmc0_pins_default: main-mmc0-default-pins {
 		pinctrl-single,pins = <
 			AM62AX_IOPAD(0x220, PIN_INPUT, 0) /* (Y3) MMC0_CMD */
-			AM62AX_IOPAD(0x218, PIN_INPUT, 0) /* (AB1) MMC0_CLK */
+			AM62AX_IOPAD(0x218, PIN_OUTPUT, 0) /* (AB1) MMC0_CLK */
 			AM62AX_IOPAD(0x214, PIN_INPUT, 0) /* (AA2) MMC0_DAT0 */
 			AM62AX_IOPAD(0x210, PIN_INPUT_PULLUP, 0) /* (AA1) MMC0_DAT1 */
 			AM62AX_IOPAD(0x20c, PIN_INPUT_PULLUP, 0) /* (AA3) MMC0_DAT2 */
-- 
2.34.1

