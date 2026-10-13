Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013049.outbound.protection.outlook.com [40.93.196.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EC615012B5
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 15:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791903956; cv=fail; b=H/jIQPyr7jSlt7BKsbkADRdmY0eJa60XXtzMKmHDRrdy3zqj8jjWyYVIplSUo2J6mA7yHFwxBxYj1SHHX6zABVN9+n+mDU4581q5Y5hMMfMFAF/KCPT0L9vgYloG0zRPNEE7fcEFLclgcSYuypswiDXgcyK2XZ4wAfh8TSj+sEQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791903956; c=relaxed/simple;
	bh=yrxXPtVIF8zo3tlLNpZSJpD70bb1EEUO/wn6uyJFLK0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Rw4lIBuyKRWlLfNAqjjzICjcJNFKclnQpD02Y5pFmR1O0AlD5xi9+SKw5JwwAEyjfVqUrKgvGnsDjxT4WtXfXAhmtPL/jo5mDMOrQ7fG9s8rStnZX3iQz3ZsN5crXOkbzXyjkkuAqFztPWM9ZbG4XvlFsv33bT3oBIrMgvCI2xw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Non6pdF3; arc=fail smtp.client-ip=40.93.196.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Non6pdF3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XDns+jWddSCW9r7hwg/InbYJqVyKIR/f2RuNwyz0K9n83bB+F/m1TOuZgSk1K4dgX42F1w6O2f1giiO38FZaVphRqhRwtstm1+OiBKxSQbCOPKTX7cUF75eUYYNW1hTTV1h13dQR1Ziblfi7vCkwaJk0kqxGqR2TIqtJqtocuaF0Gp9YemXGzFKhdJxEeS8dS7ySKatQgiKp28wpO43YswdZTnudwaigpQfJBzVUD20JTdvFQ7Su2OGT180P9YBovGm8XLr/winbpCSY0fjkQtoHtOGSRdDDOwJ0V+rIV15NAjiIVffi1XueCUTrQI9Eht8d2SmIlE2jV013AjuMLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a7k8KMpvha91skz8Jo3HiAajbnUTNdgSw/GxxTeSyyc=;
 b=GFmy8EI97KhiHE0RwOnLw1EeXRmrPp5uVO5XS+Ki90Nq0QTvw6g84GeUhIRXgbtdMi5Lsx+LHt8+IoTzVjZtNwLai1yQUQonpDat/pQmMYzJmPgi6kpyRlHgrHOsBTP2oAdYSAZumlHtfz410cy+hMytQ6u33qX3hbc7+9SBb8w5Cl6j5+Hmo9caBuNus/AkFpLnHuRNNY5hsZByedA7DPSNdMpPXI9l59UlXSerdxvwMQ5zzQijsrGJ/279DTWtyct0hAqBhP0/BFEq8nRlgYHNDzPv0YsT/+keW9NXdUE+pSzibCI+pFQO8JZwJAmiCJkYF5PtorVGM9Wf0fTjag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=arm.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a7k8KMpvha91skz8Jo3HiAajbnUTNdgSw/GxxTeSyyc=;
 b=Non6pdF3hJ8KuSJCDPYckpzsGeIEvy9pnwpXd6u8PbVmMatrLdV7DwwOYSJx93ivpbiAiCukeBtErDh9fse+Y3xHA3S+CrHfOXy2nsbUP6V7HYP5WOfhOzrZf7LjpfMlSNETQKKutn5F/9g+G8roXZeWHyHErECtgOEp1YxKZteq1/IwYlhdYh9wZIXXI7g8gYjoja6Wi/tjbmU3ZvFJHW9xmCMsu745NyS1zxHNQEDASa+KhPz2iQ+NZXFjJBtjcg2HfjRki7FWoBRCNajJ1y32tqTjGOEp7NjUsOI2bWetatlNfDj++llfmE0N1q9QwLq5P6FCXL5MMaSGJWanOg==
Received: from CH5PR04CA0007.namprd04.prod.outlook.com (2603:10b6:610:1f4::7)
 by CH3PR12MB7761.namprd12.prod.outlook.com (2603:10b6:610:153::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Tue, 13 Oct
 2026 15:05:51 +0000
Received: from BN2PEPF000044AB.namprd04.prod.outlook.com
 (2603:10b6:610:1f4:cafe::55) by CH5PR04CA0007.outlook.office365.com
 (2603:10b6:610:1f4::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Tue,
 13 Oct 2026 15:05:51 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.160) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN2PEPF000044AB.mail.protection.outlook.com (10.167.243.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Tue, 13 Oct 2026 15:05:50 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Tue, 13 Oct
 2026 08:05:13 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Tue, 13 Oct
 2026 08:05:13 -0700
Received: from sdonthineni01.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Tue, 13 Oct 2026 08:05:12 -0700
From: Shanker Donthineni <sdonthineni@nvidia.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Vikram Sethi <vsethi@nvidia.com>, Shanker Donthineni <sdonthineni@nvidia.com>
Subject: [PATCH 2/2] arm64: cpufeature: Enable BBML2 for NVIDIA Rigel
Date: Tue, 13 Oct 2026 10:05:07 -0500
Message-ID: <20261013150508.1798938-3-sdonthineni@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013150508.1798938-1-sdonthineni@nvidia.com>
References: <20261013150508.1798938-1-sdonthineni@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF000044AB:EE_|CH3PR12MB7761:EE_
X-MS-Office365-Filtering-Correlation-Id: 9951a7c5-aac8-4c60-f3e9-08df293b7878
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|23010399003|36860700016|1800799024|376014|10067099003|18002099003|22082099003|11063799006|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	PD+zMUmXt53hAGRHl4b5TwaFPni9ZFz+QmaWpNZ8mQ2BGlmx1PpDstqGpft2CKcp/rBWTiG8MNDGc/4EqDNELSda12Ed82sUrPEmP8UCFxRn+9qmLTTxbrmmM4ZMrceaO+HGM5mK4IvkY1wi5xbGz8gtnV1RAAmRJja0eSGoTXzfhBugwCQz5OvORFGd2JVewn1Wo64FQa1TIlHClbAOtxVc8mMeIhfxNj7FYIbzOJTHqA/z/ApajCev68bahI+ZQAKmxwfIxU/MXDuQ1UcaI6b78U39Rt8B9PhjV0y03PJPRG3aXIxlGs+sHgRMN+3/ndiphDpbYtzbJ1s55H0+0coNnangF1cMVUmJUjqgNTXBmQoNOSdWuRk1Lf8caBfbCy949oRc5DxmC0TDAxMG8+x619oLDpA8Vrh/T/oZtAd07jbdOAbqIuBWRLMy5loN2CO97WHpouIF26c/hgpwycuJujofhQbCcQqDl/s1miypjqF7XYmd7ty7r3k4xMqhCrQ36EcN98Kn3xW5H0IJzJC0ymUT29c3en1oV6SDjoZPLP1uufeZhHGsPYw7xUAIPjXqOxd8VpqYO6SvSfpEj+S1IH3SEOJv/xMUwppAXn2fgtSaqMHnuOBAAee+ejOT/sweoAomyGsrft7XXX8ZDFCLg4zT3d22rEzhIsgUOg3Ws1nN+mnVb2PNiCs1Fbhqayh9yltOB4ZmCC+M1ppRDg==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(36860700016)(1800799024)(376014)(10067099003)(18002099003)(22082099003)(11063799006)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	+mzi1PpXTaC3w+ZDusc8H+7DE0YNjpbUbntyl80vZSSbrcInnafppV8biyoLnSHI8qfFiuJTA5pjFHjKbcKML6XPJ/9J8H61HXaYKNP8LVqfXQwsY79+zzpUmDqbLAU3yB7oyXST7Y+d13B3wSEkxTPHCMILRqMNXH8QsmEGFNdvWC+IAXYXJ2Pt7hEu3H3VEJI11a0gzoZI9y0PTrAl43hHvV0DhAe3IGPbdP1XHXcprBSjj3heeLa7BryfZWb4LNmWT+pn3LFXB4c1wsYycy+t1qZ6/FNV201HvNsFmWsZroSMUgMIHttPfWxEOFVfHJ23VOmE3MkR321ZXw0u2o84dpXhW9a/Z7G3gWrp9RCixHWAoKdai/fp09UzqBuoKWzpiBF7JIE+imWe5UrnCjYakyE5LEnYXLGOUsV9iaO1d0tTBW60FSWytOWCtWNh
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2026 15:05:50.9075
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9951a7c5-aac8-4c60-f3e9-08df293b7878
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044AB.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7761

The BBML2 no-abort capability is an allow-list of CPUs that support
BBML2 and do not raise TLB conflict aborts for mapping granularity
changes.

Add the NVIDIA Rigel core to that allow-list.

Signed-off-by: Shanker Donthineni <sdonthineni@nvidia.com>
---
 arch/arm64/kernel/cpufeature.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index a06dc20c59e47..6333fefc67027 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -2167,6 +2167,7 @@ bool cpu_supports_bbml3(void)
 		MIDR_REV_RANGE(MIDR_NEOVERSE_V3, 0, 2, 0xf),
 		MIDR_REV_RANGE(MIDR_NEOVERSE_V3AE, 0, 2, 0xf),
 		MIDR_ALL_VERSIONS(MIDR_NVIDIA_OLYMPUS),
+		MIDR_ALL_VERSIONS(MIDR_NVIDIA_RIGEL),
 		MIDR_ALL_VERSIONS(MIDR_AMPERE1),
 		MIDR_ALL_VERSIONS(MIDR_AMPERE1A),
 		MIDR_ALL_VERSIONS(MIDR_CORTEX_A520AE),
-- 
2.43.0

