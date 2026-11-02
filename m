Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.150.75
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793616550;
	b=e4kk6Geq+9ih4DPemS0RuuJfnxdurF4LImYZStjjdQoUzvbxMlqnbGdr8w4VYEPKFDvk
	 99LckXMc44u1zjoY125ASSAtkG6Qu363pyciEk6wDlVWoZO2AJmd1ca45BYG5KG2SAJa7
	 KZ7PE7jhLR8sxEO6ep0/AgIUzEOGbJPEdZ/G/67soQiknVN16i6tL4T+w6QPFscH7CUWg
	 /DQnSP6/9tyNYx37+Ew0eE8gPyRT7Af09gQtUlzAfrsDJFYqfmxtMelBGVMS1NmnG5IX+
	 vSWatD/i0CnNu5vYmz2aT5Dw5Mypq4MYpTQvEEY2KgbvmHmGbmd5ox5zsBbkWD86FJA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793616550;
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
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=8y4Ads2/WLSyYk4AhnxuQrnaC5vm/vkdP0KuNw4IG/8=;
	b=ix1vPKwFp/jS5jTlXxnkATMwiV4GNiJUoAIGSG2SwamqjXJsH/zlwTdLmTkPGsxXU3/0
	 asURKNbr/lw++8jIFuWn9FWTetxCZ+aAChArNmi1ZHVWhMVbuNWKY5UBlf2NyFxJ1avGC
	 w6zBWQlnom4Md1Agp9YjlKqWQSkp4/ZowaxFnnChuvjZXBNpjNjPbIYAC/Kp95nP/MX01
	 r2/Ul72ahXoM+f8qsBVmPMsKNZybQYm1KSVyhWZiYqCOy96agqvwx4k5jC8WYHf3NZial
	 I+0l48l0bPuxueaqEZwCjcrQECAgtNZ7ow/ie+9YS4sBTUq0KOIKXaMC8jczLLfE54g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ti.com;
	spf=pass smtp.mailfrom=ti.com;
	dkim=pass header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=fU9RZIZ9;
	dkim=pass header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b="XpHA/BOs";
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.150.75
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FD36606A324;
	Mon,  2 Nov 2026 10:49:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3FD36606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=fU9RZIZ9;
	dkim=pass (1024-bit key, unprotected) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=XpHA/BOs
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 6A2AXM4A501684;
	Mon, 2 Nov 2026 04:49:00 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=8y4Ads2/WLSyYk4AhnxuQrnaC5vm/vkdP0KuNw4IG
	/8=; b=fU9RZIZ97hfLLBtL/YWjzFa2Uyl4FrDuadqD7lQ1ZtopbrV9AfcvSnl8T
	O6L5BUUehhYHUBZfPVbCfe5ug97HiZ528R7pPdGtxYiwYBlvtzHbAva3GhI/zLE/
	4i44zqfCm2KVL6iEBPjKICmf3yAf3+W6JX4SceUQZybgBjmMbfTVyDTRMaxuUjge
	Im5c2nSRCLKOLT7F7hzAC0ajDmVx1MuaPt6YGUYwU/2zkHIjgc9mSetNKPpJPC7K
	ktCap2LKrt5Ek21D5XzOhAVHI0kFX/wzL4EmvDqlMJvlpd+G6x09T2JmKYH/HiRq
	Zsk6j3OqnaVL0IN/HvYVAXK5TCS3A==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011033.outbound.protection.outlook.com [52.101.62.33])
	by m0380145.ppops.net (PPS) with ESMTPS id 4hprvb01se-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 02 Nov 2026 04:48:59 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BasIvI9FY37usLJ5lOStzF5ofQLHnkiZDTlj0aol2EjryOAwZLwyMMy6yOBh3aGir+r0j5axUnQ77ltqygQNKEiyt/Kl0anuM+ICMbkKp1goS8k1+bRQMdYh/6crn9kRdUCtXLo8dMc8RypG2Lm3Mzth4IxtD1joX71eyHrS34YRm5ZwWhnzJMwUa92JgOrV1tRQMA9MyVbbRjIbvm68lo+dVoR0j+26QvDybU9x0i2HlCwoHXO6iU4QCNRNOKQBfSONtrY2XF2tljwdL1pr05XIRi3bNzRUt/YVzVpBAsJ/4YMMdwPidFQXkoG0i1DW3jj/wtd8Da3HLOFafPROFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8y4Ads2/WLSyYk4AhnxuQrnaC5vm/vkdP0KuNw4IG/8=;
 b=pcfgcP7pNkgKl1l/9foGc7VkbEYgeI42LoI24J/902DsvC1GiewoMTigEiCvtdsGn5ev/2BjkPHN1nOOhau+p9Dfx5rpyy0avqxefWHvXu62O+0y/fjUb6lLodOg+cZN1OH6rln7WmYmN99UySkz07M9rxZOWFA4lTcGTdTQux9FmsVYDhOv8aMjCIaRDsPtW3cES+KZTfYjMYCPyJahWuY+yaG8OK4eAByqgCVxy35O8FXZ80/lFT88JJGamfTGZLLe23P5DM1WpsDiXdnNSFh3fIOhXs++gi8E+Am+LIQJBQXAGyBEp4TrKV/YMbASJA6vui+J15GCsthNgcGrvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8y4Ads2/WLSyYk4AhnxuQrnaC5vm/vkdP0KuNw4IG/8=;
 b=XpHA/BOsESB23zWILlgeBwEvsDQzuLMzt8uXYZkVrV1Te03yb48XYqcpzQODEfjBVWjoPKxw9OkVvRH4oHRper+61EcM2P3Z82oMH5bq2hFVbMgITT5wsOMFA++7Dm/UV7REtWz4mxLubIkJiCngAgmuOLi1phy80jX+LTp4rhQ=
