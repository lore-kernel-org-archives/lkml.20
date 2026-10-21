Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.154.28
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792583582;
	b=rLmZvGWyz2WOPyxqbKC3LW/LRRs8GGrzL1IBg3fdDTkugzCaMLHBbscaqVDcTWl1YuXx
	 T8aSoCjX6phJ4nByZ2onpCHVbZIFYsJkbNzFgHSBkX+qFtcguiIdUlFwnKJYIekbBXQTC
	 KBVGZwD9soABtuvYUoRA7QA7dKD0GMOWjcJQXma86Fnzhq2Llj0xX5DqBWr7lrmcWFnFs
	 gWUnjhkBwHepbgd6oXY6xacibf0ScOHIndgiOTViy3LgcZraI662vVVKyC7qCcMUUjy/7
	 hmwdVz0Y3KX31WvOWZXb6QGGMH5jQ0Ac64Z9pzb6hSVO+luibkjxLI89cgy5I6KpJRg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792583582;
	h=DMARC-Filter:Received:DKIM-Signature:Received:DKIM-Signature:
	 Received:Received:X-MS-Exchange-Authentication-Results:Received-SPF:
	 Received:Received:Received:Received:Received:Date:From:To:CC:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-EOPAttributedMessage:X-MS-PublicTrafficType:
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
	bh=zUBLWHHP4h73iSlogf5bZVvmvQ+TLWU6VLE9bMWgLyM=;
	b=YX/c6Vg+RYdA+mvNIv1ECrwB20khlVRWnu3EhlXUaeIoMIRI0AvCNhmvcwNBsrD33HQo
	 eEP7ueAd25lNOP1E1XZdHKcMrS2ueVVRlpcI7mzZUw+kABOKopVWMg0fn+VfFTHYbTceD
	 us+ontZugTIXUxcE/tO1JCCBB67Md8UdkNTm43ChuWiZZEhoUEtUeeiZbIPWhVmqo490Q
	 lfUrDkloTNKB+xVMyPDbTmwPbxkH4Dy2EqjIJ4OMpxSePuv5QxrgIhGa4Ig9+HshsziWP
	 UtUlghKNBLRrbxq3+Ioh5BQzHOPZ5GcW184h/3sPX2wlAkZI0zhLbrYhtAGZuRjlx4Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ti.com;
	spf=pass smtp.mailfrom=ti.com;
	dkim=pass header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=g5DnxURC;
	dkim=pass header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=TkPu17Dx;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.154.28
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEED0606A319
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 11:53:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CEED0606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=g5DnxURC;
	dkim=pass (1024-bit key, unprotected) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=TkPu17Dx
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LBgnVf1596180;
	Wed, 21 Oct 2026 06:52:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=proofpoint-05-2026; bh=zUBLWHHP4h73iSl
	ogf5bZVvmvQ+TLWU6VLE9bMWgLyM=; b=g5DnxURCmjrgb+zc5Hu9oSvVbZZIQpG
	u93fXaTCCtCtE1E5F7r60tEZb4P2+yi+VtzrLLVYkvR/DWxlM/flH8WaFnHyWEwd
	dpJU6XqTUMfgfEbsi4g5WXEwEmtNq8FPzjV1msjsfKCPqBRocbb0Bj9NnGPOahvL
	V6ZBf4/U/Z+IWTWluHXr7NVEncyn0mI4IFr5loTMgE2bRAMFARBhsI9qvaX00PvG
	/qMH34oWNE3qU0FZh3KyEAzDd8JkJgODV8piASH9JMS4Oc9EDHQLXEf3uxzC8uKp
	xVqeA3/IbATadiYMQf9cG70X28ycl6I+8l3eV7mxlytFq38HsHGl2LQ==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012028.outbound.protection.outlook.com [40.93.195.28])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4henaaj84g-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 21 Oct 2026 06:52:54 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KjdHCmeug04AVYn92vkrkCLYcxgyB5MIxKOLgU0JiwAqWHToljBaM+CyTtP091sCl+cn0MV3KSUXe9jquWB+MIBLz/LRtw7+KfERUs3Y/oiob1vXad0l8C9znl6hEdNG8VhUOFInvB3u6ARRC1o5qXXWAtb0PQCW4rPhyWOEbw7Uqdc0LcKwOVtSI5sUAhKCT0E7sttwbxPQBuDAE13gvEbOxI/8JdHY1XG48rXvFLYl5rRkASYbn5D9RrqM2tfD4uUOgeQjEV1re/4UtcyvbYUkcxlqvQCouIvONlRShfPY2VoWHbXiVzCd52kNZhxOEI5YUeRS6dX/yNcgNYRojQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zUBLWHHP4h73iSlogf5bZVvmvQ+TLWU6VLE9bMWgLyM=;
 b=AGDXhzCGAmryhiNHPouWOHV+4dxumXccktLdfKnFtSPc0UnM6lEsHF0zr1V1OUWryNiKe5opj7pcQIvS4UvanuMpHIr4kC3IaABIQFgo5HWhuyo9PVZ6ZBeGO/nCZRN5KP3vqdhc55IDWUUy8FZ7DssKAfWwSSwoLCA9PjKSPbgR8ByCIN8ujhl2TY0Pwuimkb+tRDJKX/EGd0PGewNntXZZLfOqo/eVta9B8roPz6xqxgvUZ/gRX41i1XZijZf8dl5UGB/gpnulXCCG+Wdb/J4JQGCGFIdmy6CHt7vT34TGOJpe5faLv/PjRVtGBAz5BAjAYr5llrYN2PYWmh5rFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zUBLWHHP4h73iSlogf5bZVvmvQ+TLWU6VLE9bMWgLyM=;
 b=TkPu17DxdVNVK/hXo8BmEf4zGfZ6iv5pUnmo0TxBQcV8vgBBkgNaRCELnoXzT74R0twl9IBsDgxn84l/o5/RFmweWTFrbALv2GLbq4XlTXdZWphPdPUloiXU7E6CEoD3Ck0mhMsSCdLaIZ4qKbLy25A4udkY4HzW+567PtecnsU=
