Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11022123.outbound.protection.outlook.com [52.101.126.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8FB3358D37;
	Wed, 23 Sep 2026 02:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.123
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790129440; cv=fail; b=UVhH/sLfNap7wN9M7APFuvdZaYdlPc4yfWUfaObAoLKvldZ6F6fMG1RWUlSPIIr+SJ5O91hRWZ54KUj4gDfxK4wyAT4B4tp5hBUyvf2/wI7gCuH1OpPT0vp9c/2drHfkp/Df8TNkeC3TXc6ktup7q8vxizyVNgB/jCWxZ0Q3knQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790129440; c=relaxed/simple;
	bh=JtX4IYHJBHH9nu5PK7b9bb5RF1Cf861jiEF1RVf8+tI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UqxDCs4Ff6/dTop1s+SZsjNqMtCGioQCDc/UPvO3e2fUA5swh+ratAzUY/5kwltdQm3aHdkq71sDmR48Lf87ylAWJFuuQCn6os+x1Cwy2g5kfi8/VL/AUr+PeTWTeyoFfdWivumb74Ae8QC+hMg9yL5lSM7fuGpBLtd3woCgJeo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=52.101.126.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v62iWZCwdpPiudXjYVRd2lpUBX19fgsL+VLr9GEc8mCJlaar70bfsz7D9vjJ+T5lkHZc3fIy4+hFz7M2y4WgkmVkoJ5BLaXI7Xzw5OeUmFU28Bfbjl+2ilY6IQSFSAQcIDfwPnqx7gbFPk4IcQQbLwEIbytS3LMCyMhwofTz4pisDVApD8PJPRcqvWlEucnkTVKHy9cD5jBgj5/7gMyS07KUjc/EaJufltmWVbEwlqduCw2l6i/XYnZJsJ08//vt91DB3xELWnWeEv4DyXp7RwwEeWNvcq532vJW4rGXTFFelFr9tn3QQNDP984GxscDLwQwPqr1Xd79zV2P3xtxEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JtX4IYHJBHH9nu5PK7b9bb5RF1Cf861jiEF1RVf8+tI=;
 b=gL9NILr3uTg+ZdBAdtoXLoajqC1Z9YWBbEd/3yIxVw/fUQwnSOxYZipN5dtjGYrBh976b7tU5N5+UYlTT3r0MFx7taKsltYlv5w3WZ3Kre9GgCO3WROwgvzyXBUshpMi2zUfniYH89sJ8Jm5fdMfEGt132jdEKyohpqD6WXo4lwlbjvmVD88jmxkw4LIW5iFcfUpfRq1eeLSXPXdpsja3bdUqNHHs5Nj4Hpnoso4NIJ4LKsfJ3hI2dK0pLqC4ikzm3FfWJlykcDNlhCu9R8tg3pzmAFFKUhHMmCnYWzKWFjXxkUWrHZxpVHfHhU+TLScFCVF5FRGi4LvK/uDUnyshA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI3PR03CA0012.apcprd03.prod.outlook.com (2603:1096:4:297::12)
 by PUZPR06MB5721.apcprd06.prod.outlook.com (2603:1096:301:f7::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Wed, 23 Sep
 2026 02:10:34 +0000
Received: from OSA0EPF000000CB.apcprd02.prod.outlook.com
 (2603:1096:4:297:cafe::4d) by SI3PR03CA0012.outlook.office365.com
 (2603:1096:4:297::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.14 via Frontend Transport; Wed,
 23 Sep 2026 02:10:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 OSA0EPF000000CB.mail.protection.outlook.com (10.167.240.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Wed, 23 Sep 2026 02:10:33 +0000
Received: from hongliang-System-Product-Name (unknown [172.20.64.180])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 288A343B1061;
	Wed, 23 Sep 2026 10:10:32 +0800 (CST)
From: Hongliang Yang <hongliang.yang@cixtech.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Hongliang Yang <hongliang.yang@cixtech.com>,
	peter.chen@kernel.org,
	neil.armstrong@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	krzk@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	p.zabel@pengutronix.de,
	gregkh@linuxfoundation.org,
	cix-kernel-upstream@cixtech.com
Subject: Re: [PATCH v4 2/3] phy: cix: Add CIX Sky1 USB3 PHY driver
Date: Wed, 23 Sep 2026 10:10:31 +0800
Message-ID: <20260923021031.815275-1-hongliang.yang@cixtech.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260906032431.470744-3-hongliang.yang@cixtech.com>
References: <20260906032431.470744-3-hongliang.yang@cixtech.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSA0EPF000000CB:EE_|PUZPR06MB5721:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 4e811cd2-16cb-40e1-1b7f-08df1917d9a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|1800799024|7416014|23010399003|376014|10067099003|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	l4+qGz4o4dffyc/iXgKb3SsxbB1CZcmlJEY4EieCrVPb//DBODLRVEvKfQTglMLFhyrE9abUaurzQzB4fJ9WC56KvNH0QAWPnMDGOQSaHfLXG79DMoZtTgEXOGHGyqwzqEjrKEnbBo1k8ngezu4LnMFZWEyWQjJBtpzUgskbX3wD6Q2FCDded5F5BCxQEjfQxnap7WqX8+I54fvmJGPQ+kBh+/UGbOnAWWrdH8l8Df+nZcl7mE46ixYkTPOWtS9onWM3fvtPn2171j+1LY3dfEFISgfO71ioSI7uBPYeY8XPUowCiabc50ezOWWuW25tMWjhGK3m2mLDyv3v2elqem22qcxDmkWX6TlrqWBIBzPtr40NBD2i9M1CphX6t7V4TwX9DK4YpvbuA/Jfe70ux8yHE9TIua2jHeF766aTGF2X+dZGIOiTJmhHhB4f+XjzxK6lZTGe+g5Ec9TR3Hxzy4XTKibLmaoEKumXFgbFVlzMyD5jjvfpfEyTX3NSnA0nVGhBNIwxz1FdPplEiDoMSbky2WycaMS98QRDYpf/WFY9qBiP9xfEQw4DDV6jtEv/FHrR7pUUcMbUBz7uYCwC/mN4RgF6A/ygMxyA5eTGxRKuQp78o82keVDnkuJcFU+S3cpmV6uDupqvAAE5jf6kVBo29OgbQ9R2EYmqr4RhXSZUXJA75Ks5D00xIjYcmuRvPshbzpHHYV/yvpz7118xEA==
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(1800799024)(7416014)(23010399003)(376014)(10067099003)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	2uI9ZaesvWZnNi46dBIwbF3UGudV8pBsTr0TGMBcq5LufZRVUHjF2pudP420BMP7CeeoDT9cj9IzcnNb606zYUA2AmPvN8eUty6R/+3XlC2x5geOPz7vIAKxd0UP7F+WzN8SUQIFW30ChiJNBr4gC5Ll2amWLVoft8urNPFpt/6sB5GSO2AfbZw1d6NtOqgFm2xu0CL7Yp6doTiqGdsI4Vl7BGmCiAfmKMY/8BJJpXJLKaqIPURukDREAaxdA/jvxEFBwEVVzFBlIq6oXeeNKi9b8dU+9eI7XL1GzmgJMnl7lWOaNnF0nUsUKc47s/ZBD+8Ro8l4LQ7JalOLPia4Ghp/OHskjEG0GBstEsCuX8QgYDOddB0LilvHoEhllbsPwGMzwLp0lBoudHwB1ViZPM+uq1gtzVulJTOh/bv1z8awFcc+rckCYwegKH7Sjfmq
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 02:10:33.4038
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e811cd2-16cb-40e1-1b7f-08df1917d9a7
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	OSA0EPF000000CB.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR06MB5721

Hi Vinod,

Gentle ping on this series. The binding (1/3) has Conor's Acked-by.
The driver patch (2/3) could still use a review.

The USB controller glue series that consumes this PHY is also under
review, so having the PHY side settled would help both.

Thanks,
Hongliang
