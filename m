Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.150.75
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794828852;
	b=BNVveh/m4/VSVMRVkZSHv4jALBGk6TTNQENBQgIh9B/eDNSDXV6QgfCeMwl+y40EKUz1
	 STW6lqgBvol8CY7KfPZYq1vP7sRXLXG4ZsQ+U7DO94QAiXDZg0csGqRl+gz++aALJtzwB
	 p+loCPQEkFQne4QVhpoFuWTc6WwsmTJc74NtXQ0qcmRxww0BwchXO7yc0ri+o+iNQnmHa
	 L50Q/l5ZNGfw9luyWvnHgIB/6f9ediwpf4M9vmac8DiCjnSUDdrYSLBcpXMACwpgb1B1z
	 ej7uMECHXsx/Zj8wVOCt655WmBiKBGOA9xeVDikSo2YbAS20w6TlTV26VIHGC5abv3Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794828852;
	h=DMARC-Filter:Received:DKIM-Signature:Received:DKIM-Signature:
	 Received:Received:X-MS-Exchange-Authentication-Results:Received-SPF:
	 Received:Received:Received:Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:CC:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-OriginatorOrg:X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=uT9p29CP5TaQqhIQyuGR92oIMf1czgXzBLABvdt/mJU=;
	b=U2fxw5tRs8e4N3KuWwSJWJTJfigxPqnFtfvOoiNJZxM/bzZi2VcnsjefzaR9lXL9PGIo
	 BjUrIP6eVEGhKlkCE/it/l95is5uwhTLpba8ftDpk+LFdpkuCeUCn935fLS+3WOkjyfT0
	 X68nXtq6y+CqdvmCDStTdEVyltdBC0YbcivZDqeISxRemPf5c8GXvBWEhQK5G2OLMUTuf
	 EJH4ew/omH4znToFiHSX4eAPD3e/2qS80eySsIWA3OjNI7kxKaBYz1uorNJaB/QpIWDIb
	 Nrvy/XD827RybN0t4qgZHhCPNP5F0NUZk2MNeZjs2Ndip+f+LAsMjHHJ5cFMBHkH00w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ti.com;
	spf=pass smtp.mailfrom=ti.com;
	dkim=pass header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b="ny2yEN/3";
	dkim=pass header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=V6NF1bWH;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.150.75
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC3F3606A31C;
	Mon, 16 Nov 2026 11:34:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC3F3606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=ny2yEN/3;
	dkim=pass (1024-bit key, unprotected) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=V6NF1bWH
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 6AGBKIBB1950201;
	Mon, 16 Nov 2026 05:33:54 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=uT9p29CP5TaQqhIQyuGR92oIMf1czgXzBLABvdt/m
	JU=; b=ny2yEN/3Et7/2xzFK9nekUxUKm5pFyrLNDzRPHJzhEhyW8uixHYO5hKGj
	TyVcrtzF3N8t5PfBV3dHbVzA1TIxAKDSb5ox++VNP1FJDIeidg7Rx+v3JM9HEZGI
	aCs3vK17Ba7WyEkQ1+SEu1OBAL6C5G8DJbLwSsk/AleYzonvYXttOVc+7Yo7zULh
	074ioLLEqul7s4vndlmlsy6mUThrj6lnhvr+c9b00dxgfa6td3Dx/WyhViV3KGJu
	CS6wzNCyPNGaYoCsGtnCR8UypL6NW5dL4z0TQu1nG58MnxKAARCPYt0V3YG/zGh3
	OnNkRPmYxjJRBMkVYzKldGlF4hKPg==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010019.outbound.protection.outlook.com [52.101.193.19])
	by m0384305.ppops.net (PPS) with ESMTPS id 4hyafsdg40-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 16 Nov 2026 05:33:54 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OgR5Se1bT/FDK8WnDI1K9JC0GFXfyd2nVMKypBXSm8U7p7UeTJy8M6mniF5vULWjo+VY8HLnCmcwNC0p+RZMGk0ZhADxWwNn8aPq02MF06FWMOieQN4wbjnaxvH1KAwZix7n5/Tel8nXzBNUCqHgj65gcf+OcWmw+T3NYfWFYpH+uMO3I8XIcM3xKQmDYqKkwBF2llUTv2pMnCr5KZSefbxssrNkMe8QILwUWV1EI//nKlq5b+/QJ+8R3Z09L4nmyJH8SAEirvtcUaFH7Mq9AmtLSstEkh423fyi4DGWAmuarTHTRAWttScGGqYOrHFfa1eEzZPjFNe9Ss6NfzOYyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uT9p29CP5TaQqhIQyuGR92oIMf1czgXzBLABvdt/mJU=;
 b=A2jl+vQIobF0kP/msB1eueqD1fROuWTRDAoTXLeqN6sqMxFEEETIo29tkhaYsl4zH8IEF53bPVZfxwq5XFETTGRj0BIpeVY7JwG7LUYJcg2tGhc0m50nel2Q0p638hTl9dA9TXt3v9N5lpVICzlYysdLJxQnjZxIKfjOuhUuarrj/zKDnhhDihDiYp++FqflauhWbe+UC3siw14hyyE/MP2BV2HvAFLx3Zk0YUGuyIZ/3HoBBj7Lvo2ktVeAj6B63P4MHYN7iowhHxrG3Kf2WA0PzYQE/lwqjT745pTK9cVCQKdKYknhIBPTGrMG1/rG4dGRHn4CWQDCsEIB7xhrzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uT9p29CP5TaQqhIQyuGR92oIMf1czgXzBLABvdt/mJU=;
 b=V6NF1bWHu/m2PB0FaR9FyPEi4RILBecfncXQ59kj67byqtc88HC6f6TuWYHyvkFHYqKYp9ycBI7bCu1R0lJc+w/Ty/QHZyTodQO2G1xg5wwmiR+qjZ8AkiJoHN/EXjlfZAlj5gh8Br5iVN7mIGNp4eJGK5Og0udBu6ili36GoHQ=
