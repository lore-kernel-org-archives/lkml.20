Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794930435;
	b=kYNWHXjaJc+3louH36ktBiQLYNl2MeK+bwCgrlcT7TM+VsDmfkvTUeDXdogV+VewmIbW
	 BLl0tCY0kbkEptybY5j+atWqp/iZFQpJSDGMAvzAOZ2utcWNWD2qgAHQj2YLMAga3rGe/
	 655nRJyeOmo2AJbdZl8Y+yzXIwa6BET1u23rW74sPSGSOvPCTY5R+0K1qFg7wmvPklScc
	 gxs695stSMWGbWGbb6w/L8mdnve0465LkicjDp6EyWTltp3JiBWRvhZeycs72DGWTXL5E
	 tgMO89Rd6jRn0vC5sUe0xKL4hZ79Q5DEnsXKU5b1v4lJ5vRrofY+wBpbS7BI9iZfxQA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794930435;
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
	bh=OzhSp0B1WnAS4y8eOo0bMqekvO+SBCdLo9qOR4YQgVk=;
	b=veKngSWaxdI5sY4mVtUkWG3489zXWkUNK0Glp2x68a+RB4Gfz71ePVbeWncaYSZLQS8+
	 N6RJ1X0uJZiiFDS5jTBXh1mqvp0/fM+0f4yPVHhIpoeZfutDxFDQT3IIvf8tXbDeThbmB
	 JGCZbqV9YWFyhtKv3TmOq4hkwjg5MiYNPzFC6CSBT7bAJsb0511vOYEGAxBEaMQWk07os
	 Z0pZZLYyO1YnTlo0VzvXUoaxWG4jO2OdPtNLVRICTr6acY6SW3GlM1bYvzZ90NJ8wycZG
	 RkpXrwoJJc0IaSE1Y2zNq65yWQuI97rPU0h9VFjD3Fy8F34QndQV9hzJwNOwlnAAeLA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=mRNO4J+y;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=XmrUNSzw;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53164606A32F;
	Tue, 17 Nov 2026 15:47:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53164606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=mRNO4J+y;
	dkim=pass (1024-bit key, unprotected) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=XmrUNSzw
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHFDngs236253;
	Tue, 17 Nov 2026 09:47:13 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=OzhSp0B1WnAS4y8eOo0bMqekvO+SBCdLo9qOR4YQgVk=; b=
	mRNO4J+yCKrhlqZ+npWMGyHpOIXP98gxT41NVrpuNGyRrdDt7saIQSM7TFjrW7Wh
	ANXVPen59JNgGBPGs5IHOQNqLfrimUllMZD3YFq1SieunNqsrPk+VU0CGZbCYDUq
	LpTwzccKdGmgWZH48VxNSeTu0GlFhvZIxF7KNXE3MFR2BcLKqCltNysXFtN/2c//
	wUHfsOnd9EUEM6qnVCAD96X0u2u6bFI1jxEZ3u5f1BDw3LeDZHUU9si352fXllaU
	VwZOsJRWpt+ORAIhB60Du2oYywKeJTKsZnaiRUN8sN7SmKgZ5Mw94B0r0n+wQwIo
	LJFxKsxIXIjbxGiCmdfYYw==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11023089.outbound.protection.outlook.com [40.93.196.89])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4j0kr50mcb-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 17 Nov 2026 09:47:12 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K8HEUKbMTccKDc5Ab6EYXdrVcH5N3m5Nbz6sU0GOVJJsupeROV+IcJqcPAO31cLfSoOI5i0L2XXIykJw8PCfz9mYAO/ejqjt7ZKm0TkyXDvedFIwZuZ2/6/enQp+TUPeazHmIGZomx52Nc8EBamgR2VwDfoFWaRyatVfTL07wfoOsb6A2C1n72Bki7iclWDI0HJIMgMqAJt8oMZ6Kpas6LD/Lf9xPqeuyr3KiRDlh1v1v0+2W/yYwtwIxJK8YYwES/X7dvKdTv9JVfp85CK5vssyYOF5nexSF69VjnilzSMHXexbTcOom7jsr7S3moF9KdIHKj16c5s9obIWcDFZ1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OzhSp0B1WnAS4y8eOo0bMqekvO+SBCdLo9qOR4YQgVk=;
 b=Id5QStB0gxVMJ3GpRLv+0R1kCGyVlRbxu6Dvy13jktL7p9aFLs9kaggGDQOy7yCuqZpislGh5N09/EJzm9Y/if8SJYgMfgy9UCQeHeCU3Lxs6D8WGABlMP6x4E3Vro830gbAnw/OGzQqqfiy1gHdhedaqe1YO33XpLT1HQgaD9B6jYxh7/2CCZZD3Tz8sLitO/z3djzDoZ9vriOkVNiBHglUObHc4rgERGyHm/AY2znSx+BpLEtyY1NnhoutFBTTze+rcEGTafi5N4p0EaHdr3acFaHPrHd2eCPwJsLVOjJTHNpLmrofbz41ktrM65gdy1LyP6K4EFgNfUWCCORHCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OzhSp0B1WnAS4y8eOo0bMqekvO+SBCdLo9qOR4YQgVk=;
 b=XmrUNSzwVwd2hhbZkXb51fJqhlTXdVKiKRtt5Kd+jFTheJFUAbJJyH2Z2vQCXyak+md9+3W5m9YQMlubpL53gkkbQAy9q3HCM51r97gnRZYGkGb4isbe1jObFguDKWrrMZqYS2ZaNVcdsI9ip8VvaTzQO4NXt7EfU40Js5xzQH8=
