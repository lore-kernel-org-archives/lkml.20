Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794417322;
	b=H9fkVHM8mP7XJNhd9X+752wfDsI5ohC8r14L9svycQS/COC881mgdQmix0/cjyo0aOne
	 A+UbKonSiQ5QzrRBA8UIDw9KTLiR01j0OqnOJqxDMzHX285YvVwfOpJtSQyRPDri8Ezkm
	 FRgeUcjqebJzQh3ca3MTu9cGjZ78YuFT4kFd4uz91q/DMesaCBMW8mw0d6vfdlRRhdPBw
	 EvgY3v8kVzmRZXn3BTYcKdu/CnaaFOcBwYkWPSbkGH+FdrINsbwrkyr1PlCKCI9AEG28v
	 wN0KwsgO44zdaH0tYsmZOllD0o1tGQOdLLZY8MGEEp2zijZ/OnN7sOSoTGpuvtfKYjw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794417322;
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
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Reason;
	bh=KjRedcXGKsYuMzxv778EBr5NJOq5V2Hb8H/9B/GwApM=;
	b=t99FzHyOwVnlZateS28AHrz5Kr1XxO7kpxsm4vYBCyP3MKU05E8JvKaotaYFh1NwQMWc
	 xhKzqfSe29AhyhiKfDyffkflU5XSy4i3+7dUKX0cqq8KJBrzhaXeFIv3hM8E3R9uLdCX5
	 dFOJZfPA4ksUmHZGkH3RbP+CORHiNEzzWWhGWPfsGQ7v9Po9CRT6GXWTQ2c5dB5XJsyLn
	 8HSpQEyV4GzIahNetR3536Dv65jo0B6b02erP/F9MdlRlA73+A/HwTjWZK7tXb/HdBfU+
	 fmcDxUedP01DlCUNhKtL7TQUGtwk5osLuV7FetB7IXbjrgigYWEblmzQn3uuHteE15w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=Ffwnr6wQ;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=CVdWhier;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B88E8606A324;
	Wed, 11 Nov 2026 17:15:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B88E8606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=Ffwnr6wQ;
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=CVdWhier
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABG6Ebx4091068;
	Wed, 11 Nov 2026 11:15:18 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=KjRedcXGKsYuMzxv
	778EBr5NJOq5V2Hb8H/9B/GwApM=; b=Ffwnr6wQ2WUu7Mc94DKsCoFOPD25VLIw
	/zh9K9W/XsOk1ozPVtqzmgllShyfF6bEITAD4E7IJ0OeqBMIfTEWkdQYrHZuR6ls
	VXusV6cxUCwR+E/EsDMopcUJUZjDmEmFjKvTnyFU8ND5PYb9JPDItjmCnXv0mtAm
	Q3zobEN41ss/5HA9bmoUgevpjjN4MfwU/L2fA6XexM8pqNpfeCfyt60gOiIYt2V6
	/EPMMJ3qwAV1UHTDERVOzzroB5+haBH7201i7BOV+BZKBeOoodSm/7nWGhwA+yJR
	sdwLJIih/L+7tTugAWmQdkHkjpcP7xmidFEwcuKtotV8+bRH7uFJTA==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11022087.outbound.protection.outlook.com [52.101.43.87])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4hv7ursws1-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 11 Nov 2026 11:15:16 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KpLjJtuJtbT8kVfIGKcFwKzQsVJ4DX/JfgrUo2Dzc2hWdMxKcoK4g0LQJND2cyS17mLvlWj4aalq14myrcEpWBhUzSgVAeqxcSgTH/VEW1vLIFuQnXKuzaarob0ZYZjAagof5dkkDGLP139c3bkGLk3A6gdpBtqoKd4xp6J2JP/ZGDXOZpBnv25Lm5KMGBvk6nil8wj2cKsfdYbJPCNexL8CRjqL+NsJLDqcjA9UDgMmalSbQz+JsqOfQxQnYdRH7Q8DqRZL70Wpm2efsPKpPyQiF0fKTnZAOI2Ld3+/mVN6gyZLHNsTKLCZPU7R0t0gVHBzAM3cf7VndkMd08z2AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KjRedcXGKsYuMzxv778EBr5NJOq5V2Hb8H/9B/GwApM=;
 b=YycZ8H1rQUgeS4Ny8DRtQQOH0lNvrZk2F/ZYiPio488061U2EBZCIuc5wX2z1BvKAeCttm4cXhidyI4Wfp/fYqbWdW+SxRskWP0nezT+AktmmYM0zbcJy2hFpPoNXzQmZC5usDAblR0v8QyWSuVK091uIXZ5IXeIpLhfyiLyfP8l0ZYDtXP+om8om5vRLRTX705wFFCl0dqDGXHhKfzJweyIlbuiY6KZk+hKnMfFADbbhES5guefrh0buBn9/UyQMcQJcLVkQIorv3h92SQ34EFmtqzUICyCpDkctTR7X7kYofsIlQ6WO7scdxBb+iNaP19A1sTPmnIa6ShYZN711Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KjRedcXGKsYuMzxv778EBr5NJOq5V2Hb8H/9B/GwApM=;
 b=CVdWhier8QmIR02BCdXt2PZ74GLGBiprRVwo1+YFVPUkr48r02NHJBFHrTgbpavQT/kN2BvtuB0KipTZUJeC0qTOEYAHJDB24Tuon113rsKm47stqq1iwuYXXBPzHM702M98btz5ujB5rexRvy3OefDe5+ZBkRAc1uJZdIVUcTY=
