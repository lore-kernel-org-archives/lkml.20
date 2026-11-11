Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794414404;
	b=sKw3Mj7fMsWo3w9RLfMSwC0abSGCzIT2pi1iZceQjdXDminUInK0KNOS40a/GIyLQF2e
	 A8aoCGSC/7aPOL2l0uO4RJo021qZGwDgiRuHE6wftnCSStuA7KrnqaMR7+pejnDUwmSaW
	 5u9HhT1wCwCbNET86YB0XHXQXABaUsFFrxLiQ7lJ2zUtYnashRnNXngveN/AN8Qs1QfId
	 bD6BgAizBl0voqX0hvfEp2yuzALKZIJMnQvOpcgjEIbb+ecNwu1EIo6ETYLZOJ7NXXTDi
	 YfLiGl4gzNYzpUsfKQqONpfKoipZeVVN75ZmPrWx9WnaMxwqzXErmFfAb8dvixfVsHw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794414404;
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
	bh=Xx5NnVKickAHb75XqrVhVGTtBT3t1lcTInp6wN+b9xA=;
	b=aE5+avrZ9k0AODU3wWQVAwsRZVDoHq/xYvtmj+QNOCA53byGeHfdJPqmeJT+9olqVmZL
	 8jeMHZiPXqIYzi0jC+z1TlbskVcu3951IPkqlV0xen0zL8rMu/iKnBeaQltDpXl2jUYy6
	 gG7r+N3pOodb8mYc3/T9lOGK1MPL4tzdrhtOrcc2KJyLKS+TRTvyvYhobiEOnkPeUfPrs
	 yjWIju53fxhpO2pevJ8w2j8AEcwOeX2sHa1xzkCIhc3ZRxVHwxRMcZ/beKooA+f9dZ7r4
	 MubyJ8yOFsGgu8dexibgxFuJo65cXDbV+AJDoJk7Am/NyiLzvO4RvdM9Patt1epfSVQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b="P2hc/C1d";
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=qdkQLxOI;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 274BB606A326;
	Wed, 11 Nov 2026 16:26:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 274BB606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=P2hc/C1d;
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=qdkQLxOI
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABFQ66g4022332;
	Wed, 11 Nov 2026 10:26:38 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=Xx5NnVKickAHb75X
	qrVhVGTtBT3t1lcTInp6wN+b9xA=; b=P2hc/C1dNKXWpxUdRG7r08geiUTdIcTd
	rQKBDZas9j+5xwNvsRPr0PHCk39+VmWQZKpfBDXvjCZc1aiEaM+8WQ9B0dceXQPt
	YTdFYPhTqywrLUlowftduD5wboXPT4DDHJZSY5VdxlyI14itildbG/RI08tuKDCw
	+Cv5sZyZ4YmJgzvRWLyvp5+8OKK2OKShVWGowHLNWssVKcB5A8blLW/GTsA2J12W
	67p5S38t2u5fe1+KcRGa+k3qPZjsoM1Iw+e51lRYCJLAp2V3lHtvRtjXLLg3ZFY+
	1rS6XA40Kug56azgEUNBfbFSjdyllsqj1mrOys9BoQ2fQmaLlPIn1g==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11023136.outbound.protection.outlook.com [40.93.196.136])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4hv7ursu65-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 11 Nov 2026 10:26:38 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lTjjDdWVsPlWZjJDljZFeu/hAroW+Caz2CsY0Drj4y+QCt4s3vD18dvvjBROsBMX/RucLkaxwSAKTlMdCbeG3TGq0RDaexNunlos5yUzpKAr9UEyK5vWonl5Z8alDeDFq/BCFj/MFLKFrF4aS+L0s7qK+9Cvu1a8bqCQmQxy85awFhcv0egSDXZmPL7tj56f+yqH5PQAPxHBSlDHjl0OaZMrY1OI1FmvYn28t9A6m7qNs9KeNT7P5UEFWaixlGnyEkMnLmky1R0s/RPnrIJMsiJ3fKCkdZK4v6CKL5nlFh1PzWlMWvHOweKTO8kGgyifqT8FOUkcY4lmvdw7u0IMrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xx5NnVKickAHb75XqrVhVGTtBT3t1lcTInp6wN+b9xA=;
 b=T+sTs9uJyPt+OD2xZOzKfx5bQVaHdxQ6ZA/6VcvHx/F6Fm8xDHdiB46SNl6xPm399b83oymGotEY+bfXwXU6kN5Kc2bocnVSRjZpr0PR7n47GpqaRB6uAHZBhyi48mSfcbvY+PstOZIp7arAvVIwkvIVb3w3Ye9LwprsK7VWFsEg2ZjNeJ9NS5SmJ+B1QGJrKg0XRyfbiM/QZJTms8Fbs1MCnBlsHJAl/tOQ1C6BkQmPue6IaEphaHTD+WVyS2YtiLIgikNEGivdPmSad5kC7+vBT0vCOIN1FsFBReej87m/SGyeTYdUdc6VoPFUgBP0eGZtdjCZFn31AJFCESQZrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xx5NnVKickAHb75XqrVhVGTtBT3t1lcTInp6wN+b9xA=;
 b=qdkQLxOI9LRf9jNdi8tWrQ+EkMriW+yI7qgacC25AXARieY79s9mfOozs4YHRA86yS4abs9VZ4AegbeaOoJuLdxnyJ8zpXxkRM70lysVFMUgyzB0Hdnhs44drpAPTKP0Ew9eBElW0amGiCYQmVEUG5E6Ca2M9QSLjaKpcURs8JI=