Received: from SJ0PR13CA0119.namprd13.prod.outlook.com (2603:10b6:a03:2c5::34)
 by IA1PR10MB5994.namprd10.prod.outlook.com (2603:10b6:208:3ee::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Wed, 21 Oct
 2026 11:52:52 +0000
Received: from MWH0EPF000D894D.namprd05.prod.outlook.com
 (2603:10b6:a03:2c5:cafe::62) by SJ0PR13CA0119.outlook.office365.com
 (2603:10b6:a03:2c5::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.16 via Frontend Transport; Wed,
 21 Oct 2026 11:52:51 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 MWH0EPF000D894D.mail.protection.outlook.com (10.167.249.213) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.15 via Frontend Transport; Wed, 21 Oct 2026 11:52:50 +0000
Received: from DLEE206.ent.ti.com (157.170.170.90) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 21 Oct
 2026 06:52:44 -0500
Received: from DLEE208.ent.ti.com (157.170.170.97) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 21 Oct
 2026 06:52:44 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 21 Oct 2026 06:52:44 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232] (may be forged))
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 69LBqicO2534904;
	Wed, 21 Oct 2026 06:52:44 -0500
Date: Wed, 21 Oct 2026 06:52:44 -0500
From: Nishanth Menon <nm@ti.com>
To: Moteen Shah <m-shah@ti.com>
CC: <conor+dt@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <linux-kernel@vger.kernel.org>, <ssantosh@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <u-kumar1@ti.com>,
        <gehariprasath@ti.com>, <vigneshr@ti.com>, <afd@ti.com>,
        <a-limaye@ti.com>, <y-abhilashchandra@ti.com>
Subject: Re: [PATCH 3/3] soc: ti: Add TDA54 SCM configuration syscon support
Message-ID: <20261021115244.i2nbn4h4nrtras64@waltz>
References: <20261019080736.944127-1-m-shah@ti.com>
 <20261019080736.944127-4-m-shah@ti.com>
 <fc306acb-e9ea-4b5b-804a-4d6eeedd9066@ti.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <fc306acb-e9ea-4b5b-804a-4d6eeedd9066@ti.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000D894D:EE_|IA1PR10MB5994:EE_