Received: from SJ0PR13CA0117.namprd13.prod.outlook.com (2603:10b6:a03:2c5::32)
 by BL1PPF38B5F33D5.namprd19.prod.outlook.com (2603:10b6:20f:fc04::e9d) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Tue, 17 Nov
 2026 15:47:04 +0000
Received: from SJ1PEPF000026C8.namprd04.prod.outlook.com
 (2603:10b6:a03:2c5:cafe::31) by SJ0PR13CA0117.outlook.office365.com
 (2603:10b6:a03:2c5::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.0 via Frontend Transport; Tue, 17
 Nov 2026 15:47:03 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ1PEPF000026C8.mail.protection.outlook.com (10.167.244.105) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.4
 via Frontend Transport; Tue, 17 Nov 2026 15:47:02 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 79757406542;
	Tue, 17 Nov 2026 15:47:00 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.11])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 632E9822544;
	Tue, 17 Nov 2026 15:47:00 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v2 2/2] ASoC: cs35l56-shared: Add KUnit test cases for ASP config register writes
Date: Tue, 17 Nov 2026 15:47:00 +0000
Message-ID: <20261117154700.840631-3-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261117154700.840631-1-rf@opensource.cirrus.com>
References: <20261117154700.840631-1-rf@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026C8:EE_|BL1PPF38B5F33D5:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 2ca48fc3-4975-47bd-9d03-08df44c2060a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700016|23010399003|61400799027|18002099003|16102099003|22082099003|261009223027099003|56012099006|11063799006|261102123227099003|261026140227099003|261022075727099003|261028144727099003|261022105027099003|261021121427099003|261026121527099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	khVoFQhxnzbDey+oTS5S1SWSXujmTASqR0wKzNe0zMVOOchpKzNkQmVpKP6By9/QLg8ZCpfUaCkyVg3IalDU6uq7lR0KkXlASNoDQfT2JRk+8gTaTCK7cTo93KbHDwAlGxi1O4c3HMwWD/BgmGyPnPR0NeN0Cy4O/JnosrReZMBCzGHB7TZHefIaKewWgEQ9S1H5588Vc3jH5yo1bppUCT7Aocv3+TVxej057b7zNf9vrXDrWOh3emuip8Y5I1BBmwjkLcn5mZKxnG69owwOwye8SURhjQ8sC19Te3Kmm53NhNoKhHVijW+p6MRG8kr/6s2JEBMd5e01xwetax6uy/quAfhGotGvyarvhtxeGOtbslXTQfzN1dorpIKfFHi1iMOHhkbUOSYV8cYLycBmGYQBamSN+xCbfztHPOlU6KcEtVC53VH6ZsS73ejXBTgNcIh+CAAJ04HnZm4MchfILHxmLqmMOkDo/vc8cLA3J+dCcH0qryDMK2LDmfy7FKpgG+Yj2oCoMKPlW+UqM9a3osC1YFPnYKPpTlD5oXemQjcIwJ83AJ1TtsrW0/4X+eCIC7i6r9h+kGI3i/QeLRsT8rNdXsfAoCXHfoRIQLi9ExYMigz4IwbcAh6VT+Egm5znDQgK5C7s2edDRgLPm2fd64N8nYL7yqbefMntTf/8cu5kp2EYNeK1XhID0K+HxIT3ChL8xgrZbXSfwL/2PRzOww==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700016)(23010399003)(61400799027)(18002099003)(16102099003)(22082099003)(261009223027099003)(56012099006)(11063799006)(261102123227099003)(261026140227099003)(261022075727099003)(261028144727099003)(261022105027099003)(261021121427099003)(261026121527099003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	yhhgZzWLW7DDqPEIKnu4T2CiB5c7ajq4Sxc5/rGGYUXgohg7HufGaMzSE98NRK9g0/KMS/jZNMfis8IXSiB89WUymR8b1FquaK7o/8bGpi1feOe3kdNhEXIEbh6mprjcaFSmEh/M5hWXWb+ZCLYlRwSSh9xWx6IHYb+3qxJv2faM78sk8YIjV+kWsrQPqkuYh4kTlP8zKjaklWkvyE6vOa1hwNQONwYUlWgJzVrpjsDceh1Q9dLh6Ph0nr/eJWCT/7fuihkTDb+R6qwv5uS86v1fhMbItOLs4IG5ck1BSDJ1Ty7S3KuvouLoPAro9R3fMPTPxlH/03/shM0hWVUdqVLGojYM4iXFWSPmKZtjrkF3Ad3w5pGfOkoLlyPYlnNbgb3hh+kk4TEqrPjwWPwK3QkvqhVx5JQKY7FLr3jnAC+ri8s7wMmVmJA4UolT0ujY
X-Exchange-RoutingPolicyChecked:
	aC1hongIRjaQywRNBRBxQysHZ3iXioygg+fGvx9JB22ylp8F3zt0mZCyHLLUM8G7GVafOPZaVKF0MON3ptmEy67PhMWV+CgElrZ8erjkYdPRUFhArcEzOkSSidE4s0B9KjVR/0fhh0OC5UvCMuq5QeJCle7vMbZo6r8KwUND4tnP+85trdTVS3GJMJdL974hNb6lRpi/Si2cBl73Mgbk1zTVvFU3j4ENceqh1TfmTrsK9LYT563h3XxUpnknhBhnlgEDVhjgbo7THOKE7HbZ0oHasYK6cEL7n1Lq0P7qLLVDQZBapih3LvD+2gQ+f10WUCYoX9w/ssakelSwuecPOg==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 15:47:02.2438
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ca48fc3-4975-47bd-9d03-08df44c2060a
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ1PEPF000026C8.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PPF38B5F33D5
X-Proofpoint-GUID: wfsk0MeLVtgbiG4tzJ7GxDHOBbcrE4lm
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA2MiBTYWx0ZWRfXxSCAH/+aVm7/
 gUty0QzWleqQa0ir88EEty03RF8UR4DcCvpt6hPQ0ltXpc70XSYwZu3T1I4q/tLVKujCeHVa8NI
 iLeQ73N6KcSLuezVrewm9G+FiLiiZCw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA2MiBTYWx0ZWRfX9TWB/1XqXFew
 44yz1biSSVcA35j7LpJNHWEVQP7KAorvv7EUsDzzrkGYfq1VQuNsMfUntEzLO0QUQzj8mi+mO/T
 UgiDecf1hzTTV8eQrYGDOUm4puV/mAECntOullZuGOWXqZTgmzTCkr12tkFAZfug4Mg8xC1siQb
 T7Ze6mgtt5y4gA2kW9i13e+cFyttIFVtE5HqFPY0Yj6eWLBO97GPf8UrFCAnguntut2WKOVpxgr
 BP15IobBOINKsi5aTSC3RkHDe5LqIG4naoyly9KDBOw9Y3ejto6r76CTHAiOFfVETi7DzKPPL1y
 TDC/UifIo6YR/BCV9aSivQv47Ua1+sT8vbDHQnQ/S+BA8+ySEBN2KnFdJgerSQPotKAntGkHN/H
 lCiIh9sZVZgTT6y5XqV11hWblTySN4kPhcZuYD1I06D/Fh7N7pgsfIW+IpRYd38h6FSh3Sr23F/
 KijO7V7gy8Vc1j1isJg==
X-Proofpoint-ORIG-GUID: wfsk0MeLVtgbiG4tzJ7GxDHOBbcrE4lm
X-Authority-Analysis: v=2.4 cv=aOllOr9m c=1 sm=1 tr=0 ts=6afc7700 cx=c_pps
 a=M4UlfGjtkVVPzxF0Cn8jVA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=CVzjGi9iBl6EZC7NkCAA:9
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
No changes in V2.

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

