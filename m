Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D3DE49D58C;
	Thu, 17 Sep 2026 18:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789671549; cv=fail; b=GMqi4VOwh9YB0Xefa5HvITO4896I3uCk0IcB3iLhHQGQgq9xlFflSXgFv+2KiBF/yfJoIIlauvkuntF9zzE1gXD1OrUqPKozsRHPgUyXRrJkN7pL5Q4BsAhs1XdfFC8ta1YzK7ZWdUG9JefAxD0TQEqtcDKfxsRB0XYffmXzf3Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789671549; c=relaxed/simple;
	bh=gp9UQ+0fpNateDz5t0+75zrLQCN4lfOScnZlOYPrTE0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=i8jszKVRJuMB7cbIPYnkekvcQo7O8qm0hOLycllUT+ejPMrnIyD49240LVx+Jks0+gyOIsdA8y4f3S+2NcMDth1ZmlVdWo5ZjmlOYCij9VwtHhx2lGYI4fmo9/uIyNI8GF4Ke9PJlLrQoV5NIUiOPKqhu9CEDJlO3+92f3Y/4js=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=h2m+SEDS; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=ch/qLepX; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="h2m+SEDS";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="ch/qLepX"
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68HH6Ac51851026;
	Thu, 17 Sep 2026 13:58:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=ZlQhPYKmzwkmHhdShip/mdhnFH25fMKtYo+bgpFUn
	UM=; b=h2m+SEDS5euXotTwECfEapytt+xonMZZw2OrENdtZBJP7TlgWWjsZrOrV
	dPGwTZN6KlT7yPQ6ALKtt+a0bbKBg736iZcwN18WFmIi43kRdkwubmiJKj6AnHzS
	S1S0nsQ50ojf4+BbsATuE9azcMcCKexxlgvJyu1vayD+taMFchsnfi/fDL021xHb
	dH8lriw6XOR2r0v7OfejwnTYdg7k4i9j6atCgk14o5chC+V2ZFrydttUP/wybQ6h
	DOgIAFH4Kp57QIOucAZUx0FhNoMXDd6wnT5gVnggp+HUU0GMHHXbLqiHvQr42x4p
	2Y5Cby1oapDlSKws1X3JzpJ1DtDBA==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010031.outbound.protection.outlook.com [52.101.61.31])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gr8e95qyp-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 17 Sep 2026 13:58:54 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fFHKQz1lVB+m78W2SLmxrOhEpY47ysC+1uoVlxnv64rLwr5L2qf4625oGZPUn1qNsW6VTwbc1MUNe0nhIHqolSfUBIkGkmlVRQj2jpLuqV5IFsn6EEsnukJRyV6P8L9QVEa9wj3WWaf6spcW3ylDe9aswhuiSZfeJdx/HoYY2XP5T1BG3Tx1Xe1t3j/vfwIU6tJoSq3Wf3M7sysMOytm1usBIXMqoCyH1Ods8KNF0dNupDdU0CsMkayR2S2Dai/QzuWwII9iEVdUmMMfSlE0SMl0RmCOU0q2GxUqENFzu9MlEd0X9vtHswa1tzRuMcma1cGpMyePcQ5w7mN+fkvyXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZlQhPYKmzwkmHhdShip/mdhnFH25fMKtYo+bgpFUnUM=;
 b=rZdnHtInWyHm/O/ToP8/+98aJOT4Jkulj9Y/uSDM6a73JJhcPDy5jeIMXv7XEzeAXvFRA3+VYGEaxUAA0463RW0mzYp2RFCiQ0yYOoYy5L40cEe476KHPbCd6V0byHndZ9OPvQ0/v00JLRBZ0nI0QPqb1DU7MhKVPr3gM3q6L9AASbJKuqwnnWTuyUTzQ+iSQH9+ygwSNhx2B5+3fgHLt9XwZtBJpv9Xwz9t9TRJzrV8Itm6MmUGCodIGth2IT9AjuGZaO1Y0058Qh+7lUDvV/h9lzNIBGyIaWp3P/XshRS9tbhJbj1Vibu63N/IivJML1IXv2jRfbBewaG12XljRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZlQhPYKmzwkmHhdShip/mdhnFH25fMKtYo+bgpFUnUM=;
 b=ch/qLepXFu7o32RYZ0gQrNeszbx4bO7oMYY2GSJRhhtF4Bx7bBBrbf5CTjjkG0CSKDmkrB+xoDk4rLLc7kj0xv2Ad4XRBodHq1pICKJwhNFQx3/9cqq4SgZaHiFos39dbSmj9ocigYbMcTn9vByu4CjHWs60Yl3ucOTBOVIHQew=
