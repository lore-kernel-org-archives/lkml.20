Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.150.75
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794326335;
	b=0pUJ7SXZaxNzK/miq/r2yKXWd9PY44DG3PN8nteBgII8YoAtBWOhwIerPcyEsG3eDtlH
	 +B32o4+sEUW3q8XH27HkGxVKiHXbUsPuawBEUdSFF1e6sDcjkrB6kuCbX9jz2iUIWJ6cN
	 rsV43R5CmLZ9gN0ETvIOgmsZZdod9Y436JZ0GK+eExUDm9v4ujN350zMYBT+uojg1AYNC
	 l3K2VzzemLl4EzF2ldJW+nG7e2FjzFVkXxoLk2xg4tbYOIDyfX0ueIZ4rlu1iUYB2ZzSB
	 utvAkVS5nqyFk759o/qHJlTJ34jGN4JA1ZAvfHgWS/fuGaYrcYTWyC2GEC9x8NDd6GQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794326335;
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
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=WWLivEk66yDVVR15z8Fx+yL3JcKdrWI3owtv6lMNrjM=;
	b=WlZsiRNAKQcocMP2XpJ6kBaNWWosgen8eA7P0OPdN/eR2qdo4KgEA6mihGdmQkjTrO60
	 p9EChmBw6e7WbET1yQF9V9wPU+A0yS/2RvPTpPW9Fd0qpYK46XJfysWeN2SXtBFvoNrB+
	 Cvwp1b33CWcT9iCx/oaqquFYrC0u+iUbzhY3u3hTTyNu2z+ov2OSbp2tcjStXsGIFspRB
	 epV7yCT49MMAXrttZVUfiMCva5L5jvO8x+nAhw8fc72O+/E7gISizsOowcg58ba1PqTsA
	 eqhOQiAEG6TUcRRAvQVvg9L0N7lWCtLKY+NZF2o/CsbYLw/fcEvChQm3kwZwvr771Pg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ti.com;
	spf=pass smtp.mailfrom=ti.com;
	dkim=pass header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=SCcFRdUQ;
	dkim=pass header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=JUcYJOgp;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.150.75
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EC70606A321;
	Tue, 10 Nov 2026 15:58:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6EC70606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=SCcFRdUQ;
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=JUcYJOgp
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 6AAEw2B42015452;
	Tue, 10 Nov 2026 09:58:36 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=WWLivEk66yDVV
	R15z8Fx+yL3JcKdrWI3owtv6lMNrjM=; b=SCcFRdUQ1REIbIbSlf7zyxOAg6R9a
	tLXGbUydG6QOAo9qwx+OrEUqwprU/uaW2zNRapddkUyfZOByL1KpbQXURP1AIjNE
	XKoZqKJi4s7n5lA+Nqvy1FuDiES6x9/e8BlLn17K9ZlOii1300yK3aYVzRAlHe4E
	girbw7+jN0iL0sKyuTRYjCZhRnxjOrdqoT7g9yzm5XcPeWw8EiP1I/QfbcHUbacE
	gtWb+ir7YDvE1Id/zHNruIAUBTK6vijU5PEr2grAyVzOXff8tYD3J+vTJS0JpI3T
	W90mspEp4YGRxck+rtYyFc69D120CW+dUMzABCfAV2fLgJGdxAu4MVmAQ==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010014.outbound.protection.outlook.com [40.93.198.14])
	by m0380145.ppops.net (PPS) with ESMTPS id 4huxnx2r2f-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 10 Nov 2026 09:58:36 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IUv8XJHv8t/rM8xza502ia3Mqg/IDcV4J7wj/eZdaT1GchrutxTPLsJbFmTrKOuTZd6ysWJyLggo5PGqZ5mNEUywlSIHV8GFspzrD2fsHXoTSIF8rFIPg6QtACK3FxN3Ts+m/kJaZdgvAFdq0BnfcjE2GDPJBOpsxlrEHetlnJ1NqHfCK+H5oLZxPdcJjpiujCLq2fjTEQE+JXzSlMoARwnOZYpA6vUJHjzke4kF4xPXxc0I7QOMU5VUOqESQqcFcL8Uz3jUxfPHuG21utsBHcOMIh1GYwLoncY3UAeHhjfXMLSuen0JiWjtlLZPTrAFJFY0oA/ielhI1us5sfbpsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WWLivEk66yDVVR15z8Fx+yL3JcKdrWI3owtv6lMNrjM=;
 b=oTxYTH2+jEmlMcE5rKPAuGavLVeY+KApPj+Nw/3Mz0twak0O3shtz4Q+tdUmHutMyJ6blxUVXejwIfVvczaTm9nH4RCjFfXsOSo+awVZRAzaNtXk18VY6cHllrjB316lWqR1qrCT7zKANYnQvQFzqK3KfJyFIhlUz36FnJNonP89iYnhFDecONgRb6RS/EjVhzHRtueIFCdt99Nyhc4rpOCoKUxjgNcE4V2WgBUY1gCUTety3m5hWvUZNf7PI0SChL+EpgaeIWW0VDE7TtdlZKa9FxlGyO9TmHqR6YWJ7jeMjL9JwJMQD6qUQ4RCFbp/rXNksrAZVZcAEOwwo5nlWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=ideasonboard.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WWLivEk66yDVVR15z8Fx+yL3JcKdrWI3owtv6lMNrjM=;
 b=JUcYJOgpcbLMfynmzImIVmkGWasvQ+xp8PUsRPPgxacEwJUu6EbgRTvh/0hlmvWH1RSEEUdAoVdcCHr4k64yiHfn07Hp42bonsxvK+D1UuNt6NAhAws+YVRdAwIvUjP9E8Qnzy1sLnNrmHJCmucBGtnG0CD8jg8pHSIopmSIqtY=
