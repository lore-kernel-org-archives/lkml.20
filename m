Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794239539;
	b=YQBijVehlDaBldjMLp2Gxoj1pDh2/xmW6wsQ99socdgqjSXvyqDDOB3fMiXzohY1tkKo
	 lz6O77mSEfd/pypJY4vQOcDTqu05h7yl/xevK0Frw26XcGHWLe62KBiKzk+jGNgX2ejsH
	 WPsZ/exC5LFGoiOvhtgYHkt+U9CVoZXh0jEeqoOvicPMpskKgofAmnVFRGkIUaB4+Z5KR
	 69Kn1m4dI2HolmRpy5i4dm8PQ9sr0rR+nJOyDPOi8YjtDmYPUioiv8W/54pZyi8nWeBgV
	 Y/PKNbcMrHy2Il/oJttNJxVHYMREKI+chwXK63uWq1XL3/Mr/A7mGJWDloI5/DyfEUQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794239539;
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
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Reason;
	bh=W4EgzgtminKuit5Bh/r5vVh8BDpcNKGOTRw8+6MPpVk=;
	b=EQhJdkctgSk1D1wbpMhlxnQSvlgxnRxvYYrvsdE6C6QQXhLHoG2/4lsdr5PZXDjdv5Hi
	 8TI3Fbri6ZPLDaRSNCa/YuoEjohM9rdsfwaw0VKLUO/wf0wNR/80z5tj2JSMV3w86OnlJ
	 s0XBuPuSiis355+b0tCBz90dUSBd3VqiIOy3Y6laRfoynH41g8wHYRobeZbGozSYKNso0
	 p0J/KMDgSI+5MdiNJzswbg44toGh/2NigJbSvIU64ETrlE+VGGbcC3NGmrEwB7ms/fKAj
	 mnuvvTs4JVMMc93e6KWZgiuEkJsbXZh4k1631SFgy6pIBDfOl4CpeuashLOpolB5QMA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b="h0sVj+3/";
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=HDKSjMA0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAE0B606A31C;
	Mon,  9 Nov 2026 15:52:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BAE0B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=h0sVj+3/;
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=HDKSjMA0
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9FbxA92645932;
	Mon, 9 Nov 2026 09:52:12 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=W4EgzgtminKuit5B
	h/r5vVh8BDpcNKGOTRw8+6MPpVk=; b=h0sVj+3/ZP4DtjtDtQUHQzl3aR0cmEGv
	E6054XwN4C17R1Lk1NqLshmCuzVwRkzBr6AGf/3S5ASt0KYwj7cMgv1/HVVCmlPO
	SMjkaID3AjCi5i73QRsPcbxcilDtJNYx8XYio6MhIi4BhG6FQHGDVAUSbpae/WZj
	WQXsGEPb8fgCOmVDhX0Vm/M3DAkkGLuYNyFZKZCYJec183uV1V96lFOwxnzuvya4
	GdVjwV6GRMDhU+2lWvp177XPJutnYH2cNpZE0EhzQCJXWR/a532w2cLjeFs5pQfR
	UE4u33LQ9Yi53EoY8vQicJyZH5mMYWIVbfJy3DcoJYKsK/crwggt1w==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11020128.outbound.protection.outlook.com [52.101.61.128])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4ht29ha84y-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 09 Nov 2026 09:52:11 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dLoxO5GcqZi5oRmdhokafMpfqyW7T2ICEHycB5fgPc3/effqj40l5I2RDjDvwKiWDlUggoDaDvY75npyBjlbkCloGvwHg7zG+kvYfhA+7H8r8odJPbJFR5jNlH0Ie5pBmbh/dheQyosbOMrve4z8UJlge6D1m1IWJ6Hd/AMedoWsdJzCquJ50iA6PaMF6DLxnW9+2xzTOQwLu+oPfKmu7cFWhxMtf8CoM6qr1Me3MCJPTjUQ170ym6pSq/DL7Olo81/xMTtxMXyuXks70CPh79o8M/Vg45OiUiDmdzWw5SLLwqsNR238SIdrS5Ff6dSl4HlwdHM+9m2m+jIf6LWzLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W4EgzgtminKuit5Bh/r5vVh8BDpcNKGOTRw8+6MPpVk=;
 b=x1EPJkIXYUoET/Do8srxOIiFRLIjySpXqgkAhoqUGT/hxnh0Zgcg4I5x7r4DnHBHzyFotT1rISsHdLCgzn/suSjADSYnpO0NAiqJV7A/8YXKNROO8lkQafZhlOcnzqI1/tJ5SEtg2VfyGu4SmJKIuq04LNkqiwtPPas/SlRQwxsFvsQPidloRx8rgD+eHkmkh12JboUQUeCUIwaKLHKeLN7xdTg3mW+aDZ1PNA08WzlgkZ5984udMDs+GZx4OOWv3fUOsqFPq7srB7pGD/WggCHGQz10/YuRd62x7xy61nMzMcd0xWFVCDpUlKi/jV4ZFCEFRngA+B6oipxNoWH4mA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W4EgzgtminKuit5Bh/r5vVh8BDpcNKGOTRw8+6MPpVk=;
 b=HDKSjMA0wfuKroJWbdJlhqAQxpXFf3COrPNE2T5IXr9MzuXaBOJtmpvNJNMKp96G/MF3P5znXuSAucn5Jlb4sRwP6xV1MsE9dBkldtKrX0XAoToDvunGK7pYscPH1AisuI7KI9VP1e9yQPA5Rn2Voov+7URtShOz87RcpCq5Mdg=
