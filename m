Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793977908;
	b=2FDrwq8CMqLqsNjaWkki0wGDE8ut28HTBSJvSq2ySHCQ7ctKuZodnvXY/24izU0Ivar9
	 ryrco9fPoXD7sQ+aC1d7C19i4eS/KqUPJguOmoUI72vDvChY+87NhmkxQyHc2G9nEsWkZ
	 iJk9mnw5R11P0kpL95k5BBcjtDqWnUUpo6UJ0t0JC8lDD+JmkInbXcZdC2hJFZaC7sUp8
	 GQSiHVE862RM+x4pmEpopa0gsPOyMTqu9D9J1SMFk33i9P3GAhtChETyKZDF0tEKK3cFU
	 RngrGIZXX94USeaPuQm3s4EYbxFO34chOSpPi72ClrfwWdHr0rcmjqoPKc1NDJa6JBQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793977908;
	h=DMARC-Filter:Received:DKIM-Signature:Received:DKIM-Signature:
	 Received:Received:X-MS-Exchange-Authentication-Results:Received-SPF:
	 Received:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:Content-Type:
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
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Reason;
	bh=ad8e3v63DvThN5qfpdZwQSPg01MoE4ufvwBRO5Yc9Ec=;
	b=qn5stqd+fklZUB3XaDvoKQZTD+Oh2QGP5vyIetgo+LucqLO3JJ+/meBq9i9nrILna2CN
	 gDmj2mxT/EzJl2NdUs9nIcCZqlSoNWusunb6ugoFZdg9O2jBUAQsF7cbBP4PH31bqZhLR
	 JxtJJL692+4DwJ1l47TUz87z3GjmRKUxr0iAS/pXpTZmvCqjwNm8HrBO0vTglT5Rb1fmt
	 QRV2/03hUtndWmnyQ9wWcehE15k76ycbKDbvP+gIhTV16ZwhHCnyWuvXsn1HjPqtLZTru
	 fOgUXncAYKRBosedWrTUmq3wlVSD/BfoiT2L9NcP5bnJMzG9g3QpBAHXujcEUB4GJQw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=iD0sT6p9;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=BsbnBc+F;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5581606A334;
	Fri,  6 Nov 2026 15:11:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5581606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=iD0sT6p9;
	dkim=pass (1024-bit key, unprotected) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=BsbnBc+F
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5NiHSK2820419;
	Fri, 6 Nov 2026 09:11:37 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=ad8e3v63DvThN5qfpdZwQSPg01MoE4ufvwBRO5Yc9Ec=; b=
	iD0sT6p9MWIXfM3on6YtTlpbJmsbxLaT/0KDGUFwbHr5RZB2HtEm/jqjYuPqPFUJ
	BxP4Qc5gzy9WIjBodHSCOarNhKEa9EIQ8VhDwNYOLWqIS3MP/3UaIHc74RSW3CGa
	b2cnd+P8H0JVT4dgsUWCl/jagcaxzLC/8c+2qg5PlGcIeDNbYY/KjN95RJTzS7i4
	hBHREujkIGTYlQJo2xigs8E+JuR0BPWR033TfmbF3VyCs9J6+XJSN3+vLhILMQJy
	wDjSQQUd1w72bxxjGoILMI0wRaoyDbFDMaBYqREPe/tyTsc9Wl5TflfouSGHl68o
	OTnQn5/02IABdaTpqT9JpA==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11020111.outbound.protection.outlook.com [52.101.85.111])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4hs3qwh25j-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 06 Nov 2026 09:11:37 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wdhW6ZrtGtRkqWavRpIccClMnP/i2aTviubx4kzCQa6/dSrRBz6jJNr5R/7ymqrad6Pg10u2CGB9R7Lp4HXreGsuN2he6foBXPPRT8r5hr3CTI0yW/acYbg5Wtv4uJd9uQ/ydJcY93TYJ4Yr3FEa+R+wMNMiv2wDvcZR19RVwXa5w8PwfW9jZixPR8WNJucoY9hFyh8u3K8eORCLN79YckkCVhC6WMXe4SSERz3/Ckun3Xhm2AhyB4w7DjR8xA2ylSacS/dVbo3ca5W0YrKFMcPzcpA5LfgkmibwKsNGJIdLSyPwFOkVfGLPVbx25GmWSgcFXyprIk1hqRmN05CB0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ad8e3v63DvThN5qfpdZwQSPg01MoE4ufvwBRO5Yc9Ec=;
 b=eexNfyLsG7+7z6yzBmtDfW7Oy8f3ucO24Vy15Ij/nUTTXH+1R2Y0ahhjVae05+nqQSh4o5IHMSg4AXg5s+WL6JSmVR5otyflAJhjx++hj/kOwsa0XbHF2Pxw27tbIHTt+eqlOKmlrJDHmyjsIIwm4yBJ/dtpg7vksEd5EGmznyDjEEpYOLnv6dG7APZRk7X1FN20stz2SpiSK6KRRGQjxHxb+plqPtQOL574z8aFilDCbkQWLLypQmlIkZWi0+J7FBJq57vc5HmqTkPNU/m/0jt+wjI5IGIgEOJOS2t36ZjZGeuBXVpe2rXUZeQDONrMLAnvWsYGU1kjzI9B1j4hNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ad8e3v63DvThN5qfpdZwQSPg01MoE4ufvwBRO5Yc9Ec=;
 b=BsbnBc+F/Ll3vure2M96m5rb82hBmcOUq/nWFihEPkqR4Ce560kwiJnRESVQFmlib4Cc8rfKLiwMEQnq8YG1V2fD2Ec1q4rqsn7Hb0p8pO3KpQ1qhVC7rBUSOShepRqKWWpJsIgiaV/Hee+T4Rl9m6fiD4ezclxOgZ3E3w8GkLw=
