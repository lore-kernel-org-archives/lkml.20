Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794920401;
	b=MNHSsMHYOZZAnVTLTH9AyOERp/O1WgF2ryJvFjwBbxozDpQFXDjMV9QvBhgVTPfZk3mz
	 1z/OLUEoKYzzCoE7oxBR0bN/eUHoElWV07awqD4+8SnmiT2txs3bisJBS/OpgKyBFDfKD
	 K0resGwdMYs5SHBZpStHZwrg4KN2cgQMoh31edueRMjW5JXRLZjE47Vlu9vzYnSPOnYNo
	 XsglNwUHE404814/JzEsfUNSR7DIvcZBL5eerajZH+8qxEtr74bigmjG9D/OByy799SCi
	 eSdyDBcFLDeeadEk5bugv39J2eA8acQtbmwTcCa7mPWm7SEEi+LScHIMbpsuWwMXoFQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794920401;
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
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Reason;
	bh=VaSM3KwgzM0pt8SYOPlU3VhETRKaEZ8/BfcowA9VRr0=;
	b=eeVDrc5If8+9vChXIYOpAkK4rn6jrbU9UPzsgmqObFKdsNSaTSv+ifpEI7myd9xS2+ky
	 rGz1SbTEFLXXB8SNc/ZzXeGNSJQYpVAWGmurftISN+xSXsWinnM7+HcS+g30FMcf3uXGE
	 znODDdwuONc4SX91rM5KJdlkObzyfkXSptDkBuBxxSPL9+k89LuiMfDfaXmATJ1v5R5ho
	 /ZADhaMCBBnr68QHQx7PWnCd2GlTWO5PYZw9ywBoBp6ACqpQ00nq/OE/cbzWkhmgauTno
	 Y6pCgoQDeFENfriiY0ct+LPQBtoJAibgrrzqzIoX5r/hk9IKf6yFXOP7JzOaoeez7ZA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=isBedhwm;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=GXO0m1no;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47EA9606A329;
	Tue, 17 Nov 2026 13:00:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47EA9606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=isBedhwm;
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=GXO0m1no
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHBtYHY4106916;
	Tue, 17 Nov 2026 06:59:46 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=VaSM3KwgzM0pt8SYOPlU3VhETRKaEZ8/BfcowA9VRr0=; b=
	isBedhwmqF7+xmaxRdWVmU/ez8tJ9ReHZB16LANNr0Ehk+6jXXTevc4FROKbMkrm
	sKRsYwXEKdfiCDlUdOkZenN/vKJZ5SZ5tSYpbC+bkrr87wmhaN5CflYDdwI6skrP
	2b+oPVyvf2koywiFJ+GeJCO3WyiG1vgfYrQz6jgSBHl7lAqBRK0xtJiGWYGPeX4Q
	R/hADqvEVCN2mgtJGusWybT706KQKk3gMXPOhXU/C2FtrcbP9fKTQGbeOlJgH3lE
	LX/KzPeL3QNdFezq+CGSEuue+s0ItI+gq5a2WJQUMvnNZiquK05oU7XgPbA5atW6
	noyJPXu09Mq3wPKonaKQfg==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11022092.outbound.protection.outlook.com [40.93.195.92])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4j0kr509e7-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 17 Nov 2026 06:59:46 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qwt4lQ8n6bY9EnOoPyOmCVovgq7HuHixW2zI3/JZrN1drpd0Gat71+Nv9AzUSHODRTGbxh3V8pv6DELfV3KWphm7IxCi++n5A4SLbTdATIVrbXUk9+ycZpS/TBHmtZGnrM6LEbnnQkS7LY11gTdZ8ZTT5ImdFWYp57WvzPeeo1ed9uwvniTu8RzTbJl+V6w2gQSwP87RqugZNxtGe9+u75uwICKmDRGsvvyrFMmKM1mAnB+ooDGpG5oBNIQHgkJZUilitUYQiitP5LxJcuSrGz4Wmf4cvcXgNqk2ddYOzXSsutRdVItEnTKYYmg0eJFRlMsRKHQbokrt5l25JozoLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VaSM3KwgzM0pt8SYOPlU3VhETRKaEZ8/BfcowA9VRr0=;
 b=AqbvwmtJxokLLJJfjw99j+2EFiq6W1r8L9ptVv7G+B+0BhdtfdaBmDkX2h3FIiBIhCvUGemLndMuYgY4vC8Xc4ZOv93Ccukd/m8saPhaP5lYFS3mk+Nq/xcsl3Rcd6qqqQZaufO0xffULmolAUQr6qoiOeWSSqJyyo6QgH0ygQYFsdv8ZdyR9WZ6WV8jTfxBz8pDps5r1zrAmqNpeRsJm0XEu8FYGSSAUnNn4aJwdUeGTFhZoCJNHfsXHflthQE/g1Wkb4VP35Y4BRHwQDmDV0FvSIVgYqFSx87BpZZJ2GGHT6OMeGHr5ZyYcPtBYBBhGoe8yJptwTChfNzlcpYWXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VaSM3KwgzM0pt8SYOPlU3VhETRKaEZ8/BfcowA9VRr0=;
 b=GXO0m1noplJw+Tp8BF0LgqtSa5P1PFIGrHQBdDh/qjQio7ydyKGq1dICupKDHJf4rbaM3cXJsE6CdHjfkk2LL1QrHvdejM0tJfnMeunpzmHRd+BIHIFarbwDTfpvEOuwVzdgNtJ5vP8McNrW+zeWZHFOlTnTut7VC+9e93YtsHc=
