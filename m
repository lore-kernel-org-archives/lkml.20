Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011063.outbound.protection.outlook.com [40.93.194.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE5AA442373;
	Mon,  7 Sep 2026 08:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788769762; cv=fail; b=VebcU2BxAm1eWFia1gEhCiUrvCQg0gOsF1JEf3rhesI+iFguYLBYBn3YYSr6bKI8182TIaxhv1noxbbAAcMhZym5Jj+tnshfINB6BJlXDk6IW4WOE/IjYDIvrw1E8L++/VxqFyhTrZze3hru+5sNt93BvhRBT+SOrKzaG3z6eOQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788769762; c=relaxed/simple;
	bh=q503+cQ7OqsrwD7FaahHc+KEYAiNYU6gNrWum5caovY=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=D4lj6Fos5714ytTtesZkJrEcFurgh6vNpGomE+UpIpcJoEbpJeHC9VKSF7sFj93d0V/EYAXr5Q53B+FGumKWGNwVmEJAlzO9vS5KM69OVGSwpjJI688Gkh9eBKxHA8NGhsklas7X8ibLHl3RzNLO9nPz3/eAXPzKDA/0QlEBhN0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=RiqKPaZP; arc=fail smtp.client-ip=40.93.194.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="RiqKPaZP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bbs2fI3I5yYhrzdBBa3G3B+Kgbojxdq2jFp5LJJTamJAcCgQd3XiNBEnDjYZpVxzJzSW++j6z1NssYVQkrEsKWcUjSlkmBDina2JUgeeEoNbmQuaxT+9dudNVJRVNfaeYh4q2W09wSvd54NRb+UQZctF4UoCo+MBWsOpTzCjRIuAUSTioYWjejagKcaPmUvFk9/Yx2bx2wNtohijRc5n6Q2wHQ/q+gV4eiwNJqxXAR30Tik0xSSqRHepmRARDGOVihSWs/fKirPXq7NbtOji54/9IHBCF5G6EVbfty2NJCzk2W/tZKAR+e/SUog1npFeLlEg3LSEkwKthaX47Hh1Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+LlyCDHt8gavwC4kFrlidpBLdoVcROLvPeNjA3vvDh4=;
 b=c2UO6k4DWDyGHn6nwp9dctCV1FHQh9clql80JaGwQnAIXBe/23Yh5q76GU3cwqCQSDBSLxoXZX/hpcNwB35piLf0wlzAfA/ACkmuwoM+tjOX3oGYwWJsb7LzNoNDOv8/x8119OcpOIKQN0+Yue79OpjdjR38XwOokZ8XIjZ1SXSPFo1TaJJoBdWcJoJPbrFk6t93Xewv1oiLpe1rtuwtz3jdh/bBg/chJTc/pSA8lH7s0FQaNjBDsPb7UjB1s0G6P8TnsQHhkQdj3ZQC9+iIVzZd7wWWdzXUPdppEZoXIAZLanVY0XsBBo6ohF5XJZbgci6Ru7bi+imX4yh9NOe01Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+LlyCDHt8gavwC4kFrlidpBLdoVcROLvPeNjA3vvDh4=;
 b=RiqKPaZP1LbLB+tsVjmolDWwk/VjA8CyvmPaGu4S9UfEvn4gSSipS+k27pGws20n/IEi8CuUyqoM7gAH3XmaaYRdYDtDShp2DGSpQBNGo4Dku3ATmwoqWngqOhBwIO9oAArIXt99d89eY381HZE+Z3n+EsZE1qORoES/Gd8GdFtgtKKHNOANiNjR2FC03jtXPBnB58OGASfN805L+HpVzTUfWl+ZoCaHUyB/UWJmoLZWH6q30uF6h6LauVLSrvvHeWOm3D0ey4Y9XQZc5V9IgG/qaUy9KyYIC19yiduPYacSJJnjuwnlpu5sOuTDEs14eZa00WG4r84Gg8C4j7l+WA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM8PR03MB6230.namprd03.prod.outlook.com (2603:10b6:8:3c::13) by
 CO1PR03MB5777.namprd03.prod.outlook.com (2603:10b6:303:9c::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.15; Mon, 7 Sep 2026 08:29:16 +0000
Received: from DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542]) by DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542%3]) with mapi id 15.21.0382.014; Mon, 7 Sep 2026
 08:29:16 +0000
