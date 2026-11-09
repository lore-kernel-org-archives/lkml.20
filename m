Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.154.28
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794244094;
	b=WAmm66Pe0fw1WtH5F2gQ0vQ1kcS694+tVdF4OivlGnysSmWfuQeCgFPFn6/0IN5MAaRG
	 wSsc50TCUa1euOqC/DSUPhHzgSwiqr8xI9FhAF/NAlxb8kwfm6T3Q2dzkktYwda5HOANt
	 fxohprSkw1mEKELu00XvlZb/ukPgDhMTiHyyMb5nK/C4FDqwYX9BBg0IPSpjXjxCxKrHV
	 XN7oTvlR94OXUMh1JrM5ccIBtdhBkOUQEjIPW4UMUllK/4Jh4HPLW+/U2GNmDA2GnRTso
	 WdOBvTFyV43XsmG+U/cyjOlQRAJRDiGHPIVNKG8D8InVRoloVWlAdxN0hSvmThz0MtQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794244094;
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
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=F7z13PlQF4aJ9OoUggXKQ7OXmBnQelameN/piMuqgZg=;
	b=hgg4QapIkJgCn4/Njnn0ktfhJ4OsA88uRAWS5TZ6g4j8K7u0/Uaoy7OZ4Drqd71h2RjA
	 P5h7dC+8U8RjQ8K5OgIqNeQ3RDLZitHQVlVzJ38FkDDOIty4UNnReWAeBK3GNOlvT2OY2
	 MrOfeM6vInH0cPmdAAQQ59JL2Djyedm2VE8uOaNv677aDTyWIhDMAWAHMGVy8jU3ktbBi
	 PAcaufVfQO04pvMiYoBhTuFAAGsi+f72rUOhpPT/h4jsfVeUqOy/j6sfMZ+DRz7HJrwRq
	 qKHaFkYK0PVHVVIPknmNx3SgfB8zrKXXEWp4GUuuOG1NbX4nFK0CZGhmZyOJ4Uidv9Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ti.com;
	spf=pass smtp.mailfrom=ti.com;
	dkim=pass header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=XNbGcooE;
	dkim=pass header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=Z8rd2AAi;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.154.28
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8007E606A325;
	Mon,  9 Nov 2026 17:08:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8007E606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=XNbGcooE;
	dkim=pass (1024-bit key, unprotected) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=Z8rd2AAi
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9EjZel2987151;
	Mon, 9 Nov 2026 11:08:04 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=F7z13PlQF4aJ9OoUggXKQ7OXmBnQelameN/piMuqg
	Zg=; b=XNbGcooEmDlVKq/Uzsl1o6u+hQnNtwSeinCDDxK1lKb8+fgNZOUQ0FX5r
	Hm603ozYl7kCKb1iOdy9jBnc6w5DJfZ67c+7GXRRergWEakT3PCKMZA0kd921zjC
	rzCXLUl93kHuVxYIgpdATPDTkjewfrE7UCOQY8KLl4M8H1ST+qIFS4RHLs/jTTUc
	tfOrShWzCTisiY24Bc4fsVKHqDLtQEA9ZKSU0M4t4hfW5UzIDLwzJYG9lhJZtkoj
	EI04XX5/PVzzSbeieGyLNlRAnxdQPcXc8B7HZ3sYMAmBckrtubZP6hppgxzGOSP3
	4WP58XvSx6nBxgQW1wDI0EyRJdikA==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012042.outbound.protection.outlook.com [40.107.200.42])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4htm0syrxm-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 09 Nov 2026 11:08:04 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mC1lzKIIq88PKEbt/9yEcT6NW569eIjp/LALQGP7PU4TdsbV6N0QBZJAmaJUVsxXFX3HusDarI/ut5YuiCgGIdnyjZUOEK5zR9FwrjJCOrpBBegbux14QFwdZTIQh0WZA1vBt7+49sZCFq2K4032m0L6GnK49aMJaZQoWxTIzuFRDw1+P2W6UodaEDPEhJTqnQYxN1z7G+uRoGz6G1uomJ6AgZzh367OorqCwiRHJFg2ZS6iAY8hTtl3e+i1noqkjZcVoQwcDMOElZIna3nT6OmgBKwcNKxUV5i+ibVLcAXUtRQjXLH6D55pLdjRc8MTuuwDCrtjByYyBjxkimMj6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F7z13PlQF4aJ9OoUggXKQ7OXmBnQelameN/piMuqgZg=;
 b=En2mgBwC40vW0aggTW72xXv1O4JjOv3oLwcqu4l0ImB0bShwlM1Al/byUASN1D4NPD44ZPPjSOShw707FKq2P4g/zlxr6UALAOqsuRuD7R/cgh+VKj/dZO2ezUlBGTZuCb+CSj+/Fvcf/1YrIiMDSBm4TdBiciUTTT1LzYKtO6aZyJ/6FvR4hE2pNm2Kt2g5lYu6yFWpZZHKZsnvpSE2+RUFIwKXzp0nnaic4kdaBgUquYnljLTUek3j/LG+oVg1E5miUiSCtNvpnLmq/Iu0HtcDdkb3UXUC3+J7tEiHVyT1NY3/WDUnt/wkLPyDJHlzUga0/MrSOdABP7KIt28Lpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F7z13PlQF4aJ9OoUggXKQ7OXmBnQelameN/piMuqgZg=;
 b=Z8rd2AAii1+2U+KYpEi7DWVztJ7kxGNlk0Pcl3R4C3etGj0zOnpYrE84cZCHiSDKy6se3mQxiTxRMRaBOwUiRgN3tgY1/VWLdYCAD9XZ8stBY0cfcSQiRREgpLVUFrcqXFj/yHmRykygOeWCf+7yeCjGosk3brn0R4phwc3a2sg=
