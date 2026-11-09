Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794245189;
	b=CkAV3akrppUIjUSMgqHQTFvhT8RSVLZprdzmQn1zuTUeXhYaqiTI8/c9h55kcyQiziSs
	 1EjNUHBPPRxN/feoqV4E7Q/0sTdR2YHcDxySkYe7AtSt2w+eQh8n4JR2uGtajtXb3K+QK
	 IyCp6OSmS7+GLhyM9L8jY4kS0Clj6e/GuQao3VjrDLMeR43i1jlWgg9sr+9ayF2k4Pszw
	 fgs3g3mr+V+8IUEQJRTnGmTck6je/m5g3JaOOWtqdUoMgb0aJn7KjAW7XGSJ+NW91ZW9s
	 dW9OimmpkD62q9SfGydlqJW9mR0uJDdGt+jSokxmpWciHaDECdQiNj640zymAqiQgjg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794245189;
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
	bh=ShlMS/HIUiRF6RpRA1DynpWvHPnL3nP64yJux4IBnMo=;
	b=4fshghScI6a0UNqnO1evM5xbhZHWTv3Et/JyDSM/gxPrCdy0X7JxZmpzVBebAv28oaN0
	 p1Nxn97AZPlpTfzUsGIlz4zvXB75Tl5tt7C7OuGsHQgLNm+1PilA4REpI/+uDHwtUbSIp
	 uOzxqIWbT4z1mOSaUUAWkOn1MQWrRXdeJXIHOD4ZdtZhftXpIXUBWxjS2U1SWFaPIXjNJ
	 CS3nkl5XagCRXxs0JbT6iOIUMJng1+k8hyjXQ9FeTK0qKvd80EMDAiyo8IRfcXB8CKP9x
	 XuZll48aYRqj1hdRENZlqSDP1GzC6Zx5aLAAVwnL3y5vHx3c2Bueyk7HJZB7MsAx/Fg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=NqCzR6Yr;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=nV28AY87;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EC66606A31C;
	Mon,  9 Nov 2026 17:26:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6EC66606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=NqCzR6Yr;
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=nV28AY87
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9FJgPc2615299;
	Mon, 9 Nov 2026 11:26:13 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=ShlMS/HIUiRF6RpR
	A1DynpWvHPnL3nP64yJux4IBnMo=; b=NqCzR6Yre1npgiRbW9bBrjzcYpXI3bw2
	OhF0buo/c/QHajNdYO4A1zeRIbzqpBpbJji16cGsCGK2lO69FP76OZ4TpV3YcCjs
	tVswM1BOBb1Rm9ZFIcDfNeoFzrVb315WrN/qiF3Hi/zyTD02jYp0dFISvzR3aFrU
	F4NPnwxlW5jz3oO7InftntOVmp2LuLrgyLeP+jcjnaCtdilGooQdeKcjV4GZO8iL
	AkBuGFI4BUPjTgXmc+DI0fwYgV/xwejbk56PEE3Ww9zZT/xIQkXSRVoMjIQVo5ak
	hjE8ZkBnYaRbnvOJnXm2/uDEkMAccCQywC0fXMpUx342kqlU/jlb7A==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11020081.outbound.protection.outlook.com [52.101.201.81])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4ht29hacra-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 09 Nov 2026 11:26:13 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=STmOYDHfsJHvFiblloGdKGSe7QInqWI1L5L6yDCkb4gqkcax4l7EczZUMhWCezOc7XPjqbBI0AUDzZ2jmCEoUUUymGtA6lb1DftwRExyDaRPdNf4ZUrhMnz83I25f8N44ZX8nKyP9veeJJSl8/V2U4AH21a4feqDHOGgmFB/ryyy2psP+UEj/xKzSY2ws0iMiS/f9uaQVHjex0iDIbbD2M1eXrzsTNrq0wrbnoJiYBhtZOQCHVblt1sMA0Xu9whwCsewnAhvVag8M2PCc1bXqQsP1wGPpf4f/iaIbN/Q+459tAEEdKD7wgjRefQ7zAnaHzyd934/BJxig1JbgqYBBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ShlMS/HIUiRF6RpRA1DynpWvHPnL3nP64yJux4IBnMo=;
 b=iS4GGPAMvZ+TrWo7LTiiUuOLS7HU4K922QT6cakGkIWxXmUnL+1gHKsCmuNA0AC+JntLCxIDjV+Je4RjQa5cqLqnDpxSNzCm2nnqouT+chA3OWSJCk3o4u8EyVDhPZrI6NkSwdptW/Sc5INCqdwXmBuYIml1NTWl76KArUaHIWQBmiZwomoPWqgqeGOLQ8zyRZ2Eupc3Ttwn5yUL6rjoqX0+x1yQqi88g2Y/FXZBhFdXGOSRfN6CTwBbhxeCGokkXutnJnY4jnxlmFeb3Iq5nXcRy8f45/wXQUWdkMWD0ACLX4DwrnPgbW2U5yzYaxyGfddpwHQzCTjwbKn+b/pgMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ShlMS/HIUiRF6RpRA1DynpWvHPnL3nP64yJux4IBnMo=;
 b=nV28AY87zi76CEnORGUpVdLwe4Cbx0JHb/uJMGr7jcXEHSO9YE20keZauLW9XwD/B0WV3+1+6aPlWN1KyS2iGokZ7LghCEEnlwyf+aRLWb4Q1dreGZFRnANNpYD8uvUOievUr57RG8DptNWuBfAlnZabyDO36qjwcVX0R394B2I=
