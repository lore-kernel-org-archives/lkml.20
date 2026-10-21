Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.150.75
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792598153;
	b=pdbnmAU0U9tdBLEle9N5X6enrjejTVdP0ooXU9/noHgq6Z3n9n9NqwI/5AepIah8Oh+j
	 4/nrSmhDUiKMgPKSQo4vEZFT1VE2BGQqvA5ZepiiReT7IPv1U5r4rUhewej4DN8CVrqsK
	 uv7GkpCSvAHM+oJRVPeUnZO4nFftgMB/zwl5ZVj25TK49gXSH7USIqaQTJhilZZdSzSzy
	 JIAHIHAZJucFTaAK55FJ8Wb0dcwcLVl+fY8fLozPwGfQOOnabIP3AWKIAeFiYwRkh4dl2
	 Al6Rntw18fj3DW3/7RYdZM/DSEXxY+pR4rJBw3qnF1HGPXuaAseMu9fTrCijFfiUEaQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792598153;
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
	bh=DbArq+Y3QQIg9w6jhF2km9p+o7k1fcLtFSlempWZe/M=;
	b=vy7HceIEp9R+6EJ/hW8b87WJpQ2EdOOT4YOtjudXRhP9EFo/SpiN1m0To6O1DYt73MVg
	 yoB4lG0lKsPEH1SoVw2fRa4THMKzzRsXCXt2826Rl7t6NE+HLNpXrY/A9uUJM7O7+x5fb
	 VG7k9ZsEx94H3W19g4KOGgiiJIBFxkjgg6AxInQksKJuR5iUOoAxx9OyFqwRmHKbxP0rp
	 gLU6TDkN7inJhNiyKCwmc4sf18IoKqi92ilbHOeeIDaaDW2A06wMpke6cwVW8GqwRyBuQ
	 9VsIB+/rEFCXKFx5G0MFhmzhfQSSfa++Q2ZN5tKQUVV63hzJWZfWLbGoLzipfRZOMGw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ti.com;
	spf=pass smtp.mailfrom=ti.com;
	dkim=pass header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=UhEYWV8M;
	dkim=pass header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=NAQ6LO3e;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.150.75
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 697AE606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 15:55:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 697AE606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=UhEYWV8M;
	dkim=pass (1024-bit key, unprotected) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=NAQ6LO3e
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 69LFrYdq1878904;
	Wed, 21 Oct 2026 10:55:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=DbArq+Y3QQIg9w6jhF2km9p+o7k1fcLtFSlempWZe
	/M=; b=UhEYWV8MYRLTimKlONqYH2+o7F23wNThlTK8rXuxsRNbfZtd7FwevgGxS
	iM9Cb18ylnyrtrf9nNGTWmiSc3NF+jau/VE6kAZXgFCX8pr4s3mkIYFqT0VI8JYn
	43FcdbLe32d0dxzckQ64UaAA57cU0llyFAnF6k+UyIKNbSL7oY8AhVrtq/GXJhbN
	f+N0nX2+qhJc5YFPjahS/WWf/CTGfW1gtfp7oEy0D39PVXgbO+i5C76f1k9VmsaI
	AgelnaKYGtjmYeHFMCGD9s6Q+XwCfhkH5GJi3uHzX1MNycxkIQtuFYv6Z/t1TCqT
	6bZKqymJJyjLw/ZzVzZ+41rXxWhXg==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010041.outbound.protection.outlook.com [52.101.61.41])
	by m0380145.ppops.net (PPS) with ESMTPS id 4hev9ysmq2-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 21 Oct 2026 10:55:38 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z4N9/0yyVjUM7L3U5imFVMEdUcHgScp2013ub/wqM9QH7JmUUTbzoBMjU9Mdik3SNIDH21hZNqJnh2aT8ZHxyhtHyRyzNzp2N/Laz8A+qptYOZDcKVoUHqspGH5l+jybsumDR2EADQ2WyUNcdP5xCemBnjdWRVGetTjtCGGLnzNi9BBSrJAnormYW38Hu23dvok08BF1IFYPQfGUvoc28Yo5kCD72I2U36YyRvI/3NtTuC7dW2HJ2b/JtKtvt68Ci5Pl1C+oxeqD0DoPPVHHVxkwL6lEepSZZMlXUM7AmiwJxpT9blkQPmjFZb3/Irf3sti08VsEt5s4EjZWmKG7yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DbArq+Y3QQIg9w6jhF2km9p+o7k1fcLtFSlempWZe/M=;
 b=H2yffkA2ptJ/ixmpRa130zstu3xhfJufSLvJYUHkBgFELn2HztlQqGkssTJQyN1gmiYd4svYKEoopStsY2gcIoWZ8vwH4X48/EBs0gwbpVW3wfOGwUoZfASQ8n82PwNgJdN4sKmWX/c0LTqiR2MoFxQYqfuqEuDHirgMygbDmMFjaOMIqNRHSFezn5K8G5Fbx/XG8TPVDEiitI/ixSwRqmer5kNjy0ADVLJilGxXcpfEpMi1es6RuPCD/uaOj8IwZRaW7S1AA0TDG1Xsc7Rx8jRsz/zdK4bUxMkqyNgzgCJHOJ+AA7VFUPPbgfJpkMcS77BT5fFqawkrvc94VsJ9ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DbArq+Y3QQIg9w6jhF2km9p+o7k1fcLtFSlempWZe/M=;
 b=NAQ6LO3ephNNRKCkDaYjDT4Yk5plwahVCNLtkotq8XxCjx6HlCzZu1pa6xVyVTg4egJKQjOAquUX0EMgzgSGWxSC3oghP3ZJuMRoYEIT8v0FIFkmQrOLNDsAblVwfh+epqHzEYlBghmHo/0x1Rja7FYxYqaHFkbdWpJKUhmVddk=
