Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.154.28
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793297580;
	b=T+afm7p6y/f7SVNlL+2OvDspkRKINOd/RpfdIMiaGgf7l1R8FrzfDXA21UTlcpMWKp+f
	 ovdasuk/dgifUBhoZUV0az9bcc9GJj9gT6wJ+QUIfKHCP8rmmybzGkBDdYiAEgH7RGRpp
	 yO6JsKYbNAJpJybEcKbSzhCIuhfhKFfJX6vX/n9IRZ9+51BQhqh5J+Ar7ZTBBxSEYKGJe
	 uYc990L2EUO50wJcJkFYm7+A1A3YnZSl3Qqa4TicSuTaOPS1eek1E9jwqnaQea5Q8nyXh
	 6AXdrl1VBCME7RxrzLnWBFepJmcYBd1ojyYQleW/2IiyTf4ADvZ+Zi/BrRh8q/nJqBw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793297580;
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
	bh=AxMTpUNSJFcR6W9ow5HKSwSdprGVRmE+rxEEiXQX1TM=;
	b=C8blfoEyKHHNFJJamdsjIE8+cwl96cj5Hsb/q6NYrtvEj8hvVHwXiwCIULH88uGfxawO
	 yK/a2j3vkg/0Uq2gCBp7bAosP1Err4ztUSvrakB4Jpmql4ZJZ+u/Pyhvyg/S32xNBukQ8
	 dUBMGvjLDnMgJAVTTL76ULhvnDMWVtuXYF32PDf/+rddot3+6H8W/aQEexHOE2uhlzzIZ
	 h0D+AuajCxybtHNwrJkrwGwBa7gK1avzddpO51PQjoA6YO4GG8CHLQYbNjjNHKwDsU0U8
	 RDwpkJ1hQeZ8G8waMlr8Qxee2WAuzqXh7eSdibZywU5PWpXTQK2GHxb4klBX/2AUWrQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ti.com;
	spf=pass smtp.mailfrom=ti.com;
	dkim=pass header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=ROxDOWma;
	dkim=pass header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=IueuzuLq;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.154.28
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DF81606A32E
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 18:12:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3DF81606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=ROxDOWma;
	dkim=pass (1024-bit key, unprotected) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=IueuzuLq
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69TGDivM2604281;
	Thu, 29 Oct 2026 13:12:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=AxMTpUNSJFcR6W9ow5HKSwSdprGVRmE+rxEEiXQX1
	TM=; b=ROxDOWma/I4gMrotJ+OcLysAeY07dpTlw34GK+FoyesX/nJuGcxIGDAbj
	T8elWZh8yICVz3qe1HzSP77dwHqTNbTgJMebXKr5m3d6k0cCNjKnZa02qfSycxDA
	uoV1fV1/022pQpCKNLIrS62ncVj3c7WoG52KONUrp6URmv/K82pJEKDfXecWpxks
	fX6rv429/TrHvZv04tcZMMIH9E12SeUen8TNTbahXS4nKYECzVr+zgnfkpG6PRfb
	5NOiZfQsp5Nxw5NBe5iQIFmyL67TCigq50aGScK/p//pNexFUxmXTvCfsfy6Uqwl
	h6KB4LapuMT41CqdE1+4tEgxXzQog==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010066.outbound.protection.outlook.com [52.101.201.66])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4hm55ak3kb-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 29 Oct 2026 13:12:44 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XqFZGA8UF5P8xjMOQfMUDrmnZrpm1YvU+yIw/FaG18WhWzL17nxOuMk4UoQcm2Rfy0iZcR+uEc58pLCIfIfQBRw8SPdik/jDJ3RACieptQ0aaqfB6klR50Ky871jTbitkcumQMIVF+xCg+/o4c16C9hTaMrU4W0049XgW7ANKpNbHOAv7qUOx5MVFV4jlsI5FsGNGCZEs1M5CkgUdmZE2VYVSDIp8Lk2OPhK/wBKopsdmN5J5zIAgui381gX6BJVnq11Vkwblc3ecLw9N7vp4A6NW/kRnR7mHKMrS6q7vFYuWASEAiBHOB7UX9TUM3oa7iVHvPjtjcWggQ4PgPHXGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AxMTpUNSJFcR6W9ow5HKSwSdprGVRmE+rxEEiXQX1TM=;
 b=eUokFm4exqPmnJtqOB02PuE8TPDkoTyYN1srxpdReQ+Hs3rgqSCEKOL5nSiQmnsfdlS0HoGRS/IlkXUOxiI7dCGtvhNB241Cktg4a5pbMAqNV+Xf3Fe1yiyeON47Gz7yWfHrEum4NtzK31QZdzVDYTncg8CS/lYReLOxyEx9Z2QcfzLt50vvE8w5e04NM8L89nEQlPlQWXmdO4CkzHO1Y5DPBtfksy2sGnB4HrmPryhOBCVmbsrNBh5SADAVwDd0FMDUq6ABVx4DhChf7u0tmUTK9kvVRk3Tz3/gGzaKZ0l2HAIBBs87vqL+mSL6eoo8PInFlT91J2qlzcS4ommtvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AxMTpUNSJFcR6W9ow5HKSwSdprGVRmE+rxEEiXQX1TM=;
 b=IueuzuLqWYlT6OFUS7cxwrO3XOgQXX3XnYPaTvzIEDVah0xg2JN+yYTIbNhCXLeP7nX5SHh4ShVE4efDx7lJ3jND2/3J6GqIoqtvW9qujla8a9zI05J1JL0ZKTOaypZNYgM6ScxRV6ZE2uXjl65Q5xXUh3QA3fydP8YtueJY8bg=
