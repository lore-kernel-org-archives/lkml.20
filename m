Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792504726;
	b=qRtqjYm1tU0J60B8GqHIKvcvOSokyV+cu3kUNoeBQOOtXubHklQzgqqKfYHxvQLqgtZk
	 LW8/2qgu8uBqzp5aieHusGaQr40Qh3x0BH8We5LLVQdfdhZdygKi2GXG4PcyI18Hn2PgO
	 /L6fLzSbzKIeX7NCv0cbXcs/HGxgLehpIxkD/amuyEvXZKyL24/y3K4mpw2TjPyY10OHY
	 CA2Ofb6wV//bjS4wc4BkelCHWE/LJ0J9GTYbZkSxT+Fliru2aAqICWtQzg5SC/cVisyPo
	 jrq1kQNSUR/DHUdbwyYPgEWY8/BojTRexKeM+0MKOXCSwWUw795YP68IyEs7DXVES+A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792504726;
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
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Reason;
	bh=6i0iPghWtOPgzd0ac8wZPRevnpSqMIi4Vuz2w0ik68E=;
	b=5JwZfSE6e5H8WBKy6Fny+1H9zdqpmDOxmQ7IAIJQU9gUKIo4fDtZ6uJLh3LCaaVHFxpv
	 Mkp+jdlUqWFSBbW6jO3ez/2Ac24a9T4DwP4j5Mo3TGwynMlmL3EGRiJTtACE8ZD2Exmub
	 hO0HimQL5/wOpZioGA216DzWN/eupsIqoAE4tTqoCZhMpACgREb01sYlIEFREgXF9yamF
	 7ESz2C3rSpdlt5H+FxcS8XVQV9YqKEmlJrVsn61VMj1sUNhn2uI++T52H2i2F6FaMsNZM
	 UuIFdGcbYKMxQJ1JsO20dYgmMoQADDwyh2eylHJderwj62TlquEN5TWOTW9faYbSi9w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=oEvIzNik;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b="egbgfyp/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 380FC606A319;
	Tue, 20 Oct 2026 13:58:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 380FC606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=oEvIzNik;
	dkim=pass (1024-bit key, unprotected) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=egbgfyp/
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KDhkRI2127436;
	Tue, 20 Oct 2026 08:58:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=6i0iPghWtOPgzd0a
	c8wZPRevnpSqMIi4Vuz2w0ik68E=; b=oEvIzNikpx7AkElKV2FBqZFNKUgPNlRn
	GeD3PsQp8rQGRIRmod/yWXENrYpcs7ic89kW+q3ZFJv4NQe9k/VyU2NRm7Oz+XC/
	m6lDNJWUxD2osZitp0SrupsfyLnXughgaXBlZKsTBKozfcxxq0mFr1VWdK50dDKW
	5pOKxbf6qseuS62VqR8Z2aYd56Zx4JQoLm/FZmDnkCcsLSe6XFZYvh2I2t4VFLp7
	GXBkEk/rQ6GNeCnSFc6Ilu36K8O+5HulhvsGFglWZ4ZLKH+IUBNaaKnDhKQTZVKS
	qBqPBGC7xQvB8B7nViFF1dRtobB635Ww/3eggWILe+2ic+CaS7XwuA==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11020131.outbound.protection.outlook.com [52.101.46.131])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4hdw5b0xk0-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 20 Oct 2026 08:58:43 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bT8rW5As/m1mMDfJqT1DD8gj2V+wBVa0QYFJGsxRh57V2gnUpJQ+NQJG1PJbd0XQgpXBU6tH3Sc/8IxBQwrMjmu5qXe7ajy+rwT3+/XNTW50tbRH77mngoBrMTAziL37j/+s79DMgPhhByhqoX05B7Gz5FIRyB5Art0rMWmBpHyJ+9Z+vBaVHv/Scj8AiSP3AY6S6e2RO4TAUk60Nv2TMig41CPJa9FQlpS5Kcf5St+1cXxRLunEAfqVnyR5lx7l084jaV6aID5MzpAgEVI74RpdA/DTqoZvTKy5NrvTEzYNTdpioJwz3EbvgiANkKTuD/utaXAUGvnc2HS/Kbcfkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6i0iPghWtOPgzd0ac8wZPRevnpSqMIi4Vuz2w0ik68E=;
 b=yvinreYUcvIbnT5Rc1An7u9MFQKXd2NKjA4JmcH1OrPl4u9OZKf81mg06muinVlL+mGv3GfBJ2icbpdKGAGHSQWRzoP0ZXucY/z8QyXGvLKHwhWXKRN82jOZ/L/4vkMKeFz5Xk3hSHRrtrnQuEiIyN8msbyG11DkqE2J6DA8yThuLT1vLVC6w9jXfAOLxVmamJjwxI+lldG7PoFWC7XHo5oPskrkEqmWZeqaijRJ+XOS/pytFddwcHiRzNsLYi8GWzg3BIQIzam/FLpVFoxKE45OOU/q2Qz98l8dSEvhTtgucmLJum/ZZof1eiDMh8zSKmfP1+bTGta7qHHiGrMfUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6i0iPghWtOPgzd0ac8wZPRevnpSqMIi4Vuz2w0ik68E=;
 b=egbgfyp/MyMh7n/8vicrVwpNxQOZtl8PUQ0L3N94KzZI1H27l0E+Lt6pIr6guCoCd6aqS4fVlmR5pVazYu7nHqK2prRnjgRiZqEKo18tRQOTciNelJrWWKSBxdr7DQ4FRe7m16/FKEcfBBNJ0fSg9ZyTy0q/N1n4Xp3E/YUGXsI=
