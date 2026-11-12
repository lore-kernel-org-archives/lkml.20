Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.150.75
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794471097;
	b=Kwxz1BnNiK7ijANYV4lbz3QPY73tVziNwYd64T75NGeGhsGfP98kknPmzLoM4xqzIIbh
	 SdIB5vJU3vXaV987J22UgCRgh7NHXCBPx40R14ugiu7DdA9j1vmtFY1X/CZzyA5jPczz5
	 +Vu+0ICBKfFKhJM/DRFz1SOw+dmnlxKlGNrohx0fCdtszVvhFhNu5ugi5w5gsR+k2GK4U
	 KqjjDPt73/ldgetnhUPdR6Q7I+4LS3eTOhEvJN7Uyic1TCXNG0BBohsxnKS76zWGqA5ds
	 CCsOHpXNvkqLbvyyZWu19a7FQHxtBCH86IPFM/kUqQFfudUdYPrZRjKmkA4l7z0asjw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794471097;
	h=DMARC-Filter:Received:DKIM-Signature:Received:DKIM-Signature:
	 Received:Received:X-MS-Exchange-Authentication-Results:Received-SPF:
	 Received:Received:Received:Received:Received:From:To:CC:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-OriginatorOrg:X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=lvKrCVWwh8moUnB97IIKL0AXrhzZC0nFlnYPH7NHV8c=;
	b=FaniewvTEa+SE3WVSck7R7muTMwil82pJzWK7vBdoyt5jWSwyMuju6pRBevYdjYw/5zq
	 EzYt8/N+aX1uwfAt6pywESMhuY/EWeAuJH7tWda1+7oRGmXQnTxld2ZgjFcKsTEHvThjF
	 cvVxPnJDsWmJR7MjpEE8V5RKz5HiGqVvTLDYKnL4qV/gMauoOXTXmt/zKXC4GbQQF7j2a
	 tUegm/9b5EW7ttUuufI8XtJuPo9+pnHzxVdvXCV57aQm77AZQxACGZ6gq+QvPe5imgdC4
	 zvO31bTXQmJTB3uHO4EuFOoWsCSVfrk+OIocEfF5QJvMvIweOc/1ex9Vid+3biQtLcA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ti.com;
	spf=pass smtp.mailfrom=ti.com;
	dkim=pass header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=g90gGMLP;
	dkim=pass header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=PuHuo5dH;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.150.75
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 502B8606A332;
	Thu, 12 Nov 2026 08:11:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 502B8606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=g90gGMLP;
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=PuHuo5dH
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 6AC7sNPC3094976;
	Thu, 12 Nov 2026 02:11:32 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=lvKrCVWwh8moUnB97IIKL0AXrhzZC0nFlnYPH7NHV
	8c=; b=g90gGMLPcPcbs4SslewAAg3afuQr5/m0WrP0fZWM+2mGsKzqt0ejSoWyg
	Q7zP3pzZFhmFeusNmgLtTIS2bpJGjtWI93t9uauttL4676TPdTXGpqSD70wGmnWi
	jRH8MUnzIt7IRj4FBnihv9lMVWqNfPUq5/7JontGDjdroW/XWpYFwr4m+MBIhIyl
	CcpBrqpqZObBpeMA6O0vk9KieAsg8N1zuHCLoykhmxnltas2CIyflCc859b06HHT
	43N2R0JlmaN0GdIRsqaZpOTogOyGQXPfMpRxWam5tpdHMzhQfQna2Qb4gPr2OaB8
	83SzLjkDB4w9oY61Q6AwPG+fkkI4w==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012043.outbound.protection.outlook.com [52.101.43.43])
	by m0384305.ppops.net (PPS) with ESMTPS id 4hw4cy1v5a-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 12 Nov 2026 02:11:32 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZaO3Z8nVBsBN+T9IbSywDVLcmQrbaMqg1/aEFQzbkjaQIQXXLLEs2nL5ZUCEo2ldtBgPXjxgWl5tgJKvtOjShJKuFQGXTExqFa/udUBZI8QNnRZI1ZbziMAu0pWYLDa1n+fnELXrXXTO7ommpPjxHZxaaJN74KJ0CZZESiRTU7xCZZvqnXzsxBz4DcWRuZZ2WfhWw0YfWdNpbfVmUYwJNPssRd/s5ruc5ft7WZFxOiY/E3b8ZoSyyNBqs9LS5to/vtiDfLqk2iwtEpi1dM0rVrsFL+fWuy+5iRuAc4mcfSVXH4a/xukY8Uw9BzGSxEr/q17qrT3ljNNN5fehZBlyLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lvKrCVWwh8moUnB97IIKL0AXrhzZC0nFlnYPH7NHV8c=;
 b=KE4x/mgTmCqLK8xhlyvoFCtG71Og/ABsETzRlLxUWWqGgbkAuYMaKDHTNk8UEalprvkAH8sUXugmlqGdv4jAAN5nui7k9zOCwoJ7XWPu64z75e9J5ejQl5zMxLWFPzueeTEDrYpjIEw41X7+G10Xi8hA8CiJC+5ZvhDY7R6tmfk+bg1ToaH3Jb8L8dmnzCsEnAoWFTaON/Jf9tYaFO+VA7WQsrIuMnYhu2wtK/LocNj+eRzJxkdnnDaR3OarWrLL+/MtGT0B4TDliH9L/kMaekTfIVX4F5qpG783PLkSCPQhtPHcl0P9a3ULFgmouR+AJE/6BwN4dIahH7wKPxzYTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lvKrCVWwh8moUnB97IIKL0AXrhzZC0nFlnYPH7NHV8c=;
 b=PuHuo5dHPD/tQFF18EcvHp3NfVkJ3MWfWwIxQEqrqewClJod4naYP9wRNz+xzIERD1th6UhiEOi/rePhfc7rycWShaRdfEQXY2vsj80QhZudeiY8rJVtTw/4/sdolxkLM2S2zk++hCggdSiIF33E643q/61eDAhP9x8yzIUBjaM=
