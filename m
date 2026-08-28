Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 243464078DF;
	Fri, 28 Aug 2026 10:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787911626; cv=fail; b=bZKfTcTNDd1U3XT4tyk2sUb97l9XFLlhQYYxz5Sq7P6Ar+PQQCDN529jqBrksoMnjHud/nnJb2700YnzwvdEHwQCxdLKHWzHxKO+5sOxwN/g67eN1o4NFmCHdXlxpviiFfDbNF7vxM/G/dg36AqqNxmoGDWbcndNPMnwrn6BD8M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787911626; c=relaxed/simple;
	bh=h8vfFwftCQXXG4y0n3GPsDM6GPZoMnV7G9ELwbj/hUY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Zq4KFWCYxC0ZVYwi5zfIL5rE3FQRPNHAN7osngb54QRMaAFNj0oHL/W1E6SEqIreAyFeveoNevuardr6+o46ULfSTb/gO025a1ugeJOPc78PGGk62DcGl6TwXVsbhsEFVYOulmghVVXdjFz3SS6ZojQhygbTwhaGNRD33QSxAw8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=K7K/csl1; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=e2rl8obj; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="K7K/csl1";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="e2rl8obj"
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 67SA5XI01234440;
	Fri, 28 Aug 2026 05:06:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=+rPX3A6RL9FYG
	/WrDS3qd6QCRng2OdFgJitFITOCr3A=; b=K7K/csl1TdLOX8wv5aaDfcDJzov+x
	+tP9tywiaoeRF5McUYkQdgzQaCmb8ppuUjlXtQhXaCCk7pjzai1gxAlxmWkwmvSv
	tS2SBqWNuBCv/w9CudvcSIqmxwyKI5BsVWOqXt3uSn88XDN8YAjLDRdocSWd9KYT
	rk5Z8DkGqz+g6WE7riN4/1tqmdaHk/RSZpXA5UZ7nARTMd1xL+EM748TygNqJ+M9
	+5tW3p6Mw40T/r9Z4yTGTifxQALuvbJcRi8B48VuVLZ4u5Eut55BTMtZtHt4lR0u
	D/D9wESg1pUXOYMsU8IPcnyLaS1Op/Zv1R3yRJhDs67/tkKwQSEeLBcdg==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013017.outbound.protection.outlook.com [40.93.201.17])
	by m0380145.ppops.net (PPS) with ESMTPS id 4gb5kdgv6e-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 28 Aug 2026 05:06:53 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K+DhKLj1XI2hiHqDKMtyczukUc2aIRZCafEj+m6gsox9AR9e1OdFSmkOnuXo1h6fBsdiTunUzwilsfmG2S1yiNYTfycdxPjhmnKW6N5EfwOxz94j0a3lqqeVTbQaUmr+1Mkz6l49QajnjjqNk/SIDlaY3qnnvsFSuwC45t+JYwtd1vdLpyt2jbcMtjHFigRTi7hjgPQXZTLb8O22Z4YaGt4jc3O1jDGpT87qgBbolzVkYmq1bBXl9/tkgKHsZRK2tTCNrL00jnt+5A0v5lEmT4fOYNDXy9ZQkfZkTEDt9RZInpYg/JCoUY5ljPiBRZBP9bnVxNGrqmkW1lEW7HrW8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+rPX3A6RL9FYG/WrDS3qd6QCRng2OdFgJitFITOCr3A=;
 b=d8J9gaY2bpDD3jMoXTps8B3RYxhJYBDEIfq+AxAGitAmKAfOmX96QpAULKA266pUWA2EWMjsXfj1V4uqlHJN5H1vIoJfMKcSlNDtXukjM7xNlwU1CW3CtlUTHaPeI1qwsK5NYUWJHql7BbxuwPJDLLlsPuWWfde40ui89mDYLTzK/P0bK50edNlfQ4sajqc3xKW2DzUxVVZezTCdhg7NZu/bbCHUP275liJ3xJApIwxcMtvRneUhCdYOL1w5wx4oopZnmkvlEdDP4IKrKIR3Cb3xJtSPoZSf8emEBlgkvbk0CU4eLfijIKRG7Y39pqPI+xcz/jic0zKXNK6nibynag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+rPX3A6RL9FYG/WrDS3qd6QCRng2OdFgJitFITOCr3A=;
 b=e2rl8objHirVvEGm4UgfO89yAVOdadN9naApXrk6kitr/MeA0dlJ9Uz4SdpDJtvk/nhtGfeyaGkzxWjk3rg2MBamMvL0CIcx55kqw7hEV8W2dsyBRU3KLpoFXXD+mHNRmGDHvRHeZwNytywVEDKZpjsqujm7xsUexIWOqkVEszU=