Received: from CH0P223CA0015.NAMP223.PROD.OUTLOOK.COM (2603:10b6:610:116::33)
 by BL4PR19MB8959.namprd19.prod.outlook.com (2603:10b6:208:590::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Tue, 20 Oct
 2026 13:57:09 +0000
Received: from CH1PEPF0005BD5F.namprd02.prod.outlook.com
 (2603:10b6:610:116:cafe::a0) by CH0P223CA0015.outlook.office365.com
 (2603:10b6:610:116::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.20 via Frontend Transport; Tue,
 20 Oct 2026 13:57:09 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CH1PEPF0005BD5F.mail.protection.outlook.com (10.167.244.248) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.15
 via Frontend Transport; Tue, 20 Oct 2026 13:57:08 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 98E04406541;
	Tue, 20 Oct 2026 13:57:07 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.11])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 762E682024C;
	Tue, 20 Oct 2026 13:57:07 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH RESEND] ASoC: cs35l56: Wait for firmware timer expiry before system suspend
Date: Tue, 20 Oct 2026 14:57:06 +0100
Message-ID: <20261020135706.3573260-1-rf@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0005BD5F:EE_|BL4PR19MB8959:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: b8f63f97-eb58-4673-01cf-08df2eb20842
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|82310400026|30052699003|61400799027|23010399003|10067099003|16102099003|18002099003|13003099007|261009221227099003|11063799006|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	89XFTcJMtLL3auVrpOSGLilhczrWjsQ5owU/JaqIB4doEU6FrTPoRQa/LGZ+aBCKcpJ/ERmgruHsRCYDqX5q3rBuy2D+tjLpv/HTYipAf1v1Yr1eu/Y1HSj8aaMRnCN2SGtk8H6BVku/93NFupYkDyH2t25Wo6iHI9cLnpPETAE4qIyW7lhqTUOkZXMnFfnrWB8T4BQB7oWAFc8F8J2CkikeXXG7OR9VvctBXDOguvdvHVp15CKpJWZ5tJsIEVQbwuMUGW7ZpDGBu5avpUt8EHPbEfW8mL83N1EaOFQQEqiJ531dboeHG4dkC6LKSx36kgVef4sIm7S2f5nH1+CcxV4I23ZuL295RsxN/fih9ulGP9slkSna706fmvTxcafqYh7s1JrV8qLYttVbjU9BFBgTRwk8lWN2F9spvH9YiIBNOo8PlIIMq1KrV7pDJ/8HL8IYhDXbQGbffZyFRzQY+17VegxwWpiurRZBz1bems9ESZ1RhjDijLW2rzrh4HhxuRN/KESPzd+192nfbl7LIn9fcnzArZGJppf40pdH4gmBmP7nVU1SSodHIyr7Y86jSbTxa5OdraH7yqvlZ38D2U0cEZF8EAEqv9+qJfsmdSVf4dEH5LfaGLbqAML9xIBVMvUyDHudN6Y/I07FXOJxjN21zJYIMwGRYnAc7vLwYHs9HhEfAVyuEA8Eunv4IzVn4JqYEBpM+lN9l9QxMzYhcw==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(82310400026)(30052699003)(61400799027)(23010399003)(10067099003)(16102099003)(18002099003)(13003099007)(261009221227099003)(11063799006)(261009223027099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	BpS/ZUkrae9psWPB4hBY90ts6crFyBaGV2at51HZC92TGVa14cOzhZgFNGWrm/bhb2dT1Yz7mYQx4bTWHqkV7eNIirFKhD+6bmuX7JopkPhGv7copiMSmqOMaORMYZJieEsFHjZeCGw1EShejSudt/KyPVWhM8CyJWkZ2jMWCqkwpORJBVi1xuuaZ18ZYP1HB8nVB7VVxNVxQUuD3Op0+NJXBbuzzvflYXwLw4oo6TF916IT4J0wVl+0AoYFTXXK20T6kp+c05tdfsCoFyaOOJVLOxnykFmYM9z/yqkcScV0fKBsW9E8X0MXZd5gfryN+2nn0RqlA557h2LqqaSe0jhs6dmgY+P0F7dJ0KN4w6/EM8M0LvRUR8xT/yz1ingEYV+Pm8xaDk9xUh1KZ1hR8AQ6Yb5OgaDbW837u/uzol1UVJyVjklkHb9IfDm989GM
X-Exchange-RoutingPolicyChecked:
	r986gnG5eepsTvZp2Aa2+pgVgFsHBFHaot6TcxZ5Mq3RiBER5hw+3RvBlG1QwAz01+lD+vceJEMAb6ile03mwbm5UrhJOIybuyvF4oE6S4BZMjLpCpYZfOaD1Pqx+4Xbhl9Lz9Y090KEe8/MfMNnijk/62KphGq69/vlTb55cv7frQT8hPvRHLJC9jxMjsV+LxjI9VAXMo/l3+0QkuHKY5aNcePcFBLiCkXeH8v2TxGDBVQN+egrR10MvXewYKAP8dJznfDLuMqsAZjRMgo9PTjJ5rpqJvRFui2UR8mLXUN0o+6NGrTffaCuHJ8Vm+q05QBP2/mnrSrwTr4dByQ3dQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2026 13:57:08.5142
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b8f63f97-eb58-4673-01cf-08df2eb20842
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH1PEPF0005BD5F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR19MB8959
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA1NSBTYWx0ZWRfX534G+/1ZZauw
 5roQCQu6yd8jkTntB+7N2ibDeMWj38NGZPDNnKWskSbIfiCfTnutmteXpQaNIt0/tJ5kFTQzYwz
 74weufz0Qv0vsUwvr5369gkt1tfOCyw=
X-Proofpoint-GUID: mNBAEcCsDuqkAQO_PviwdKR38PREFjTQ
X-Authority-Analysis: v=2.4 cv=HOlWhYtv c=1 sm=1 tr=0 ts=6ad77393 cx=c_pps
 a=mJ7H1brUzsHLkRhawgXoow==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=660iZSQnnn4A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=NEAV23lmAAAA:8 a=pGLkceISAAAA:8 a=w1d2syhTAAAA:8 a=gLF0VLlozB8U7pJmJxsA:9
X-Proofpoint-ORIG-GUID: mNBAEcCsDuqkAQO_PviwdKR38PREFjTQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA1NSBTYWx0ZWRfXwOj59KNYa/3q
 yFd4hdmCyYkJsWx93ToyPR601QFF9SLiMZjl+huAGHUSKDCIJjPga/F57uySJk9XIYqTMbYps8M
 99XGx66sIQk5HOYl6WsvW6ckMGR+bQjJ/LOnig4U4MiTxwe3y7OiyvNg+J74urT0UxI2WKDZPmA
 CqhVFAmSVtK3UMQi/Q342s/ldcyNbIX5tdfx+ly3j/tNkcajWAFTimsAI059paYuRWcohrCxeG6
 MxK6/PEkjizzxdMujFTv5hhN/WJD8S/lerHi32z+kyBdzhXZxw78sNRFMROfLu8IIPHGQZhKG+o
 2pA2jfzyaWJuXLFjMx1eAyjeXA79uASFBV9tZXRAAcimLYW3vO1sh4QxHc7aJNunwfy7YxhOUcL
 oHNMUH0Mr7udw8/QvzYhJUMs2I+yHLW0YndyKoHOpUy6svuIQJoKduF4SShXLOWafLBMZsxsCcl
 1qrusUYsTK4tYp/2CNQ==
X-Proofpoint-Spam-Reason: safe

On CS35L5x firmware older than 3.13.7 (B0 silicon) and 4.7.16 (B2 silicon)
a SoundWire bus reset is not allowed within 250ms of the last firmware
timer start.

This is already avoided during runtime suspend by the various idle
timeouts. System suspend can happen at any time so needs special
protection. The driver cannot cancel the firmware timer, so it must wait
long enough for the timer to expire.

The delay is placed in the suspend stage because typically this has less
impact on end users than delays in resuming. The amp is in PS3 power
state when suspending and no new timers will be started in this state.
An extra 10ms is added to the delay to avoid a race on the exact instant
the firmware timer expires.

There is no need to have the delay for every driver instance. The timers
on each amp will expire in parallel, so the delay is only needed once.
A global flag is used so that the first instance to reach its suspend()
callback will delay and then clear the flag. The cs35l56_fw_idle_wait_lock
mutex is to ensure this is still safe if async_suspend was ever enabled
for SoundWire devices.

Fixes: e496112529006 ("ASoC: cs35l56: Add driver for Cirrus Logic CS35L56")
Reported-by: Ferenc Lengyel <leferi99@gmail.com>
Closes: https://github.com/thesofproject/linux/issues/5898
Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 include/sound/cs35l56.h           |  4 ++++
 sound/soc/codecs/cs35l56-sdw.c    | 27 +++++++++++++++++++++-
 sound/soc/codecs/cs35l56-shared.c | 38 +++++++++++++++++++++++++++++++
 sound/soc/codecs/cs35l56.c        | 17 ++++++++++++++
 sound/soc/codecs/cs35l56.h        |  1 +
 5 files changed, 86 insertions(+), 1 deletion(-)

diff --git a/include/sound/cs35l56.h b/include/sound/cs35l56.h
index 747e10ec1a274..ce6383c2c60cc 100644
--- a/include/sound/cs35l56.h
+++ b/include/sound/cs35l56.h
@@ -209,6 +209,9 @@ struct snd_ctl_elem_value;
 
 #define CS35L56_GPIO_FN_GPIO				0x00000001
 
+/* DSP1_FW_VER */
+#define CS35L56_FW_MAIN_VERSION_MASK			GENMASK(19, 0)
+
 /* Mixer input sources */
 #define CS35L56_INPUT_SRC_NONE				0x00
 #define CS35L56_INPUT_SRC_ASP1RX1			0x08
@@ -446,6 +449,7 @@ int cs35l56_cal_set_status_get(struct cs35l56_base *cs35l56_base,
 int cs35l56_read_prot_status(struct cs35l56_base *cs35l56_base,
 			     bool *fw_missing, unsigned int *fw_version);
 void cs35l56_warn_if_firmware_missing(struct cs35l56_base *cs35l56_base);
+bool cs35l56_needs_wait_for_firmware_timer_expiry(struct cs35l56_base *cs35l56_base);
 void cs35l56_log_tuning(struct cs35l56_base *cs35l56_base, struct cs_dsp *cs_dsp);
 int cs35l56_hw_init(struct cs35l56_base *cs35l56_base);
 int cs35l56_get_speaker_id(struct cs35l56_base *cs35l56_base);
diff --git a/sound/soc/codecs/cs35l56-sdw.c b/sound/soc/codecs/cs35l56-sdw.c
index e10f04d677f4d..a49ad69644b5a 100644
--- a/sound/soc/codecs/cs35l56-sdw.c
+++ b/sound/soc/codecs/cs35l56-sdw.c
@@ -9,6 +9,7 @@
 #include <linux/device.h>
 #include <linux/err.h>
 #include <linux/module.h>
+#include <linux/mutex.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 #include <linux/soundwire/sdw.h>
@@ -36,6 +37,9 @@
 #define CS35L56_LATE_READ_POLL_US	10
 #define CS35L56_LATE_READ_TIMEOUT_US	1000
 
+static DEFINE_MUTEX(cs35l56_fw_idle_wait_lock);
+static bool cs35l56_fw_idle_wait_pending;
+
 static int cs35l56_sdw_poll_mem_status(struct sdw_slave *peripheral,
 				       unsigned int mask,
 				       unsigned int match)
@@ -387,14 +391,34 @@ static int __maybe_unused cs35l56_sdw_runtime_resume(struct device *dev)
 	return 0;
 }
 
+static int cs35l56_sdw_system_suspend_prepare(struct device *dev)
+{
+	cs35l56_fw_idle_wait_pending = true;
+
+	return 0;
+}
+
 static int __maybe_unused cs35l56_sdw_system_suspend(struct device *dev)
 {
 	struct cs35l56_private *cs35l56 = dev_get_drvdata(dev);
+	int ret;
 
 	if (cs35l56->sdw_attached)
 		cs35l56_mask_soundwire_interrupts(cs35l56);
 
-	return cs35l56_system_suspend(dev);
+	ret = cs35l56_system_suspend(dev);
+	if (ret < 0)
+		return ret;
+
+	scoped_guard(mutex, &cs35l56_fw_idle_wait_lock) {
+		if (cs35l56_fw_idle_wait_pending && cs35l56->needs_wait_for_fw_idle) {
+			dev_dbg(cs35l56->base.dev, "Wait for FW timer expiry\n");
+			msleep(CS35L56_FW_REQ_ACTIVE_TIMEOUT_MS + 10);
+			cs35l56_fw_idle_wait_pending = false;
+		}
+	}
+
+	return 0;
 }
 
 static int cs35l56_sdw_probe(struct sdw_slave *peripheral, const struct sdw_device_id *id)
@@ -460,6 +484,7 @@ static void cs35l56_sdw_remove(struct sdw_slave *peripheral)
 }
 
 static const struct dev_pm_ops cs35l56_sdw_pm = {
+	.prepare = cs35l56_sdw_system_suspend_prepare,
 	SET_RUNTIME_PM_OPS(cs35l56_sdw_runtime_suspend, cs35l56_sdw_runtime_resume, NULL)
 	SYSTEM_SLEEP_PM_OPS(cs35l56_sdw_system_suspend, cs35l56_system_resume)
 	LATE_SYSTEM_SLEEP_PM_OPS(cs35l56_system_suspend_late, cs35l56_system_resume_early)
diff --git a/sound/soc/codecs/cs35l56-shared.c b/sound/soc/codecs/cs35l56-shared.c
index 7b3e37d462d61..b37f65cd4d336 100644
--- a/sound/soc/codecs/cs35l56-shared.c
+++ b/sound/soc/codecs/cs35l56-shared.c
@@ -1379,6 +1379,44 @@ void cs35l56_warn_if_firmware_missing(struct cs35l56_base *cs35l56_base)
 }
 EXPORT_SYMBOL_NS_GPL(cs35l56_warn_if_firmware_missing, "SND_SOC_CS35L56_SHARED");
 