Received: from BY1P220CA0050.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:59e::12)
 by BY5PR19MB3795.namprd19.prod.outlook.com (2603:10b6:a03:22e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Fri, 6 Nov
 2026 15:09:32 +0000
Received: from SJ1PEPF00002317.namprd03.prod.outlook.com
 (2603:10b6:a03:59e:cafe::66) by BY1P220CA0050.outlook.office365.com
 (2603:10b6:a03:59e::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.11 via Frontend Transport; Fri, 6
 Nov 2026 15:09:32 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ1PEPF00002317.mail.protection.outlook.com (10.167.242.171) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.4
 via Frontend Transport; Fri, 6 Nov 2026 15:09:31 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id A632340654B;
	Fri,  6 Nov 2026 15:09:29 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 8DC86822561;
	Fri,  6 Nov 2026 15:09:29 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH v2 2/3] ASoC: SDCA: Factor out helper for creating mask of Cluster channels
Date: Fri,  6 Nov 2026 15:09:25 +0000
Message-ID: <20261106150926.2587108-3-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261106150926.2587108-1-ckeepax@opensource.cirrus.com>
References: <20261106150926.2587108-1-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002317:EE_|BY5PR19MB3795:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 05981410-4d1a-407c-0180-08df3c17f5ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700016|61400799027|23010399003|3023799007|10067099003|22082099003|18002099003|16102099003|261102123227099003|261102130727099003|56012099006|261021121427099003|261026140227099003|261028144727099003|261022105027099003|261026121527099003|261009223027099003|11063799006|261021123027099003;
X-Microsoft-Antispam-Message-Info:
	rDUpN9DHBOm46QkczBnuHSgYmF6mUNb3iWCY4QhtnL5Y1DDyZGcD0y6GQMMbyDWb8s+zwDdfQb347LoCeIOm6BqhXZ1WNG3T6JwJfrJL0AcISljXxZad7Rnr7yk2d7Oqz9B4IJzZgYJq6MBYKjfX2DXW5kRNOkfoU0DgPzphEnBAQa4KGpw8YzEQEDtRqGSoOAVix6NhNea8EJnngAecpXCTLn4sumPZ5opAKJe+KrNPAiPb+MFrG4dYcLINbxulU6lDXTFdIfjRWe5EnBS7WzdRYm9CI1bQoSkjBHwHCg3+OsWaICQKnNDOvBsqP03JWAcpLAmVSDJKG3n07lzld2uHS4nY5tSEQ2fgRUwcBO2PvGC6PmHSphCAE2eV9zkK7ebaWLPdtZmcEKibQSdFTSkZXTd8jyxyg8mb3H4sqcbOl7QBvPuuHfGZYR8yx00FBcjrmQgrANcPswFvD8Ioj0RpXgpVcwQOcd0Fzf7BQqYUnngDlde7VmZ3kGYM9c9/c/pBckGnZK3ZwhWRaai00pTly5PbMVU7/4crJ9GGWKV5PhCPk++1Z3NXZDS8AuKR3hgI6I8GrV5Df1pK2WoEm1bDGtm+7+zW1dzidBmVlVqb2FCF8qehMdT5DrOfICs6tGY5ce/m5vnBkXk+SvPAdWs+87FULQUN3p7xq7V3jGqe1t/5uyFEtaUovR3jhLrXmBw3OkLdZ9dX6RO08ab2bQ==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700016)(61400799027)(23010399003)(3023799007)(10067099003)(22082099003)(18002099003)(16102099003)(261102123227099003)(261102130727099003)(56012099006)(261021121427099003)(261026140227099003)(261028144727099003)(261022105027099003)(261026121527099003)(261009223027099003)(11063799006)(261021123027099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	NQkvqH2ZIFLY7U/IbAbEcQ5W/cbVIubPdIau7awjRMe5IG3rFf7JHxeG2pEj/hB5b4fYJfeMXH9vvYBNuGEzHfJb69NuohTE7z3Vna6Byem4ByCk5IyqGSIQ24pwY9m0SziL3jwiVyUKnSG3mYN5EuRhXrpbcm5Kku9kR9OTbE8+PK25S8G8OVOSzKCpYishdHs840gY2nHBdsF2uMFnSj2jd2M4XdwX7PR+e0AVA/lODOQBq9rdgIRwObfk9dVc7RD9TJM3hdCZkdfXqUYKDL6fLMhjpz1+Ht4kuHk58iXpP6/0DRulx2mocqOwIlJDx+ffCkeTj4BCeBQusof6YGYYy9vBHn5ljDpo2HVMbF3uO5MHHq7hfShLnzAylN5avJMGLjFXCc3tPkKvozCOQDFILnYEjU08OrzYPHi1HgqbvvSlDTkKWZfCW/eRJfnP
X-Exchange-RoutingPolicyChecked:
	Tf6ZB5jx+yZxFhn6TaW93dBIOCbLrKF4cEo8AbZqEYJmSwYtm9VEOHmfgoS7w9ZgQUWldlzIbwh4FJZpX1k/tMBjVCOoklIHe/gvcaYjbm3louT0AFO9aCfbvuavr2e5FwS68qy3Iy2iF1IhYjmPMzTO/8WbaefgMK3Drb5p+r35X93AFsc8u15ZydgCpIM5xKJzAQbJGEukR83CHJkXWlPwxhrmtbleq5TXg6kox2p4KB+6QH33xxN9jmR596yX+SA05DVatmZguViqLFb8m70E/FRcS/433X2+WhhavYhb6xo2NQn0X2aXGJlfaVXRoxujRnQISxLER6bNkdagVg==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 15:09:31.4517
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 05981410-4d1a-407c-0180-08df3c17f5ec
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ1PEPF00002317.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR19MB3795
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA2MCBTYWx0ZWRfXxaJIKcmqlcOs
 hFi73V9L15qD89mLefLenhXl/itG60rW/ViqXNfWjj9sI9f0kc8F4svcEXNGup8jTgpVkRmT5Wf
 uBtBqq1+206Gm/bcg0E6PX3mLvoJ+0I=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA2MCBTYWx0ZWRfXzWB/LauFTHuB
 fCGG+9/CXtJulHhMFEUtSoLS5iu2Qi3kzGj8YDGGNTQIefyzF8uPNpSysFXJcQo6ODP7m/gfL6I
 mNHIe2bHRr1nJK5WoZ8JlISe8OQezkm6fCmsIkH1f0ueHdUYqs3rLXKwAu1fxk+gqPYnYemmdr9
 ZwTTzWHRAxmzRDWi91oYgy8dlVwo2rxvRIP7Kg3AaLC4HN7qi61TYRlFecYz0HQ0pP1g0LQ946f
 9pCYjKHv7jnmONurRg/2ciy+9tkr9PBMoRnxYm/QMd0iKQN1IfIYbtJLpr13SwcJh8kOv9BwoFp
 p7H9T0jMvUE9Qp/DkL0u8jL4gnEScUoNMZOAtnaDMzcJocnIjn+0oqHGwfFXIioTSQrmL6w/2hF
 fPoVieLzSD7+uMUVGV+15fxf9HRJIq4SlQjFbZfbi7sW2N3Jqr4+DTbV15ZjhrFAv33Q54XkAFs
 skO9Xkf2e7zyJPb51Gg==
X-Authority-Analysis: v=2.4 cv=K5K3jCWI c=1 sm=1 tr=0 ts=6aedee29 cx=c_pps
 a=gqicNGlIziG2whwb7etjew==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=oHLFO8r6Pw0-5CqiDFUA:9
X-Proofpoint-ORIG-GUID: R7CRy-wjY_NKsUlpjEl_hs7HSX2QZBCu
X-Proofpoint-GUID: R7CRy-wjY_NKsUlpjEl_hs7HSX2QZBCu
X-Proofpoint-Spam-Reason: safe

Factor out the code that builds a mask of the allowed channels from the
Cluster information. This is slightly cleaner and prepares for
additional constraints to be added to sdca_asoc_set_constraints().

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

Changes since v1:
 - Use BIT macro for the channel mask
 - Some minor knock on changes from the new first patch in the series.

 sound/soc/sdca/sdca_asoc.c | 64 +++++++++++++++++++++++---------------
 1 file changed, 39 insertions(+), 25 deletions(-)

diff --git a/sound/soc/sdca/sdca_asoc.c b/sound/soc/sdca/sdca_asoc.c
index b8bde56298706..be1b4c0075796 100644
--- a/sound/soc/sdca/sdca_asoc.c
+++ b/sound/soc/sdca/sdca_asoc.c
@@ -1476,6 +1476,37 @@ int sdca_asoc_free_constraints(struct snd_soc_dai *dai)
 }
 EXPORT_SYMBOL_NS(sdca_asoc_free_constraints, "SND_SOC_SDCA");
 