From: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
To: dinguyen@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
Subject: [PATCH v3 0/4] Add Agilex5 support in SVC driver and FPGA configuration and partial reconfiguration support for Agilex5
Date: Mon,  7 Sep 2026 16:20:23 +0800
Message-ID: <cover.v3.git.adrian.ho.yin.ng@altera.com>
X-Mailer: git-send-email 2.49.GIT
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ2PR07CA0011.namprd07.prod.outlook.com
 (2603:10b6:a03:505::20) To DM8PR03MB6230.namprd03.prod.outlook.com
 (2603:10b6:8:3c::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR03MB6230:EE_|CO1PR03MB5777:EE_
X-MS-Office365-Filtering-Correlation-Id: 6491483a-33a6-4f1f-9e0a-08df0cba1a94
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|6133799003|10067099003|56012099006|11063799006|18002099003|55112099003;
X-Microsoft-Antispam-Message-Info:
	hEJutRpeFF+4f+0uhLnLbRA+2OR26u8zPUWAvQoTPtWstV2Uah1yTSa5J0zpv0AHAW5fc5r0Ct6v1GFGHaT7EeP+dvsYcLd26ryMfkETuAEXsWnnat2SjYtrusqtt7wC9MDdc08KjwaTJFn1KnsBlLpexYezq/XY4iYpC8PEMtDGeh+g0PLhbGOMlhJMW++cpXQ5ZiXk/3BIu7jAeVK3vtB+EW/+KanTwHYmIdNdkER1JrZ00xTKQ0lJnhipJVGpPtxsMAVnbbq8z/oVNX8SzHEYGV55qpvtv44i3MRk9FDdRDsoWhh5/28mdGLPtgs1DOmEr8MvAl+qRjygCU2AvYH0vZ6l3trjco9eHlcGOfhWEIGGVBidKTwZzoECMz+uNofbDManh4iaaLXtsRXmvYW1ak9/cPgsm9DWCwVx+Oey51v0f4Ku1mPAKkoYmB3SG4GmPRRicCT4c0rP7HGcPJbiVKSwQrM4MqH+uUnYb/sjgCsyU4t6hmr5jna6xcsoh3GBJiioF+J9qlv1mbY9MkvXtJYxyOgN+GRS54QnULp+MFPidZ3CefxSvkBVAd5SlDvsYadCoIG/9g4QbsEwJ3I7RLBj5FpST+m9Nix7lAWcqBiHa8iSE+4zULLlsfdtIXj177DSw/OcGAQF9r0uu7pzKZinUj4P+3QmMHMqLa8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR03MB6230.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(6133799003)(10067099003)(56012099006)(11063799006)(18002099003)(55112099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Plg8dSGLOUekNLHJtonMQNFsyP180VLQOK4NV8wD7hdRA53oV+ZdTT5nrHwO?=
 =?us-ascii?Q?/JWlmY/N6ha7bE101LrwwfUm+aL1pDQLfjgltmilGUS8umTm7k9rEQSLGrKE?=
 =?us-ascii?Q?YNHq7MBUgQUbV3hXcU7sqne5zQYBMyU4zKobPByqoefrJ5Adok8a1C0SODjv?=
 =?us-ascii?Q?o8WVTMkbr7S1SBNx9+5VE5pWdMv9rYezuQWCZRWB3z/4FIveMUO6NAQ89NJj?=
 =?us-ascii?Q?w1+wPVY9FatA4Lt1TDQqZ9LF2485EXpiIpkWNFmG4BuGekkdvTOLvZ4Y2m6v?=
 =?us-ascii?Q?Wh8nZhoPt7RChT1/DiXVwLMbUIEX3J0QrHgRfyHPO9R//D3MJ2kBhHdkeaDu?=
 =?us-ascii?Q?TmaV7l9UiC+6S9/LrofijwCSIUu762Q9ycwGBDf9v3sWGM/ngV6beGmK2Hay?=
 =?us-ascii?Q?FEw69pk7OEE6qtpZE+jlsvWCD9OyFB4Pps6Qujai+tnHV2tJ736c3YpNUa/g?=
 =?us-ascii?Q?OK/PRarQ7rVaRHJa1AHJtDXbA9s7jABa4sVyR3sQA4JWXpmdBKfIbrXrvL8J?=
 =?us-ascii?Q?iZ5C+b8na9JY7yXI2ZW93IBTgWapkYRuZVb0nMJJotPx+szQp6FDv1wcwme+?=
 =?us-ascii?Q?Ag9hN5cRc5/NM/cM/eWnYtNp8SdcrWmJ9HepsL/JavA7z2O+TGRXVoeoZAud?=
 =?us-ascii?Q?e71oMQ7/sdEKFTgeP8Ne86F5bRstR+wJ+jsbYzNoL9t3CtMBaawpVlWHA3H/?=
 =?us-ascii?Q?CA5B5DsCVQrjTxEPUhMWAEb5YQNww3fpTQdI76zehvrrvZ380BWD485A06st?=
 =?us-ascii?Q?K7f7n6bwBheATiZsPae5pjTK4QGPkW5JIuZsXJibaNMq6ZcnpTr35n9NJ5Ao?=
 =?us-ascii?Q?LQFbee7O1sTtNjhg2+r0ktnrEly2Aks1mxroeLv2GclmfBbU4/+wEHoB1Ylf?=
 =?us-ascii?Q?OCfoBf/OFuGpIUD66oy9JYXmSH7WQ0L9W7XlEecJoa+hPUM91FrYtn/bifJu?=
 =?us-ascii?Q?qS3yYiHScAeOrW92up3wm5jXJAV2az4vrRWu9u0nWFTwTAT6pSubSCX4hQyC?=
 =?us-ascii?Q?n72Sux1gt/lSLuF87ef7QVC3U+V/h4cMCiuDp2oqVsKCh2CEGzkwsUB72fTO?=
 =?us-ascii?Q?FIUV/PZWcCWO8Ij0HdMC8F+DWYokO3Ax3HaS58TWOCfvkO8OKxzLYF2WdpcJ?=
 =?us-ascii?Q?qaB78nf0e7UXwHwKtYV7Mf4vwN4jjqGNHobp2DZsfF/JdbTBKKK+qBtzZtw2?=
 =?us-ascii?Q?2kuk9xTCSHwv+0UWl4yz0B9s78mRKF6XD5j+wlplvKiitu+LLSK1l3NS8fuB?=
 =?us-ascii?Q?LLVfbgxeW/nG3SjTZpSjYiO8Q4t6t22FI1f0QkrQAN4S5UDt2rhFNrK7et8Y?=
 =?us-ascii?Q?eEuXphEXDS9pI+9rdKcdFgYSBvH/hEH5tL+W5nSGavrpARlf078TaDo699LE?=
 =?us-ascii?Q?wfBfm7WXXaA8Alk5kbZWhKSm7QQCANjkZPBSM94XQ4Lam2oUJ12hEaX7F/z9?=
 =?us-ascii?Q?UwRgVTW3kdbWZhN5eq6aBi82UERpES6PnTlSH72cjwQ18gahRBSQPCqP5eBY?=
 =?us-ascii?Q?I+q+Xv2V71MScIsqLn5G9ExTzdhDp7jzHtyJ2+S/C8AXtzyu4p+KP8hOIiVE?=
 =?us-ascii?Q?Wm9ZWH46X8DioNfY0qLrVwHuQHDF6tOgiNvXVoY/nfwZeFp3aGtLKV5s4bul?=
 =?us-ascii?Q?zCZKm5bdhgvf+k1TcewGi4koC1TNw2oMvSKi+EO1V9rmtlKe4yQEN2USzpxX?=
 =?us-ascii?Q?kJ3kRofparV+7MNfuNp3xGZr6QbgQyGk7ZG9nwYM6bQxV68JGHxm/QLYnhqQ?=
 =?us-ascii?Q?YqxgKbXMW4k3Q6XymKcZ+rkl59KfPQ4=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6491483a-33a6-4f1f-9e0a-08df0cba1a94
X-MS-Exchange-CrossTenant-AuthSource: DM8PR03MB6230.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2026 08:29:16.2681
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZSnmVwWivEZUOT8q9O7LzIfncb7b9GZ+axdkHKaR4WNjPWyWyv/gJxQIJTiKn6RS3E32z32V7WBtNUp6KNAvUbJz7T63tZI2U1z9J8h4C1Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB5777

This series adds support for Agilex5 in the SVC driver and enables FPGA
configuration and partial reconfiguration on Altera Agilex5 SoC.

On Agilex5 the DDR base address starts at 0x8000_0000, which is
outside the addressable range of the SDM. The SMMU is used to remap
DDR-allocated buffers to an IOVA within the SDM-accessible 0-512MB
window. Agilex5 REV B introduced a hardware SDM address remapper,
but it must be bypassed so no additional offset is applied to the
IOVA, keeping the implementation consistent across all Agilex5
revisions.

Patch 1 adds the fpga-mgr child node and fpga-region to the Agilex5 DTSI.
The SMMU is already enabled upstream.

Patch 2 reports unmatched frees in stratix10_svc_free_memory() with
dev_warn() and cleans up related coding style in svc_pa_to_va(). The
list-head corruption from list_del(&svc_data_mem) was already fixed by
commit 9119ceb76e98 ("firmware: stratix10-svc: fix memory leaks and list
corruption bugs").

Patch 3 adds all data-structure fields, macros, includes, helper function,
and allocation/free paths required for the DMA coherent mode. This covers
both the foundational types (dma_addr, use_dma_mem, dma_addr_offset,
SVC_SDM_DMA_ADDR_BITS/OFFSET) and the functional DMA allocation/free code,
keeping the structural and functional changes together so each intermediate
commit is bisect-safe.

Patch 4 adds INTEL_SIP_SMC_SDM_REMAPPER_CONFIG and integrates the Agilex5
path into probe: enforces SMMU presence for intel,agilex5-svc, issues the
remapper-bypass SMC, selects the DMA path via stratix10_svc_pdata.use_dma_mem,
initialises the controller fields, registers a devm cleanup action for
leaked buffers, and guards the error path against a NULL genpool.

---
changelog:
v2 -> v3:
- Squash former patch 2 (SMC remapper defines) into the probe enablement
  patch so the defines land with their first usage.
- Rebase on socfpga_firmware_for_v7.4.
- Drop SMMU status="disabled" removal from the DTS patch (already upstream
  in 10cf797f3f8a).
- Drop the list_del(&svc_data_mem) fix already present in 9119ceb76e98;
  keep the unmatched-free warning and style cleanup.
- Adapt of_device_id.data usage to extend stratix10_svc_pdata (shared with
  needs_psci_cpu_off) instead of casting BIT flags into .data.
- Keep kzalloc_obj()/kfree() lifetime for pmem on both gen_pool and DMA
  paths after 9119ceb76e98.

v1 -> v2:
- split original patch into smaller patches for easier review and backporting.
- Fixed the Fixes: tag in patch 3 referencing 5a0793ac66ac
- Replaced of_device_is_compatible() with of_device_id.data + of_device_get_match_data()
- Various commit message improvements
---

Adrian Ng Ho Yin (4):
  arm64: dts: socfpga: agilex5: add FPGA manager and region nodes
  firmware: stratix10-svc: warn on unmatched free in
    stratix10_svc_free_memory
  firmware: stratix10-svc: add DMA coherent memory allocation for
    SMMU-enabled platforms
  firmware: stratix10-svc: enable Agilex5 SMMU support in probe

 .../arm64/boot/dts/intel/socfpga_agilex5.dtsi |  11 +
 drivers/firmware/stratix10-svc.c              | 250 +++++++++++++++++---
 include/linux/firmware/intel/stratix10-smc.h  |  23 ++
 3 files changed, 239 insertions(+), 45 deletions(-)

-- 
2.49.GIT