Received: from SJ0PR05CA0020.namprd05.prod.outlook.com (2603:10b6:a03:33b::25)
 by DS0PR10MB7979.namprd10.prod.outlook.com (2603:10b6:8:1ab::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.12; Wed, 21 Oct
 2026 15:55:22 +0000
Received: from EA8PEPF0000000B.namprd05.prod.outlook.com
 (2603:10b6:a03:33b:cafe::4c) by SJ0PR05CA0020.outlook.office365.com
 (2603:10b6:a03:33b::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.16 via Frontend Transport; Wed,
 21 Oct 2026 15:55:22 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 EA8PEPF0000000B.mail.protection.outlook.com (10.167.249.234) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.15 via Frontend Transport; Wed, 21 Oct 2026 15:55:20 +0000
Received: from DFLE209.ent.ti.com (10.64.6.67) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 21 Oct
 2026 10:54:57 -0500
Received: from DFLE210.ent.ti.com (10.64.6.68) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 21 Oct
 2026 10:54:57 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 21 Oct 2026 10:54:57 -0500
Received: from [10.249.32.26] ([10.249.32.26])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 69LFsu6k3829570;
	Wed, 21 Oct 2026 10:54:56 -0500
Message-ID: <b5bc4c10-b364-4992-ae84-63e5b86771a3@ti.com>
Date: Wed, 21 Oct 2026 10:54:56 -0500
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
Subject: Re: [PATCH 3/3] soc: ti: Add TDA54 SCM configuration syscon support
To: Moteen Shah <m-shah@ti.com>, <conor+dt@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <linux-kernel@vger.kernel.org>, <nm@ti.com>,
        <ssantosh@kernel.org>, <linux-arm-kernel@lists.infradead.org>
CC: <u-kumar1@ti.com>, <gehariprasath@ti.com>, <vigneshr@ti.com>,
        <a-limaye@ti.com>, <y-abhilashchandra@ti.com>
References: <20261019080736.944127-1-m-shah@ti.com>
 <20261019080736.944127-4-m-shah@ti.com>
 <fc306acb-e9ea-4b5b-804a-4d6eeedd9066@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <fc306acb-e9ea-4b5b-804a-4d6eeedd9066@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: EA8PEPF0000000B:EE_|DS0PR10MB7979:EE_
X-MS-Office365-Filtering-Correlation-Id: 50c21c47-2489-490a-dedf-08df2f8bb5e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|23010399003|376014|6133799003|10067099003|22082099003|3023799007|18002099003|56012099006|261009223027099003|261009221227099003|5023799004|4143699003;
X-Microsoft-Antispam-Message-Info:
	nsojRh8z7TKcfJXEk2IEpTXiwtWQxMWwhxPDG/YC3j8uFv65ltQbof5YNl6IZCg5/zf46IrI1PXvRBQ8i1eQ7X0HAnwLTn0C7wFPTj4LQXU8BL4COThIViOfmHqpPCNiyuJEnMHlt3uPHg0Rixr77ipwt9YhMGDkIkq4cG1O2/YILhKa6ywlntZ5uDhYXOlhuO5Tpb36OeaiDrBZevRpTQGl28DnOyMsxOMpjSMYgR8zZcnGz0Xpy/1WjDYZLbx6TKRkEaLaBg90B5rssDXcCqlqszYi0wr6aqzG7AuEe1+atzfV+lsim8YrEMCXxt3L8RRyFTkImu7+mTgizth10lVyxDOVcT1r82y4a9MU3DMopqXSCJBAOH4SY70/+GhliuAcBrbMptWSxBv7/pmHhb3meF3cMSOvOFcryFoYxeRZ7jJFdH3KFY7DXoxU3ofhJYAqJoQzk1QmS6nIwWVzaU9IuO108Vy4KLwY+rzRSd7c9sOUhAocu6FbfZeUFlcbqbfXAOnIbclXClROzsdhr9JhLeXmlC19HQTg0PonvRhPXU8Vi/Y3II3Rq+BPTDSKlRV0+OdGCBWTVX169wqCnPRGc5WF/NHgJwIk2WpfXrgYsmiLTeFI8cqquBR8ipSZKkvYlVsKUADhJ7aZDmdRHw==
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(23010399003)(376014)(6133799003)(10067099003)(22082099003)(3023799007)(18002099003)(56012099006)(261009223027099003)(261009221227099003)(5023799004)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	F6O/0FRL08OWDj+FDOeeAO0zf/IZd5HWxB5ihMfz+YS0tiF7Hu7XDu5tjwqwLjzwfD3iZqMwuDLaopt1esPOkJwy2DEqCns4bcXJd1ax8pfy6P1j5AwPTrlg00Uw9e3+4kIQIPGeUIhyEUxwG/PTEPqxW/deHcdCE9ZQSZ+u+kT8EJT97wDcFb4qc+F/sfTSfxzt/nZv2gBjUblWmErxFsZqt7nhCj5MTEz1mgBNlUeEEfwCZu/Z2ABPViF3FowFGYCnDrNwghBXIjWJopfP63s+JRbN68P5BFLS5Caq8mcxhDkyOBSDZdudi7WgUgAuLS62RLBmKkEDamJY9pXZDu8Rcv7m0IDSxUSUbsffTPg/3ws+uJJ41uh+WKndqKBB6ZfSGX2gvIYf/lrEh0QqL9AdgFHqTbeZCKf6/l8lvMrIvAUQ3/3m/XeItrRVkST0
X-Exchange-RoutingPolicyChecked:
	Ip6x8+PAJPtpHu5MrJQKToKblVvvmPfXsr9l69n8fYjWkSwj8u5nrs2R9qbM4UktQY6O23M5LaqMtUKw9DywxW/x4/JLaP1AK0LbRvUVyWW3FrM8WRD5vBNHYkbf+2HnTbLYPYhQ+fG8OjTG15aAYFYKPipDZZ7deasNqBKYYe6tCHRGvoxJUEeEsVIUSDEE5e/RZi4eX1vVbqnhggOJskNIPTuJl4GUewkpuRp9rtxyuo227Z93CUmX5yK5jfUNQUAyjgN+98FONdm2hmqp4IPR40s0HaNtmvaYlc3CHoCZ5sIdXERxsv4WHt2xVK1W6IPstWHGKO7GTFciiT81fw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2026 15:55:20.7116
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 50c21c47-2489-490a-dedf-08df2f8bb5e2
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	EA8PEPF0000000B.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7979
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA2MyBTYWx0ZWRfXygeHUIWrdMBD
 1LzDotc5CV/wc1diiYWoTlV6LUh+qHhMBG/svp3YjIRM99yZAi5GK/2LPxIiUHOotEv+FjN/B9m
 8or/Y54A6IrQT8tWh/oUtXvplAppyrU=
X-Proofpoint-ORIG-GUID: VTMkAfc_9ai1EYtf-i5ndaS6WuYxuSxf
X-Proofpoint-GUID: VTMkAfc_9ai1EYtf-i5ndaS6WuYxuSxf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA2MyBTYWx0ZWRfX3ref/gNWDkMM
 H4QTgxrLk8BUhqSel4p0oDbu2OzxRipSpQGB95eKcZIMMZvXyiR4e/UUratYzrSqQv7+FlcO4Ct
 IxWRtqZwWdoMVGmZaxoQ//n1yV2sGnHWDBTzpqD2pltb5KPfnTpFfS0Gl4XwS4QDfomRZAJXktI
 aladM7hI3U3LqD00f2RATi/SjSE4SoAYutsC4Z04xXxjxZbUmntVEFF0cpK2J1RVAQmOCv8mnBy
 oXN+xnLWlC44Z7gRhDrQ/afaw5dFc/vLBxKK1RHj9icqcsX9PvZS1/Os9j0UxvakfkyqmETffHS
 KkXDAcrIzIw9UKhfir04ngCEHRHY1okrh6v07MT/FNpjaDO7hJzovyApiTymACZWvBGC8Ei5DGs
 QtBctmWSuzPYwYcJK0dogKazeiZoACsnb+TSncRGXdq1gROZ+QC3HUQOXyhHdbKrnDxciVCTTVM
 Ur5d89CSBDSngJQ2XUQ==
X-Authority-Analysis: v=2.4 cv=R+uWitRX c=1 sm=1 tr=0 ts=6ad8e07a cx=c_pps
 a=GYEwMlAgQavT3rNqZldEpA==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=sozttTNsAAAA:8 a=c92rfblmAAAA:8
 a=4ub8l0Zfgc7SMtH5nF4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210063

On 10/21/26 1:36 AM, Moteen Shah wrote:
> 
> On 19/10/26 13:37, Moteen Shah wrote:
>> Add the TDA54 SCM configuration driver providing access to the SCM register
>> space through regmap/syscon.
>>
>> The driver handles proxy-based register access and SCM unlock/claim
>> handling, and registers TDA54 SoC information using the common K3 SoC
>> info helper exported by k3-socinfo, for which the TDA54 part number is
>> added to the SoC ID table.
>>
>> Default the option to m on ARCH_K3, so that the driver gets built for TDA54
>> boards without requiring a defconfig change.
>>
>> Signed-off-by: Moteen Shah <m-shah@ti.com>
>> Signed-off-by: Aniket Limaye <a-limaye@ti.com>
>> ---
>>   drivers/soc/ti/Kconfig             |  16 +++
>>   drivers/soc/ti/Makefile            |   1 +
>>   drivers/soc/ti/k3-socinfo.c        |   2 +
>>   drivers/soc/ti/tda54-mcu-sysconf.c | 216 +++++++++++++++++++++++++++++
>>   4 files changed, 235 insertions(+)
>>   create mode 100644 drivers/soc/ti/tda54-mcu-sysconf.c
>>
>> diff --git a/drivers/soc/ti/Kconfig b/drivers/soc/ti/Kconfig
>> index 163aadd589d3a..ea5da6722da29 100644
>> --- a/drivers/soc/ti/Kconfig
>> +++ b/drivers/soc/ti/Kconfig
>> @@ -82,6 +82,22 @@ config TI_PRUSS
>>         processors on various TI SoCs. It's safe to say N here if you're
>>         not interested in the PRU or if you are unsure.
>> +config TI_TDA54_MCU_SYSCONF
>> +    tristate "TI TDA54 SCM configuration controller"
>> +    depends on ARCH_K3 || COMPILE_TEST
>> +    depends on OF
>> +    default m if ARCH_K3
>> +    select MFD_SYSCON
>> +    select TI_K3_SOCINFO
>> +    help
>> +      Support the SCM configuration controller found on TI TDA54.
>> +      The controller provides a syscon regmap and is also the
>> +      hardware access path used to obtain and register K3 SoC
>> +      identification information.
>> +
>> +      This driver can be built as a module, in which case the module
>> +      will be called tda54-mcu-sysconf.
>> +
>>   endif # SOC_TI
>>   config TI_SCI_INTA_MSI_DOMAIN
>> diff --git a/drivers/soc/ti/Makefile b/drivers/soc/ti/Makefile
>> index cb800a745e66d..33f4ddca32ed6 100644
>> --- a/drivers/soc/ti/Makefile
>> +++ b/drivers/soc/ti/Makefile
>> @@ -11,4 +11,5 @@ obj-$(CONFIG_TI_SCI_INTA_MSI_DOMAIN)    += ti_sci_inta_msi.o
>>   obj-$(CONFIG_TI_K3_RINGACC)        += k3-ringacc.o
>>   obj-$(CONFIG_TI_K3_SOCINFO)        += k3-socinfo.o
>>   obj-$(CONFIG_TI_PRUSS)            += pruss.o
>> +obj-$(CONFIG_TI_TDA54_MCU_SYSCONF)    += tda54-mcu-sysconf.o
>>   obj-$(CONFIG_POWER_AVS_OMAP)        += smartreflex.o
>> diff --git a/drivers/soc/ti/k3-socinfo.c b/drivers/soc/ti/k3-socinfo.c
>> index 5fae03004e350..9869dd6358d1f 100644
>> --- a/drivers/soc/ti/k3-socinfo.c
>> +++ b/drivers/soc/ti/k3-socinfo.c
>> @@ -50,6 +50,7 @@
>>   #define JTAG_ID_PARTNO_AM62PX        0xBB9D
>>   #define JTAG_ID_PARTNO_J722S        0xBBA0
>>   #define JTAG_ID_PARTNO_AM62LX        0xBBA7
>> +#define JTAG_ID_PARTNO_TDA54        0xBBC1
>>   static const struct k3_soc_id {
>>       unsigned int id;
>> @@ -66,6 +67,7 @@ static const struct k3_soc_id {
>>       { JTAG_ID_PARTNO_AM62PX, "AM62PX" },
>>       { JTAG_ID_PARTNO_J722S, "J722S" },
>>       { JTAG_ID_PARTNO_AM62LX, "AM62LX" },
>> +    { JTAG_ID_PARTNO_TDA54, "TDA54" },
>>   };
>>   static const char * const j721e_rev_string_map[] = {
>> diff --git a/drivers/soc/ti/tda54-mcu-sysconf.c b/drivers/soc/ti/tda54-mcu-sysconf.c
>> new file mode 100644
>> index 0000000000000..8598080f6c48e
>> --- /dev/null
>> +++ b/drivers/soc/ti/tda54-mcu-sysconf.c
>> @@ -0,0 +1,216 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * TDA54 SCM Configuration syscon driver
>> + *
>> + * Copyright (C) 2026 Texas Instruments Incorporated - https://www.ti.com/
>> + */
>> +#include <linux/bitfield.h>
>> +#include <linux/bitops.h>
>> +#include <linux/io.h>
>> +#include <linux/mfd/syscon.h>
>> +#include <linux/of.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/regmap.h>
>> +#include <linux/soc/ti/k3-socinfo.h>
>> +#include <linux/types.h>
>> +
>> +/* Size of a single proxy window into the scm_conf register space */
>> +#define TDA54_SCM_CONF_PROXY_STRIDE        0x4000
>> +
>> +#define TDA54_JTAG_ID_REG_OFFSET        0x14
>> +
>> +#define TDA54_SCM_CONF_LOCK_KICK0_UNLOCK_VAL    0x68EF3490
>> +#define TDA54_SCM_CONF_LOCK_KICK1_UNLOCK_VAL    0xD172BC5A
>> +
>> +/*
>> + * Claim registers start at 0x3100. Claim register i holds the claim bit
>> + * for each of the 32 registers in the (i * TDA54_SCM_CONF_CLAIM_BLOCK_SIZE)
>> + * .. (i * TDA54_SCM_CONF_CLAIM_BLOCK_SIZE + 0x7c) block, one bit per
>> + * register, i.e. bit b of claim register i corresponds to the register at
>> + * offset i * TDA54_SCM_CONF_CLAIM_BLOCK_SIZE + b * 4.
>> + */
>> +#define TDA54_SCM_CONF_CLAIM_REG_STRIDE        0x4
>> +#define TDA54_SCM_CONF_CLAIM_REGS_PER_WORD    32
>> +#define TDA54_SCM_CONF_CLAIM_BLOCK_SIZE        \
>> +    (TDA54_SCM_CONF_CLAIM_REGS_PER_WORD * 0x4)
>> +
>> +/* Per-SoC register offset data (platform data) */
>> +struct tda54_scm_conf_data {
>> +    u32 lock_offset;
>> +    u32 claim_offset;
>> +    u32 claim_status_offset;
>> +};
>> +
>> +static const struct tda54_scm_conf_data tda54_scm_conf_data = {
>> +    .lock_offset        = 0x3008,
>> +    .claim_offset        = 0x3100,
>> +    .claim_status_offset    = 0x3300,
>> +};
>> +
>> +struct tda54_scm_conf {
>> +    void __iomem *base;
>> +    u32 proxy;
>> +    const struct tda54_scm_conf_data *pdata;
>> +};
>> +
>> +/*
>> + * Make @reg writable through this proxy.
>> + *
>> + * Proxy 0 is the default access proxy for all unclaimed registers. Its claim
>> + * bits are tied low, so it cannot claim anything and needs no claim to write;
>> + * it can write @reg unless another proxy has claimed it, which is reported by
>> + * the claim status.
>> + *
>> + * Any other proxy has to claim @reg first. Registers claimed by a proxy can no
>> + * longer be written through any other proxy's address, until that proxy
>> + * releases the claim. The claim status is set once any proxy owns @reg, so
>> + * read the claim register back to check that the claim is held by this proxy.
>> + */
>> +static int tda54_scm_conf_claim(struct tda54_scm_conf *scm, unsigned int reg)
>> +{
>> +    unsigned int block = reg / TDA54_SCM_CONF_CLAIM_BLOCK_SIZE;
>> +    unsigned int bit = (reg % TDA54_SCM_CONF_CLAIM_BLOCK_SIZE) /
>> +               TDA54_SCM_CONF_CLAIM_REG_STRIDE;
>> +    unsigned int claim_reg = scm->pdata->claim_offset +
>> +                 block * TDA54_SCM_CONF_CLAIM_REG_STRIDE;
>> +    unsigned int status_reg = scm->pdata->claim_status_offset +
>> +                  block * TDA54_SCM_CONF_CLAIM_REG_STRIDE;
>> +    u32 val;
>> +
>> +    if (!scm->proxy) {
>> +        if (readl(scm->base + status_reg) & BIT(bit))
>> +            return -EBUSY;
>> +
>> +        return 0;
>> +    }
>> +
>> +    val = readl(scm->base + claim_reg);
>> +    val |= BIT(bit);
>> +    writel(val, scm->base + claim_reg);
>> +
>> +    if (!(readl(scm->base + claim_reg) & BIT(bit)))
>> +        return -EBUSY;
>> +
>> +    return 0;
>> +}
>> +
>> +static int tda54_scm_conf_reg_read(void *context, unsigned int reg,
>> +                   unsigned int *val)
>> +{
>> +    struct tda54_scm_conf *scm = context;
>> +
>> +    *val = readl(scm->base + reg);
>> +
>> +    return 0;
>> +}
>> +
>> +static int tda54_scm_conf_reg_write(void *context, unsigned int reg,
>> +                    unsigned int val)
>> +{
>> +    struct tda54_scm_conf *scm = context;
>> +    int ret;
>> +
>> +    ret = tda54_scm_conf_claim(scm, reg);
>> +    if (ret)
>> +        return ret;
>> +
>> +    writel(val, scm->base + reg);
>> +
>> +    return 0;
>> +}
>> +
>> +static const struct regmap_config tda54_scm_conf_regmap_cfg = {
>> +    .reg_bits = 32,
>> +    .val_bits = 32,
>> +    .reg_stride = 4,
>> +    .reg_read = tda54_scm_conf_reg_read,
>> +    .reg_write = tda54_scm_conf_reg_write,
>> +};
>> +
>> +static int tda54_scm_conf_register_socinfo(struct device *dev,
>> +                       struct regmap *regmap)
>> +{
>> +    u32 jtag_id;
>> +    int ret;
>> +
>> +    ret = regmap_read(regmap, TDA54_JTAG_ID_REG_OFFSET, &jtag_id);
>> +    if (ret)
>> +        return dev_err_probe(dev, ret, "failed to read JTAG ID\n");
>> +
>> +    return k3_socinfo_register(dev, jtag_id);
>> +}
>> +
>> +static int tda54_scm_conf_probe(struct platform_device *pdev)
>> +{
>> +    struct device *dev = &pdev->dev;
>> +    struct tda54_scm_conf *scm;
>> +    struct regmap *regmap;
>> +    void __iomem *base;
>> +    int ret;
>> +
>> +    scm = devm_kzalloc(dev, sizeof(*scm), GFP_KERNEL);
>> +    if (!scm)
>> +        return -ENOMEM;
>> +
>> +    base = devm_platform_ioremap_resource(pdev, 0);
>> +    if (IS_ERR(base))
>> +        return PTR_ERR(base);
>> +
>> +    if (of_property_read_u32(dev->of_node, "ti,proxy-id", &scm->proxy))
>> +        return dev_err_probe(dev, -ENODATA, "missing ti,proxy-id property\n");
>> +
>> +    if (scm->proxy >= 8)
>> +        return dev_err_probe(dev, -EINVAL,
>> +                     "ti,proxy-id must be between 0 and 7\n");
>> +
>> +    scm->base = base + scm->proxy * TDA54_SCM_CONF_PROXY_STRIDE;
>> +
>> +    /* Get register offsets from driver data (matched by compatible) */
>> +    scm->pdata = of_device_get_match_data(dev);
>> +
>> +    regmap = devm_regmap_init(dev, NULL, scm, &tda54_scm_conf_regmap_cfg);
>> +    if (IS_ERR(regmap))
>> +        return PTR_ERR(regmap);
>> +
>> +    writel(TDA54_SCM_CONF_LOCK_KICK0_UNLOCK_VAL, scm->base + scm->pdata->lock_offset);
>> +    writel(TDA54_SCM_CONF_LOCK_KICK1_UNLOCK_VAL, scm->base + scm->pdata->lock_offset + 4);
>> +
>> +    /*
>> +     * There is no way to unregister a syscon regmap, so publish it only
>> +     * once nothing else in probe can fail.
>> +     */
>> +    ret = of_syscon_register_regmap(dev->of_node, regmap);
>> +    if (ret)
>> +        return dev_err_probe(dev, ret, "failed to register syscon regmap\n");
>> +
>> +    /*
>> +     * SoC identification is informational, so a failure here must not fail
>> +     * the probe. It is registered last and released through devres.
>> +     */
>> +    ret = tda54_scm_conf_register_socinfo(dev, regmap);
>> +    if (ret)
>> +        dev_warn(dev, "SoC info not registered: %d\n", ret);
>> +
>> +    return 0;
>> +}
>> +
>> +static const struct of_device_id tda54_scm_conf_of_match[] = {
>> +    { .compatible = "ti,tda54-mcu-scm-conf", .data = &tda54_scm_conf_data },
>> +    { /* sentinel */ },
>> +};
>> +MODULE_DEVICE_TABLE(of, tda54_scm_conf_of_match);
>> +
>> +static struct platform_driver tda54_scm_conf_driver = {
>> +    .probe = tda54_scm_conf_probe,
>> +    .driver = {
>> +        .name = "k3-tda54-scm-conf",
>> +        .of_match_table = tda54_scm_conf_of_match,
>> +        .suppress_bind_attrs = true,
>> +    },
>> +};
>> +
>> +module_platform_driver(tda54_scm_conf_driver);
>> +
>> +MODULE_AUTHOR("Moteen Shah <m-shah@ti.com>");
>> +MODULE_DESCRIPTION("TDA54 SCM Configuration syscon driver");
>> +MODULE_LICENSE("GPL");
> 
> Hello all,
> 
> I was going by the reviews from Sashiko[0], I had similar concern before sharing this patch upstream.

And we discussed this during internal review of this series also (this
went to v10 on our internal review list, that is the one downside of
internal review, lots of earlier discussion context is lost/unavailable
when finally doing the public posting).

Anyway, to summarize we came to the conclusion that the issue is
valid, but not specific to this driver. The problem is the same
for any driver/module that exports pinned memory resources (dma-buf
exporting modules deal with the same). The solution will take work
at the framework level and be outside of the scope of this series.

> It would be really great if I can have some suggestions on this.
> 
> 1. Have it inbuilt
> 2. Remove the module_exit, make the module unremovable
> 3. Look towards a core syscon fixup?
> 
> Option 3 would be to add of_syscon_unregister_regmap(np) and subsequent consumer driver changes.
> 

That would be one part of this, but that doesn't solve the
core issue of what to do with consumers who have already
gotten a reference to the regmap which would still become
invalid after this module unregisters.

One options I see is to make sure that consumers using
device_node_to_regmap() causes a reference to the regmap
exporting driver to be upped. This way this module would
not be unloadable until all consumers have returned the
reference (a way for consumers to return the reference is
also needed).

Andrew

> [0]https://sashiko.dev/#/patchset/20261019080736.944127-1-m-shah%40ti.com
> 
> Regards,
> Moteen
> 

