Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03527347FC0
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 20:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790713103; cv=fail; b=vB0eyPLWrZIgvVaKdrbw6jRx8gFKGkA6N77iWV9844WNMvr21uSfTYxAAhEnf+OxAwFdHCDZZys8fk9KotxQZ7GEBNqh8eNmI9BLbStcLTiZsAkKI+UWoD/zPBuv2RPbVCPIBa2VXuOf1+9+JyQYpV0Mm9qsrsFET3oQphrIVSI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790713103; c=relaxed/simple;
	bh=T4pUDNvEsf2OE6uZsA3GrATfQEnQiIJakroN5G1ed+I=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QPXJrV2PT7wLBIwmAiVP41um05tuDZVWwsFSyfEoYMCCCOEoG3NMUe2lJwfOWw8gc0Ccqia1br+DyU8GrwBlXR6xoFMzUvG1Mx0JNdo3Fe8b/OsmoQBUJJcvR4SAUwnsxC1oUlYRia3hIa/o7xWnOjEqgZsrrcdjFNoW/+MqNWU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=jdqjJFDW; dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b=LFnJTDiQ; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="jdqjJFDW";
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b="LFnJTDiQ"
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68TFeYHm152400;
	Tue, 29 Sep 2026 15:18:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=zKvGuyjT7CPwRvFsCaLuac6IZAwr8qYn9wB/Py3yk
	GY=; b=jdqjJFDW7On0PYRU7DRs2S2LIQsGcXOldPIl0yGNCCxniMprLI9dIcNKS
	pezyUwH4ci0F0cRYYWlM0eTdGBWTYJgTgVlwtpHCXfz9/T3Ub/kwvWy9U+VSCunJ
	w6Jels/giLkU3A8RBUZSOTzDX61vKhmcoXQEdlKmaJnBQ8RmIYiFD3RzvpmYiRd5
	UPgMOx0E664SlRUR/rJNE4fWNQLy7nlB7lDrX6przj0G48dKFjEleifLJulJBePt
	G2LMbMASc4BNWq+kbBS7HTyAqbMi515qmWbF3/8lr3WY7XJirk7U524iZCDcQrZG
	uClOEgxa7TxOpjvJ+7XHhS0U84dvA==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011044.outbound.protection.outlook.com [52.101.57.44])
	by m0380145.ppops.net (PPS) with ESMTPS id 4h099y45ek-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 29 Sep 2026 15:18:15 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r4+3QiU5pxopwri7XvWwkTr2fynQAw7ckIRd/K3Fe/bn0N4siYEluyHOJFKGEZybewTVU8BCVeTUiEoLy4gLmdlm3osaGR8g6IJA6Z8D/g64ZVpyxAotZGL/NYytPJ+fuvq4RoUCwebWQgN6FOkkUpUPPbfQzw8VeCtltCtotfe253ri5Fa8FTL/Ro3S97+xKq8f6G5gFArUSsZ/sZsVAK0xJB3V1Cn/qQO9rp3EsB5v6YqR53XxaZUlQEXBl6FQrbqnzPCooHYhmbKhFDv2M/t8RIMh6OrDP1zlT/bVtGRjPcUEmKiKYre/jPe+vSsNyFdpRqLnuStDAz9KdPdk+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zKvGuyjT7CPwRvFsCaLuac6IZAwr8qYn9wB/Py3ykGY=;
 b=g4iRhIcukK/O3j1cTJ7qt8NS73FG4lRkJyvod2mUaIBVJRsUz3IW++bq2owCaDbFAGkXbxmQBNhGRw7iYpEPIpJoCUF6m295Mtcn2rgI+T1bnmjjQxv7WcLMOEHSgbT2cqRdml1pMjMlL6p4rl8E9Iw/UWTiBCllpQ9hG7ijD7fiTi6nKegBumxM17M31FYjsE2tCDWpP2BMSVbcLDxlWue9XYW19dKneyQ3J65pJiepUypC+dw1Dsy8u0SYbxVG55M6QcAD81DL7rkCfpuzDR6/AjdCGh6PbCe7iP8laRd9mKmei2ZCL6KgT8JIkAw1m0aO7q2hPde/0ddkuxU1Fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zKvGuyjT7CPwRvFsCaLuac6IZAwr8qYn9wB/Py3ykGY=;
 b=LFnJTDiQ5VO8BMvACLB5pFGlzTlrNpJyEmQSzN+dYeV9x6Pw2yDpI/IiTOIZJnTV6dwd/up0vA1K2zbA5yDQkKpIVubA+CUbM01CdgtLHg/eASbQGoOzM5NfifiwHkjIwkslOr7rdy5xELgQowSw4PLi0uB9KJCxKAI7dC2l3DI=
