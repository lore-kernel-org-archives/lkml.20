Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793790690;
	b=uN8jXYUyu5XYxrd+oRiIFZrAj8Cuw5HognD18KiRqzd18CUh1EdcB54kUQjwxTTQyiBJ
	 Hph4QnC/xpciR0AP89e7M6DbWoY7mrECwjz7xldItJTC4C8XOooWhfbiGchEzPze2XsTZ
	 FZKlbHCCOclwcwDYZipbfrIHaLKEL4stf4bt3cP5MHg8AZ0/iu1l12zQQlr7Dkk/laD0g
	 3rfVWyoLyMCwYjBN26/iL3/bfjHIpgM8lbsSD55UH4+yedKxMnfzWFdbvfqsFzNF0btlm
	 tZCpyJwfYtcsrE4st5IWymAGgxh7E2usoLhMhIvRoOuy5qzOoSByX1wrgVXDKf8BGsw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793790690;
	h=DMARC-Filter:Received:DKIM-Signature:Received:DKIM-Signature:
	 Received:Received:X-MS-Exchange-Authentication-Results:Received-SPF:
	 Received:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:Content-Type:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-OriginatorOrg:X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Reason;
	bh=BX1i0Kt3zRW2KegnYKlx5lI3UDnLi1gzOrfRb6+vyGM=;
	b=hHpoR0GpaCxRLMx6S6gww+8s7lZM8nakoc1G7v4FfqIEWJRvCowc1x2tiiW9sfu60tpc
	 OiJMmPu7Lqq+aMLQV/5KFIH3S3o/wefC+HSrMBDVdEnwiCMy7VN8RfqsA/fcM4WhTzfJu
	 L3X1CmQZ2KuX9aNz4xjMGWVx88bB6EY0LNIk15sn8WYcABpsrCW/SSufF9y3dTHUXmF7G
	 HQoHUg//qUALFJZ2NIKjWGEgpV8L/FaIHJdswQDWDA6y6TswJDqR8UlwtA36SD3c8UvHi
	 OEayvXXiyEXXpoXXhFDhvtbOaKS0embxVQzmRowMVkFBa4RGxjPbjlyNeYwu+rB/CBg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=EEV1TxnA;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=C0Xun2ji;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5962A606A335;
	Wed,  4 Nov 2026 11:11:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5962A606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=EEV1TxnA;
	dkim=pass (1024-bit key, unprotected) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=C0Xun2ji
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A45F73g2656711;
	Wed, 4 Nov 2026 05:11:28 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=BX1i0Kt3zRW2Kegn
	YKlx5lI3UDnLi1gzOrfRb6+vyGM=; b=EEV1TxnAERGc6yOjqgRM10jJZ0t+hEOt
	CstwHwGYvCeZqM2bK7xgeAbGHvLP2NhICVJY3rlQ6Gqpx3xBbp8Jl37/bXVU+BfB
	vLAXfGXDanzb2yrz5nDyAEGr9onkMFrGdwjKt8nuEgQb+uPbXP61ouwlaYJHOQKf
	qwkNiniQJMwhBWkk0okqBSxykB9Yuvvh8l4PQ7OKUzKiZtl6qOSgW7+Y/3pyzoXo
	3+XETdP2FwKvC1n1W6aROkepCwZFTdjyPnTTav40+2sBALwCI3k0vUnhT7e8I7+S
	pOHaJWLQ2AunUpkuik2cD/edd6ASTh4y6xJNu5mPc5Z0VO099rzV0g==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11020092.outbound.protection.outlook.com [40.93.198.92])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4hncrfwgbf-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 04 Nov 2026 05:11:28 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZTr3JLDe6mT7iU7WGdC13gVUx0elpfNs6tsxp002Mmp4KO+LzEzfLIynxE6SjU7BjBbOzd4+TwNEsvjpZ5hyN6YqehoDqKDs632F4Zy8f0YxV7CNfEdscQnSUOJYOFJAzF7hEbApIJpoXq4hIQAiZEMlNJ9VKPEQUNZ52XtZL66VpsT/IziDGCJOfWVwm64ctIdQ4DUwA7qgyGlZN75F95aGAMxE8y94/C3rS2t2CCifmF4p4XUCE1P9GOKSTO3uuoarC39BX6cbpgmoWkCrxXctIOVmcvnhdscf0ugTX5UsUrNkSoNyzG+xvaHyDq3CSsyOajf32z7m08oVJgUXBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BX1i0Kt3zRW2KegnYKlx5lI3UDnLi1gzOrfRb6+vyGM=;
 b=tr4kv/r+YRroCEjglRTLNOCgXn1MaXpj7GXkqehzwo0Z7EwfY98heO629Fn3PKaRuYeVnMrsi2vX67aUlkaY2GOEcOiSdZ0h2xCCF/esNf/7SF4ig7poaZpBjBdKzsLBk4LZziMtrn33ocD/mUCSzGnPJxP+/EZMLxMGyk9J4+/ffK1LD2lP7rFHoRs+OzPQaWmLIcHStytF47Xte8yt1r/7+J7eBb8WFTU8ag2Vh5SksaqIWw0nkxRZnbsBp0kZvYiVNSqYav1iH4gzoZMcXxhu8DtMqHmuBj2eqapMGDzn8S7PvP9OV52B6HEO4NkhVeT4dEh9XTRevRsKtg7l9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BX1i0Kt3zRW2KegnYKlx5lI3UDnLi1gzOrfRb6+vyGM=;
 b=C0Xun2ji+uOC9+nMApnAtyRNOQkehtMiWi/YnKooYHyNY4h79CsPzX9tkYzaILl+0+DVz2Em4boM1MvXHP1s4Rgu+DeSETuA1GZG093yRDJSyAPMDK/jPBssEtsYgI/ZFW0VyazvW0QKk1yBQcZtFeSyQQ4RtEmKv9R76/tNJZo=
