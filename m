Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.150.75
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793125678;
	b=XO14h+qNqIGAldFH74rEDAZvqekFb5PahV1FpPpnL7SNR9iy8C1oKSyycqRj4u7mx532
	 iyW1uJvGcWzhmADiG4Zf049ykdvYrL/IU1P3nJPFGnw81TGZgmkc8TcBuJ34eBIixtCCC
	 yGlwRQ2zqz5Utaua4iVDJszWGEzuRXScXYuoC6+CGvlLbb+Nynronfnldyjsb/a/KqDmL
	 clBrfbM+Dl23rdPXkk606wMC/dFpew2CLJbi9eDMHY1i1IVCXCRTfkXji3MfrkD8fYzp9
	 izjXysdalFRLAo+kHolhvI9zRJtg5MjE4M7crNoW/UFSe8Vwli466JOcH+/5GXPyi5Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793125678;
	h=DMARC-Filter:Received:DKIM-Signature:Received:DKIM-Signature:
	 Received:Received:X-MS-Exchange-Authentication-Results:Received-SPF:
	 Received:Received:Received:Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:CC:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-LD-Processed:X-MS-Exchange-SenderADCheck:
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
	bh=XPQFQ+LWR3fGi9eNkELJMQqCaZybJTjXbKZHWi+iqlg=;
	b=nA+fMhWc/EWHoUzZFnj3VLVb3M7NN5NvOeAyISDx2uvpLwrU4dbjDRY9bID4oYTCSnPy
	 eL6BDn2j39JjDUo8NLVX2RpOm2uaUPocaMfzdXrJDgSevPdqGEd14YaFZGvh6KTxEzvbR
	 gdU35k8Dgo1m2O7lzik2SkxO4by9CMRRYfP/U/MpG7PbeJPju/bwD1tokK/GvZ3mPL/vl
	 tqmCl1SU9j9YLNQk0anNVffGxF82bHf+P2F+CWx6/reYJ5SbJM4SKO2ggKOkubyQp8JIo
	 EJNHkYaJ7NnAJn8DhzdspHmJO25dRQVHj4gGd/VC1bzBa+s0IE+WsWnUNsnFrWSPh4A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ti.com;
	spf=pass smtp.mailfrom=ti.com;
	dkim=pass header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=T4SK4WP3;
	dkim=pass header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=jpEdvl8n;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.150.75
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F522606A31A;
	Tue, 27 Oct 2026 18:27:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F522606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=T4SK4WP3;
	dkim=pass (1024-bit key, unprotected) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=jpEdvl8n
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 69RIIGvM1826527;
	Tue, 27 Oct 2026 13:27:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=XPQFQ+LWR3fGi9eNkELJMQqCaZybJTjXbKZHWi+iq
	lg=; b=T4SK4WP3V34fySgv4tQCEiLDH/MD31iZTvMdTqChkY3J8V7V5H39wDO9p
	seADTL3/3tysnOKGAslvMBF1K9IikAr/nfFQdqbMT8QAG+DAawvBHvrFO0hFZf5C
	rbEiH13iFGaeZfLf+SGIWC18o18E+8167P9Q2KPbUuDiL/Oha+N+2rRUcPZgtcp3
	afrOJhOtkUCgF/MOT4he99iJfCayaTLQqGU6ynfw+G6l3GJAMa/8Lavm2H2lNfCl
	ZdDRNtk3qjjHmjnffxqvYMI/H6ajDskM/aw+uk2yW29Q1lZ3l5bTU0NC88uYPiPO
	n5t9HOTB9bHZUHhiPkDxS6eE0b3dg==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010002.outbound.protection.outlook.com [52.101.56.2])
	by m0380145.ppops.net (PPS) with ESMTPS id 4hjsbbbdgc-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 27 Oct 2026 13:27:48 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BqrcSkiOl6sPAE2DyNRrZ4hTjbSUblmVfYDuVY1E8t8GwQUvMp8a7UAdJ+rLVpgveGvjvnwH0/hbCabeB+bV5psWHACT+PZDAWxD1V12YV20kzidXx282yl+Awq1FEgHt06Pin4hPW0dUtECZBcwptpD9iPj5WdVb9A2iSCZ2C2HT44k7XPA7aZLwwJn6yoSAnXK4js1lKQrbB+BlA9/64CfPKCKsMLLsmwVm+pzMhlQEzX9YQz1TIoDNaeViICWbPxNMW9pl45RsA0Th+nYOHG1PG3VpdUFiD2Laq6xSLSahwBvP1lveQ14OcfzgxACGhcDRNhgMFg3s0w0OdGW4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XPQFQ+LWR3fGi9eNkELJMQqCaZybJTjXbKZHWi+iqlg=;
 b=BOAz4H+6OhQWeYR6rEZ2UWBocPvRorNmM6RlQsbmTpmbVvyFHNCkH6i1wZj6xVSz6HfD3MS2kSUhiQhxmVjC+RheOxIehj8tdh/+rz7g49tAhvF96ZXpV42NdVfeqAGQroSAvjOZnLr1dt7zXV6Nn/QkN35rOwXoPBP5koPKEdJEPDRxDnYKravKUNDllwjXLwIeO2ZOXGkEhCb0x5rLAHxao6rAB94nrSoeXoQGwS7gsm7K8x2/kv/5Y9SJMgEajCgyAI81HHSiwdwrz4cGjcD3vj3xYd5h1ozbjqpiKpfWuoadtiFJm7+BQChKkTayMKJqmL857S3awR2CavZY5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=chipsnmedia.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XPQFQ+LWR3fGi9eNkELJMQqCaZybJTjXbKZHWi+iqlg=;
 b=jpEdvl8nzD2QqD0B8YAPgFHnPcuUyvrbawnyyQ6kUdE0+FvMvm2jAw59KeqWlhHbadMRy2Zx+jUPoGE1wcTQIqWXSMCWSoWfB27pFw6nLxs6lQy1YNdUa99K5yC+jo+tbXCpXVR1mLFAC+hhl1vBaFZsbkdBGWeGCOzdK/pVBGY=
