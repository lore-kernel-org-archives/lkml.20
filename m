Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.150.75
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794247839;
	b=bW96Czk1FHiOK26YN1lQvA/NeSqakl1+x/iNKM3ryav4b2olkbrGPfRLiL6Z5bpPuVrN
	 2n9jbpa4VCqi06S6R7ofLdc5bjdsBIvOitURLFsOqt2SF3vBAK2H/HYMwivPYaUxQwXuI
	 shzoPFHFOcXFi5UaJFuaatJQFjlt1oEa5HSWKWTbhnmyezOyUg02MjqG6OkQqaxi4Guli
	 QR3hpDMQmg6X959n2g6zXJKrgT8LKGWEg2R7fAt6EL+68LJSUDZfpFv+zxWCSyTd3j3qP
	 I6eAM+YVz2bkcqqjlGskWP6lGzMF+kQ+l5WiWxbW8i9oTF1hpkzDMGiYTYNavytOw0g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794247839;
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
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=RRZaLIsvUX5e0VUYNQ7BuEvG6jzldD2O4GLQHnLNRek=;
	b=jK+Q//hecoyiVWE3xytCvoLnWSbzYs0yWCUqBvk1D0elKy0O40rxzTCLr/BRw+UIDXMM
	 vKvi4y967xqH4hbVXGn1a2oRR5yZj8GP/8hECqRzY3/aI4w9kkHsPiHw6fj0YFPrUWIFr
	 jChpYizzGUmFc7z+t76ZOGRTOHgZL9i29CZC94F881KYX0PbQB7//x7J0h7QWFNu0zCH6
	 1QIufrMONgx6HXB/RPoftzH4itSisWcyGAb4eIQw/XrqJvdbUXS/sYouPA6UleSJIa+t8
	 28vw7VfRAf0F5T5yJafnSOy/mVBm8kzIUtOs3JWOArVGArl/vbeyoHyzdGPsJ8xyM7w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ti.com;
	spf=pass smtp.mailfrom=ti.com;
	dkim=pass header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=J6jC09P5;
	dkim=pass header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=LPy5coAl;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.150.75
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A4A6606A325;
	Mon,  9 Nov 2026 18:10:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A4A6606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=J6jC09P5;
	dkim=pass (1024-bit key, unprotected) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=LPy5coAl
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 6A9HIEBi3692840;
	Mon, 9 Nov 2026 12:10:25 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=RRZaLIsvUX5e0VUYNQ7BuEvG6jzldD2O4GLQHnLNR
	ek=; b=J6jC09P5BSE9jBPpFzx1moil6tOJ5Fhe0ZKWtp2NLRX3BILYndU3TY8vb
	ou+qDGiSirlLZl0lnhSJ+zqNHAMIZrnQAPjINDBkpTs0i42N1tEwAPT/sHFMnIwb
	HkgrQKWa0Ep5EtemYPmwKWeZNwmp+P59gwv+Qnu7rMoZvM05IjU4pYKXhkkd9GlU
	p2S7CB0Bxndo01hKA/0AnO4bKfSRgZN2/uOnDN8OeL5Q+SHaF+pmVmandfTKpv/e
	SBeyAb+pVP1Z6LcRrg3BEIa2oNtqQb4RIdC7sQC4nySpnvgu5WP26vlzxfcM7Q0j
	Tlp4CSnKCKgvb+CaBEoiDbOAYrBKg==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010051.outbound.protection.outlook.com [52.101.201.51])
	by m0380145.ppops.net (PPS) with ESMTPS id 4huacwu78h-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 09 Nov 2026 12:10:25 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jS/wHMbdq+csM7YqXHHPzlzZingT8QW3uOH3LKoZsci4v2M5MEkOZLU4TSKt/Ph0fFZEK10tRKn0raz6lATzGSh1w6aPztqPt+E1E24ryuMcEF+PE0bp/pzOxx7C13HpW/v2kvEpRXege2qIeluQ4okC5BbWaUUtaT/PmLuWjZWpgu7EOUbWeWPrBTNNSwj3NKwJr+jG58cySuba8UGgW/8dW6yyHvQF+xwEmoum22neVcoPvwmWsqoWc8qvxncj2rUeSStE3BConX2pUDGbSQ7zHeYpzNDH5WmAYFR6F6ZXb8C/sXpwUX+UanOYldl//14v07H6nNgiTQLrcSOgqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RRZaLIsvUX5e0VUYNQ7BuEvG6jzldD2O4GLQHnLNRek=;
 b=GUk/O1ON0kHNsC8I0V4nsx32IP4I0Ln3C/mox3jLDKXCV4ZWv6NT2iWHqFm25wOb8umSqsO4AsLb2nCiTM6N+YLsnuBWVi7RSrPtiiGipxsmPAxlLG2bUV8rNNZY+r1E0X+qbhJ+qzgDBgMktaf0jt+snlvFDvMyMbZYJjvZ6P/Am588xTxMGZlsrPWCFnmnYO2lkYSqVbMIhMRV7aCNC24oKNn9imYLqryypTUiHUZMJhTbAX819eBgx6/dxSDZPJM/Uf9zWs+dxK32FB6GI00Pubngp8sugssj7UyiaA2PuyKhEBNZG2NwN9/NI8vLNO0vNxtgrv9wpR7cq41H/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RRZaLIsvUX5e0VUYNQ7BuEvG6jzldD2O4GLQHnLNRek=;
 b=LPy5coAlnflQ/0hSa6cqiUfJTEyCzC20+ICO1CBGnmMCw6aa8MC3whKcgquaaElfW3ucztPeCsXALNpH0iPE5vGLvz6tpz038ibnTMCNjjHOY/eRSf+fQRVYWnoZIiYCty6brYmYoljG/kL+8fRtkaMy73G1xHHkVePADyxxbN8=
