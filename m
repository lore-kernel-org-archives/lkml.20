Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793799217;
	b=pcBkbQ+8XnXEpLxPACY0nGJ+QU2ogLVNJgHfE50Nr10Lk85rO881TDAnjeyztpBUeDwX
	 FIsKKgE0ZjAZ+2Iee/e07TXyuRnUmaikwXqlZq977r6FJDVGPXgoRfmXxkotA7eHyZNRX
	 xgcqchXcTC9S3NUPXafvSKaVt5jMz0iqEBbK++2RbvAYDcrzmC5iAnqJQhdGCCFC0UQaq
	 2L/LkKc7tMczSiDtRKyYoStEQ87P4NOWOSz/IsZQ2rO5iHPe176AGw9saI+A5qNGOijzM
	 qug7NYD2TQ8gb3aDZ7GBooRHeyhXQj9l3aVHvO8P2K9lh5MaJt2JVAQ7tidxuyO6ubw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793799217;
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
	bh=vi7g2y22TrSuRNbmv+heF72mHnW4dZtOLNVz54hftqg=;
	b=UmqzZ1TGN2K9BWbzHDp7z1RB+zWZwv8fgC3X4wnZMPTvyjPgc45coMdyfOg83AFaIm+W
	 91+eYK79f38lnzxfcIexuT1ASEZtGEArbXLq+cZBI107HDF2x4B3WbHkvK00vY+rD5vVH
	 q3OR56+ZeDZ0/oIxnbVRcKGTJtKt+25QSgNPc69nIct8pE1jlL2rP+IXdmJ+WIsF71YGn
	 tj/CiOexvWZeKlBxx1FMkuMmaoXdLBZBp3Kn4qfvPy+hJZELtBWBqHyHYzXFIhtgreYGA
	 c1YbTARYVVl3ccx9UaReXlSxVZ9HeaVmeRVOHVRn7lvx4qC9Zmk/A+/cqWzrC91ziHw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=NWYetAVH;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=QceQi6db;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1069D606A31B;
	Wed,  4 Nov 2026 13:33:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1069D606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=NWYetAVH;
	dkim=pass (1024-bit key, unprotected) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=QceQi6db
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4DHgbk3429734;
	Wed, 4 Nov 2026 07:33:29 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=vi7g2y22TrSuRNbm
	v+heF72mHnW4dZtOLNVz54hftqg=; b=NWYetAVHcoILEFnItLDJrFLe2fvcOHZh
	WhFTOh6OSMh3FaUyQ36BGmixLm48xOJbTbVmLIQBmEEMPmQCr+MJwt6gcMwzD21q
	knVdEIJffMdrD4FHiEWStvWWe4//vJpcEtA41BgDd2B0/O1/+qACVwLcbSbqKYvl
	g0e1zWTPj0nGbdmH22nZM/L53rGQ6Kd0oWfG/LvXS4iJPnjw42IMprEf8ZnnpkF5
	Q/6YOGhHtg4f11W1v2JRgSv9OK7W7djh+BontuR0vE9nBIUxq4xZvzzZVZaspEZq
	W9q0I1Yxu45NV18AW1n72NrqvpMjB2PmFYiYS1roiT/6AVSIU4BGFQ==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11022122.outbound.protection.outlook.com [52.101.53.122])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4hndrfd9b7-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 04 Nov 2026 07:33:29 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hMQD5mADvRxzWO/j+yLbaIbbNGt4VYiAsAQCV8Y/QZqcsW6Y+O+27ijyTmGLw1dDQMsRD3WqYiMNJ9nL26PJ4vT8yVXDYibSk0GPMmM6SYvK9c/HeN2AI6fqMNwv5zgnLjntG2NWscRHBNV8ViX/2Dme3OQE83trbf/8LC2/G8AZMJzvwcJf3U9Fi8zMQIVA2ISmxo8Y+iXFMUtsOj6nTtGtDD8p076EOwLfjfUTQC7XFUVhIPuGkTsnA8gXvOKAljK7BitYR4rc3jzhwYSFmERSd2NenggzB6ifgM10YBglFooqim3nWpvsxsEQBuQlHy5o6xq4K4WPo3ldSXxOwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vi7g2y22TrSuRNbmv+heF72mHnW4dZtOLNVz54hftqg=;
 b=nT01kkAv+HkyGVzmaWSoLoLr+HIiwOZCuQeV/vNh98LmHHWSMqclQ53qzi9bZCEs3zI+IwyxGCRa8YsVLQlk46AtNsTu8A/n31SaJ0xxr27IGSBZ+R/sH1BRwzYD+nyFxTmDt7exVKzMz9R5otDo3lJUepbp+5qU1e1b+LmNhQZa02hUiWbAAFFsjvTx23fTDFCBpb3U4EXjTSkgfVg7COOARMNpDfiG4HA5EpLx1PPrnR0AWhZ70v/sM2G14SomL9sgnKouXa2G1LrZeqVtFV7amiJsTnW7eBKokFN8J+MnRj3rbhIB/vXJ+C5ina/67S+Y8a1XBmJWhdCRXUqI4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vi7g2y22TrSuRNbmv+heF72mHnW4dZtOLNVz54hftqg=;
 b=QceQi6dbmPQVdfvIGbdru+oOiSqc8hv4vjPjr9GkEW4icHmxPsuwsSOWFZ0irWBYxGhqvogT5JRhhfJwhTMt3WBB2keIjC5JkN2ZhXxKdLCnsEAC2JhFxLBrA8B7t0uNYiehOUp9Rm70pvUbpvEfzXPuDAHnEAigU+rPgLzvGRc=
