Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4482C2C027F
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 11:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788261810; cv=fail; b=Ik+AkCsgpwQJ4u7lovOnsSyqvWEEJH24/5FUTAgaKP3tu9A5U29hoj5jIvU25JIIx555fvv0lNmW3Zjr4AaR2/Twn2R0z8rOas3xj0Fowdsd3K5cx5wRJJj7/HCdP52Yp/OKkBvYkjiBQOi+7fwD0rTZWkIpCp6wMIwYkljjl/o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788261810; c=relaxed/simple;
	bh=FuwxKpOMk70lCfJhaJb3xWmKaz8/6nqs0w3qikz1XF8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=QLnHDuDJePenMvbeh999Uc1MO8ySLMDEURScpmE1sqzU9dyDrDueKtKr+LSTE/WSjx+DFFkQ1lwRgqTSxW0Hi8aA1gbo++xB+n7HOzuIjRsp78tZF0LB5zamFmF2qr/x5PVF2Gft8hlyU3T6T+XYEZG/QaaMMNG9jXAL9EJw5F8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=EzQXhWXy; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=j5+sNS0u; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="EzQXhWXy";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="j5+sNS0u"
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 681AJvvX3487661;
	Tue, 1 Sep 2026 06:23:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=E3WF12ANObAs4WTFm34PONStJp6DeoYQUkcJfSk5l
	LI=; b=EzQXhWXymoWCpLIowtVpIVz16ZkgpcVKoPV5/vyl/WynrhvZsxy5IhQNt
	YKawK5S5Lu6dPjuZdOSQFDoTHyMsJp53FUqHshh+NT890gnDXiofNdQLX7H8v02r
	LViSwfMZH5wD6hVj7KfiUsxYOo3wvMSBXckAXg89FkbwT/Fl3JP60chysueL86ex
	HE8k9CGSB+GcelSEeHzxO3i8QUa5NM0uBBYJMbHObj1y1Bt7eKAHV9GmnxRq1Luo
	yg3TYckrcjU/1t2musDgtWAnrGyezoUVJGupLb4jJJZ8TdCxfz/57yPi/RDb705q
	APIM3/vqHRgJqrmm0P+kUYjxmzCpA==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013030.outbound.protection.outlook.com [40.93.201.30])
	by m0380145.ppops.net (PPS) with ESMTPS id 4gdpfajsjd-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 01 Sep 2026 06:23:13 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rY00Ak25/eSiCuJFGun9Vd0BMo8UTRnr0XQ/9hIM9r5VQY1/prcbW6hTnsi+HyM98A6Oi/iT8mZfAtyJj06PoVT+3XeYSyBpZLWEFmPPM3pJf44xcslANg8or83l/Q+ZKlt8hoGsqXTNMHwJgoAJVo7jpk+4DSMmD8qaOczTvPXD52l5BhGJs5luWZYmBWbwxpKLrJEB5cgzK9buiKV9TC3SXGijoAsMrHIOIAFhPhpWhgM4bPwUh+to6Bld5PmM8DCGdbjh1yRW+zaoxIKJHQl20WU4OmU2zELwY3J5sWv3SWkg+5J/2rWpOWc0EdPbNczTLcZeoNpnUVQMT3bRoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E3WF12ANObAs4WTFm34PONStJp6DeoYQUkcJfSk5lLI=;
 b=Gs/HPGjW2yTmTpoEkpNrrc/72cTisYvLiZw4OLiIRyJKvpl4P/A68lJf38uduA9+tb0atSlrUfoMLpMu023LI8kKpB/lvkLr4CfuElN41imqsOwnywiq5Rrm2pFPfiNzEFsa9cs2a0KvFS3M89AfXxxzV1wXFMXBcCOvsskYKXlpmLvj1SllLNWtHT/YPgZZgBiQhXi9wXb87flUI3N5y4qsJFBZZytC2Arq2XMMgcTe3MleGU0NzqVxCKibPS20LQtx7Ck17BqEYElfW0UrQJWPSyH4uv/4ClMU8wgOhWV/7dUkuJE2HEJZ9LuDmQBtbUJ4Qc4TF4c3fYVgTpRVeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E3WF12ANObAs4WTFm34PONStJp6DeoYQUkcJfSk5lLI=;
 b=j5+sNS0uO9W/8ghdBM32cjzXOveiCw3rsEDKDfdfVERUdNx/yhvOJPgZoCey6suVpkWYC0ugnUx18i/MeqPb2iOBqM+mxzsrpCAp74Ihq1ExIo1/ErEYqPUCSBVEm3UJtSJo5FT1nNuGNbCMLVhUeKYaNSDghofOJ7n3aeaP1eY=
