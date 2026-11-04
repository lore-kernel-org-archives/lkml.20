Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793795035;
	b=ditr3CtypDheeUTa6J6xphfEBMfOuJNVLauw1YGOn4uP/v/DqtblLU9z+clrCtM9weGe
	 6HbEZRo5DrG4JMbSwnIzhkS21pa6AwKFfmP0QDxDj7fLHpLUSusRnbO9nvwRk6XuJUP4W
	 zgtlP93JLbKTzwzhcf+/W7ERNodheYZiddZxmwp7RwPzY1F88zb3GdKfW2ws2ewjT1JBj
	 DJAgRoNKWFdEhLqB3mpRH0Hs/ed+r9IA28/L908AL7khOYXtdFMvecSkVbd7NMDbQ9rot
	 d2xo2JZruyM41DtAOmAbWme7HiwI6LGcKAGlJ+SWA2J59hdKfU7k8ZS7EqRJGnbi+zA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793795035;
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
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Reason;
	bh=+lmcAkWCpT/aVLSC1pKevazqlEX9JzhBJYQspZFRAEg=;
	b=t7OX9oSQjgO3m5e9mGTiP9ytwGUPYWeu/YuwnYZA8H8+Aoz7RaLRUmAcfcbkZULhDIQi
	 sf8C8JWRHW9mMIqOzIFayUhvgDuz9n/83tuj6SXe+ckSydsxGKbQ6Kt7AvIyiUUm0/pMD
	 bbX8nzBV9KSlzi6knlVpSG9OqzAik9EW2jxWCR4ZOA4wgBfLLixLyWSmVMsu7+HLDCrTH
	 /7ZdLmiFKI3CqPnWv1YxaD8NtDtjF+PX03ejL0n+giadK/gQSLoOuIwV7VTxVxWlIT2+B
	 p8a6D0I9Z9UjeUW1G6Cg9fY1RsHqRtHlz6d09pHIhs//TqGsZoDbzGS0U8tc0hgLEwg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=TVtqQhlr;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=PQKLbHxz;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99F68606A32C;
	Wed,  4 Nov 2026 12:23:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99F68606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=TVtqQhlr;
	dkim=pass (1024-bit key, unprotected) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=PQKLbHxz
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4C7KXV3315494;
	Wed, 4 Nov 2026 06:23:46 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=+lmcAkWCpT/aVLSC
	1pKevazqlEX9JzhBJYQspZFRAEg=; b=TVtqQhlrI3ix6HUCFHcUdmjNGGUruXeR
	0523DzDQ1vgm+T+kGlgAot/StkwPutdx5kVEcIOrhrf1o+j6KvjAD95vEdVGjiWl
	0riNTsFKCAQ5gHFMyo9/Gu9jRMnDM/wQ3OKLQMsxRV0kmfVKA+MBgiQ6b0cTHU42
	0XKs5XP0lNivyOoUSgHE1nR6WVDYQ2eKZXABFASbKipF4XUGjXz+lE3HgC43q2zz
	8UD8OzbprtTrNpoP/bTyhyOam7Dfh9e7ojZsi4SaTRSBvXghGiSKXEbAQACDEzNF
	qNWqay5fedt5O9myAPtDAcHVKH2Abf8103jBPkg6nszse0iWUOMR4w==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11021097.outbound.protection.outlook.com [52.101.52.97])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4hndrfd5ch-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 04 Nov 2026 06:23:46 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cY8TgoXEdiS/Jqt6LcS9pgkbMYkaTZq/0JvmpeXrPuOo12l3cPxaVNl2tX7OhKOjz87FnvNncImGDJMb/VhcrsNFG2xpu2CgHoOw/Peh6uS0TcwAmR7pXMefuNO+wM0ioykgRwLcvyE915wUmTW8hs8Bxo2UkTk1iYevVExBWZTIQcC/X7CoJfjdpi2WTqO7P5qhv/J+9Yt5YyYotb0I9s9nxiKbaIwYcAG5asasQbOH06zqP5EwWYikc/zVEMlwgZEhxjTHzgW5H5FC4iGpDJb2efHoqHnTpyH1nZWd6ZSbyN4OcT3pCAX4bfeNWxUwqKkbKsxHprMrSdiG+CN6mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+lmcAkWCpT/aVLSC1pKevazqlEX9JzhBJYQspZFRAEg=;
 b=no0zSCGupHxvoBWLMK0742F+WNxRGmqQikxh6f4VruL/AYGwutZa6oKJ20X686Wm7Ciun1BHaIeGg43NtgvVhHoOZt+o7Q5iGxcaG+W8gj6DPRc1muftCsGnXZWzV88VpoYB1MPC2AhPeKGYnYfIz9EE6VOv20kBKM3i11dxHSjqaaRt+RFkYFroTMcB+hdd0t3CeDieedqu0fJJXVaS/qR7O34YYqjOwj4KMtYngdhaJpwidm29ifC+6OdhYTjMhIhCN4G4WZCiCLj7aJ8t9GGazAvJNEuh8ZACxHRLBkEAeEZphB1V4gBhWTT7pyXJmnWuZfJ5N77ghTZpdmyp+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+lmcAkWCpT/aVLSC1pKevazqlEX9JzhBJYQspZFRAEg=;
 b=PQKLbHxzKPTTrnSd95J9yP2Uq1bn8BRXNPuT6/ErS4JAhIHiIXHlU+QEGgOue6sok52wVeIP4sB6HyP3euvZ/9Tut8LmzyzbDdXdfQ3r5euJjQK6ltUK1E+om1ckRY5q8xTYqT4t8T5Vc6RJRR1+FpHR5ELlWxq7eWpPnxLW1Vg=