Received: from BLAPR03CA0023.namprd03.prod.outlook.com (2603:10b6:208:32b::28)
 by CO1PR10MB4548.namprd10.prod.outlook.com (2603:10b6:303:97::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.14; Tue, 29 Sep
 2026 20:18:13 +0000
Received: from BN2PEPF000044A9.namprd04.prod.outlook.com
 (2603:10b6:208:32b:cafe::2e) by BLAPR03CA0023.outlook.office365.com
 (2603:10b6:208:32b::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.24 via Frontend Transport; Tue,
 29 Sep 2026 20:18:12 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BN2PEPF000044A9.mail.protection.outlook.com (10.167.243.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Tue, 29 Sep 2026 20:18:12 +0000
Received: from DLEE201.ent.ti.com (157.170.170.76) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 29 Sep
 2026 15:17:53 -0500
Received: from DLEE214.ent.ti.com (157.170.170.117) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 29 Sep
 2026 15:17:53 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 29 Sep 2026 15:17:53 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [10.24.50.162])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68TKHlMZ1688208;
	Tue, 29 Sep 2026 15:17:51 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <nm@ti.com>, <kristo@kernel.org>, <ssantosh@kernel.org>, <afd@ti.com>,
        <vigneshr@ti.com>, <u-kumar1@ti.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <b-padhi@ti.com>
Subject: [PATCH 01/22] firmware: ti_sci: Move error message handling into ti_sci_get_one_xfer()
Date: Wed, 30 Sep 2026 01:47:25 +0530
Message-ID: <20260929201746.4078803-2-b-padhi@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260929201746.4078803-1-b-padhi@ti.com>
References: <20260929201746.4078803-1-b-padhi@ti.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A9:EE_|CO1PR10MB4548:EE_
X-MS-Office365-Filtering-Correlation-Id: c65742e4-9a91-4697-ea7c-08df1e66c98e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|36860700016|376014|82310400026|22082099003|18002099003|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	I1oWgJstVvOiiO9gSfEtb8qRU16ll95IUzMgf/dxmoGLYqBqGLRyiBgzaM0O06Ul58C6I906foYHVxgnEBtTB+y4uP9244Ju8tkw8Eo8AbHSiAB8f4ujajJC8qMVQvPs036SF7QBN2zEkxGDP7SpyWKcWQ0tga9Eg8nHSLnXZ+J51VheW7SNv5PLNhsmVvOiV/mFUOgDbr2uSLMf6PlN/QkGQKShtP0w+t00futCGsyfXOkmPCmq0LmNeRe02iSASbMEj8gt5pyNBkLn3is9p8GUNEhH6A3qLsdRKURoLeZcDRdTWtV1ETZOYfopD6ru8duvKxF5qGtrpCZLVMHpDyRgJZNsL9mpfh/vh3c6UHaHLlSMj4Y5STnFUAfhxQs0Mpl5TZ3g4VV51bvm3rrff08dps+MnnnVCAlvk9+RD4NT5HS4uCVErCRzKJRBe/Nzf2Lbs0smtdP6cI/B1AdqnB8JrM2hZcK+RJ13wOrmlZcAnu8J3pSaByCTHg1XBdx2ZY47Z0QfA1OT8dEl1eGbScNnA9oD8S9rdbPKw2BgOk3lGAwji+dfc9o0zmREAlr0Rd57zlXtDS4yihfvJndlOT2yt0aJn6jQlV52NVNAPubitxMby/sqYD5IDN4fmbbO7FsoO+gU3GdT8ho6CXGhWJdyN1YKn09UX40vEJoJij6dHjI4Xt63wB6IOdXs9MzMUoFIK5qBkDqo9gbfN6xYtQ==
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(36860700016)(376014)(82310400026)(22082099003)(18002099003)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	wF6XGobQwRFGQB5ax4trhFEZixWjE0DB48Fd7Mpk9tO//5obkyccC6DOp0Wp0tIWLkko7ufNtfbuJY2k7Iipskr1mK7TlHMxs1/dAQriA7MNBRztQG0tugPa/go/H9WhedMzjt2FW//3g12LV4XlKa0lyDzoghuBYAoVy6ChvQIThHyZxtorYuWhm9OB5+NxlLKYb2TjIrIDFnFj3WZTmdYiK4pO4fJbyN7/TARI6BkBN2RATqjkNREEpcIXIjBhv5tkbDXljZyfYw0Nzv/zyeoU4iBygNOh5xNAmYctzwGeSKXvIsRoOpqlxGMgAplKPCXXbmaqOmt6fVHck6uc4hXKuUE8+4DzYXMEQSHMLBgOR72KGc0a/twXC2cgGEIR0Qp1bty0NZQefa5Z1tu9EQF9U6C0Fh/aIC23Mk77z9sbrG3fdMkOzTC7XCiXbE37
X-Exchange-RoutingPolicyChecked:
	FOejh2Oo4acacZ1NOeNhdHr3GZrZxoM21PvO8G4Dub+pTUHx7J550ZYoAe/5N0Fc5DeODj9vnzyGFPP0/SLY2mFgw4NeBtVMVzFNAivT+tK+MtWRW2Rnql7VTZTb39eH57W8nLA4v3LkRN+2b++49LiqEVzlqlnu8Ic3aPdT2BFIV9Qh+C3M+uXsn1zvmQkOg70vJp4yFvK5Awkv6ns8leMv8+ctQmD7T2UbSgHSp6HmNJ9M5Iyb+paAUhxLJpRqMee7W+ZJemFUfQZgQ5wrrLvwGOf8Jk6TF6LVW+ABXvYBugkSe7azcj9HAhpX6Y3UXU1KSVfe5xVWDVru/DsWog==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 20:18:12.5813
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c65742e4-9a91-4697-ea7c-08df1e66c98e
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044A9.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4548
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA4MCBTYWx0ZWRfX5oeGxVXhFGPf
 8NpIsGSpgDj3rdnrGrVhpTTsyGtdcl4VnlpC604U6xPI5DkqMLy7sYk9XtsSd6e5ZffYLyBGNGj
 9RvrGhEHhrayo6szEszfWR+dV9i2iThnuXXxiVzfuCglrGwlkcFgQN5btc/MTgh6m6sK1C9EtNE
 7FA3LGegcAeFiq/4Kebe9oU20JAnaWqItpfYIongazpVGUjEk+E/4x947H6gUAPIq1VO/bx/Eu9
 yY9wDgkYJ9QN08v1NOpBQDG42x8KaFrtZBO5Zhmv5TPia16c3jPEdFcWZrsjldc/dYdESWXwUBX
 Ypj+QlwbVvj0bY0l92OH5PZz/P4rh3fYuxlqZ7h9SDneLS98BwvrcBLhPhB1i9c7/058+P+Ud9C
 SjbJQp1ZhJ0DUHRhGJ4KLIAc/wHztQ4eBPg1wm3OXwDVP5VQYQmJBX8MwbDvlwwY1OSSXbqnnLE
 83jEHqjhenSqK22UeNA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA4MCBTYWx0ZWRfX6G5u8dARdpbx
 /mbKkfZ9aw1JNFK1BQOqE1x+yQrzcOWRIllEsbPDgWz922gC8vGj3Ny3QCVKxxPGcyqAeRvL80V
 Ug7WJjfVM/4o3qlevpUvUHtIF4ZKwtc=
X-Authority-Analysis: v=2.4 cv=GdGCDgXL c=1 sm=1 tr=0 ts=6abc1d07 cx=c_pps
 a=gloqVtDXM1sObRb+4R+w3g==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=sozttTNsAAAA:8 a=NjKYTb1M58wiEBSgNdIA:9
X-Proofpoint-GUID: vj0F_7bRRsr0nOw92moTD9nC-zqGjJLb
X-Proofpoint-ORIG-GUID: vj0F_7bRRsr0nOw92moTD9nC-zqGjJLb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 malwarescore=0 clxscore=1011
 suspectscore=0 impostorscore=0 priorityscore=1501 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290080

From: Andrew Davis <afd@ti.com>

This allows for more exact error message than just "Message alloc failed",
and also removes the redundant message printing code from each call site.

Signed-off-by: Andrew Davis <afd@ti.com>
Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
---
 drivers/firmware/ti_sci.c | 278 +++++++++++++++-----------------------
 1 file changed, 106 insertions(+), 172 deletions(-)

diff --git a/drivers/firmware/ti_sci.c b/drivers/firmware/ti_sci.c
index 5fa63ff7c74a6..5e7d04754913e 100644
--- a/drivers/firmware/ti_sci.c
+++ b/drivers/firmware/ti_sci.c
@@ -315,6 +315,7 @@ static struct ti_sci_xfer *ti_sci_get_one_xfer(struct ti_sci_info *info,
 					       size_t rx_message_size)
 {
 	struct ti_sci_xfers_info *minfo = &info->minfo;
+	struct device *dev = info->dev;
 	struct ti_sci_xfer *xfer;
 	struct ti_sci_msg_hdr *hdr;
 	unsigned long flags;
@@ -326,8 +327,11 @@ static struct ti_sci_xfer *ti_sci_get_one_xfer(struct ti_sci_info *info,
 	/* Ensure we have sane transfer sizes */
 	if (rx_message_size > info->desc->max_msg_size ||
 	    tx_message_size > info->desc->max_msg_size ||
-	    rx_message_size < sizeof(*hdr) || tx_message_size < sizeof(*hdr))
+	    rx_message_size < sizeof(*hdr) || tx_message_size < sizeof(*hdr)) {
+		dev_err(dev, "TI-SCI message size out of range (caller: %pS)\n",
+			(void *)_RET_IP_);
 		return ERR_PTR(-ERANGE);
+	}
 
 	/*
 	 * Ensure we have only controlled number of pending messages.
@@ -336,8 +340,11 @@ static struct ti_sci_xfer *ti_sci_get_one_xfer(struct ti_sci_info *info,
 	 */
 	timeout = msecs_to_jiffies(info->desc->max_rx_timeout_ms) * 5;
 	ret = down_timeout(&minfo->sem_xfer_count, timeout);
-	if (ret < 0)
+	if (ret < 0) {
+		dev_err(dev, "TI-SCI timeout waiting for transfer semaphore (caller: %pS)\n",
+			(void *)_RET_IP_);
 		return ERR_PTR(ret);
+	}
 
 	/* Keep the locked section as small as possible */
 	spin_lock_irqsave(&minfo->xfer_lock, flags);
@@ -481,11 +488,8 @@ static int ti_sci_cmd_get_revision(struct ti_sci_info *info)
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 				   sizeof(struct ti_sci_msg_hdr),
 				   sizeof(*rev_info));
-	if (IS_ERR(xfer)) {
-		ret = PTR_ERR(xfer);
-		dev_err(dev, "Message alloc failed(%d)\n", ret);
-		return ret;
-	}
+	if (IS_ERR(xfer))
+		return PTR_ERR(xfer);
 
 	rev_info = (struct ti_sci_msg_resp_version *)xfer->xfer_buf;
 
@@ -549,11 +553,9 @@ static int ti_sci_set_device_state(const struct ti_sci_handle *handle,
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_SET_DEVICE_STATE,
 				   flags | TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 				   sizeof(*req), sizeof(*resp));
-	if (IS_ERR(xfer)) {
-		ret = PTR_ERR(xfer);
-		dev_err(dev, "Message alloc failed(%d)\n", ret);
-		return ret;
-	}
+	if (IS_ERR(xfer))
+		return PTR_ERR(xfer);
+
 	req = (struct ti_sci_msg_req_set_device_state *)xfer->xfer_buf;
 	req->id = id;
 	req->state = state;
@@ -610,11 +612,9 @@ static int ti_sci_get_device_state(const struct ti_sci_handle *handle,
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_GET_DEVICE_STATE,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 				   sizeof(*req), sizeof(*resp));
-	if (IS_ERR(xfer)) {
-		ret = PTR_ERR(xfer);
-		dev_err(dev, "Message alloc failed(%d)\n", ret);
-		return ret;
-	}
+	if (IS_ERR(xfer))
+		return PTR_ERR(xfer);
+
 	req = (struct ti_sci_msg_req_get_device_state *)xfer->xfer_buf;
 	req->id = id;
 
@@ -912,11 +912,9 @@ static int ti_sci_cmd_set_device_resets(const struct ti_sci_handle *handle,
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_SET_DEVICE_RESETS,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 				   sizeof(*req), sizeof(*resp));
-	if (IS_ERR(xfer)) {
-		ret = PTR_ERR(xfer);
-		dev_err(dev, "Message alloc failed(%d)\n", ret);
-		return ret;
-	}
+	if (IS_ERR(xfer))
+		return PTR_ERR(xfer);
+
 	req = (struct ti_sci_msg_req_set_device_resets *)xfer->xfer_buf;
 	req->id = id;
 	req->resets = reset_state;
@@ -987,11 +985,9 @@ static int ti_sci_set_clock_state(const struct ti_sci_handle *handle,
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_SET_CLOCK_STATE,
 				   flags | TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 				   sizeof(*req), sizeof(*resp));
-	if (IS_ERR(xfer)) {
-		ret = PTR_ERR(xfer);
-		dev_err(dev, "Message alloc failed(%d)\n", ret);
-		return ret;
-	}
+	if (IS_ERR(xfer))
+		return PTR_ERR(xfer);
+
 	req = (struct ti_sci_msg_req_set_clock_state *)xfer->xfer_buf;
 	req->dev_id = dev_id;
 	if (clk_id < 255) {
@@ -1055,11 +1051,9 @@ static int ti_sci_cmd_get_clock_state(const struct ti_sci_handle *handle,
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_GET_CLOCK_STATE,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 				   sizeof(*req), sizeof(*resp));
-	if (IS_ERR(xfer)) {
-		ret = PTR_ERR(xfer);
-		dev_err(dev, "Message alloc failed(%d)\n", ret);
-		return ret;
-	}
+	if (IS_ERR(xfer))
+		return PTR_ERR(xfer);
+
 	req = (struct ti_sci_msg_req_get_clock_state *)xfer->xfer_buf;
 	req->dev_id = dev_id;
 	if (clk_id < 255) {
@@ -1286,11 +1280,9 @@ static int ti_sci_cmd_clk_set_parent(const struct ti_sci_handle *handle,
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_SET_CLOCK_PARENT,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 				   sizeof(*req), sizeof(*resp));
-	if (IS_ERR(xfer)) {
-		ret = PTR_ERR(xfer);
-		dev_err(dev, "Message alloc failed(%d)\n", ret);
-		return ret;
-	}
+	if (IS_ERR(xfer))
+		return PTR_ERR(xfer);
+
 	req = (struct ti_sci_msg_req_set_clock_parent *)xfer->xfer_buf;
 	req->dev_id = dev_id;
 	if (clk_id < 255) {
@@ -1354,11 +1346,9 @@ static int ti_sci_cmd_clk_get_parent(const struct ti_sci_handle *handle,
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_GET_CLOCK_PARENT,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 				   sizeof(*req), sizeof(*resp));
-	if (IS_ERR(xfer)) {
-		ret = PTR_ERR(xfer);
-		dev_err(dev, "Message alloc failed(%d)\n", ret);
-		return ret;
-	}
+	if (IS_ERR(xfer))
+		return PTR_ERR(xfer);
+
 	req = (struct ti_sci_msg_req_get_clock_parent *)xfer->xfer_buf;
 	req->dev_id = dev_id;
 	if (clk_id < 255) {
@@ -1424,11 +1414,9 @@ static int ti_sci_cmd_clk_get_num_parents(const struct ti_sci_handle *handle,
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_GET_NUM_CLOCK_PARENTS,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 				   sizeof(*req), sizeof(*resp));
-	if (IS_ERR(xfer)) {
-		ret = PTR_ERR(xfer);
-		dev_err(dev, "Message alloc failed(%d)\n", ret);
-		return ret;
-	}
+	if (IS_ERR(xfer))
+		return PTR_ERR(xfer);
+
 	req = (struct ti_sci_msg_req_get_clock_num_parents *)xfer->xfer_buf;
 	req->dev_id = dev_id;
 	if (clk_id < 255) {
@@ -1503,11 +1491,9 @@ static int ti_sci_cmd_clk_get_match_freq(const struct ti_sci_handle *handle,
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_QUERY_CLOCK_FREQ,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 				   sizeof(*req), sizeof(*resp));
-	if (IS_ERR(xfer)) {
-		ret = PTR_ERR(xfer);
-		dev_err(dev, "Message alloc failed(%d)\n", ret);
-		return ret;
-	}
+	if (IS_ERR(xfer))
+		return PTR_ERR(xfer);
+
 	req = (struct ti_sci_msg_req_query_clock_freq *)xfer->xfer_buf;
 	req->dev_id = dev_id;
 	if (clk_id < 255) {
@@ -1579,11 +1565,9 @@ static int ti_sci_cmd_clk_set_freq(const struct ti_sci_handle *handle,
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_SET_CLOCK_FREQ,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 				   sizeof(*req), sizeof(*resp));
-	if (IS_ERR(xfer)) {
-		ret = PTR_ERR(xfer);
-		dev_err(dev, "Message alloc failed(%d)\n", ret);
-		return ret;
-	}
+	if (IS_ERR(xfer))
+		return PTR_ERR(xfer);
+
 	req = (struct ti_sci_msg_req_set_clock_freq *)xfer->xfer_buf;
 	req->dev_id = dev_id;
 	if (clk_id < 255) {
@@ -1644,11 +1628,9 @@ static int ti_sci_cmd_clk_get_freq(const struct ti_sci_handle *handle,
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_GET_CLOCK_FREQ,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 				   sizeof(*req), sizeof(*resp));
-	if (IS_ERR(xfer)) {
-		ret = PTR_ERR(xfer);
-		dev_err(dev, "Message alloc failed(%d)\n", ret);
-		return ret;
-	}
+	if (IS_ERR(xfer))
+		return PTR_ERR(xfer);
+
 	req = (struct ti_sci_msg_req_get_clock_freq *)xfer->xfer_buf;
 	req->dev_id = dev_id;
 	if (clk_id < 255) {
@@ -1711,11 +1693,8 @@ static int ti_sci_cmd_prepare_sleep(const struct ti_sci_handle *handle, u8 mode,
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_PREPARE_SLEEP,
 				   msg_flags,
 				   sizeof(*req), sizeof(*resp));
-	if (IS_ERR(xfer)) {
-		ret = PTR_ERR(xfer);
-		dev_err(dev, "Message alloc failed(%d)\n", ret);
-		return ret;
-	}
+	if (IS_ERR(xfer))
+		return PTR_ERR(xfer);
 
 	req = (struct ti_sci_msg_req_prepare_sleep *)xfer->xfer_buf;
 	req->mode = mode;
@@ -1775,11 +1754,8 @@ static int ti_sci_msg_cmd_query_fw_caps(const struct ti_sci_handle *handle,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 				   sizeof(struct ti_sci_msg_hdr),
 				   sizeof(*resp));
-	if (IS_ERR(xfer)) {
-		ret = PTR_ERR(xfer);
-		dev_err(dev, "Message alloc failed(%d)\n", ret);
-		return ret;
-	}
+	if (IS_ERR(xfer))
+		return PTR_ERR(xfer);
 
 	ret = ti_sci_do_xfer(info, xfer);
 	if (ret) {
@@ -1832,11 +1808,9 @@ static int ti_sci_cmd_set_io_isolation(const struct ti_sci_handle *handle,
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_SET_IO_ISOLATION,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 				   sizeof(*req), sizeof(*resp));
-	if (IS_ERR(xfer)) {
-		ret = PTR_ERR(xfer);
-		dev_err(dev, "Message alloc failed(%d)\n", ret);
-		return ret;
-	}
+	if (IS_ERR(xfer))
+		return PTR_ERR(xfer);
+
 	req = (struct ti_sci_msg_req_set_io_isolation *)xfer->xfer_buf;
 	req->state = state;
 
@@ -1890,11 +1864,8 @@ static int ti_sci_msg_cmd_lpm_wake_reason(const struct ti_sci_handle *handle,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 				   sizeof(struct ti_sci_msg_hdr),
 				   sizeof(*resp));
-	if (IS_ERR(xfer)) {
-		ret = PTR_ERR(xfer);
-		dev_err(dev, "Message alloc failed(%d)\n", ret);
-		return ret;
-	}
+	if (IS_ERR(xfer))
+		return PTR_ERR(xfer);
 
 	ret = ti_sci_do_xfer(info, xfer);
 	if (ret) {
@@ -1954,11 +1925,9 @@ static int ti_sci_cmd_set_device_constraint(const struct ti_sci_handle *handle,
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_LPM_SET_DEVICE_CONSTRAINT,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 				   sizeof(*req), sizeof(*resp));
-	if (IS_ERR(xfer)) {
-		ret = PTR_ERR(xfer);
-		dev_err(dev, "Message alloc failed(%d)\n", ret);
-		return ret;
-	}
+	if (IS_ERR(xfer))
+		return PTR_ERR(xfer);
+
 	req = (struct ti_sci_msg_req_lpm_set_device_constraint *)xfer->xfer_buf;
 	req->id = id;
 	req->state = state;
@@ -2011,11 +1980,9 @@ static int ti_sci_cmd_set_latency_constraint(const struct ti_sci_handle *handle,
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_LPM_SET_LATENCY_CONSTRAINT,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 				   sizeof(*req), sizeof(*resp));
-	if (IS_ERR(xfer)) {
-		ret = PTR_ERR(xfer);
-		dev_err(dev, "Message alloc failed(%d)\n", ret);
-		return ret;
-	}
+	if (IS_ERR(xfer))
+		return PTR_ERR(xfer);
+
 	req = (struct ti_sci_msg_req_lpm_set_latency_constraint *)xfer->xfer_buf;
 	req->latency = latency;
 	req->state = state;
@@ -2056,11 +2023,9 @@ static int ti_sci_cmd_lpm_abort(struct device *dev)
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_LPM_ABORT,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 				   sizeof(*req), sizeof(*resp));
-	if (IS_ERR(xfer)) {
-		ret = PTR_ERR(xfer);
-		dev_err(dev, "Message alloc failed(%d)\n", ret);
-		return ret;
-	}
+	if (IS_ERR(xfer))
+		return PTR_ERR(xfer);
+
 	req = (struct ti_sci_msg_hdr *)xfer->xfer_buf;
 
 	ret = ti_sci_do_xfer(info, xfer);
@@ -2100,11 +2065,9 @@ static int ti_sci_cmd_core_reboot(const struct ti_sci_handle *handle)
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_SYS_RESET,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 				   sizeof(*req), sizeof(*resp));
-	if (IS_ERR(xfer)) {
-		ret = PTR_ERR(xfer);
-		dev_err(dev, "Message alloc failed(%d)\n", ret);
-		return ret;
-	}
+	if (IS_ERR(xfer))
+		return PTR_ERR(xfer);
+
 	req = (struct ti_sci_msg_req_reboot *)xfer->xfer_buf;
 
 	ret = ti_sci_do_xfer(info, xfer);
@@ -2162,11 +2125,8 @@ static int ti_sci_get_resource_range(const struct ti_sci_handle *handle,
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_GET_RESOURCE_RANGE,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 				   sizeof(*req), sizeof(*resp));
-	if (IS_ERR(xfer)) {
-		ret = PTR_ERR(xfer);
-		dev_err(dev, "Message alloc failed(%d)\n", ret);
-		return ret;
-	}
+	if (IS_ERR(xfer))
+		return PTR_ERR(xfer);
 
 	req = (struct ti_sci_msg_req_get_resource_range *)xfer->xfer_buf;
 	req->secondary_host = s_host;
@@ -2283,11 +2243,9 @@ static int ti_sci_manage_irq(const struct ti_sci_handle *handle,
 
 	xfer = ti_sci_get_one_xfer(info, type, TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 				   sizeof(*req), sizeof(*resp));
-	if (IS_ERR(xfer)) {
-		ret = PTR_ERR(xfer);
-		dev_err(dev, "Message alloc failed(%d)\n", ret);
-		return ret;
-	}
+	if (IS_ERR(xfer))
+		return PTR_ERR(xfer);
+
 	req = (struct ti_sci_msg_req_manage_irq *)xfer->xfer_buf;
 	req->valid_params = valid_params;
 	req->src_id = src_id;
@@ -2607,11 +2565,9 @@ static int ti_sci_cmd_rm_ring_cfg(const struct ti_sci_handle *handle,
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_RM_RING_CFG,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 				   sizeof(*req), sizeof(*resp));
-	if (IS_ERR(xfer)) {
-		ret = PTR_ERR(xfer);
-		dev_err(dev, "RM_RA:Message config failed(%d)\n", ret);
-		return ret;
-	}
+	if (IS_ERR(xfer))
+		return PTR_ERR(xfer);
+
 	req = (struct ti_sci_msg_rm_ring_cfg_req *)xfer->xfer_buf;
 	req->valid_params = params->valid_params;
 	req->nav_id = params->nav_id;
@@ -2671,11 +2627,9 @@ static int ti_sci_cmd_rm_psil_pair(const struct ti_sci_handle *handle,
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_RM_PSIL_PAIR,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 				   sizeof(*req), sizeof(*resp));
-	if (IS_ERR(xfer)) {
-		ret = PTR_ERR(xfer);
-		dev_err(dev, "RM_PSIL:Message reconfig failed(%d)\n", ret);
-		return ret;
-	}
+	if (IS_ERR(xfer))
+		return PTR_ERR(xfer);
+
 	req = (struct ti_sci_msg_psil_pair *)xfer->xfer_buf;
 	req->nav_id = nav_id;
 	req->src_thread = src_thread;
@@ -2727,11 +2681,9 @@ static int ti_sci_cmd_rm_psil_unpair(const struct ti_sci_handle *handle,
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_RM_PSIL_UNPAIR,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 				   sizeof(*req), sizeof(*resp));
-	if (IS_ERR(xfer)) {
-		ret = PTR_ERR(xfer);
-		dev_err(dev, "RM_PSIL:Message reconfig failed(%d)\n", ret);
-		return ret;
-	}
+	if (IS_ERR(xfer))
+		return PTR_ERR(xfer);
+
 	req = (struct ti_sci_msg_psil_unpair *)xfer->xfer_buf;
 	req->nav_id = nav_id;
 	req->src_thread = src_thread;
@@ -2782,11 +2734,9 @@ static int ti_sci_cmd_rm_udmap_tx_ch_cfg(const struct ti_sci_handle *handle,
 	xfer = ti_sci_get_one_xfer(info, TISCI_MSG_RM_UDMAP_TX_CH_CFG,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 				   sizeof(*req), sizeof(*resp));
-	if (IS_ERR(xfer)) {
-		ret = PTR_ERR(xfer);
-		dev_err(dev, "Message TX_CH_CFG alloc failed(%d)\n", ret);
-		return ret;
-	}
+	if (IS_ERR(xfer))
+		return PTR_ERR(xfer);
+
 	req = (struct ti_sci_msg_rm_udmap_tx_ch_cfg_req *)xfer->xfer_buf;
 	req->valid_params = params->valid_params;
 	req->nav_id = params->nav_id;
@@ -2854,11 +2804,9 @@ static int ti_sci_cmd_rm_udmap_rx_ch_cfg(const struct ti_sci_handle *handle,
 	xfer = ti_sci_get_one_xfer(info, TISCI_MSG_RM_UDMAP_RX_CH_CFG,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 				   sizeof(*req), sizeof(*resp));
-	if (IS_ERR(xfer)) {
-		ret = PTR_ERR(xfer);
-		dev_err(dev, "Message RX_CH_CFG alloc failed(%d)\n", ret);
-		return ret;
-	}
+	if (IS_ERR(xfer))
+		return PTR_ERR(xfer);
+
 	req = (struct ti_sci_msg_rm_udmap_rx_ch_cfg_req *)xfer->xfer_buf;
 	req->valid_params = params->valid_params;
 	req->nav_id = params->nav_id;
@@ -2923,11 +2871,9 @@ static int ti_sci_cmd_rm_udmap_rx_flow_cfg(const struct ti_sci_handle *handle,
 	xfer = ti_sci_get_one_xfer(info, TISCI_MSG_RM_UDMAP_FLOW_CFG,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 				   sizeof(*req), sizeof(*resp));
-	if (IS_ERR(xfer)) {
-		ret = PTR_ERR(xfer);
-		dev_err(dev, "RX_FL_CFG: Message alloc failed(%d)\n", ret);
-		return ret;
-	}
+	if (IS_ERR(xfer))
+		return PTR_ERR(xfer);
+
 	req = (struct ti_sci_msg_rm_udmap_flow_cfg_req *)xfer->xfer_buf;
 	req->valid_params = params->valid_params;
 	req->nav_id = params->nav_id;
@@ -2995,11 +2941,9 @@ static int ti_sci_cmd_proc_request(const struct ti_sci_handle *handle,
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_PROC_REQUEST,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 				   sizeof(*req), sizeof(*resp));
-	if (IS_ERR(xfer)) {
-		ret = PTR_ERR(xfer);
-		dev_err(dev, "Message alloc failed(%d)\n", ret);
-		return ret;
-	}
+	if (IS_ERR(xfer))
+		return PTR_ERR(xfer);
+
 	req = (struct ti_sci_msg_req_proc_request *)xfer->xfer_buf;
 	req->processor_id = proc_id;
 
@@ -3047,11 +2991,9 @@ static int ti_sci_cmd_proc_release(const struct ti_sci_handle *handle,
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_PROC_RELEASE,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 				   sizeof(*req), sizeof(*resp));
-	if (IS_ERR(xfer)) {
-		ret = PTR_ERR(xfer);
-		dev_err(dev, "Message alloc failed(%d)\n", ret);
-		return ret;
-	}
+	if (IS_ERR(xfer))
+		return PTR_ERR(xfer);
+
 	req = (struct ti_sci_msg_req_proc_release *)xfer->xfer_buf;
 	req->processor_id = proc_id;
 
@@ -3102,11 +3044,9 @@ static int ti_sci_cmd_proc_handover(const struct ti_sci_handle *handle,
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_PROC_HANDOVER,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 				   sizeof(*req), sizeof(*resp));
-	if (IS_ERR(xfer)) {
-		ret = PTR_ERR(xfer);
-		dev_err(dev, "Message alloc failed(%d)\n", ret);
-		return ret;
-	}
+	if (IS_ERR(xfer))
+		return PTR_ERR(xfer);
+
 	req = (struct ti_sci_msg_req_proc_handover *)xfer->xfer_buf;
 	req->processor_id = proc_id;
 	req->host_id = host_id;
@@ -3161,11 +3101,9 @@ static int ti_sci_cmd_proc_set_config(const struct ti_sci_handle *handle,
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_SET_CONFIG,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 				   sizeof(*req), sizeof(*resp));
-	if (IS_ERR(xfer)) {
-		ret = PTR_ERR(xfer);
-		dev_err(dev, "Message alloc failed(%d)\n", ret);
-		return ret;
-	}
+	if (IS_ERR(xfer))
+		return PTR_ERR(xfer);
+
 	req = (struct ti_sci_msg_req_set_config *)xfer->xfer_buf;
 	req->processor_id = proc_id;
 	req->bootvector_low = bootvector & TI_SCI_ADDR_LOW_MASK;
@@ -3222,11 +3160,9 @@ static int ti_sci_cmd_proc_set_control(const struct ti_sci_handle *handle,
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_SET_CTRL,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 				   sizeof(*req), sizeof(*resp));
-	if (IS_ERR(xfer)) {
-		ret = PTR_ERR(xfer);
-		dev_err(dev, "Message alloc failed(%d)\n", ret);
-		return ret;
-	}
+	if (IS_ERR(xfer))
+		return PTR_ERR(xfer);
+
 	req = (struct ti_sci_msg_req_set_ctrl *)xfer->xfer_buf;
 	req->processor_id = proc_id;
 	req->control_flags_set = control_flags_set;
@@ -3281,11 +3217,9 @@ static int ti_sci_cmd_proc_get_status(const struct ti_sci_handle *handle,
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_GET_STATUS,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 				   sizeof(*req), sizeof(*resp));
-	if (IS_ERR(xfer)) {
-		ret = PTR_ERR(xfer);
-		dev_err(dev, "Message alloc failed(%d)\n", ret);
-		return ret;
-	}
+	if (IS_ERR(xfer))
+		return PTR_ERR(xfer);
+
 	req = (struct ti_sci_msg_req_get_status *)xfer->xfer_buf;
 	req->processor_id = proc_id;
 
-- 
2.34.1