+bool cs35l56_needs_wait_for_firmware_timer_expiry(struct cs35l56_base *cs35l56_base)
+{
+	unsigned int fw_ver;
+	bool prot_sts;
+	int ret;
+
+	switch (cs35l56_base->type) {
+	case 0x54:
+	case 0x56:
+	case 0x57:
+		switch (cs35l56_base->rev) {
+		case 0xb0:
+			ret = cs35l56_read_prot_status(cs35l56_base, &prot_sts, &fw_ver);
+			if (ret)
+				return true;
+
+			if ((fw_ver & CS35L56_FW_MAIN_VERSION_MASK) < 0x30d07)
+				return true;
+
+			return false;
+		case 0xb2:
+			ret = cs35l56_read_prot_status(cs35l56_base, &prot_sts, &fw_ver);
+			if (ret)
+				return true;
+
+			if ((fw_ver & CS35L56_FW_MAIN_VERSION_MASK) < 0x40710)
+				return true;
+
+			return false;
+		default:
+			return false;
+		}
+	default:
+		return false;
+	}
+}
+EXPORT_SYMBOL_NS_GPL(cs35l56_needs_wait_for_firmware_timer_expiry, "SND_SOC_CS35L56_SHARED");
+
 void cs35l56_log_tuning(struct cs35l56_base *cs35l56_base, struct cs_dsp *cs_dsp)
 {
 	__be32 pid, sid, tid;
diff --git a/sound/soc/codecs/cs35l56.c b/sound/soc/codecs/cs35l56.c
index dd264c310e1eb..a4d25c2879413 100644
--- a/sound/soc/codecs/cs35l56.c
+++ b/sound/soc/codecs/cs35l56.c
@@ -1703,6 +1703,10 @@ int cs35l56_system_resume(struct device *dev)
 
 	dev_dbg(dev, "system_resume\n");
 
+	/* Assume the firmware reset to default until we can check it */
+	if (cs35l56->base.init_done)
+		cs35l56->needs_wait_for_fw_idle = true;
+
 	/*
 	 * We might have done a hard reset or the CS35L56 was power-cycled
 	 * so wait for control port to be ready.
@@ -1717,6 +1721,16 @@ int cs35l56_system_resume(struct device *dev)
 	if (ret)
 		return ret;
 
+	if (cs35l56->sdw_peripheral && cs35l56->base.init_done) {
+		ret = pm_runtime_resume_and_get(cs35l56->base.dev);
+		if (ret < 0)
+			return ret;
+
+		cs35l56->needs_wait_for_fw_idle =
+			cs35l56_needs_wait_for_firmware_timer_expiry(&cs35l56->base);
+		pm_runtime_put_autosuspend(cs35l56->base.dev);
+	}
+
 	/* Firmware won't have been loaded if the component hasn't probed */
 	if (!cs35l56->component)
 		return 0;
@@ -2241,6 +2255,9 @@ int cs35l56_init(struct cs35l56_private *cs35l56)
 	if (ret)
 		return dev_err_probe(cs35l56->base.dev, ret, "Failed to write ASP1_CONTROL3\n");
 
+	cs35l56->needs_wait_for_fw_idle =
+		cs35l56_needs_wait_for_firmware_timer_expiry(&cs35l56->base);
+
 	cs35l56->base.init_done = true;
 	complete_all(&cs35l56->init_completion);
 
diff --git a/sound/soc/codecs/cs35l56.h b/sound/soc/codecs/cs35l56.h
index f7cf8aa653e28..b46f410f0e093 100644
--- a/sound/soc/codecs/cs35l56.h
+++ b/sound/soc/codecs/cs35l56.h
@@ -43,6 +43,7 @@ struct cs35l56_private {
 	bool soft_resetting;
 	bool sdw_attached;
 	bool component_registered;
+	bool needs_wait_for_fw_idle;
 	struct completion init_completion;
 
 	int speaker_id;
-- 
2.47.3

