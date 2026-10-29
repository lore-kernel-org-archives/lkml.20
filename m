Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.150.75
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793297556;
	b=PnKTqQHr71dHQ9ELsdEG9nfAavQvb5xmAm1i12v8SyfzCgxOgQgiKfk98JBSd00/1OVM
	 vXNSW7li+MsnrWvEcjrrEn2VqEfSIjNWvLcS5kZ9cSK5Z5jBdzeyQBS1WyBIwRdOLUtBT
	 LQ6oci05IVW6ExFpCAoJ/qoxtvrWrgN4NrR9u9Rv4UrEOD8hqeqvVclCsvpcEfe0EbQOB
	 XTPPVXKT4CqfPA4V8+9bvQ0W7/UpRQVJ+N5mqsvR0ifamJmH+s7Q0wLH7XKrHFWB4cH/9
	 iV53fM6VnaDZ7sSAxh3cCa1Uq5Mx7nlosbd37NTSzF8ZM8qjEl1cPAEPqbJH0uoHlbA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793297556;
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
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=BWEMg7gklZwl9PRt5r0kKcFkyzp5LrthgA5GSL0cWac=;
	b=BIe5DoJUqQBLU24UDMq2bCl/zAXxYpcVmslYcng+uL2bpJHOynBkDNg7mXOnovTkPN0u
	 4G3Jnt3n6NurAzOQch+xUKsU4fRJyOfpmGIuu3EcrwbwS1X4DUwrWCyW9uob3K23XoYh7
	 1z03UEyRuyVTqTQ1IWxTYifL3sjuJ4MMVRy+KD7JehVNFmRFQGdRv7Fw0xRz5MRvIocKJ
	 ssCPEn/KsT46R33+6PrBGSRbRSMjhlkr+Zf2Vp7bst3zd2tfoMq2TGanZFvTzkq5B5n4t
	 /6sDl8IIZesfZOjt0a2axEI8b0oaDO8/Kpp3JTvW2Rple5hgORg8w1N0cWJ3dONxMzA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ti.com;
	spf=pass smtp.mailfrom=ti.com;
	dkim=pass header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=k7RlaCAs;
	dkim=pass header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=qo4n7ngE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.150.75
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD448606A339
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 18:12:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD448606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=k7RlaCAs;
	dkim=pass (1024-bit key, unprotected) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=qo4n7ngE
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 69TGDVcK1079174;
	Thu, 29 Oct 2026 13:12:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=BWEMg7gklZwl9PRt5r0kKcFkyzp5LrthgA5GSL0cW
	ac=; b=k7RlaCAs7AjSoKREU6PUvALLBnBLevo36yNWgfMVO9Qi2PS9fG2qAqZ2a
	MgkYuWP1Hq0dZoC1YU3789tFMFAPw5jGtV4fktJhV3IJB1oVQf7Ai9+JADF1+oDk
	NWeNuflMDVzGSz+s5lyEZqujcQeXy5951e7FvPOBwAId2Oa/0thOGq4tUnc76pno
	1FqNM7FxWmH2b+RF21Lz8zIWlz1UE39R1qrmLeDhdrYHZtPNqq91+PFAl7DcPoPE
	BMRSoctP1PPKhPgjDa9iVsxfqFCB/XOtr4Qiza9KTbC3/pME0axoOOcWilPSveo/
	Ug/wkRy5S4GhFD2wkb/9wA3uTHQ9Q==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011049.outbound.protection.outlook.com [52.101.62.49])
	by m0384305.ppops.net (PPS) with ESMTPS id 4hkurvxahy-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 29 Oct 2026 13:12:30 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nu0rH7s9xdcYZqHK01HBIQMy8qoPhRi/WrXKMtHuKquVkmN4tRtGND4/Of3SzeMq9Dd0ybA+5Ldniqg5CI/5qOYlXaQ+uHp1lCCoGrzoJF9i+jmBqtCdNTovvhXtLnNWMFN4zTGo7jejX+mOgLJeZEw3XLIaFpFzp97NhMorROBcS4KCoLy7TWecxrpSZBWnth9sDJ9zK5GUQIP+yo7cWjg6FjmiGLrpCjlKvetcuiuOHRxEFi/Wry6Wd9puz39rnEqvW/S+/u7h0BfxBMhfsa6R0NvhQL2l2zy7r18I9SWkht6KGqN3TfDX9GwVCnmLRer5NANDWpm8JXvLqUjaZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BWEMg7gklZwl9PRt5r0kKcFkyzp5LrthgA5GSL0cWac=;
 b=BGCwcI8Ao4egkCABvCe7QlaGIiQB1bi17npAInmQucHGaQzYOlbbznZVApe1Gg3WHb9pavc7FKpd0shuLgShnGxzIUz5anylhfHuGV18GWx++K3GnSQ3UjuBQeKxLbw7w9D1yyG2vte7/88jFlUFiK2q8UQ2Z/6CugORhaBwFpdVy+8L204YSZFxKnba32Fu3M7XzQBWeL9I1yhT1E+2xs6rp43aXMedNIOia8rWhC4Dpgj+OSbepLnarxRDk/6uIFbak5wHMUij0S2MR70YRMkx97m1/AkU7xbH9n+d5UCT3JB9I1d95ZfMM8leXCbjIJMTaHNwg0gzUHpKGUUrPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BWEMg7gklZwl9PRt5r0kKcFkyzp5LrthgA5GSL0cWac=;
 b=qo4n7ngEqZ5bhdr0vhYQbZio18c7wrWB3POEK/geJE7+vuEO9QjutR1GQIgC5/DNWJrH71nk2qtAhGP70Yu4cA19E7SDT3yo1fyjUYdqo3FOdDF8eaZJDT66FUuCN66RwDqaFRCD4kFw1Kc6VWTlpFNJnPrTi25wpZzAbh80dYE=