Received: from MW4PR03CA0237.namprd03.prod.outlook.com (2603:10b6:303:b9::32)
 by EA2PR19MB997225.namprd19.prod.outlook.com (2603:10b6:303:2bd::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 17 Nov
 2026 12:59:40 +0000
Received: from SJ1PEPF000023CB.namprd02.prod.outlook.com
 (2603:10b6:303:b9:cafe::9b) by MW4PR03CA0237.outlook.office365.com
 (2603:10b6:303:b9::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.13 via Frontend Transport; Tue,
 17 Nov 2026 12:59:40 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ1PEPF000023CB.mail.protection.outlook.com (10.167.244.5) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.4
 via Frontend Transport; Tue, 17 Nov 2026 12:59:39 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id EC473406543;
	Tue, 17 Nov 2026 12:59:37 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.11])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id C967C822544;
	Tue, 17 Nov 2026 12:59:37 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 2/2] ASoC: cs35l56-shared: Add KUnit test cases for ASP config register writes
Date: Tue, 17 Nov 2026 12:59:37 +0000
Message-ID: <20261117125937.658976-3-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261117125937.658976-1-rf@opensource.cirrus.com>
References: <20261117125937.658976-1-rf@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023CB:EE_|EA2PR19MB997225:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 81c0e928-c6dc-4b15-3c5b-08df44aaa3ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|376014|23010399003|61400799027|18002099003|16102099003|22082099003|261009223027099003|11063799006|56012099006|261102123227099003|261028144727099003|10067099003|261026140227099003|261026121527099003|261021121427099003|261022075727099003|261022105027099003;
X-Microsoft-Antispam-Message-Info:
	aleOnoBPNveOngGMhFq9IzJC7igRctlVur1SWcGX2Bf5+auuPTIDtMeZ+MLDYAir8XMuzASZJu1byMyokj75XQleELDJjD6hAA9jnbKl/eQDtgmvtSvWfnPmm5LVqHYrX9pC6dLBNNfojFB8ZvDjV9j4/LtO+OlIDQslST/MpHp+wNx8Nef/uLw1vA2516yb8m1u64axLE75unZ/CZmyqghvOGXKQHFemOCl+NdB4hnWAvHMdA6+5SFSekNn0O9DG/sXUp3AUP1YccOLpd2UCPGiv+g8qPAZIJyPaReYYMdFST7ZQxSzBF+z/NqCd6TPBUNuIcpUWhHQovQMVlHlySUvFITlKzkvwnor8Z11qofhIIMv5TguwJcH1jLnXAsI9/U/F8y955o0eTKtfqQgOwhO5wKH8XXS4+CPmPsGrhhDNnRwrIiGtNIG8BrIBhMbYH26BKGBzx0vhQ7zINJxGpR/0aNz6k8YGut13HJ0HcRvCw22m3WdNusrtMu43dzX/sR+p8X79q3BzJ15RzGb+eBgMPwOeRG9TdZn8E56j+gYPcPU/S6LmoPX+MeBiOXn+bbnsTAwPCuvQ3AgvqxssegrSAL6pYutcFdYIrVKQJa9VDtFpW9wppoTCDFgoRIG6nltGUWEqLwLWcrUA3XQMxnkDUmR3g5bT9DGCyklmrDvKg8JXkKIV3OOWfep/a6C/nQJhlcrztLiqucSelJ8EQ==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(23010399003)(61400799027)(18002099003)(16102099003)(22082099003)(261009223027099003)(11063799006)(56012099006)(261102123227099003)(261028144727099003)(10067099003)(261026140227099003)(261026121527099003)(261021121427099003)(261022075727099003)(261022105027099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	WXHaUIsWdsrO2ApUD6QIPBT5bMFi6Zjztcngj0AZb3yA4v4Zld9aU98rY8KP3ibwhRMx/1DAmXnh98qHsdjRpISUsPdZKXRrL5gXGC/+XwXlLrWw4UZTI6Bo9/jYOkvuS9rOO1sFYg8pY0OC6RUSkP/GRc7hZeAsifdygy1thUOjNkLIW2HTwhykr8xsNaKB27ALPhUeUAsW5AnHlBbh3PnEOtsFafNaUQSd9T08rfIYnLyJ2EjOLLMWXfqTKrypvLZZJGPe7uOGNY+Mk39MnN0KI86bmlA4+WtTGpnLaWwXXbpyDXqYosGphMKTSS9kvHYOnOsnNINUbZsCcYZIX4CkID/pRanFPIP4ltglgJw+T3rKWo4ytLzENlZTCpU0szpTbClUwcUpGFSbVfdUdQD6MErlMRGo3l9FBkw2aSx72xsY2dgEgERB1JMspz+a
X-Exchange-RoutingPolicyChecked:
	auB9JoSec7bN9wcIR9dkCwU0dv5wDluASP3rAeRFuabIWJtCSRM6Cf8k2OstgK2nfgNdvt6DghUirZfKEHJsEHJf07wtN+wXXEM9BwWShDcjVCQQOtZlBWUE92qLuAqjAasVLrnYn63rNlENIB2yRHxzx/aFIfUJfLO6au//7BnQYDR+KlH7IU63gvPraSw1BCcg/1kKTViYSxfFGwLPxMHfSqaXTTFwHyvTR9WDye+x6vgcuemv3MLMIYMLV2wER6/3aVuCeRF2h57Aup/MACYr4iI3SH1Oi59ispfaMynCe66jNF/4wTm93jOQ2TjiQRI2268fzLv4Rq9DLGiTUg==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 12:59:39.1948
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 81c0e928-c6dc-4b15-3c5b-08df44aaa3ec
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ1PEPF000023CB.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: EA2PR19MB997225
X-Proofpoint-GUID: 8yLNQuVhNqjoDx02kPkxBvhJ2l-se9Bt
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA1MSBTYWx0ZWRfX/D1DBXem9xxr
 MOZKTbmEI85Cg3RyFmxY5krdTdtADYLUZdARBBqTs6XLYlIcc3SYkLMLP+7U2l8LySmdeIOP0cn
 fFcBuRsxlpe4YNhWqIZzB2bxJFqkPvE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA1MSBTYWx0ZWRfX3cISRpEFLDmp
 4I7B0vP3kwbHClqG8jUUVAaD/Pr3Oyj2WyZxOFp4bngZOXu9pAkfJ5jqxztRij7yEToxw+QcAEL
 jctj2ixUuR7fBbdU1moNstreck8mHgM9PgtYds+EjeFc0b1XGJf/ojSUFErNARj3O6FtCdiTLxU
 b6PxuTg0IczL6vlvYqKMMOMqAFdO925LI3LebyvBu4WnG5gHJS8Jvl4RRUlpoyK93oUTTrcDAD5
 yec8hHH5ZtRTn21ZiK3L/5y/moF6w9egSvohk3N9TdE69mL03rwHyLGNJLqSj2Jl1Z/CPFZzWp/
 FgAHUw6KiAHV9T827M+e6YctiFTaYgNpfgX5QF7Jyu5S7ZmDd8LJd2qZFdUsW9tDjNfJ0OIzMr1
 5OtBnbCWWeMjxaQYGMCMzPxoJLCpXSTiWNHBhorb/sYz5BYVmZjNU7kcv122DAhQmPCymgLB+8S
 tXc1Z1q0xmtvXzDV2Rw==
X-Proofpoint-ORIG-GUID: 8yLNQuVhNqjoDx02kPkxBvhJ2l-se9Bt
X-Authority-Analysis: v=2.4 cv=aOllOr9m c=1 sm=1 tr=0 ts=6afc4fc2 cx=c_pps
 a=Ac3+gfpr/4H3rlTWwaJ/+g==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=zJRp6_cAMcgA:10 a=RWc_ulEos4gA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22 a=w1d2syhTAAAA:8
 a=CVzjGi9iBl6EZC7NkCAA:9
X-Proofpoint-Spam-Reason: safe

Add some test cases to check that ASP config registers are not written if
the driver doesn't own them.

This is to test the fixes made in commit 396c5d8075f3 ("ASoC: cs35l56: Fix
unwanted writes to ASP config registers").

These registers have multiple owners, so the driver must not write to them
if it doesn't own them.

- If cs35l56_set_asp_defaults() has not been called there must not be any
  writes to them during a regcache_sync().

- If cs35l56_set_asp_defaults() has been called they must be written out
  by a regcache_sync().

- If cs35l56_set_asp_defaults() is called while the regmap is in
  cache-only mode it must not attempt to write to the hardware.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/soc/codecs/cs35l56-shared-test.c | 144 +++++++++++++++++++++++++
 1 file changed, 144 insertions(+)

diff --git a/sound/soc/codecs/cs35l56-shared-test.c b/sound/soc/codecs/cs35l56-shared-test.c
index f33b4c943ac8..4088a09495c2 100644
--- a/sound/soc/codecs/cs35l56-shared-test.c
+++ b/sound/soc/codecs/cs35l56-shared-test.c
@@ -31,6 +31,8 @@ struct cs35l56_shared_test_priv {
 	struct regmap *registers;
 	const struct regmap_config *regmap_config;
 	unsigned int reg_offset;
+	bool hw_written;
+	bool asp_written;
 	struct cs35l56_base *cs35l56_base;
 	u8 applied_pad_pull_state[CS35L56_MAX_GPIO];
 };
@@ -664,6 +666,145 @@ static void cs35l56_shared_test_regmap_defaults_readable(struct kunit *test)
 	}
 }
 