Received: from CH5PR04CA0007.namprd04.prod.outlook.com (2603:10b6:610:1f4::7)
 by DM6PR19MB4027.namprd19.prod.outlook.com (2603:10b6:5:248::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Wed, 4 Nov
 2026 11:11:24 +0000
Received: from CH2PEPF000166C5.namprd04.prod.outlook.com
 (2603:10b6:610:1f4:cafe::56) by CH5PR04CA0007.outlook.office365.com
 (2603:10b6:610:1f4::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Wed, 4
 Nov 2026 11:11:24 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CH2PEPF000166C5.mail.protection.outlook.com (10.167.244.235) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.5
 via Frontend Transport; Wed, 4 Nov 2026 11:11:23 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 1E8C1406544;
	Wed,  4 Nov 2026 11:11:22 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.11])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 06C15820273;
	Wed,  4 Nov 2026 11:11:22 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: tiwai@suse.com
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH] ALSA: hda: cs35l56: Fix mixed cleanup and goto in cs35l56_hda_fw_load()
Date: Wed,  4 Nov 2026 11:11:21 +0000
Message-ID: <20261104111121.1054077-1-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
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
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF000166C5:EE_|DM6PR19MB4027:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 5f7917da-c32d-401d-65d4-08df3a645ce5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|61400799027|23010399003|82310400026|36860700016|261009223027099003|261021123027099003|261021121427099003|11063799006|56012099006|261028144727099003|261022105027099003|261026121527099003|261026140227099003|10067099003|18002099003|16102099003|261102123227099003;
X-Microsoft-Antispam-Message-Info:
	5S7ScM7FCk7i+HYBX4KnRNo1cBsXXzifs1l/JGw+sok5nevlvi+JRJO12yGzAhyWKFBCKRQXZOf9qoWD0xZNwYF7Lou/JE/NDbYQpvaZxo6RqK+c+ZWV9fsXaXz5JW48EZhz6UuF2B2AMpNuH6OWLCIDo3oCMZGiBYjzqBK7cbfy0/aA1dja5/8CMvljlpa/YNK/VleZSN4uteQpr5Cl9Hg+hIi+sx1vw1t5/8hhX+LKBpNacYeDiVY8WMidjsNG0oWI7UDxMoAwWldvxqqgBBmjD9n/YOo8ybZhOgzTVweLVi5NvPAXctKY9DxwaBhkzUgLBn31tyJ9EpyIJje8QbY8j74sgjTCUB9B/dEo8hsteUxt6D/A4u2BVtAO8yzMv9bYGRFdcap79wTulT34dUB5LQltLS8+f8RMNeYlMDWPBePQekGaT/5m2VaPaNzWAvBWmM6B/zvDjwl1nNcKXcUUwvc2OtTWWd3gpYQuyGVt1xGF8IvxF19LPduUuF3Oj+Y0fQ4CF4/eEgPn7E0H8lMLKtb6DCzsg5sEOVZdj0IaXxFnmoTZA2NkvjQzcRTwYfIxZLEFh8X3tOAMYQ53S2a/dCN8gAr5QqM+2IMpX00TGd5OKw+SAZfuQC0P51CcMOZSEO4qfGdhlgNzB2EYFOzT2nwi1ujW8vpuACCeiXkLw+RVz4lWXcjIfh0JwzDwNv4ShasZsClvSW8PJXXizA==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(61400799027)(23010399003)(82310400026)(36860700016)(261009223027099003)(261021123027099003)(261021121427099003)(11063799006)(56012099006)(261028144727099003)(261022105027099003)(261026121527099003)(261026140227099003)(10067099003)(18002099003)(16102099003)(261102123227099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	01ThU2JbL1xkxDLiA1P/v+6veoIQ2w8PJnReHmtn932ZkIRefHxPBor6OtBMf93aOfv8C1uxUEVjHwEbDJB08q4RCgAOzTuv16/78RrhCUsmAIyJn5VhM3KGnW61e+LZThYpF4SoOnKwd4qQL8iEkJgmkvgwoZxaGPl7/SpEQTnjIUDH3x38MbA7Z87/FQosauaE1Yyw1NnfHhK7Rx3xB97yHyDnTZNWG4UvfN+RBzgRgZf41d1I6cEXO/GfC+NtdXWjQdK6GvN3Ajus8gjWXmGKiCluQ8gOheASqF4ZjFESxL/NzbCL/FbVlpZO7ounw5b29FPQYE/XSyVBK//TBy/L0ymEhQktj16Y+x7oA/OoXdrtCZ1cSoQ/woMgXEAM4QjQVhx9jEja9ASsmAK/b+wv8aR863WVeSbcKcIGu5VXd9kCrkaMSnxXLHi1T6eK
X-Exchange-RoutingPolicyChecked:
	hL0tdsDEWAaDfq3AjF0ioRIgDOaaFefEWA16LQaCbi9sNaccSndqe/bWXX3c0OId9fRifHtrt4oRnPYya6JI7GnJzXWNJP1O2NSiHf3iyS4uLA+KzZrZgV5qsh6tv/rSysm3uM7kOcApEvXzC64hKWudHYd4tv5Q3+AF6SA+AvE2X7o6EK6CMBBEV7ms3ilr3RwRP1GVfpP0xCX3eL75sorm6eQwiwfd9CUg2qgrd06STQuFzSbPDa5OmKO3PWICXK2rz82+mt0U51gDE5Xt2T1qm6BJBKBOk9dA6JjLPbN79iMDTqpL/0gjhCdAcHz6x7yT465PPBM7Y0RzC0mXvQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 11:11:23.7209
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f7917da-c32d-401d-65d4-08df3a645ce5
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH2PEPF000166C5.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR19MB4027
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA0NCBTYWx0ZWRfX9AsTBBO11+Z2
 rTH1hZ1BEQRIDeb26MWgHUzfbjjSww3elQ3bO+zPKvVFSoMYwYAQBa0S6ooIf6zgSpgop2KXKoi
 cqDmCba5T2URvjV8vOy1yPoYrSa1EECxJycruRlpw0reU6vZ6ooXJCO3cOR2OpyzIfIdN3IMEDi
 aLZb7nzBm0IeS3CdlBb6ahkPEl3VOQz5j1ByZCzTky/pwF20pCB7oHOAKeQeVZrABqB1zpSa51w
 qcG4nEgPPC5d2J2cdxiKnzmxBFM5md1ZpgiGRu0iRdgYxRQNrAjNZtMua3203tTjhxKXGHy65LA
 AxO8xaHrPuhTEpjsmMqcwU7UWo4oorRWlk+Hzv2tjd9gKbFZHcDSN3YqWXPIR0TcO7F2Opz54w9
 5CBKEbU8ycB+TKDyMDCgHp128zqY++4uCuWHFEyGSAwRIa8JqhIqqa0VQND+LjkyzwQLBfFaEOJ
 Mt0uIpcGl61NV0/yWgg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA0NCBTYWx0ZWRfXzE0lM/YJA1Ij
 d8AVz5tdHgH/jBJLt6VzOGF9E5Wcd2IOSBzJu7B6RBdFe1A0oeon7sIZKtlQqDZUemw8Ba3mqBc
 kxrKctHd2nM44eoxyowdvw/0TWMz+f0=
X-Authority-Analysis: v=2.4 cv=LtgHWXdc c=1 sm=1 tr=0 ts=6aeb12e0 cx=c_pps
 a=o952g1rkoyfyBKhMC2IAFw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=XLAa9chzesY-BITotkoA:9
X-Proofpoint-GUID: fzwc0FrU8V2lCmOQdnTnJo-jNpGmvKCF
X-Proofpoint-ORIG-GUID: fzwc0FrU8V2lCmOQdnTnJo-jNpGmvKCF
X-Proofpoint-Spam-Reason: safe

Remove the gotos from cs35l56_hda_fw_load() to prevent mixing
auto-cleanup and goto-cleanup in the same function. Replace them with
returns and remove the goto cleanup code, as there's no need to "undo"
a cs_dsp_power_up() with a cs_dsp_power_down() here.

Two previous commits added auto-cleanup to cs35l56_hda_fw_load() but
didn't remove the goto, which leaves mixed cleanup and goto.

commit 0ff22680e51f4 ("ALSA: hda/cs35l56: Clean up with
PM_RUNTIME_ACQUIRE*() macros")

commit 185841c94accc ("ALSA: hda: cs35l56: Use auto-cleanup for firmware
loading")

There's actually no need to call cs_dsp_power_down() here. On the
CS35L54/56/57 amps it doesn't control the DSP subsystem power (that is all
managed by the firmware), so it's perfectly safe to just return if there
are any errors after a successful cs_dsp_power_up(). As cs_dsp_power_up()
was successful it is valid to leave cs_dsp in this state, which matches
the state of the hardware.

The two places that cs_dsp_power_down() is called conditionally have been
changed to check the cs_dsp.booted flag, now the fw_patched flag is not
a guaranteed proxy. The booted flag is directly indicating that there has
been a successful cs_dsp_power_up() so this is more correct anyway.

Fixes: 0ff22680e51f4 ("ALSA: hda/cs35l56: Clean up with PM_RUNTIME_ACQUIRE*() macros")
Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/hda/codecs/side-codecs/cs35l56_hda.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/sound/hda/codecs/side-codecs/cs35l56_hda.c b/sound/hda/codecs/side-codecs/cs35l56_hda.c
index bc207ab5b020a..148d760987fdd 100644
--- a/sound/hda/codecs/side-codecs/cs35l56_hda.c
+++ b/sound/hda/codecs/side-codecs/cs35l56_hda.c
@@ -562,7 +562,7 @@ static void cs35l56_hda_fw_load(struct cs35l56_hda *cs35l56)
 	 * downloaded previously then it needs to be powered down so that it
 	 * can be updated.
 	 */
-	if (cs35l56->base.fw_patched)
+	if (cs35l56->cs_dsp.booted)
 		cs_dsp_power_down(&cs35l56->cs_dsp);
 
 	cs35l56->base.fw_patched = false;
@@ -634,7 +634,7 @@ static void cs35l56_hda_fw_load(struct cs35l56_hda *cs35l56)
 		regcache_mark_dirty(cs35l56->base.regmap);
 		ret = cs35l56_wait_for_firmware_boot(&cs35l56->base);
 		if (ret)
-			goto err_powered_up;
+			return;
 
 		regcache_cache_only(cs35l56->base.regmap, false);
 	}
@@ -642,7 +642,7 @@ static void cs35l56_hda_fw_load(struct cs35l56_hda *cs35l56)
 	/* Disable auto-hibernate so that runtime_pm has control */
 	ret = cs35l56_mbox_send(&cs35l56->base, CS35L56_MBOX_CMD_PREVENT_AUTO_HIBERNATE);
 	if (ret)
-		goto err_powered_up;
+		return;
 
 	regcache_sync(cs35l56->base.regmap);
 
@@ -663,10 +663,6 @@ static void cs35l56_hda_fw_load(struct cs35l56_hda *cs35l56)
 		cs_dsp_stop(&cs35l56->cs_dsp);
 
 	cs35l56_log_tuning(&cs35l56->base, &cs35l56->cs_dsp);
-
-err_powered_up:
-	if (!cs35l56->base.fw_patched)
-		cs_dsp_power_down(&cs35l56->cs_dsp);
 }
 
 static void cs35l56_hda_dsp_work(struct work_struct *work)
@@ -814,7 +810,7 @@ static void cs35l56_hda_unbind(struct device *dev, struct device *master, void *
 	debugfs_remove_recursive(cs35l56->debugfs_root);
 #endif
 
-	if (cs35l56->base.fw_patched)
+	if (cs35l56->cs_dsp.booted)
 		cs_dsp_power_down(&cs35l56->cs_dsp);
 
 	comp = hda_component_from_index(parent, cs35l56->index);
-- 
2.47.3