+static int get_cluster_mask(struct device *dev, struct sdca_function_data *function,
+			    struct sdca_entity *entity, unsigned int *ch_mask)
+{
+	struct sdca_control_range *range;
+	struct sdca_control *control;
+	int i;
+
+	control = sdca_selector_find_control(dev, entity, SDCA_CTL_IT_CLUSTERINDEX);
+	if (!control)
+		return -EINVAL;
+
+	range = sdca_control_find_range(dev, entity, control, SDCA_CLUSTER_NCOLS, 0);
+	if (!range)
+		return -EINVAL;
+
+	*ch_mask = 0;
+
+	for (i = 0; i < range->rows; i++) {
+		int clusterid = sdca_range(range, SDCA_CLUSTER_CLUSTERID, i);
+		struct sdca_cluster *cluster;
+
+		cluster = sdca_id_find_cluster(dev, function, clusterid);
+		if (!cluster)
+			return -ENODEV;
+
+		*ch_mask |= BIT(cluster->num_channels - 1);
+	}
+
+	return 0;
+}
+
 /**
  * sdca_asoc_set_constraints - constrain channels available on a DAI
  * @dev: Pointer to the device, used for error messages.
@@ -1499,42 +1530,25 @@ int sdca_asoc_set_constraints(struct device *dev, struct regmap *regmap,
 	};
 	struct sdca_asoc_constraints *constraints = snd_soc_dai_to_priv(dai);
 	struct sdca_entity *entity = &function->entities[dai->id];
-	struct sdca_control_range *range;
-	struct sdca_control *control;
-	unsigned int channel_mask = 0;
-	int i, ret;
+	unsigned int cluster_ch_mask;
+	int ret;
 
 	static_assert(ARRAY_SIZE(channel_list) == SDCA_MAX_CHANNEL_COUNT);
-	static_assert(sizeof(channel_mask) * BITS_PER_BYTE >= SDCA_MAX_CHANNEL_COUNT);
+	static_assert(sizeof(cluster_ch_mask) * BITS_PER_BYTE >= SDCA_MAX_CHANNEL_COUNT);
 
 	if (entity->type != SDCA_ENTITY_TYPE_IT)
 		return 0;
 
-	control = sdca_selector_find_control(dev, entity, SDCA_CTL_IT_CLUSTERINDEX);
-	if (!control)
-		return -EINVAL;
-
-	range = sdca_control_find_range(dev, entity, control, SDCA_CLUSTER_NCOLS, 0);
-	if (!range)
-		return -EINVAL;
-
-	for (i = 0; i < range->rows; i++) {
-		int clusterid = sdca_range(range, SDCA_CLUSTER_CLUSTERID, i);
-		struct sdca_cluster *cluster;
-
-		cluster = sdca_id_find_cluster(dev, function, clusterid);
-		if (!cluster)
-			return -ENODEV;
-
-		channel_mask |= (1 << (cluster->num_channels - 1));
-	}
+	ret = get_cluster_mask(dev, function, entity, &cluster_ch_mask);
+	if (ret)
+		return ret;
 
 	dev_dbg(dev, "%s: set channel constraint mask: %#x\n",
-		entity->label, channel_mask);
+		entity->label, cluster_ch_mask);
 
 	constraints->channels.count = ARRAY_SIZE(channel_list);
 	constraints->channels.list = channel_list;
-	constraints->channels.mask = channel_mask;
+	constraints->channels.mask = cluster_ch_mask;
 
 	ret = snd_pcm_hw_constraint_list(substream->runtime, 0,
 					 SNDRV_PCM_HW_PARAM_CHANNELS,
-- 
2.47.3

