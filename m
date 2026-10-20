Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.150.75
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792496921;
	b=5mY979nArO3YkdZe3Ta1p5Awy33ZZnKX8exOu6f3ICh4P7fBo6bCqLyPLyUNvXywu1Rw
	 3P5J2E+gzYF1QBq29lMHx0vR3TVGv2v/dTmrrk7LBfe/It7nSmbleHtHcV/Ejenac9CGk
	 f5nt7Xd01+HiTwe0eZelbz/an4UrO2y7LHKgj7L0e/5hEorzEkLnAXEu4NNHXEYLpls0h
	 7MrjJrF0+sKHGNJJS/Jo80OXvSnDaZEEGQd6DM5Xd/jmVdOD2JPtjNugSGzvrXRvwqGk4
	 7ALVjHC8/nJuBqlURKgUUQU3rooWuzQmj0i2kGxWcDk6CclGInp5ZrrjCdDry8JihqA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792496921;
	h=DMARC-Filter:Received:DKIM-Signature:Received:DKIM-Signature:
	 Received:Received:X-MS-Exchange-Authentication-Results:Received-SPF:
	 Received:Received:Received:Received:Received:From:To:CC:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 Content-Type:X-EOPAttributedMessage:X-MS-PublicTrafficType:
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
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=sbMED9+ktnH2qrc5vWiorQi1fqFoL53TLh6DtAeAjUY=;
	b=hK/tMwAipwvMiF4M67djTjjPvHjRe+xzbejl2o+caOjBuhU30307kV4BO8h7m7OYHV0L
	 PbWl33f0ci1S8wnWd5oTluvhf6MMdq23q/9Vc2wQ3k040Y4fSX1f2hmWGAPKVum5XgBrG
	 8WJyiKlznhX6qMUgUp9qezdaTybQeIMeh7e+6RuqHLOiq0MY7Y+EuaIuCiDy123A+N3Fh
	 jn/a1UMrzBSvyHHAq+Qlp0ZyUwt0G796O+QLZB3Rkxl0kdchNbrIgkhA5nO3f4HZqkSaV
	 fF16fsM04yfFlppSWdrODu2haGF81T3njkd+jVQ0Cb70t1h28E4US7qb4FVTO5Rgn6w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ti.com;
	spf=pass smtp.mailfrom=ti.com;
	dkim=pass header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=Fh0yReMd;
	dkim=pass header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b="h/V817u/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.150.75
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CAE1606A31E;
	Tue, 20 Oct 2026 11:48:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3CAE1606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=Fh0yReMd;
	dkim=pass (1024-bit key, unprotected) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=h/V817u/
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 69KBRkc91514889;
	Tue, 20 Oct 2026 06:48:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=sbMED9+ktnH2q
	rc5vWiorQi1fqFoL53TLh6DtAeAjUY=; b=Fh0yReMdtaohJqbPdeRAtvZhAQO/P
	YpSjcMaFqvo+EFicarmFdJmFlaSDbcuSasRUsX2XoO+Byj9OibHC/iCPuDonYlok
	f6ODjtr0hWgZn0tUz/cyZCaLwD4qg8V++6YKrrAUEufcjOWYytAdlFHi72SFocur
	pYutwuH9MnS4X3OgpelyIXaLE6LbKr8AglyizoN8vTALd51UoAXJohqo2C4pWwta
	pnahxe4O2ubhtvylil2QBid6U82pbc73llHBUTNw0W5j0l6ginW5NV2zSuHVMbkI
	R5BonPr1EsOnZ1XGcDvYcET9jsG36Txqxrit6iPjhlr/+xCyvA8y0B5rQ==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012052.outbound.protection.outlook.com [52.101.53.52])
	by m0380145.ppops.net (PPS) with ESMTPS id 4hdw6xkd74-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 20 Oct 2026 06:48:32 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=klTPxR8nb2vNGWkN2mLCHl7X+SpnakPD3hH0UNe8zNSUomaKIbD+FU/sbZFPyX62S6NyxJs9JbeylrO0hgk1yZ/BHdU0wJLN4Zz3dJrYfyU6KZIjYuNuIlJaOLHQdBKx6dSl5Ixnj6vGrIq+/osuHexn/Xj3QUrdn5PGAkn5wuQu5E6Obh8EbktPWM5deoJGycM23mGUOqk9+voW5AwwV7q7yMY7MpdyELS25G2c/BEYwtmJLkfgxQkSdFcuBc+Izv4gvSRNSsgjejn2MJnnagh13C3IH2xGIjD44ZA480rsTNoCcogN+7siPRmQEPyCuDtKsmBb0j7BMwHtK93ahw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sbMED9+ktnH2qrc5vWiorQi1fqFoL53TLh6DtAeAjUY=;
 b=eUdmRMI8Mg4ifEbNA5qfEyIMisy+S66ISZmVHNubPERhAfkCjxq1Lmj0nZd5F0Hs0y+1VSVimuEQR7J0iEZ1ybu3MVT6jp+TNkmXlmMeIhbYU6mc4lalaQ5hP/CO1nHfNjaM6LihKbsyJyRt2Bjh9GN9ID7h5SwceoGVN1tLWlXbHwLWS0PJ+vB/UtmLV6QBVilW2q4VePms9OGkPpRaI5jIPE5/+J0SxUGC38yHPTa+I1KEqumf/3Nj4WUpJN9JuzcJK0HfnH5KCb1P1G7RQ6XRa2QbzeZ+owMlt+MAUH3KKw/MYlYBikS3gpA41MrCZvU8Wl7PJ3uFGcfHboW6lA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sbMED9+ktnH2qrc5vWiorQi1fqFoL53TLh6DtAeAjUY=;
 b=h/V817u/gr9FUuXbe2tzxeZOq5mVN7OuqP9dPEb7ySJup8mtuV18ZwyGiCYtOIb6IJWQ5SdvFcTh9QTiH5XNTnu6zwMv1l1Bh0Vjjrl8N3uTB3v1UE+fFFfzH42zBERecBvBcoWJCoN68EL6Ez6BKT5Kzv4rQIfaeXdt0osmWjI=