Received: from PH7P220CA0174.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:33b::21)
 by CH8PR19MB137164.namprd19.prod.outlook.com (2603:10b6:610:31c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Mon, 9 Nov
 2026 15:51:13 +0000
Received: from BY1PEPF000264B0.namprd02.prod.outlook.com
 (2603:10b6:510:33b:cafe::a7) by PH7P220CA0174.outlook.office365.com
 (2603:10b6:510:33b::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.13 via Frontend Transport; Mon, 9
 Nov 2026 15:51:13 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BY1PEPF000264B0.mail.protection.outlook.com (10.167.242.119) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.4
 via Frontend Transport; Mon, 9 Nov 2026 15:51:12 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id AA9B540654F;
	Mon,  9 Nov 2026 15:51:10 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 8DDA9820273;
	Mon,  9 Nov 2026 15:51:10 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH v3 0/3] Add SoundWire port constraints into SDCA stream
Date: Mon,  9 Nov 2026 15:51:03 +0000
Message-ID: <20261109155106.3727597-1-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: BY1PEPF000264B0:EE_|CH8PR19MB137164:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 6c61bfd7-4254-4a1b-83ed-08df3e7947df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|23010399003|376014|61400799027|16102099003|18002099003|10067099003|3023799007|11063799006|261102123227099003|261022105027099003|56012099006|261021123027099003|261021121427099003|261026140227099003|261028144727099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	OXFz5Z9prv7k471uI9Dl0wadVjsZziC9Rm3GS6H9B1wsK0Y7hknF9bgqRsSEq6BaZ6ruLyzUpo1jh7fg5EI/G6ItXSZ9z7NdQb1mA0eGCw3V0Ilp1YDThrNs7/hS27VMErYnvAmO7dNaSNzsfqW/rMmYUDXbYBYSg8t/QA3/R6WjITGWA2wGPcVhDf27V38iogt4ns3G2HbWujnKsVcKIWaTah7Ezz+xJmK6ZzSm7d3UJ09St3uPBrEBC1zuRrDndI7NiAgU55ZGbipAHSW0tr3a35u9wMJW7pB86DIc+6Ut7r7/zN8rLzqmruGuDdvGA8CmN463nOxe7Sb4KkqSRP6UEptGQS1P5yQMtou8OvJu5SfM7Ajktttc1gepV7NY98QrfPsvP2I9EOIz06WjI7JmaAos3uvahskpjZx3z9Q3weaTv5abeEMHpX5tD62TrUz2RAl++lCaQLzdLYv0pY8IX9vB7NeU9yjUeY6yaUYxASzyswdlOjt9fDbOq5mEBPrzgOdIml4ykM2Z+DzO37hiPJB6KWO+eGMj/8J2vzbiZ8YK4OTTzoMt6FJCMH3urzelYDzkl3LW7z4nBxsUsyRs0d2p5P83EuztgPBWc0/OX7rYyjvSV7Q19Z5wMSacJlPnrrSMwkhUFZ933JSYspyL/DRwJbaZgICutVHhFaRZLpqR65/7oiD/ccTBdZ3w2ODE4IbgI35GyI7DChG/8A==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(23010399003)(376014)(61400799027)(16102099003)(18002099003)(10067099003)(3023799007)(11063799006)(261102123227099003)(261022105027099003)(56012099006)(261021123027099003)(261021121427099003)(261026140227099003)(261028144727099003)(261009223027099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	d4UEAh2U+91oReD8Ufh9DDR0X62aCaa4SguuaYylr7o+mLdG/qkGJc3CeKcsgmcI2DEc9rPKHud9nT2sj7q4COe3r0dP0QMW4f11o7SduZ5yqU54PkrFuxAeKhywq1y6TImdQhMWy+QFFvaUkFlE2PjQLuDGqgTg3Z3+0617FckwwhB01LxJDJcdd7cioXTWPOc0cwlb3i+Q+jBnWdYqfgrw9zmMeegdRKC65X0r+2DQkQW0URsxBUNcEE7Ih7puEJ//hESMGOQVpDY+Nhc4+Q5911SuoJS7CBZuFfngbQB90Ok+EZ/3urFTZSm4oHKM/lroE9RIUZGx6ff14DQe1gz0FeVWQg4h20MNWrgkZos/Z9ftVTA6f0t9Y9Zl8AcmifjaOQb1BJ6x8L3iCM9MRQqbWm4/NYYtgUNCpJztioQNDY8PC3B+c7ydxFMFMqCM
X-Exchange-RoutingPolicyChecked:
	FnecQWztlzAEaXQgzC6aGM5Mv8yDfBMfpBL9ozUsXYDWiQRqIZ9FegFg+ebxASmZjZ89Jued2553y+w9XopEQw0VeOJbVRV2Wo7qJb7S4rJ2aBcaw2frWLB+K00SsG0qehm84IvHEN2B0BImmw2CJwgg5oNFBBPNTinR8kY5oIexuaMQLTloQu7w8x3ldbp216xbKOE1ikCeqNDQe+O7MuS+iTRSfs2WFeGXggvZ7qcrY/Mx3xq/vpoqFVJ5uQWbz5CCxQFt3R+9uKr5AZoiPth5WGCCwXWvuyhr4tetpQTbI/Ng5Ab7tOnKWyXU8qYsMgVyhA8Kp3m+20iKor7WVg==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2026 15:51:12.4510
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c61bfd7-4254-4a1b-83ed-08df3e7947df
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BY1PEPF000264B0.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR19MB137164
X-Authority-Analysis: v=2.4 cv=PO2aavqC c=1 sm=1 tr=0 ts=6af1ec2b cx=c_pps
 a=8h7WK4dQWB09CNKj11a7yw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=T3sSgvYPHZmSsOrUso4A:9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA2MiBTYWx0ZWRfX6SCMYEAmsSww
 qAV8CG8yjBOo2HYRCvIGSdmJOGukarnxSDpVuW+oox37utkDSMQEz+5EYaZIeYQanUeig8Y6Q9E
 MimiRKov1YzZzrwy+NcOZQOhCC3SerM=
X-Proofpoint-GUID: U1D05w-vbI6T039z72UIAllp4Y7_-WDG
X-Proofpoint-ORIG-GUID: U1D05w-vbI6T039z72UIAllp4Y7_-WDG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA2MiBTYWx0ZWRfX7jmEELHfkfaN
 IiWz62cEdzyn+bNY2Kx+/EHmxWdtcag7VciASYODBaemQQJcAYVcB4uKGSC5YMaTXomGyGThD7+
 H1axgF/KmUE3n6QN56b9UPxW3mIx3Hd+Bd5sx15MMIxx9p8NhKRWTb/vsTPL3+6qRZ36q2pDgM0
 SdD89giFjTSkxpg0xrt8kD5+VerUElP6qqGf7nI9ITgMDLQapqDj9MJp3yJzLBaE1syvMwGjt0C
 cF8OnIjtIxI46uRwtR1zs6/jecwUwkb5LvTHvIXSDXDZR3uqIj8raY9a5Hy7v08p3nXz7GSNDXg
 fTWkk2qxGavuXQSpAlncg2MgoxS9qMXnR0MTYFtLlKmejqqqZJZRWlfRSMSCQ4BJGgXGPES5oKT
 uPn4kcudZpBuGYbiEjvDAo/C5VpWl8XEzzg78G/3iEBoXhQwDsw+qTYliTiDNTVrepuA+EvG7rG
 ++OUu3gDWREYwKECXLQ==
X-Proofpoint-Spam-Reason: safe

SDCA adds constraints onto the DAI based on the DisCo properties for the
Input/Output Terminal. As the SoundWire port for a Terminal can be
selected it is possible for the SoundWire port to support fewer options
than the Terminal. These patches add the SoundWire port properties into
the constraints for the DAI startup to cover these situations.

Changes since v2:
 - Add check for ending up with a zero mask for channels
 - Switch to using SNDRV_PCM_HW_PARAM_FORMAT, rather than SAMPLE_BITS

Changes since v1:
 - Move constraint allocation to DAI probe/remove
 - Use BIT macro where appropriate
 - Correct GENMASK usage
 - Add missing array indexing
 - Correct channel masking
 - Reorder the priority of SDCA properties
 - Handle the case of the word length not being specified
 - Add a static_assert to check the constraint array is large enough for
   the word length mask

Charles Keepax (3):
  ASoC: SDCA: Move DAI constraint allocation
  ASoC: SDCA: Factor out helper for creating mask of Cluster channels
  ASoC: SDCA: Add port constraints into sdca_asoc_set_constraints()

 include/sound/sdca_asoc.h            |   9 +-
 sound/soc/sdca/sdca_asoc.c           | 242 +++++++++++++++++++++------
 sound/soc/sdca/sdca_class_function.c |   6 +-
 3 files changed, 202 insertions(+), 55 deletions(-)

-- 
2.47.3