Received: from BN9PR03CA0154.namprd03.prod.outlook.com (2603:10b6:408:f4::9)
 by EAYPR19MB873865.namprd19.prod.outlook.com (2603:10b6:303:2e2::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Wed, 4 Nov 2026
 13:33:25 +0000
Received: from BN1PEPF00018545.namprd05.prod.outlook.com
 (2603:10b6:408:f4:cafe::a0) by BN9PR03CA0154.outlook.office365.com
 (2603:10b6:408:f4::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Wed, 4
 Nov 2026 13:33:25 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN1PEPF00018545.mail.protection.outlook.com (10.167.248.4) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.5
 via Frontend Transport; Wed, 4 Nov 2026 13:33:24 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 32053406544;
	Wed,  4 Nov 2026 13:33:23 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.11])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 0E901820273;
	Wed,  4 Nov 2026 13:33:23 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH] ASoC: wm_adsp: Prevent negative string length in wm_adsp_control_add()
Date: Wed,  4 Nov 2026 13:33:22 +0000
Message-ID: <20261104133322.1085061-1-rf@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF00018545:EE_|EAYPR19MB873865:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 266ed11c-6719-4f14-0394-08df3a7833bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|61400799027|36860700016|23010399003|261026121527099003|261028144727099003|261009223027099003|261026140227099003|261022075727099003|261102123227099003|261022105027099003|261021121427099003|11063799006|56012099006|10067099003|18002099003|16102099003;
X-Microsoft-Antispam-Message-Info:
	w5/eBNRZ+OAKt0tkwxU6pgQHKqromWayW2/nGl4p8UkjNlYeM0kAtxpndqeRdoWR8SjiXZKUgGY/qWwwkYsXQ1N6weeDBJlxo0llOYprwskyF8G/vpRd599tTkMDENXCtMgEjGOqrYm/R+BjTzTKXdJBOLnG1lvBuBZDC9tBHc/Ym0w3kNa811x4P/NiPDVMbcM53TEvhM7Bihf058pzWESEOtGzkZigfhunanBjC/opj6Gm69+03PbQo4DJofIFd7MIAMNPvyNTiZdCoUdOedN/UoqwiSuAohQCzorZ/7mx8AEGpWDr4ubd2icZSdGjIo7DLBZ/Xsbu79cFPQezTvoIi5wGuru3k6wwOigb8SazoaoRR95BapnEyGpPUogFWzHzx8oRVy7DtFLaToRBGsBfD7L00Zx+Yy/e0lgZPdpjygdEJgGGyaRRSsLn20Cu5qCX5Daatch818x4QDAGJv8X4qRfzKSOOTZBP/KNj9PK7BXeM56GcFR8VdMWbjTLimOnODy6iZiUk8qIcNOyynkW2dgcicGIlFObxupB0qd/eGvIoYtrA2wXInFu9EuC94AJ37XTPNK+fu2qAezhdgYnEDVFQUa52M25lENf5dD3phKTcNtfHtEZf3AFwGOaVNi5VBbwoVIHlk/fTSqkicnJxfV3xhDBsY4HY6lxsk47OXDuA6SKBMAK8UZGicIk3sN+KoQKxiorEgJ8zL1qOQ==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(61400799027)(36860700016)(23010399003)(261026121527099003)(261028144727099003)(261009223027099003)(261026140227099003)(261022075727099003)(261102123227099003)(261022105027099003)(261021121427099003)(11063799006)(56012099006)(10067099003)(18002099003)(16102099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	W3g84NmTdgd0yZ29In7h8T6gKL0befr1DEoAz6dA3DcKxXeX0yrhCTShOHc39UFCowoJUpCAsja7R6bcz0a2j2/FklwitnjQIBunsmNqgqku8jYr1GNPjDfJZIIBKLLT4XHGdYanlccPJBAkVvfsZQIJ1cCM6QZs9DbplUgy9N4w/rSjHdJLKtNU1pAqIaWS+uXiqDRddKK0/BXfCAOwoaXTCtgrTUoSFIy1gBrNyW+51qItXz0HC8DMWxdI3WVmQmDisUbjRWv1BwuzTuRBjpUJi/GAOVpwm150T6gdAysaHhruqD6hkTbbQTSpDuSqi6RTYqvv65q66fMXa9lrS8LmXkRFyKTc8mPW5vK1Ee9WcA6h42+Zkc4kD8xf3Wd4PIH4zBneUzANbYNAunyR/AaVkpTeOeCTPRMKYO6t+nE9W/kshWz/DtB0h5tzogZb
X-Exchange-RoutingPolicyChecked:
	PZtJOdpy+K+65hSSBLXo09gyYgZDMdYaUfeVzFSz16PcLc1V9KIfBpP937hiWdk+VXpCL2BdrAiREjLcTOzO2MsvGyo4pTSfjrEo7la7A4lerHupiLndeuRTVHFTRYqWcXM+ax3JI2MKeOPAbT/l2N9b4UNyJG6yhWGGIStaYLq2zKCzQfw1Ha6v9pugNxnZR7omv7vEN4L+ANj+PaK5OQMeG0hSBd8CCRUNRpKhXFE1LnoQs3e2imfMLoGKlKm+n4H1dzbH1y+oGRUzlSa9DBkQQ/4VFn0eFkwuX2sUsavDGpvx4Kr6Z//3CLmvPXEpofipWpoWybwymaxMdpoZ1Q==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 13:33:24.6151
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 266ed11c-6719-4f14-0394-08df3a7833bb
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN1PEPF00018545.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: EAYPR19MB873865
X-Proofpoint-GUID: Ky3SYAikG6TYZyoqniAW-j6Xp9q5VxH_
X-Authority-Analysis: v=2.4 cv=HMRWhYtv c=1 sm=1 tr=0 ts=6aeb3429 cx=c_pps
 a=qP3TU6UF/Ksz6PC1wz4cYQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=_mV8fRl4U4e3mIhERrYA:9
X-Proofpoint-ORIG-GUID: Ky3SYAikG6TYZyoqniAW-j6Xp9q5VxH_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA1MyBTYWx0ZWRfX7IgcyLz8KyIt
 +zBnA28YENoWHpvjuQamAE2SUqYHgJjke2bGwbL6J5jdfZ/vlaXAUoO1DM6CpkRfQRULEny0UGO
 s7r+OOcpyEvrOutY4KtiM4NJJanpcYX9eDLL5YDlFbRCXsEOdW6vuYi0rRkD2TXbTRoGgo9bYBN
 2cFv6kBM/zsC4qkh/bGPMpzVQdjO7j3H4ba2gOC9Ky263bvDikxGcJT89KXcthCVffKt6tGPYi/
 z3XBiB+vV/7UdJys6PZXu09FL02qpfl2vjLhGCpcdeoDjJm6bvsXsQIP5T0IrvDTbEPE/qzXKVK
 NyC8gCU0qbYnCSFB7ToL6zQhAxz3ir00rAa5i2Ocus1m9a3u5adxPZnBZjYKlZQQRYXuytxAQ4H
 w4g2GCKuyydmETo20HN0qreAEu9+W8EQf/kVkcoxOdboqLWBzg5i6TH834w6bW5//eOCnD4U0Vk
 Eb9iFsBjrPVNKGd1Cpg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA1MyBTYWx0ZWRfX4NBYwiijRxFv
 LU8B6VwCWM+nJKJlfZmJwoVDJk1HxfpeSqmoIIO8F8Zc/bI6l+yEC65xMY6FFa28+czpKaUudEF
 4G2+feQfj9cUlMYi/g+lmwszlcTDqOc=
X-Proofpoint-Spam-Reason: safe

Check that avail does not become < 1 in wm_adsp_control_add(). This
prevents overflows during subsequent operations.

The main aim is to trap a negative value in avail, but a zero length
would mean that the control ends up without a name, so 1 is the smallest
valid value.

Fixes: b7ede5af62ab6 ("ASoC: wm_adsp: Take prefix into account in control name length")
Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/soc/codecs/wm_adsp.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/sound/soc/codecs/wm_adsp.c b/sound/soc/codecs/wm_adsp.c
index b8f3035af3ba1..7740a9c8ced32 100644
--- a/sound/soc/codecs/wm_adsp.c
+++ b/sound/soc/codecs/wm_adsp.c
@@ -46,6 +46,9 @@
 #define adsp_dbg(_dsp, fmt, ...) \
 	dev_dbg(_dsp->cs_dsp.dev, "%s: " fmt, _dsp->cs_dsp.name, ##__VA_ARGS__)
 
+#define adsp_warn_once(_dsp, fmt, ...) \
+	dev_warn_once(_dsp->cs_dsp.dev, "%s: " fmt, _dsp->cs_dsp.name, ##__VA_ARGS__)
+
 #define compr_err(_obj, fmt, ...) \
 	adsp_err(_obj->dsp, "%s: " fmt, _obj->name ? _obj->name : "legacy", \
 		 ##__VA_ARGS__)
@@ -625,6 +628,13 @@ int wm_adsp_control_add(struct cs_dsp_coeff_ctl *cs_ctl)
 		if (dsp->component->name_prefix)
 			avail -= strlen(dsp->component->name_prefix) + 1;
 
+		if (avail < 1) {
+			adsp_warn_once(dsp,
+				       "%.*s: ALSA prefix too long: control not created\n",
+				       cs_ctl->subname_len, cs_ctl->subname);
+			return -EINVAL;
+		}
+
 		/* Truncate the subname from the start if it is too long */
 		if (cs_ctl->subname_len > avail)
 			skip = cs_ctl->subname_len - avail;
-- 
2.47.3