Received: from CH2PR03CA0027.namprd03.prod.outlook.com (2603:10b6:610:59::37)
 by DSVPR10MB676758.namprd10.prod.outlook.com (2603:10b6:8:3ea::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Mon, 9 Nov 2026
 17:08:03 +0000
Received: from BL2PEPF000352CA.namprd02.prod.outlook.com
 (2603:10b6:610:59:cafe::8e) by CH2PR03CA0027.outlook.office365.com
 (2603:10b6:610:59::37) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.13 via Frontend Transport; Mon, 9
 Nov 2026 17:08:02 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BL2PEPF000352CA.mail.protection.outlook.com (10.167.249.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Mon, 9 Nov 2026 17:08:01 +0000
Received: from DFLE205.ent.ti.com (10.64.6.63) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 9 Nov
 2026 11:07:09 -0600
Received: from DFLE213.ent.ti.com (10.64.6.71) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 9 Nov
 2026 11:07:09 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Mon, 9 Nov 2026 11:07:09 -0600
Received: from [10.249.33.71] ([10.249.33.71])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6A9H78S43272475;
	Mon, 9 Nov 2026 11:07:08 -0600
Message-ID: <bb348375-c783-4734-8905-4dfe9a5c4122@ti.com>
Date: Mon, 9 Nov 2026 11:07:08 -0600
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
Subject: Re: [PATCH v2 2/3] soc: ti: k3-socinfo: Export SoC registration
 helper
To: Moteen Shah <m-shah@ti.com>, <conor+dt@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <nm@ti.com>, <ssantosh@kernel.org>
CC: <u-kumar1@ti.com>, <gehariprasath@ti.com>, <vigneshr@ti.com>,
        <a-limaye@ti.com>, <y-abhilashchandra@ti.com>, <johan@kernel.org>,
        <kees@kernel.org>, <jm@ti.com>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
References: <20261027083700.1964371-1-m-shah@ti.com>
 <20261027083700.1964371-3-m-shah@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20261027083700.1964371-3-m-shah@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL2PEPF000352CA:EE_|DSVPR10MB676758:EE_
X-MS-Office365-Filtering-Correlation-Id: a43183c5-f60d-4aa8-ad8e-08df3e8402d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|23010399003|82310400026|36860700016|261026121527099003|261009221227099003|261026140227099003|261009223027099003|261028144727099003|261022075727099003|261102123227099003|3023799007|261022113327099003|56012099006|261022105027099003|261021123027099003|261021121427099003|261102130727099003|10067099003|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	qeKEg+6f8zihz4ICVO/vgp+AUVTc304XtK+0JkVh/QN9SM6H+HQQQKu5HaMJsnKzAz9VJqyTLPAodwM4+eMPAjq6AshnsAYIWiP16kQUPgAIChUGG1DdnFJqbNHQpk5G+y2yOo4X3eoKp2bzFniUFz3Qsf/ws63eBuVdjVVnNKFYaoifLEJ9wK+8/jc58RJmV37D4CBANAWH8cQyytD3kJeJt81XBL9J3shxVTC10pPmLlahh/kGBsZi0haSSXyR+yvtZX3Ij5y1FgZ9P9UvJiG2KnIh9tk6TNulIUX8Z2vR8d5gIfm6gMr0b1z3lgvwSEEaeFAVgkR5cdQjkjROcKrlPwhzVvsBKaQwCEbyzVvtpWiVn47WHNIhwMKstAC9B32eFuN2YLfncJ/+hRO+mR3tq9Myhxei6nsx+ZGQmTNU4X3I8GWCRQ4NQJZx+GYQSU4e590PykYTvM60Q7pOX72XCEC7npubwPuWaEWSBaEhiDNYWODO15ERLs+lkAkLtxmgQDIALYRDxkY5D5KK42hC1VZpQJ4BbzMwsuvHFO0Dn4DiDL2ylk/yh6Lp2HloCjTKklNDVzQHjbGuoWYtyWswkSz+TMyY+cx9gIjWChvXTf/iRuxsyPX/MCWK6ywDB1PGK0cALloV1MFj/QFeaA==
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(82310400026)(36860700016)(261026121527099003)(261009221227099003)(261026140227099003)(261009223027099003)(261028144727099003)(261022075727099003)(261102123227099003)(3023799007)(261022113327099003)(56012099006)(261022105027099003)(261021123027099003)(261021121427099003)(261102130727099003)(10067099003)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	pxc163rHHyL10Amqbi+RVz4uRNHdVImW+cwK6xeNwBrxnY48iXgk3j9FeDME7IUfA9Rz5oPEjqKbe0Em3ySjgJru73yaFeW6HfUokShp/qFusz+Ygyr7B+lsjl+7sk7WYDwowPm2KhZGMyXL2Wd+fx4YPkogOc9NLPB6VwdNDDgMHeYL1+BVDm7wP4rCZbG4uWC9pcNaFzL1dmqXUr/nXR5UyYaALy+5OM7QcmhxW5VRD8AEnFMaOapVtPiLVzf3PO6UXaYTYk+KVE35fhJrnmgJcuLjNTIE3qtNayNpgOOWx0FRwowYkxy4zkmkPoKL+8BULNTjyPlBMUl9hgwVtZqQAl1t3hodEnckYB3pnJRiDNiAhXX1S9Tvm+4VN4Z/6EfPL3UdUwhwHpluW5VFOqZA0b8mI7ODnc2UMq7ImDNcJjO6qBG25G2wMZPqsFuC
X-Exchange-RoutingPolicyChecked:
	3uy0fJidkeRtCwUQpfCuua38xlYLjRRr+4DuvzhMZGV4GSfZUwW5MNdlfAuCVI+lxwVbpQja7//twWDf49JKTtHfS05DJQ8ti9UXdwOL7Ric0JPiKqfX0zsHev1nnzHJpG2GpCtU2mhRQLo6DouDF70ujt1NqXZv2ksPg4DT07k3iWyiSYZ2w6REDBgOlKNrsxiLvaXL6bRUYwyIkRS2NXWPCZs844t7GDkv8gz46+hJ8u+Mm54ORpiGWJ5F/62jDAthj/Xb47bGPw/gfyqnEH662xXlb//3KNfQ0x6tkJtjHtZyJZHgVmZ5R1NnX/KobeMlGWrfRA6MQLl1fjSP8g==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2026 17:08:01.3312
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a43183c5-f60d-4aa8-ad8e-08df3e8402d4
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL2PEPF000352CA.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSVPR10MB676758
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA2OCBTYWx0ZWRfXwNSNyoCAcA4c
 Nw3xoJOjRiKQt9zFCbPY3CV1ErPS4XLgjPncEpsA36EVCzhqaHkuE7GDA4ybarWhXFZLM7aEZKH
 XE69XhmrWlE9Xp4cL0lz5J3B5HbvhiY=
X-Proofpoint-ORIG-GUID: zFueExIjRbglqWKaBw__3bQWCAb2162t
X-Proofpoint-GUID: zFueExIjRbglqWKaBw__3bQWCAb2162t
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA2OCBTYWx0ZWRfX0pJG0KsnAwKC
 cwFejBjWOP6ftwcPgzokOy0oTA86mM3fUtZ8YWzd7ybrkVAUeV1g7s7thnsEstDcdQLssS12Wke
 EGZCIrChAsUme+N7wLgsghwFyK0ONuu4NTm6ohro76GNXqV/cVKjCaY4WiracJldH4fjW7Pk4rF
 GEk+GC4ksSPrXyXey0z2N8HJn41QUiNUk5LWE3SgupSZHM8OW77KU4L3Tsgdx8QI7Ozqs1VGmn8
 zLeSlEA1I2KUhK7BWrhU/2DtEqkd0Hnll2BQ91Oqimny9arquocMiD77uAbBvKSweA4fM8LVAdj
 b7OVFnwUkXUsjbel+yIo20e2hcWqpkeLzdy2liBvR7C7UDA1O8T+MTeG54NNxFrqfvHKRszWwh2
 JT6LgK0D6y3AdRZNq0YEIoPCWPfs+aF+Lh3a1vZHTzUrFrEiCMlmbJs7IkiGCpIw67Xhzc7AbSX
 NkQh394Fbb4wsGUKDyg==
X-Authority-Analysis: v=2.4 cv=Vt62kO2n c=1 sm=1 tr=0 ts=6af1fdf4 cx=c_pps
 a=YY8tFW9l/ybvwHvNOAc4kQ==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=sozttTNsAAAA:8 a=16FlTxw8buotxs6LAxcA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 suspectscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090068

On 10/27/26 3:36 AM, Moteen Shah wrote:
> The k3-socinfo driver reads the JTAG ID through a dedicated MMIO region and
> then decodes it and registers the SoC device.
> 
> Newer TI SoCs like TDA54 use a different path for accessing the JTAG ID
> register, but the decoding of the JTAG ID into the SoC information remains
> the same.
> 
> Split the decode and registration part out of k3_chipinfo_probe() into
> k3_socinfo_register() and export it, so that other drivers can register the
> SoC device once they have read the JTAG ID through their own access path.
> 
> Since the helper can now be called from modular drivers, it must not leak
> the SoC device when the caller goes away. Tie the registration to the
> calling device with a devm action, which unregisters the SoC device on
> unbind. The SoC attributes and revision string are allocated with devm too,
> so they are freed on unbind as well. Callers need no unregister counterpart
> and the helper keeps returning an int.

Do this in a seperate pre-patch. Switch the driver over to using DEVM first,
then split the decode and registration in the next patch, otherwise this patch
is doing too much.

Andrew

> 
> Signed-off-by: Moteen Shah <m-shah@ti.com>
> ---
>   drivers/soc/ti/k3-socinfo.c       | 119 +++++++++++++++++++-----------
>   include/linux/soc/ti/k3-socinfo.h |  11 +++
>   2 files changed, 88 insertions(+), 42 deletions(-)
>   create mode 100644 include/linux/soc/ti/k3-socinfo.h
> 
> diff --git a/drivers/soc/ti/k3-socinfo.c b/drivers/soc/ti/k3-socinfo.c
> index 48dbef3acceb4..e81d27e03c9d9 100644
> --- a/drivers/soc/ti/k3-socinfo.c
> +++ b/drivers/soc/ti/k3-socinfo.c
> @@ -5,6 +5,8 @@
>    * Copyright (C) 2020 Texas Instruments Incorporated - http://www.ti.com
>    */
>   
> +#include <linux/device.h>
> +#include <linux/export.h>
>   #include <linux/mfd/syscon.h>
>   #include <linux/nvmem-consumer.h>
>   #include <linux/of.h>
> @@ -12,6 +14,7 @@
>   #include <linux/regmap.h>
>   #include <linux/platform_device.h>
>   #include <linux/slab.h>
> +#include <linux/soc/ti/k3-socinfo.h>
>   #include <linux/string.h>
>   #include <linux/sys_soc.h>
>   
> @@ -115,14 +118,14 @@ k3_chipinfo_variant_to_sr(struct device *dev, unsigned int partno,
>   	case JTAG_ID_PARTNO_J721E:
>   		if (variant >= ARRAY_SIZE(j721e_rev_string_map))
>   			goto err_unknown_variant;
> -		soc_dev_attr->revision = kasprintf(GFP_KERNEL, "SR%s",
> -						   j721e_rev_string_map[variant]);
> +		soc_dev_attr->revision = devm_kasprintf(dev, GFP_KERNEL, "SR%s",
> +							j721e_rev_string_map[variant]);
>   		break;
>   	case JTAG_ID_PARTNO_AM62LX:
>   		if (variant >= ARRAY_SIZE(am62lx_rev_string_map))
>   			goto err_unknown_variant;
> -		soc_dev_attr->revision = kasprintf(GFP_KERNEL, "SR%s",
> -						   am62lx_rev_string_map[variant]);
> +		soc_dev_attr->revision = devm_kasprintf(dev, GFP_KERNEL, "SR%s",
> +							am62lx_rev_string_map[variant]);
>   		break;
>   	case JTAG_ID_PARTNO_AM62PX:
>   		/* Check GP_SW1 for silicon revision */
> @@ -134,13 +137,13 @@ k3_chipinfo_variant_to_sr(struct device *dev, unsigned int partno,
>   				 gpsw_variant);
>   			gpsw_variant = 0;
>   		}
> -		soc_dev_attr->revision = kasprintf(GFP_KERNEL, "SR%s",
> -						   am62p_gpsw_rev_string_map[gpsw_variant]);
> +		soc_dev_attr->revision = devm_kasprintf(dev, GFP_KERNEL, "SR%s",
> +							am62p_gpsw_rev_string_map[gpsw_variant]);
>   		break;
>   	default:
>   		variant++;
> -		soc_dev_attr->revision = kasprintf(GFP_KERNEL, "SR%x.0",
> -						   variant);
> +		soc_dev_attr->revision = devm_kasprintf(dev, GFP_KERNEL, "SR%x.0",
> +							variant);
>   	}
>   
>   	if (!soc_dev_attr->revision)
> @@ -152,38 +155,39 @@ k3_chipinfo_variant_to_sr(struct device *dev, unsigned int partno,
>   	return -ENODEV;
>   }
>   
> -static const struct regmap_config k3_chipinfo_regmap_cfg = {
> -	.reg_bits = 32,
> -	.val_bits = 32,
> -	.reg_stride = 4,
> +struct k3_socinfo {
> +	struct soc_device *soc_dev;
>   };
>   
> -static int k3_chipinfo_probe(struct platform_device *pdev)
> +static void k3_socinfo_unregister(void *data)
> +{
> +	struct k3_socinfo *info = data;
> +
> +	soc_device_unregister(info->soc_dev);
> +}
> +
> +/**
> + * k3_socinfo_register() - Decode a JTAG ID and register the SoC device
> + * @dev: device on whose behalf the SoC device is registered
> + * @jtag_id: raw JTAG ID register value read by the caller
> + *
> + * The registration is managed by @dev: the SoC device is unregistered and its
> + * attributes are released automatically when @dev is unbound, so callers need
> + * no matching unregister call.
> + *
> + * Return: 0 on success, negative errno on failure.
> + */
> +int k3_socinfo_register(struct device *dev, u32 jtag_id)
>   {
> -	struct device_node *node = pdev->dev.of_node;
> +	struct device_node *node;
> +	struct k3_socinfo *info;
>   	struct soc_device_attribute *soc_dev_attr;
> -	struct device *dev = &pdev->dev;
>   	struct soc_device *soc_dev;
> -	struct regmap *regmap;
> -	void __iomem *base;
>   	u32 partno_id;
>   	u32 variant;
> -	u32 jtag_id;
>   	u32 mfg;
>   	int ret;
>   
> -	base = devm_platform_ioremap_resource(pdev, 0);
> -	if (IS_ERR(base))
> -		return PTR_ERR(base);
> -
> -	regmap = devm_regmap_init_mmio(dev, base, &k3_chipinfo_regmap_cfg);
> -	if (IS_ERR(regmap))
> -		return PTR_ERR(regmap);
> -
> -	ret = regmap_read(regmap, CTRLMMR_WKUP_JTAGID_REG, &jtag_id);
> -	if (ret < 0)
> -		return ret;
> -
>   	mfg = (jtag_id & CTRLMMR_WKUP_JTAGID_MFG_MASK) >>
>   	       CTRLMMR_WKUP_JTAGID_MFG_SHIFT;
>   
> @@ -198,20 +202,24 @@ static int k3_chipinfo_probe(struct platform_device *pdev)
>   	partno_id = (jtag_id & CTRLMMR_WKUP_JTAGID_PARTNO_MASK) >>
>   		 CTRLMMR_WKUP_JTAGID_PARTNO_SHIFT;
>   
> -	soc_dev_attr = kzalloc_obj(*soc_dev_attr);
> +	info = devm_kzalloc(dev, sizeof(*info), GFP_KERNEL);
> +	if (!info)
> +		return -ENOMEM;
> +
> +	soc_dev_attr = devm_kzalloc(dev, sizeof(*soc_dev_attr), GFP_KERNEL);
>   	if (!soc_dev_attr)
>   		return -ENOMEM;
>   
>   	ret = k3_chipinfo_partno_to_names(partno_id, soc_dev_attr);
>   	if (ret) {
>   		dev_err(dev, "Unknown SoC JTAGID[0x%08X]: %d\n", jtag_id, ret);
> -		goto err;
> +		return ret;
>   	}
>   
>   	ret = k3_chipinfo_variant_to_sr(dev, partno_id, variant, soc_dev_attr);
>   	if (ret) {
>   		dev_err(dev, "Unknown SoC SR[0x%08X]: %d\n", jtag_id, ret);
> -		goto err;
> +		return ret;
>   	}
>   
>   	node = of_find_node_by_path("/");
> @@ -219,22 +227,49 @@ static int k3_chipinfo_probe(struct platform_device *pdev)
>   	of_node_put(node);
>   
>   	soc_dev = soc_device_register(soc_dev_attr);
> -	if (IS_ERR(soc_dev)) {
> -		ret = PTR_ERR(soc_dev);
> -		goto err_free_rev;
> -	}
> +	if (IS_ERR(soc_dev))
> +		return PTR_ERR(soc_dev);
> +
> +	info->soc_dev = soc_dev;
> +	ret = devm_add_action_or_reset(dev, k3_socinfo_unregister, info);
> +	if (ret)
> +		return ret;
>   
>   	dev_info(dev, "Family:%s rev:%s JTAGID[0x%08x] Detected\n",
>   		 soc_dev_attr->family,
>   		 soc_dev_attr->revision, jtag_id);
>   
>   	return 0;
> +}
> +EXPORT_SYMBOL_GPL(k3_socinfo_register);
> +
> +static const struct regmap_config k3_chipinfo_regmap_cfg = {
> +	.reg_bits = 32,
> +	.val_bits = 32,
> +	.reg_stride = 4,
> +};
> +
> +static int k3_chipinfo_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct regmap *regmap;
> +	void __iomem *base;
> +	u32 jtag_id;
> +	int ret;
> +
> +	base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(base))
> +		return PTR_ERR(base);
> +
> +	regmap = devm_regmap_init_mmio(dev, base, &k3_chipinfo_regmap_cfg);
> +	if (IS_ERR(regmap))
> +		return PTR_ERR(regmap);
> +
> +	ret = regmap_read(regmap, CTRLMMR_WKUP_JTAGID_REG, &jtag_id);
> +	if (ret < 0)
> +		return ret;
>   
> -err_free_rev:
> -	kfree(soc_dev_attr->revision);
> -err:
> -	kfree(soc_dev_attr);
> -	return ret;
> +	return k3_socinfo_register(dev, jtag_id);
>   }
>   
>   static const struct of_device_id k3_chipinfo_of_match[] = {
> diff --git a/include/linux/soc/ti/k3-socinfo.h b/include/linux/soc/ti/k3-socinfo.h
> new file mode 100644
> index 0000000000000..487e69d0069d1
> --- /dev/null
> +++ b/include/linux/soc/ti/k3-socinfo.h
> @@ -0,0 +1,11 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef __LINUX_SOC_TI_K3_SOCINFO_H__
> +#define __LINUX_SOC_TI_K3_SOCINFO_H__
> +
> +#include <linux/types.h>
> +
> +struct device;
> +
> +int k3_socinfo_register(struct device *dev, u32 jtag_id);
> +
> +#endif /* __LINUX_SOC_TI_K3_SOCINFO_H__ */

