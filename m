Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794920400;
	b=mJjLyMFn61FWJdrt5vBErnz5DOLNmFrwP1HFKOAzLTo/A+/6YUU/SiUC2U8iiR6HopGi
	 4y+ztxQmrIi837a9ebOWolsmiNcT74JsGOtIeqTc/dduQBhnptw8Jw/rUPNnFvZlt078c
	 dj6oMWlmKsRkNwHuIT/EslM8F6fm+gqS5TFY/oFMLk+CIDwe7cItGpGCmXkTi7N+siB5e
	 fo0SKWT+FqC/jCgkNjMw5Jwm3l+lVDeZGOe3uWcBD7A37Ehu8tylICfjwd0eXDdaezQF+
	 H/JxutSYuNj8EZmlzOGb3a+Ezhrozay/Wf8S2iuB715Q7CUFic83ho95bQ0FN6bOBRw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794920400;
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
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Reason;
	bh=oyzzSJGnm6wWxLLEydgLGuJfiNXpkC19wVZjU5JRvp0=;
	b=BEjlrc80jGlSK88iu5YfDwOk5QXhi79/AyvJTN64Kg3M3W+zCKIwOGokOEGJPPDIvpGs
	 0kh7y5qJ/8cLsR2FXnCib23Wm82EhD8YY4+maGY5vI2dHXHjn8lStQG3o2A2F2dpQgGac
	 PeImmC7tJgjT72M2v5awCXhvMlW9Hy6aEfou9mDwwa2GRy9Zy1BDEikAgub3gC2fe6RuV
	 3uetn0P+slQwwAQ8O+B5iqV0IZhwfnQQ9o1wVAx8W1fSFIwp1hHz/WQbaSY1cA80O8nOK
	 261VwVzFdREMCeYV/BeYnU06ZHEZJEbaqAk8QRbjkm4ECgZgNdCMuQTLezg5qDb1pzQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b="N37tmlD/";
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=IrsJn6Bg;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78A33606A332;
	Tue, 17 Nov 2026 12:59:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78A33606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=N37tmlD/;
	dkim=pass (1024-bit key, unprotected) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=IrsJn6Bg
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHCGGi14140528;
	Tue, 17 Nov 2026 06:59:46 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=oyzzSJGnm6wWxLLE
	ydgLGuJfiNXpkC19wVZjU5JRvp0=; b=N37tmlD/jUO+QOwexFjvScZB+5v5odys
	Q2DZrmfax/XaD+Xq1zQymr38QFEV9MCRpQjTFamtO2ntIqPQUZj41QtS7PwY0on9
	joxUXWzKpO/pfdvU8S40ChFqcbcGc8CzFs302BEeQpTKUDqBq7ZQPV+9jPKHBNIa
	Q/9puKOAVZuhLQRjBf80WdyBKDt3/deJOi1FgW00TDSJjk7TzjB2Es2NgNK/F+sY
	F5Q0k5pBM6mt+TduFNHc4Lwat4yp4u6gQoTZQrns4aF0JjCpMpcvJCPBIYnbhvsS
	7iD94fwxbRqVbC5GXTLpFiRMtuC52AzabElBvkpMIKRHYnoJLbdD0A==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11021138.outbound.protection.outlook.com [52.101.52.138])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4j0kr509e5-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 17 Nov 2026 06:59:45 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AEIweq1+KNK3I2KwAwhuB/AdDhFdRtXLrnU6F87JSWieJTd8H+FpAriW1S51ZQE8Z5VDVeMUeULlgTAQf22b7/xcNhQS8LLC7tNgia0pUBy68BTrwUVUxW4oMasdbhcLoWdy03LLGQAcDP511bYvJaaUtojHJddvIbI6W9Bc1kFBZWcB8vUr3UQJtM3xhT6QR0M/Bvma9slLD3TwKLh1Wr83+yDCbadXv6qBrbVew7ij8G7A81dbo2XMQsxyskMG9/L0A8Ef6ifO8/MHgVSe9WfDR83yPHG9A2pvSyGMASLP5MtZErdyOGWka4IW9Lk8zGtqQ6u/YZtBqb6MhSMqnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oyzzSJGnm6wWxLLEydgLGuJfiNXpkC19wVZjU5JRvp0=;
 b=c1wSaqxtlPrs5qz+wJt6xelr26DPmk/Bol03pCgECLojwqOSroo3gOJsg75i5ybp53FmF1uuQoULTVcK2OrugYW3m0qGU6Jq3s6NRgdLZSJ8T3fCI5WwpI+McAOPakrrZCTQDWc1T/HXjNNfxGWEzVWZZC4rq5ZLDVs/0SzyMS2SMtpH5kQbi75QFk7w/8YMzEMriAviLvfCha5UUBBgKMAn4ioZptCxPZIGt01dm05qOMQr5ibQwKI54/31BjbxQIFvY/zXvEqJtB7D8x3JtOeVjXyYD3Ijhxo7zSyuLmEOQtRTuVt/yliZCy5UtmB7p3zMgyqbiYYf9oLJiLlNJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oyzzSJGnm6wWxLLEydgLGuJfiNXpkC19wVZjU5JRvp0=;
 b=IrsJn6BgG73poM02CvZ489Cgu1iUj0ysG8WVUL6V/gHQALD14LJKerboUQn5RfDADOPxviJNv0fdKYAO9/EmJ/Rkx9EOTaglwDyqw1ggKTlnaUEUN7TAVonI9D21MhPmjxxB0bFGDsaGEyXIJ3j5GKX8ZX252VCDh8CRbMMgaFg=