Received: from DS1P221CA0002.NAMP221.PROD.OUTLOOK.COM (2603:10b6:8:451::8) by
 IA0PR10MB7304.namprd10.prod.outlook.com (2603:10b6:208:40e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.9; Thu, 29 Oct
 2026 18:12:34 +0000
Received: from CY5PEPF00000E76.namprd02.prod.outlook.com
 (2603:10b6:8:451:cafe::99) by DS1P221CA0002.outlook.office365.com
 (2603:10b6:8:451::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.22 via Frontend Transport; Thu,
 29 Oct 2026 18:12:34 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CY5PEPF00000E76.mail.protection.outlook.com (10.167.247.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Thu, 29 Oct 2026 18:12:34 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 29 Oct
 2026 13:12:10 -0500
Received: from DLEE213.ent.ti.com (157.170.170.116) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 29 Oct
 2026 13:12:10 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 29 Oct 2026 13:12:10 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [10.24.50.162])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 69TIBmM63408718;
	Thu, 29 Oct 2026 13:12:07 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <nm@ti.com>, <kristo@kernel.org>, <ssantosh@kernel.org>, <afd@ti.com>,
        <vigneshr@ti.com>, <u-kumar1@ti.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <b-padhi@ti.com>
Subject: [PATCH v3 06/22] firmware: ti_sci: Handle xfer cleanup inside ti_sci_do_xfer()
Date: Thu, 29 Oct 2026 23:41:31 +0530
Message-ID: <20261029181147.266771-7-b-padhi@ti.com>
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
X-MS-TrafficTypeDiagnostic: CY5PEPF00000E76:EE_|IA0PR10MB7304:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b188d39-98c0-4d49-b3a0-08df35e834d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|36860700016|82310400026|56012099006|261009221727099003|261009221227099003|261009223027099003|261026135527099003|261009223327099003|261026140227099003|261026121527099003|261028144727099003|261026130827099003|261021130227099003|10067099003|261022113327099003|261022115727099003|261022105027099003|261022075727099003|261021133027099003|261021135927099003|261021123027099003|261009220027099003|261021121427099003|18002099003|22082099003|6133799003|3023799007|13003099007;
X-Microsoft-Antispam-Message-Info:
	53CzfRoqthJgVC+5Uyf1zTwBXCIjNn27+LN4ZK+TS0Oj5tMKu4XrQSVH/S3kqRgT7Dde0y8qiqdS0K+eXG6PI8udbXjRR+cWUzfnQEEykASdavruLF5yOA9HruU2P4VYSi7Whhyrsl+Dy4w89Xl45eDbX3CCtgZhP0Yis1eZwG7oMVLEUUVCU7iEMgu91WQ6U/YBtSAv4iX8LOToltD/3XGvHPT/agHItfchRaeCwd3eC6Dy1tBa6MmsCfaKmW1X/yjAw8uDA2OuU2zxvuAPrHhLhfRODmZwq3szWFKpr46vFPs6w3wKxPlkGjbkk5/CHMQWsAItB38Yd5u6/ogfneK4HMyklq3dmTt0gaScJG/6PFkv5NrI4bb84tyKgd3kOqXPg0LSIzvsSEW6115ZW15hBA3ICXgOymOToWWhwrHABDxsrLWF7hXqylOovRgOP6IwTR28i5qiNOnK7x8cs4aAMAEvIyFpxPGYurcuqopCrNHCXvZFHxhVl01pAV7lX7AwsRMPE6y4EFsTz8CA2h1K0t7S0lrPeRqkyKbmFWwUUVShYeyLJSUh0Tu785dk++0y1fyThD/r4+mMiQfyhY4dK5JKvXIN3yxIRQqltpmb8QGXTtw2+fH1QCvSKAx2IgtKisxsMaRmvIPKD+oj6OfRIz6UdkZeOOAcJTdro1E=
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(36860700016)(82310400026)(56012099006)(261009221727099003)(261009221227099003)(261009223027099003)(261026135527099003)(261009223327099003)(261026140227099003)(261026121527099003)(261028144727099003)(261026130827099003)(261021130227099003)(10067099003)(261022113327099003)(261022115727099003)(261022105027099003)(261022075727099003)(261021133027099003)(261021135927099003)(261021123027099003)(261009220027099003)(261021121427099003)(18002099003)(22082099003)(6133799003)(3023799007)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	764DePYJmkpTXiT0SRnXbMxOgf1H9X8E5zWruxLMMTEFqD+GZ+b7+BKlSY2BPDreVgF8Hthpnq4kFwPunXDutnABWTOClHUf0vMuD06o5sk1C6fxZEkNiWRyDC7Ht8sREkchKo/GxQD15VvBVB1jpV3NVlkCUnSYhqYUwjSE1J4fPReB7om1kiei+V9reZtd3Wjt4b8uy5ynxufhD66u6iNhbQLiRXUqYDwDeB5AhNQLDwVwCSRVhvUjrDypu5YPqz/BTEkRVsvlNX8EHM5qililB6+3Cvfva8OnwxWJ814BOLoWFrl1Bg3ATryrKEp4jh1zhkChg4IyNuQx/2/7GmVn2liCIRNvgNpXxP6f6XfQxuKMogZ7w2zML01ZslEXlaMztjofRfj9d9xWunhBofDiaetEQP1nBjBTYi2mXFDFVEKjV4jGOl3NKXTgWFfx
X-Exchange-RoutingPolicyChecked:
	j3wmQd+nzfU10V1zWkD6Q9ZRM+SMZ6LNA0l0vvjIERCsWAoYAPtHPcamcpfCEmZC8npG3zTx0MT0Z3txex2EAyHKvIdMh384ZG7oewIgjg+lNjnkU8PkWK3dGtwTMw/KfdSZRUzPEh7YjTIZ1JkfzGcL5hZfYICEjvTQM+PgDO1eQUmpB0wN8jIjOIABjip3dmu/Jl7lii1hnYKrd2164RjqElrvTapfKsuolMNJN3ID3dJQ8N1MnAjeOPgHHmeepA/O2uKDOxAmtHQy1GuQb8rHfTrbnvquJdcgRLY/7ftmfwYSFj7RDp0/rq1xMAV788x0kYXKcFWpLfzQldAJ/Q==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2026 18:12:34.3869
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b188d39-98c0-4d49-b3a0-08df35e834d0
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY5PEPF00000E76.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB7304
X-Proofpoint-ORIG-GUID: sJfHF_gs8pk7EZ6TSpescbKKSItEvQrl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA3MSBTYWx0ZWRfXxWB3Se804xO8
 9AohsOanjYVZQcR4GDgwGlY+nPLMCP2XX9G5Yr6+Wv2fw0y6hie3t6eNrmuVUA6WbAWxbtXjcvx
 Y2aifbexbgr/7t/gqI+l3cKXYGld5iCS3Q3ZpeDaxXE/bB8TYL6gykUpXc82pZ4EUcDyS1jaAZj
 mYv89DAwkILz9fVOofdk9gmTLx8DxLD10bC2HIPqDxdofdTAJRlvDRWgLXU6hqIRjo3PVzFt8/O
 dBZfIaEU9kEH8eOlHSk3wmujs+MjqBTu2Y7XZ+lWvYIftIJLg8e0GIdJRpkXHPX7ZAiY8WPEGpi
 wHEVBUbrfJ05MviVaUlf2WrSphkgJkHN8s0KOSiAQ93Ys1yyvr5dolOoZw3oxxSG53AdW5gEkkQ
 Vrl28PaPXAqGsFiy9V+VC+aYAgOEnA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA3MSBTYWx0ZWRfXzHqIe0+qF0KH
 4IoCDY1Qf0ucUmGfOKxWD0zpQSHO8PLZF5tbZ17yiFnDFazSDaT33kBsFOCbKhlKJG1Lf0zPdQu
 buOrOlKUCUTPAahZkrlYTHkhkX6sn4U=
X-Proofpoint-GUID: sJfHF_gs8pk7EZ6TSpescbKKSItEvQrl
X-Authority-Analysis: v=2.4 cv=eM2GH3p1 c=1 sm=1 tr=0 ts=6ae38c9c cx=c_pps
 a=sAaYeWWHS4LdRs88aTULxQ==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=660iZSQnnn4A:10 a=s63m1ICgrNkA:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=VwQbUJbxAAAA:8 a=sozttTNsAAAA:8
 a=U3diLxmOwd7Fp4-x424A:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0 spamscore=0
 malwarescore=0 adultscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2610190000 definitions=main-2610290071

From: Andrew Davis <afd@ti.com>

Pass the response struct to ti_sci_do_xfer() and have it fill it
when a response is received. This makes the xfer struct no longer needed
after this point and so it can be cleaned up after the transfer. This
prevents accidentally not freeing the xfer by the caller and after a
follow up patch makes allocation and free of xfers handled entirely
inside the ti_sci_do_xfer() function.

Signed-off-by: Andrew Davis <afd@ti.com>
Co-developed-by: Beleswar Padhi <b-padhi@ti.com>
Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
---
v3: Changelog:
1. None to this patch.

Link to v2:
https://lore.kernel.org/all/20260930160607.2674980-7-b-padhi@ti.com/

v2: Changelog:
1. None to this patch.

Link to v1:
https://lore.kernel.org/all/20260929201746.4078803-7-b-padhi@ti.com/

 drivers/firmware/ti_sci.c | 471 +++++++++++++++-----------------------
 1 file changed, 179 insertions(+), 292 deletions(-)

diff --git a/drivers/firmware/ti_sci.c b/drivers/firmware/ti_sci.c
index 9081288bd133c..c1f783bc67353 100644
--- a/drivers/firmware/ti_sci.c
+++ b/drivers/firmware/ti_sci.c
@@ -43,6 +43,7 @@ static DEFINE_MUTEX(ti_sci_list_mutex);
 /**
  * struct ti_sci_xfer - Structure representing a message flow
  * @tx_message:	Transmit message
+ * @rx_buf:	Pointer to store received message
  * @rx_len:	Receive message length
  * @xfer_buf:	Preallocated buffer to store receive message
  *		Since we work with request-ACK protocol, we can
@@ -52,6 +53,7 @@ static DEFINE_MUTEX(ti_sci_list_mutex);
  */
 struct ti_sci_xfer {
 	struct ti_msgmgr_message tx_message;
+	void *rx_buf;
 	u8 rx_len;
 	u8 *xfer_buf;
 	struct completion done;
@@ -298,6 +300,7 @@ static void ti_sci_rx_callback(struct mbox_client *cl, void *m)
  * @msg_type:	Message type
  * @msg_flags:	Flag to set for the message
  * @tx_message_size: transmit message size
+ * @rx_message: receive message storage location
  * @rx_message_size: receive message size
  *
  * Helper function which is used by various command functions that are
@@ -312,7 +315,7 @@ static void ti_sci_rx_callback(struct mbox_client *cl, void *m)
 static struct ti_sci_xfer *ti_sci_get_one_xfer(struct ti_sci_info *info,
 					       u16 msg_type, u32 msg_flags,
 					       size_t tx_message_size,
-					       size_t rx_message_size)
+					       void *rx_message, size_t rx_message_size)
 {
 	struct ti_sci_xfers_info *minfo = &info->minfo;
 	struct device *dev = info->dev;
@@ -368,6 +371,7 @@ static struct ti_sci_xfer *ti_sci_get_one_xfer(struct ti_sci_info *info,
 	xfer->tx_message.len = tx_message_size;
 	xfer->tx_message.chan_rx = info->chan_rx;
 	xfer->tx_message.timeout_rx_ms = info->desc->max_rx_timeout_ms;
+	xfer->rx_buf = rx_message;
 	xfer->rx_len = (u8)rx_message_size;
 
 	reinit_completion(&xfer->done);
@@ -447,7 +451,7 @@ static inline int ti_sci_do_xfer(struct ti_sci_info *info,
 	ret = mbox_send_message(info->chan_tx, &xfer->tx_message);
 	if (ret < 0) {
 		dev_err(dev, "Mbox send fail %d (caller: %pS)\n", ret, (void *)_RET_IP_);
-		return ret;
+		goto fail;
 	}
 
 	ret = 0;
@@ -489,9 +493,14 @@ static inline int ti_sci_do_xfer(struct ti_sci_info *info,
 			dev_warn(dev, "Message response not acknowledged (caller: %pS)\n",
 				 (void *)_RET_IP_);
 			ret = -ENODEV;
+		} else {
+			memcpy(xfer->rx_buf, xfer->xfer_buf, xfer->rx_len);
 		}
 	}
 
+fail:
+	ti_sci_put_one_xfer(&info->minfo, xfer);
+
 	return ret;
 }
 
@@ -507,32 +516,28 @@ static int ti_sci_cmd_get_revision(struct ti_sci_info *info)
 {
 	struct ti_sci_handle *handle = &info->handle;
 	struct ti_sci_version_info *ver = &handle->version;
-	struct ti_sci_msg_resp_version *resp;
+	struct ti_sci_msg_resp_version resp;
 	struct ti_sci_xfer *xfer;
 	int ret;
 
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_VERSION,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 				   sizeof(struct ti_sci_msg_hdr),
-				   sizeof(*resp));
+				   &resp, sizeof(resp));
 	if (IS_ERR(xfer))
 		return PTR_ERR(xfer);
 
 	ret = ti_sci_do_xfer(info, xfer);
 	if (ret)
-		goto fail;
-
-	resp = (struct ti_sci_msg_resp_version *)xfer->xfer_buf;
+		return ret;
 
-	ver->abi_major = resp->abi_major;
-	ver->abi_minor = resp->abi_minor;
-	ver->firmware_revision = resp->firmware_revision;
-	strscpy(ver->firmware_description, resp->firmware_description,
+	ver->abi_major = resp.abi_major;
+	ver->abi_minor = resp.abi_minor;
+	ver->firmware_revision = resp.firmware_revision;
+	strscpy(ver->firmware_description, resp.firmware_description,
 		sizeof(ver->firmware_description));
 
-fail:
-	ti_sci_put_one_xfer(&info->minfo, xfer);
-	return ret;
+	return 0;
 }
 
 /**
@@ -549,7 +554,7 @@ static int ti_sci_set_device_state(const struct ti_sci_handle *handle,
 {
 	struct ti_sci_info *info;
 	struct ti_sci_msg_req_set_device_state *req;
-	struct ti_sci_msg_hdr *resp;
+	struct ti_sci_msg_hdr resp;
 	struct ti_sci_xfer *xfer;
 	int ret = 0;
 
@@ -562,7 +567,7 @@ static int ti_sci_set_device_state(const struct ti_sci_handle *handle,
 
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_SET_DEVICE_STATE,
 				   flags | TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-				   sizeof(*req), sizeof(*resp));
+				   sizeof(*req), &resp, sizeof(resp));
 	if (IS_ERR(xfer))
 		return PTR_ERR(xfer);
 
@@ -572,12 +577,9 @@ static int ti_sci_set_device_state(const struct ti_sci_handle *handle,
 
 	ret = ti_sci_do_xfer(info, xfer);
 	if (ret)
-		goto fail;
-
-fail:
-	ti_sci_put_one_xfer(&info->minfo, xfer);
+		return ret;
 
-	return ret;
+	return 0;
 }
 
 /**
@@ -597,7 +599,7 @@ static int ti_sci_get_device_state(const struct ti_sci_handle *handle,
 {
 	struct ti_sci_info *info;
 	struct ti_sci_msg_req_get_device_state *req;
-	struct ti_sci_msg_resp_get_device_state *resp;
+	struct ti_sci_msg_resp_get_device_state resp;
 	struct ti_sci_xfer *xfer;
 	int ret = 0;
 
@@ -613,7 +615,7 @@ static int ti_sci_get_device_state(const struct ti_sci_handle *handle,
 
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_GET_DEVICE_STATE,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-				   sizeof(*req), sizeof(*resp));
+				   sizeof(*req), &resp, sizeof(resp));
 	if (IS_ERR(xfer))
 		return PTR_ERR(xfer);
 
@@ -622,22 +624,18 @@ static int ti_sci_get_device_state(const struct ti_sci_handle *handle,
 
 	ret = ti_sci_do_xfer(info, xfer);
 	if (ret)
-		goto fail;
-
-	resp = (struct ti_sci_msg_resp_get_device_state *)xfer->xfer_buf;
+		return ret;
 
 	if (clcnt)
-		*clcnt = resp->context_loss_count;
+		*clcnt = resp.context_loss_count;
 	if (resets)
-		*resets = resp->resets;
+		*resets = resp.resets;
 	if (p_state)
-		*p_state = resp->programmed_state;
+		*p_state = resp.programmed_state;
 	if (c_state)
-		*c_state = resp->current_state;
-fail:
-	ti_sci_put_one_xfer(&info->minfo, xfer);
+		*c_state = resp.current_state;
 
-	return ret;
+	return 0;
 }
 
 /**
@@ -892,7 +890,7 @@ static int ti_sci_cmd_set_device_resets(const struct ti_sci_handle *handle,
 {
 	struct ti_sci_info *info;
 	struct ti_sci_msg_req_set_device_resets *req;
-	struct ti_sci_msg_hdr *resp;
+	struct ti_sci_msg_hdr resp;
 	struct ti_sci_xfer *xfer;
 	int ret = 0;
 
@@ -905,7 +903,7 @@ static int ti_sci_cmd_set_device_resets(const struct ti_sci_handle *handle,
 
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_SET_DEVICE_RESETS,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-				   sizeof(*req), sizeof(*resp));
+				   sizeof(*req), &resp, sizeof(resp));
 	if (IS_ERR(xfer))
 		return PTR_ERR(xfer);
 
@@ -915,12 +913,9 @@ static int ti_sci_cmd_set_device_resets(const struct ti_sci_handle *handle,
 
 	ret = ti_sci_do_xfer(info, xfer);
 	if (ret)
-		goto fail;
-
-fail:
-	ti_sci_put_one_xfer(&info->minfo, xfer);
+		return ret;
 
-	return ret;
+	return 0;
 }
 
 /**
@@ -957,7 +952,7 @@ static int ti_sci_set_clock_state(const struct ti_sci_handle *handle,
 {
 	struct ti_sci_info *info;
 	struct ti_sci_msg_req_set_clock_state *req;
-	struct ti_sci_msg_hdr *resp;
+	struct ti_sci_msg_hdr resp;
 	struct ti_sci_xfer *xfer;
 	int ret = 0;
 
@@ -970,7 +965,7 @@ static int ti_sci_set_clock_state(const struct ti_sci_handle *handle,
 
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_SET_CLOCK_STATE,
 				   flags | TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-				   sizeof(*req), sizeof(*resp));
+				   sizeof(*req), &resp, sizeof(resp));
 	if (IS_ERR(xfer))
 		return PTR_ERR(xfer);
 
@@ -986,12 +981,9 @@ static int ti_sci_set_clock_state(const struct ti_sci_handle *handle,
 
 	ret = ti_sci_do_xfer(info, xfer);
 	if (ret)
-		goto fail;
-
-fail:
-	ti_sci_put_one_xfer(&info->minfo, xfer);
+		return ret;
 
-	return ret;
+	return 0;
 }
 
 /**
@@ -1012,7 +1004,7 @@ static int ti_sci_cmd_get_clock_state(const struct ti_sci_handle *handle,
 {
 	struct ti_sci_info *info;
 	struct ti_sci_msg_req_get_clock_state *req;
-	struct ti_sci_msg_resp_get_clock_state *resp;
+	struct ti_sci_msg_resp_get_clock_state resp;
 	struct ti_sci_xfer *xfer;
 	int ret = 0;
 
@@ -1028,7 +1020,7 @@ static int ti_sci_cmd_get_clock_state(const struct ti_sci_handle *handle,
 
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_GET_CLOCK_STATE,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-				   sizeof(*req), sizeof(*resp));
+				   sizeof(*req), &resp, sizeof(resp));
 	if (IS_ERR(xfer))
 		return PTR_ERR(xfer);
 
@@ -1043,19 +1035,14 @@ static int ti_sci_cmd_get_clock_state(const struct ti_sci_handle *handle,
 
 	ret = ti_sci_do_xfer(info, xfer);
 	if (ret)
-		goto fail;
-
-	resp = (struct ti_sci_msg_resp_get_clock_state *)xfer->xfer_buf;
+		return ret;
 
 	if (programmed_state)
-		*programmed_state = resp->programmed_state;
+		*programmed_state = resp.programmed_state;
 	if (current_state)
-		*current_state = resp->current_state;
+		*current_state = resp.current_state;
 
-fail:
-	ti_sci_put_one_xfer(&info->minfo, xfer);
-
-	return ret;
+	return 0;
 }
 
 /**
@@ -1235,7 +1222,7 @@ static int ti_sci_cmd_clk_set_parent(const struct ti_sci_handle *handle,
 {
 	struct ti_sci_info *info;
 	struct ti_sci_msg_req_set_clock_parent *req;
-	struct ti_sci_msg_hdr *resp;
+	struct ti_sci_msg_hdr resp;
 	struct ti_sci_xfer *xfer;
 	int ret = 0;
 
@@ -1248,7 +1235,7 @@ static int ti_sci_cmd_clk_set_parent(const struct ti_sci_handle *handle,
 
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_SET_CLOCK_PARENT,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-				   sizeof(*req), sizeof(*resp));
+				   sizeof(*req), &resp, sizeof(resp));
 	if (IS_ERR(xfer))
 		return PTR_ERR(xfer);
 
@@ -1269,12 +1256,9 @@ static int ti_sci_cmd_clk_set_parent(const struct ti_sci_handle *handle,
 
 	ret = ti_sci_do_xfer(info, xfer);
 	if (ret)
-		goto fail;
-
-fail:
-	ti_sci_put_one_xfer(&info->minfo, xfer);
+		return ret;
 
-	return ret;
+	return 0;
 }
 
 /**
@@ -1293,7 +1277,7 @@ static int ti_sci_cmd_clk_get_parent(const struct ti_sci_handle *handle,
 {
 	struct ti_sci_info *info;
 	struct ti_sci_msg_req_get_clock_parent *req;
-	struct ti_sci_msg_resp_get_clock_parent *resp;
+	struct ti_sci_msg_resp_get_clock_parent resp;
 	struct ti_sci_xfer *xfer;
 	int ret = 0;
 
@@ -1306,7 +1290,7 @@ static int ti_sci_cmd_clk_get_parent(const struct ti_sci_handle *handle,
 
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_GET_CLOCK_PARENT,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-				   sizeof(*req), sizeof(*resp));
+				   sizeof(*req), &resp, sizeof(resp));
 	if (IS_ERR(xfer))
 		return PTR_ERR(xfer);
 
@@ -1321,19 +1305,14 @@ static int ti_sci_cmd_clk_get_parent(const struct ti_sci_handle *handle,
 
 	ret = ti_sci_do_xfer(info, xfer);
 	if (ret)
-		goto fail;
-
-	resp = (struct ti_sci_msg_resp_get_clock_parent *)xfer->xfer_buf;
+		return ret;
 
-	if (resp->parent_id < 255)
-		*parent_id = resp->parent_id;
+	if (resp.parent_id < 255)
+		*parent_id = resp.parent_id;
 	else
-		*parent_id = resp->parent_id_32;
+		*parent_id = resp.parent_id_32;
 
-fail:
-	ti_sci_put_one_xfer(&info->minfo, xfer);
-
-	return ret;
+	return 0;
 }
 
 /**
@@ -1353,7 +1332,7 @@ static int ti_sci_cmd_clk_get_num_parents(const struct ti_sci_handle *handle,
 {
 	struct ti_sci_info *info;
 	struct ti_sci_msg_req_get_clock_num_parents *req;
-	struct ti_sci_msg_resp_get_clock_num_parents *resp;
+	struct ti_sci_msg_resp_get_clock_num_parents resp;
 	struct ti_sci_xfer *xfer;
 	int ret = 0;
 
@@ -1366,7 +1345,7 @@ static int ti_sci_cmd_clk_get_num_parents(const struct ti_sci_handle *handle,
 
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_GET_NUM_CLOCK_PARENTS,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-				   sizeof(*req), sizeof(*resp));
+				   sizeof(*req), &resp, sizeof(resp));
 	if (IS_ERR(xfer))
 		return PTR_ERR(xfer);
 
@@ -1381,19 +1360,14 @@ static int ti_sci_cmd_clk_get_num_parents(const struct ti_sci_handle *handle,
 
 	ret = ti_sci_do_xfer(info, xfer);
 	if (ret)
-		goto fail;
-
-	resp = (struct ti_sci_msg_resp_get_clock_num_parents *)xfer->xfer_buf;
+		return ret;
 
-	if (resp->num_parents < 255)
-		*num_parents = resp->num_parents;
+	if (resp.num_parents < 255)
+		*num_parents = resp.num_parents;
 	else
-		*num_parents = resp->num_parents_32;
+		*num_parents = resp.num_parents_32;
 
-fail:
-	ti_sci_put_one_xfer(&info->minfo, xfer);
-
-	return ret;
+	return 0;
 }
 
 /**
@@ -1422,7 +1396,7 @@ static int ti_sci_cmd_clk_get_match_freq(const struct ti_sci_handle *handle,
 {
 	struct ti_sci_info *info;
 	struct ti_sci_msg_req_query_clock_freq *req;
-	struct ti_sci_msg_resp_query_clock_freq *resp;
+	struct ti_sci_msg_resp_query_clock_freq resp;
 	struct ti_sci_xfer *xfer;
 	int ret = 0;
 
@@ -1435,7 +1409,7 @@ static int ti_sci_cmd_clk_get_match_freq(const struct ti_sci_handle *handle,
 
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_QUERY_CLOCK_FREQ,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-				   sizeof(*req), sizeof(*resp));
+				   sizeof(*req), &resp, sizeof(resp));
 	if (IS_ERR(xfer))
 		return PTR_ERR(xfer);
 
@@ -1453,16 +1427,11 @@ static int ti_sci_cmd_clk_get_match_freq(const struct ti_sci_handle *handle,
 
 	ret = ti_sci_do_xfer(info, xfer);
 	if (ret)
-		goto fail;
-
-	resp = (struct ti_sci_msg_resp_query_clock_freq *)xfer->xfer_buf;
-
-	*match_freq = resp->freq_hz;
+		return ret;
 
-fail:
-	ti_sci_put_one_xfer(&info->minfo, xfer);
+	*match_freq = resp.freq_hz;
 
-	return ret;
+	return 0;
 }
 
 /**
@@ -1489,7 +1458,7 @@ static int ti_sci_cmd_clk_set_freq(const struct ti_sci_handle *handle,
 {
 	struct ti_sci_info *info;
 	struct ti_sci_msg_req_set_clock_freq *req;
-	struct ti_sci_msg_hdr *resp;
+	struct ti_sci_msg_hdr resp;
 	struct ti_sci_xfer *xfer;
 	int ret = 0;
 
@@ -1502,7 +1471,7 @@ static int ti_sci_cmd_clk_set_freq(const struct ti_sci_handle *handle,
 
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_SET_CLOCK_FREQ,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-				   sizeof(*req), sizeof(*resp));
+				   sizeof(*req), &resp, sizeof(resp));
 	if (IS_ERR(xfer))
 		return PTR_ERR(xfer);
 
@@ -1520,12 +1489,9 @@ static int ti_sci_cmd_clk_set_freq(const struct ti_sci_handle *handle,
 
 	ret = ti_sci_do_xfer(info, xfer);
 	if (ret)
-		goto fail;
-
-fail:
-	ti_sci_put_one_xfer(&info->minfo, xfer);
+		return ret;
 
-	return ret;
+	return 0;
 }
 
 /**
@@ -1544,7 +1510,7 @@ static int ti_sci_cmd_clk_get_freq(const struct ti_sci_handle *handle,
 {
 	struct ti_sci_info *info;
 	struct ti_sci_msg_req_get_clock_freq *req;
-	struct ti_sci_msg_resp_get_clock_freq *resp;
+	struct ti_sci_msg_resp_get_clock_freq resp;
 	struct ti_sci_xfer *xfer;
 	int ret = 0;
 
@@ -1557,7 +1523,7 @@ static int ti_sci_cmd_clk_get_freq(const struct ti_sci_handle *handle,
 
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_GET_CLOCK_FREQ,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-				   sizeof(*req), sizeof(*resp));
+				   sizeof(*req), &resp, sizeof(resp));
 	if (IS_ERR(xfer))
 		return PTR_ERR(xfer);
 
@@ -1572,16 +1538,11 @@ static int ti_sci_cmd_clk_get_freq(const struct ti_sci_handle *handle,
 
 	ret = ti_sci_do_xfer(info, xfer);
 	if (ret)
-		goto fail;
-
-	resp = (struct ti_sci_msg_resp_get_clock_freq *)xfer->xfer_buf;
-
-	*freq = resp->freq_hz;
+		return ret;
 
-fail:
-	ti_sci_put_one_xfer(&info->minfo, xfer);
+	*freq = resp.freq_hz;
 
-	return ret;
+	return 0;
 }
 
 /**
@@ -1602,7 +1563,7 @@ static int ti_sci_cmd_prepare_sleep(const struct ti_sci_handle *handle, u8 mode,
 			TI_SCI_FLAG_REQ_ACK_ON_PROCESSED;
 	struct ti_sci_info *info;
 	struct ti_sci_msg_req_prepare_sleep *req;
-	struct ti_sci_msg_hdr *resp;
+	struct ti_sci_msg_hdr resp;
 	struct ti_sci_xfer *xfer;
 	struct device *dev;
 	int ret = 0;
@@ -1617,7 +1578,7 @@ static int ti_sci_cmd_prepare_sleep(const struct ti_sci_handle *handle, u8 mode,
 
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_PREPARE_SLEEP,
 				   msg_flags,
-				   sizeof(*req), sizeof(*resp));
+				   sizeof(*req), &resp, sizeof(resp));
 	if (IS_ERR(xfer))
 		return PTR_ERR(xfer);
 
@@ -1630,13 +1591,10 @@ static int ti_sci_cmd_prepare_sleep(const struct ti_sci_handle *handle, u8 mode,
 	ret = ti_sci_do_xfer(info, xfer);
 	if (ret) {
 		dev_err(dev, "Failed to prepare sleep\n");
-		goto fail;
+		return ret;
 	}
 
-fail:
-	ti_sci_put_one_xfer(&info->minfo, xfer);
-
-	return ret;
+	return 0;
 }
 
 /**
@@ -1655,7 +1613,7 @@ static int ti_sci_msg_cmd_query_fw_caps(const struct ti_sci_handle *handle,
 {
 	struct ti_sci_info *info;
 	struct ti_sci_xfer *xfer;
-	struct ti_sci_msg_resp_query_fw_caps *resp;
+	struct ti_sci_msg_resp_query_fw_caps resp;
 	struct device *dev;
 	int ret = 0;
 
@@ -1670,25 +1628,20 @@ static int ti_sci_msg_cmd_query_fw_caps(const struct ti_sci_handle *handle,
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_QUERY_FW_CAPS,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 				   sizeof(struct ti_sci_msg_hdr),
-				   sizeof(*resp));
+				   &resp, sizeof(resp));
 	if (IS_ERR(xfer))
 		return PTR_ERR(xfer);
 
 	ret = ti_sci_do_xfer(info, xfer);
 	if (ret) {
 		dev_err(dev, "Failed to get capabilities\n");
-		goto fail;
+		return ret;
 	}
 
-	resp = (struct ti_sci_msg_resp_query_fw_caps *)xfer->xfer_buf;
-
 	if (fw_caps)
-		*fw_caps = resp->fw_caps;
-
-fail:
-	ti_sci_put_one_xfer(&info->minfo, xfer);
+		*fw_caps = resp.fw_caps;
 
-	return ret;
+	return 0;
 }
 
 /**
@@ -1703,7 +1656,7 @@ static int ti_sci_cmd_set_io_isolation(const struct ti_sci_handle *handle,
 {
 	struct ti_sci_info *info;
 	struct ti_sci_msg_req_set_io_isolation *req;
-	struct ti_sci_msg_hdr *resp;
+	struct ti_sci_msg_hdr resp;
 	struct ti_sci_xfer *xfer;
 	struct device *dev;
 	int ret = 0;
@@ -1718,7 +1671,7 @@ static int ti_sci_cmd_set_io_isolation(const struct ti_sci_handle *handle,
 
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_SET_IO_ISOLATION,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-				   sizeof(*req), sizeof(*resp));
+				   sizeof(*req), &resp, sizeof(resp));
 	if (IS_ERR(xfer))
 		return PTR_ERR(xfer);
 
@@ -1728,13 +1681,10 @@ static int ti_sci_cmd_set_io_isolation(const struct ti_sci_handle *handle,
 	ret = ti_sci_do_xfer(info, xfer);
 	if (ret) {
 		dev_err(dev, "Failed to set IO isolation\n");
-		goto fail;
+		return ret;
 	}
 
-fail:
-	ti_sci_put_one_xfer(&info->minfo, xfer);
-
-	return ret;
+	return 0;
 }
 
 /**
@@ -1752,7 +1702,7 @@ static int ti_sci_msg_cmd_lpm_wake_reason(const struct ti_sci_handle *handle,
 {
 	struct ti_sci_info *info;
 	struct ti_sci_xfer *xfer;
-	struct ti_sci_msg_resp_lpm_wake_reason *resp;
+	struct ti_sci_msg_resp_lpm_wake_reason resp;
 	struct device *dev;
 	int ret = 0;
 
@@ -1767,31 +1717,26 @@ static int ti_sci_msg_cmd_lpm_wake_reason(const struct ti_sci_handle *handle,
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_LPM_WAKE_REASON,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 				   sizeof(struct ti_sci_msg_hdr),
-				   sizeof(*resp));
+				   &resp, sizeof(resp));
 	if (IS_ERR(xfer))
 		return PTR_ERR(xfer);
 
 	ret = ti_sci_do_xfer(info, xfer);
 	if (ret) {
 		dev_err(dev, "Failed to get wake reason\n");
-		goto fail;
+		return ret;
 	}
 
-	resp = (struct ti_sci_msg_resp_lpm_wake_reason *)xfer->xfer_buf;
-
 	if (source)
-		*source = resp->wake_source;
+		*source = resp.wake_source;
 	if (timestamp)
-		*timestamp = resp->wake_timestamp;
+		*timestamp = resp.wake_timestamp;
 	if (pin)
-		*pin = resp->wake_pin;
+		*pin = resp.wake_pin;
 	if (mode)
-		*mode = resp->mode;
-
-fail:
-	ti_sci_put_one_xfer(&info->minfo, xfer);
+		*mode = resp.mode;
 
-	return ret;
+	return 0;
 }
 
 /**
@@ -1807,7 +1752,7 @@ static int ti_sci_cmd_set_device_constraint(const struct ti_sci_handle *handle,
 {
 	struct ti_sci_info *info;
 	struct ti_sci_msg_req_lpm_set_device_constraint *req;
-	struct ti_sci_msg_hdr *resp;
+	struct ti_sci_msg_hdr resp;
 	struct ti_sci_xfer *xfer;
 	struct device *dev;
 	int ret = 0;
@@ -1822,7 +1767,7 @@ static int ti_sci_cmd_set_device_constraint(const struct ti_sci_handle *handle,
 
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_LPM_SET_DEVICE_CONSTRAINT,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-				   sizeof(*req), sizeof(*resp));
+				   sizeof(*req), &resp, sizeof(resp));
 	if (IS_ERR(xfer))
 		return PTR_ERR(xfer);
 
@@ -1833,13 +1778,10 @@ static int ti_sci_cmd_set_device_constraint(const struct ti_sci_handle *handle,
 	ret = ti_sci_do_xfer(info, xfer);
 	if (ret) {
 		dev_err(dev, "Failed to set device constraint\n");
-		goto fail;
+		return ret;
 	}
 
-fail:
-	ti_sci_put_one_xfer(&info->minfo, xfer);
-
-	return ret;
+	return 0;
 }
 
 /**
@@ -1855,7 +1797,7 @@ static int ti_sci_cmd_set_latency_constraint(const struct ti_sci_handle *handle,
 {
 	struct ti_sci_info *info;
 	struct ti_sci_msg_req_lpm_set_latency_constraint *req;
-	struct ti_sci_msg_hdr *resp;
+	struct ti_sci_msg_hdr resp;
 	struct ti_sci_xfer *xfer;
 	struct device *dev;
 	int ret = 0;
@@ -1870,7 +1812,7 @@ static int ti_sci_cmd_set_latency_constraint(const struct ti_sci_handle *handle,
 
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_LPM_SET_LATENCY_CONSTRAINT,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-				   sizeof(*req), sizeof(*resp));
+				   sizeof(*req), &resp, sizeof(resp));
 	if (IS_ERR(xfer))
 		return PTR_ERR(xfer);
 
@@ -1881,13 +1823,10 @@ static int ti_sci_cmd_set_latency_constraint(const struct ti_sci_handle *handle,
 	ret = ti_sci_do_xfer(info, xfer);
 	if (ret) {
 		dev_err(dev, "Failed to set device constraint\n");
-		goto fail;
+		return ret;
 	}
 
-fail:
-	ti_sci_put_one_xfer(&info->minfo, xfer);
-
-	return ret;
+	return 0;
 }
 
 /**
@@ -1900,13 +1839,13 @@ static int ti_sci_cmd_lpm_abort(struct device *dev)
 {
 	struct ti_sci_info *info = dev_get_drvdata(dev);
 	struct ti_sci_msg_hdr *req;
-	struct ti_sci_msg_hdr *resp;
+	struct ti_sci_msg_hdr resp;
 	struct ti_sci_xfer *xfer;
 	int ret = 0;
 
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_LPM_ABORT,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-				   sizeof(*req), sizeof(*resp));
+				   sizeof(*req), &resp, sizeof(resp));
 	if (IS_ERR(xfer))
 		return PTR_ERR(xfer);
 
@@ -1914,19 +1853,16 @@ static int ti_sci_cmd_lpm_abort(struct device *dev)
 
 	ret = ti_sci_do_xfer(info, xfer);
 	if (ret)
-		goto fail;
-
-fail:
-	ti_sci_put_one_xfer(&info->minfo, xfer);
+		return ret;
 
-	return ret;
+	return 0;
 }
 
 static int ti_sci_cmd_core_reboot(const struct ti_sci_handle *handle)
 {
 	struct ti_sci_info *info;
 	struct ti_sci_msg_req_reboot *req;
-	struct ti_sci_msg_hdr *resp;
+	struct ti_sci_msg_hdr resp;
 	struct ti_sci_xfer *xfer;
 	int ret = 0;
 
@@ -1939,7 +1875,7 @@ static int ti_sci_cmd_core_reboot(const struct ti_sci_handle *handle)
 
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_SYS_RESET,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-				   sizeof(*req), sizeof(*resp));
+				   sizeof(*req), &resp, sizeof(resp));
 	if (IS_ERR(xfer))
 		return PTR_ERR(xfer);
 
@@ -1947,12 +1883,9 @@ static int ti_sci_cmd_core_reboot(const struct ti_sci_handle *handle)
 
 	ret = ti_sci_do_xfer(info, xfer);
 	if (ret)
-		goto fail;
-
-fail:
-	ti_sci_put_one_xfer(&info->minfo, xfer);
+		return ret;
 
-	return ret;
+	return 0;
 }
 
 /**
@@ -1973,7 +1906,7 @@ static int ti_sci_get_resource_range(const struct ti_sci_handle *handle,
 				     u32 dev_id, u8 subtype, u8 s_host,
 				     struct ti_sci_resource_desc *desc)
 {
-	struct ti_sci_msg_resp_get_resource_range *resp;
+	struct ti_sci_msg_resp_get_resource_range resp;
 	struct ti_sci_msg_req_get_resource_range *req;
 	struct ti_sci_xfer *xfer;
 	struct ti_sci_info *info;
@@ -1988,7 +1921,7 @@ static int ti_sci_get_resource_range(const struct ti_sci_handle *handle,
 
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_GET_RESOURCE_RANGE,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-				   sizeof(*req), sizeof(*resp));
+				   sizeof(*req), &resp, sizeof(resp));
 	if (IS_ERR(xfer))
 		return PTR_ERR(xfer);
 
@@ -1999,23 +1932,18 @@ static int ti_sci_get_resource_range(const struct ti_sci_handle *handle,
 
 	ret = ti_sci_do_xfer(info, xfer);
 	if (ret)
-		goto fail;
-
-	resp = (struct ti_sci_msg_resp_get_resource_range *)xfer->xfer_buf;
+		return ret;
 
-	if (!resp->range_num && !resp->range_num_sec) {
+	if (!resp.range_num && !resp.range_num_sec) {
 		/* Neither of the two resource range is valid */
 		ret = -ENODEV;
 	} else {
-		desc->start = resp->range_start;
-		desc->num = resp->range_num;
-		desc->start_sec = resp->range_start_sec;
-		desc->num_sec = resp->range_num_sec;
+		desc->start = resp.range_start;
+		desc->num = resp.range_num;
+		desc->start_sec = resp.range_start_sec;
+		desc->num_sec = resp.range_num_sec;
 	}
 
-fail:
-	ti_sci_put_one_xfer(&info->minfo, xfer);
-
 	return ret;
 }
 