Received: from DS7PR03CA0235.namprd03.prod.outlook.com (2603:10b6:5:3ba::30)
 by DM4PR10MB6792.namprd10.prod.outlook.com (2603:10b6:8:108::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.9; Fri, 28 Aug
 2026 10:06:49 +0000
Received: from DS1PEPF00017090.namprd03.prod.outlook.com
 (2603:10b6:5:3ba:cafe::8f) by DS7PR03CA0235.outlook.office365.com
 (2603:10b6:5:3ba::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.10 via Frontend Transport; Fri,
 28 Aug 2026 10:06:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 DS1PEPF00017090.mail.protection.outlook.com (10.167.17.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Fri, 28 Aug 2026 10:06:49 +0000
Received: from DLEE207.ent.ti.com (157.170.170.95) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 28 Aug
 2026 05:06:31 -0500
Received: from DLEE208.ent.ti.com (157.170.170.97) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 28 Aug
 2026 05:06:31 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Fri, 28 Aug 2026 05:06:31 -0500
Received: from uda1253387.dhcp.ti.com (uda1253387.dhcp.ti.com [10.24.51.39])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67SA6SpX2604176;
	Fri, 28 Aug 2026 05:06:28 -0500
From: Rahul Sharma <r-sharma3@ti.com>
To: <peda@lysator.liu.se>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <r-sharma3@ti.com>, <vigneshr@ti.com>
Subject: [PATCH 0/2] Add TI's event mux router driver and build
Date: Fri, 28 Aug 2026 15:36:13 +0530
Message-ID: <20260828100615.1700223-1-r-sharma3@ti.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017090:EE_|DM4PR10MB6792:EE_
X-MS-Office365-Filtering-Correlation-Id: 2bfc21a7-2ea4-4773-6ab8-08df04ec1363
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|36860700016|82310400026|1800799024|10067099003|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
	RxDdCDaSxZI3TNFdczTeJLVRYob7QHZtyg7vcct7+l9sHSl991UTT5BWxtiBOYNkphQ6bASFPHKMobuhR8o/wCIrOCb8wGIKWFdq2dVHb9ytJqTVsKAAGZDlMapZz7h59zjgT+OzwKs3y/1d7pRS7AGSy91FmSKsv2N2rrg/WYFHvXG83rlstnnG+fe23WZoW3woSSGi6Gu8JMJmGHdLzFQUsp2qeXU6zyWpV9oygnnCL0U7nHXWaGRbRzxkqdh98Xk5hcWfZjaZCuZxq5TSk9vX+dfUCT+rtJoKFKqJgio46E8A19vZ0iNxu+RULR8CCDzps3N0CDAlJchRNMFqaZDQMCjXmN+HvmyAxWYO1dv+VnIGsKp61i3ql/j5MdWS0MUCb6fIpoF3hmPlPpxl4hIXOuA8d9a2c6vPdQtLq/mMit1yGsFNTYEZL1dMAZahdb0YReyxQ2FQppqByDk3h3KzXo3uIDHzsqfvsiVpBKp3MsQyyPnMtTYjo46E/8CGTTgtus/VBIk/MmnU8pgFfbMDISU9JTuPNZlaJJCf/e0O1SKBg6a3anASwqwml+tJMH8ywNiRtYmASVwJsVgU6AcgjWG5D/DOU+18LZ5IIj2iHd7vWmuuE8C6fXgvyL78HESvI1/J31TKtBX1HcQGBpTxBYl2L9dedcVm6YD05Fg2HR5YuDh/UlKua+CxWB3TWH8lkGi5Qsvtah0L3k1kgA==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(36860700016)(82310400026)(1800799024)(10067099003)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	AA4kywweovDqJTBtw2h1JT+XXmYM1oDqPBad1089UtFXYI4xIgi+yKt2u+e5y1ObdgjNSzlvWgsqFSd4fGbygKJC3NyCgKqp4qCB6N8+aN2Ow3oqJ7+xGIKO+VsBzLx6/Ac8dYCwqVoOf7mY+zPOAmX9GfPGCpu9Lt+7yVhVRkT41r1Njas/wawtDTuM2m7v5wJC1nBe3Dd8n1OWHFfQeOvJ0lW8eB3nbbIjLeNhmfQ7Tna5FNYMtFv5/DRfdv7n/+ZvLhKICIvitWYELFGnYdEZOuXlLdmcixm0x4VeMDAwqsNtCMnZHthpZrcGc+2Re64Yw5ysvfLIErfWtnTe4dV6vKDR0GqyB8PRDoPxUN8Cncp5qubtDhLb6i2XFHNR2sGu7gn5P27AqOEe6dbUEqkJz4wGdGCOpaqjYfhh/gvn77mTKCEnx7Ois8Iyeg1P
X-Exchange-RoutingPolicyChecked:
	4FdnX2t3RA9Jt7IAmhI8NhTn0NdI2B5Fz4E7R2PyFyTJtD5x+SMLQyyDDK5+F72NG5pAoGX8by2+HD9zwiCTtvoXxFtC3FIXyDCEE7tSiEP1i+ToVDN1p4bcDZsXRa2ihuJRLoC5YM8pevvKtqyYj+QmRKrpN4ZqCpH42Z/9UNLXFSAqJ5u/htS7pv3Y0hJWmOCKcB8LGHHuHR6eionU9EwCotxOUC0y4ebXdVXYJ2eZPnMaqwyZE5CYbIHs1CUwJLzD0ZPVEcBMJEyAQQbYYEGdovX1lZtIcLpKWjq3r8mm3JOEoLi3D7dJyLT3oGQ4treKfduvo7mKcjv+rR6wOA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2026 10:06:49.3035
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bfc21a7-2ea4-4773-6ab8-08df04ec1363
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017090.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6792
X-Proofpoint-ORIG-GUID: uaRrSZUAasdv7HgKhiuAGAdn7eu4ZrPL
X-Proofpoint-GUID: uaRrSZUAasdv7HgKhiuAGAdn7eu4ZrPL
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDA4NiBTYWx0ZWRfX+o+hV4wiXimR
 0A6VtOT3qOv7tSOmGqWIotLrId7Q8F/+fjUevIe40YmGLLmA5UjRk3YIXagQR75cJpnypv/trym
 gDPc6LawKKOqRtSSjmFRyWPRaGFQwCU=
X-Authority-Analysis: v=2.4 cv=UPPt2ify c=1 sm=1 tr=0 ts=6a915dbd cx=c_pps
 a=pBKQozjnJ70feg1GU/QmFg==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=VJ4mqK8Euc-IYEp4kqAA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDA4NiBTYWx0ZWRfXzIjv9VqPq9Dj
 YbIj5pqMmHwjY3wd13HNxkviRV8LQZ/zWt3Rct6C98FHpYKGWaeLdXVtfl5uSsF2TvFjLOm8eR4
 rmP7zAB8tn3xIeoF82aKZwCHkYeZxTl5Dg19kmnk0RAzOJqwMXhDVWc8u/cc/FvsYQOZGsj+Krs
 HWf6nfCpqJViCXFNTqJBQoZQ8gOwa/FZo6Obm2k2rSXk3mSVUK72aiA7e6GRXsVMnFoT7ywVHez
 Yi9oVHEX6+DwSors92BEoROgECp5Ppog8btVvs8glU9+BQ6Bl7jbVGkBbNgB4yIqTmDU5HS9brX
 bSyfu83+ragcUZtN+CrShoQ+nlWOVElGMpJ/NdLS1zkhFhr5/cYUCLFTFM1c46UDzqCMF64C2Qq
 z2YgI+vdtIsckx8jghWjK6Cd3H1D5meJVc8/FOBOw2li6KqfjL538j+cXbXe/y72QUfM1iX3SWU
 PZlftcQLWFdvNqQvcwg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 clxscore=1011 spamscore=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608280086

This series contains the event mux router support present in TI's K3
platforms. The event mux router are of 2 types
1) gpio-mux router
2) timesync router

In normal scenarios, GPIO signals are received by CPU via GIC, but the
gpio mux router routes the incoming GPIO signal to BCDMA(Block copy
DMA) which the DMA upon receiving uses as HW triger to perform a single
block transfer or as configured.

Time sync router achieves the same but for the time synchronization based
events.

This driver supports both the routers but this patch series adds support
only for GPIO-mux router.

Rahul Sharma (2):
  dt-bindings: mux-controller: ti: add binding for event mux router
  mux-controller: ti: add driver for event mux router

 .../mux/ti,am62l-event-mux-router.yaml        |  79 ++++++
 drivers/mux/Kconfig                           |  15 ++
 drivers/mux/Makefile                          |   2 +
 drivers/mux/ti-k3-event-mux.c                 | 235 ++++++++++++++++++
 4 files changed, 331 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mux/ti,am62l-event-mux-router.yaml
 create mode 100644 drivers/mux/ti-k3-event-mux.c

-- 
2.34.1

