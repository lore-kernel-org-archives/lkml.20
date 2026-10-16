Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012008.outbound.protection.outlook.com [52.101.53.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EAC935DA78;
	Fri, 16 Oct 2026 05:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792129926; cv=fail; b=Oll+JDQa0i4n2BE1WLEAPumg6HdbMcKQsvp0F5Ux/v+1jlSrv7al+rF6pLrnELlMk0Z/1a6hWyOAhOExrUr3D5BHipRLrvzv8c6EWVakLC933SWqQASVTp9oWypWTHmT5MRcSG8mmlzQbsxLfsdD9ukH3EQniUvYYPMS8pNq0MA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792129926; c=relaxed/simple;
	bh=K+PkjRxZ7BzcXDwMGlg/cwyWkaXgj31DyFfZOMIRkKc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gf2iJRSYzz7HR17TW8aLPBTUKCIPDBWXrwWlLyAlPy2kwWuLGLsQKBzdzKDvHQ37sIdKsu6JPx/nGaIzhhVJvX/hWOIIXsabspc6bBGoIX3OZvFbr+3lJIR1RHxkZa1iQTS+2NWiSoPjCUi7zdaiE6sIF+ZqrV/nBVi8F2IEnFo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=S3M5JnoK; arc=fail smtp.client-ip=52.101.53.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="S3M5JnoK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I++W8/gYK8Cemvd4SegZjg2xY59AzIJTaMavPo9iJhDwFoWORrmglHuo4TAPnJb1SFO8VAuO9ebDeQr0wyGpzu1/VJTENjJ0EbbRSeWzh30OMkAKaSMrR3RCgehZ7eCd2qBreIZCTHxGHCxeeqMWuUh5+ntdKXWxXuPNoP9bJfcjj1Pw0NJwWED2a2SRAACV+ztsQVQCWzRpv6IeXqbE5fPokL+4FuwAKtZDsHcdP4pBzizVCG6h/Z3+HxqasD+pKU9LOBw/6i+4CqKukqMgLle/88ORFMRazuPAGJ8UcijXxcG8Wz/BPVxkrtcy2EzVQv6IASzF0bozF9GeJ6c4pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K+PkjRxZ7BzcXDwMGlg/cwyWkaXgj31DyFfZOMIRkKc=;
 b=bEQwK8a/PKx4m6Xk3YN5YhOrl+cqem/bH0FDnCFWvZQUzSFWK11CsOmyqBH/hFGYV6e1zlZZtNZOMNwwKvoFfPj3JSpc1p38+fca1YONMUCPxnzfvTgmRZCFLJTiKmAa20nYiOujKLTVoGqsdx6f420StUeIddpQuBYXqH9GKpc3EsfIx7iCNleJdif1XV03HFT0Nq++JO4rUiC8C7RO2g844zmXjIj9bbsqa3OS1/YRu4huErEG1pLGC/Hl0dmSFxGt5pAgwgQLwEbesBGZJhwsn8Woo1+XMnznfAQGmT4aaQJF9U7Z6ZGF3YxAv9KEIok7L1IVYh5OSqDhSaHOlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K+PkjRxZ7BzcXDwMGlg/cwyWkaXgj31DyFfZOMIRkKc=;
 b=S3M5JnoKf2SPtJLZs6YWhzx4lrZymUwuHfMw0hRbhc2w+GM0oDgXnPCItZKQ+WlANAQ/VLXzrPoQ6aRKqYvPsB7VeCpFhVYNQ703RxlWcnAy/ANY5DTWK4YB3Menjg7cZ7PpPLyJC0mx4yEYKS7YW5xxjqmsSeJSGBeVspQbJqcioFTBShC65QY0S16e6D1VyqWza6FX32UP/XMwVJvS5b4rqgDSHO8tDS01Vml2bAeVDAcW8qRq4tVD5sIOwaCIAh74BDQL2pXtdr7XMgl5xpL2Vt2KPUFD9lGr8LH+yAHsbs/qUHz0Vkat5l7EqHwvIiy3l0rnYoxNCMyvJzqCsw==
Received: from CH2PR16CA0009.namprd16.prod.outlook.com (2603:10b6:610:50::19)
 by MN6PR12MB8567.namprd12.prod.outlook.com (2603:10b6:208:478::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Fri, 16 Oct
 2026 05:52:00 +0000
Received: from BN5PEPF00046989.namprd02.prod.outlook.com
 (2603:10b6:610:50:cafe::60) by CH2PR16CA0009.outlook.office365.com
 (2603:10b6:610:50::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Fri, 16
 Oct 2026 05:52:00 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.161) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN5PEPF00046989.mail.protection.outlook.com (10.167.245.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Fri, 16 Oct 2026 05:52:00 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Thu, 15 Oct
 2026 22:51:36 -0700
Received: from nvidia.com (10.126.231.37) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Thu, 15 Oct
 2026 22:51:34 -0700
From: Jacky Huang <jackyhuang@nvidia.com>
To: Rob Herring <robh@kernel.org>
CC: Jacky Huang <jackyhuang@nvidia.com>, <andrew@codeconstruct.com.au>,
	<joel@jms.id.au>, <krzysztof.kozlowski@oss.qualcomm.com>,
	<conor+dt@kernel.org>, <andrew@lunn.ch>, <devicetree@vger.kernel.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <openbmc@lists.ozlabs.org>
Subject: Re: [PATCH v4 2/2] ARM: dts: aspeed: Add NVIDIA VR-NVL BMC
Date: Fri, 16 Oct 2026 14:49:53 +0900
Message-ID: <20261016055117.59404-1-jackyhuang@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CAL_JsqKx4OEM-asdvs1wUiP3FFObzJHZtNTtqiwtcRhJ5CPRyQ@mail.gmail.com>
References: <20260728085640.1001890-1-jackyhuang@nvidia.com> <20260728085640.1001890-3-jackyhuang@nvidia.com> <20260728143952.GA2121505-robh@kernel.org> <20260729060612.1085870-1-jackyhuang@nvidia.com> <CAL_JsqKx4OEM-asdvs1wUiP3FFObzJHZtNTtqiwtcRhJ5CPRyQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail202.nvidia.com (10.129.68.7)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN5PEPF00046989:EE_|MN6PR12MB8567:EE_
X-MS-Office365-Filtering-Correlation-Id: e8dd4418-8767-48bf-e2fa-08df2b4998a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|7416014|82310400026|1800799024|23010399003|10067099003|11063799006|4143699003|56012099006|18002099003|22082099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	FCzlMMfUFPGsDblSUPlT5NijRKuzKNREUX9N9sj/bwtpc9Eqv5j6kmaywsqRi9N50J0Jij42D/Meuyk5L60WTElQ0NYfB8Ual6UU8GSbZ6nX7Pmy+F1UXIVWfaA9jxbMjFXww5UEybye8Syv457ikrcnY0gXkn3DpJ8pYY2+69EiY746BkhfPXonxlS5x+JYyzhysiYmSsNI6yeN1Hohlkk1RFKkfEK2TlJZwNVf4DeM7rLsskfUIzeuhZgnUBBgASRo4Pa+h+FWbNVo/pgv11sDdxGV4gkbGBvByQQSHArY52W6Liu1r774nf+PeEUEYfSZ1bJezK6ZygyLPHc/uR47JadEkH91R4D2ZSXj9SNQ/mB6+dUvoF93h4IuijpkQUomkzYkB8Oyqjw1NeuzcvSeawX3bUjU3xPSS1sewjDPewp6+Q0E3EbAhruNj7kCRx2zMPSLwb0lX7glR32UwXrbJFDqQwC2IcTliPrTlMhMmAzWvqfMApcBeIFzKZwAJ+X2Y3io7p10PQHoiOD13j+jX5bnbbRUuSkd3sARz127nkHNI4gy9OLi9cQcVt4TMJ475cLLbMxfqq9tms0KUOBjhwqxBQvr57/tUhYnOs5mrX5l3+Nl4zZ4tHn8gvqJQs3fLB6VzSOJzzR4+ezXVZHy+mDPIoQ63rfgcRwqcWQeaIbiTORdni1EHD26/m9nJfB+QjoQ61ft9c2FfPwHtw==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(36860700016)(7416014)(82310400026)(1800799024)(23010399003)(10067099003)(11063799006)(4143699003)(56012099006)(18002099003)(22082099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	G+S5Hl0AF8Nw6h067meoiS6Dlr5fHn2aOPQNXXS+Q0sOv+voAHwBtT0boKjrIB036IY3zUT/uTb4/iUfafMcwdo3/+46KK5oG9WYnwPJA8xoX2j+eg7xylaCtch6VxmDNm8aPU4uPQNG2m5iV/t7HPLbDQ6hhXUTvaoK3+MIpBynR3otYuXw5Z7yBqRSBJ6kqTEncx0TVm2o86Xb/WYmWKgOSPrDAKaOYJQVupGtdVWRu309DalZRfuQKfIX0ipW511aPPyr+6BjutYKJYAEtZ6LDOw4JnZcjajEodtNGJTrTyUm4t0MjekUe4bIKacxHZdM0etKRAcqZzLOCpp1dv7tpZD85ICn+eR2MOh0TjzM20YLtezO2zcoCayWh2/z7DrKTfhwHo348nnQj8fpVoitZZSVXKW5tSiIIAYk/KydvncworQtNzvfvGyF1hlh
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2026 05:52:00.1736
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e8dd4418-8767-48bf-e2fa-08df2b4998a5
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN5PEPF00046989.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR12MB8567

Hi Rob,

> A board level component shouldn't be in the SoC .dtsi file.

I submitted a separate cleanup series to address this. The series
updates the AST2600 board files and vendor common DTSI files to
declare the flash devices they use, then removes the shared flash
nodes from aspeed-g6.dtsi:

https://lore.kernel.org/all/20260813102233.3088939-1-jackyhuang@nvidia.com/

I plan to base v5 of the VR-NVL DTS series on this cleanup.

Thanks,
Jacky