Received: from CY5PR20CA0024.namprd20.prod.outlook.com (2603:10b6:930:3::25)
 by SAVPR10MB997794.namprd10.prod.outlook.com (2603:10b6:806:4e9::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Mon, 9 Nov
 2026 18:10:22 +0000
Received: from CY8PEPF00000054.namprd05.prod.outlook.com
 (2603:10b6:930:3:cafe::5a) by CY5PR20CA0024.outlook.office365.com
 (2603:10b6:930:3::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.13 via Frontend Transport; Mon, 9
 Nov 2026 18:10:22 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CY8PEPF00000054.mail.protection.outlook.com (10.167.247.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Mon, 9 Nov 2026 18:10:22 +0000
Received: from DLEE209.ent.ti.com (157.170.170.98) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 9 Nov
 2026 12:10:09 -0600
Received: from DLEE201.ent.ti.com (157.170.170.76) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 9 Nov
 2026 12:10:09 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Mon, 9 Nov 2026 12:10:09 -0600
Received: from udba0500997.dhcp.ti.com (udba0500997.dhcp.ti.com [128.247.75.222])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6A9IA8xJ3363147;
	Mon, 9 Nov 2026 12:10:09 -0600
From: Thorsten Lannynd <t-lannynd@ti.com>
To: <linux-arm-kernel@lists.infradead.org>
CC: <b-brnich@ti.com>, <praneeth@ti.com>, <r-donadkar@ti.com>,
        <devarsht@ti.com>, <kieran.bingham@ideasonboard.com>,
        <jai.luthra@ideasonboard.com>, Nishanth Menon <nm@ti.com>,
        "Vignesh
 Raghavendra" <vigneshr@ti.com>,
        Tero Kristo <kristo@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH 2/3] arm64: dts: ti: k3-j721e-sk: Add orientation to IMX219 sensors
Date: Mon, 9 Nov 2026 12:08:58 -0600
Message-ID: <20261109180859.4139929-2-t-lannynd@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261109180859.4139929-1-t-lannynd@ti.com>
References: <20261109180859.4139929-1-t-lannynd@ti.com>
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
X-MS-TrafficTypeDiagnostic: CY8PEPF00000054:EE_|SAVPR10MB997794:EE_
X-MS-Office365-Filtering-Correlation-Id: 24e706b7-f132-4ce8-bd00-08df3e8cb89b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|82310400026|36860700016|56012099006|261021121427099003|261022075727099003|261022105027099003|261009223027099003|261026140227099003|261028144727099003|261102123227099003|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	w5tcEOmQpJS+oM2h62fd0RWdUHZX0TvkN6/Aw9vTnoZmMKzM/Muh16ZstrQkLDac3li/DWN0jiZXX3CbJxMD68kf0yJJl/Bx8OmbIIxsO0vqNyVdpLxcd4ovPzLEkWbKGwRGSVFTC908opuD/l0G3PTmdwgfWPnRhZjv7vH7LVizLLnWnDece+X+mN2k9CA87zuY6EsNDqsecQi9IJQAUqzU3vwfBSn03boWt85wOYBtlMHCkUPwLjWJlv0wZqEjGMKCPR2HYv3SQstvOUygDIBwASDKw5NPeZvB8udnyR1KO++iYGOt+/3OlpKjoeeb+jFu0HpFUKeCswJQQFkjbvC6pqv6OrdAkISav0ruWCRszTsbYb8Z9t8VVgIwlvjWgFm27uvZhjmk7TRxxMthRKkOwHZJ/gam/8I7WBgdGsTbDbukR1o7zlg2hbF7cj8VRX8VRsdu7GZsXvmsjY/e6/dqqiofXhXZ7Fo5Kh9gcVwDyCZzqVSaIP2auvMeZiejvbcNebzzXCxSi/a0uLcGLIv5U1COLLPCDdUoiig+EanwC1KGcvo5at8U6BePU7kSKssBkDu2H77haY+VqMg0ICn3xb6f741JCbV/c0vQzVBH9cEl+9b2E1tFCrheh16ASaX3J4qvVjcvTk8Wl6poy5buEpmCGVGUd5b5nH38Js4pP3KZqGg4nxZzLIJjfW04XzJuBo3tiZMMsBBmQ3HPWg==
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(82310400026)(36860700016)(56012099006)(261021121427099003)(261022075727099003)(261022105027099003)(261009223027099003)(261026140227099003)(261028144727099003)(261102123227099003)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	qC/fiaXqAJT4BVBBsv3NeCsUP5jcO0nwOQbb5meNlxfqXXRMoK6kpwUHplZXZAjf3XXDmoIkj5vQ2JSpLuSH3U+QXbkUpAQQdn+Dy6xF9YHib0/BT0F+TPlyuAwc+Lz7jmezTXu02Ks0Ymcl9OPLAfX7C2Cu35ABHVFqTJ/2LVX6J5YoYDLwAb2MlVfMwc85LslVD5E7r32fuSWgaz7UIjg1L1DQXgtGhc/Zz/lw2HAzpvf0NEyP+fzG6uNio65nRv8pTsU2tf9TohcgBniaoq+vrcgOkFbtfeQ3TMrR6pU/IzwRsRuJq8RZoPt+VDHNwhjIx8ZzZa9SaNEGGJ/nem4DRx9sgBVG+grjVI1NUUr1QzmV13VjSCOK6EOJR/gtOr9b0YV052yBflcRLZgeP4dR53Ibh7dLFr9L0hKV6KrcGKJt58jz7KSRlwYyazRT
X-Exchange-RoutingPolicyChecked:
	tKlgkTZy0NjuOJlFN7QSJLVx/5ZFFjutPH8gTQHFhnxfa9YGUf4PbzBsOcPIZPfuXeXvFAWevknQ5dSyH6PNhDTsYNDHdI+R+tmgXzOOi6doAV6onE0TQvSKcOXsTryM1cbbcLMXGTyDRI6nUaTn0wxwQC2HdbgR4sGDPR1Lbqchq/TaYcBK2eCYgs+Cxq4gOrKzupXqZaIAR37ZbkPHo7ZPn38eHkB++7kHIa6GONnEdThxHzryu8ZTEJX8nMuvCqqCrrYDRLmZmgnKi3Xc97w7xjji4ypK7ItCDD6TNS+tffJQFKlduJ15PqBpeexyoTAk/5+3VfdM13S8Y7iXWw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2026 18:10:22.2651
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 24e706b7-f132-4ce8-bd00-08df3e8cb89b
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY8PEPF00000054.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAVPR10MB997794
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA3MiBTYWx0ZWRfX/M3Ssk+RhFzt
 XmxpfTRBJEJNO5sKlua0IFNAPfLIA/OnYl0gGpwRxUkMKCKEdggi6sCP0+w38KHMo05/DHgk+Er
 8D8uRP3bEvQn2QV4jAaHHdsyu22kKcKI/J+ycprdytREmATj6KBgLm8rK8SM/Onzg/T8rYyrlpE
 9Ik8n+4sArU/dx993TiqqrGsGsF7pp7r2a5QaIu6jUySnt2uuja5gJjCP2ukpsYxm3LmQfFEH5d
 rp1zpsxRBEuLqnKzYQbkMnj0YQOWD1FHq+LniAbnxJUHXnzZbSNfAzdQJiZLTQUNnKraYOpoUY8
 QKkMiPuDPBBrRjd6FZv6ObD37ERmd3FlZ/FIolGfKpZ5SUO+4J60jUbMsV4Iyz78UVW+xCqmM2M
 gNy3h6FRMpIAYstDd6DcMhifosQHQ7OAV7DEInSwAGtZa62Ne68gYuxhxCaQzcF0HqdRnqmpGf/
 pubcVLcUe0c9xPvV01Q==
X-Authority-Analysis: v=2.4 cv=d6NgWhjE c=1 sm=1 tr=0 ts=6af20c91 cx=c_pps
 a=f0OpuPnQRmDrWRgsA3vZMw==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=sozttTNsAAAA:8 a=ptcS-y05Xk0ap3Xa2TQA:9
X-Proofpoint-GUID: jk8xZtgyUY0qIVCzYXGPy_l3Nv8Cb1-0
X-Proofpoint-ORIG-GUID: jk8xZtgyUY0qIVCzYXGPy_l3Nv8Cb1-0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA3MiBTYWx0ZWRfX5XBYRpPn5bZ+
 5ARXLP8Vx3pAOYuMx5wgNeCJ+6UZPX70R+hcgCZgaMh4uMmUUmgA67TjN5Jq2/37GUS6gsQXgTY
 A3ZHBJwzPankGkC2OwhyL438sCL1Omc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_06,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 adultscore=0 priorityscore=1501 suspectscore=0
 phishscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090072

The IMX219 CSI2 expansion modules are externally attached. Without the
orientation property, V4L2_CID_CAMERA_ORIENTATION (0x009a0922) is not
exposed and libcamera fails with:

  ERROR CameraSensor camera_sensor_raw.cpp:465 'imx219 4-0010':
  Mandatory V4L2 control 0x009a0922 not available

Set orientation = <MEDIA_ORIENTATION_EXTERNAL> on both sensor nodes
to fix this.

Signed-off-by: Thorsten Lannynd <t-lannynd@ti.com>
---
 arch/arm64/boot/dts/ti/k3-j721e-sk-csi2-dual-imx219.dtso | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-j721e-sk-csi2-dual-imx219.dtso b/arch/arm64/boot/dts/ti/k3-j721e-sk-csi2-dual-imx219.dtso
index 4eb3cffab032..c3403232d767 100644
--- a/arch/arm64/boot/dts/ti/k3-j721e-sk-csi2-dual-imx219.dtso
+++ b/arch/arm64/boot/dts/ti/k3-j721e-sk-csi2-dual-imx219.dtso
@@ -11,6 +11,7 @@
 /plugin/;
 
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/media/video-interface-devices.h>
 #include "k3-pinctrl.h"
 
 &{/} {
@@ -64,6 +65,7 @@ imx219_0: imx219-0@10 {
 		VANA-supply = <&reg_2p8v>;
 		VDIG-supply = <&reg_1p8v>;
 		VDDL-supply = <&reg_1p2v>;
+		orientation = <MEDIA_ORIENTATION_EXTERNAL>;
 
 		port {
 			csi2_cam0: endpoint {
@@ -88,6 +90,7 @@ imx219_1: imx219-1@10 {
 		VANA-supply = <&reg_2p8v>;
 		VDIG-supply = <&reg_1p8v>;
 		VDDL-supply = <&reg_1p2v>;
+		orientation = <MEDIA_ORIENTATION_EXTERNAL>;
 
 		port {
 			csi2_cam1: endpoint {
-- 
2.34.1