@@ -2087,7 +2015,7 @@ static int ti_sci_manage_irq(const struct ti_sci_handle *handle,
 			     u16 type)
 {
 	struct ti_sci_msg_req_manage_irq *req;
-	struct ti_sci_msg_hdr *resp;
+	struct ti_sci_msg_hdr resp;
 	struct ti_sci_xfer *xfer;
 	struct ti_sci_info *info;
 	int ret = 0;
@@ -2100,7 +2028,7 @@ static int ti_sci_manage_irq(const struct ti_sci_handle *handle,
 	info = handle_to_ti_sci_info(handle);
 
 	xfer = ti_sci_get_one_xfer(info, type, TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-				   sizeof(*req), sizeof(*resp));
+				   sizeof(*req), &resp, sizeof(resp));
 	if (IS_ERR(xfer))
 		return PTR_ERR(xfer);
 
@@ -2118,12 +2046,9 @@ static int ti_sci_manage_irq(const struct ti_sci_handle *handle,
 
 	ret = ti_sci_do_xfer(info, xfer);
 	if (ret)
-		goto fail;
-
-fail:
-	ti_sci_put_one_xfer(&info->minfo, xfer);
+		return ret;
 
-	return ret;
+	return 0;
 }
 
 /**
@@ -2402,7 +2327,7 @@ static int ti_sci_cmd_rm_ring_cfg(const struct ti_sci_handle *handle,
 				  const struct ti_sci_msg_rm_ring_cfg *params)
 {
 	struct ti_sci_msg_rm_ring_cfg_req *req;
-	struct ti_sci_msg_hdr *resp;
+	struct ti_sci_msg_hdr resp;
 	struct ti_sci_xfer *xfer;
 	struct ti_sci_info *info;
 	int ret = 0;
@@ -2414,7 +2339,7 @@ static int ti_sci_cmd_rm_ring_cfg(const struct ti_sci_handle *handle,
 
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_RM_RING_CFG,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-				   sizeof(*req), sizeof(*resp));
+				   sizeof(*req), &resp, sizeof(resp));
 	if (IS_ERR(xfer))
 		return PTR_ERR(xfer);
 
@@ -2433,12 +2358,9 @@ static int ti_sci_cmd_rm_ring_cfg(const struct ti_sci_handle *handle,
 
 	ret = ti_sci_do_xfer(info, xfer);
 	if (ret)
-		goto fail;
-
-fail:
-	ti_sci_put_one_xfer(&info->minfo, xfer);
+		return ret;
 
-	return ret;
+	return 0;
 }
 
 /**
@@ -2455,7 +2377,7 @@ static int ti_sci_cmd_rm_psil_pair(const struct ti_sci_handle *handle,
 				   u32 nav_id, u32 src_thread, u32 dst_thread)
 {
 	struct ti_sci_msg_psil_pair *req;
-	struct ti_sci_msg_hdr *resp;
+	struct ti_sci_msg_hdr resp;
 	struct ti_sci_xfer *xfer;
 	struct ti_sci_info *info;
 	int ret = 0;
@@ -2469,7 +2391,7 @@ static int ti_sci_cmd_rm_psil_pair(const struct ti_sci_handle *handle,
 
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_RM_PSIL_PAIR,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-				   sizeof(*req), sizeof(*resp));
+				   sizeof(*req), &resp, sizeof(resp));
 	if (IS_ERR(xfer))
 		return PTR_ERR(xfer);
 
@@ -2480,12 +2402,9 @@ static int ti_sci_cmd_rm_psil_pair(const struct ti_sci_handle *handle,
 
 	ret = ti_sci_do_xfer(info, xfer);
 	if (ret)
-		goto fail;
-
-fail:
-	ti_sci_put_one_xfer(&info->minfo, xfer);
+		return ret;
 
-	return ret;
+	return 0;
 }
 
 /**
@@ -2502,7 +2421,7 @@ static int ti_sci_cmd_rm_psil_unpair(const struct ti_sci_handle *handle,
 				     u32 nav_id, u32 src_thread, u32 dst_thread)
 {
 	struct ti_sci_msg_psil_unpair *req;
-	struct ti_sci_msg_hdr *resp;
+	struct ti_sci_msg_hdr resp;
 	struct ti_sci_xfer *xfer;
 	struct ti_sci_info *info;
 	int ret = 0;
@@ -2516,7 +2435,7 @@ static int ti_sci_cmd_rm_psil_unpair(const struct ti_sci_handle *handle,
 
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_RM_PSIL_UNPAIR,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-				   sizeof(*req), sizeof(*resp));
+				   sizeof(*req), &resp, sizeof(resp));
 	if (IS_ERR(xfer))
 		return PTR_ERR(xfer);
 
@@ -2527,12 +2446,9 @@ static int ti_sci_cmd_rm_psil_unpair(const struct ti_sci_handle *handle,
 
 	ret = ti_sci_do_xfer(info, xfer);
 	if (ret)
-		goto fail;
-
-fail:
-	ti_sci_put_one_xfer(&info->minfo, xfer);
+		return ret;
 
-	return ret;
+	return 0;
 }
 
 /**
@@ -2550,7 +2466,7 @@ static int ti_sci_cmd_rm_udmap_tx_ch_cfg(const struct ti_sci_handle *handle,
 			const struct ti_sci_msg_rm_udmap_tx_ch_cfg *params)
 {
 	struct ti_sci_msg_rm_udmap_tx_ch_cfg_req *req;
-	struct ti_sci_msg_hdr *resp;
+	struct ti_sci_msg_hdr resp;
 	struct ti_sci_xfer *xfer;
 	struct ti_sci_info *info;
 	int ret = 0;
@@ -2562,7 +2478,7 @@ static int ti_sci_cmd_rm_udmap_tx_ch_cfg(const struct ti_sci_handle *handle,
 
 	xfer = ti_sci_get_one_xfer(info, TISCI_MSG_RM_UDMAP_TX_CH_CFG,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-				   sizeof(*req), sizeof(*resp));
+				   sizeof(*req), &resp, sizeof(resp));
 	if (IS_ERR(xfer))
 		return PTR_ERR(xfer);
 
@@ -2590,12 +2506,9 @@ static int ti_sci_cmd_rm_udmap_tx_ch_cfg(const struct ti_sci_handle *handle,
 
 	ret = ti_sci_do_xfer(info, xfer);
 	if (ret)
-		goto fail;
-
-fail:
-	ti_sci_put_one_xfer(&info->minfo, xfer);
+		return ret;
 
-	return ret;
+	return 0;
 }
 
 /**
@@ -2613,7 +2526,7 @@ static int ti_sci_cmd_rm_udmap_rx_ch_cfg(const struct ti_sci_handle *handle,
 			const struct ti_sci_msg_rm_udmap_rx_ch_cfg *params)
 {
 	struct ti_sci_msg_rm_udmap_rx_ch_cfg_req *req;
-	struct ti_sci_msg_hdr *resp;
+	struct ti_sci_msg_hdr resp;
 	struct ti_sci_xfer *xfer;
 	struct ti_sci_info *info;
 	int ret = 0;
@@ -2625,7 +2538,7 @@ static int ti_sci_cmd_rm_udmap_rx_ch_cfg(const struct ti_sci_handle *handle,
 
 	xfer = ti_sci_get_one_xfer(info, TISCI_MSG_RM_UDMAP_RX_CH_CFG,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-				   sizeof(*req), sizeof(*resp));
+				   sizeof(*req), &resp, sizeof(resp));
 	if (IS_ERR(xfer))
 		return PTR_ERR(xfer);
 
@@ -2650,12 +2563,9 @@ static int ti_sci_cmd_rm_udmap_rx_ch_cfg(const struct ti_sci_handle *handle,
 
 	ret = ti_sci_do_xfer(info, xfer);
 	if (ret)
-		goto fail;
-
-fail:
-	ti_sci_put_one_xfer(&info->minfo, xfer);
+		return ret;
 
-	return ret;
+	return 0;
 }
 
 /**
@@ -2673,7 +2583,7 @@ static int ti_sci_cmd_rm_udmap_rx_flow_cfg(const struct ti_sci_handle *handle,
 			const struct ti_sci_msg_rm_udmap_flow_cfg *params)
 {
 	struct ti_sci_msg_rm_udmap_flow_cfg_req *req;
-	struct ti_sci_msg_hdr *resp;
+	struct ti_sci_msg_hdr resp;
 	struct ti_sci_xfer *xfer;
 	struct ti_sci_info *info;
 	int ret = 0;
@@ -2685,7 +2595,7 @@ static int ti_sci_cmd_rm_udmap_rx_flow_cfg(const struct ti_sci_handle *handle,
 
 	xfer = ti_sci_get_one_xfer(info, TISCI_MSG_RM_UDMAP_FLOW_CFG,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-				   sizeof(*req), sizeof(*resp));
+				   sizeof(*req), &resp, sizeof(resp));
 	if (IS_ERR(xfer))
 		return PTR_ERR(xfer);
 
@@ -2715,12 +2625,9 @@ static int ti_sci_cmd_rm_udmap_rx_flow_cfg(const struct ti_sci_handle *handle,
 
 	ret = ti_sci_do_xfer(info, xfer);
 	if (ret)
-		goto fail;
-
-fail:
-	ti_sci_put_one_xfer(&info->minfo, xfer);
+		return ret;
 
-	return ret;
+	return 0;
 }
 
 /**
@@ -2734,7 +2641,7 @@ static int ti_sci_cmd_proc_request(const struct ti_sci_handle *handle,
 				   u8 proc_id)
 {
 	struct ti_sci_msg_req_proc_request *req;
-	struct ti_sci_msg_hdr *resp;
+	struct ti_sci_msg_hdr resp;
 	struct ti_sci_info *info;
 	struct ti_sci_xfer *xfer;
 	int ret = 0;
@@ -2748,7 +2655,7 @@ static int ti_sci_cmd_proc_request(const struct ti_sci_handle *handle,
 
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_PROC_REQUEST,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-				   sizeof(*req), sizeof(*resp));
+				   sizeof(*req), &resp, sizeof(resp));
 	if (IS_ERR(xfer))
 		return PTR_ERR(xfer);
 
@@ -2757,12 +2664,9 @@ static int ti_sci_cmd_proc_request(const struct ti_sci_handle *handle,
 
 	ret = ti_sci_do_xfer(info, xfer);
 	if (ret)
-		goto fail;
-
-fail:
-	ti_sci_put_one_xfer(&info->minfo, xfer);
+		return ret;
 
-	return ret;
+	return 0;
 }
 
 /**
@@ -2776,7 +2680,7 @@ static int ti_sci_cmd_proc_release(const struct ti_sci_handle *handle,
 				   u8 proc_id)
 {
 	struct ti_sci_msg_req_proc_release *req;
-	struct ti_sci_msg_hdr *resp;
+	struct ti_sci_msg_hdr resp;
 	struct ti_sci_info *info;
 	struct ti_sci_xfer *xfer;
 	int ret = 0;
@@ -2790,7 +2694,7 @@ static int ti_sci_cmd_proc_release(const struct ti_sci_handle *handle,
 
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_PROC_RELEASE,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-				   sizeof(*req), sizeof(*resp));
+				   sizeof(*req), &resp, sizeof(resp));
 	if (IS_ERR(xfer))
 		return PTR_ERR(xfer);
 
@@ -2799,12 +2703,9 @@ static int ti_sci_cmd_proc_release(const struct ti_sci_handle *handle,
 
 	ret = ti_sci_do_xfer(info, xfer);
 	if (ret)
-		goto fail;
-
-fail:
-	ti_sci_put_one_xfer(&info->minfo, xfer);
+		return ret;
 
-	return ret;
+	return 0;
 }
 
 /**
@@ -2821,7 +2722,7 @@ static int ti_sci_cmd_proc_handover(const struct ti_sci_handle *handle,
 				    u8 proc_id, u8 host_id)
 {
 	struct ti_sci_msg_req_proc_handover *req;
-	struct ti_sci_msg_hdr *resp;
+	struct ti_sci_msg_hdr resp;
 	struct ti_sci_info *info;
 	struct ti_sci_xfer *xfer;
 	int ret = 0;
@@ -2835,7 +2736,7 @@ static int ti_sci_cmd_proc_handover(const struct ti_sci_handle *handle,
 
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_PROC_HANDOVER,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-				   sizeof(*req), sizeof(*resp));
+				   sizeof(*req), &resp, sizeof(resp));
 	if (IS_ERR(xfer))
 		return PTR_ERR(xfer);
 
@@ -2845,12 +2746,9 @@ static int ti_sci_cmd_proc_handover(const struct ti_sci_handle *handle,
 
 	ret = ti_sci_do_xfer(info, xfer);
 	if (ret)
-		goto fail;
-
-fail:
-	ti_sci_put_one_xfer(&info->minfo, xfer);
+		return ret;
 
-	return ret;
+	return 0;
 }
 
 /**
@@ -2870,7 +2768,7 @@ static int ti_sci_cmd_proc_set_config(const struct ti_sci_handle *handle,
 				      u32 config_flags_clear)
 {
 	struct ti_sci_msg_req_set_config *req;
-	struct ti_sci_msg_hdr *resp;
+	struct ti_sci_msg_hdr resp;
 	struct ti_sci_info *info;
 	struct ti_sci_xfer *xfer;
 	int ret = 0;
@@ -2884,7 +2782,7 @@ static int ti_sci_cmd_proc_set_config(const struct ti_sci_handle *handle,
 
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_SET_CONFIG,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-				   sizeof(*req), sizeof(*resp));
+				   sizeof(*req), &resp, sizeof(resp));
 	if (IS_ERR(xfer))
 		return PTR_ERR(xfer);
 
@@ -2898,12 +2796,9 @@ static int ti_sci_cmd_proc_set_config(const struct ti_sci_handle *handle,
 
 	ret = ti_sci_do_xfer(info, xfer);
 	if (ret)
-		goto fail;
-
-fail:
-	ti_sci_put_one_xfer(&info->minfo, xfer);
+		return ret;
 
-	return ret;
+	return 0;
 }
 
 /**
@@ -2921,7 +2816,7 @@ static int ti_sci_cmd_proc_set_control(const struct ti_sci_handle *handle,
 				       u32 control_flags_clear)
 {
 	struct ti_sci_msg_req_set_ctrl *req;
-	struct ti_sci_msg_hdr *resp;
+	struct ti_sci_msg_hdr resp;
 	struct ti_sci_info *info;
 	struct ti_sci_xfer *xfer;
 	int ret = 0;
@@ -2935,7 +2830,7 @@ static int ti_sci_cmd_proc_set_control(const struct ti_sci_handle *handle,
 
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_SET_CTRL,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-				   sizeof(*req), sizeof(*resp));
+				   sizeof(*req), &resp, sizeof(resp));
 	if (IS_ERR(xfer))
 		return PTR_ERR(xfer);
 
@@ -2946,12 +2841,9 @@ static int ti_sci_cmd_proc_set_control(const struct ti_sci_handle *handle,
 
 	ret = ti_sci_do_xfer(info, xfer);
 	if (ret)
-		goto fail;
-
-fail:
-	ti_sci_put_one_xfer(&info->minfo, xfer);
+		return ret;
 
-	return ret;
+	return 0;
 }
 
 /**
@@ -2969,7 +2861,7 @@ static int ti_sci_cmd_proc_get_status(const struct ti_sci_handle *handle,
 				      u8 proc_id, u64 *bv, u32 *cfg_flags,
 				      u32 *ctrl_flags, u32 *sts_flags)
 {
-	struct ti_sci_msg_resp_get_status *resp;
+	struct ti_sci_msg_resp_get_status resp;
 	struct ti_sci_msg_req_get_status *req;
 	struct ti_sci_info *info;
 	struct ti_sci_xfer *xfer;
@@ -2984,7 +2876,7 @@ static int ti_sci_cmd_proc_get_status(const struct ti_sci_handle *handle,
 
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_GET_STATUS,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-				   sizeof(*req), sizeof(*resp));
+				   sizeof(*req), &resp, sizeof(resp));
 	if (IS_ERR(xfer))
 		return PTR_ERR(xfer);
 
@@ -2993,21 +2885,16 @@ static int ti_sci_cmd_proc_get_status(const struct ti_sci_handle *handle,
 
 	ret = ti_sci_do_xfer(info, xfer);
 	if (ret)
-		goto fail;
-
-	resp = (struct ti_sci_msg_resp_get_status *)xfer->tx_message.buf;
+		return ret;
 
-	*bv = (resp->bootvector_low & TI_SCI_ADDR_LOW_MASK) |
-	      (((u64)resp->bootvector_high << TI_SCI_ADDR_HIGH_SHIFT) &
+	*bv = (resp.bootvector_low & TI_SCI_ADDR_LOW_MASK) |
+	      (((u64)resp.bootvector_high << TI_SCI_ADDR_HIGH_SHIFT) &
 	       TI_SCI_ADDR_HIGH_MASK);
-	*cfg_flags = resp->config_flags;
-	*ctrl_flags = resp->control_flags;
-	*sts_flags = resp->status_flags;
+	*cfg_flags = resp.config_flags;
+	*ctrl_flags = resp.control_flags;
+	*sts_flags = resp.status_flags;
 
-fail:
-	ti_sci_put_one_xfer(&info->minfo, xfer);
-
-	return ret;
+	return 0;
 }
 
 /*
-- 
2.34.1

