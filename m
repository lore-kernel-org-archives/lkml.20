Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.209.16
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794068099;
	b=L1Gvx1yWz+Jq7WwWY/nlhETeu12N/mq5IIxS/R1YcX+6tCh0dm9PuFKhe0oNZXORMZ0E
	 BpELfQko6DK5V3GmiHQWICNRneZH/4PJYfkGqspldn1ggofVZ0Hl7HoYuI1x6kwj2QlwF
	 LjwC8o4Gnxv+qE4LaVryQkJO56cCi3D9xvNoL2VbLr5YgPwN3f6cDk1tRPG/+Rxu15763
	 mwYzxZtFNRPeUN2g8nEZYTcZhpdEdwSNg36nDY2OrqK6Q3RoswclnR0mveBJRtu2OF1Y0
	 4HYTyFc0dcaHttaklNc9K1He/SXrlG9Mgve21L2earEsakHuL/UDlWhetoBXxxjVLjQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794068099;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:
	 X-EOPAttributedMessage:X-MS-PublicTrafficType:
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
	bh=zUb+mQiposxhcMIShe2CWBf6WxmfWMLVVNwDFvaSXOs=;
	b=NAyL9QXlsaQK76uxxOfowGiVgBJZ5xsFoNdll+BAJZRN0NuJuVvb1uBrpTsoRrX55CYi
	 L0B8ebf4jEM2LCCSPoYlvps2q8xn9N6Hool4kKb6m3b30M8jX0Qb9nxZgXhMCkn6S1ZAN
	 pAg8ULCC5VCCvutK4QpJD7ylpG+9D9Ot3/UMKHF6cw9cGshlI4h9fLWnC0CoZ8gXXa2WH
	 N28mn02xugAMkIz04F9NpI+2xEOrkrUUKvK2YLoUprhtdV+CFr5ne5ESFedRn4lBFahT0
	 eYpGpZme9v6dv1UAKZ1+EC5jbae818lSxXdsO3l6BYjVEZPG3y2WObp0bwQRHWcTy2w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=aNXqOG72;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.209.16
Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012016.outbound.protection.outlook.com [40.107.209.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35B58606A338;
	Sat,  7 Nov 2026 16:14:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35B58606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=aNXqOG72
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xWjUYv/DtganEOyL1KL2qJ9GwdWsdXUf0obCdLI6sTtgSUq0VLmBHoABRJsO6Z1usnGpvhN9lvTJ9nWmp1b9dX6KYNCEhrjXjAneV8Fg30DFYHX0oUQoYu8kJ6xLUEiAF6h/IYkvm5xfb0at4B1JtYLiyUfvqTr5fEV8k1E9bdLs4gN+9SwgIykhCc4OyNxqrSlQ6ibxSINW8vptKeA1MzCl4lJaM9r9HQDMR+iDcw9ilV6sCmzLOdk7VBrmhw2nwCiEn5oEYsHIYUbX56sf3bttgOzVsEJ08SVb8PHDBQ/tvDqjJ38FDjg8ZpTlaCOJL5e95oMSbthXJCck1l9/7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zUb+mQiposxhcMIShe2CWBf6WxmfWMLVVNwDFvaSXOs=;
 b=crb94PR6cCEMg+/dWgPr+UadClLlWn7JfPSe7yuhaE7fl6b1vZIUX60M3fhXFZYkMm78JrhHArq7MgxwDaODyNNJLppi7Vk21TagCsrs7cciFhRtfDrO6bFzUR/2H0O4ixh4xK43S9GUk6VeLeBwS9ftrHweblKKF7Md8uTlWZUHnFSuWwGxbuFSGlDwsd/zjSlSveT1aoeV14tKh7r+9XtqHVpJO6dL+0c7Ml7rFUNzxMzcyqkuxLfWc6xheRLL24qaw4qMaqnZ+cZlhtiHq5146hIY8pvzN5jD0UNJcqxJlUOZkugf9rkmjoysGGr94HVCSR5ipXd1Myf93tflDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zUb+mQiposxhcMIShe2CWBf6WxmfWMLVVNwDFvaSXOs=;
 b=aNXqOG72q7X5o1WoJ4+HiCNs6Vt1WOkjycIR3+2NrT2x1YOMVasDOGAi2UQfA0rpqlH0ridzEFOhuqG25D19sj7wn84zq6tA5uPK1VAb2zGkSZXMNEnGoS6NNOGI9XNOihQHmU8n2FCCia6jon9W5xGl89OZgYBj3Vd9al7fjIY=
Received: from MW4PR03CA0151.namprd03.prod.outlook.com (2603:10b6:303:8d::6)
 by IA0PR12MB8864.namprd12.prod.outlook.com (2603:10b6:208:485::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Sat, 7 Nov
 2026 16:14:51 +0000
Received: from MWH0EPF000C618B.namprd02.prod.outlook.com
 (2603:10b6:303:8d:cafe::56) by MW4PR03CA0151.outlook.office365.com
 (2603:10b6:303:8d::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.11 via Frontend Transport; Sat, 7
 Nov 2026 16:14:51 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 MWH0EPF000C618B.mail.protection.outlook.com (10.167.249.123) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Sat, 7 Nov 2026 16:14:51 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Sat, 7 Nov
 2026 10:14:50 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Sat, 7 Nov
 2026 10:14:50 -0600
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb08.amd.com (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53
 via Frontend Transport; Sat, 7 Nov 2026 10:14:46 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, <Richard.Gong@amd.com>, <Poojitha.N@amd.com>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>
Subject: [PATCH v3 00/11] soundwire: amd: introduce hw_ops dispatch and split driver into revision-specific files
Date: Sat, 7 Nov 2026 21:42:17 +0530
Message-ID: <20261107161345.3411491-1-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.53.0
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000C618B:EE_|IA0PR12MB8864:EE_
X-MS-Office365-Filtering-Correlation-Id: cf55c637-9638-42d4-72c4-08df3cea407a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|23010399003|36860700016|82310400026|10067099003|11063799006|56012099006|261021121427099003|261021123027099003|261022113327099003|261022075727099003|261022105027099003|261009223027099003|261026121527099003|261028144727099003|261026140227099003|261102123227099003|18002099003|6133799003|13003099007|3023799007;
X-Microsoft-Antispam-Message-Info:
	gx9TumEcVPEGPgeTaipUFI6EYpNzPE6rnlLJjFVhI3sFT9jZ4sq4lku7Sqd+CxdTlgL4k3xj3ARQYhnd8lA8+6BG3lAoKXIQGonSQpLqmAJNiREHi7ND6n1nU91gmHkYAk7KOJpfqpIlkHgLTpzGutJ2Z/2NAPhOQOqcEyS09PUTWcJTKVTgnJsc2cXeRCousHvQJYjusyBXvxNSf32UIKynTqVes0Qza3UGmcpQcgLWBSdD+fyDTLc2pRUQ8nbEuXghR2EGuhx+SWsPVOU/dm3+0kyNSx/LuCQvcGJI7V81w4gfXgiAdbc5HAu4lyBrXBJX4XvmxRxwakXqz9iceP4Zrkktnt2P3U9WnS1LAuO/GkTTojRCn2wLj8MUThWybMzOxs6vtjkcC1IkdyzpkhBeEJL13P2ECCpK1DPs5HqKwNFFkEiroi/qI1bjMNpUiV8hwUIJWvFeBw7HnocOXjTeDu5Q+Wxau9gSiqusQ69qv0MtFc0OoHGFC72cnFLXXbc6cPYBEoRByncd/R0mAfxd8E7QY6LtwdSawv5DNMx4NfQ3JEhr1HO242jrinxvTnjK6LxWJ3VEBKyAI6hu1hDqv9D366Au5U54Oe5FRVqe7JgsuihzN5KXtSnA/ajtkg73wPi5ao1p7X3comIcd3lHdaCB3z0runy+6D9N73Q=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(36860700016)(82310400026)(10067099003)(11063799006)(56012099006)(261021121427099003)(261021123027099003)(261022113327099003)(261022075727099003)(261022105027099003)(261009223027099003)(261026121527099003)(261028144727099003)(261026140227099003)(261102123227099003)(18002099003)(6133799003)(13003099007)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	afssKT2BiP7527VHA1KKVIMMdloUzZF/JUklljXTadDBp2q2DOn7r8gZWZxmFGezNAeBFC8k536efJAWP568Kc5aNW8sDwGFY7MkAxRgyGbm6haIylBr7AnBqzFenuMA1g8rdD5tGFo6rxD5kydDyqGfUnxS4HCpdGTCSk+N38MJtJItaJQjdY3afTP/wvra+PwUROZrFBeS3KwD+gV4xVicqniqvIQlQHgz6FLS+BvBWEswJmXZaEZCVLCJHJfPtD9WGvjvLlahzs+paA4emhc1BnlCOs5yPau5OZfLDclMBj1gHRUdvMmkibvqroF3aLZ8adPD3ds56I8K95T2VHUozDMTuSIpLKlUqnpSg/XNPJNdpUckS/l++Ilu+cY8Y+44YuuFgfDR1O0qE0mQJc15r/VBpa1AOGxRArLRR/7Yz8i06H6WyaUPNkZmFqmz
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2026 16:14:51.0339
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cf55c637-9638-42d4-72c4-08df3cea407a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000C618B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8864

This is v3 of the AMD SoundWire manager driver refactor series. It
incorporates review feedback from v2 and extends the series with two
new patches that guard DAI and clock-stop paths by acp_rev.

Changes since v2:
- Add patch 10: guard DAI PCM caps by acp_rev in register_dais();
  replaces bare stream->rates and stream->formats assignments with an
  explicit switch/case returning -EINVAL for unrecognised revisions.
- Add patch 11: guard clock-stop register access by acp_rev in
  amd_sdw_clock_stop(); replaces open-coded accesses with an explicit
  switch/case returning -EINVAL for unrecognised revisions.
- Patch 4 extended: also rename pad control helpers introduced by the
  fix series (amd_sdw_pad_ctrl_supported to
  amd_acp63_sdw_pad_ctrl_supported, __amd_sdw_oe_update to
  __amd_acp63_sdw_oe_update) to the amd_acp63_* prefix.
- Patch 8 updated: rename amd_enable_sdw_pads() to
  amd_acp63_enable_sdw_pads() in amd_init.c; the CLK_STOP_MODE path
  in amd_acp63_sdw_suspend() now gains the same interrupt-gate and
  work-drain sequence present in the POWER_OFF_MODE paths;
  amd_sdw_host_wake_enable_by_rev() is called in CLK_STOP_MODE to
  disable wake signalling before clock stop.
- Patch 9: commit message reformatted as a bullet list for clarity;
  amd_sdw_hw_init_ops() dispatch wrapper documented explicitly.
- Rebased on top of the AMD SoundWire fix series v5 (25 patches).
-Link to v2:
https://lore.kernel.org/all/20261013100306.2921771-2-Vijendar.Mukunda@amd.com/

Changes since v1:
- Patch 4 subject updated: "rename hardware backend symbols" (covers
  functions, op-table instances, and the register-offset constant)
- Patch 6: removed the forward reference to "subsequent patches" from
  the commit message; dropped WARN_ONCE guards from dispatch helpers
- Patch 7: commit message corrected; #include <linux/workqueue.h>
  addition dropped (available transitively)
- Patch 8: amd_sdw_hw_init_ops() now uses a static const
  struct amd_sdw_hw_ops instead of devm_kzalloc; amd_sdw_hw_init_ops()
  moved after amd_sdw_manager_remove() with a forward declaration before
  probe to resolve ordering
- Patch 9 (new): splits amd_manager.c into amd_manager_common.c
  (shared revision-independent functions, analogous to cadence_master.c)
  and renames what remains to amd_acp63_manager.c (ACP6.3/7.x register-
  level backend, analogous to intel_auxdevice.c)

Series overview:

Patches 1-3 are preparatory: rename the manager-count macro to carry
the ACP6.3 scope, convert the pdevinfo/sdw_pdata and pdev arrays in
sdw_amd_probe_controller() from fixed-size stack arrays to heap
allocations sized by the ACP revision.

Patch 4 renames revision-specific hardware-access functions, op-table
instances, the manager register-offset constant, and pad control
helpers to the amd_acp63_*/ACP63_* prefix.

Patch 5 removes an unused define.

Patches 6-8 introduce and wire up the hw_ops dispatch framework:
patch 6 defines struct amd_sdw_hw_ops and the inline acp_*() dispatch
helpers; patch 7 converts the irq/work handlers to dispatch per
acp_rev to their ACP6.3-family implementations; patch 8 extracts PM
callbacks into hw_ops slots, renames amd_enable_sdw_pads() to
amd_acp63_enable_sdw_pads(), populates a static const
amd_acp63_hw_ops table, and converts all remaining direct
amd_acp63_*() call sites to use the acp_*() wrappers.

Patch 9 splits amd_manager.c: shared revision-independent functions
move to amd_manager_common.c and the ACP6.3/7.0/7.1/7.2 register-
level backend is renamed to amd_acp63_manager.c.

Patches 10-11 close two open-coded revision assumptions left after the
split: register_dais() and amd_sdw_clock_stop() replace bare accesses
with explicit switch/case blocks on acp_rev.

Dependencies:

This series applies on top of the AMD SoundWire fix series (v5,
25 patches) posted at:
https://lore.kernel.org/linux-sound/20261107154659.3358223-1-Vijendar.Mukunda@amd.com

Vijendar Mukunda (11):
  soundwire: amd: rename AMD_SDW_MAX_MANAGER_COUNT macro
  soundwire: amd: allocate pdevinfo and sdw_pdata by ACP revision in
    probe
  soundwire: amd: allocate sdw_amd_ctx pdev array dynamically
  soundwire: amd: rename hardware backend symbols to amd_acp63_*()
    prefix
  soundwire: amd: remove unused AMD_SDW_MAX_FREQ_NUM define
  soundwire: amd: introduce struct amd_sdw_hw_ops dispatch framework
  soundwire: amd: dispatch irq/work handlers to per-revision functions
  soundwire: amd: populate hw_ops and wire all call sites through
    acp_*() helpers
  soundwire: amd: extract shared functions into amd_manager_common.c
  soundwire: amd: guard DAI PCM caps by acp_rev in register_dais()
  soundwire: amd: guard clock-stop register access by acp_rev

 drivers/soundwire/Makefile                    |   2 +-
 .../{amd_manager.c => amd_acp63_manager.c}    | 940 ++++--------------
 drivers/soundwire/amd_init.c                  |  54 +-
 drivers/soundwire/amd_manager.h               | 255 +++--
 drivers/soundwire/amd_manager_common.c        | 822 +++++++++++++++
 include/linux/soundwire/sdw_amd.h             |  11 +-
 6 files changed, 1249 insertions(+), 835 deletions(-)
 rename drivers/soundwire/{amd_manager.c => amd_acp63_manager.c} (52%)
 create mode 100644 drivers/soundwire/amd_manager_common.c

-- 
2.53.0

