Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793977227;
	b=ArFiHqoM2kZPAckz07rISXYFPWlogRgubWI8utPZlYsMIWFP2CjYuhOUtKsWckfCZmhG
	 6tXmHMc1EGhHVsdj6pb/5b0mB6vEUXLoHA0xdWAjFJ9SQVwaRN2YKColgWWSPJ5Gxt459
	 pcmGBhbnWqVoQTZVQdnjysFVKfuPc6Rifsrg+u9QOndSob6TSi/9d1iIjQuzVXN2vLf7h
	 ENkkMx2UF12YaCuogUYiPfZ3cWkHorrcMPlCZjSl5b915Xrnwac10olTg23rKdUlhGUMv
	 ZgRquOSNlUy/ZZ2++EtibSDgAtd+iun3QpK8AreByh3WOiRkOohxZh03+TevtSph0HA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793977227;
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
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Reason;
	bh=yF1Z84tiCZf1y3NfyE2HhSdgMIHSOTSVa++LRXR2TEA=;
	b=RnnohdEeXRqwou1iKVuBGFM6bYdZvOcZ0BHA2p62GghledE4VcRCGCw8GB+gr4L9aas6
	 TeVS8D8g1qSRIf7g9IskSw+PBYGbH2eEzcFI8lpqPMsC2ESwRGl267AkPXH+/G96Ae6PN
	 KTJdGIE4rOqovXbhXW6lbWgnIYm0wOj9oqF4K+6TQ2OGHKB8InF0wPqQdJg0FkftSC3Kv
	 mdBTciJCoEozZdV+raj3GHRbpu9Aaqe/5yq/wppy+kxCW3IER4bMnKEm8ZduHREkWQRRz
	 LQsLiAPulZ/P7AQvnpZuWsPCfyUZ5gFlzjbKK7qdDGIlYEN17j/47EgbO8I7ZKBkU3A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=Ycksqhg2;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=C7rfaEjS;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6282606A326;
	Fri,  6 Nov 2026 15:00:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6282606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=Ycksqhg2;
	dkim=pass (1024-bit key, unprotected) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=C7rfaEjS
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6CweXb3855554;
	Fri, 6 Nov 2026 09:00:13 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=yF1Z84tiCZf1y3Nf
	yE2HhSdgMIHSOTSVa++LRXR2TEA=; b=Ycksqhg2T50CAGm2py2TClSQKOWY9wQR
	Z3LJTs3c1W7FMjGChoUkXZU0y/izuYYEoyQUnQKsqka4Himkgo2S7e1e3+yZDYpC
	b4F7hTuPCO9qi+00Mz3bDOJK8RzmRAnz+mOgd53fpopmm8YxdrPSPCXaimPGow50
	U/8QMlOYcY2htwHKDobr1hQmK/iJWF9sSg8j+03bIieN4WOe4AxcVFp7glzIRhYL
	/AKM9hztL4c3VViM1TevDvSrzMPgNiB6MV2BvfMpDaFRq5Rk84t3bCdDnLN2rAPD
	WNK7d0zAxoPZKwJkDlID3slvgMkn7+4XoXSwZCjVRC742Wfjg/9B+Q==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11020101.outbound.protection.outlook.com [52.101.85.101])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4hs3rb0wxr-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 06 Nov 2026 09:00:13 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CBjvKkSivALbF9xzFGzogledYSKZYXtrvSvcKDa7AqmYoj2tzeztm63t0qBRkoa/yZ5h2brbJgI0ucJnjHitmV5xOI51Dsi0VGTgu55+ll2T3leLSYrD1JF3eDLtw90pMzuWvzEREWpZspD5ekBohir6lsnXb7SeHxT1jCA+wfppbn0jk56L8JGaGoByaJRGAwYJ8aXnvB6l1DBcfhMAJtNc1x425V5/kFYAoILwq0yaIZgk1PtiRMcIBkRW51wvaFvYJn6Wpm+4pIqQNPlH6HEzVQjqwvrkdax+KHhCiGc+nwxkZHWg0Zl+Y5JNtuWEWx7BAXJBiU4nxIn96QwJvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yF1Z84tiCZf1y3NfyE2HhSdgMIHSOTSVa++LRXR2TEA=;
 b=fWkN3IHg2AaU6Sd9TmTElOn7tLzk9DUdbGlJo1dTtl57kLtjnIJM4SgP2hSE2K7vAlMPl59dJQ/1R4b12/U8QjzLuOSJ7gOCm7vXkcojYJxEYznVl7q3VEMOXyhKItoXJSFi3DYCqTVZfvYo/Nho1RgxsDwDxp/Sb0VqsEHdmdr+CdKBvcamfTI+pVB0G5nDDhkbPistHy5+tCzKrPq3WniK/f8RZoiO8K0NYgFibbbJfeW0wJ7WkA7osmjn43BRXX7/jTZa9wO4Mgp4FHlCJf6Ww22Z0ze1AtWKUyIJZdlaAORtMUKIZ/iG20j0MG5KoGJaaPK28j1zeSJxPi/4wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yF1Z84tiCZf1y3NfyE2HhSdgMIHSOTSVa++LRXR2TEA=;
 b=C7rfaEjSluPsnJDWwb2yfOv1uoYLIgZ6k8xCs21ly6dHqxf4kui2dFJmOvYw4w/OKJNe9hseH6T5jhqHCa/ujTFe1ijx4zpwLGkiDAyDKAAsHbcGvJY8Y+LJXqWEBZ2cZxQ+xrYRFMgmFgQ7UKovisX9zpL8TZzk/dYTlJG6YS4=