Received: from PH8PR20CA0018.namprd20.prod.outlook.com (2603:10b6:510:23c::28)
 by CY5PR19MB6339.namprd19.prod.outlook.com (2603:10b6:930:21::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Wed, 4 Nov 2026
 12:23:40 +0000
Received: from PH4PEPF0000B60E.namprd21.prod.outlook.com
 (2603:10b6:510:23c:cafe::9c) by PH8PR20CA0018.outlook.office365.com
 (2603:10b6:510:23c::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Wed, 4
 Nov 2026 12:23:40 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 PH4PEPF0000B60E.mail.protection.outlook.com (10.167.243.89) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.0
 via Frontend Transport; Wed, 4 Nov 2026 12:23:39 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id A618D406544;
	Wed,  4 Nov 2026 12:23:37 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.11])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 88712820273;
	Wed,  4 Nov 2026 12:23:37 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: tiwai@suse.com
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH] ALSA: hda: cs35l56: Stop cs_dsp before calling cs_dsp_power_down()
Date: Wed,  4 Nov 2026 12:23:37 +0000
Message-ID: <20261104122337.1072468-1-rf@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: PH4PEPF0000B60E:EE_|CY5PR19MB6339:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 49378afb-2634-42fc-9d84-08df3a6e7506
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|82310400026|23010399003|61400799027|18002099003|10067099003|16102099003|56012099006|261022105027099003|11063799006|261028144727099003|261102123227099003|261026121527099003|261021121427099003|261009223027099003|261026140227099003;
X-Microsoft-Antispam-Message-Info:
	qPfLLz+IVtLOYJUvmZ/1PLU3iWstZO/cJk0Vh/T3lUvoXEiVoW29+VAJ75IW05+KQAmNWoGpF4BCi9qJvuNOUGh13nvS6i5a1dk4+wdeVf8l9qjFzxHrP3oGn67IZ8f9nFq4FSVaxy55YnhdocV5A0duGlUHRrzGW3j0BFeD5136QcQUPA4D5nsgD7czoZujtUnBvA3hi8xvB/d19HPwr5QasEQit1IQJLg/RrdkJI3gn6rt5+GH7XVkWu6Q7vHtZBiayFbqcv32Ay97Jv0+FxWl3awSCeG2cqnj6FHyJXD2tis1cdIKJ/BM+b1B8RBdC2m8K109X1OEtf+okB5W09upPUWI02dLbqkNVi35ydIlVZgAeDwf22yUQKkKPDIuq6RbY1U4APP2Xc6OgcZ2RrJ3TO/4eHPxT84hAv7p6DbcamBNHFms4pvxEf1jykhpdUDWuTjinKEU781gK5rvs9bNxE978WipkMxD5nXgXXHuXp9dvAuhse3SuZAUzVd9k2ChdMSBQ5o4HWwpbo4ovsvA+k0EpY51fwJomXT+H+MSbuOonJD7L9sjBQe7GRuXujb03Zhmgr5rqg7YZPivmyP9WBhesfdwTKdc4JuNWTh5BLABmJyb9XomT/ohi20K/YIOLWOVMNCSaoTkFBgbYrO7mrOKq3HMrZNO5IVv2db2t5rqk8FR+bkt/BfG7xXUaTdUArIgcw6F1PnxunDxNg==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(82310400026)(23010399003)(61400799027)(18002099003)(10067099003)(16102099003)(56012099006)(261022105027099003)(11063799006)(261028144727099003)(261102123227099003)(261026121527099003)(261021121427099003)(261009223027099003)(261026140227099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	kjJS8RWWySKl7nXvsDuf7SyWrO4eE0Zi5wyD+4gm8vxAJkmGkSw0fk95hEH4MSaFm7vRqEaenFfMN8PVuoA0o3+PUL4UIGbesVSK4FUT6r7rm/e0bbT/aR0p+NnIBtIgjzhFZxj6fuOJTl+PEkHLICF7ElQDnj2uS2mt1woonZ4nFdLYaLjiQaL2EDBPJ8iCrp2OA88VfCLuSn0Ku17cVgsvgg/1OYuyenlEtLgvthQe8z7b6D9dwtHg+NyDYqsuG8aEUDv4Jx9YDdS1Z8qwX1zsLNAm7MyT8g1xAbYAVsYGt7Gu1KlDJL9i82kZR0vX/OprpQL+IJfESiap+5UfinuU5BeROXwcLud1A4WUkbN0ntQ9BF8U4bDU4p5T77WOADDgGQcaNOZsJ3exFGoRLOCzvrFac7stED+SlAlB+mhW7BFsUC/oLbvcEutAcdHQ
X-Exchange-RoutingPolicyChecked:
	e/7TsIAHe8S5Q1QYKnHYNutNLk51AXNbwzay4wpTO4whDFS3OYcsqKisjkduNoTK7kSm/q5HPjdFwJrv3fuFDBUEpsx5HxeSz1RCpx410GmV9O0W+Z0htQnAiL4Ljhep8zwTsW2g5oo5Vj2esc1nJipRB6R9DCMMwFArlIRvqBpJSNJKyCJi/vFQFp9hTNsMEilrIHeQgRJFOiw3ssA/Rk5HTPdX76kQ0UTK/abzGS4lUSMLqlamSoBWx9AoGqF7TGavYTZwm4QccUr002lylZ/YCcWkQ31XYMTwNUv0mVq+ZVprXhikeEYLlBT9A8HrZwRPWK/Xs9EAQByZBylyrQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 12:23:39.0810
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 49378afb-2634-42fc-9d84-08df3a6e7506
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-PH4PEPF0000B60E.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR19MB6339
X-Proofpoint-GUID: MRdFAHBGcZ8QU44CFcgw9gNWRMiMFae8
X-Authority-Analysis: v=2.4 cv=HMRWhYtv c=1 sm=1 tr=0 ts=6aeb23d2 cx=c_pps
 a=is7RXpa33aREoC4jGqxG7A==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=o-kdSdbC3fNsenE9wQsA:9
X-Proofpoint-ORIG-GUID: MRdFAHBGcZ8QU44CFcgw9gNWRMiMFae8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA0OSBTYWx0ZWRfXzb0PxUY2hQC/
 9kS1x+7CzTS3Wgh3mvOslM4i3jojn7UpUVYblMC8qTFuftNf4NhJIMQ838pXqoibVPL/BjkCr8d
 lmKOekonGYkzrlI1cLDNrkQ6nTvKKDkxbev3xUZ+mKNYSntK7AQL7oqtPZEYfigRlL8LyJGUay3
 fBZ5i0V9vD4qCF8Nm5pDwjLL0mEz/r9ZTjpLd0e8bfQj/PWPnqt8VfarOR6lEMjxUd1lCqs6iiX
 2Ot3YUO7JYHIYMxGuP2/L+QUSwa2T3337OB0xS7eJEXuhpJ2clVYjCo7ohlHRmMuLfq4TY9xqHa
 IqUYSIiG6Rxdsx6WypnkNRQKl5zAmXjSrDJ2bJxPQYPNigF5aRdDHcW0b1wGIsy7A8InpHT+N84
 mTKn/2hmpt7PALJt88ZHWc2PUY73txd4Up5vCzJJnn+SEHfLOaF3jWUSkFHgcl7xie17roaaPE2
 b/e+PKNIQktQPJRZ1LQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA0OSBTYWx0ZWRfXzXVKjCp+G3/j
 a3PmX5ocOynHfsnvUk3l++F8cZkYyTLD/AydabpBRXu1ywjeMHW2jBuaDlwlE8BscI1DMqTX9x+
 6IBwX6FJSt5P1WfnPo26Abgdtk3uOEQ=
X-Proofpoint-Spam-Reason: safe

In cs35l56_hda_unbind() call cs_dsp_stop() before cs_dsp_power_down()
if cs_dsp is in a running state.

cs35l56_hda_runtime_resume() calls cs_dsp_run() if cs_dsp_power_up() has
previously run successfully. If cs35l56_hda_unbind() is then called while
in this runtime-resumed state cs_dsp will be running. The code wasn't
checking for this and was calling cs_dsp_power_down() while still in a
running state, which is illegal. This is currently fairly harmless for
the cs35l56 driver. But it doesn't comply with the API, so potentially
could break with any future changes that expect the correct API use.

Fixes: fb78d73dde2d4 ("ALSA: hda/cs35l56: Call cs_dsp_power_down() before calling cs_dsp_remove()")
Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/hda/codecs/side-codecs/cs35l56_hda.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/hda/codecs/side-codecs/cs35l56_hda.c b/sound/hda/codecs/side-codecs/cs35l56_hda.c
index 148d760987fdd..5982eebae1525 100644
--- a/sound/hda/codecs/side-codecs/cs35l56_hda.c
+++ b/sound/hda/codecs/side-codecs/cs35l56_hda.c
@@ -809,6 +809,8 @@ static void cs35l56_hda_unbind(struct device *dev, struct device *master, void *
 	cs_dsp_cleanup_debugfs(&cs35l56->cs_dsp);
 	debugfs_remove_recursive(cs35l56->debugfs_root);
 #endif
+	if (cs35l56->cs_dsp.running)
+		cs_dsp_stop(&cs35l56->cs_dsp);
 
 	if (cs35l56->cs_dsp.booted)
 		cs_dsp_power_down(&cs35l56->cs_dsp);
-- 
2.47.3