Received: from BY3PR04CA0023.namprd04.prod.outlook.com (2603:10b6:a03:217::28)
 by CH4PR19MB8633.namprd19.prod.outlook.com (2603:10b6:610:221::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.9; Wed, 11 Nov
 2026 16:24:50 +0000
Received: from SJ1PEPF00002327.namprd03.prod.outlook.com
 (2603:10b6:a03:217:cafe::a0) by BY3PR04CA0023.outlook.office365.com
 (2603:10b6:a03:217::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.9 via Frontend Transport; Wed, 11
 Nov 2026 16:24:50 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ1PEPF00002327.mail.protection.outlook.com (10.167.242.90) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.4
 via Frontend Transport; Wed, 11 Nov 2026 16:24:49 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 8AF4D40654A;
	Wed, 11 Nov 2026 16:24:48 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 771B4820273;
	Wed, 11 Nov 2026 16:24:48 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: vkoul@kernel.org
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v3 0/2] Update handling of min and max channel in DisCo
Date: Wed, 11 Nov 2026 16:24:43 +0000
Message-ID: <20261111162445.1371853-1-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002327:EE_|CH4PR19MB8633:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 5eac56bb-7088-4c8c-f4a8-08df40104f3b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|36860700016|61400799027|82310400026|10067099003|11063799006|56012099006|261021121427099003|261021123027099003|261009223027099003|261102123227099003|18002099003|16102099003;
X-Microsoft-Antispam-Message-Info:
	7JqLWCQ3No7WIK2JEsj2goIuEpJ0EqLzmvygu4nwOGkAyMMiJgDLuhoS1Fccw/PkWbndtM3lw9M2xebKD2odUhFZtguIO5FU8wdfH7ZgPKIQAZsBQ+M/EJiZD0HNEIEMLwILX7OM2pQX/LE5qRCLmCoUoJUDo4viAOnAMQ1WkdUl8QBUH3axs+aLMUEd/5eyG4FAgbpiNojDtGq8sHK1e4yEaORGy2TNYPNN6EMptVnflhgjWNhFvfNYbdZUVIrFMUjhwrEBXVKhHScG8vcJILN1BfIA4anVM3/8h2Ly1HLilmrLDxdI8ABsrb6MMQK4UYx6lcvqdfEdJOWYvgS1Amzm2in9ZF1VOovGlHoPYSHkzNhEFXIfcuPPe4TkLxrNHIpe2OLZ4N8WGC6SB1Rov0W8BEyjqf3tKHOdUbF2xz9XUi2ymvNVHPIsoOXu3uWNGQBI1HWNu7ooadVCGLGZVkp7LoCGy9uojiPJjD22dly2UDPThfV9qX4K+9YTJbbJtffujMc8e/tTJgkSmN1xxhvEk+9/HqMYCCUuSI8lEgRq7jI5fILYsvdklkPVEIWB7i5SkVryyHgyuQdmGcMIZUkVQwlNp9rXMn8h/O3Qi9jH7zV2hunq5oOP0tfy8NE5uCSjK7zhPkr7rnFEni4A7wU2gNzCWUC6eZgNH/JP6VsBJwby93u10Yb0S7iWpDD9vY90yOSQxxBXuDfzIHbgOg==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(36860700016)(61400799027)(82310400026)(10067099003)(11063799006)(56012099006)(261021121427099003)(261021123027099003)(261009223027099003)(261102123227099003)(18002099003)(16102099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	xsb5lIagD0+LisG2cdokdFMU2LYpriLCiD8/gPdyDAs1ZbPB42vOJD5LCDyHcL/NtSE4+XJCRgIzVvyVYFtJkg0mYVs4wUuMk8piWJZdl+SpDof/pFRswagdGVDOd0N7nMxeUd0EmUiV0bFr70Zb+dhmqplMocaX67HGRok5d1IGon5xszeL9o/JMprvBCKmqs4B5a8BZxCmzr45B4uPqIBk60PC6LlRRKzYh2MqbOP10tuUTmPwj78vi8QFKjHRfCqiGDW1aN3/oKVHdwsLAe1R5ah6kAwZRetBhhOqinLCucj5id4qmi2CV6Z1UjgplszchtDv2CECg85+yAC29qhmdd5CRpW57XWX7JO24203YzTJwwEf2ztLD4gY5N8pU3mvPyyoNBoeGh8NFRzKQJ1aRJCrGVwR4UQFlGleI5R0fkWMjHBXhHC66TKfFb3Y
X-Exchange-RoutingPolicyChecked:
	o3ORcZ1aSNdIaU2EmFXJwFEeqigzAtX0MpL3hZrn4w1mp6IyAwONiqGOkFC+9p0Cz1WVUyu6b49/kw1zX6AsH94/rroRuOEimJpAIGd8J7NK4FXJQLAjeVb5s0+9wfoYx4if6fnryzIRGTUA/RiTjVDPy4xEQuG+tRb+drySpYPmK5iK1OFBDgCm0GkhIolIje2QoyFKI/kXKGAHc1uirLTwQWV1PxufaRkuxwgE9EcWvDkL2Cp+wrAdssaxIyeyJ/1inZy586DGRx2Y7ef8A46Hky+EpTsx70kpA38Z7MfqynytneTbobvSiOi0Wd+NClP/rlp98QSKmJtD49h1wA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 16:24:49.9694
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5eac56bb-7088-4c8c-f4a8-08df40104f3b
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ1PEPF00002327.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH4PR19MB8633
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA2NSBTYWx0ZWRfX5IFf9d+sTfJq
 NS/+hgByLAVYbYuObh8BqEZHKD+UGbeL2h7v79haDJ/xL5WQdnJHh25VQNAypDuScUVuE1BWkSg
 jFabPyBPrphJy3WZ/5EO2MPBbcurWDnOai9PWEjOH6tHHX/ByWdlbYM7oU7GIF7aZbdvX78nMLQ
 sj/FavvX6sYbQalM1TSwpTsGhmb8D3VGvVXiIWBtbzSVX7d48oAe/lADqBS9bsdKARwKbDJQRHg
 E6B2PbB5BVAgckJ6DMuA4viuYx992rBXv+ANApmPAMudXBd2KlgWL+KKAmXTazIps1H1cMrluUt
 LERzdXz0aXFu1QUBuvYYRvMmVNxGTKmM/6J4m9ywE0Z1bPh0JTJHhd+5Rlug0vJKEcsOL4nbA8W
 Z2LO9ZeRPMdPp7Kfdor0AOHSnTvhLSjywNEG1CVvJcOCpIV3Z24Y4dJ2v0s6twgFqHDl7AlcBCY
 p5dAhXyLU+/A7WkKKAQ==
X-Proofpoint-ORIG-GUID: UDUkfF8VjAiutfeCGAi7Gt5t7pkxslPB
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA2NSBTYWx0ZWRfX1YBF5b4hoRlc
 kNtT7M3EOoQl+7MXd22hAjgUKNWdUAS9Brl/digpcawqDGPiZo4bkz4JtD/lmFu/nrSORbDBgRe
 UyJX0qCHnyzQJCO8bcrbKKdwaMrjOfo=
X-Proofpoint-GUID: UDUkfF8VjAiutfeCGAi7Gt5t7pkxslPB
X-Authority-Analysis: v=2.4 cv=JagpPkKV c=1 sm=1 tr=0 ts=6af4973e cx=c_pps
 a=MadOk45lBhyGsbwhHlC0NA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=Ex7ijrhSia6b-u4GVK8A:9
X-Proofpoint-Spam-Reason: safe

The DisCo properties "mipi-sdw-min-channel-number" and
"mipi-sdw-max-channel-number" are both channel indexes rather than
counts. Update the kernel code to more accurately reflect this.

There are a few Qualcomm drivers that likely specify these incorrect,
min_ch=1, max_ch=X, rather than min_ch=0, max_ch=X-1, however these
should work fine as the number of supported channels is equivalent.
If people feel strongly I can send another series to fix those up.

Changes since v2:
 - Moved the parsing of min/max channels to only be processed if
   num_channels is missing

Changes since v1:
 - Update wording on min_ch/max_ch comments

Charles Keepax (2):
  soundwire: Improve channel min/max comments
  soundwire: Assume default maximum valid channel if not specified

 drivers/soundwire/mipi_disco.c | 14 ++++++++------
 include/linux/soundwire/sdw.h  |  4 ++--
 2 files changed, 10 insertions(+), 8 deletions(-)

-- 
2.47.3