Received: from CH5PR03CA0001.namprd03.prod.outlook.com (2603:10b6:610:1f1::29)
 by DSVPR10MB997963.namprd10.prod.outlook.com (2603:10b6:8:3ab::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.9; Thu, 12 Nov
 2026 08:11:27 +0000
Received: from CH2PEPF000166BA.namprd04.prod.outlook.com
 (2603:10b6:610:1f1:cafe::24) by CH5PR03CA0001.outlook.office365.com
 (2603:10b6:610:1f1::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.9 via Frontend Transport; Thu, 12
 Nov 2026 08:11:27 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CH2PEPF000166BA.mail.protection.outlook.com (10.167.252.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Thu, 12 Nov 2026 08:11:27 +0000
Received: from DLEE206.ent.ti.com (157.170.170.90) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 12 Nov
 2026 02:11:15 -0600
Received: from DLEE206.ent.ti.com (157.170.170.90) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 12 Nov
 2026 02:11:15 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 12 Nov 2026 02:11:15 -0600
Received: from moteen-ubuntu-desk.dhcp.ti.com (moteen-ubuntu-desk.dhcp.ti.com [10.24.50.20])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6AC8AlaO1453305;
	Thu, 12 Nov 2026 02:11:10 -0600
From: Moteen Shah <m-shah@ti.com>
To: <conor+dt@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <nm@ti.com>, <ssantosh@kernel.org>
CC: <u-kumar1@ti.com>, <gehariprasath@ti.com>, <m-shah@ti.com>,
        <vigneshr@ti.com>, <afd@ti.com>, <a-limaye@ti.com>,
        <y-abhilashchandra@ti.com>, <johan@kernel.org>, <kees@kernel.org>,
        <jm@ti.com>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v3 4/4] soc: ti: Add TDA54 SCM configuration syscon support
Date: Thu, 12 Nov 2026 13:40:47 +0530
Message-ID: <20261112081047.1550471-5-m-shah@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261112081047.1550471-1-m-shah@ti.com>
References: <20261112081047.1550471-1-m-shah@ti.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF000166BA:EE_|DSVPR10MB997963:EE_
X-MS-Office365-Filtering-Correlation-Id: 649083b3-f990-4e69-1cd1-08df40948d42
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700016|23010399003|6133799003|22082099003|261009221227099003|261009223027099003|18002099003|3023799007|13003099007|261022075727099003|261022113327099003|261022105027099003|261021121427099003|261102130727099003|261102123227099003|261028144727099003|261026121527099003|261026140227099003|56012099006|10067099003|5023799004;
X-Microsoft-Antispam-Message-Info:
	4tTZmOFM4xm/q8G9zcqSwC5X21JjLe/shZo/WZ69RIoxxI5Zb3spPiuIOP+ggJqcZyxfYdK0Sfzpj6Ppgp4CEg9MI7sxx/6NKG+8XdG6VjAa3QN0FXEBDaoRYr3UAnoM8Gcdp+hN4ZNUnttSuKwh9uaTwLxGxf8GyYRcgfLrMeAB5XNlxRtNTSqHSoHQwp06yUFsrpa6A+u3uts71+EgMpdLMHoCqtB8l8aKon/hbW4nBi75D+Bz+EmTmzhBY9R8PYQI+sOc/DisofnBjveNTekSFBeh63C1yJJOep6FTtB6LPP+WcThkdSiIPSbuxbEVz9FPvzpgZH8isuPMmjZHe/BQGjLOGZZFX0Hy2y3LUbJ1sJ7yDvPd61prg80o25ID8y2xkS/na5ASOkSrirg21ZlONjKBYVC0OG4RUxfXuG9KmU7xTCD6YpXKsrYtsL96uADyw8k9qfopZopm5UE+i3mu1I40BSVsgrH1X9V561tbAajB1SSXHfjJTlbliBlwDlW7bIa/Q12ntQD75Njop7SG7aHiRTh7MJJnPYijAeAxZUvHmyLxKGdX0u0Uwn5z/lJYJOZMwBCdEeMJLi/QTPQWxPjU8hXgWKciEc6wHRteJ9msCEehazOenuLkRtKHog00j8D6yjby6IZREXU6A==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700016)(23010399003)(6133799003)(22082099003)(261009221227099003)(261009223027099003)(18002099003)(3023799007)(13003099007)(261022075727099003)(261022113327099003)(261022105027099003)(261021121427099003)(261102130727099003)(261102123227099003)(261028144727099003)(261026121527099003)(261026140227099003)(56012099006)(10067099003)(5023799004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	htigXFCK/Qha4zOQE+ilC5hkvWHyNruQiUUvIX+ZwGoKIZrPBDzBxSZlbWLVnszswt7RGc4FJDk0Z6hXmsrO5X0fAsjqwwgky4gud0quJk3DJY3gN7fYvjdKAzoD6w3+v4F47uwXdDGCqBJ3Gij7PLiV5Cbrmd7pZwXM+Ow66M2iaWcfx/xzyVYpKfpt/G267TZZDy0OSr5rrxO3o/l2yL+2B2togv+NoceHlKM1Lu9sIOYubYDFXA61Okf/nKhk6y4bHtcNWbuegVpHehdpx5anh4cHuWRrLtQWx4IcN+ilX4fvZWdaeOBKYEGLfctjOQFgTm7bmYDO6ZMQsDxo+FMk4Ag6HSIKG1hOAUbojAVxNpNFeb/R7Vo5EX3ejrS1P/u21bbdpWV/A5HzBhj2id3tSIrQOcpN87Yd6l1g4JU8jgW1RLgWg/QDfVofqU8X
X-Exchange-RoutingPolicyChecked:
	fYPQ8rD2Ze2s8w2HnydSw29vJjdM7Kv8zw3LbWJu4kOw5iVF9uTTopb5+KYj9YqhFwReC6ENmcorwqPYPFpwYbkne17a01z8OjcBRC1BFAgh8Ii3VGqT+HFTMfbV4+zVSOmiiNaNIg8imJoKpNhQBZWJtFSJiZfNxoQ3PPCjaJ/SPsqO6ZnNxB8tPhu3L3flkxIxmjUwGj8illQePi0ZGNThjfCy2PoNX1oPjQAcDT8LOjCBM4rYL+St+rQmUhqfqhq3HetIYkeLGcn75v/tzfhs9KTENndEzq6f/t1Cl/jUQT2Bxv965bIEwR5N3RusUv/zL+z11zj7XLCdXYBngw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2026 08:11:27.8263
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 649083b3-f990-4e69-1cd1-08df40948d42
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF000166BA.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSVPR10MB997963
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAzMiBTYWx0ZWRfXzvGXbMfM4mLf
 gSs8LfjKISo7Js8NQc+YilciUZY7Ke4o3Bd3ivAkCyt0JXjqGY5wEluMlCznmXij7NdLRsBiREw
 vnBCypZ6ndLI+SbuEEY4LmmJQELGHJ4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAzMiBTYWx0ZWRfXzYvRGdEDMfHj
 p7Faft+O9Sf3yrbO/sBoTZW3Pw6aucVSUNjSIwELZZFrstpI1PsnDDKMblVvL3jUi3mCsAM7d7O
 p27lfSxBJL+xIvbexbTldwTd23Y4kKsb7sb02E5nQEoz+MZ620EZ0hItw+h8U4aSt3YeiPpJnQk
 LcAXBmn6MkMUCycSy/s1n+Jmywdl09TG/RGBulcYYwkJOJTOpcNQIo8siDpibXZHc0/4Lrb3QfF
 g513y12heIHkwat+WQd49lwq/FGHUWYLS2QuCOi5urJPaDKtoytvxZuA7ZeoPrUIFM38RX7YiGt
 OZ2bOtNnjDhxDWqqKUv6o8zvvjzFEJxdR14OCayPceKhJyx//6q/kGwd9VTrJD+aIjoQFDHc2cT
 /TzipDbWmTdvWsxj4krr6OkpSwLk3koe0bf1R5p8yzzqC/WFObLIpHsjvzvaK9MqYpn7nH1e9NQ
 IELfDuTwHZf0nwtBDQw==
X-Proofpoint-ORIG-GUID: eFRVjbsTU7oW9CVbA6DcvyXHdT2YHyQ0
X-Proofpoint-GUID: eFRVjbsTU7oW9CVbA6DcvyXHdT2YHyQ0
X-Authority-Analysis: v=2.4 cv=asYnmiZV c=1 sm=1 tr=0 ts=6af574b4 cx=c_pps
 a=qH/fS2hzlQnCJHG7LpbWtA==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=sozttTNsAAAA:8 a=hU-JDQfdbdCR0hOrdIMA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 impostorscore=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120032

Add the TDA54 SCM configuration driver providing access to the SCM register
space through regmap/syscon.

The driver handles proxy-based register access and SCM unlock/claim
handling, and registers TDA54 SoC information using the common K3 SoC
info helper exported by k3-socinfo, for which the TDA54 part number is
added to the SoC ID table.

Default the option to m on ARCH_K3, so that the driver gets built for TDA54
boards without requiring a defconfig change.

Signed-off-by: Moteen Shah <m-shah@ti.com>
---
Changelog:
- No change since v2.

 drivers/soc/ti/Kconfig             |  16 +++
 drivers/soc/ti/Makefile            |   1 +
 drivers/soc/ti/k3-socinfo.c        |   2 +
 drivers/soc/ti/tda54-mcu-sysconf.c | 217 +++++++++++++++++++++++++++++
 4 files changed, 236 insertions(+)
 create mode 100644 drivers/soc/ti/tda54-mcu-sysconf.c

diff --git a/drivers/soc/ti/Kconfig b/drivers/soc/ti/Kconfig
index 163aadd589d3a..ea5da6722da29 100644
--- a/drivers/soc/ti/Kconfig
+++ b/drivers/soc/ti/Kconfig
@@ -82,6 +82,22 @@ config TI_PRUSS
 	  processors on various TI SoCs. It's safe to say N here if you're
 	  not interested in the PRU or if you are unsure.
 
+config TI_TDA54_MCU_SYSCONF
+	tristate "TI TDA54 SCM configuration controller"
+	depends on ARCH_K3 || COMPILE_TEST
+	depends on OF
+	default m if ARCH_K3
+	select MFD_SYSCON
+	select TI_K3_SOCINFO
+	help
+	  Support the SCM configuration controller found on TI TDA54.
+	  The controller provides a syscon regmap and is also the
+	  hardware access path used to obtain and register K3 SoC
+	  identification information.
+
+	  This driver can be built as a module, in which case the module
+	  will be called tda54-mcu-sysconf.
+
 endif # SOC_TI
 
 config TI_SCI_INTA_MSI_DOMAIN
diff --git a/drivers/soc/ti/Makefile b/drivers/soc/ti/Makefile
index cb800a745e66d..33f4ddca32ed6 100644
--- a/drivers/soc/ti/Makefile
+++ b/drivers/soc/ti/Makefile
@@ -11,4 +11,5 @@ obj-$(CONFIG_TI_SCI_INTA_MSI_DOMAIN)	+= ti_sci_inta_msi.o
 obj-$(CONFIG_TI_K3_RINGACC)		+= k3-ringacc.o
 obj-$(CONFIG_TI_K3_SOCINFO)		+= k3-socinfo.o
 obj-$(CONFIG_TI_PRUSS)			+= pruss.o
+obj-$(CONFIG_TI_TDA54_MCU_SYSCONF)	+= tda54-mcu-sysconf.o
 obj-$(CONFIG_POWER_AVS_OMAP)		+= smartreflex.o
diff --git a/drivers/soc/ti/k3-socinfo.c b/drivers/soc/ti/k3-socinfo.c
index bf0829fb1d61c..a42c195557266 100644
--- a/drivers/soc/ti/k3-socinfo.c
+++ b/drivers/soc/ti/k3-socinfo.c
@@ -50,6 +50,7 @@
 #define JTAG_ID_PARTNO_AM62PX		0xBB9D
 #define JTAG_ID_PARTNO_J722S		0xBBA0
 #define JTAG_ID_PARTNO_AM62LX		0xBBA7
+#define JTAG_ID_PARTNO_TDA54		0xBBC1
 
 static const struct k3_soc_id {
 	unsigned int id;
@@ -66,6 +67,7 @@ static const struct k3_soc_id {
 	{ JTAG_ID_PARTNO_AM62PX, "AM62PX" },
 	{ JTAG_ID_PARTNO_J722S, "J722S" },
 	{ JTAG_ID_PARTNO_AM62LX, "AM62LX" },
+	{ JTAG_ID_PARTNO_TDA54, "TDA54" },
 };
 
 static const char * const j721e_rev_string_map[] = {
diff --git a/drivers/soc/ti/tda54-mcu-sysconf.c b/drivers/soc/ti/tda54-mcu-sysconf.c
new file mode 100644
index 0000000000000..3ef82e737d095
--- /dev/null
+++ b/drivers/soc/ti/tda54-mcu-sysconf.c
@@ -0,0 +1,217 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * TDA54 SCM Configuration syscon driver
+ *
+ * Copyright (C) 2026 Texas Instruments Incorporated - https://www.ti.com/
+ */
+#include <linux/bitfield.h>
+#include <linux/bitops.h>
+#include <linux/io.h>
+#include <linux/mfd/syscon.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/soc/ti/k3-socinfo.h>
+#include <linux/types.h>
+
+/* Size of a single proxy window into the scm_conf register space */
+#define TDA54_SCM_CONF_PROXY_STRIDE		0x4000
+
+#define TDA54_JTAG_ID_REG_OFFSET		0x14
+
+#define TDA54_SCM_CONF_LOCK_KICK0_UNLOCK_VAL	0x68EF3490
+#define TDA54_SCM_CONF_LOCK_KICK1_UNLOCK_VAL	0xD172BC5A
+
+/*
+ * Claim registers start at 0x3100. Claim register i holds the claim bit
+ * for each of the 32 registers in the (i * TDA54_SCM_CONF_CLAIM_BLOCK_SIZE)
+ * .. (i * TDA54_SCM_CONF_CLAIM_BLOCK_SIZE + 0x7c) block, one bit per
+ * register, i.e. bit b of claim register i corresponds to the register at
+ * offset i * TDA54_SCM_CONF_CLAIM_BLOCK_SIZE + b * 4.
+ */
+#define TDA54_SCM_CONF_CLAIM_REG_STRIDE		0x4
+#define TDA54_SCM_CONF_CLAIM_REGS_PER_WORD	32
+#define TDA54_SCM_CONF_CLAIM_BLOCK_SIZE		\
+	(TDA54_SCM_CONF_CLAIM_REGS_PER_WORD * 0x4)
+
+/* Per-SoC register offset data (platform data) */
+struct tda54_scm_conf_data {
+	u32 lock_offset;
+	u32 claim_offset;
+	u32 claim_status_offset;
+};
+
+static const struct tda54_scm_conf_data tda54_scm_conf_data = {
+	.lock_offset		= 0x3008,
+	.claim_offset		= 0x3100,
+	.claim_status_offset	= 0x3300,
+};
+
+struct tda54_scm_conf {
+	void __iomem *base;
+	u32 proxy;
+	const struct tda54_scm_conf_data *pdata;
+};
+
+/*
+ * Make @reg writable through this proxy.
+ *
+ * Proxy 0 is the default access proxy for all unclaimed registers. Its claim
+ * bits are tied low, so it cannot claim anything and needs no claim to write;
+ * it can write @reg unless another proxy has claimed it, which is reported by
+ * the claim status.
+ *
+ * Any other proxy has to claim @reg first. Registers claimed by a proxy can no
+ * longer be written through any other proxy's address, until that proxy
+ * releases the claim. The claim status is set once any proxy owns @reg, so
+ * read the claim register back to check that the claim is held by this proxy.
+ */
+static int tda54_scm_conf_claim(struct tda54_scm_conf *scm, unsigned int reg)
+{
+	unsigned int block = reg / TDA54_SCM_CONF_CLAIM_BLOCK_SIZE;
+	unsigned int bit = (reg % TDA54_SCM_CONF_CLAIM_BLOCK_SIZE) /
+			   TDA54_SCM_CONF_CLAIM_REG_STRIDE;
+	unsigned int claim_reg = scm->pdata->claim_offset +
+				 block * TDA54_SCM_CONF_CLAIM_REG_STRIDE;
+	unsigned int status_reg = scm->pdata->claim_status_offset +
+				  block * TDA54_SCM_CONF_CLAIM_REG_STRIDE;
+	u32 val;
+
+	if (!scm->proxy) {
+		if (readl(scm->base + status_reg) & BIT(bit))
+			return -EBUSY;
+
+		return 0;
+	}
+
+	val = readl(scm->base + claim_reg);
+	val |= BIT(bit);
+	writel(val, scm->base + claim_reg);
+
+	if (!(readl(scm->base + claim_reg) & BIT(bit)))
+		return -EBUSY;
+
+	return 0;
+}
+
+static int tda54_scm_conf_reg_read(void *context, unsigned int reg,
+				   unsigned int *val)
+{
+	struct tda54_scm_conf *scm = context;
+
+	*val = readl(scm->base + reg);
+
+	return 0;
+}
+
+static int tda54_scm_conf_reg_write(void *context, unsigned int reg,
+				    unsigned int val)
+{
+	struct tda54_scm_conf *scm = context;
+	int ret;
+
+	ret = tda54_scm_conf_claim(scm, reg);
+	if (ret)
+		return ret;
+
+	writel(val, scm->base + reg);
+
+	return 0;
+}
+
+static const struct regmap_config tda54_scm_conf_regmap_cfg = {
+	.reg_bits = 32,
+	.val_bits = 32,
+	.reg_stride = 4,
+	.fast_io = true,
+	.reg_read = tda54_scm_conf_reg_read,
+	.reg_write = tda54_scm_conf_reg_write,
+};
+
+static int tda54_scm_conf_register_socinfo(struct device *dev,
+					   struct regmap *regmap)
+{
+	u32 jtag_id;
+	int ret;
+
+	ret = regmap_read(regmap, TDA54_JTAG_ID_REG_OFFSET, &jtag_id);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to read JTAG ID\n");
+
+	return k3_socinfo_register(dev, jtag_id);
+}
+
+static int tda54_scm_conf_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct tda54_scm_conf *scm;
+	struct regmap *regmap;
+	void __iomem *base;
+	int ret;
+
+	scm = devm_kzalloc(dev, sizeof(*scm), GFP_KERNEL);
+	if (!scm)
+		return -ENOMEM;
+
+	base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	if (of_property_read_u32(dev->of_node, "ti,proxy-id", &scm->proxy))
+		return dev_err_probe(dev, -ENODATA, "missing ti,proxy-id property\n");
+
+	if (scm->proxy >= 8)
+		return dev_err_probe(dev, -EINVAL,
+				     "ti,proxy-id must be between 0 and 7\n");
+
+	scm->base = base + scm->proxy * TDA54_SCM_CONF_PROXY_STRIDE;
+
+	/* Get register offsets from driver data (matched by compatible) */
+	scm->pdata = of_device_get_match_data(dev);
+
+	regmap = devm_regmap_init(dev, NULL, scm, &tda54_scm_conf_regmap_cfg);
+	if (IS_ERR(regmap))
+		return PTR_ERR(regmap);
+
+	writel(TDA54_SCM_CONF_LOCK_KICK0_UNLOCK_VAL, scm->base + scm->pdata->lock_offset);
+	writel(TDA54_SCM_CONF_LOCK_KICK1_UNLOCK_VAL, scm->base + scm->pdata->lock_offset + 4);
+
+	/*
+	 * There is no way to unregister a syscon regmap, so publish it only
+	 * once nothing else in probe can fail.
+	 */
+	ret = of_syscon_register_regmap(dev->of_node, regmap);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to register syscon regmap\n");
+
+	/*
+	 * SoC identification is informational, so a failure here must not fail
+	 * the probe. It is registered last and released through devres.
+	 */
+	ret = tda54_scm_conf_register_socinfo(dev, regmap);
+	if (ret)
+		dev_warn(dev, "SoC info not registered: %d\n", ret);
+
+	return 0;
+}
+
+static const struct of_device_id tda54_scm_conf_of_match[] = {
+	{ .compatible = "ti,tda54-mcu-scm-conf", .data = &tda54_scm_conf_data },
+	{ /* sentinel */ },
+};
+MODULE_DEVICE_TABLE(of, tda54_scm_conf_of_match);
+
+static struct platform_driver tda54_scm_conf_driver = {
+	.probe = tda54_scm_conf_probe,
+	.driver = {
+		.name = "k3-tda54-scm-conf",
+		.of_match_table = tda54_scm_conf_of_match,
+		.suppress_bind_attrs = true,
+	},
+};
+
+module_platform_driver(tda54_scm_conf_driver);
+
+MODULE_AUTHOR("Moteen Shah <m-shah@ti.com>");
+MODULE_DESCRIPTION("TDA54 SCM Configuration syscon driver");
+MODULE_LICENSE("GPL");
-- 
2.34.1

