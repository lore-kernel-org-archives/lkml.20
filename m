Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010019.outbound.protection.outlook.com [52.101.193.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B31033A0B2E;
	Tue, 22 Sep 2026 20:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790108628; cv=fail; b=r3Kwc58tNql1hFMI+8S4Zuoo+v48wplI98W8vwOe9dUykYLhoxEPCPUAIpiQTxrjMQAAkHmx9/+7JrcEDQnMwiGEYtR6NMSAfrCQ3HqWSDPNPYsXdiPFsV5459UdiWXm8Dn8UlcIfFv+vIWA2tsaxUS2ywWoIwLuyCKXG4goZrg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790108628; c=relaxed/simple;
	bh=9+LBtx0HX4hFW6yiZncJWjKoaBKK07ph7p4TmIacqWI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=fHVNteoFDGBq9ES//MN53ByieuPUXvSjqC5a1SLnjj1pQqzebyWN1aoBFYCp3olYdc7LcY6GM7sC0MxOB5mXcmzyXWcOzGykLPRmNBxH1BjM5INDXjAEvpXl4UYlE0Llkrx4lp+UmDkPlw5Th5R/RfXXCGB4+ValX3DoHs+cJts=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=uEqmAI/B; arc=fail smtp.client-ip=52.101.193.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="uEqmAI/B"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mK/MqpEofwAWfBWiMPF4NLE6Y7FgSY/Sd04LgvK6YmIoB3/uWm5BwDjwdQFORH5PI2nxICuosoNWA3ZWcAKiYWeSxBTokoc7LdMWGX0iGYt2ErGe6gm6qAdPSWIONJXUaErgjsy0YYTs8tMH71V7CJC9uao8Hyogqq5SPmJMcenhB3tc53xrHAiQ3QLDfj9oT0h4fJGe4rzCwnwWfLdAY5j1KwIVX70ITwSl90pp2FQGL4TXW+xuTPq/lk8eVOVFFHli7hExtGTiv/aaVNEW03jmE9uYay0lDdModPxl77+c8nv3FAWIkT3GYOwxE3j8NfvNzdEYZ7G4CG2KspLg1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DAC2xRFc3F3GbaL4PjdqWrzXNSoD6xAVH3REfOwbZbg=;
 b=LSd89K8nDSuvVfjYyuLPNfnfTSLMY4zYbmdsJLW01C5qhY5tUc8ZBmInW52UVcZDLT4OSXtNeFkWF0lf+9C6T0+DZbBEsu2NUDbfrpb5ymeow+k7HFwEME3Yf+eoQwdTz8YxblABAN8w8w8gm0YJeEVEn8CGG/3TuSh/ga7FbI5tvoesoLuCZbGxE5YOQ+GVw7EXDpY7CgcFi6q5mQzG82jknfU36AizeBRt3edINC+umd8y6ud5al7IRbhFm85d5JsHz24DQY1XdZ4XkcJncn9qY1Wp0MTQvG4bMCqNn97VylUu4J4rnvh9S+6z2YzzMjnlVkcSZVvads8HocU0cA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=alien8.de smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DAC2xRFc3F3GbaL4PjdqWrzXNSoD6xAVH3REfOwbZbg=;
 b=uEqmAI/BEUQkMq504nSGLx0A5T6UNs8GIgUqRo2mw2wYoYbpvKomMIgD2kUg8FCPk15FMk9e4A+h7IIOgb9YRRkQ7LMvG8wzpVVZU8SJC84v7jh86r+P02qt+EZMFGyFgNKIXOA4xUjggSoRlg6pOHnc8ja8KpgyXF9d8o+ccIg=
Received: from SJ0PR13CA0007.namprd13.prod.outlook.com (2603:10b6:a03:2c0::12)
 by CH3PR12MB9432.namprd12.prod.outlook.com (2603:10b6:610:1c7::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Tue, 22 Sep
 2026 20:23:32 +0000
Received: from SJ1PEPF000037A8.namprd03.prod.outlook.com
 (2603:10b6:a03:2c0:cafe::95) by SJ0PR13CA0007.outlook.office365.com
 (2603:10b6:a03:2c0::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.14 via Frontend Transport; Tue,
 22 Sep 2026 20:23:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF000037A8.mail.protection.outlook.com (10.167.244.181) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Tue, 22 Sep 2026 20:23:32 +0000
Received: from quartz-7b1chost.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Tue, 22 Sep
 2026 15:23:28 -0500
From: Yazen Ghannam <yazen.ghannam@amd.com>
To: <bp@alien8.de>, <linux-edac@vger.kernel.org>
CC: <linux-kernel@vger.kernel.org>
Subject: [PATCH v10 0/7] Incorporate DRAM address in EDAC messages
Date: Tue, 22 Sep 2026 15:23:10 -0500
Message-ID: <20260922202318.4079080-1-yazen.ghannam@amd.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000037A8:EE_|CH3PR12MB9432:EE_
X-MS-Office365-Filtering-Correlation-Id: 786d1784-ee2a-49fa-d0ab-08df18e75f23
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|36860700016|1800799024|82310400026|56012099006|5023799004|11063799006|10067099003|18002099003|13003099007|3023799007;
X-Microsoft-Antispam-Message-Info:
	7a9a8vg6p6vuWaF6fEKmqrXkV+QRrMNkg9Fwurx3ocJbfAyFTc50KDba5GPTOmQOwewcFVW/8+ivxAIj9IWmyhe00CS3Ec4Eg/R3Bl57VqMiov+AJX6Qr7p4J1YZapa2Cy9f8IbS6Ha8SdV595nOka9RNF9imhK3ckKPcQhaHZOxPl5RcsbYPyV8uyLWmQOwAZQQ91uuc70S53nWvt+diehq8ppPAaKIlUnxEPTILpWkYSmW+TQoA4xuHpsIvD5EOIXOI0FlZQyeEtCxD/Yv4nurK9rQcAwWyya0YY3R6Xu7AKurpm4V281aWMjhSM6iKyNpFfZM1vHiv8DHcHkYPz7fqu0rP5S7kFGLlfdnQGfKMtAPfS74Gk4hZhkR3vHzLZ7jMSUM39r2IvPZj13QDpcyoEjDPfy9uCBJMPAJRE2Ozv3cL/quFvSplzzshS4kDBa3fNA9QB1kqN7g/X5BAkFCGvz8nghhpQWUssQETjq9BcxOY/au5h6wuAb+8ENRU8FLLy4imNP7mcZXa16HsaFnIjsftHdkSePKSrTP9qj/il5QQlIAsPkFtF4UVF/uCr2JFQUjCjedrNGt+oO41iORpyt8eMxkaTuOh4qVUB0Xo7RLfHcjMQXTrGSHhA1pIcgo6zGPXrL/IU1f0WdDOfcZIZpDyF9JKhFnzQJZFlQ=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(36860700016)(1800799024)(82310400026)(56012099006)(5023799004)(11063799006)(10067099003)(18002099003)(13003099007)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	53EHM8wyz7Qtg/XMxJLSlXJ9mT9PnEVnlGVSdiro9Y+3CuiNKIW+6wcWdJEAI9zYmgU6RP3GRF+BKuqL3SLz+66qcpyNySbNk7lKhvrlojLPUv5zj8yCy798cHPilRge70v16j3++EOpueUvw8hEaxH3ayCXkOCL6umAyBuQpaHDLf+D8J2F0RfZXxL9RgWtBos+oo/eJeGIbro2Cv/Uec9RB1ggBZAHpVt8Bcr0uMx4U49VNR71Iw+Zvan9hSLH4p1GH2SK6eIVbirc9p0cz/i492SvUFE4Ggjd+D9pGsEmRjcUYxQdfu7tW9qBNN99Yaz8cK1mG5aPzmrDqlKftDKJQsTkm66p7hhUxdcRNcKdsxAZX/sgFs6j7m/xp+9M7GcYgocP3lOTVsw5xdf08huueFsHw0R941zBcXWPWCN3+scTr23UiJ168rlCs+yw
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2026 20:23:32.1346
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 786d1784-ee2a-49fa-d0ab-08df18e75f23
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000037A8.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9432

Hi all,

This revision addresses a couple comments from Boris. Also, the couple
of patches originally by Avadhut have gone through a few revisions. So I
updated the attributions.

Thanks,
Yazen

Link:
https://lore.kernel.org/20260730194834.3203601-1-yazen.ghannam@amd.com

Changes in v10:
 - Retitle patch 1 and rewrite its commit message as suggested.
 - Pass a struct param_buf to prm_umc_norm_to_addr() in patch 2
   instead of the individual fields, and trim the commit message.
 - Move struct param_buf to internal.h in patch 3 so that callers
   outside prm.c can build it, and build it at each call site.
 - Drop Avadhut as author of patches 6 and 7; credit him with
   Originally-by instead.
 - Update the Assisted-by tags to the format documented in
   Documentation/process/coding-assistants.rst.

Changes in v9:
- Treat -EOPNOTSUPP like -ENODEV when PRM support is not built.
  (Sashiko)
- Document why the PRM handlers do not need the MI300 address
  conversion. (Sashiko)
- Clear the completed-operations bits in the translation entry points
  rather than at each call site.
- Narrow the operation bitmaps to u8.
- Note that struct atl_dram_addr mirrors the PRM output buffer.
- Widen the subject prefix of patch 4 to cover the EDAC changes.
- Reorder variable declarations and reword commit messages.

Changes in v8:
- Drop "Directly export address translation helper".
- Merge the two PRM translation helpers into one. (Boris)
- Build the PRM support unconditionally and drop CONFIG_AMD_ATL_PRM.
- Formatting and other small changes.

Changes in v7:
- Drop fake_inject patch that was already accepted.
- Remove function pointers. (Boris).

Changes in v6:
- Remove fake_inject interface. (Boris)
- Add two more values to 'other_detail'.

Changes in v5:
 - Address a comment from Sashiko in patch 2.

Changes in v4:
 - Drop a "handler available" check in patch 1.
 - Reword commit message in patch 2.
 - Reformat string in patch 2.

Yazen Ghannam (7):
  RAS/AMD/ATL: Make PRM address translation support builtin
  RAS/AMD/ATL: Refactor PRM address translation into a common helper
  RAS/AMD/ATL: Add unified UMC address translation interface
  RAS/AMD, EDAC/amd64: Use unified interface for SPA translation
  RAS/AMD/ATL: Remove the standalone SPA translation interface
  RAS/AMD/ATL: Add DRAM address translation via PRM
  EDAC/amd64: Include DRAM address in output

 drivers/edac/amd64_edac.c      | 38 ++++++++++++++-----
 drivers/edac/amd64_edac.h      |  2 +
 drivers/ras/amd/atl/Kconfig    |  4 --
 drivers/ras/amd/atl/Makefile   |  3 +-
 drivers/ras/amd/atl/core.c     |  4 +-
 drivers/ras/amd/atl/internal.h | 19 +++++-----
 drivers/ras/amd/atl/prm.c      | 30 +++------------
 drivers/ras/amd/atl/system.c   |  4 ++
 drivers/ras/amd/atl/umc.c      | 69 +++++++++++++++++++++++++++++-----
 drivers/ras/amd/fmpm.c         | 10 ++---
 drivers/ras/ras.c              | 31 ++++++++-------
 include/linux/ras.h            | 46 +++++++++++++++++++----
 12 files changed, 171 insertions(+), 89 deletions(-)


base-commit: 2a11decdb2ddf456d743417d5d86b55c52baf101
-- 
2.43.0