Received: from BN9PR03CA0858.namprd03.prod.outlook.com (2603:10b6:408:13d::23)
 by MN6PR19MB8744.namprd19.prod.outlook.com (2603:10b6:208:4fd::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Wed, 11 Nov
 2026 17:10:38 +0000
Received: from BN6PEPF00000072.namprd03.prod.outlook.com
 (2603:10b6:408:13d:cafe::a2) by BN9PR03CA0858.outlook.office365.com
 (2603:10b6:408:13d::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.9 via Frontend Transport; Wed, 11
 Nov 2026 17:10:38 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN6PEPF00000072.mail.protection.outlook.com (10.167.248.199) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.4
 via Frontend Transport; Wed, 11 Nov 2026 17:10:37 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 2DE8E40654A;
	Wed, 11 Nov 2026 17:10:36 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 0B99F820273;
	Wed, 11 Nov 2026 17:10:36 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org, lee@kernel.org
Cc: lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, mfd@lists.linux.dev,
        patches@opensource.cirrus.com
Subject: [PATCH 0/2] Update cs42l43b load detection proceedure
Date: Wed, 11 Nov 2026 17:10:30 +0000
Message-ID: <20261111171032.1491717-1-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: BN6PEPF00000072:EE_|MN6PR19MB8744:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 7f94c80a-9238-4684-2951-08df4016b497
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|61400799027|36860700016|23010399003|376014|11063799006|56012099006|18002099003|16102099003|261009223027099003|10067099003|261021121427099003|261022075727099003|261021123027099003|261102123227099003;
X-Microsoft-Antispam-Message-Info:
	04VEcXVy/DMBiWqOkn3AZFZ1zYd4TI6u/0IHNzpaqDzbKMUR8MGYaGsl3ug7XiesRX4T3gRLAQ9TwfanWKEvydBB6FtLZAWVgzOuO2cpIU1sJdu7tY9rG+oA+928GZFI2c0wy/SMQPQaAq1ivnFOGFpjHJqLE1jFWJGbHWxEHUobXpNSq1DJ1p1Ur4E2SjHg+DY4mYqD+YXme2kZkUVu83/59ySCOjM37ytqNofy4Y2PutNbSo/Z79kcWwPxP+L4aPd+7fpvKzxu5jPcjeYMp55fM1DYtJTX/wtham3vxkhEi48Zni6+GBGfGyiT0JJJoo9sjRtZzgbitqWHLu5vtrOODi9GvMgkl3qbEMliBNx5FlCEMNf1Uq8N43BV+rt0DPrWkpp22Can93GjZc6O74fZ6271DCuTYCwtwIY014+D+phsZ1r6GtqRE4xlfE8grXF2qqgMsHWBVqFMwKA268ogH/XV8XKR91uEIHien42c8neZAMoDFd/VkRVU2MEJVsrnvYQvQSX+zm0TqzdY8ZlrCmF3z/GlLrIQWPFENrVG5IbbuEKq16+ElFpjNjO6Mxth+Pi9J72BVslaxFJ4DXA+rn8I6J2QhSv/bTMOqPjV9DLSSzKQjT0GsQBCk0+e4JKohxBDq2S2GhWQHdDE/zmjkAXZkaiIn9BBjIqNSXMjilgGCvafq0njF2r/UgO/jWFgD5WOqM34cfYKecHPPQ==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(61400799027)(36860700016)(23010399003)(376014)(11063799006)(56012099006)(18002099003)(16102099003)(261009223027099003)(10067099003)(261021121427099003)(261022075727099003)(261021123027099003)(261102123227099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	z976UiniZfZnix5uHaGoi5iKPeMvnBJWt1N22FvMtNcqlVzz48M0Md64xPgzA3Cr+SLBmtiYcAsB5QgwIqhi+i9o684876mCNAdWqhEKiONDRrhf6kUzitJoXgB0wLxrfVCCvKbFJtkfN5vXuBvKNNiFhyoauLXJgXIv7F/flo9GGloo3PeIsOIdEs2minNnZRL02niwv+pmh3LqPwqESpv6T/0l3Tzansjmu0cJ7PWbDjB0kjP6bF5SAl0JCVLAvLBkZn7Y1hIKc64jzVELJYQoxGMlCITJ6zz7bxlcel7bHyvS86LvzUZjrQ2vm7rKocTjxgjIE0JWYlxn18jA59hIQuvb+cnbHb2QU8b548drB95p0WpucjEuUKjF1K1wvLhcEkYLY0pe6BwrQyjRtVKg6z4Yg1W9NRdPalsxm9wu0NraPE7fu/y4kU5HMTQ6
X-Exchange-RoutingPolicyChecked:
	cr6SY6IJHDMvbLNUKf7evjsmQYRTZEvVQmOlKQ88OHtABZJZcNngfhuKLWdI42QVpA2Vf5QDe15jkKk+mgd+ESl5osllVkZSxzj0FfX4mA/h+aE1e5+luc1vmHXpg7CpKY0lPFANcFn167TLkRQsoA2ULV74hAEt+SQ4h49Y2Ed5tSm0eCzH8HCV8nZvYJVtGG9eDu901oHMY0yvxz3huHWJAb1pv7ooFSwIZtXCl1ZBBhc06pK0sZ6QyuNKu9oaIhk98xJJCBsEXDBAGuNdbvh/ydr+n51D0nKfK+/MsuQ/QBTs5wCQDfSrq5ys6DO6IQS6Qvm6NBkc2cfTAq7zfw==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 17:10:37.1033
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f94c80a-9238-4684-2951-08df4016b497
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN6PEPF00000072.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR19MB8744
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA2OCBTYWx0ZWRfX/gdomQuNh9g2
 40rUgQWysQbPkDAeRr2/FzaiSy5lqqeI8m29jZTtlomWABalrsaszPC7OUKdSGuLYa0Uyn3n39m
 h9JiGWpm3BkoKVQ538tYON+qNyem9lNMZjJL0MyfBinz/nOuoT/dSsGEV3DMAbhHm2/EmGWS5O9
 nSJ8gGmGEcFxpNobWORP7D010ebOxOMF9wUbSGCrIpQ6U+sm83P2ZBp3A6KM9eMrQNJFWSJv8vc
 srViGGuolfVRITA7WUYduebmNXB0GB+Val2PuYZAEpPFvVCcg/vS3Fio0hkzzbErQVnP4gXzKqQ
 ed6CPyWrrd5UK3IqK5/luhOlVHUFWcQvlgMWlpGTBKD0E9o6rD8iDN9IXPBI3U23iWzJZ5X3Ryz
 PNvjh0u/SHoC2Byc97bTVp/yht5gRYV0Ums04IRofAqsuvlwpvIQFxVIjXf3TmUrOTmzyOp3ANn
 4TIfX/VFjw+A1s9gjdA==
X-Proofpoint-ORIG-GUID: YwPkoCbMsziM8tWbxx_Dm66f3mKY67gp
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA2OCBTYWx0ZWRfX5cqG0vX3uSPg
 9ew83o06BG4ijTRN1DcDmTfPYVwZXi6dkhOkJHtYrFSQpkQameHPJmd6b5gSWh+VAaoW2k5mEeD
 a9wgkTfJ8WmRSJRi8yC3omASontLaVA=
X-Proofpoint-GUID: YwPkoCbMsziM8tWbxx_Dm66f3mKY67gp
X-Authority-Analysis: v=2.4 cv=JagpPkKV c=1 sm=1 tr=0 ts=6af4a2a5 cx=c_pps
 a=LzkVVAj3Rd1zMMBobGGGjw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=i7mw8Kz22PjugYDnk14A:9
X-Proofpoint-Spam-Reason: safe

Some updates are required to ensure proper accuracy on the cs42l43b
headphone load detection. Add the required extra register to the regmap
in the MFD and then update the proceedure in ASoC.

Charles Keepax (2):
  mfd: cs42l43: Add load detection register needed for cs42l43b
  ASoC: cs42l43: Update load detect procedure for cs42l43b

 drivers/mfd/cs42l43.c            |   1 +
 include/linux/mfd/cs42l43-regs.h |   2 +
 sound/soc/codecs/cs42l43-jack.c  | 101 ++++++++++++++++++++-----------
 3 files changed, 70 insertions(+), 34 deletions(-)

-- 
2.47.3