Received: from CYXPR03CA0008.namprd03.prod.outlook.com (2603:10b6:930:d0::25)
 by DSVPR10MB997798.namprd10.prod.outlook.com (2603:10b6:8:38a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Tue, 10 Nov
 2026 15:58:33 +0000
Received: from PH2PEPF00048919.namprd05.prod.outlook.com
 (2603:10b6:930:d0:cafe::2f) by CYXPR03CA0008.outlook.office365.com
 (2603:10b6:930:d0::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.8 via Frontend Transport; Tue, 10
 Nov 2026 15:58:32 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 PH2PEPF00048919.mail.protection.outlook.com (10.167.243.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Tue, 10 Nov 2026 15:58:32 +0000
Received: from DLEE206.ent.ti.com (157.170.170.90) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 10 Nov
 2026 09:58:14 -0600
Received: from DLEE201.ent.ti.com (157.170.170.76) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 10 Nov
 2026 09:58:14 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 10 Nov 2026 09:58:13 -0600
Received: from b-brnich.dhcp.ti.com (b-brnich.dhcp.ti.com [128.247.75.1])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6AAFwDIS1079577;
	Tue, 10 Nov 2026 09:58:13 -0600
From: Brandon Brnich <b-brnich@ti.com>
To: <devarsht@ti.com>, <mchehab@kernel.org>, <hverkuil@kernel.org>,
        <sebastian.fricke@collabora.com>, <benjamin.gaignard@collabora.com>,
        <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <k-willis@ti.com>, <jai.luthra@ideasonboard.com>,
        Brandon Brnich
	<b-brnich@ti.com>
Subject: [PATCH v7 0/4] E5010 Probe Cleanup and Adding autosuspend
Date: Tue, 10 Nov 2026 09:58:06 -0600
Message-ID: <20261110155810.18521-1-b-brnich@ti.com>
X-Mailer: git-send-email 2.43.0
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
X-MS-TrafficTypeDiagnostic: PH2PEPF00048919:EE_|DSVPR10MB997798:EE_
X-MS-Office365-Filtering-Correlation-Id: f81d2d14-4ef6-4d18-496c-08df3f437872
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|82310400026|36860700016|261022115727099003|261026140227099003|261022075727099003|261026121527099003|261021123027099003|261021135927099003|261028144727099003|261009223027099003|261021121427099003|261022105027099003|261022113327099003|261102123227099003|10067099003|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
	n4aJyTQ1gXvaHcVx0D/uLsYlr29aggJ3thIbYHoY7vAFQ1POzzJPn2RRn1R0ofQU7EO4hm2Tqc5zwim0u6FfIpqGot+aVP4q/mwMGO74XKoCYP5YaHTPVeqmxAPJ81bugg4gzXHcbDVaQ2kFrUMc+ztDbZcym5mnRARQDluDARlE0jn/fWFctGsZxt+tKVremC3lf3/fuhxRRW7yQ28sWrDLmVx4Xs4ldZsdIHlrRl3c7Be0mob9AhU8D0KtVylnqFpJGvAPAM0APSWFt8HMR1EnwRlEVda8Zyy0yKqccnbObhnPbBXmOTltApLxCit65ww1IgZ9ZR/cJHXiCjNL+F3Yi6gIabSDDdAluAfYpNFVQmX/kwAmFqVbk63A7mcXswoOCwzh0oQ/5bO2Z7QFP2EHkYuqFoibku1HIJ7lQi6gk9IjquACVMdCxtF07nEVB+v36ZGd+Zfe7jB4EOCdEAgExmVeyMqP1SS3Pj5kjyj/MvrLte+mKmgY7qOeJVeg3jjIuT+pMkiuCbWRbcAucXxKp1vKn3/Nui/TqTVpGZzbqOkWecTKZVqtTj28UBELDU7oGjQXtVtimXbhDKxDJmv8EBoftxzMsDsS3C/pkX4hioUYnyZJmJHvDpMgb74V4bcR7vOz9FCmtgzqrQYW09Z18uS17+zVils5AgDXNH4=
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(82310400026)(36860700016)(261022115727099003)(261026140227099003)(261022075727099003)(261026121527099003)(261021123027099003)(261021135927099003)(261028144727099003)(261009223027099003)(261021121427099003)(261022105027099003)(261022113327099003)(261102123227099003)(10067099003)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	8bZP/LgGioXvk18lGc5UeiPcnu8wh8ts5SrrFte+ELhHgTSUbiYakbhqiYMgGaccINAYUWHnOO2YfTljAOAPZySnACmBczPLOrkTLlXdqy3IYPnrIkjlSicm7EmUauufwl3s+3bedCXRwAcjUioyujZLdbI6KtYurrpWWKrVQT8LQ5qXtdUs8oit3SNe5JVRCPCz+V+X+j554jHDfL2FFmIem8geSOC10w8bQHPcEjoapF9RoNCXkNDzefpRLIoisCptlA1b9ufFXCv5/Ge2KLgZ4MMdUBFjiyPa0fR6rsJJ+QoouXIxxniWddMjB0ORRGNmsH0O970kU13KXrQMtoZ063BcLQmDaDZI5su4lHjOKrd3N3YHQ+RJxXvhH9pcI5ORlHMAqHBzHD6tcFJjHEoWZf2I8zbxSmLR9wo4fTnwljE86DyOn09/c8B/vduc
X-Exchange-RoutingPolicyChecked:
	W6JAJjWoJStci781r3MTi+2taCbKO1A5cCzV8pN30IuIbwWvPtAL+G+cSV7DlttDjUVtv9ZBc4OkzHnXw+C2PY70OaLMb2Za7unMw2WdTTHqBkApzTZ5cPkKil7GQCBpgWH0niZ8rHxp8vTKxobqx26hZBkyA+x0WrMcQUiCp2K4zfLPtSXwRad83PerKNtW32HG6WutYlwL9p2m2rtsswtnZ01X5nIWE8LBZkcL5/6/QQmPtqSnlwcdEU8DRmSMJS4r1K9Pdakv0486roRF+F5Jmpwe+NauBo1lVSQG137UZIOIgFIGCjRhvdmwivVUWCDYhDSFFabVJLLKPQ0SlQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 15:58:32.4937
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f81d2d14-4ef6-4d18-496c-08df3f437872
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	PH2PEPF00048919.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSVPR10MB997798
X-Proofpoint-ORIG-GUID: 88xdu_79nXud4UpguRzEm547n9gYMIbA
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA2MyBTYWx0ZWRfX2Tua57cq8jlv
 1OB3Hyh71IkPRhe0z3dZA3ZYZp2tXvqoIkUfaCvFVHKO2zSaNWJEVPYhxlzOXWUpLw4W4nvk/p1
 RT5ZIOTpyi4Mwk/oOBHcE89i3NNezNs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA2MyBTYWx0ZWRfXyoqgcx2lJn81
 DTiBnxZq6zMikoplRmDlKdilBROfYk2IFD/o/IWt+jpE5ahc07A/Yt2RlOT7fAOCW8IVTuxNsvC
 tFHTSOcoqbfIwSC3h9QuNF0eZamcryqzJq5lFsqjN2+/bx6VdpbFKVvSGBxYK9oqTw6C6KGqHHb
 n0oPs77LckvL75fDV4c/9B/qs0+xI7ezS8guJTObD3d40TmsJCMseY/Xfn7tBVLjYxSRS9/bFbR
 6WyvXbMlWnFxkh3EfosP+J+TMn633OY3VVvzaaZ7bB/1JlDg7xvvEAMjCcqwiUeMu5gVQWL4Iq2
 H7HRiSNdABeF1uyoVHAj1zDzYPIjRIZ2Mi9Tilkdst9pAinOMBPNrmaOAQruQXiqzD80qITZech
 gwhOx1ThTu+eHgNpcJ92ld53Sx3nHBRi5F+/2I+3iHxPiV/CDBfotVarnhPfCPAvuOxAdqNxY5s
 Ej64+9swhb79vC2q+3w==
X-Proofpoint-GUID: 88xdu_79nXud4UpguRzEm547n9gYMIbA
X-Authority-Analysis: v=2.4 cv=b4cncdGx c=1 sm=1 tr=0 ts=6af33f2c cx=c_pps
 a=CzkwbHv2eVnX1aWe+0O+5A==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8
 a=d9KtpaHAlfMgSYnQeDoA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 spamscore=0 bulkscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100063

Hello all,

I noticed a report from the intel bot[0] which pointed out a valid issue
with the driver never calling e5010_init_device unless CONFIG_PM was
enabled. 

While looking at probe though, I noticed that the clk_enable was never
properly called. That has now been fixed with a proper remove path as
well.

Lastly, I cleaned up the goto jumps in probe to fix an issue where the
m2m_dev wasn't being freed.

The rest of the series is setting up the driver for properly adding in
support for autosuspend. Last patch adds in autosuspend support and
moves e5010_init_device into probe for cases where PM isn't enabled.

Changes since v6:

- Patch 2 changed order of calls during remove cleanup. video unregister
  now happens before pm disable
- patch 3 was updated to account for the case where a reset was called
  and the device was never properly reinitialized
- patch 3 has moved setting the last_run_context to NULL as well to
  always update QP values when device is turned back on/reinitialized
- removed the r-b by Kendall, Devarsh, and Jai since I have made a
  slight code change requested by Devarsh
- patch 4 remove the last_run_context in runtime resume hook that it had
  before because I moved it to patch 3
- patch 4 has updates to commit message to accurately reflect why
  init_device was added to probe
- patch 4 has updates where disable autosuspend now comes before disable
  pm

Changes since v5:

- Fix patch 1 not properly removing all references to the
  fail_after_video_register_device label

Changes since v4:

- Change authorship of patch 1 since Myeonghun sent a similar patch
  first
- addressed Devarsh's comments in Patch 1 to follow similar naming
  structure as rest of probe function
- Moved the clk_enable call after pm_runtime_enable here so I can check
  success of that call. If runtime pm is enabled then don't enable the
  clock here
- Patch 3 no changes
- Patch 4 I added the macro requested by Devarsh instead of using magic
  number
- failure to power on now goes through the existing no_ready_buf_err path,
  so buffers are marked as error and the job is finished

Changes since v3:

  - patches 1 and 2 are new in v4
  - patch 3 remains unchanged
  - patch 4:
      - updated goto to match changes in patch 1
      - update PM calls in probe

Best,
Brandon

[0]: https://lore.kernel.org/oe-kbuild-all/202608140323.qyc8mKlp-lkp@intel.com/

Brandon Brnich (3):
  media: imagination: e5010: Fix clk never enabled without CONFIG_PM
  media: imagination: e5010: Move e5010_init_device to Runtime Resume
    Hook
  media: imagination: e5010: Enable autosuspend for runtime PM

Myeonghun Pak (1):
  media: imagination: e5010: release m2m device on probe failure

 .../platform/imagination/e5010-jpeg-enc.c     | 91 +++++++++++--------
 .../platform/imagination/e5010-jpeg-enc.h     |  1 +
 2 files changed, 56 insertions(+), 36 deletions(-)

-- 
2.43.0