Received: from SJ0PR05CA0018.namprd05.prod.outlook.com (2603:10b6:a03:33b::23)
 by PH0PR19MB5228.namprd19.prod.outlook.com (2603:10b6:510:a0::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 17 Nov
 2026 12:59:40 +0000
Received: from SJ1PEPF000023CF.namprd02.prod.outlook.com
 (2603:10b6:a03:33b:cafe::14) by SJ0PR05CA0018.outlook.office365.com
 (2603:10b6:a03:33b::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.6 via Frontend Transport; Tue, 17
 Nov 2026 12:59:40 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ1PEPF000023CF.mail.protection.outlook.com (10.167.244.11) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.4
 via Frontend Transport; Tue, 17 Nov 2026 12:59:39 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id D9A83406540;
	Tue, 17 Nov 2026 12:59:37 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.11])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id B677182025A;
	Tue, 17 Nov 2026 12:59:37 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 0/2] ASoC: cs35l56: KUnit tests for ASP register write blocking
Date: Tue, 17 Nov 2026 12:59:35 +0000
Message-ID: <20261117125937.658976-1-rf@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023CF:EE_|PH0PR19MB5228:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 97cd3906-e0bc-49f9-426c-08df44aaa43f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|82310400026|61400799027|376014|18002099003|16102099003|261009223027099003|11063799006|56012099006|261102123227099003|261021123027099003|261026121527099003|261021121427099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	KrkCD7Ic3WNwcHt2FNVi57uPYzqwy8D9l/hQBzUKtFadN1vgk5j2oV55YmuQHKUJLGNy2S1zYh5eYyzu0YhpsXM8g9FC9P0e2RvscegEyaz93xAAKhr5tNfauNU+5YHiPARNDTAJhZGniXzehiw4hDr8t1Bgr73vqmlvwnXW6HdEiGHAXosXWoNs/DO2481433CzAFZ0hKqJ+71fFVdN6BlheHRkncaD9jYvNMTd0QaBkaofo6fv25X6o1sraWEqlBOn/Sx/ZbLIOlD8wSKV+wlAOqpuWxiI69bw2xvFusabXLN8PueFEUuYkNHY0WiOw/B/TLHX8ziA3K5+o0/htXEB+9p3WeeAO9xABCJBPCHIozHArFy8mO/mgafMRGoY6bj+f8WOxUSohVuVFxASo4AJM4/R35rsNzJZC3gqjvYJpfKFkrQVaT49DPq/w6+D3Uwjx0+25t7ooSLwlTsAzGDNR6bPuQKPzvei6tZMeTkb2mFjyc+WHkSOlbwg9IIdUgOS16UVDon0Q5aENwxBSyzMO4SjdKHUxa6dd5YZj0e3yHRgmPE8EbpGAbus98D7e045CV7EweoQmyRHnlA0NUY70hSubWh8aLRTWpUjGOR7/CRXy3azdigYYerKxAeFRSNHZuMBDbETLflnQ0oaVGqrDa0UJti7l5R2eMLsJd3cwX4w/eiTGBTJeZEaAR5df819Jai6ydQdc6/XW4cc+g==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(82310400026)(61400799027)(376014)(18002099003)(16102099003)(261009223027099003)(11063799006)(56012099006)(261102123227099003)(261021123027099003)(261026121527099003)(261021121427099003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	cFABerjuNTrMRQxQLW/O/uYLtXm9UQVjyNw4p5f25OB5Oms1INofy47EGPmG6IMCPA2orbB5Vj27VsH5kEVTzjLlyHElspj9LuZKbReWpZpwrO50RhyvtoU2lEe2AUkDBX2Xp2Nfb6DexkAdt17ZEIwiZAqx/5sWgr6WFJTEt7/gshO2Llk6mem342rjvqoF4urgSfbJFJqu5UyVkPinjbBzT7aqnahPQFzA2xJ1RIRh0mMljDB7IhRnLix3lUe3bEYZ764qqdLOnJC3vAjH5SaoN3UyMvVXbWsUNm3208+g4ocIFHpeHQzPYrU6JNore2dgLD+G9ERD2zF5mjyD3KvM7/SaZgH1Q+bDxINvGy1wM8uBdSj7Yr5iiXD208bcKMOAssussHglFlfuZMbaIhA1Qrc71axhg4Tn115HrnzN27qp2KPIPIWX9/9lGF9N
X-Exchange-RoutingPolicyChecked:
	1+PhNS06VRQXU/hqfqMdP65xyOF07oAp9iX5Pr/60pJPxVZANJsLFfAkKO7GJk78w3OXzBUNGwMVy5k9BOFfdDTuvFhsxf+MuaSdHX8nBf9sbWjtju6/LDImQc3Gn3te7Av7XRy2C8dLfWNswBQYOMy3VMf4bzML7papZyhU8t+8ToTxHDGfXoThDydqUqUX6C9gP4GnnLG15ra9Lpssm/DLVA/G/Mbq3zcE0Y2qCYjtoLFN4pf9GnJTefSwf8LZdVKmgdbTRhn8fv33qUJ7DxNrP+4Z99ySDQ8IqMK/gTpPON/tDxu3GP7UytLtvGmApethF/uwkU+gic+785nkLw==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 12:59:39.7402
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 97cd3906-e0bc-49f9-426c-08df44aaa43f
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ1PEPF000023CF.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR19MB5228
X-Proofpoint-GUID: 6RqedWZP6_qp2OOfa12U7m0J0V-W_dKm
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA1MSBTYWx0ZWRfX4cZvk23AGNdJ
 W37q5I9sh/+yOXNSK6wc5LlyMpKbABO3P3w6CJ6/lelozUHFCYg/Tj+oZEwqWLVb7sybWPSV1Yf
 mHPSWKNVXYrw9phq8AridQ4dPFTpoFU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA1MSBTYWx0ZWRfX+Y6LFqYZvxEC
 iEIDpEhnCfrTVqSB6XgUdWiXCIFKcePZvNzQFut3FAbMPGUQbNXaP7gh36hZpRwpM4ypRuxkISb
 upUaaMgKKpA15s2h+0g/oyJlhKQc+e1Pnv2Undx4zciF72yYf9EYEsJKnZVjnZ48MTv4sHkXbJh
 Xcd051pZOb9XsbHw7qQVERXh2x89VIZOPaaRKN6e2m4PFOXNTXlshD6ZHZDil2C4UaPGy7adoPX
 k3j4xvhFTRJJmSYYSkM1Rkk9RPlYQtb5PFY42TwTKwRkVyhM/Xm9B0FM1fYmtBevdiFePPb+nyQ
 bIl4EnDnDfSlfWFBa6q/iCYq0sk9MYLBA200I8MUI2upTgf7cfag81YGMUmh+k6AwgwusqwElYM
 vizwcDV/DzwgO8zSX6ocLDdEGpHFas8/TcwT+U/4cyc8xhIwo8NJkwch8ClaQ2zDup+hIWnmv/M
 bI7Mg4k63gwhB32Vrew==
X-Proofpoint-ORIG-GUID: 6RqedWZP6_qp2OOfa12U7m0J0V-W_dKm
X-Authority-Analysis: v=2.4 cv=aOllOr9m c=1 sm=1 tr=0 ts=6afc4fc1 cx=c_pps
 a=BXVARlpsiHJk1WAJxp9ToA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=IOOPN34d_85y0lwINIAA:9
X-Proofpoint-Spam-Reason: safe

These two patches are correctness/regression tests for the fixes made by
the previous commits:

commit 0085428e834c ("ASoC: cs35l56: Only write ASP1TXn registers when
widget is powered-up")

commit 396c5d8075f3 ("ASoC: cs35l56: Fix unwanted writes to ASP config
registers")

Richard Fitzgerald (2):
  ASoC: cs35l56: Add KUnit test that widget init doesn't write ASP
    registers
  ASoC: cs35l56-shared: Add KUnit test cases for ASP config register
    writes

 sound/soc/codecs/cs35l56-shared-test.c | 144 +++++++++++
 sound/soc/codecs/cs35l56-test.c        | 322 ++++++++++++++++++++++++-
 2 files changed, 461 insertions(+), 5 deletions(-)

-- 
2.47.3

