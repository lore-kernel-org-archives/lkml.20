Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.150.75
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794927473;
	b=rrJ0IOUiLt3XOxYOPylpICNBORPewy/zCai1kIz1nGoOevmWwGXPybULzX7Sc9ntuDJG
	 8y2MajP4R+Yfqc0XkxhosCizBICnfisgBS6wK3j5LudIhgokwUVTSYU0oHgJS6yYeUNJJ
	 axB6UJzTo5tF+OM8UCNGO5iqP5ocxUMGYE5jZxa3pffiGupSRF/87x7gZRI8Rtf98s1yz
	 n4CD9keTtJh7vkG7Mqcof5H0jy/77Xq/+5guUhjh0bw6e80cbzxe+/nOQfX9aanLh3ysF
	 syp3+ubpjOLCyHzw4NR08yWkSBbFKTBXoKjRpFQ8iJMZItFr99SVRCqLaLQo/PMqTUw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794927473;
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
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=emhRh91iUGgCgU78TGT3h/8hhvwuvUqAXiwERTvh874=;
	b=zNIjSHgIMD16oCpjBKQ2HLxcqcehMlhZ4N3CNDRA1OQhHyLv57JqGH7L08A/hNSHgiys
	 BHLMPYOWmnsCN3BCFwXMN3EJH3Pa9D5A5HSdxDAfBxk7VXJfHJfjzjXaakFkVJ3bUlNEb
	 K35K3WhBJHwq1Z/l294fTkHFmiAADvrur6qK4ulbL2pU59zPaHsxQCjmsA3xGUNpP0UXR
	 MzFyq6Cza1JiL0vXIhyw3/2EfgeaTqYj1EE4rekBAW/WeYWlybi+AHoDC2smBXT3lQlBH
	 QHwF6iuyzQKYXJ9m0G7bew+f5/KPUaqg3pT4RlpIMLzz38YhYK1S7ug7iviUyX2XpdQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ti.com;
	spf=pass smtp.mailfrom=ti.com;
	dkim=pass header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=MsdHldtp;
	dkim=pass header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=h9hJTOrP;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.150.75
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 834CF606A32A;
	Tue, 17 Nov 2026 14:57:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 834CF606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=MsdHldtp;
	dkim=pass (1024-bit key, unprotected) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=h9hJTOrP
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 6AHEG472804377;
	Tue, 17 Nov 2026 08:57:35 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=emhRh91iUGgCgU78TGT3h/8hhvwuvUqAXiwERTvh8
	74=; b=MsdHldtp0XONw1npA66UeFRRxDYMOX2/hMVwcg7USWAp6Tkz/ZB9tMNTo
	l1SMTYdt2V2qYGOVoVMn0HdXA3dg549BB4+BYRWVORj+9szzA6c4H+mAoAhH5av9
	vrWHfQHicgtx+DnY12AxWz/jwP2loLJDtvIJrVF9t1hAL2CkMdZsdfsKBnd5k9MV
	JAhiPhRnebuq516p+nSqdvzaRqLA777aOYxgMdGuDl/NF2CzKYAB5hU3G/1Mln3i
	zmMUrIBtktgjkufPI+KwrmJfesWxgflpjPcGqEbzhEanOYDX1SeRqlpfKDCzx35Q
	33yuArsZS012yKN/xWMsQNcqMgzZg==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011004.outbound.protection.outlook.com [40.93.194.4])
	by m0384305.ppops.net (PPS) with ESMTPS id 4j0kxqsw04-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 17 Nov 2026 08:57:34 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EKsBd8/cOPQyfBXWcYbd+96eX0ocepoRPAzKoG4xaTc+Hj5LxG+ng8suOudCpRhgAjlf8o7yA87bTQ1BEn3KZHyP6c24KJZ6Tzm5H++tOwbiFcW7rz+Vqrmokxq4IG4Mwg6F7SwRxQzKozcmr6aUwwggUGRHrwnKdzeOrFCcD/nK5TrKPU/RzekhY1ieGjg0ek2KSWtGvJPB9zLuvsOO4MzhEWgspXJiM2pmM4g3YEl75MJd/3ROAOIaDOE2YOJBSWFCzRRLoL4ANSaXQLcZ7fccfbu4Zga0JdS0sDBx6lUvuwbL+B8Zfy6/JFEk5chZxtLAFh7NDv3OuxA14RlUXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=emhRh91iUGgCgU78TGT3h/8hhvwuvUqAXiwERTvh874=;
 b=XhkMxzQkoEfV/VFhnvnoc6CsUWHti29cA1YN84fQGQaIVb3vu141+9qKI26yHI6xk1iEX4/iZi6shW0AJgTR8O6+r5zFkKBRUIO6VkCvJeALAvySBsQUqet0wyDyoT6XXX+ezI98N1sMG+WlixUBt9zf0RvFJP7VTX7c+GNN4slm4Dac7LSJwEcu8uFus4E2Da/C8A9hbTJ3yWHLUiL0pHky8RThWjnr+DdQ3xz2SWQb/rcyjSVRK1ai/qNrur4TtHMNkIulDyu8bRtcr6qQ4KUfZD0ZUHN/r9dSt3qSdgETeyA/7CMrgtCR6o5OL4DaU9U878URDtu3O6iphj4Y+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=emhRh91iUGgCgU78TGT3h/8hhvwuvUqAXiwERTvh874=;
 b=h9hJTOrPD8/vkgQdpvyDrK4osbYtLpNaGFm0PB9WmlPwdsv1nXNkpfExr5aMkj5a5CR1KDjwtHNE5seHbg/27skR7j/CVmGLBLDQ70E3SHZGaNGDC5OrLHYPFs1ei+uL8qkcdBXIqFs+/knIrJTV+11gZgeWuKKQlluatyt/8Ac=