Received: from DM6PR08CA0057.namprd08.prod.outlook.com (2603:10b6:5:1e0::31)
 by DS2PR19MB942025.namprd19.prod.outlook.com (2603:10b6:8:710::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Mon, 9 Nov
 2026 17:26:09 +0000
Received: from DM3PEPF000265B0.namprd02.prod.outlook.com
 (2603:10b6:5:1e0:cafe::43) by DM6PR08CA0057.outlook.office365.com
 (2603:10b6:5:1e0::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.13 via Frontend Transport; Mon, 9
 Nov 2026 17:26:09 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 DM3PEPF000265B0.mail.protection.outlook.com (10.167.23.39) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.4
 via Frontend Transport; Mon, 9 Nov 2026 17:26:08 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 82F2D406552;
	Mon,  9 Nov 2026 17:26:07 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 6748082026C;
	Mon,  9 Nov 2026 17:26:07 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH v4 0/3] Add SoundWire port constraints into SDCA stream
Date: Mon,  9 Nov 2026 17:26:01 +0000
Message-ID: <20261109172604.4077312-1-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: DM3PEPF000265B0:EE_|DS2PR19MB942025:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 4848956c-73e2-423b-469a-08df3e868b18
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|23010399003|376014|61400799027|18002099003|16102099003|10067099003|3023799007|11063799006|261028144727099003|261102123227099003|261022105027099003|261021123027099003|56012099006|261021121427099003|261026140227099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	z6sxETT+BNNnFEA04NrHLoMOT33tfasjooE3iRQthWqkWw/ayoIoqgq127HL7v1m6QOLgaJvzCdpC40JSRDLb+cM9QyChWdnorRYmDMj9n156IDaSjaviGu2D9aNDoVuojiT03ytaR9nXSMei6AqFt1ePxt8dgEDs09C5V2eJuage0suS/2jYWopuaW00vmM+W6PDomCvvA0FJ6uostzzQcrL+zTtcjE3fLIw6twvGTOBhJhcBIZ2GkyzU7w8zLiMw1Yvvpm1HnItRhL2V6DRmUj3hrHjy98iOJZoNwS5PTrU7IzmWzkKzJIGyKjCOKflK5XzZ5kpBCfukDYeDfHvehKhhjVbXZh8RjPJL4bm/d5TycfRFn4zuJNWfFI0fldjt1Ugnikz4lWfwwDSOt8A4iK07T+mRmwCsL8obHj7hptxUrhSPooM86elbXP9lvuXPid1yoE+Goc4bku/Np4d6ze/cI7G3PmJ9klYSf4VVQS9ERADzpIjqv/ruU81j4t6DyWXfIO2YRNhKdrZLcO+kpTtGZ5wbc0jlQktxPimgbHrSLXvxfrT85ywBl+RwyHAjZQ8Jd35XhqoWF+79OZmu1/kIpIwy5/J63uL8n878lSyTem4WaVmkaFxXEWrrYu5YtYuSrM46AoazT6j+QEPAc6IK0tWn/rOwp55RLVq2l4k/8xIgGCsafV+8UIe6fMzuD3Hjvr4H0ArWYLP4LDCw==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(23010399003)(376014)(61400799027)(18002099003)(16102099003)(10067099003)(3023799007)(11063799006)(261028144727099003)(261102123227099003)(261022105027099003)(261021123027099003)(56012099006)(261021121427099003)(261026140227099003)(261009223027099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	iPODRExuLkE/zq+bCKola9n4amSMYOel1ZPIRSaGQOHsyMcYPddKYhnHDLhUSDwV8zZXT4zsCs/npxXikUb3ff30AIM9sA/Si5AycMZHjZgeI15/nIHFggpYljpedi2theEiFN2kGIBr4ipKDqnA9+3A3l7K2xnaSRvujpUaP6M1n4oc1qSm2AVsb1rNZBexzb8PVgTQ5r11mJ51tEGi9UN4H+CJK/PtLoWZT6BDoSTPXb1mdZVjTm2BysoToTz/z+/ICGlrYtui+z27UuG6wmrl5StKXfRTgNHk+t9RxYVJ7OqT6WVxEN1sIHrJ/xJDCS8gHuf0qp1Otn/ILmG/SMylsmAmMPEQIrRvva5PMDiJSADsXWz8ObN2HUH67TiPFW24CGQotp063j1DyhcM5pcz0uLwGztNyaleMjplwQWMtR2XLGDwb9Qi86aakvzp
X-Exchange-RoutingPolicyChecked:
	AOTIQNkcbTtsGrXZmF0n4VfJ0r4YsNAEaPFFslLDwur5dMIG+BTvdd8lQyyx10AMlGveJpH7YULZ3q5jU0cD9ig1RPWY9t+tUupnIqQbaHXRpAAHQLzqCj8WItsqM4DXWUSGU0PVedl/ejXaoOyg5pQcR6zAHD5RbTewMN0m/FrUaJ/D4oxofhSd91lug/WMRbteL7kJpJSEBNlHpwMoiN0cyGJ/RzmBNCTJb0b6XZnBvJhT1+eQxoQAUiqtPRwPigSrjekRHPJgwZYtxF111DP2WkU7C8+ObZiTBc/XLUWLInUiuY7q70pvm8uAnJOBoJ5zA4tpwmQPIhjxO8d6sA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2026 17:26:08.7154
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4848956c-73e2-423b-469a-08df3e868b18
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-DM3PEPF000265B0.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR19MB942025
X-Authority-Analysis: v=2.4 cv=PO2aavqC c=1 sm=1 tr=0 ts=6af20235 cx=c_pps
 a=L67c5INE8ymjFE86/o9Zpw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=zJRp6_cAMcgA:10 a=RWc_ulEos4gA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22 a=T3sSgvYPHZmSsOrUso4A:9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA2OSBTYWx0ZWRfXxSHi28lTmz1v
 LIAj6wOQZsP+d2g8GUedDSBaDhl1F/jiMabfmfT5tlmGsE8nVZrgbGI0TPT2oiUqb11PHsdpsGa
 4HP1PDRvuY31pC68PXyKvc3mLoyJUGo=
X-Proofpoint-GUID: OgTAVHWz2BVuWSvG2JnPyemdyNLFKINQ
X-Proofpoint-ORIG-GUID: OgTAVHWz2BVuWSvG2JnPyemdyNLFKINQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA2OSBTYWx0ZWRfX5fDEAhC4kJ4U
 LepqUEAxx9KNJSQf57VLCUPa+9BRg1647vIm+VVafD7Sq8HddZt00JfQhiryu7GPsg5SHhzfHZE
 5bqjbSUxg/so5d7176EattoRKV4LRgURHFdlc7HhKCiKdaYW4aM8senUEjYEASVPBuutpu9Y9zC
 IuVoO82AxYKb9JBt7KcYrbIhoNd35JL2ihIhPCUwnEKALvZyla4TaeRvOx/TkoijvweFRVHcH0w
 lbz71fLrYI+xi4GNoY1b9qWzmvqSakeaiA2slQoEMAPcDiY0M0y3ROAhDoSC6O1WmF6xaZs7yUM
 AMOWmBko2pL8dPedf07h6ysm63H1tPHV7pGKLHVjZNg4KABI5ufK/MtbqVJLTS7l93CtXLVqw62
 72LWoHoPjvI3buVF9cg9SeTXiweOcyycZiKm9OCSIS06cv6lzRlSfQlZj3noh/NhlUlDGkCeS44
 uKxN8LUQoyu7jo6jPRg==
X-Proofpoint-Spam-Reason: safe

SDCA adds constraints onto the DAI based on the DisCo properties for the
Input/Output Terminal. As the SoundWire port for a Terminal can be
selected it is possible for the SoundWire port to support fewer options
than the Terminal. These patches add the SoundWire port properties into
the constraints for the DAI startup to cover these situations.

Changes since v3:
 - Added defaults for the word length min/max
 - Removed unused static_assert

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
 sound/soc/sdca/sdca_asoc.c           | 246 +++++++++++++++++++++------
 sound/soc/sdca/sdca_class_function.c |   6 +-
 3 files changed, 206 insertions(+), 55 deletions(-)

-- 
2.47.3