+static int cs35l56_shared_test_regmap_read_illegal(void *context, unsigned int reg,
+						   unsigned int *val)
+{
+	kunit_fail_current_test("Unexpected regmap reg_read\n");
+
+	return -EPERM;
+}
+
+static int cs35l56_shared_test_regmap_write_detect_asp_writes(void *context, unsigned int reg,
+							      unsigned int val)
+{
+	struct cs35l56_shared_test_priv *priv = context;
+
+	priv->hw_written = true;
+	reg -= priv->reg_offset;
+
+	/*
+	 * Check for writes to ASP config registers. Check the entire ASP address
+	 * space, not only registers defined in cs35l56.h.
+	 */
+	if (reg >= 0x4800 && reg <= 0x48ff)
+		priv->asp_written = true;
+
+	return 0;
+}
+
+static const struct regmap_bus cs35l56_shared_test_asp_write_regmap_bus = {
+	.reg_read = cs35l56_shared_test_regmap_read_illegal,
+	.reg_write = cs35l56_shared_test_regmap_write_detect_asp_writes,
+};
+
+/*
+ * If cs35l56_set_asp_defaults() was not called the ASP config address space must
+ * not be written by a regcache_sync().
+ */
+static void cs35l56_shared_test_regcache_sync_omits_asp_config(struct kunit *test)
+{
+	struct cs35l56_shared_test_priv *priv = test->priv;
+	struct regmap *regmap;
+
+	/* Use the driver defaults and detect hardware writes to the ASP registers. */
+	regmap = regmap_init(&priv->amp_dev->dev, &cs35l56_shared_test_asp_write_regmap_bus,
+			     priv, priv->regmap_config);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, regmap);
+	KUNIT_ASSERT_EQ(test, 0,
+			kunit_add_action_or_reset(test, regmap_exit_wrapper, regmap));
+
+	/* Dirty the cache without modifying the ASP registers. */
+	regcache_cache_only(regmap, true);
+	KUNIT_ASSERT_EQ(test, 0, regmap_write(regmap, CS35L56_IRQ1_MASK_1, 0));
+	KUNIT_ASSERT_EQ(test, 0, regmap_write(regmap, CS35L56_IRQ1_MASK_2, 0));
+	regcache_cache_only(regmap, false);
+
+	KUNIT_ASSERT_EQ(test, false, priv->asp_written);
+	KUNIT_ASSERT_EQ(test, false, priv->hw_written);
+	KUNIT_ASSERT_EQ(test, 0, regcache_sync(regmap));
+	KUNIT_EXPECT_EQ(test, false, priv->asp_written);
+	KUNIT_EXPECT_EQ(test, true, priv->hw_written);
+
+	priv->asp_written = false;
+	priv->hw_written = false;
+	regcache_cache_only(regmap, true);
+	KUNIT_ASSERT_EQ(test, 0, regmap_write(regmap, CS35L56_IRQ1_MASK_1, 0xffffffff));
+	KUNIT_ASSERT_EQ(test, 0, regmap_write(regmap, CS35L56_IRQ1_MASK_2, 0xffffffff));
+	regcache_cache_only(regmap, false);
+
+	regcache_mark_dirty(regmap);
+	KUNIT_ASSERT_EQ(test, false, priv->asp_written);
+	KUNIT_ASSERT_EQ(test, false, priv->hw_written);
+	KUNIT_ASSERT_EQ(test, 0, regcache_sync(regmap));
+	KUNIT_EXPECT_EQ(test, false, priv->asp_written);
+	KUNIT_EXPECT_EQ(test, true, priv->hw_written);
+}
+
+/*
+ * If cs35l56_set_asp_defaults() was called the ASP config registers must be
+ * written by a regcache_sync().
+ */
+static void cs35l56_shared_test_regcache_sync_includes_asp_config(struct kunit *test)
+{
+	struct cs35l56_shared_test_priv *priv = test->priv;
+	struct regmap *regmap;
+
+	/* Use the driver defaults and detect hardware writes to the ASP registers. */
+	regmap = regmap_init(&priv->amp_dev->dev, &cs35l56_shared_test_asp_write_regmap_bus,
+			     priv, priv->regmap_config);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, regmap);
+	KUNIT_ASSERT_EQ(test, 0,
+			kunit_add_action_or_reset(test, regmap_exit_wrapper, regmap));
+
+	priv->cs35l56_base->regmap = regmap;
+	KUNIT_ASSERT_EQ(test, 0, cs35l56_set_asp_defaults(priv->cs35l56_base));
+	/* Ignore writes from applying defaults so only sync writes are detected. */
+	priv->asp_written = false;
+
+	/* Dirty the cache without modifying the ASP registers. */
+	regcache_cache_only(regmap, true);
+	KUNIT_ASSERT_EQ(test, 0, regmap_write(regmap, CS35L56_IRQ1_MASK_1, 0));
+	KUNIT_ASSERT_EQ(test, 0, regmap_write(regmap, CS35L56_IRQ1_MASK_2, 0));
+	regcache_cache_only(regmap, false);
+
+	KUNIT_ASSERT_EQ(test, false, priv->asp_written);
+	KUNIT_ASSERT_EQ(test, 0, regcache_sync(regmap));
+	KUNIT_ASSERT_EQ(test, true, priv->asp_written);
+
+	priv->asp_written = false;
+	regcache_cache_only(regmap, true);
+	KUNIT_ASSERT_EQ(test, 0, regmap_write(regmap, CS35L56_IRQ1_MASK_1, 0xffffffff));
+	KUNIT_ASSERT_EQ(test, 0, regmap_write(regmap, CS35L56_IRQ1_MASK_2, 0xffffffff));
+	regcache_cache_only(regmap, false);
+
+	regcache_mark_dirty(regmap);
+	KUNIT_ASSERT_EQ(test, false, priv->asp_written);
+	KUNIT_ASSERT_EQ(test, 0, regcache_sync(regmap));
+	KUNIT_ASSERT_EQ(test, true, priv->asp_written);
+}
+
+/*
+ * cs35l56_set_asp_defaults() can be called while in cache-only and in that
+ * state does not write to hardware.
+ */
+static void cs35l56_shared_test_set_asp_defaults_cache_only(struct kunit *test)
+{
+	struct cs35l56_shared_test_priv *priv = test->priv;
+	struct regmap *regmap;
+
+	regmap = regmap_init(&priv->amp_dev->dev, &cs35l56_shared_test_asp_write_regmap_bus,
+			     priv, priv->regmap_config);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, regmap);
+	KUNIT_ASSERT_EQ(test, 0,
+			kunit_add_action_or_reset(test, regmap_exit_wrapper, regmap));
+
+	priv->cs35l56_base->regmap = regmap;
+	regcache_cache_only(regmap, true);
+	KUNIT_ASSERT_EQ(test, false, priv->hw_written);
+	KUNIT_ASSERT_EQ(test, 0, cs35l56_set_asp_defaults(priv->cs35l56_base));
+	KUNIT_ASSERT_EQ(test, false, priv->hw_written);
+}
+
 static int cs35l56_shared_test_case_regmap_init(struct kunit *test,
 						const struct regmap_config *regmap_config)
 {
@@ -917,6 +1058,9 @@ static struct kunit_case cs35l56_shared_test_cases[] = {
 	KUNIT_CASE(cs35l56_shared_test_sorted_regmap_defaults),
 	KUNIT_CASE(cs35l56_shared_test_regmap_defaults_not_volatile),
 	KUNIT_CASE(cs35l56_shared_test_regmap_defaults_readable),
+	KUNIT_CASE(cs35l56_shared_test_regcache_sync_omits_asp_config),
+	KUNIT_CASE(cs35l56_shared_test_regcache_sync_includes_asp_config),
+	KUNIT_CASE(cs35l56_shared_test_set_asp_defaults_cache_only),
 
 	{ }
 };
-- 
2.47.3