Received: from CH3P221CA0002.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:1e7::25)
 by SA2PR10MB4540.namprd10.prod.outlook.com (2603:10b6:806:110::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 17 Nov
 2026 14:57:31 +0000
Received: from CH2PEPF000166C5.namprd04.prod.outlook.com
 (2603:10b6:610:1e7:cafe::2) by CH3P221CA0002.outlook.office365.com
 (2603:10b6:610:1e7::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.9 via Frontend Transport; Tue, 17
 Nov 2026 14:57:31 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CH2PEPF000166C5.mail.protection.outlook.com (10.167.244.235) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Tue, 17 Nov 2026 14:57:30 +0000
Received: from DLEE201.ent.ti.com (157.170.170.76) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 17 Nov
 2026 08:57:06 -0600
Received: from DLEE207.ent.ti.com (157.170.170.95) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 17 Nov
 2026 08:57:06 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 17 Nov 2026 08:57:06 -0600
Received: from [10.24.50.20] (moteen-ubuntu-desk.dhcp.ti.com [10.24.50.20])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6AHEv03M3154206;
	Tue, 17 Nov 2026 08:57:01 -0600
Message-ID: <631b2c58-2851-40fa-b32e-ad50f90a156a@ti.com>
Date: Tue, 17 Nov 2026 20:27:00 +0530
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
Subject: Re: [PATCH v3 3/4] soc: ti: k3-socinfo: Export SoC registration
 helper
To: kernel test robot <lkp@intel.com>, <conor+dt@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <nm@ti.com>,
        <ssantosh@kernel.org>
CC: <oe-kbuild-all@lists.linux.dev>, <u-kumar1@ti.com>, <gehariprasath@ti.com>,
        <vigneshr@ti.com>, <afd@ti.com>, <a-limaye@ti.com>,
        <y-abhilashchandra@ti.com>, <johan@kernel.org>, <kees@kernel.org>,
        <jm@ti.com>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
References: <20261112081047.1550471-4-m-shah@ti.com>
 <202611130145.c9PExnQn-lkp@intel.com>
Content-Language: en-US
From: Moteen Shah <m-shah@ti.com>
In-Reply-To: <202611130145.c9PExnQn-lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF000166C5:EE_|SA2PR10MB4540:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f8888f1-bd4a-4595-6294-08df44bb1ad2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|82310400026|23010399003|7416014|376014|18002099003|22082099003|261009221227099003|261009223027099003|4143699003|56012099006|261026135527099003|261102123227099003|261102130727099003|261028144727099003|261026140227099003|261026121527099003|261021121427099003|261022075727099003|261026130827099003|261022105027099003|261022113327099003|261021123027099003|261022115727099003|261021130227099003|261021133027099003|261021135927099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	Jl2d9yxOEqFCYy6JA3sAVDMZ/sd0bkAh4q0WSR58aOJjdv4N0/Gw02U1d5cLYS9g5qX2NcEy5mGHXS0QTko2/m5XxfIfnmsHl50UhkOF7KfzLSF9kCJtqxHiqwLVmVRAQrH9y8bMn8hoRqlXKKfSXSMMLTGL2JWmeWS0eBOenyaxLiS4iJ3CpIES0WVXU/881opmXHYTZC2Pn4WXcJlK01OuZW8gUQdX57NfZhgAbrTQUoUG1raSB2BNNoNlaPzwRuAreiUAhgmJC8wtr0t7Qnf+tdgxilZ1RKTqrl/LQTvw+g4rEPG+nxhf6EHtEf0fAp4yX4bkqJ2AanWlnYTgDr5SzwZJPW/Z+t+keg5er6n5epLieEiGETqtISZSl13uEEsypn4pVGc/YrbS9a/povCg0AqjpTswJFGAPCf2LrCT0QwHgYzML7HMLRWuzdsm/7geFhRUrdHit7YKMFQqvFQpOj3okL+Yq0+U4rQYwnD7wNMUoLPC/NRmIzyfqV8gSGZt9MVwiwQb7DfuTYPZ2JIHfrXiHEDU0/pGbnodCrbQxl9OTgH2Y0wahS0pOvXsmYX/X/VhUdT7xKKq2683DzDgJoVVvn6/IIZ+hu9lVIoUWRwZsX9Pt8oAMN3df0xuIq1LPctlS9KnkkqR+N215w==
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(82310400026)(23010399003)(7416014)(376014)(18002099003)(22082099003)(261009221227099003)(261009223027099003)(4143699003)(56012099006)(261026135527099003)(261102123227099003)(261102130727099003)(261028144727099003)(261026140227099003)(261026121527099003)(261021121427099003)(261022075727099003)(261026130827099003)(261022105027099003)(261022113327099003)(261021123027099003)(261022115727099003)(261021130227099003)(261021133027099003)(261021135927099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	BADimx9HdqlFeI6fiuqbPlKAyNdif6bbzMeyM1USQBgxo89w/YrTfh2xGOE/9uPSrmKCvLGdz/fF4sfHsc0E04Sl7G9x/+pzsZDNyihFlV6eFNee9J1CXZy6fq/rEq2tc9EibkP3Zfp5DMQbPAbP/pS/Mf4u+BqbVKEQnRuOj3Ner5IFoafPGAduP1OIrqa7RC/kiakP1RxRz7JHOc+1T2/33BGhNINJ8e07VlmAn9MnhoUocxMZfzQh4JrbUjAEP9YKWQFU1N/d7ND1hWrBxX9i1WSODDbQB+4NboCMw8K9EDToaSnfHsj1snnZhYGuU8EVBDI9bHsq1jnef2IkeolXvKOQP5SxrN6U89GtCbAdYQWyqi9skX46QRor3p7se7JFx03/sDbldAmYqDVlueEkF404K3ZMlfqkN4oiU9UsEBkdHxaXLyRzM4ga4rLj
X-Exchange-RoutingPolicyChecked:
	VFfSzixapJqhsW1C29+el7hkc48t0Yhoq4DCjr8mAOk+0D1tTjIHv3LEgpMiaFE8KIS/dtS0d2VvTYzScn3uCoWkt4OtVIZ5CCBMW0p4rNGcG+z1YpuGER/Dqxp7osQwJRphzOgVruybHdDHKwq3s6IJPb+wyxxsFBiEXLc+1dIFoVRZnEBQOUKDj9+lyX/JIq3BOHorIdxPFehINTzrb1+4+bp96a/TEkXcm8j2Pq1oT4trl4Gz8qNcBv7geNxfcFStB34Z91bDn3VecDojV7Ho2gF5tzoJtEJTkcu+G+YPxXB7UfFcrRb1tG0+a+/7V5h/w2/gXMHH53CtB/KJvg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 14:57:30.8376
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f8888f1-bd4a-4595-6294-08df44bb1ad2
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF000166C5.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4540
X-Proofpoint-ORIG-GUID: jjIOnkk-QE9qjPiqMpW2qVQTPoYomySF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA1OSBTYWx0ZWRfXwQM2LjnbUvOE
 dem2MD+BWwo2AVjcwk2VMXXytgXlDRVZV1tGwPrW6SWHCz+QK1LzL+gOEkI2iYvXRc5WuRgqwCH
 BwMC4orrTUtm+TRDl159xVf/P96Zgrd8lPe10bvfpb1cwO4Am7DTr2z9AMF0914471bSFDjrJTz
 GT2qwsMxgwLce211IgSAC1xa57snSUSpB26dC9KpzJEE/xvCFL5+PD/mc9Geir4cd6Yvy6y8yPo
 XLT/ggl+pdY36taAyVsZG9ziN10i1hWCJj4T8IGTE+z1VBcyzZpT20DDqi2hqMJKLRWlNS/SERQ
 ZfnKH9n1G7koj9xs8y58zpW+ikXL7s71CrEBCmmZVfeHe59XQ7DZ0FiOVdtOhElJnKCBz7J6h0/
 pkFQqvqQ8V1MbujQI09XA9fzcHjrOQq4GlJlVTSThB4PLMedr2KZ74t212LEsac2s+JjoRG194M
 xjlP3TO94l71WcheOAg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA1OSBTYWx0ZWRfX2+PwuzTu29t5
 ibVgcMjcMZI8FPJAdDg3FzkHfRuZ7Yv+bHmkEvVBVIOBcFkFfMeP8SdT4PYhvxRMuk0nKxSKRhD
 UPzDIM4R8jP/YIejXQxGxw8TJk1f9E8=
X-Authority-Analysis: v=2.4 cv=DqzDa2/+ c=1 sm=1 tr=0 ts=6afc6b5e cx=c_pps
 a=FYRcjPsbj8Vbl0y3HSZiwA==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s63m1ICgrNkA:10 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22 a=anyJmfQTAAAA:8
 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=sozttTNsAAAA:8 a=i3X5FwGiAAAA:8
 a=QyXUC8HyAAAA:8 a=rLw-ruWA0F0lSeglUnQA:9 a=QEXdDO2ut3YA:10
 a=mmqRlSCDY2ywfjPLJ4af:22
X-Proofpoint-GUID: jjIOnkk-QE9qjPiqMpW2qVQTPoYomySF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 spamscore=0 clxscore=1011 adultscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170059


On 12/11/26 22:51, kernel test robot wrote:
> Hi Moteen,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on robh/for-next]
> [also build test ERROR on linus/master v7.4-rc2 next-20261111]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Moteen-Shah/dt-bindings-soc-ti-Document-the-ti-tda54-mcu-scm-conf/20261112-134044
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
> patch link:    https://lore.kernel.org/r/20261112081047.1550471-4-m-shah%40ti.com
> patch subject: [PATCH v3 3/4] soc: ti: k3-socinfo: Export SoC registration helper
> config: x86_64-buildonly-randconfig-1005-20261112 (https://download.01.org/0day-ci/archive/20261113/202611130145.c9PExnQn-lkp@intel.com/config)
> compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261113/202611130145.c9PExnQn-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202611130145.c9PExnQn-lkp@intel.com/
>
> All errors (new ones prefixed by >>):


I missed committing the file while reworking the series, I have sent 
another version[0] fixing it.

Apologies for the miss.

[0] https://lore.kernel.org/all/20261112091027.1601122-1-m-shah@ti.com/

Regards,
Moteen

>
>>> drivers/soc/ti/k3-socinfo.c:17:10: fatal error: linux/soc/ti/k3-socinfo.h: No such file or directory
>        17 | #include <linux/soc/ti/k3-socinfo.h>
>           |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>     compilation terminated.
>
>
> vim +17 drivers/soc/ti/k3-socinfo.c
>
>    > 17	#include <linux/soc/ti/k3-socinfo.h>
>      18	#include <linux/string.h>
>      19	#include <linux/sys_soc.h>
>      20	
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