Received: from DS1P221CA0004.NAMP221.PROD.OUTLOOK.COM (2603:10b6:8:451::17) by
 CH3PR10MB6739.namprd10.prod.outlook.com (2603:10b6:610:147::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.8; Thu, 29 Oct 2026 18:12:11 +0000
Received: from CY5PEPF00000E76.namprd02.prod.outlook.com
 (2603:10b6:8:451:cafe::6e) by DS1P221CA0004.outlook.office365.com
 (2603:10b6:8:451::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Thu, 29
 Oct 2026 18:12:11 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CY5PEPF00000E76.mail.protection.outlook.com (10.167.247.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Thu, 29 Oct 2026 18:12:11 +0000
Received: from DLEE205.ent.ti.com (157.170.170.85) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 29 Oct
 2026 13:11:54 -0500
Received: from DLEE214.ent.ti.com (157.170.170.117) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 29 Oct
 2026 13:11:54 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 29 Oct 2026 13:11:54 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [10.24.50.162])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 69TIBmM13408718;
	Thu, 29 Oct 2026 13:11:52 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <nm@ti.com>, <kristo@kernel.org>, <ssantosh@kernel.org>, <afd@ti.com>,
        <vigneshr@ti.com>, <u-kumar1@ti.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <b-padhi@ti.com>
Subject: [PATCH v3 01/22] firmware: ti_sci: Move error message handling into ti_sci_get_one_xfer()
Date: Thu, 29 Oct 2026 23:41:26 +0530
Message-ID: <20261029181147.266771-2-b-padhi@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261029181147.266771-1-b-padhi@ti.com>
References: <20261029181147.266771-1-b-padhi@ti.com>
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
X-MS-TrafficTypeDiagnostic: CY5PEPF00000E76:EE_|CH3PR10MB6739:EE_
X-MS-Office365-Filtering-Correlation-Id: c9a63b0b-7a3e-4da2-5d67-08df35e8272c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|82310400026|36860700016|261028144727099003|56012099006|261009220027099003|261009223027099003|261022105027099003|261022075727099003|261026121527099003|261026140227099003|261021121427099003|261009221227099003|261009221727099003|10067099003|261021123027099003|261009223327099003|18002099003|22082099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	84UyBKhz82+Jw06mdWoZvZfVCwhxKmfHvcPhtHqFSIc7rfMq7aHP9US/xm7D4DHvj6taK0snjMFoGvNZQzH7aapD52oF6i4RdlHvgHGAmI/jCD6drW5nfEcjFlNgiQmJlRb6m4JCDCwreIZ1if6eD+gbPWLJOCM6xWGeQowr/YQkmUlz2OTv6XY68DPIPEK54kBGZC08VxAK0voHyi3Ct7pAtW6Cssrs5AGZpQVFPP2FQvEk+p/DzZ55fuHXjrJgG7ndHBnO/vkefKEX4LE6WXu/0O+6OZOFM5fva4j14cPJ4rlw+RTsX1xBPOFuC0g8NMha8aDeid7L3feKifXR3kFdEiaD6WI3qWgbDpzr/GWXCssg3Ph1fTcuvcFeq83UfWu82M8dDa7RLB22Nyr8SXKhr4cAowEFH7O09sXn2DeKRsDfQCzyx/AW1Ir3Je4jctHbI3n5J1CrH3rmiq6E7JhgkGKi+MJxtLhhpAjWfYAOzeSgglDnnsaL/xWzsF2pePR8Pzv4UqrwuDHYliHu+QVzljcjcvOhJpWwfu8YT12mWYUsktUGE/+nntSz0RzNVLAddgS3JgUtw86v9cEQkVOmlkRnYTs95QzzeQsoxzWDajixHw6DUqUAHFuYGWstZrYgy0MYz/V3W1mG3307/T4Ml3aDNfyXMVgDg2giif8=
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(82310400026)(36860700016)(261028144727099003)(56012099006)(261009220027099003)(261009223027099003)(261022105027099003)(261022075727099003)(261026121527099003)(261026140227099003)(261021121427099003)(261009221227099003)(261009221727099003)(10067099003)(261021123027099003)(261009223327099003)(18002099003)(22082099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	o+qFQLVlBjfZjkkJ47OAjE9OZQynA+y0lQArAVr8q+10SlKoPnaZ+U42h51W6tO0iUdiq7uElxEZhzpVtO7WewJRvaQJTDbUU+lA+AK0w7ilWmCc3DrEpFANdOBUD2kmAm1HtBwGHIuObXogAT3GhXMNeqg18BYDcxXvjqfLeSaQmdKVdOwtP+ebePM8Rjhnv80NthV5NLtLq1xPEQ523DPaQMLWlCV8640P89qZlYJaNbJnk+Z2WO+13ggLXJCn2PlzLGdeQjXBgwdUtjDRXaZ4iwqgc7lB8bltNh+Zn75OZC39GgVUjA7anj4sb1wkqO31F7tia5CKZoSzG0KOkThTOC9qK0T4bVgP/mNWeWHW6rHQQTqu5vREsyk7ey8GfEFxUCD5E1xVDVHeXF65iLZKt4cULVdJ/IEP8vHmgaJVJtPm+sPKQka5M+F/cH8R
X-Exchange-RoutingPolicyChecked:
	UmjFUgg+MWgJ9jnnqeDgsmVpiQLjAFtYgHvepfazPwilwAyxo24VWhKHGcxFCTCrR2pufOqZnHD8EAmh54f/JuaeerU+gW9IY7TVBjUAbZljSwLsngIMDI+BABlEjzTkjnHiOvqcZsrerYKRTo+Kba8D1b/yAz4eiS1Gq5fufuERpASxNa7AESLO3LYGP5iirJnh6FiAJ4q0YU/DruobjAfj0dKySTX4yZJFfZz8d7KU0Aiml8kKtN15p47gl1JcWnPpPEHbr0dSo7A13zst/8ShM3S99HGieGKt38N3iZPrZXyjQbi/5IFQ5mNfAt1sSLcNIKEj7ObPmFkVf+V4Mw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2026 18:12:11.4865
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c9a63b0b-7a3e-4da2-5d67-08df35e8272c
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY5PEPF00000E76.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB6739
X-Proofpoint-ORIG-GUID: 1F9THqCC4T-wmzhO90e5aXuwkE_TAlzK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA3MSBTYWx0ZWRfX9EMH0qrknpkW
 i0PtJuNSge4yUKNx0MdBzndo+4R/lTKddLB2OumQw7onBR+T1KzRRgAlrr83BgJIonwBTA9a1va
 oCAEJQNANFTUZfD60aHoHBMOtIsLhZK9ifFIa0rflWeeKDZZhK6rCpSn7R9MGLLflLnMSC6d99C
 TZC4hwYU1dRk/sTMSFHrF8usyNE8KyOMJ6NBvSqjab0Ofu1NlxQ/WDEQCq0UDX89Q6gPpetb01f
 ewAZ9q/+CwlpYimk6E9Jq1MTIVfD1d+lsDfZ9RuWjBLIelXlebzDmrjmHBqUwWqnzMksUOafE+D
 V0CRQ1lo+n6n0QkycOmXm65LRM7ju26asoHxVzKsBkcoDzwNVagVn6ojqvsk3MzfMAZwGvNDGUR
 16GiUS0AWSVAL0BTQsWtt7c1t95KkRqbdN+E6gclJ4oubnldDYwFem9nGpRU+jgN3Kc8vspdxsU
 hTndwfLpMhWKPBa/gzA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA3MSBTYWx0ZWRfXxNjyS0y8vsyf
 UFxO7umExhmi5YAIOP0pe4Wyg5OZ+AID5tvZ2kqMDGpmHLNcNd4ZYOjHs1A2+F/0cOeKMHdLu6+
 CblOmD1mEhU912NpKWKB2rj67huPkdc=
X-Proofpoint-GUID: 1F9THqCC4T-wmzhO90e5aXuwkE_TAlzK
X-Authority-Analysis: v=2.4 cv=DtrDa2/+ c=1 sm=1 tr=0 ts=6ae38c8e cx=c_pps
 a=M+4CHf8fKMkYOwSYEMZyZQ==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=660iZSQnnn4A:10 a=s63m1ICgrNkA:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=VwQbUJbxAAAA:8 a=sozttTNsAAAA:8
 a=NjKYTb1M58wiEBSgNdIA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290071

From: Andrew Davis <afd@ti.com>

This allows for more exact error message than just "Message alloc failed",
and also removes the redundant message printing code from each call site.

Signed-off-by: Andrew Davis <afd@ti.com>
Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
---
v3: Changelog:
1. None to this patch.

Link to v2:
https://lore.kernel.org/all/20260930160607.2674980-2-b-padhi@ti.com/

v2: Changelog:
1. None to this patch.

Link to v1:
https://lore.kernel.org/all/20260929201746.4078803-2-b-padhi@ti.com/

 drivers/firmware/ti_sci.c | 278 +++++++++++++++-----------------------
 1 file changed, 106 insertions(+), 172 deletions(-)

diff --git a/drivers/firmware/ti_sci.c b/drivers/firmware/ti_sci.c
index 5fa63ff7c74a6..5e7d04754913e 100644
--- a/drivers/firmware/ti_sci.c
+++ b/drivers/firmware/ti_sci.c
@@ -315,6 +315,7 @@ static struct ti_sci_xfer *ti_sci_get_one_xfer(struct ti_sci_info *info,
 					       size_t rx_message_size)
 {
 	struct ti_sci_xfers_info *minfo = &info->minfo;
+	struct device *dev = info->dev;
 	struct ti_sci_xfer *xfer;
 	struct ti_sci_msg_hdr *hdr;
 	unsigned long flags;
@@ -326,8 +327,11 @@ static struct ti_sci_xfer *ti_sci_get_one_xfer(struct ti_sci_info *info,
 	/* Ensure we have sane transfer sizes */
 	if (rx_message_size > info->desc->max_msg_size ||
 	    tx_message_size > info->desc->max_msg_size ||
-	    rx_message_size < sizeof(*hdr) || tx_message_size < sizeof(*hdr))
+	    rx_message_size < sizeof(*hdr) || tx_message_size < sizeof(*hdr)) {
+		dev_err(dev, "TI-SCI message size out of range (caller: %pS)\n",
+			(void *)_RET_IP_);
 		return ERR_PTR(-ERANGE);
+	}
 
 	/*
 	 * Ensure we have only controlled number of pending messages.
@@ -336,8 +340,11 @@ static struct ti_sci_xfer *ti_sci_get_one_xfer(struct ti_sci_info *info,
 	 */
 	timeout = msecs_to_jiffies(info->desc->max_rx_timeout_ms) * 5;
 	ret = down_timeout(&minfo->sem_xfer_count, timeout);
-	if (ret < 0)
+	if (ret < 0) {
+		dev_err(dev, "TI-SCI timeout waiting for transfer semaphore (caller: %pS)\n",
+			(void *)_RET_IP_);
 		return ERR_PTR(ret);
+	}
 
 	/* Keep the locked section as small as possible */
 	spin_lock_irqsave(&minfo->xfer_lock, flags);
@@ -481,11 +488,8 @@ static int ti_sci_cmd_get_revision(struct ti_sci_info *info)
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 				   sizeof(struct ti_sci_msg_hdr),
 				   sizeof(*rev_info));
-	if (IS_ERR(xfer)) {
-		ret = PTR_ERR(xfer);
-		dev_err(dev, "Message alloc failed(%d)\n", ret);
-		return ret;
-	}
+	if (IS_ERR(xfer))
+		return PTR_ERR(xfer);
 
 	rev_info = (struct ti_sci_msg_resp_version *)xfer->xfer_buf;
 
@@ -549,11 +553,9 @@ static int ti_sci_set_device_state(const struct ti_sci_handle *handle,
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_SET_DEVICE_STATE,
 				   flags | TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 				   sizeof(*req), sizeof(*resp));
-	if (IS_ERR(xfer)) {
-		ret = PTR_ERR(xfer);
-		dev_err(dev, "Message alloc failed(%d)\n", ret);
-		return ret;
-	}
+	if (IS_ERR(xfer))
+		return PTR_ERR(xfer);
+
 	req = (struct ti_sci_msg_req_set_device_state *)xfer->xfer_buf;
 	req->id = id;
 	req->state = state;
@@ -610,11 +612,9 @@ static int ti_sci_get_device_state(const struct ti_sci_handle *handle,
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_GET_DEVICE_STATE,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 				   sizeof(*req), sizeof(*resp));
-	if (IS_ERR(xfer)) {
-		ret = PTR_ERR(xfer);
-		dev_err(dev, "Message alloc failed(%d)\n", ret);
-		return ret;
-	}
+	if (IS_ERR(xfer))
+		return PTR_ERR(xfer);
+
 	req = (struct ti_sci_msg_req_get_device_state *)xfer->xfer_buf;
 	req->id = id;
 
@@ -912,11 +912,9 @@ static int ti_sci_cmd_set_device_resets(const struct ti_sci_handle *handle,
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_SET_DEVICE_RESETS,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 				   sizeof(*req), sizeof(*resp));
-	if (IS_ERR(xfer)) {
-		ret = PTR_ERR(xfer);
-		dev_err(dev, "Message alloc failed(%d)\n", ret);
-		return ret;
-	}
+	if (IS_ERR(xfer))
+		return PTR_ERR(xfer);
+
 	req = (struct ti_sci_msg_req_set_device_resets *)xfer->xfer_buf;
 	req->id = id;
 	req->resets = reset_state;
@@ -987,11 +985,9 @@ static int ti_sci_set_clock_state(const struct ti_sci_handle *handle,
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_SET_CLOCK_STATE,
 				   flags | TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 				   sizeof(*req), sizeof(*resp));
-	if (IS_ERR(xfer)) {
-		ret = PTR_ERR(xfer);
-		dev_err(dev, "Message alloc failed(%d)\n", ret);
-		return ret;
-	}
+	if (IS_ERR(xfer))
+		return PTR_ERR(xfer);
+
 	req = (struct ti_sci_msg_req_set_clock_state *)xfer->xfer_buf;
 	req->dev_id = dev_id;
 	if (clk_id < 255) {
@@ -1055,11 +1051,9 @@ static int ti_sci_cmd_get_clock_state(const struct ti_sci_handle *handle,
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_GET_CLOCK_STATE,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 				   sizeof(*req), sizeof(*resp));
-	if (IS_ERR(xfer)) {
-		ret = PTR_ERR(xfer);
-		dev_err(dev, "Message alloc failed(%d)\n", ret);
-		return ret;
-	}
+	if (IS_ERR(xfer))
+		return PTR_ERR(xfer);
+
 	req = (struct ti_sci_msg_req_get_clock_state *)xfer->xfer_buf;
 	req->dev_id = dev_id;
 	if (clk_id < 255) {
@@ -1286,11 +1280,9 @@ static int ti_sci_cmd_clk_set_parent(const struct ti_sci_handle *handle,
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_SET_CLOCK_PARENT,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 				   sizeof(*req), sizeof(*resp));
-	if (IS_ERR(xfer)) {
-		ret = PTR_ERR(xfer);
-		dev_err(dev, "Message alloc failed(%d)\n", ret);
-		return ret;
-	}
+	if (IS_ERR(xfer))
+		return PTR_ERR(xfer);
+
 	req = (struct ti_sci_msg_req_set_clock_parent *)xfer->xfer_buf;
 	req->dev_id = dev_id;
 	if (clk_id < 255) {
@@ -1354,11 +1346,9 @@ static int ti_sci_cmd_clk_get_parent(const struct ti_sci_handle *handle,
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_GET_CLOCK_PARENT,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 				   sizeof(*req), sizeof(*resp));
-	if (IS_ERR(xfer)) {
-		ret = PTR_ERR(xfer);
-		dev_err(dev, "Message alloc failed(%d)\n", ret);
-		return ret;
-	}
+	if (IS_ERR(xfer))
+		return PTR_ERR(xfer);
+
 	req = (struct ti_sci_msg_req_get_clock_parent *)xfer->xfer_buf;
 	req->dev_id = dev_id;
 	if (clk_id < 255) {
@@ -1424,11 +1414,9 @@ static int ti_sci_cmd_clk_get_num_parents(const struct ti_sci_handle *handle,
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_GET_NUM_CLOCK_PARENTS,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 				   sizeof(*req), sizeof(*resp));
-	if (IS_ERR(xfer)) {
-		ret = PTR_ERR(xfer);
-		dev_err(dev, "Message alloc failed(%d)\n", ret);
-		return ret;
-	}
+	if (IS_ERR(xfer))
+		return PTR_ERR(xfer);
+
 	req = (struct ti_sci_msg_req_get_clock_num_parents *)xfer->xfer_buf;
 	req->dev_id = dev_id;
 	if (clk_id < 255) {
@@ -1503,11 +1491,9 @@ static int ti_sci_cmd_clk_get_match_freq(const struct ti_sci_handle *handle,
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_QUERY_CLOCK_FREQ,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 				   sizeof(*req), sizeof(*resp));
-	if (IS_ERR(xfer)) {
-		ret = PTR_ERR(xfer);
-		dev_err(dev, "Message alloc failed(%d)\n", ret);
-		return ret;
-	}
+	if (IS_ERR(xfer))
+		return PTR_ERR(xfer);
+
 	req = (struct ti_sci_msg_req_query_clock_freq *)xfer->xfer_buf;
 	req->dev_id = dev_id;
 	if (clk_id < 255) {
@@ -1579,11 +1565,9 @@ static int ti_sci_cmd_clk_set_freq(const struct ti_sci_handle *handle,
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_SET_CLOCK_FREQ,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 				   sizeof(*req), sizeof(*resp));
-	if (IS_ERR(xfer)) {
-		ret = PTR_ERR(xfer);
-		dev_err(dev, "Message alloc failed(%d)\n", ret);
-		return ret;
-	}
+	if (IS_ERR(xfer))
+		return PTR_ERR(xfer);
+
 	req = (struct ti_sci_msg_req_set_clock_freq *)xfer->xfer_buf;
 	req->dev_id = dev_id;
 	if (clk_id < 255) {
@@ -1644,11 +1628,9 @@ static int ti_sci_cmd_clk_get_freq(const struct ti_sci_handle *handle,
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_GET_CLOCK_FREQ,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 				   sizeof(*req), sizeof(*resp));
-	if (IS_ERR(xfer)) {
-		ret = PTR_ERR(xfer);
-		dev_err(dev, "Message alloc failed(%d)\n", ret);
-		return ret;
-	}
+	if (IS_ERR(xfer))
+		return PTR_ERR(xfer);
+
 	req = (struct ti_sci_msg_req_get_clock_freq *)xfer->xfer_buf;
 	req->dev_id = dev_id;
 	if (clk_id < 255) {
@@ -1711,11 +1693,8 @@ static int ti_sci_cmd_prepare_sleep(const struct ti_sci_handle *handle, u8 mode,
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_PREPARE_SLEEP,
 				   msg_flags,
 				   sizeof(*req), sizeof(*resp));
-	if (IS_ERR(xfer)) {
-		ret = PTR_ERR(xfer);
-		dev_err(dev, "Message alloc failed(%d)\n", ret);
-		return ret;
-	}
+	if (IS_ERR(xfer))
+		return PTR_ERR(xfer);
 
 	req = (struct ti_sci_msg_req_prepare_sleep *)xfer->xfer_buf;
 	req->mode = mode;
@@ -1775,11 +1754,8 @@ static int ti_sci_msg_cmd_query_fw_caps(const struct ti_sci_handle *handle,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 				   sizeof(struct ti_sci_msg_hdr),
 				   sizeof(*resp));
-	if (IS_ERR(xfer)) {
-		ret = PTR_ERR(xfer);
-		dev_err(dev, "Message alloc failed(%d)\n", ret);
-		return ret;
-	}
+	if (IS_ERR(xfer))
+		return PTR_ERR(xfer);
 
 	ret = ti_sci_do_xfer(info, xfer);
 	if (ret) {
@@ -1832,11 +1808,9 @@ static int ti_sci_cmd_set_io_isolation(const struct ti_sci_handle *handle,
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_SET_IO_ISOLATION,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 				   sizeof(*req), sizeof(*resp));
-	if (IS_ERR(xfer)) {
-		ret = PTR_ERR(xfer);
-		dev_err(dev, "Message alloc failed(%d)\n", ret);
-		return ret;
-	}
+	if (IS_ERR(xfer))
+		return PTR_ERR(xfer);
+
 	req = (struct ti_sci_msg_req_set_io_isolation *)xfer->xfer_buf;
 	req->state = state;
 
@@ -1890,11 +1864,8 @@ static int ti_sci_msg_cmd_lpm_wake_reason(const struct ti_sci_handle *handle,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 				   sizeof(struct ti_sci_msg_hdr),
 				   sizeof(*resp));
-	if (IS_ERR(xfer)) {
-		ret = PTR_ERR(xfer);
-		dev_err(dev, "Message alloc failed(%d)\n", ret);
-		return ret;
-	}
+	if (IS_ERR(xfer))
+		return PTR_ERR(xfer);
 
 	ret = ti_sci_do_xfer(info, xfer);
 	if (ret) {
@@ -1954,11 +1925,9 @@ static int ti_sci_cmd_set_device_constraint(const struct ti_sci_handle *handle,
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_LPM_SET_DEVICE_CONSTRAINT,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 				   sizeof(*req), sizeof(*resp));
-	if (IS_ERR(xfer)) {
-		ret = PTR_ERR(xfer);
-		dev_err(dev, "Message alloc failed(%d)\n", ret);
-		return ret;
-	}
+	if (IS_ERR(xfer))
+		return PTR_ERR(xfer);
+
 	req = (struct ti_sci_msg_req_lpm_set_device_constraint *)xfer->xfer_buf;
 	req->id = id;
 	req->state = state;
@@ -2011,11 +1980,9 @@ static int ti_sci_cmd_set_latency_constraint(const struct ti_sci_handle *handle,
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_LPM_SET_LATENCY_CONSTRAINT,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 				   sizeof(*req), sizeof(*resp));
-	if (IS_ERR(xfer)) {
-		ret = PTR_ERR(xfer);
-		dev_err(dev, "Message alloc failed(%d)\n", ret);
-		return ret;
-	}
+	if (IS_ERR(xfer))
+		return PTR_ERR(xfer);
+
 	req = (struct ti_sci_msg_req_lpm_set_latency_constraint *)xfer->xfer_buf;
 	req->latency = latency;
 	req->state = state;
@@ -2056,11 +2023,9 @@ static int ti_sci_cmd_lpm_abort(struct device *dev)
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_LPM_ABORT,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 				   sizeof(*req), sizeof(*resp));
-	if (IS_ERR(xfer)) {
-		ret = PTR_ERR(xfer);
-		dev_err(dev, "Message alloc failed(%d)\n", ret);
-		return ret;
-	}
+	if (IS_ERR(xfer))
+		return PTR_ERR(xfer);
+
 	req = (struct ti_sci_msg_hdr *)xfer->xfer_buf;
 
 	ret = ti_sci_do_xfer(info, xfer);
@@ -2100,11 +2065,9 @@ static int ti_sci_cmd_core_reboot(const struct ti_sci_handle *handle)
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_SYS_RESET,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 				   sizeof(*req), sizeof(*resp));
-	if (IS_ERR(xfer)) {
-		ret = PTR_ERR(xfer);
-		dev_err(dev, "Message alloc failed(%d)\n", ret);
-		return ret;
-	}
+	if (IS_ERR(xfer))
+		return PTR_ERR(xfer);
+
 	req = (struct ti_sci_msg_req_reboot *)xfer->xfer_buf;
 
 	ret = ti_sci_do_xfer(info, xfer);
@@ -2162,11 +2125,8 @@ static int ti_sci_get_resource_range(const struct ti_sci_handle *handle,
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_GET_RESOURCE_RANGE,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 				   sizeof(*req), sizeof(*resp));
-	if (IS_ERR(xfer)) {
-		ret = PTR_ERR(xfer);
-		dev_err(dev, "Message alloc failed(%d)\n", ret);
-		return ret;
-	}
+	if (IS_ERR(xfer))
+		return PTR_ERR(xfer);
 
 	req = (struct ti_sci_msg_req_get_resource_range *)xfer->xfer_buf;
 	req->secondary_host = s_host;
@@ -2283,11 +2243,9 @@ static int ti_sci_manage_irq(const struct ti_sci_handle *handle,
 
 	xfer = ti_sci_get_one_xfer(info, type, TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 				   sizeof(*req), sizeof(*resp));
-	if (IS_ERR(xfer)) {
-		ret = PTR_ERR(xfer);
-		dev_err(dev, "Message alloc failed(%d)\n", ret);
-		return ret;
-	}
+	if (IS_ERR(xfer))
+		return PTR_ERR(xfer);
+
 	req = (struct ti_sci_msg_req_manage_irq *)xfer->xfer_buf;
 	req->valid_params = valid_params;
 	req->src_id = src_id;
@@ -2607,11 +2565,9 @@ static int ti_sci_cmd_rm_ring_cfg(const struct ti_sci_handle *handle,
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_RM_RING_CFG,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 				   sizeof(*req), sizeof(*resp));
-	if (IS_ERR(xfer)) {
-		ret = PTR_ERR(xfer);
-		dev_err(dev, "RM_RA:Message config failed(%d)\n", ret);
-		return ret;
-	}
+	if (IS_ERR(xfer))
+		return PTR_ERR(xfer);
+
 	req = (struct ti_sci_msg_rm_ring_cfg_req *)xfer->xfer_buf;
 	req->valid_params = params->valid_params;
 	req->nav_id = params->nav_id;
@@ -2671,11 +2627,9 @@ static int ti_sci_cmd_rm_psil_pair(const struct ti_sci_handle *handle,
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_RM_PSIL_PAIR,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 				   sizeof(*req), sizeof(*resp));
-	if (IS_ERR(xfer)) {
-		ret = PTR_ERR(xfer);
-		dev_err(dev, "RM_PSIL:Message reconfig failed(%d)\n", ret);
-		return ret;
-	}
+	if (IS_ERR(xfer))
+		return PTR_ERR(xfer);
+
 	req = (struct ti_sci_msg_psil_pair *)xfer->xfer_buf;
 	req->nav_id = nav_id;
 	req->src_thread = src_thread;
@@ -2727,11 +2681,9 @@ static int ti_sci_cmd_rm_psil_unpair(const struct ti_sci_handle *handle,
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_RM_PSIL_UNPAIR,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 				   sizeof(*req), sizeof(*resp));
-	if (IS_ERR(xfer)) {
-		ret = PTR_ERR(xfer);
-		dev_err(dev, "RM_PSIL:Message reconfig failed(%d)\n", ret);
-		return ret;
-	}
+	if (IS_ERR(xfer))
+		return PTR_ERR(xfer);
+
 	req = (struct ti_sci_msg_psil_unpair *)xfer->xfer_buf;
 	req->nav_id = nav_id;
 	req->src_thread = src_thread;
@@ -2782,11 +2734,9 @@ static int ti_sci_cmd_rm_udmap_tx_ch_cfg(const struct ti_sci_handle *handle,
 	xfer = ti_sci_get_one_xfer(info, TISCI_MSG_RM_UDMAP_TX_CH_CFG,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 				   sizeof(*req), sizeof(*resp));
-	if (IS_ERR(xfer)) {
-		ret = PTR_ERR(xfer);
-		dev_err(dev, "Message TX_CH_CFG alloc failed(%d)\n", ret);
-		return ret;
-	}
+	if (IS_ERR(xfer))
+		return PTR_ERR(xfer);
+
 	req = (struct ti_sci_msg_rm_udmap_tx_ch_cfg_req *)xfer->xfer_buf;
 	req->valid_params = params->valid_params;
 	req->nav_id = params->nav_id;
@@ -2854,11 +2804,9 @@ static int ti_sci_cmd_rm_udmap_rx_ch_cfg(const struct ti_sci_handle *handle,
 	xfer = ti_sci_get_one_xfer(info, TISCI_MSG_RM_UDMAP_RX_CH_CFG,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 				   sizeof(*req), sizeof(*resp));
-	if (IS_ERR(xfer)) {
-		ret = PTR_ERR(xfer);
-		dev_err(dev, "Message RX_CH_CFG alloc failed(%d)\n", ret);
-		return ret;
-	}
+	if (IS_ERR(xfer))
+		return PTR_ERR(xfer);
+
 	req = (struct ti_sci_msg_rm_udmap_rx_ch_cfg_req *)xfer->xfer_buf;
 	req->valid_params = params->valid_params;
 	req->nav_id = params->nav_id;
@@ -2923,11 +2871,9 @@ static int ti_sci_cmd_rm_udmap_rx_flow_cfg(const struct ti_sci_handle *handle,
 	xfer = ti_sci_get_one_xfer(info, TISCI_MSG_RM_UDMAP_FLOW_CFG,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 				   sizeof(*req), sizeof(*resp));
-	if (IS_ERR(xfer)) {
-		ret = PTR_ERR(xfer);
-		dev_err(dev, "RX_FL_CFG: Message alloc failed(%d)\n", ret);
-		return ret;
-	}
+	if (IS_ERR(xfer))
+		return PTR_ERR(xfer);
+
 	req = (struct ti_sci_msg_rm_udmap_flow_cfg_req *)xfer->xfer_buf;
 	req->valid_params = params->valid_params;
 	req->nav_id = params->nav_id;
@@ -2995,11 +2941,9 @@ static int ti_sci_cmd_proc_request(const struct ti_sci_handle *handle,
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_PROC_REQUEST,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 				   sizeof(*req), sizeof(*resp));
-	if (IS_ERR(xfer)) {
-		ret = PTR_ERR(xfer);
-		dev_err(dev, "Message alloc failed(%d)\n", ret);
-		return ret;
-	}
+	if (IS_ERR(xfer))
+		return PTR_ERR(xfer);
+
 	req = (struct ti_sci_msg_req_proc_request *)xfer->xfer_buf;
 	req->processor_id = proc_id;
 
@@ -3047,11 +2991,9 @@ static int ti_sci_cmd_proc_release(const struct ti_sci_handle *handle,
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_PROC_RELEASE,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 				   sizeof(*req), sizeof(*resp));
-	if (IS_ERR(xfer)) {
-		ret = PTR_ERR(xfer);
-		dev_err(dev, "Message alloc failed(%d)\n", ret);
-		return ret;
-	}
+	if (IS_ERR(xfer))
+		return PTR_ERR(xfer);
+
 	req = (struct ti_sci_msg_req_proc_release *)xfer->xfer_buf;
 	req->processor_id = proc_id;
 
@@ -3102,11 +3044,9 @@ static int ti_sci_cmd_proc_handover(const struct ti_sci_handle *handle,
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_PROC_HANDOVER,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 				   sizeof(*req), sizeof(*resp));
-	if (IS_ERR(xfer)) {
-		ret = PTR_ERR(xfer);
-		dev_err(dev, "Message alloc failed(%d)\n", ret);
-		return ret;
-	}
+	if (IS_ERR(xfer))
+		return PTR_ERR(xfer);
+
 	req = (struct ti_sci_msg_req_proc_handover *)xfer->xfer_buf;
 	req->processor_id = proc_id;
 	req->host_id = host_id;
@@ -3161,11 +3101,9 @@ static int ti_sci_cmd_proc_set_config(const struct ti_sci_handle *handle,
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_SET_CONFIG,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 				   sizeof(*req), sizeof(*resp));
-	if (IS_ERR(xfer)) {
-		ret = PTR_ERR(xfer);
-		dev_err(dev, "Message alloc failed(%d)\n", ret);
-		return ret;
-	}
+	if (IS_ERR(xfer))
+		return PTR_ERR(xfer);
+
 	req = (struct ti_sci_msg_req_set_config *)xfer->xfer_buf;
 	req->processor_id = proc_id;
 	req->bootvector_low = bootvector & TI_SCI_ADDR_LOW_MASK;
@@ -3222,11 +3160,9 @@ static int ti_sci_cmd_proc_set_control(const struct ti_sci_handle *handle,
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_SET_CTRL,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 				   sizeof(*req), sizeof(*resp));
-	if (IS_ERR(xfer)) {
-		ret = PTR_ERR(xfer);
-		dev_err(dev, "Message alloc failed(%d)\n", ret);
-		return ret;
-	}
+	if (IS_ERR(xfer))
+		return PTR_ERR(xfer);
+
 	req = (struct ti_sci_msg_req_set_ctrl *)xfer->xfer_buf;
 	req->processor_id = proc_id;
 	req->control_flags_set = control_flags_set;
@@ -3281,11 +3217,9 @@ static int ti_sci_cmd_proc_get_status(const struct ti_sci_handle *handle,
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_GET_STATUS,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 				   sizeof(*req), sizeof(*resp));
-	if (IS_ERR(xfer)) {
-		ret = PTR_ERR(xfer);
-		dev_err(dev, "Message alloc failed(%d)\n", ret);
-		return ret;
-	}
+	if (IS_ERR(xfer))
+		return PTR_ERR(xfer);
+
 	req = (struct ti_sci_msg_req_get_status *)xfer->xfer_buf;
 	req->processor_id = proc_id;
 
-- 
2.34.1

