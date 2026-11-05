Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793898403;
	b=LZoAKBGK2QA2cnHsNgoBhrlmxAzsx9adPJ68aEfAfPxbuDqAh9nejgUJexsoxdDsAfSu
	 naBJN7MptMmW5m2uN9fXL1OGIlu6s2xYZWrCqK3Mxdg7mL/sTk1Q+ECR8UnRjorjC5yM/
	 En6Ysg6RR0fPu6dyXHKlxpxVpK8/9q7yyqVl3bYYI2XHEP0Z7Hd/FSEHKBU++7zxWL5F6
	 FqUHm3Xpor2lEb7WgjjcPEPKs3O1WJqf2hYRfCwyqhwZ5gw0QCeNr5OSyjKiilRCYAOc1
	 +E7S8/FS9VX+yvKBxuciA+WL38q4GfoShOEVCHIhbtVdNNGZK47IggNe9e/BSSZJy0A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793898403;
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
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Reason;
	bh=/2G/bqRrqf2QiuBI1FCtdjCYIG67qwMy1c7A+U92Q80=;
	b=YiHlElPE1ktBr/4xMsVD4YWKlMFHlAlVPHXW/upwJLw1+xAm3WiEZQm7KAWgHlrkqczQ
	 aH4GwMN7Ih3XxNfI+s9o8stMbzvHsz6KmpYVjzsDY0fjngH7wv+v2x/OQmdiQrz7ngC0l
	 gO7O8AcSkLJnSrl++U1E5ftKT/R70HMkyEgMAmD0S9PKduk47YBjPCSn50hItfzbU4Dx0
	 wGSyXsGjHWJz5QLRyEhdPr6dkOD73Rqo6g+guM67zXRwinOrAkBq/RUG7a3mFMWX6dX5/
	 B0F2ob51qmfL5FtCw9BJrPvw7qesPc1ld9eInoOsbZMI4Njbp3XK8Q7/IbCRIfC/bqw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=MoORAkpx;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=q2B45wAh;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 944A7606A338;
	Thu,  5 Nov 2026 17:06:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 944A7606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=MoORAkpx;
	dkim=pass (1024-bit key, unprotected) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=q2B45wAh
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5EgZ6j1891090;
	Thu, 5 Nov 2026 11:06:37 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=/2G/bqRrqf2QiuBI
	1FCtdjCYIG67qwMy1c7A+U92Q80=; b=MoORAkpxdaGv4EKuXNTDCAuTEtPrqyKt
	bz7mA4dbG3ZTvyo3GWySFUbFw3uWUELV2wr2azQrjcoD2/NciSNMN37eh5Bp5ZyH
	UHsaKNJ3u1Z/a4JTleY8byfPxaGkICJAoShKxwHu4GxvvgK4UkFQQFUUCv/HEvyO
	iu/enr5zCDc/J2hoSU4IDsY4tCzM9iGdBHPO62a2W3xGF54Z7umkYTyGvJvy8/6s
	BZQ0O6SZv0p5nD0xSvgor4fxh0bTF/czTxJgtVRw6uiC3yXYGezu4Lj/RouVww4n
	GlLnUiPJWhgDivKc+Lx5PKfy4gD0/ydQ/tKQxYJz8pBcvlMWzL4jrQ==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11020117.outbound.protection.outlook.com [52.101.46.117])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4hrusx096f-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 05 Nov 2026 11:06:37 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cZAA9vcUYh5Exk1jAsvjDUUTwmCiMK7fcqJlQGj2WQxElMYydh4cxEu970qBgq38wqKJUwgVSny+4ESUKHw35uSBxwwC7zbqrxKL1vIpFWQEnKSFl06pMcGkfBMtnYMY3IUvTCt1VO3pc8YItluViqhhYD9qHLjrkxBjU3ERjL0GMj4zJMZC0jVVL/K1NKARsZxhoT21fYKmQvqhvdvfj8q5BmhYOnpPRmgQ4Syo16p5ZvYK4cscmcRL7w95MD4tv2yqwwR6hwhNkPCB3crpC/FPxzXfwW/4CNrlQZ5e0GPz1V/RPz4qXZFRvT8iKmUdNffybC5tE63QtnG/Y8jelA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/2G/bqRrqf2QiuBI1FCtdjCYIG67qwMy1c7A+U92Q80=;
 b=OpD9VFYRxhZGphQR4EAWMcMhR05sDBHfRYplY5bQmZi+7aMZY4CA7GDwZFmrCgeMhee9aFHx0W/y9rDRYw2F39SEf8YfPVFEJ/Gl+MnocIh1lcGwfmdNk+Yiw1AR/PEi2MmQJv5BugjFEe7OzrVBoyurt9ngBBY8LYMAEdT9z4mrdPHkLZ6AirjT6juFw133FYefGhXxkZkfX4UsP3G/R3TkOaR5wnK1dnvoAGIZZ8kKmXFNCK7P4fIh0qy1yli+prBoUFh0z3e/1+axfshYcLSfA7CdU8eQQNCQST+c0XQfLocQcgbUeusqjJLB+QNRNjqqFXp5hsfL71uCiP7a3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/2G/bqRrqf2QiuBI1FCtdjCYIG67qwMy1c7A+U92Q80=;
 b=q2B45wAh5fM+vRGhlFBv53h54Ry+U7r4fUxfsxeOB9H/FazmDpJ/czrZU3i/3nMUHqwGMQtZwYWq3YroAwqPSY54JV95YJ00txZLwOL9wS3iyBgDPkDQvXZ54+j4VlwmIKA2GQCB2fnviOPDxZMDScK3jPGtliDyotzF6q1jIqA=