Received: from BN9PR03CA0280.namprd03.prod.outlook.com (2603:10b6:408:f5::15)
 by PH3PPFE03343C9B.namprd10.prod.outlook.com (2603:10b6:518:1::7d0) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.13; Mon, 16 Nov
 2026 11:33:50 +0000
Received: from MN1PEPF000793FF.namprd05.prod.outlook.com
 (2603:10b6:408:f5:cafe::34) by BN9PR03CA0280.outlook.office365.com
 (2603:10b6:408:f5::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.9 via Frontend Transport; Mon, 16
 Nov 2026 11:33:50 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 MN1PEPF000793FF.mail.protection.outlook.com (10.167.249.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Mon, 16 Nov 2026 11:33:50 +0000
Received: from DLEE206.ent.ti.com (157.170.170.90) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 16 Nov
 2026 05:33:40 -0600
Received: from DLEE204.ent.ti.com (157.170.170.84) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 16 Nov
 2026 05:33:40 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Mon, 16 Nov 2026 05:33:40 -0600
Received: from [10.24.50.20] (moteen-ubuntu-desk.dhcp.ti.com [10.24.50.20])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6AGBXZOU1657459;
	Mon, 16 Nov 2026 05:33:35 -0600
Message-ID: <699420d5-28b8-4238-8fc4-3a4e762265ba@ti.com>
Date: Mon, 16 Nov 2026 17:03:34 +0530
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/4] dt-bindings: soc: ti: Document the
 ti,tda54-mcu-scm-conf
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: <conor+dt@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <nm@ti.com>, <ssantosh@kernel.org>, <u-kumar1@ti.com>,
        <gehariprasath@ti.com>, <vigneshr@ti.com>, <afd@ti.com>,
        <a-limaye@ti.com>, <y-abhilashchandra@ti.com>, <johan@kernel.org>,
        <kees@kernel.org>, <jm@ti.com>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
References: <20261112091027.1601122-1-m-shah@ti.com>
 <20261112091027.1601122-2-m-shah@ti.com>
 <20261113-fancy-trogon-of-saturation-16fc66@quoll>
Content-Language: en-US
From: Moteen Shah <m-shah@ti.com>
In-Reply-To: <20261113-fancy-trogon-of-saturation-16fc66@quoll>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF000793FF:EE_|PH3PPFE03343C9B:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c9268b6-a99d-4bd2-96e2-08df43d57c64
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|7416014|376014|23010399003|1800799024|22082099003|18002099003|3023799007|4143699003|56012099006|10067099003|261022105027099003|261028144727099003|261026121527099003|261026140227099003;
X-Microsoft-Antispam-Message-Info:
	EY0eBxsA2JbPqphrvIdIb/it8pJIGP2DJA0wfkQGDu6PIhco2idO6Plyu5hxowAPu1zW0+c0QtEix/nHhFHwTlFFXzBupwDB1r0Q7WvFR+aPrkFpK6YaWyXAMIKWf9LuSFyrgyDHuVxkEgDWjxikwyOdb+c21Rp2oj9mqjKOplnvZVGK4fY8xfvJNT1p02I5WiDX4nM6FnaTVt87XBIDY7APG9BN97QuikGnYKk5CH9XOVDomFn3vM4FABzhKgronA5QlCfyUW4tOovoWqsuY6gRHJKHMedDaR4WmS7dCec4FFrps5+WpfuFUk7YGBqdh4d/RG/EeZ6t4A+yPERc5vyFobMoVh7OAwx2GHEZD2UKQ54DZVDJOG2BsHbJNQ7QXbmshMxtRaQZF3eW6OZE0mNbHCDZnZaSIkbovQ2Ju5e+/FAB3SpUfzRyiLCpMoD3INdXMijjl7cjvr3joNxTtOLbiQDK59cGO/YQfPdJEnaqhKzbXSHLX/M8UMqlYp4tZvyc8IfZ+Bi/EhJfZa2KpRTLjztcKRVmYMPmphNNTvqK1luMU8rQFCaV8WPeEZ4f/WSlbHNKiM6DvltLaJhkOnoeQfxhYBEJm0MnFZfIrBU+K4yLdCWnwe2y5emDxqstqoC9QD4Z8wI45zKeoWs5CVNQTji/avuNPGtQtgAVxNuMVGyFLPn7cWxMvJtTbCi600Ulxe2TJjlDNeBO1r00xw==
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(7416014)(376014)(23010399003)(1800799024)(22082099003)(18002099003)(3023799007)(4143699003)(56012099006)(10067099003)(261022105027099003)(261028144727099003)(261026121527099003)(261026140227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	NnAQGBMEjLtuaX9qHio3C0XOnGTYYv656+D77sC97YBs48mgoEbEps5B8Npx0/GhpoKfBzB15ssfWYXcQ0bBWucOOII13sHP1MemR1VIs07/TDHfg91kMOU3ecGnpjL4eXStDt0bhhyTR2Qev6/XEH79S7AdK5y/U7zTr/Eurm2CbyigBEbE2VbFfZVPBAmaxIT+dH2tm+UasZk3Xr3nnhErub+P4ko8sdW+uMhm4ikBSOtrcMwTfmJjXKudRJvuAfQGenToDZ3MBEb7czfpyJ7WeBCu5HTzgynRO3lBftOGGyvDrrv2ivN7rKIXvAZ2uAz6OIk+9ykIXl/E+A5xXeflUGMqKjsWn8+lSZUwMvxAsrDV28TA+olhvJJ7RW/8NmOeBvohqREJZuUm4IeChetLZYhHRcDPcuPnSIJl7kl8CEko8YxTiJCzM+NMmczJ
X-Exchange-RoutingPolicyChecked:
	WwDiLdezIZfisbmcxORXSH7cJMg3khSFFAsuTkM5G2Lr3ei1rLyNEhjZvFy67L/F/WjXUENYT3ShnTIWpKGoLfK3BGnxHxR8NCFfZMdyhJgzc3keupYyjjbn2Z4ecky0xTc/JrlVKkHLb4BzW+ShOYDtpJbufI47EJX3+K2oJ/bcBZDcHIkmeZz8ntW5ETyKDCpS0k3qANf8YwOP8jM1J9jmtOtdPZ7+RAr6FbgTx/pmVOgtGgOFtzSl/1nKd1TX9Ezsf0uPZumr5bhf60oN2Cs2kUmUOtUKk/suJp1rBGYvGGBtAwIh8z/el+wuzBDY+JzxvtxNiGrnpnXBsf9Y3w==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 11:33:50.2821
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c9268b6-a99d-4bd2-96e2-08df43d57c64
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF000793FF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPFE03343C9B
X-Proofpoint-ORIG-GUID: kDtsOvddIpxbGL8UzwvObflF5G_H2tdu
X-Authority-Analysis: v=2.4 cv=UanE26SN c=1 sm=1 tr=0 ts=6afaea22 cx=c_pps
 a=pRydOQwFKDU45SaoCSWz9A==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s63m1ICgrNkA:10 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22 a=mpRNqdfHd_oUoT-jwrkA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA0NSBTYWx0ZWRfXz/KPjtDcezZD
 SU1XSi4LyF0fy1rWf2yreYassfIoh3ouhHVL49K588ms3Jb1d7WY6D/H38EKqPv2x5+8VmaIMwr
 tqA3h4Pmyjl7wEZk3b5nQQBx9S4r4js=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA0NSBTYWx0ZWRfXwEfK/FG7Nlyp
 MBuiLCPoqPVu26aVo1eLtwKAg+Zg2FVEa5QvKfsE+raHuNIr8oF0Mi7LKsLhXS/xWifJcSC7NEE
 A8rou//fmFoQ9q3FoxZ2Owd5YT5iISXO+qf8Ay0dGf8xJpY7zr8mURpIdLf38LDzKTIg4ICs6uB
 FsjtLCwfPa3at5nXuXjmqmqP1KQ0Ebj9ogs3eyB9/16J9OFKUm9fcLNOqgKua/Mxh9IAva7VPAR
 byPpClA03bZna5Bk9H3BUZbx28LukwzIVzOYobDn8jIwwPeZI8JcGpY37KYf8GNyKxjkG0N7dWD
 zpSM/h4aoovwNj21+CifB4kYIqST1oO5/aVOwveE9CYcipNe+lrc+ZQ6E7sZj1z9BMxocVvPfP9
 vvR4LGok7HGDRi/MGRd9M3WotSwApiOgu/XWzBhr3EW4Wk4MqTaxu/uZlcS8a+Lt4kEmamOLVge
 zxJxhQHbOcRlsjkseqQ==
X-Proofpoint-GUID: kDtsOvddIpxbGL8UzwvObflF5G_H2tdu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 adultscore=0 impostorscore=0 clxscore=1015 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160045

Hey Krzysztof,

On 13/11/26 13:26, Krzysztof Kozlowski wrote:
> On Thu, Nov 12, 2026 at 02:40:24PM +0530, Moteen Shah wrote:
>> +  reg:
>> +    maxItems: 1
>> +
>> +  ti,proxy-id:
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    minimum: 0
>> +    maximum: 7
>> +    description:
>> +      Proxy region (0-7) through which this node's clients access
>> +      claimable registers and their fault status registers.
> Partially continuing discussion from v2, IOW, device cannot access
> entire address space and you need to limit the address space to specific
> window of it? At least this is how it looks in driver code.
>
> This looks like the MMIO space is wrong. Listen, if you claim that the
> DTB represents the host (or VM) view on hardware and based on that you
> add proxy-id property to restrict the MMIO, then why do you claim that
> entire MMIO is correct for this host (or VM) in the first place?


Thanks for the review, I got your point.
One thing I wanted to clarify before sending a revision: a nonzero proxy 
sets a bit in its CLAIM register to claim a register but for proxy 0 it 
shouldn't be doing that as per the hardware. If we choose to use proxy 
0's reg window we just have to check if any other proxy has claimed it 
previously or no. Are you fine with having a property in the binding 
something like "proxy-0" or alternatively "ti,claim-required", because 
the driver won't be able to makeout which proxy it has the view of.


Regards,
Moteen

>
> Best regards,
> Krzysztof
>
>