Received: from CH2PR14CA0032.namprd14.prod.outlook.com (2603:10b6:610:56::12)
 by IA1PR19MB8978.namprd19.prod.outlook.com (2603:10b6:208:593::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Fri, 6 Nov
 2026 15:00:07 +0000
Received: from BL2PEPF000352CD.namprd02.prod.outlook.com
 (2603:10b6:610:56:cafe::4c) by CH2PR14CA0032.outlook.office365.com
 (2603:10b6:610:56::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.11 via Frontend Transport; Fri, 6
 Nov 2026 15:00:07 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BL2PEPF000352CD.mail.protection.outlook.com (10.167.249.135) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.4
 via Frontend Transport; Fri, 6 Nov 2026 15:00:06 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 2BBA640654B;
	Fri,  6 Nov 2026 15:00:06 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.11])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 1BCF7820273;
	Fri,  6 Nov 2026 15:00:06 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH] firmware: cs_dsp: Replace the obscure "invalid magic" messages
Date: Fri,  6 Nov 2026 15:00:05 +0000
Message-ID: <20261106150005.2051611-1-rf@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: BL2PEPF000352CD:EE_|IA1PR19MB8978:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 27d56942-1483-4b92-1284-08df3c16a562
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|61400799027|23010399003|376014|18002099003|16102099003|10067099003|11063799006|261102123227099003|261022115727099003|261021121427099003|261021123027099003|56012099006|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	ouxdwsCpB0rQqNiiSIoTFpMcCtwoPuuyNa0gpq2dyCIvTKAVKMbDc1K7B84b+G+CBOa30r8xLupBCJ55JrBRlUSlKVAZEfch8HOZNfbYkOdbvrMDONcCocXe7Uha1a6OVFnqQ2u5tjucbEcVYYWjjv5hoZjDI/mCwdPfZzwxCNH0fjD8leQ9DLt5VUO0Io6XqoAeCdIfHIapBMQvOR+4AE3uo7LNrC4sAqs2LHGTzBLAveAcUr83th4ekl1Y5spQwX/ZDZyjr95lK/qLQX/Zt22kIVm4gZSDWll7OBIiiCMxc+q2MfGeXxQWwFylIThfkLWMCi+S8uu8TX2/PJXrdmWXTEAlhsg8zU6qTbJROZw0PuYYI/cxBPR7ZB4wbZd2xCuwavvJQEhhkfNGQQaCrXoEXFDYC1ui3xvsb+6bXljjtYk2C/0Q2nR6P5gUyPw7RgyUHaUm+eIslwaGAJbQ67P4AC7Jhb/hk6KsigPTEKBhwXqA/7p8FILvlgPeRdC2UNU6c3Ma7ar96oJvWmd2kVvlHJ7Nj/2uJldV8WzwDf3YhDCV145T1Gun7gc9i4y3UUUXRa5MvMV9o/pTi5gzE9dCJKRZhfPEjEBdQfn5fMvbKc20p2mgJFtht1IRPT/hO1wgwUhrWaDa4yCYcLqjFY8QrzRX0sZfc/hZp0Tb0I2U0SAfKw3zjfKFQHm5cpgWMZLYNCb86dU3P0m9TbX1bQ==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(61400799027)(23010399003)(376014)(18002099003)(16102099003)(10067099003)(11063799006)(261102123227099003)(261022115727099003)(261021121427099003)(261021123027099003)(56012099006)(261009223027099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	dz2BK9r7vckc1O6dhC2oEHTzcDfko8DV/ldxgr0UDux5LTM9kLSTGazHScaFHInkRd3CLH2qKYC+Why9hBDV+ZtCSYi6sTfOdQlqJHMji6N0t9rTpsSO+xS3j22pOFnZiBAqdGD2kBOIaCDfQmXzyXoldsHmaxBEKyDfDmswhiEQeeXdVREGIPmA/wSrHdD04kzldSQE6fExwI3zfLqZsORUvsqvJ9dmi8fzYdR6WlG9tb6CvHWUq08XqkEz0vJPgSzWlL5N0K9Ragiymz4eol7wdEiF+Lgluepo11XbtMbYrIOGPXNEvwPcveqcDjPDPa4uMOul5i2yseErfwZcpLqUlS/EzVVooAFNHQ6gBtZ1BPYdGSeLCGBB4guc+S8eo78iBdEZNZ55rGrAGEulO6rStV0OuglMTOB2La+6eK88qWfrX2mtoBSMarVLUmIB
X-Exchange-RoutingPolicyChecked:
	WSumxQ9lavu/Eci5pChKsYeRi3dGbxKyg39i3Z8rPIgNJa6oyjwKvni/dO/bVb8Ykvb57AGSatKTynsVFoHhJofoFe8gJriNtyB2q8RUMQFSS2Q+g82t5RpOLC9kfO2eI53SPMJatawRkCj/AC0MOp0T9mgOOyfbV91lvKLLsPRmGiFUyWgQAqVTVwlnCjVjjFN9xWfZgmWKZCWKy/8KtKO5dkQaqas9U+7/GynjZVTuDynNYZS/IWpWwE8qQSN2Zp7nSXeGwEqOlMROuRmyJ6I6rWZjMdXcsF/fOE/gGGxMsVymkc+TfsX9SKDmzXzXO9GFOq/nJFogGIPzyN+C6Q==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 15:00:06.9457
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 27d56942-1483-4b92-1284-08df3c16a562
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BL2PEPF000352CD.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR19MB8978
X-Authority-Analysis: v=2.4 cv=G6aJgNk5 c=1 sm=1 tr=0 ts=6aedeb7d cx=c_pps
 a=kPg5dDEhcxiqFsFFPyJETw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=8o8tRBDh3VHvQGrq4qsA:9
X-Proofpoint-GUID: ygrFnt1Kk8Zd4EoMa93JID0eqzsrnMxR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA1OSBTYWx0ZWRfX3RhSbcGtVtDH
 3+DOtHJM020G5btWaByrawIT9pTDBAQGJFPJSE4qBCJM0t+N79JiADVZS584wqUVLZhEkIbQpKu
 MxS40tVvrXYvwXsj0PSyi9ZK+yL3WoPrF49DUO9SuZ1hjNOQ8aTRvlx/g//xe/RgEWCsVL6T2Bb
 AnYSeDeRQbySCmI+kjJ9/DL2prY8Q+pg8qO1G7mdrTpfc8R5vWRcOdScjqfaz9GvtTJOYicSLnP
 Bq/hkvaBJkd6+NJ2qjn+9PDcQzbus3xW+rPjl0UadZGMHURPatuxs+TotO5Rt+g0X82hwuc5flq
 lPCuZUK3B1dHTZvFtZokXs/bCgEXNfWYoeIlcSsGRneTBDl3cxc8TfGe4GKZuFRKL9Ql/9Jo5LI
 5A/3HXL7VPnGmOL+yvKZWo/LDIMDVNEygI/WYTTHpWi+xN9ldfUua1DT+kvgO1NssbrVqUEEb1w
 2OI2jffMrLkCs+6P5ug==
X-Proofpoint-ORIG-GUID: ygrFnt1Kk8Zd4EoMa93JID0eqzsrnMxR
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA1OSBTYWx0ZWRfX2mK0X0yq6RIT
 mjvXsU8dZCjR5JfM+TeOGSGvy5/YxRKHO0BWWjB9iJnIhGSiHli2+OtWurOE99VPodtHIqiCJQM
 2nwn+6f+/A+z0h4jIk0NfF8aPYQlMOE=
X-Proofpoint-Spam-Reason: safe

Replace the obscure "invalid magic" messages with messages that say what
the actual problem is: the file is not the expected type.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 drivers/firmware/cirrus/cs_dsp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/cirrus/cs_dsp.c b/drivers/firmware/cirrus/cs_dsp.c
index 4dcce87685d3..a7e2a4fb0894 100644
--- a/drivers/firmware/cirrus/cs_dsp.c
+++ b/drivers/firmware/cirrus/cs_dsp.c
@@ -1551,7 +1551,7 @@ static int cs_dsp_load(struct cs_dsp *dsp, const struct firmware *firmware,
 	header = (void *)&firmware->data[0];
 
 	if (memcmp(&header->magic[0], "WMFW", 4) != 0) {
-		cs_dsp_err(dsp, "%s: invalid magic\n", file);
+		cs_dsp_err(dsp, "%s: not a WMFW file\n", file);
 		goto out_fw;
 	}
 
@@ -2243,7 +2243,7 @@ static int cs_dsp_load_coeff(struct cs_dsp *dsp, const struct firmware *firmware
 
 	hdr = (void *)&firmware->data[0];
 	if (memcmp(hdr->magic, "WMDR", 4) != 0) {
-		cs_dsp_err(dsp, "%s: invalid coefficient magic\n", file);
+		cs_dsp_err(dsp, "%s: not a WMDR file\n", file);
 		goto out_fw;
 	}
 
-- 
2.47.3