Received: from CH2PR11CA0010.namprd11.prod.outlook.com (2603:10b6:610:54::20)
 by DS7PR19MB6254.namprd19.prod.outlook.com (2603:10b6:8:9a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.9; Thu, 5 Nov 2026
 17:04:02 +0000
Received: from CH1PEPF0005BD62.namprd02.prod.outlook.com
 (2603:10b6:610:54:cafe::97) by CH2PR11CA0010.outlook.office365.com
 (2603:10b6:610:54::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Thu, 5
 Nov 2026 17:04:02 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CH1PEPF0005BD62.mail.protection.outlook.com (10.167.244.251) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.4
 via Frontend Transport; Thu, 5 Nov 2026 17:04:00 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 95DDE406544;
	Thu,  5 Nov 2026 17:03:59 +0000 (UTC)
Received: from lonswws02.ad.cirrus.com (lonswws02.ad.cirrus.com [198.90.188.42])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 644BD82026C;
	Thu,  5 Nov 2026 17:03:59 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com,
        Stefan Binding <sbinding@opensource.cirrus.com>
Subject: [PATCH v1] ALSA: hda: cs35l41: Override malformed _DSD properties for various laptops
Date: Thu,  5 Nov 2026 17:03:34 +0000
Message-ID: <20261105170341.219204-1-sbinding@opensource.cirrus.com>
X-Mailer: git-send-email 2.43.0
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0005BD62:EE_|DS7PR19MB6254:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 9eb9cc85-9504-482a-fc6b-08df3b5ec9ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|61400799027|23010399003|36860700016|82310400026|11063799006|261021123027099003|261009223027099003|261022075727099003|56012099006|261102123227099003|261021121427099003|10067099003|18002099003|16102099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	xf4g9S/k8BUZa7/cwXyudxRWUPct8kBk8/yMinY+9/AP5he/neDEO25CSjBTEJjWG0bz3tmJ049dMtQzBpkcQwdWB9BGTFDostn6228kVxL27QVg5kDCKjLv2kWyMlvC32xO1Hgo8ZP0iDAoRw8RvKseQYhWRbv/1nqdzpMj1gSY4MO0vf7s8srAceyiFGUMxPbrHyetKB8bM9twMlk416jaCnkH2z1zLDYm3kzxRWMgsbMGjBxbMLr4J/jXTdT4tdbuCIm2O3QN2rg6H/zaDNSJuithoNXLO9+LTdRAXDY4H/kDqxbhZMxbYDhhmdMyHpCNactTcP/tqnzMJo09mKQY+VW+ZD9CSMtd0KTXvfkQ9XrTamkhQ3lkqrxV7LTMzA8l/aLtb7+XLEJuSOc6tFyzGTwWBrt1CPS1dU0T14MMdKJOKoUngEiV2rpPO/pc2BhGPD/dbks6xuFDNTc7f0z3qJvTyrS6XtEBkVMQkf3ccnR7aKqsgmCLbIK5vTIvFEPSpmXTk+uRYjaduT6FM5J79y8YE6S7gdSlwn3Ei4DihN/4C5EHiJ1sFbDUXB99uWdr8+rH0vPWyc8HYwhv/mXkX8xib4BNJUVzeO0EltyPWElZoRwWBsVKp/OaNoIbRK3+1J4retst52GFeiszhlQp6FbRHkMIrtFm3tu2cZovQrJb49EYlLQ8pyywDXaF+dmTn0AJ446hg221yI1vpw==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(61400799027)(23010399003)(36860700016)(82310400026)(11063799006)(261021123027099003)(261009223027099003)(261022075727099003)(56012099006)(261102123227099003)(261021121427099003)(10067099003)(18002099003)(16102099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	jo15VnJljWy35q1mlYXIsnpqR5fuUuYENSMMauJqYAvVPcfW09tu3+dgQW0BWm/FreR5qz7OZ3Nq1nx/sbJlBY8wKWhqKC8WepFLfX4eTP4+HFKiUPS5EEpDXsE848LYpIb79H+qZfBrS+0SI4CbxpsP64Ic1u40WrB2hOmJUL/srI8brGsx2jEVoHGW3nQFNglktLCX7n16x0TqUE8Zz4H1kX5Ivoshtj6gJ/BKTamJ1QOPHbiUetkdBlXRtgThIkOd/BkJkmAFLrSoXGSOxH+cHsM9q0LuLXLWW6MHQvNGKYYDXbcGlQdXmBNpvWBPLIYF6QImdOgIQ6ngxNug7w3i7+ygA77PH4sXO1pnE6mJA9qUn4hRDeenclKUp0g38suDfK0o3PgylH0CwneWh0/K2XDA9c6dzyQLnm9b3w6K3BMC5oFUCJQSZoInIpmV
X-Exchange-RoutingPolicyChecked:
	HNoaehbG9Lxn6wfhYcHxoo/+wyWG5DP4zUfkPKZZl23nsJF/oeNNvPD3/V/02GX8YbaDiy2HGPfub/hEqlSmJ3gB3o8PTT8O+pvFfQcIE9uHfAex0ACcnZ+p5E/KBP+5iPEJw9my6lvLvpss81Z1ARhgONILblBqKMNXIJGJBaO8FeHA0Xmxic5yW3CXAMyYx/r2klLJwdRs5anMh5sGoEvICN3MFtRoxLLzj+ci1OI2CzuUjcv1sJI3+FijG1eNwOgd6hOPCc59MOUUyPxxTx8sBBSrQ0ndo7VIXvAeczpKguX7yL0e6hv08ja520l8XJgzVvWp9mWdoXFhV/LidQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 17:04:00.9578
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9eb9cc85-9504-482a-fc6b-08df3b5ec9ff
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH1PEPF0005BD62.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR19MB6254
X-Proofpoint-GUID: Mb5sxi7QUx2X76nLfAD5Iqc_EU4wotBA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA2NyBTYWx0ZWRfX/HZPvkvWNgbg
 jz1sIR3i8dBmdm7/AJMcamOW9Gu1UaKTuTLQoSchUXqYb8vN83bFGrvYq0dl9Rn0KTf/5mwWZ6t
 2Xw1cVaXHuceAWlpWQC6A6MGvAajn9tyyq5nqBxFxsB3RR4nLFFjDoghkXXGQc+wqZhgjDGpGsL
 otfNfpCiNJz5AluJgDzjq79Wt/kqwh8kSZPxzZYyWg7oVY+Nen3ZrOaFSCH1xBeRvBYaR35v8oM
 ZjbHw++Hi+WWXEg0UXxndtmuHqxU8UCFGRCVeXENUgbEfGS783RD4Qo/LX8Mi41PStqmPQ0AFlU
 7zAtxcUdrCURRfM/yNdmqIi/9y8xPGY+YLd28J9rr3INPymhUVGOTlckEczIEeUrnPoA3dCS/zL
 pD6quV6XzUbZpP3XgE5IOmk6ts0HeB60k5hVz0PJxVhL5l6BJywrZ6pxGwRfh2arMHvIO48qQ4D
 hjyjyivlnS7LXFSJtig==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA2NyBTYWx0ZWRfXzBBDY3+BlB30
 m7ZqewE1tK+GrMJ6usUqf0b3PUHmjLF2GD4/i7X5tpYaOXJ93V6FeliCIcjaBKyY8ydFycqRwGn
 KfEocfyTNFXNDjanmutZ1ghrAG6m+LI=
X-Authority-Analysis: v=2.4 cv=NK5AaE6g c=1 sm=1 tr=0 ts=6aecb79d cx=c_pps
 a=RrdOQlmmxp+bQeXV/0G7LQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=zJRp6_cAMcgA:10 a=RWc_ulEos4gA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22 a=w1d2syhTAAAA:8
 a=3-kPmqf1V8j8wntkW2sA:9
X-Proofpoint-ORIG-GUID: Mb5sxi7QUx2X76nLfAD5Iqc_EU4wotBA
X-Proofpoint-Spam-Reason: safe

Several HP laptops have malformed and incorrect _DSD properties used by
the CS35L41 HDA driver. This results in audio for those laptops being
broken. We can fix this by overriding the _DSD for those laptops,
ensuring the driver uses the correct settings.

The laptops whose _DSD will be overridden are:

- 103C8E11
- 103C8E12
- 103C8E13
- 103C8E3A
- 103C8E3B
- 103C8E60
- 103C8E61
- 103C8E62
- 103C8E75
- 103C8F57

Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
---
 .../codecs/side-codecs/cs35l41_hda_property.c | 22 ++++++++++++++++---
 1 file changed, 19 insertions(+), 3 deletions(-)

diff --git a/sound/hda/codecs/side-codecs/cs35l41_hda_property.c b/sound/hda/codecs/side-codecs/cs35l41_hda_property.c
index 958432058285..46744457b855 100644
--- a/sound/hda/codecs/side-codecs/cs35l41_hda_property.c
+++ b/sound/hda/codecs/side-codecs/cs35l41_hda_property.c
@@ -85,9 +85,17 @@ static const struct cs35l41_config cs35l41_config_table[] = {
 	{ "103C8C51", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 1000, 4100, 24 },
 	{ "103C8CDD", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 1000, 4100, 24 },
 	{ "103C8CDE", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 1000, 3900, 24 },
-	{ "103C8E13", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 1000, 4500, 24 },
-	{ "103C8E60", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 1000, 4500, 24 },
-	{ "103C8F07", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 1000, 3900, 24 },
+	{ "103C8E11", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 1000, 4000, 24 },
+	{ "103C8E12", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 1000, 4000, 24 },
+	{ "103C8E13", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 1000, 4000, 24 },
+	{ "103C8E3A", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 1000, 4000, 24 },
+	{ "103C8E3B", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 1000, 4000, 24 },
+	{ "103C8E60", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 1000, 4000, 24 },
+	{ "103C8E61", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 1000, 4000, 24 },
+	{ "103C8E62", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 1000, 4000, 24 },
+	{ "103C8E75", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 1000, 4000, 24 },
+ 	{ "103C8F07", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 1000, 3900, 24 },
+	{ "103C8F57", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 1000, 4000, 24 },
 	{ "104312AF", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 1, 2, 0, 1000, 4500, 24 },
 	{ "10431433", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 1000, 4500, 24 },
 	{ "10431463", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 1000, 4500, 24 },
@@ -544,9 +552,17 @@ static const struct cs35l41_prop_model cs35l41_prop_model_table[] = {
 	{ "CSC3551", "103C8C6A", hp_i2c_int_2amp_dual_spkid },
 	{ "CSC3551", "103C8CDD", generic_dsd_config },
 	{ "CSC3551", "103C8CDE", generic_dsd_config },
+	{ "CSC3551", "103C8E11", generic_dsd_config },
+	{ "CSC3551", "103C8E12", generic_dsd_config },
 	{ "CSC3551", "103C8E13", generic_dsd_config },
+	{ "CSC3551", "103C8E3A", generic_dsd_config },
+	{ "CSC3551", "103C8E3B", generic_dsd_config },
 	{ "CSC3551", "103C8E60", generic_dsd_config },
+	{ "CSC3551", "103C8E61", generic_dsd_config },
+	{ "CSC3551", "103C8E62", generic_dsd_config },
+	{ "CSC3551", "103C8E75", generic_dsd_config },
 	{ "CSC3551", "103C8F07", generic_dsd_config },
+	{ "CSC3551", "103C8F57", generic_dsd_config },
 	{ "CSC3551", "104312AF", generic_dsd_config },
 	{ "CSC3551", "10431433", generic_dsd_config },
 	{ "CSC3551", "10431463", generic_dsd_config },
-- 
2.43.0