Received: from SJ0P220CA0016.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:41b::23)
 by SA6PR10MB8160.namprd10.prod.outlook.com (2603:10b6:806:43f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.7; Thu, 17 Sep
 2026 18:58:49 +0000
Received: from SJ1PEPF000037A0.namprd04.prod.outlook.com
 (2603:10b6:a03:41b:cafe::5c) by SJ0P220CA0016.outlook.office365.com
 (2603:10b6:a03:41b::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.12 via Frontend Transport; Thu,
 17 Sep 2026 18:58:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ1PEPF000037A0.mail.protection.outlook.com (10.167.244.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Thu, 17 Sep 2026 18:58:49 +0000
Received: from DLEE202.ent.ti.com (157.170.170.77) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 17 Sep
 2026 13:58:33 -0500
Received: from DLEE202.ent.ti.com (157.170.170.77) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 17 Sep
 2026 13:58:33 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 17 Sep 2026 13:58:33 -0500
Received: from [128.247.81.196] (uda0506412.dhcp.ti.com [128.247.81.196])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68HIwWuq3528717;
	Thu, 17 Sep 2026 13:58:32 -0500
Message-ID: <b4e036a5-94bc-4843-a155-42f86f84b8bd@ti.com>
Date: Thu, 17 Sep 2026 13:58:32 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: ti: k3-pinctrl: Add virtual GPIO select mux
 macros
To: Akashdeep Kaur <a-kaur@ti.com>
CC: <sebin.francis@ti.com>, <nm@ti.com>, <vigneshr@ti.com>,
        <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20260917111539.3844577-1-a-kaur@ti.com>
Content-Language: en-US
From: Kendall Willis <k-willis@ti.com>
In-Reply-To: <20260917111539.3844577-1-a-kaur@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000037A0:EE_|SA6PR10MB8160:EE_
X-MS-Office365-Filtering-Correlation-Id: 244e83ba-49bc-428e-e240-08df14edb5ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|82310400026|36860700016|376014|18002099003|22082099003|13003099007|56012099006|3023799007|10067099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	tCfHas+TKY1kdo/utODK2PigoPveL0nclOyigBjIYYLtn1rSW+iWPh+3E0cdJs9dtvfTzX5Ql3ttg90Rcm1rXor+qyiQaeCaI0nJ8dv2UJVc/2yUzbkIuXBXoxFmXM/7g2bSoq6I+1Ir0/czgDm1WhsxL8OKZ4ABtvtCg7I4IUBJpbaxAeejMC5nOcmqotNKj1U1CW0jvHmq2fUBueWUew755uHy0QR4tprdw+z+Iu89Jfk7n27XNeaJbbbFfgVAABzsOkfPVhbo1CfIIJEiyhNFw3YZf7WtydN42EPbcTDtELNz+7z9ukQaSODZQqtYgVImW2Ct4+pTI2ei121d0teOvAQu4NHzToqBPhcy/D1kV1vRwhqjGScq39Qy3iu+AX2Bn22GhJZkpV9vkpdIUgTlznYl4WWNYTdHnqp4AyWNZZA8RYbew3zwUQRA/9HZvzUQXGPTivJyEkMiLWVB3Z3CCxbKS8cn3qHoN43H8XNKTtTx96K0D6KYsJSTC0dXo3SjS8RiHlsMfwHBg2/GgF5mgjwga+r/9kXVPyCfHXw2215FSJhh1aiHsGaN9/RxLjhQ0BrwRnIsqVrWgLgWBdCIb9ya3tXeTgl+/FyReI2uII9Y8IBxK5WVamUfEcB0LTOstgUctHY78hsKg7+/5Q==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(82310400026)(36860700016)(376014)(18002099003)(22082099003)(13003099007)(56012099006)(3023799007)(10067099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	lONuYvhtKPFZq9zTEIWxH+SQKGnsQPUyYHFXvvIYmI36L504pwLEhnE8xP/fgncHVCxOon96HIWut7qz9m51+TjMwfpl8e+iCvnAdNO9CumMUsesn/c0IxT8uU6BesfY1EDARzExqMdOdax6wXbUVg9nCXGBTal1h7R7tIRtJ5KH29SnqV+JV6v5YYbqi2lw8owbx/Q1ZLP6bPrQH6P3lvz/dZZD1m7TkMdmTNZeQlW5MxRqXi9HXI4A6BZz+0dBFfldnvf70v7K0RVyJbUlnvDN9p5Bt6ystfhlSGGEUhRIcIIYXQ7W+xE67hD/TEi6mHdkf88amHIwmrImUwEvB7h+hv7sV6xteNoLceZA65HeEaOqCTzoBCiOk5XS76lEkpMJ9f0UQirMWok0+d431ahJrIxCqsTcz+P/KDx+O4PJaXWYrn2Eki+O4Nfnd++w
X-Exchange-RoutingPolicyChecked:
	lW97T4H00SQnVACelRuQvoTImCD1v4iNloqvXvNGLSRRMJz12+lvBOozhajeNhMShBZ8Slq0Z0q2cW90lOgUV8Et/25y+RitIDWtIX1m9oqfYAnl2mS02AoBuO3isHgAEbbFuXXGS9MiCv4l9j7mH1To3nbyJEOpU20yFFEUU1gXrayFox2CVZHaWnefNFhlb+bpJirIXbfIx/gmawSclqSjaV2DpaBYAbRMeTrufjA+10jXt/3bBaMk9Mo8rt9J6X3MdFl+CkMFD+m5RPpKx/Y9ors207H/kOGxQApGmsanW/Y9xcqzG9xEWqSgr1jA4awI6qp+c4hte/W1L57U0w==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2026 18:58:49.6477
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 244e83ba-49bc-428e-e240-08df14edb5ae
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000037A0.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR10MB8160
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDI2OSBTYWx0ZWRfX573SIAQelMdc
 A1TA92LhUB9zsQy0paXXDYvUJ9Ar+OXyd6zs57n8Wwa2kQHnZDGDGUMch0udHwaDVnjohBV0XVz
 UeSmaRDnTplujdpBN/SBSwPP7VOafyE=
X-Authority-Analysis: v=2.4 cv=B9ssQ+tM c=1 sm=1 tr=0 ts=6aac386e cx=c_pps
 a=AR2WfxoYHs0IzVfHT2lLEw==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22 a=sozttTNsAAAA:8
 a=BVV3dX71HoyrP0r3aT0A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDI2OSBTYWx0ZWRfX9AlAXadIqgNo
 7jO9Lv0obz/pD27jeZ4txE9pN9yu6l5i8ZcQTWKg5Mr7hBIIxMr2aMOxxRv6O18M7WXwAc4lxk3
 oOkzU4aTdwMdxNRQl6lNUlvHC4EZuiTmSWB9bygGir7xniJN7yS1NV3rDUMVCjwanf/2cPVuz64
 9fuuo36LSQnKRcG/36RarfdgferKXf3pR2pT7Wedb5tTzqHPe7jI9eZCvFXS2JQn+S/2+NZRC5c
 rNwFtMn2/52NajrwgFPmAgQeF2PGM+0kqtCnsIa0cJX/fJ0JyIds17T+gzNRPuHq3mJRkY+Nrp2
 faUEX+4oUUw3dYysiXb7Uma1dJLfcfnS74N4FvpXQijVUivwnETxzEZK9J9k1PORniX1a0D9mrv
 dTUEUfW41krWci1bllp3AsFmCE8WhPgHfV79hHaZ1s/tnNzRCdQ22BkpsH1Mt2g4vVJLHXCANij
 qxIa3lxYmJTsS/Tz1Zw==
X-Proofpoint-GUID: qqSQ52l_eLm7Y8l1Sj19L9VQaoK8zzte
X-Proofpoint-ORIG-GUID: qqSQ52l_eLm7Y8l1Sj19L9VQaoK8zzte
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 suspectscore=0 adultscore=0 bulkscore=0
 malwarescore=0 priorityscore=1501 phishscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170269

On 9/17/26 06:15, Akashdeep Kaur wrote:
> Add virtual GPIO select mux macros to allow users to select GPIO
> controller bank for pins. The two GPIO controller instances in the
> MAIN domain share physical pins, and the vgpio_sel field routes each
> pin to either bank 0 or bank 2, enabling GPIO partitioning between
> software domains as documented in Technical Reference Manual[1]. The
> pad configuration register field description can be referenced at [2].
> 
> [1] AM62L TRM (section 10.6): https://www.ti.com/lit/ug/sprujb4a/sprujb4a.pdf
> [2] AM62L TRM (section 14.2.1.2.1): https://www.ti.com/lit/ug/sprujb4a/sprujb4a.pdf
> 
> Signed-off-by: Akashdeep Kaur <a-kaur@ti.com>
> ---
>   arch/arm64/boot/dts/ti/k3-pinctrl.h | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-pinctrl.h b/arch/arm64/boot/dts/ti/k3-pinctrl.h
> index 4491898d8294..d42c466fcc7b 100644
> --- a/arch/arm64/boot/dts/ti/k3-pinctrl.h
> +++ b/arch/arm64/boot/dts/ti/k3-pinctrl.h
> @@ -3,11 +3,12 @@
>    * This header provides constants for pinctrl bindings for TI's K3 SoC
>    * family.
>    *
> - * Copyright (C) 2018-2025 Texas Instruments Incorporated - https://www.ti.com/
> + * Copyright (C) 2018-2026 Texas Instruments Incorporated - https://www.ti.com/
>    */
>   #ifndef DTS_ARM64_TI_K3_PINCTRL_H
>   #define DTS_ARM64_TI_K3_PINCTRL_H
>   
> +#define VGPIO_SEL_SHIFT         (4)
>   #define WKUP_LVL_EN_SHIFT	(7)
>   #define WKUP_LVL_POL_SHIFT	(8)
>   #define DEBOUNCE_SHIFT		(11)
> @@ -111,6 +112,9 @@
>   #define PIN_WKUP_EN_LEVEL_HIGH		(WKUP_ENABLE | WKUP_ON_LEVEL | WKUP_LEVEL_HIGH)
>   #define PIN_WKUP_EN			(WKUP_ENABLE | WKUP_ON_EDGE)
>   
> +#define PIN_VGPIO_SEL0                  (0 << VGPIO_SEL_SHIFT)
> +#define PIN_VGPIO_SEL2                  (1 << VGPIO_SEL_SHIFT)

Would a better name be PIN_VGPIO_SEL_GPIO0 and PIN_VGPIO_SEL_GPIO2 so 
that it is clear to users which GPIO bank they're using?

Best,
Kendall

> +
>   /* Default mux configuration for gpio-ranges to use with pinctrl */
>   #define PIN_GPIO_RANGE_IOPAD	(PIN_INPUT | 7)
>   

