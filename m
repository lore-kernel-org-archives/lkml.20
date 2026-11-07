Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.195.30
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794066570;
	b=vvN84Bzka9fH56X9XNMMsJ72/kg49GmSQ1vSGJ0bGBTRHERXykcwxTpOHKTd633JF4/v
	 rv6P5jAxMWxdXxmCXGjNigo0+nAeHDNn0dqvC21qtHSvB5TLEiHrXnegXxfDODU811iL6
	 oSZbsYTkWP/MeitlAWJebUi5HaQrsb8aUiTIvUrekAbVrf886CW1UJvvuvIHdLLffXVgA
	 tSg+NwgHqAddtA1DJfTz0rn3HMezwfME3OE+GzyA3ZVApUNzA4L+c5PgTsIQUCZ5E4jmW
	 mlGlq/8qurOvXaKGZ/OM2bKKF9AYj+tKK3wWqvbV6P3u3Bvyxy3WFNjoQVJA3fM+y/w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794066570;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type:X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=MIbWfdnXFLMDRGQ3e+baD4OHCOjhFOQNt8KFW8IsmOY=;
	b=aYBqcuoFEJPKrqo6lYM4AWljSHmVrhx5W6qxqlXuQ8H/ROwdYZzeN7gl4qH3IuYccAO5
	 Jh1rE21E9g/Eisdbwz19zWIx7nk2XkkUj4NymBbYsK2gQOQvC0gA1FywFEeq3aOxjB3+8
	 pfBR6dT2fFmNgcok0mQfOAuUjzvFYH8oZ5MxdLVlKPY4lu3hYp2aaCBr3uHVFnh9K1uAC
	 OmNy0DB6/ZayrZKyte9HIWR2+38hfSgoqckfJMz0GSVL+66ZYrGoGg3JoEwRkyokjHvaO
	 rKGgS+NO/0T/qhN2k7YMLUrzm3ILtJ9ROyqs/VEWIJgebk6e0z+3C969gHZU8fmX/gg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=HOGuOjtW;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.195.30
Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012030.outbound.protection.outlook.com [40.93.195.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 489236082BCE;
	Sat,  7 Nov 2026 15:49:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 489236082BCE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=HOGuOjtW
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aSEe2PXeIizHQEl6Ti2uemxGAQYa6FqjqvWo46fsZpZsr4dPmIcmwFmGXICh13KjE1ZbYbSelTFUh2V8S/PGFVRv7ZZbg7n/kMITp28qtThpU24dwjEDYS0Q95ES2SxPwBLRO5pYLIyb61er2mci1PWyUvr2nzI4rWkJ9gc7FIptE4Ij0qc9OZeWT7QjpZNz9FtFq9sqphaAyJ6d4/CuSfG2Ox/qCPSm28HXSZbKFN3QrUInXdgEmqOTcN+QlVJ6GUqBskroX9UDkfkBKW61QSvV6NkzD3Yy/JrgNBBVdfeNiABYkejCcOHWCbOSoGSlUyM2Nxc2mMosuzyqaH+S8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MIbWfdnXFLMDRGQ3e+baD4OHCOjhFOQNt8KFW8IsmOY=;
 b=kxEvEjlYvtvPCwkJQ4BvEZp5ZBRRnsindCtYU37OnzK3loZGmOF7lTL+Ao6xJ/IYKBLRH15x1B7Vz+XjWG5egqFoDKHy7LGtX8gFDsn6r6gOsHcB7LXYOTBo1JLcwtMrtQmxYETVfSZQMY/zeE1WCpt2YPBEuHhXTg11LJXGKq29KSke4nPV9fYrdoq5hT/a7fuIgqivYM+QbjF8NeTSlcHWM60XjEcVNGdaQMXVVIj9mqMQZm/EXqclyPVKz0bxKLrZsaxBKprcpPIUsIyoSzXNx9M+MA0TPrk5x5n4vpxXvOaLy1ocxHQq2RHkhMx84sRuykvRxaMfHLFTr75AXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MIbWfdnXFLMDRGQ3e+baD4OHCOjhFOQNt8KFW8IsmOY=;
 b=HOGuOjtWMFX0jCg+G+NG8FgJ6zsKcfYP2Elt/YVtYqeyyMEioHdDQgrbBal238RNbvGLKk4L+YrVa4UYjQreDT1Gs3pYr051QtjrRC0XUTAx26XSYF0hVqFNEKAWfDrnxr2Cno+hjV/5DGiOHE5H0mCIv2kIe0iH4G90HQgBtfE=
Received: from BN9PR03CA0875.namprd03.prod.outlook.com (2603:10b6:408:13c::10)
 by DM4PR12MB5889.namprd12.prod.outlook.com (2603:10b6:8:65::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Sat, 7 Nov
 2026 15:49:27 +0000
Received: from BN6PEPF00000074.namprd03.prod.outlook.com
 (2603:10b6:408:13c:cafe::66) by BN9PR03CA0875.outlook.office365.com
 (2603:10b6:408:13c::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.11 via Frontend Transport; Sat, 7
 Nov 2026 15:49:27 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN6PEPF00000074.mail.protection.outlook.com (10.167.248.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Sat, 7 Nov 2026 15:49:26 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Sat, 7 Nov
 2026 09:49:26 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Sat, 7 Nov
 2026 09:49:26 -0600
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb08.amd.com (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53
 via Frontend Transport; Sat, 7 Nov 2026 09:49:22 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <broonie@kernel.org>, <yung-chuan.liao@linux.intel.com>,
	<pierre-louis.bossart@linux.dev>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <venkataprasad.potturu@amd.com>,
	<Syed.SabaKareem@amd.com>, <Mario.Limonciello@amd.com>,
	<Richard.Gong@amd.com>, <lee@kernel.org>, <Poojitha.N@amd.com>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>
Subject: [PATCH v5 19/25] soundwire: amd: propagate amd_init_sdw_manager() error on resume
Date: Sat, 7 Nov 2026 21:15:28 +0530
Message-ID: <20261107154659.3358223-20-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261107154659.3358223-1-Vijendar.Mukunda@amd.com>
References: <20261107154659.3358223-1-Vijendar.Mukunda@amd.com>
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
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN6PEPF00000074:EE_|DM4PR12MB5889:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c39cf4e-6d56-4210-8ebb-08df3ce6b400
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|82310400026|1800799024|376014|261021123027099003|261022105027099003|261021121427099003|261009223027099003|261026140227099003|261028144727099003|261026121527099003|11063799006|18002099003|22082099003|261102123227099003|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	GCX+8kdx4SsAK2W/Nf92eUsuYRowoalLuaoywxMLXG/CJC5OiOKbqv69whCa7GSbKpdlp7hoTsRKzr5eBD9ujirAi10y70ft24750nH/0p3P9ru+S+LqqTcsiKce5sxseIkpGeU0Z6CdKQ9CXuQ4pKaJLoI60dejrTl62GsT2RXWafesQRwpE4UBKgJ+RbqVvCjU901dQ7Yt5gHhaBxLj3mb8CXWs7+pze6mk0+yDuWD9AfYyUIu+ykH9Qb9AzbmYUUb0C4aHSdD5CEmpvbe1ync9MF7D22eYkDr0zYVpj5RcHI44O9oVwQTfMmqeHyplxlpeC+1qe+LZRfJePRNjnyJL9tROFBKT+cjIHjNSi7L0NzVQHTFik3U/X4qnGd8NjfAjhYeOCS+bY9lqzuwy1tA8skMulJW0DwZcM+trdhCi5/bKC7aR87RycgbVCGkXpMdCTZeTYTqgrMcpuaS/zeIidgF7iMGhZUrmqIh3aYdHKEZZODcHwp3RIkHZM3ukEsxbQRe1aC0E/iGfX82dS9QtpKHqH5RcWwi+eS2qi6bOz+H9IaXxyNcf4jOWaEwQYhbDMIUbixk7H2OnzQ2kirNvDdmytbHoPRJ8n1kpRZEKJsz/8TR6g0OSzLZZkk0i854/TvK+7a7Sv05OWbudRQh4lAurXPXVMCMPPwnQWGRVPvXqvSgnUfDmWLtOiUL5J2R57m3sHrKDrd/8rBeaw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(82310400026)(1800799024)(376014)(261021123027099003)(261022105027099003)(261021121427099003)(261009223027099003)(261026140227099003)(261028144727099003)(261026121527099003)(11063799006)(18002099003)(22082099003)(261102123227099003)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	+u6uYE/g+nTcQcsANXdWGbPklzoIOkSQsxWJT3SsS7NUGRy89dT3PJMpVcviMSeGCqXKSH6YUcbPtlcejDmfuhm80PIDa3qYsaMDD6HWDWanMTgbLkCjDdogNCYwGTdWbmemp8U21U0O0y6BxijGM1WA8nOcmk49ama1UWynbHAVmOpcgkj5xghhbLLEWawA8mVPVju71OOxHMhpnSg/HKMxeuC9BXndV5Yj9BzZetZpqe2s01hqdqyVvEz+B45dnBXGYAUtzyrQBFB+JDaaBQ5Ah5EKUTegqMa2xuee72yBZooHbXhRH1ZZJ0gT9ds4i4PJVMjhwyyTpwcjH+rM5l1P3y5yJLC2JRPOTkZyzcZvXO/e8TTKI3s1fDFo5tbvL+lV6NJpRhMs2ps+FhhkmKHsg20VZmDPmgWXPr8sAd8pPjkNQI/66lm3kdTrL6v4
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2026 15:49:26.9560
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c39cf4e-6d56-4210-8ebb-08df3ce6b400
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN6PEPF00000074.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5889

In amd_resume_runtime() POWER_OFF_MODE, amd_init_sdw_manager() was
called without capturing its return value. The function performs
hardware bus resets using readl_poll_timeout() and can return
-ETIMEDOUT if the hardware does not respond. When that happens,
execution fell through to amd_enable_sdw_interrupts() and
amd_enable_sdw_manager() on hardware that may still be in a broken
reset state.

Fix by capturing the return value and returning early on failure.

Fixes: 81ff58ff71ad ("soundwire: amd: add runtime pm ops for AMD SoundWire manager driver")
Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 drivers/soundwire/amd_manager.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
index 108553b0f32e..71280745df8d 100644
--- a/drivers/soundwire/amd_manager.c
+++ b/drivers/soundwire/amd_manager.c
@@ -1596,7 +1596,9 @@ static int __maybe_unused amd_resume_runtime(struct device *dev)
 		ret = amd_sdw_clk_init_ctrl(amd_manager);
 		if (ret)
 			return ret;
-		amd_init_sdw_manager(amd_manager);
+		ret = amd_init_sdw_manager(amd_manager);
+		if (ret)
+			return ret;
 		amd_enable_sdw_interrupts(amd_manager);
 		ret = amd_enable_sdw_manager(amd_manager);
 		if (ret)
-- 
2.53.0