Received: from BN9PR03CA0377.namprd03.prod.outlook.com (2603:10b6:408:f7::22)
 by DS4PPFD57E5FBF5.namprd10.prod.outlook.com (2603:10b6:f:fc00::d4d) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Tue, 27 Oct
 2026 18:27:44 +0000
Received: from BN1PEPF00018545.namprd05.prod.outlook.com
 (2603:10b6:408:f7:cafe::1b) by BN9PR03CA0377.outlook.office365.com
 (2603:10b6:408:f7::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.20 via Frontend Transport; Tue,
 27 Oct 2026 18:27:43 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BN1PEPF00018545.mail.protection.outlook.com (10.167.248.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Tue, 27 Oct 2026 18:27:42 +0000
Received: from DLEE205.ent.ti.com (157.170.170.85) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 27 Oct
 2026 13:27:23 -0500
Received: from DLEE210.ent.ti.com (157.170.170.112) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 27 Oct
 2026 13:27:23 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 27 Oct 2026 13:27:23 -0500
Received: from [128.247.75.1] (b-brnich.dhcp.ti.com [128.247.75.1])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 69RIRNWn2414042;
	Tue, 27 Oct 2026 13:27:23 -0500
Message-ID: <f65b11ad-318b-4cc8-847b-0db7a5ec2e92@ti.com>
Date: Tue, 27 Oct 2026 13:27:23 -0500
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
Subject: Re: [PATCH v1 0/9] fix decoder corruption, stalls and seek issues
To: Jackson.lee <jackson.lee@chipsnmedia.com>, <mchehab@kernel.org>,
        <hverkuil-cisco@xs4all.nl>, <nicolas.dufresne@collabora.com>,
        <bob.beckett@collabora.com>
CC: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <lafley.kim@chipsnmedia.com>, <hverkuil@xs4all.nl>,
        <nas.chung@chipsnmedia.com>
References: <20261007015946.53-1-jackson.lee@chipsnmedia.com>
Content-Language: en-US
From: Brandon Brnich <b-brnich@ti.com>
In-Reply-To: <20261007015946.53-1-jackson.lee@chipsnmedia.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00018545:EE_|DS4PPFD57E5FBF5:EE_
X-MS-Office365-Filtering-Correlation-Id: 293066c3-052d-4501-6a4f-08df3457fd93
X-LD-Processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|23010399003|376014|7416014|1800799024|36860700016|82310400026|261026121527099003|56012099006|261022105027099003|261021135927099003|261022075727099003|261021123027099003|261021121427099003|10067099003|261009223027099003|18002099003|22082099003|6133799003|3023799007|261026140227099003;
X-Microsoft-Antispam-Message-Info:
 HmymJVbllUTE6Eegdkur1MOQswm3Q53VVEJaQGcn/tOaMeNHZ59TBG3VzoT22/WHt/CdlCQCUHjS0pX++Yae7bme0KAgkt+RB+F3hjiQFo7LUmxChBEjoMcMyNhjjIh9R19ONqgdW/X3SPeXXe8ai+GrdljDt5t4WcHCirv07TPGNPNGwOY+TO+92Nqm4zlkwYEk2uqgAdyo5D5H/SizUef4yDHjIS8AyUAVaYR7rLc3L+2EWl395309Q/v25Pq8i8ntBHEIK9DF9LZn9VtBSLl2xCdcwsIm9ru+7x+B6PfKSqZoSVSsjVNWr2wPY0Xo7RiOJLmcfvPiRjDVD8Tuz3HGRyAWz1o6A0W1oL1xGmRZdSrQy1vbQI2FVBj/2ecVwO+hqfloAkD4+KpZmpQr9dPurmOoVLpWFQaDdnDNTkBGGqmkKxp1ztJecJm6JTsLQh5jSDAeS0vOnd9E9qH+E2+9UggI5Iqkbpldpz2kZxSHHwsRBt18wC4WUxWnUIghQsClkmh8FqmZutwj4vqvp7pmtO/H+SaK8Dt9DfdYckywY7/S2itiMJduptshaAE7Fx8Jp80rb8wtq/2snj0NGpkRfbT+QZ5xEa8oRHuc5WQ1wO8u9lCw1Z+/J0h0MjpWyRpMLfewZJj159k/SH9i8y1Y02r6OkRnvzN7kbB5dhQvcZoA+bsSc7/4yTHnbUzZePUn8abNFiPIKPLsN+5MzA==
X-Forefront-Antispam-Report:
 CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(1800799024)(36860700016)(82310400026)(261026121527099003)(56012099006)(261022105027099003)(261021135927099003)(261022075727099003)(261021123027099003)(261021121427099003)(10067099003)(261009223027099003)(18002099003)(22082099003)(6133799003)(3023799007)(261026140227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 i6vl9gfu/nKMBlLdbxfa8PCgZqIa2uzyL/Z+qDSV04GYPVKfIxLNgdFRvJdDJMc8IMozHYMpNadxJlONBhNF50ZoQwpAP687s18YmdHLX6Oe4ISFBgkpp4DDgKwoZCLS1qkPrYn3adeRPzAQOIvw2Zfzbzaux9lh/BtssHc2xSb9eW/r6XM5Qby8kuAUS81401zywzu+GjSamDcwPj9LLSP6GwdUePcZQHFUh3ZXFdhAg7wWZtwHeFgGgUXzUOKwDWQjMMgzOHS+JqPgMGnEUAjkGZjwD4IgWzQRKBMvD6kjMe8LIzFp3R1zC2MsPZDVPl00xd0QE9QXfDgTQWFXNujZBgJwxdQiKFcS3igFwyL04hnP89oYAV5g+irzmyUF6wieUHHKA5Qk0XcsKGQ94z7eULijFiWNpwMuYSknUNmVlPtFIDbq81uMh87eyiFr
X-Exchange-RoutingPolicyChecked:
	30xoyt9YYrgPug6/U8CC89CF92Gi2ZO7LFPOZiXBBeFtLnFIPOMfFX1lfCKFKx9XREvIQBjsEMj4mI8vG3YDiWiE+c5Z4Po8+A49MjT43m/oGK9dMPsQbajjJttqWFOrNRZ1NgxeKxMtrLi9rRbnIj4gQJ1138/X64WqDYK0wj5f8KSDHLGEwxiv+5XHRKvYaEMhZaTioow9wjd4m1++NYzfUIh97+28FEb95hTUGlu32aHgkoySLRWOne4ZRy73QyUhYrhUvEbxvKuaABzFbU+1/tSl8FxndZaAwzG6cOYhuunx0cEbqVVrdOud52o+WDTZHY32BFWgatjuqvrfTQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2026 18:27:42.9716
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 293066c3-052d-4501-6a4f-08df3457fd93
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00018545.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFD57E5FBF5
X-Proofpoint-ORIG-GUID: JyOKKD6tXxFsHqrncH5kO5bdMri7xJ1p
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA3MiBTYWx0ZWRfXzkJmrNKf5bCB
 92pu3Q2jl0ooxoYBPEeoAfNOG2NjB8nk/iA+D7OXd8oHStCu/A1UidvR+OQ7VQR5eYhdnujD23w
 Ln189Hb3VNGJu+D9vViuhJvIuHmxEKfZ93CvYrb/ahiSg4+dsxOqPNbqqkaY3EI1seemNHZsZnE
 3m9NFBekKkMKHLtR+IPNpJvBhk10bCgrD7OwZzZsTCByRT68sMvv5IRIk755f412oAaDBGT4RXY
 IvK0BVuiX+v97qLwt0j/qXuteBeyCPIhN+NTMG15UH5HGjpWxzEAsA5LJ2uJKzeD8OUIRJrPIm7
 I0kXeLMVWylXfogSXYXZYnR0jLPSCy/rzENO04VzbPnkdCMNf5AcpLEd9e9cHengtF77rCZnB+A
 kJieF/4sVvjo8L95pI+GZTDE2Fcwn+1/Z/KbLSHfdwTJwnsDprAuyhmoRU9xWUjx6LRuQI7M91N
 veU+JrRMkKcB/SSSdHg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA3MiBTYWx0ZWRfX/5TTzN9GnBpY
 1/07i9zlsltA2P7KXv4iGm6DoAsIMxSydjrm7DGZXcOPp7NEAkdOSjKlTqqAPjlI70bfE+3Qvzz
 MKNJT5e2WrAI9U045YVs05JcIvrIXis=
X-Proofpoint-GUID: JyOKKD6tXxFsHqrncH5kO5bdMri7xJ1p
X-Authority-Analysis: v=2.4 cv=LIrz05W9 c=1 sm=1 tr=0 ts=6ae0ed24 cx=c_pps
 a=l7cXxZGRKbMfBYROU17HtA==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s63m1ICgrNkA:10 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=gO1vWkAQAl3rybz1DQOp:22 a=PssDBZGIAAAA:8
 a=sozttTNsAAAA:8 a=qZtYVNjcEJPJm2I5zzcA:9 a=QEXdDO2ut3YA:10
 a=HJRSn2hXXqGixlvEXVkw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 adultscore=0 suspectscore=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 clxscore=1011 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270072

Hi Jackson,

Thanks for sending this series.

On 10/6/26 20:59, Jackson.lee wrote:
> From: Jackson Lee <jackson.lee@chipsnmedia.com>
> 
> This series fixes a set of decoder problems in the wave5 driver that show
> up as corrupted output, stalled or crashed instances, and lost frames
> across seeks. All of them carry a Fixes: tag.

I have tested this series in multistream scenarios as well as seeking 
and looping cases. It has made the latter 2 far more robust and I no 
longer see corruption, stalls, or warnings from gstreamer. For the series:

Tested-by: Brandon Brnich <b-brnich@ti.com>

> 
> Locking and job ownership
>    1. Serialise removal of OUTPUT buffers between finish_decode(),
>       streamoff_output() and the start_decode() error path.
>    4. Acknowledge the interrupt only after it has been dispatched, so a
>       completion the VPU adds meanwhile is no longer dropped and does not
>       leave an instance waiting forever.
>    5. Finish each m2m job exactly once. A second v4l2_m2m_job_finish() from
>       the same context could clear curr_ctx under v4l2_m2m_try_run() and
>       oops in the m2m worker.
> 
> Decode scheduling
>    6. Issue DEC_PIC only when the ring buffer holds bitstream that no queued
>       command will consume. The current check compares two unrelated
>       counters, which sends commands against an empty ring or duplicates
>       one already in flight and corrupts the output. A delayed work restarts
>       an instance left idle with data still buffered.
> 
> Seek / flush
>    2. Drop the consumed-byte tally on OUTPUT streamoff, so it is not
>       credited to the first buffers queued after a seek.
>    3. Wait between FLUSH retries instead of spending the retry budget in
>       microseconds, and ignore dec_info when reading it failed.
>    8. Re-establish the display flags from the vb2 buffer states after a
>       flush, so buffers held by userspace are not decoded into.
>    9. Do not reset the frame buffers on a CAPTURE streamoff that is only
>       part of a seek.
> 
> Timestamps
>    7. Hand OUTPUT timestamps to decoded pictures in decode order. One
>       completion can consume several source buffers, and keeping only the
>       last timestamp lost the others ("Too old frames, bug in decoder" in
>       GStreamer).
> 
> Testing
> -------
> Tested on a TI J721S2 EVM (Wave521C, product code 0x521c, firmware
> revision 363254) with GStreamer 1.24.13 and the v4l2h264dec/v4l2h265dec
> elements.
> 
> fluster (GStreamer-H.264-V4L2-Gst1.0 / GStreamer-H.265-V4L2-Gst1.0):
> 
>    JVT-AVC_V1      77/135  (-j1 and -j3, identical per vector)
>    JCT-VC-HEVC_V1 133/147  (-j1 and -j3, identical per vector)
> 
> The remaining AVC failures are interlaced, MBAFF/PAFF, FMO and SP slice
> streams. 11 of the 14 HEVC failures are Main10 streams, which this SoC
> does not decode ("no support for 10 bit depth"); the others are
> PICSIZE_A_Bossen_1, PICSIZE_B_Bossen_1 and DELTAQP_A_BRCM_4.
> 
> No oops, call trace, workqueue warning or "invalid display frame index"
> message was logged during the runs.
> 
> v4l2-compliance 1.28.1-5233, SHA: fc15e229d9d3:
> 
>    Total for wave5-dec device /dev/video0: 47, Succeeded: 47, Failed: 0, Warnings: 2
>    Total for wave5-enc device /dev/video1: 47, Succeeded: 47, Failed: 0, Warnings: 0
> 
> Brandon Brnich (2):
>    media: chips-media: wave5: Ensure Atomic Access to src_buf list
>    media: chips-media: wave5: Stop FrameBuf Reset During Seek
> 
> Jackson Lee (7):
>    media: chips-media: wave5: drop the consumed-byte tally on OUTPUT
>      streamoff
>    media: chips-media: wave5: wait before retrying a refused flush
>    media: chips-media: wave5: ack the interrupt after dispatching it
>    media: chips-media: wave5: finish a job only once
>    media: chips-media: wave5: decode only when the ring holds unclaimed
>      bitstream
>    media: chips-media: wave5: stamp decoded pictures from a decode-order
>      queue
>    media: chips-media: wave5: restore the display flags after a flush
> 
>   .../chips-media/wave5/wave5-vpu-dec.c         | 312 +++++++++++++++---
>   .../platform/chips-media/wave5/wave5-vpu.c    |  28 +-
>   .../platform/chips-media/wave5/wave5-vpuapi.c |  18 +-
>   .../platform/chips-media/wave5/wave5-vpuapi.h |  13 +
>   4 files changed, 310 insertions(+), 61 deletions(-)
> 
> 
> base-commit: 58348f64125e9a3e44d3abb275ca7f4e6c9641e5

Best,
Brandon