Received: from MW4PR04CA0051.namprd04.prod.outlook.com (2603:10b6:303:6a::26)
 by CHBPR10MB780557.namprd10.prod.outlook.com (2603:10b6:610:407::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 10:48:51 +0000
Received: from SJ5PEPF000001E9.namprd05.prod.outlook.com
 (2603:10b6:303:6a:cafe::23) by MW4PR04CA0051.outlook.office365.com
 (2603:10b6:303:6a::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.12 via Frontend Transport; Mon, 2
 Nov 2026 10:48:51 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ5PEPF000001E9.mail.protection.outlook.com (10.167.242.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Mon, 2 Nov 2026 10:48:50 +0000
Received: from DFLE200.ent.ti.com (10.64.6.58) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 2 Nov
 2026 04:48:23 -0600
Received: from DFLE204.ent.ti.com (10.64.6.62) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 2 Nov
 2026 04:48:22 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Mon, 2 Nov 2026 04:48:22 -0600
Received: from [10.24.50.20] (moteen-ubuntu-desk.dhcp.ti.com [10.24.50.20])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6A2AmHWO957669;
	Mon, 2 Nov 2026 04:48:18 -0600
Message-ID: <e3823994-2660-4e9c-96de-40a6d14bda78@ti.com>
Date: Mon, 2 Nov 2026 16:18:16 +0530
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
Subject: Re: [PATCH v2 1/3] dt-bindings: soc: ti: Document the
 ti,tda54-mcu-scm-conf binding
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: <conor+dt@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <nm@ti.com>, <ssantosh@kernel.org>, <u-kumar1@ti.com>,
        <gehariprasath@ti.com>, <vigneshr@ti.com>, <afd@ti.com>,
        <a-limaye@ti.com>, <y-abhilashchandra@ti.com>, <johan@kernel.org>,
        <kees@kernel.org>, <jm@ti.com>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
References: <20261027083700.1964371-1-m-shah@ti.com>
 <20261027083700.1964371-2-m-shah@ti.com>
 <20261028-inventive-screeching-bettong-9f4240@quoll>
 <b53d0986-33fd-43d3-a03f-2bbb39dda42a@ti.com>
 <6cecea78-658a-4278-b5c9-228a827583e0@kernel.org>
Content-Language: en-US
From: Moteen Shah <m-shah@ti.com>
In-Reply-To: <6cecea78-658a-4278-b5c9-228a827583e0@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001E9:EE_|CHBPR10MB780557:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e2e56ad-15a4-455c-7090-08df38cee122
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|23010399003|36860700016|82310400026|4143699003|56012099006|261028144727099003|261026121527099003|261022075727099003|261022105027099003|261026140227099003|10067099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	ftUsJ+R65vqTwKLTKbW0Rbp36IWt7XV91ebHTA4Sh8arbTPiPpy0T0GuJFSYxStjK3QuFR909y/+rdzHZ5KqSDFnYikz5FaCWKCda2dIxFaHAkS3zZXJqpMdxkK5Hc5k0JQ08LmnenUlXKlBASppwnDpmfSQx46VTTbT3GBdt18ZHZmnU1iPgS8/Crv6eYZZRfJtc18kiZnPLbv7Zs8Tv653RFBFD2xmP2RV9o74WOABoOpvF+IBpXJVu1PJQfP7+x03M4PRqjEe2lr65hQ0K5h9MSkqZ02VtJVxBh31n9ilqzJYMO7ZIYZjeLzVSAR7zpJfxIWHMJ3NDv3Np/BJZvENkK75VSmApY+vKA8AE1TbKTxFaxG8nxOeafi5qZhNFCIzAd8R67C/9k+mtqglWS3hKCxJZ6tPBaedcElojB6Q1WRMBCYE1qEBDrXO+XUwACebUMuTpGDfSLf9qaJsja35r8vbTJfNgHKxjuW4Pw9h+XOQl+gFbobEr42SOVaQ3O5+jkuS6+mCVK6hvA7ucwK/pfKZnuQehnYL5Iam2tvQ6LJtqZa9VayDZv0QTRlTHEZKQMySp07ElCIdy5OM5qmlu0u3U9aD1iIqEeSqo0yjraUQqO0AbxIqYRf9zLHkYly8TSXRqMXuevq6lW9ye30zb8vs7N2vzohceZ/wTPAKDKYBY++59ph1xt2lImhbY5WmKTPPSsWrSRA9FG+GGQ==
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(23010399003)(36860700016)(82310400026)(4143699003)(56012099006)(261028144727099003)(261026121527099003)(261022075727099003)(261022105027099003)(261026140227099003)(10067099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	D/hxc9lG+E7ZJURxRUkpzpwtr+3LUBdqmDowZiRqbfNqxs/bqaJKwHSmYfvnRMf1mXzV/6uk8RI5xpxbEwPpm50l44KK+Zixdji9/dFoDm9CGwtNv+Zdo3V5Aci1tuZuJLOe4kS5Vy05kDJA8Kb1tuUnNCBZQIKm40bSiU9ZMavtf3e8L8l/4/xpO3CHpTeN5wkBt4ZcqFnJL32noz6zOHH1OhCYUCCco7ui+1GsAntEsxiesgIusH6BoCagFaIcHl9ZYkViEvn4dYz2PYwK9y0VZQq3Kc6a8e2QPVO1oSE/rzZ4FW08NAOCUZ96hom3OpTKtFBzZ1lot/6O0z3VYcG7MRgUaNAQsZXQVIWDBNGEtTHBBiWnlH2/DAeGGWnhs+PHdviWU+V1Lhi6AvFbd2/PrYuhyjhSI5DVHAvJZiu01x/yPqYqau+oMLvaVW1a
X-Exchange-RoutingPolicyChecked:
	EYUJWVoDdMzQ2oZd74BlPy8tmI81C3Gm/Aq+fPDTvCOQJdYow/W7fTZ6R2j9S1gMoLydM66ZC5SfKSYw+JewMP4t/Swc2q6revsTok0x+IDzkoWmFKSvhrLjqk8I7GZNvn+xT47y/4j2txIGbv2/J+2cxC2nIoS3nLZwnXX2vesxup3UznDlxHnDT6yjwg+2/IP4gAACvxapRyYYjBJk614l1V9yfCTN0S8QmJ3g9pRidNJoTGQBERleuDS6Ju7CKVCIFZj6zH2Ojux4V7M8RbZky9REJ90YkpuXf75+6SUe79eG1JaTPURbgAra1fpYhKPg1dGhHBSYGfgt5ka/xw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 10:48:50.0217
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e2e56ad-15a4-455c-7090-08df38cee122
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001E9.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CHBPR10MB780557
X-Authority-Analysis: v=2.4 cv=BN8mP1QG c=1 sm=1 tr=0 ts=6ae86a9b cx=c_pps
 a=4QVYENZnsEoURNel/cbnog==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=kDw0F7acoILHfRaoxykA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: KQ8XYkw4BL1U4xuhwkFqXu7i7uf2_uiF
X-Proofpoint-GUID: KQ8XYkw4BL1U4xuhwkFqXu7i7uf2_uiF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0MSBTYWx0ZWRfX8a6KDe5kTP4O
 X1M88pPmt4WRpEq59KBv0Ht8EvOup5KL14tYlU6Rg1kJEzp2NpnAoiGkBNWhaLc/XVGeazUoi9u
 K0l5aeZsihUJgDULn6BA3TeiXS9gLneYMmZD+OmTpkhtinP2lDCeUN89Y6b7MyWmCpmCSifpRfV
 CqjjKj+VEnhrc5m/AhSvW1C1uzCwCRdeqjoy+OLiVY0Uu90tGarN1qivb7QgV0HlDcIgHNbI5WR
 ihMmv9MEXC0TXDEMeD89ctjyEJ53sDPbJ2eaqyVcKvWaCbsEWPGfscUx0cKEG/ICTpykDuVwQ+U
 Me7ks/yNC333Rl7y/6t7S00iPTTLyMKS5xMezdotFr+a8fENLVn82WPc43IC/4YbRtpauks6mEd
 +G0MREI5f3EUf1RhQ/0vwGec8LR3tkFoRS0NqnmCTAW9EwonVIhzmVzOmzSI8lVfBQY+04t8A7Z
 mMGSQQr4P7HXyqflJtg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0MSBTYWx0ZWRfX7zUEz1Su7002
 +gcSZhnZlX7MauPUTYy+srmiSXXJAl02xauHLiZCNP8kY1Du+taSEXv996Hrr5tVNLIPNtSEY4F
 jrr0j6VdUkl7cYJ5fZRzEAnvMWhPSsc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 malwarescore=0 spamscore=0 suspectscore=0
 bulkscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611020041


On 02/11/26 12:34, Krzysztof Kozlowski wrote:
> On 02/11/2026 06:20, Moteen Shah wrote:
>>>> +  ti,proxy-id:
>>>> +    $ref: /schemas/types.yaml#/definitions/uint32
>>>> +    minimum: 0
>>>> +    maximum: 7
>>>> +    description:
>>>> +      Proxy region (0-7) through which this node's clients access
>>>> +      claimable registers and their fault status registers.
>>> I don't get the need of this property. You have a one, specific device, so
>>> why the proxy id would vary per board?
>>>
>>> It also looks like re-implementing access controllers.
>>>
>>> Best regards,
>>> Krzysztof
>>
>> Thanks for the review, Krzysztof. I’ll drop the redundant “binding” from
>> the subject.
>>
>> ti,proxy-id is not intended to vary by board. It selects the proxy
> Then it is implied by compatible, no?
>
>> window used by this Linux instance. One use case we need to support is
>> running two VMs with different proxy IDs, with each VM’s DT describing
>> the proxy it uses.
>> The driver reads the ID from DT and performs register accesses through
>> that proxy; it does not allocate proxy IDs or decide which VM uses which
>> one.
> And if not, my statement still feels applicable.

I think my previous reply did not explain why this property belongs in 
the binding.

In the current design, reg describes the SCM region and ti,proxy-id 
selects one of its proxy windows for this Linux instance. The compatible 
describes the SCM hardware; it does not select a proxy window. Our use 
case is separate VM DTs for two Linux instances using different proxy 
IDs. For a single non-virtualized Linux instance, the DT has one fixed 
ID but it can differ between VM instances. The property selects the view 
used by the driver; it does not allocate or grant access to a proxy. The 
information to the driver about the proxy via which it is supposed to 
perform the claim/lock operations, need to be supplied for a particular 
VM instance. I think DT would be the right way to do it. If you think 
some other way would be better please feel free to suggest.

Regards,
Moteen


