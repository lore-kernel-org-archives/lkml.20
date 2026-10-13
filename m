Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010066.outbound.protection.outlook.com [52.101.46.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79988503BF2
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 15:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791903958; cv=fail; b=LpXXEUqbUApKrRyPUwIjsODUidoMU42fcRdHrDo8Pw5z5sojcE0fr45oesvyrN+FBXSH1LbLT/t924Zy/qybtpJDmkB57TlZi6Y0OFgaRVTCZensYOCSv5/Ro/PUvo4nHm2qmKjuJnNjjRjFV8hUX3AGSDFH3vRYnWr7NVajFNU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791903958; c=relaxed/simple;
	bh=2hq+8U8TcaAQAVfbd2cfzJV6z/HgjtYx0+jpaMqYOtQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=gt/+XhQTXZsS1TWhRH34QEAO0WnBk/ZTxyO58IT3sW17gl5LgTAaq67Lv8R0+Gq38IZZ0d/TF7Za5gtvg2R9En7mlEM4LnysxnE+A2+akatZkqj0qslkUxpevUAoN4apgYzSJj7Kh0LtZtgxtqyJIn0vLW+HbAgj+7JCCXELZ7Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=EtdrKwGm; arc=fail smtp.client-ip=52.101.46.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="EtdrKwGm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uzHYEjZ+ZMB5hv2XUof1YKdCRBQtnZYufHJAH+WfqUJdDl/JAI//5UBtg0KhRG8NoFETLk1BwHBwoD7BhKBbKaROEdTaw7OAZ0TmacfZWMUooswNpeZusv976Z1Y2OY0WMVIhUT1+GZIO60U4F1xaMwZ815DXvr5eM+GTcu8S2tUwMFoK+sY4tmaaWkmfLfpvnwuDGqC18CbsFiSLfBERAoVSJ7vp4u05aPrIA4mBREciWdEFluaLppnxaU789GNzOAJq9VVXS7lzYKxlm/hSkQwpKAbqPUtlFO5nHZ1kQGgBjBjluf/GgAYdPislOXXlQtk8ynzlKQn3MXtN6cAVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=whFg/Y4Skbqb7j6GvBQiLsp1EzkMYHTbJCAOhRwQNSk=;
 b=dOWltvO6/a4TRQPnaFL/1zJnixWJiJYpIIomtsYa4N5Jn6C+KO5BLDMEiHt5ZgwAUomHKiKj8xdFXo+zPrSTBgWUfVElZEwWAGp5SifQjMrRLss577XMyStSagzMcZQfgFSQk+n20mqLzBXexE8aQpRgliIaHZUMXZKz1F2nPU6ugq5rjKyB7fOmMFwSxgMcWEYpc21UEqBV3y+ErrY8bMkTn6nru+fAVRpWMf2RFbH2Q1smLb7dv+Lzicor1wtyovtc3JQ8Mo2r/Wul5e8mFHTSfVVn9TSFCTjHY7b1A1cTv9R2R8bszVafhPaIBQ8JRNBQsMY0vNQXB4UwMPnLqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=arm.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=whFg/Y4Skbqb7j6GvBQiLsp1EzkMYHTbJCAOhRwQNSk=;
 b=EtdrKwGm2wqvXUyaVT4q/UkIMoWcyZLRpxWoRmeifYtPcI2Q6V6aD7ie+7QZYWBKgCNyiYIzzxAZC+7tlxbfnnuaI3G0/IBvwa27LNUkcH089vSw1DJXjagqfZe13hrAiU3Q+CD6ZLE3coMw8qy986yFEIO+6zDRb88qGdpmVk/J0BlKvzjHVTlHxUTK9R5VypPsqXDBHRHmKqIu74Z1zQ9WCT/CJIG2PjkR3Rqy7kmCQbWn6+2+ETHMKBnLGLYpyyAtK2DqzLj6FsjACOJeYhLHI8yUl71qzSwfJFYNn5qhwoyPB2P1kIvqUjP61Dlk4AzBmszUGTbfy4DY02Mq7Q==
Received: from BN9PR03CA0126.namprd03.prod.outlook.com (2603:10b6:408:fe::11)
 by LV8PR12MB9405.namprd12.prod.outlook.com (2603:10b6:408:1fa::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Tue, 13 Oct
 2026 15:05:49 +0000
Received: from BN2PEPF000044A7.namprd04.prod.outlook.com
 (2603:10b6:408:fe:cafe::4f) by BN9PR03CA0126.outlook.office365.com
 (2603:10b6:408:fe::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Tue, 13
 Oct 2026 15:05:49 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.160) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN2PEPF000044A7.mail.protection.outlook.com (10.167.243.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Tue, 13 Oct 2026 15:05:48 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Tue, 13 Oct
 2026 08:05:11 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Tue, 13 Oct
 2026 08:05:11 -0700
Received: from sdonthineni01.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Tue, 13 Oct 2026 08:05:10 -0700
From: Shanker Donthineni <sdonthineni@nvidia.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Vikram Sethi <vsethi@nvidia.com>, Shanker Donthineni <sdonthineni@nvidia.com>
Subject: [PATCH 0/2] arm64: Add NVIDIA Rigel CPU definitions and BBML2
Date: Tue, 13 Oct 2026 10:05:05 -0500
Message-ID: <20261013150508.1798938-1-sdonthineni@nvidia.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A7:EE_|LV8PR12MB9405:EE_
X-MS-Office365-Filtering-Correlation-Id: 4630ad36-af32-4fd6-0778-08df293b7731
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700016|23010399003|11063799006|56012099006|18002099003|10067099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	Mw3GuPeH0WOlA0Wt3ZrG/tZJebdw8If+XJwMmuzecOM9PgG+sPPxA63oC1AUNoVpfP74u61u8fnIHNsErhECJymRtFnfbS3QljeZq+I8gy8VWboR7lvvGUPQmy5EUEkSMaEVnb6LwFQ/UYftlNSLxIDvNXkrG/q/Z6nVBmPTjkhInDePYYDUA2cXASbAPdJkirMkG8xA4abYxblIyHrjDmkj2Ii9FjKoMMGSCJLUe+spNvXAsjV26668MpQnI0HPFFX91CmHDMC9Cu20khPIQ8i4qJs5AWpWikSmk9wTvlP1Oxpm866RwNnVl7rVbTajn/VoUbyRp5JxuJKsboizRajAPJIYrSnzrFSZdq+upBvOVFlco6++6C3tEaApqFPCGwJBzeMncJI5CcMmLuPD50JcxqYZZrg9qK35DfkkAklkArB8KEfVcB/0vr0b8Rb4pG8pU2hXqOjJzjU7ww72hCffXume/E+tMYnsuyX/BI/RnKuhm/ip/v4wc/CXqG5+eoKoAutuhohBW4hWBUU1u6xyVshvOVoHDRdzTnQIY19hT0Ck50hP1Yt5i9ygonZzaLphnarnWC5QG01x1syxzHyqlklj9m/eTNK+HJUKnUsuZur83DPQKnvfzbLy3AGGjQfTyigu8G9Qaj9xkp5Y467cdT/i0x64N6JvFcPoxqo+FvC2jVnB2uN3gJHc9Xdt
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700016)(23010399003)(11063799006)(56012099006)(18002099003)(10067099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	TZYqOi08sHr1Cm2B9Q2aJZ6kh/SlH6JuQGsBBI7WImf58rcyb/rIWfyo+P2D4r12AyqXTJfiRrC0YN9xcpNd7lVo98nB5iTNtWl2uiJnUgyEVCLYEJYbHw5yu8IsgLzIvfpV08k3QdUZUuHVusei+Qu3BKm9aE24yS2nCV7OeXwHf7o5/UUg9lILamG86ckufA46fBUIksFUtQLDsZAszvQbfCCln0GR/ccyFpUCsDYIuB78vYcGremJDhuL2Jwhaiy7dokD/6zbOLQgCOSRD50z7QTG4ADL+qB+73H/PBOunD3K5qfjMBDIovOZqaDXzuIAQ14V8ESXdRqNtkukwFiIO5FndRSQc6b6heDpRn/FwQQmBobCjcEM/L9mZQ3vHtGWZCN5KLbQYJxJWvsMuvxBwwUxM/edZZNmtnC2eaSrj9LeVYCCJQZGjwIrzMPr
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2026 15:05:48.7523
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4630ad36-af32-4fd6-0778-08df293b7731
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044A7.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9405

Add CPU part and MIDR definitions for the NVIDIA Rigel core. Then add
Rigel to the BBML2 no-abort allow-list because it supports BBML2 without
raising TLB conflict aborts during mapping granularity changes.

Shanker Donthineni (2):
  arm64: cputype: Add NVIDIA Rigel definitions
  arm64: cpufeature: Enable BBML2 for NVIDIA Rigel

 arch/arm64/include/asm/cputype.h | 2 ++
 arch/arm64/kernel/cpufeature.c   | 1 +
 2 files changed, 3 insertions(+)

-- 
2.43.0