Received: from PH5P220CA0012.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:34a::9)
 by CH0PR10MB5209.namprd10.prod.outlook.com (2603:10b6:610:da::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.14; Tue, 20 Oct
 2026 11:48:26 +0000
Received: from PH3PEPF00059617.namprd05.prod.outlook.com
 (2603:10b6:510:34a:cafe::1d) by PH5P220CA0012.outlook.office365.com
 (2603:10b6:510:34a::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.20 via Frontend Transport; Tue,
 20 Oct 2026 11:48:26 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 PH3PEPF00059617.mail.protection.outlook.com (10.167.243.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.15 via Frontend Transport; Tue, 20 Oct 2026 11:48:25 +0000
Received: from DFLE204.ent.ti.com (10.64.6.62) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 20 Oct
 2026 06:47:47 -0500
Received: from DFLE209.ent.ti.com (10.64.6.67) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 20 Oct
 2026 06:47:47 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 20 Oct 2026 06:47:46 -0500
Received: from a0512632.dhcp.ti.com (a0512632.dhcp.ti.com [10.24.52.205])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 69KBlglm516673;
	Tue, 20 Oct 2026 06:47:43 -0500
From: Swamil Jain <s-jain1@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <tomi.valkeinen@ideasonboard.com>
CC: <devarsht@ti.com>, <praneeth@ti.com>, <u-kumar1@ti.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <s-jain1@ti.com>
Subject: [PATCH v7 0/2] Add DSS support for AM62L SoC
Date: Tue, 20 Oct 2026 17:17:40 +0530
Message-ID: <20261020114742.872536-1-s-jain1@ti.com>
X-Mailer: git-send-email 2.34.1
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
X-MS-TrafficTypeDiagnostic: PH3PEPF00059617:EE_|CH0PR10MB5209:EE_
X-MS-Office365-Filtering-Correlation-Id: e1ffa81c-4253-4fe3-f4a9-08df2ea00cd0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|376014|1800799024|82310400026|56012099006|261009223027099003|10067099003|18002099003|6133799003|13003099007|3023799007;
X-Microsoft-Antispam-Message-Info:
	AhER3NqHDgEHRyFIJVzUuIF2CtfZNiunGVZn0qv2GKlHe45kdTbSzgoaJdMZTx9HB4WIsQSWvFmJWONpDHJRXPY81zyG1u7pVjXLa7kT2Ehq/4PgawLOTrSgU8c7iiOhwUsaEh28UdCiMWQBV9VCUUnDyHHnbv4z3uotVaVmXvQMB38xpvZ5lc39yE3Y6P7FtpR3ZtQD474Ib9Dh4BS2HeFFKPs7GplV3IKTS/l8g2uQKa0tl5yHt4NbZ1aLA6vZZ6qIlwqPXovSn640zvfIW9PqZBnrgGUF4iIbJyxyjFURfFa2LM4/YG+F4SXYRGBAyVcxYkwkg9947pFlfTDssxiJMS/Z0Rhc03HhdyHFiTc+QIUirEcSeDWsCNT5VyeGonNCkyLdq2Ox1QtYRqU0WhSmWCfAf/nP8k3bVw99vqiGQXy2z19/lYywVNxKGmbF8Sq9eUbc1b67SZWYboWkm0AzlF2dw/YTy/CzWWxN6TE/vNKDsrMkprPWfHuvPofOpgS5b4ZgaFsUFKWP4x+W8oLIRjxbPlcME9476+bogCJIXVHy6zE0e8GWOtU+QvhprzdXDbxZqnXlBAbka428UOcIXt7dI/52daR2iP7hTJBLLjSx8wZA+fMwNKUstC7tK37HuSowCMCExaANgQBSIQ==
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(376014)(1800799024)(82310400026)(56012099006)(261009223027099003)(10067099003)(18002099003)(6133799003)(13003099007)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	yyO1P3KJ41n+zBFcU+faSNWbEFkH+6f6lEtLgD8Wt0hFMKOPj8RidRdiiAiMOcbXEhRgnocP4G1IuQ6UOnU6nE9giW85kKjbcqeR4xIr0YUAuwnbE0d4aIAW9iD0TL4wHAC5sxl9DrUmrG2Rxf77Sx//5oA7r1QiM/UMgiYvwhCPVeHgvMo6G1CajqNxAaIU6YS8aOrPboItdbxXL8nJfj0HOxODU6Ke1abIK8AIp6xJX61WsU8HiAh/ctH9ExCYpwFpOrEyzY9z3vO3QXihHmUur1fc+ewG+l1RVN3HNGrn7uJZR7u68CzxI6AVNpIpBpOYd9wkYkIkEluHF9TjIoIzjkzCQcCWkV10Ci6+gCPniuXHx1jUqj8EoVnDPOCdnSjxEt7O9hQsw/S4tBm/p52kitosUyIWHJaqZiHWNGJLolpAQe1Am1ZR9Dz/m5Km
X-Exchange-RoutingPolicyChecked:
	fWFG771pl0HOkxe1C0Z76cMu3JKpa2Cs2tgvImWk3HsktIhOiFYnUhAbRmAOBqyguKH7a3kFaZ6+WifizONJsd4K8ajD5IKVbHsCn2F57au5huHfh+Z/Yhtj4YdN1fykwq5/sgmLtoEpRSxVvz8WMHveyTFmP7gZoc+0fq+ccsO9+gp+dK3Mt7NJXRDn+l2D2yhGe9r5oBIg5d8M7kEKTk3ml7aL8ly7dMX5SKzKTivH7fcTGMiY6jV8uGbuPUzlQ4s0hLq39JoJ8smiykZNpHTJrlImxIFEvHphaGb6lo8aQYRR4zZ+mJWV1VJKwGbH/bnj1Brki93p7VciIs798A==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2026 11:48:25.3437
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e1ffa81c-4253-4fe3-f4a9-08df2ea00cd0
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	PH3PEPF00059617.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB5209
X-Proofpoint-ORIG-GUID: Da33Gxr5pMQAh2Ysoixm8_4USjzQd2c7
X-Authority-Analysis: v=2.4 cv=ZLlCCn7b c=1 sm=1 tr=0 ts=6ad75510 cx=c_pps
 a=Bsy78vmKOeQIAJqgrxlU3A==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=660iZSQnnn4A:10 a=AlMIdn_sM9wA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=gO1vWkAQAl3rybz1DQOp:22
 a=sozttTNsAAAA:8 a=VwQbUJbxAAAA:8 a=JLQES9i2aRcSmLGWkN0A:9
X-Proofpoint-GUID: Da33Gxr5pMQAh2Ysoixm8_4USjzQd2c7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA0NiBTYWx0ZWRfX3qcbrqjg7M10
 ayKWcOfFxJLH5DD1hk8OLV/YpWUdnXmfEqjQ89mm3ZTw/vSsPFHszBFiC+Qm3/+BSWhYoTK5JeH
 OebCiWOsw22DFGZI69TUkDGW6eFoxeo3ilvoxtPZx9g+yjtlx2+g/htCG1UCzg5UDP7wQQ/fPbu
 FrWRcVTSVd4U+RWhM/KMbQozE5aErnkPx+NUtBYOhH4Jo6bNxHngx+iD116EmNQGjkODDHOJ8h0
 USWqdkX3sekypjVLG1aFXEds9HC4X4kK/TsXykqfXUQ0ktjedqbD/TxFka6MeSQbpKhgcXEoDWj
 epKOPVPGtN0hb4SWJNxOP4C/ggRO0zahdBPCo5QNRk9L91DBlw1UzRMIu8DhJx9ikMr3MBLcea8
 GcWm97gYJM57FNWnFHQZNzytrJcUCCfsea8oDFuVtNzIxh88mbZauuS4uoBe+OGwSoTzG7U+zuc
 L7k9dxa2MEMSKvIr8Xg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA0NiBTYWx0ZWRfX/QdV85Djkbyo
 UC1e27zBSIVv328wjUY7Jc+DOIgn7QwW3kL/TFEH1oYrtphcJgh1LODQL9VVaQudjR6IANKOx0x
 iiJ8vkCmYWP9ymMnJcO+svLziCDy0Oc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 phishscore=0 malwarescore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200046

This series:
- Adds base support to enable Display on TI AM62L[1] SoCs
- Adds base support for DSI output
- Enables HDMI output out-of-box

[1]: https://www.ti.com/product/AM62L
---
Changelog:
v6->v7:
- Rebase on top of linux-next

Link to v6: https://lore.kernel.org/all/20261007100707.1065564-1-s-jain1@ti.com/

v5->v6:
- Drop bootph-all from parent node if child node use the property
- Pick R-by tag

Link to v5: https://lore.kernel.org/all/20260923192643.1362891-1-s-jain1@ti.com/

v4->v5:
- Move pinctrl from sii9022 to dss
- Add bootph-all property to all display related nodes
- Pick R-by tag

Link to v4: https://lore.kernel.org/all/20260811130822.2324438-1-s-jain1@ti.com/

v3->v4:
- Change pin configuration from PIN_OUTPUT to PIN_INPUT for
  VOUT_EXTPCLKIN

Link to v3: https://lore.kernel.org/all/20260723102519.3581762-1-s-jain1@ti.com/

v2->v3:
- Split patches for SoC and EVM related changes
- Add dsi ports node
- Correct styling issues
- Drop GIC

Link to v2: https://lore.kernel.org/all/20260528133529.3476499-1-s-jain1@ti.com/

v1->v2:
- Update the commit message to elaborate more about the patch.
- Add dpi-pinctrl configuration.
- Update the interrupt routing index for HDMI interrupt line

Link to v1: https://lore.kernel.org/all/20260513210942.692269-1-s-jain1@ti.com/
---

Devarsh Thakkar (2):
  arm64: dts: ti: k3-am62l-main: Add DSS & DSI related nodes
  arm64: dts: ti: k3-am62l3-evm: Add HDMI support

 arch/arm64/boot/dts/ti/k3-am62l-main.dtsi | 60 ++++++++++++++
 arch/arm64/boot/dts/ti/k3-am62l3-evm.dts  | 97 +++++++++++++++++++++++
 2 files changed, 157 insertions(+)

