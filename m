Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.57.25
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794900058;
	b=kSOxnVEm3N3KLNwRCZagru0m5ddxrNmGn4w9mS+h0wBu5RVAO+NH42PPMt5FBLRYe/un
	 bNG0GH33z/a+DeY6DHF4sR0to3fXqYQjffHTdM409CE7N9buKeqd0nTW1HMo3azKucMel
	 W16naNn1hcA14NZs5t2K27uGptfpN8vuP7o98/O+6As/4LmXI2/Kk/T+3u7utN3HS8p7g
	 u9efdrJRIShBTVx9xiAH9P5LUXg2dBz8s82bpEaX+DpJR513Cx9PuFTCmVD4cvF0Z2Njc
	 z33kwtRGsKcsGze9ZQBqgReBckc5zKK4SRuSVWBrrql2T3DAEiH0WMwomDIzImdUxiw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794900058;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=w/tknoFA2I2kFPoRLQY5oRS7rMV5q8yiccpOdevw+DA=;
	b=Ghmiijmuwixk1zVMEhhaosIr8d2kMAF1Xmv3d6WuHcQB3CMpK7lm6BNb76EFaek+yZ8y
	 k4KLKsogig9iQ2PZnJSVdLO/XMubYdbPVaCg7aSm4Z8GGEjviwOgfp9OonZBN+g8GxtVe
	 WpNEXJ1jHV271TsYMjGTtZJVwgRmlWJqWzNVb8KagqFM1TnBVHc89Xr5DPjR11Ls9oiHa
	 Dz2SYVp4caGyXAZGCJQlAGTH7FteV24tGJJ+iWAiUcpI7lQVV7px543//lZoBx+Sr9aab
	 LGr2WWued1lXb3lg1/AVJwHCZh2sYftVMoNFnG5HkNEf08OSD50DjzD5FvahNQSbpAw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=aDetprio;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.57.25
Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011025.outbound.protection.outlook.com [52.101.57.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD388606A336;
	Tue, 17 Nov 2026 07:20:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD388606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=aDetprio
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zRo9aITf7rcn8znX1DQWu7KeOFjZwRCiuatJK6JOWI28hOky2Nqrh24duoYP5+3RWbB3aOm7aLEJpcyE5qlR6J/ZFC6azhR+Jyh5Fqbe/s7UmhZhMHNPn2HW+PWbs7njkQuWj3/xIXAbsPH7XFzTRFcWlzNohUyNUQ/gyPpC4V0eJTkEBZf3GBU5J58OLh69B9TgnmG7yVdRoWIMRxxnUY9ogYpWhn/DMm1Ny/xO7Lko4xxqhl+YAYtbZcxLh2N1Y/KIcvbJev+8CKsc+ftXopsnDp60clyeZ1yJc7vHUvqiwgToNkh/GVDawRcR87jrTA+7UOWd8VKkfVNgRsRROQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w/tknoFA2I2kFPoRLQY5oRS7rMV5q8yiccpOdevw+DA=;
 b=dHmG0/Lx4uyR5Rh1dCHC+N/IutrOK3SFodCJQPRkrAxZTCYyKqJTyO/T4KDvhhGA8tOA/r8hbNSqfU3UorUX65WksB7XeLSpigJxuj+iBc2U0j1galSBr2LUVr4D+hY7M38tRrohTio1seD4r7ex9Xh6rqSIKKn8SFAG9sTnY+7Ej8E09YYp+CoxNM2SjcFvZsSThw84pmaim8oVcImCSjhiX9EG1MgmBYFZSyxtvWLTkx/Kdio9mJdgy8fr/QfC3XVZR7Fx5b9TCVCwf0ihL5ZnXDou6BmvQU7Yvv3IvFPgzmw6A4DCvbD4McnB2V5DIIxROyCin8P4XfCCy0f+JA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w/tknoFA2I2kFPoRLQY5oRS7rMV5q8yiccpOdevw+DA=;
 b=aDetprioNgM8MTdqudymaVAlPr+OFSaPiSfx6sbvkmV7WH4y/K4KCrPDV/j/TRYloiV3ihaF+f6OFm9CI/zErBAxHAyH05nXaV/aiACoA+Yl31HKYTK/qz+PjPH2DZryI1Ryd/YmWlN8Aoo3MnNPkYk1yq0HGLRX0NQFUBkXbSg=
Received: from BN9PR03CA0152.namprd03.prod.outlook.com (2603:10b6:408:f4::7)
 by SA1PR12MB9513.namprd12.prod.outlook.com (2603:10b6:806:45c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.13; Tue, 17 Nov
 2026 07:20:49 +0000
Received: from BN2PEPF0000A803.namprd02.prod.outlook.com
 (2603:10b6:408:f4:cafe::4) by BN9PR03CA0152.outlook.office365.com
 (2603:10b6:408:f4::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.10 via Frontend Transport; Tue,
 17 Nov 2026 07:20:49 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN2PEPF0000A803.mail.protection.outlook.com (10.167.245.164) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Tue, 17 Nov 2026 07:20:49 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 17 Nov
 2026 01:20:48 -0600
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.57
 via Frontend Transport; Tue, 17 Nov 2026 01:20:44 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, <Richard.Gong@amd.com>, <Poojitha.N@amd.com>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>
Subject: [PATCH v4 00/11] soundwire: amd: introduce hw_ops dispatch and split driver into revision-specific files
Date: Tue, 17 Nov 2026 12:48:09 +0530
Message-ID: <20261117071927.830373-1-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF0000A803:EE_|SA1PR12MB9513:EE_
X-MS-Office365-Filtering-Correlation-Id: 55e5df98-0a6d-459f-9354-08df447b4e4f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|36860700016|1800799024|82310400026|261102124527099003|10067099003|11063799006|56012099006|261026121527099003|261026140227099003|261028144727099003|261021123027099003|261022113327099003|261022105027099003|261022075727099003|261021121427099003|261102123227099003|261009223027099003|18002099003|6133799003|13003099007|3023799007;
X-Microsoft-Antispam-Message-Info:
	zKOKblKb2picTluXPXJxr03ylOR6J2KcLIoU8ltkz0GfPkOwu/Zpeanz2NFFW2lEWohpjEMS65zmHBsaxvAXHE87fCGyVLhSbXCte4UHcNL3x8G1wKA8jpaCfYIrLPszDyNa6oLLah4IgCalQHdQvOiJHE7fGJrH476z+M01xUl53SyQcudgLQ3KcPgEjlndawnKCuXVpylO6eR+y7dWOlva8LqXbsX1lRgM6iKLhUo4wQda6yNdyBtQGKp8uWmkgGDJUdptLXPOlZc0MdwdKZJRC2bNLPVrFafImHtTF7Kd2OizDA36jH8oKq3PEqn4GYw32IPxD8nDFsqaHsZp0pstB3PGtwXKqi6+zDZK0sKmy4Wo0yw2W9doupONtKm7nJ4uhoeKtW8AN3UEGXtdpx5bzLl3z5vrglAhximmBBaXOJDUss8CmfU+JzHakHMaor5ygSOqjB9BGaLIs8Rb4BBifnjBZd0shosQ/Nnrr9TsevmW71BOr3NaNzcaIhaSNyyYQzOuwThnP3vxtleDVX92gOf8jieWOdefPQk8AC1GewnVAhXs7LEBgzN55f7yGo9I6TfVIxTMXqOiyT2xI/nWnq7f9t0HxMaJtLXiIKB2Xy/wzTRPajbwISFAdR756omk3gv+xZVVDYS3Qy6YOQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(36860700016)(1800799024)(82310400026)(261102124527099003)(10067099003)(11063799006)(56012099006)(261026121527099003)(261026140227099003)(261028144727099003)(261021123027099003)(261022113327099003)(261022105027099003)(261022075727099003)(261021121427099003)(261102123227099003)(261009223027099003)(18002099003)(6133799003)(13003099007)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	TwgJa0QIdG/5pGkzdedMh+2EPqdlIOeGYTCkNZ6aam/Z8Nt44WeV+zoEbdpknSGKa/AK1S2NWwLgTDWXsUX3fty7VJBcUBKEKwWxu747FtS7XF0m2Bci1CjOUKb+v2WKnB0T9Fm4niizgn/7Aa6ChzNSo8JzJvuzBbk9zmNJD+LlM9rEHXuM8LxWXKIL0VoeZwWLyYCd42ot+g943aTF5lzB9MBNFOGPZqUKoNafplIIyTGfK+2okz86qFrCuuzDDl71ok0EQDpeiZ4Sqfbt6vn6MTla4/87SNud/0ZlHo+Z4G4yPZ920o2ljoucRRade+Q8EzbKmgWyJaiDtuw9PTujnd8exS9svLxFKkYJk8sZQ/HG2/BUw2IAzo6TrxyG+y71m6xzjhAjv5x4APBXNA1HjERoTu/gjejSkagMWs67TEECY8mR3Y+quD2y+ifp
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 07:20:49.4981
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 55e5df98-0a6d-459f-9354-08df447b4e4f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF0000A803.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB9513

This series refactors the AMD SoundWire manager driver to replace
direct calls to ACP6.3-specific hardware functions with a
function-pointer dispatch table (struct amd_sdw_hw_ops). The goal is
to make adding support for new ACP revisions a matter of registering a
revision-specific ops table rather than scattering switch/case
statements across the driver.

The series also consolidates probe-time revision-specific assignments
into explicit switch blocks, replaces fixed-size arrays in
sdw_amd_ctx with dynamically-allocated ones sized from the ACP
revision, and cleans up a few stale symbols and redundant
initialisations.

Background:

The AMD SoundWire IP block was introduced on ACP6.3 and is shared
by ACP7.0, ACP7.1 and ACP7.2 with minor register-level differences.
The driver previously used a flat, hardcoded naming scheme
(amd_sdw_*) with no mechanism to swap hardware implementations per
revision. The amd_acp63_* prefix and the hw_ops dispatch table
introduced here make the per-revision nature explicit and provide a
clean extension point for future platforms.

Changes since v3:
- Rebase on AMD SoundWire fix series v6 (23 patches) in place of v5
  (25 patches); all context lines and base commit SHAs updated
  throughout.
- Patch 6: expand @suspend_runtime comment in struct amd_sdw_hw_ops to
  describe how it differs from @suspend: runtime suspend arms
  host-wake interrupts so the hardware can wake the host, whereas
  system suspend disarms them.
- Patch 8: drop dev_err_ratelimited() from
  amd_acp63_sdw_read_and_process_ping_status() and
  amd_acp63_sdw_read_ping_status() for ping-status timeout; timeouts
  are already tracked by the cache introduced in the fix series.
- Patch 9: keep amd_sdw_fill_slave_status() static in
  amd_manager_common.c; remove the declaration from amd_manager.h
  (the function is called only within amd_manager_common.c).
- Patch 10: use local dev variable in dev_err() call consistently with
  the rest of the function.
- Patch 11: drop the second switch/case block from
  amd_sdw_clock_stop(); ACP_SW_WAKE_EN is valid for all supported
  revisions so the wake_en_mask write does not need per-revision
  dispatch.
- Link to v3:
https://lore.kernel.org/linux-sound/20261107161345.3411491-1-Vijendar.Mukunda@amd.com

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
- Link to v2:
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

Dependencies:

This series applies on top of the AMD SoundWire fix series (v6,
23 patches) posted at:
https://lore.kernel.org/linux-sound/20261117070906.803139-1-Vijendar.Mukunda@amd.com

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
 .../{amd_manager.c => amd_acp63_manager.c}    | 934 ++++--------------
 drivers/soundwire/amd_init.c                  |  54 +-
 drivers/soundwire/amd_manager.h               | 258 +++--
 drivers/soundwire/amd_manager_common.c        | 809 +++++++++++++++
 include/linux/soundwire/sdw_amd.h             |  11 +-
 6 files changed, 1236 insertions(+), 832 deletions(-)
 rename drivers/soundwire/{amd_manager.c => amd_acp63_manager.c} (52%)
 create mode 100644 drivers/soundwire/amd_manager_common.c

-- 
2.53.0