Received: from CH2PR18CA0021.namprd18.prod.outlook.com (2603:10b6:610:4f::31)
 by CO1PR10MB4596.namprd10.prod.outlook.com (2603:10b6:303:6f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Tue, 1 Sep
 2026 11:23:07 +0000
Received: from BL6PEPF0001AB52.namprd02.prod.outlook.com
 (2603:10b6:610:4f:cafe::1c) by CH2PR18CA0021.outlook.office365.com
 (2603:10b6:610:4f::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.10 via Frontend Transport; Tue, 1
 Sep 2026 11:23:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BL6PEPF0001AB52.mail.protection.outlook.com (10.167.241.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Tue, 1 Sep 2026 11:23:05 +0000
Received: from DFLE207.ent.ti.com (10.64.6.65) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 1 Sep
 2026 06:22:22 -0500
Received: from DFLE213.ent.ti.com (10.64.6.71) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 1 Sep
 2026 06:22:22 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 1 Sep 2026 06:22:22 -0500
Received: from [10.24.68.129] (a0507033-hp.dhcp.ti.com [10.24.68.129])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 681BMHRd2694716;
	Tue, 1 Sep 2026 06:22:18 -0500
Message-ID: <d07c20d1-02e6-41b8-969c-fdacfc6a4b47@ti.com>
Date: Tue, 1 Sep 2026 16:52:17 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] arm64: defconfig: Enable J721E and Keystone PCIe
 drivers for TI SoCs
To: <krzysztof.kozlowski@oss.qualcomm.com>, <andersson@kernel.org>,
        <geert@linux-m68k.org>, <dmitry.baryshkov@oss.qualcomm.com>,
        <arnd@arndb.de>, <ebiggers@kernel.org>, <luca.weiss@fairphone.com>,
        <michal.simek@amd.com>, <sven@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <nm@ti.com>
CC: <linux-kernel@vger.kernel.org>, <s-vadapalli@ti.com>, <danishanwar@ti.com>
References: <20260810121359.134936-1-a-garg7@ti.com>
Content-Language: en-US
From: Aksh Garg <a-garg7@ti.com>
In-Reply-To: <20260810121359.134936-1-a-garg7@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB52:EE_|CO1PR10MB4596:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c3b30bf-7c9f-4523-1026-08df081b64af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|7416014|82310400026|36860700016|22082099003|18002099003|56012099006|13003099007|10067099003|921020;
X-Microsoft-Antispam-Message-Info:
	oUURxO7tic2cAiGDF6PxYQQdzsNgjcW+6qOJXaCh6ny5aF/o2n1wO7xo8sl63jL8S0InXjyOsgU/cGbBEm4U9jcgIF/8MZKOKwR2t7EENWJUIOdiOCjGmnrIMr4/z7BZh3yDPbIVltyHkfxkQHCi8ui7FCw52RcNvirJRkwNyIINexc7FGj6DcgXU2hYz+8QSsMqGg0f+CW5KFNOf6DSGowIC+rHCo3CUbZiEUga3zja7yvKfASLUpJXpSdg3kC26/fkqVyy1VRY+1khiTKjpUztmKLRBJpOJgumMOr7ISyouGHob3ZKPuQ8gNbvD4DBmkQemR/WwrTOFEB8mGHtVA+dUsSx1sNIGD7UFErO7VJaUDKsAy/KIU+TOnBxGjHohxinA3u+hH3208mu3xozMci5glY9vdtGlSFpxFhP1HTX+/M9/ysVxohMdUNAvMGoevBK8f/twGIGWAmI4YctnwOrcteEa/n4I0cCUoSRgwwxjIgnuV3ALO93x6J5a+EkD5rf5rt4W1lBCYCESPzX7Yw+K4R9MUH4/XAplSt9xqOOVLNjqiSx4ByK80WSVD6W2Vv1FUjYxn3852raiDkPJPmMzvP2kyoM8OwM3vSuklBzmclo2KNLH1UX6JFzC6wbFT0RJYZN1jqsoZlXhUNJYc28MBWfM62CoM1NEEo4zwFsBMdzwT0s2u1Lv+vAiaz1ksM1bEI1YI3XRpM9qWKvRs/C4FIolHPZnSSzii4mioQl1QqCgqADAC1hzviwE4lA
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(7416014)(82310400026)(36860700016)(22082099003)(18002099003)(56012099006)(13003099007)(10067099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ASjlO9/KbfaTP4pc9ZgFbTFuH5nyOvPQQSXnxBsi8nTCF+yeKSPBhINHaaaXJtaeRuS3mv1F9Gbi41J2Juk2YjIZMaTysmfDJlmLTIMNf/+W51G7roipMzjAMM0PxYGnVY5r/094IpOule7J4RES/whY7Yh4/xGjGb9R5gz07Fu8B5P9WEaG66grKUntJT28FBXmzS9CwvoCLSEVlbod95Tt1T5NvhHRm5wZIIW0MBvSE6Z5BR5EgdlwRIVKuFRI0jM74IAWjvzcx53B2QIv+HCGK/HW3rhACBVun7ZVINlK8YQFn+DHiofy2CZClrFmpgIr78OSpIh2j/rGtFbxvl+MLB0Ey9KuyfS70WiyoW8JS+jssgXxCoZfsCCfgfPRiIxx/lhtbyvKlWhIEhCVUJ5PWcEd4mhCqLH6OmldjJwwxXTwS9WibpHc78O9CwS8
X-Exchange-RoutingPolicyChecked:
	ptQhrI+zpJuf+0oETBGiDQPhrXxhQhnLrnY8a7fDpsYeEdtu7kAh7vezaRqd4LdDbgOt2wwO1ot1reOWmDWb7xqEz9Ri3sCYVWWiwadMVMPNPPF4XFAsTBvaPXwWRojI53+zj5rpgY99ZXIS6OUPvXhqZ8EZLkIUIhtlhxGGiKxr0eZFW1kOW9JaCg3R3FW4B7Em7R3jxt1WCxI2SVPJ2Yay5tpS4lfyaW8DbqSPC0giCJM/crY/HZU2EtYkKGPLJ5h/hGSC5Z1h5/358j5SAt3Gh9EDIKkmbDidG8La43ZYzBeyHGaBDSo72MTBT038b2XvIqfZOgRY+ie+Ik/QbQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2026 11:23:05.4966
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c3b30bf-7c9f-4523-1026-08df081b64af
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB52.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4596
X-Authority-Analysis: v=2.4 cv=Cp2PtH4D c=1 sm=1 tr=0 ts=6a96b5a1 cx=c_pps
 a=9fOKxQ6q+1oHddUNM5AUXA==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=VwQbUJbxAAAA:8 a=sozttTNsAAAA:8 a=EUspDBNiAAAA:8
 a=1-wU10Tum9WRLzKt_OcA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDEwMCBTYWx0ZWRfX7WL6btXWu6j+
 RUdNjoc7Xv5zncbdk3QjwJHzXYITQgQ0BwVgpW10nmE97DNiuNVbBeeiybNufK22J2Rz3u6dI2S
 jcbfqL9U9MwlPnaduB/ksH3c8N8nuRo8ZGfSCfc3T8CrsmYTVPfiCfbUP3W46OhMZe7npYXOnit
 4cqf2Tc9IGY9XxPq6CI/iv1OLUeMdtjuCRi8MllO1T/DSAwjpywIaaAmkxSm/jFkH/N0a7psDo3
 CAHEgXby9tHnP7Zb7nAhFZgQMannnj3pOEnqOrVah2sDW4DEbf0N3LZ+VmoTnwf1lKEZeh5grkN
 Cum/1z8ExCrutz3JrAfqwONaKNOrQ1eaMakF9Azeq/KvG9rLhKj1zeyFoqSD26TiLpQ3rWcxEvf
 zcGrbzBOetLlajEigWD4UQ8RX97/d9EAp3+zV74Fyd04xdVsZNmhPG/wJgDk244B6URGVlxtpNL
 9Pgi2eBMlZetF/vztHQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDEwMCBTYWx0ZWRfX5ucHpeI2/82v
 anQCQXDC2qn2fO3iPx98b15+S28vB6B9pSzAQANXBU4osiI8Yr52Cuj5i16ao8lVOr0MnfKn/le
 7cr2jNDO47Va7UuyzPGKOeQWbbR5NR0=
X-Proofpoint-ORIG-GUID: EjxSM0CiakWz9ExErF5T7rtE3FGNl379
X-Proofpoint-GUID: EjxSM0CiakWz9ExErF5T7rtE3FGNl379
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_03,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 phishscore=0 adultscore=0
 bulkscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010100



On 10/08/26 17:43, Aksh Garg wrote:
> Enable the J721E PCIe endpoint driver used by TI's J721E, J7200, J721S2,
> J722S, J742S2, J784S4, AM64, AM68, and AM69 SoCs.
> 
> Enable the Keystone PCIe driver for host and endpoint mode used by TI's
> AM65 SoC.
> 
> Signed-off-by: Aksh Garg <a-garg7@ti.com>
> Reviewed-by: Siddharth Vadapalli <s-vadapalli@ti.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Hi Nishanth,

Can you please pick this patch for the next cycle, unless you see any 
concerns?

Regards,
Aksh Garg

> 
> Changes from v3 to v4:
> - Rebased on 7.2-rc7.
> 
> Changes from v2 to v3:
> - Rebased on 7.1-rc1.
> 
> Changes from v1 to v2:
> - Squashed the individial patches [1] and [2].
> 
> v3: https://lore.kernel.org/all/20260427044404.222396-1-a-garg7@ti.com/
> v2: https://lore.kernel.org/all/20260317063902.262392-1-a-garg7@ti.com/
> [1] - https://lore.kernel.org/all/20260223104609.876613-1-a-garg7@ti.com/
> [2] - https://lore.kernel.org/all/20260223104650.876632-1-a-garg7@ti.com/
> 
> 
>   arch/arm64/configs/defconfig | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 654a102cb5bc..ee3e97b2cb91 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -222,6 +222,8 @@ CONFIG_PCIE_BRCMSTB=m
>   CONFIG_PCI_HOST_THUNDER_PEM=y
>   CONFIG_PCI_HOST_THUNDER_ECAM=y
>   CONFIG_PCI_HOST_GENERIC=y
> +CONFIG_PCI_KEYSTONE_HOST=m
> +CONFIG_PCI_KEYSTONE_EP=m
>   CONFIG_PCIE_MEDIATEK_GEN3=m
>   CONFIG_PCI_TEGRA=y
>   CONFIG_PCIE_RCAR_HOST=y
> @@ -235,6 +237,7 @@ CONFIG_PCIE_XILINX_NWL=y
>   CONFIG_PCIE_XILINX_CPM=y
>   CONFIG_PCI_SKY1_HOST=m
>   CONFIG_PCI_J721E_HOST=m
> +CONFIG_PCI_J721E_EP=m
>   CONFIG_PCI_IMX6_HOST=y
>   CONFIG_PCI_LAYERSCAPE=y
>   CONFIG_PCI_HISI=y