X-MS-Office365-Filtering-Correlation-Id: 815ea279-b5cc-4767-fcd9-08df2f69d589
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|36860700016|82310400026|56012099006|4143699003|261009223027099003|10067099003|18002099003|22082099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	p06ViymYfye95q2jgW+teKBRWbUZYO/sr6W2nuzH4Ft3Rj+l8axOnAAWFQ5f2j7e6AhUbYJr7LyFGG7LeiuOrZ/+EXuVvNrE2OrbnR9qEyYnxi2r9FcLs0tw5e82zMGZ0hdLGNAOU5QPuYPYK3sQTeytUuYqR2TdS9hWFriqWSBnJjygz1NcC1/Ttq+4IO8J/aStplwhw4QIXtZkCMqhyetJ3FO3g8EBvuKL5WpRwckBAhuIKCl41YE/YAXgtM/fyTzTRKJCjeFxo7MWF6x2qS/CPAJeAurr14spMTXAk7nd8ZP6SgdqIxO6NH7UzdpbTUKI+tyxA20hlElP5vw99HDgezecCfiGRfGA755l1Hl85+Y8s3WCOu9VUhGQl/zI5Y1S/ZSu19hC+F30Kk5j60C/f7cNUfMd3/VXGejUYy2YzqybtCO0bNlJdJGucLi5AktagyesKapB3qd7NNQ/8LX8rNu/KwAkkvao7zQGdPIvjwFeF1vijjBcatXfsnNBQ4MN+ko2vnhOmOZd/LBFxvSb8j7vn3/wacyKHzhucaOkItibO/BRJJbgASqL+tSaSiPw654aWiPIQPYWyjnFC+dNM9FdYHTDFk+eep1XeKlP9gs775AaXCvPcogVJlqiqVYCwp+WpHUnfJPt+QCgCw==
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(36860700016)(82310400026)(56012099006)(4143699003)(261009223027099003)(10067099003)(18002099003)(22082099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Kd6WiO8DYDIN07BFhQl09Ak7eR2aPDKWoegf/CuKCaTfss6ri/nIPQXu0OsitYCffXKBvQDVsfWAeCFQbmzux0BGEFeN1Vp3DLMDmmou26kxEjoyoiQXXY4kc7c02L4dOVSHQrvsDZ/QybGJ8AvDEZhSVqdXsO/bPQ3mzW+Vazu6KQsg4C8FLosJs843nlsx/qlac8UOi0Z8J480slWMCg3myKcL64YnvL80HrHQXf1uofKEcmNB4hr0cL5sCyWjHIfTwlf0nS2bi/o53nrEHCCVpl2aRvU2qwmhmDAvFKg+dZB3wvP2qLla9AUe2uJL6G/+EwkyNco/1KQkDsyotXEaw3xOCXXHMZ0ubnQcmWAFp2D6sqRezfsC4/xRee8WR5tL8wFB2XWlzdqpwU/gTlpEXq/WHj0m1zfWLp2o4bzFdU14jMxARFyCcOA79Uda
X-Exchange-RoutingPolicyChecked:
	V02iQDww/JDXjiFAD/f1KwQ3F0OuqA9RF22W5P9Zw/NqgSK/atJqonj1c5o1fji2RjxlqwvWgl+r+CTk0iKdvTL0Eb3UMChZBozcGJA//pD6NLsLu5lIaaKpipGFHVLSq6P4IYzwbVJfrCuM5FPP5xmrb2qUnwjTq7LVZ5i/8ehkpwVenTUyrsUofk9W0h0eSrkF3/Izq68rnqy+vLYfYQOU3K5g3VUdjHJEDdgPVPxuuN5Noha0c/Hwi7ihFNeb33kn2YK5Vn3fBjKjOeI/+dU09urbfgakGsQXCiksEZzBl9hcsulbodIjmxYXJVfEdLE1yYe3ll7oFyzU/hgq0Q==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2026 11:52:50.9298
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 815ea279-b5cc-4767-fcd9-08df2f69d589
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000D894D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB5994
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA0NyBTYWx0ZWRfX5J8Lc1s7TmYr
 dD1ese0SHDVGaZyAIrQhSoGKvJrEYQmyIQZt5VrgvT7XuheBKrHqNOxPp0OGRZukfd/z8aemDzK
 Cr+E60EfD+z5eAkIYq8TxnI6t6MapD0=
X-Proofpoint-ORIG-GUID: nr1T_dHW5xaxYPCsJNLveul7IBgFr1A8
X-Proofpoint-GUID: nr1T_dHW5xaxYPCsJNLveul7IBgFr1A8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA0NyBTYWx0ZWRfX0LrnqF1lTQyG
 7QVxrQKAb3JZxO0wobBmdsKdY7ehb6GUNHx7wepz7tNt1JVHlZkb+7DBrxAEhRNm2ST71V85tQv
 Oqrzh+5E+zAWsO0gwzZTONWFIn/Bc1JgFQdRsLoivpX8W+EQJFlx97oi8NykmOTmCkGerRvh41y
 hVi5J3knexInzu2k/xFxpeApf9qUEWPi4xE8xaj8jCHwVGv0qOp4T9axRRqPQOvYBzOMmRTQcLj
 ygCl7yKBmqq4zP+I13I0L6gqcU8Ruvq4JiHbQIQ4xDh1y0ipcD3qj4Gu5Qh/CbobwsUlFVGrZ+v
 Lk7UbjZmubQg6hfQ0rCO+KtxLsriZ3fAPRjFEmWrTQK7fVs+NUXmqC88mKoeVyVhIJEIFXgcWcm
 3D65MKRs4J/TVSRH6s2nvGmpyUCoEymP6DUuGE9lEdvg5tvQFdAwXftr2wRQBb7HGxkB9LeWeKh
 pCy+TRBv+k7HiNhgIvg==
X-Authority-Analysis: v=2.4 cv=cJB1IVeN c=1 sm=1 tr=0 ts=6ad8a796 cx=c_pps
 a=ueqEiCdEPg/1B0HMGLd3rg==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10
 a=s63m1ICgrNkA:10 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=fPAWb5peG099m5CrUpKH:22 a=c92rfblmAAAA:8
 a=sozttTNsAAAA:8 a=dlSwPf6isEKNRwWW4dIA:9 a=CjuIK1q_8ugA:10
 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 suspectscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210047

On 12:06-20261021, Moteen Shah wrote:

> I was going by the reviews from Sashiko[0], I had similar concern before
> sharing this patch upstream.
> It would be really great if I can have some suggestions on this.
> 
> 1. Have it inbuilt
> 2. Remove the module_exit, make the module unremovable
> 3. Look towards a core syscon fixup?
> 
> Option 3 would be to add of_syscon_unregister_regmap(np) and subsequent
> consumer driver changes.
> 
> [0]https://sashiko.dev/#/patchset/20261019080736.944127-1-m-shah%40ti.com


My preference for drivers/soc/ti is to have drivers as modules.

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
https://ti.com/opensource
