Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.48.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794066490;
	b=c+PPbFGfh6oYqtgFcmAKJjw1ioxcGTKgrAsmHZ+v82ld7XZ2hFv0gF8QdoRtMWgQddJN
	 g/i7FP8qtuDkzGPJAZxG+SUdv4zONH45s2ydIw2hiSOijjKULvM7fpcsWoqANmbqcN+t7
	 QLvwOgBnlPiWQaA6WX2Hl0C6ax3BskfKa1a8UKp9MsM97mN4vg2PE8tIjpC/DwiRPDRFP
	 K9ul/lCMuHHGxhJh8k/ayk4zATUYuN5RU8Mc0RO7U0Sa8YKJBbnP2pluhl5DjgNQQgD23
	 HY+JT66m1izUkEGc4QsWZ9xm2QmE9lLdo2drVI18+GxP9SAwnQtvat05srr4rs4lM2A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794066490;
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
	bh=xtkC/nCsxNfTTCpMsCLBQWFrWixnaJK40KSDGvoJGkM=;
	b=tdsL6pjedBIw9EXb/dha/Bkr6grvk2E/TQIhcjwmAT+TxOJh3RKkphwbNh0NgTBblCgC
	 M8gPPpK/BriVfc0cZ6NGxKalzl7uzO2B8nUbqMd9gtsge1iUl6z8v6WYRo+KUmhg0qAu6
	 TBkGMk6kfyFThdt8szw9AmQK276C6Iy/NXzSZWzLR3Ie8kw9Jeeox/kogG3Eule6D+4fN
	 6aXSZwbAPDYV2L18cwkgmce8sPnuRzQSIuAMl/AkTIKvz5Dsel/mkVLoKQMaXkePbZQZd
	 G7v3/e2kA54cYm1J5YKxDlkmPDMdGq3I9HCl0nmaOIheyfE94VQbk0lZmM8suxfqzwA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=uabCRoDr;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.48.47
Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012047.outbound.protection.outlook.com [52.101.48.47])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EDC7606A326;
	Sat,  7 Nov 2026 15:48:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6EDC7606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=uabCRoDr
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K8eJ/9Mybtg17xT8Nd9QNu0cEIKv+8c+CA8RFT//g4eP2hSJwIXtblZyG3BGjsQL6YGizcZWgXTA0TPRQKg3YMY51p4f0MZShVQAqjycTSuRwer/vZq4qOiw1F7oV6kM3dS6/rK9QDPWKKDfw5ovSEM0HupUso0zOy48cAo27tPI6rJS67Aq9lfW8p/W6VV1g7ukr0pSEIR8L0GDIJV9LoLNADsk1aAZwW4x133DmuOA4Pj6yk/suRec9dUJFh24ScmfHvglfdcf87bsCyouJexcQ9yYmwK3Rjz9inxy7BVpBpN8VTLCrIVtRyAv9QZpOXVnH1k6m2zKMsQFxX8t5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xtkC/nCsxNfTTCpMsCLBQWFrWixnaJK40KSDGvoJGkM=;
 b=p0wYY31v/J8DCtj7vzYMdXowxSeekvvDrAFZGVt6uWqHGFkYo4by24Lvq1OzsANtnYTp8dxNbdb5zXAS9ynWHPCCsIrseN8v+hKFbuyMl1vO7xnqJ6SmCjcLT7Cfe2lbuDFDeZSnIpTeBwQk9gmaaNkiOrBlGE+wzNM4RY+cDqq0DSUwvRdaQqkukIXhdkdDNeOWRwyYDkYUrgLX9vBfDV1eXH4K1vGfvD5j+tnz+K8/3GlSx4z4A0/eTHHB2S4zSsdQVjLgfchY9eM5f9VqRU78IgpU7NCpVBlYhwGIC//bbOgHrogYIoMqig9SiynOtXqo6rdfDjYcetdSAH5/lA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xtkC/nCsxNfTTCpMsCLBQWFrWixnaJK40KSDGvoJGkM=;
 b=uabCRoDrgyRDPeVQsLeTEb6AUD/lQfBwXJxtnnR7oVWL7rQs7GLgsmrhLV9ctYQUF0wj03J9+EM6WJveri7LqGUkI4OeK32wO5hK+KygVV6ubVAxh9DCG3s1+kwpwzE5ilXJztdKdIEK/AqDeZ3gfGKVBPL9lBtVXacvNd98B/8=
Received: from PH7P220CA0143.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:327::25)
 by PH7PR12MB8056.namprd12.prod.outlook.com (2603:10b6:510:269::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Sat, 7 Nov
 2026 15:48:05 +0000
Received: from BY1PEPF00026964.namprd05.prod.outlook.com
 (2603:10b6:510:327:cafe::39) by PH7P220CA0143.outlook.office365.com
 (2603:10b6:510:327::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.11 via Frontend Transport; Sat, 7
 Nov 2026 15:48:05 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BY1PEPF00026964.mail.protection.outlook.com (10.167.244.148) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Sat, 7 Nov 2026 15:48:05 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Sat, 7 Nov
 2026 09:48:04 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Sat, 7 Nov
 2026 09:48:03 -0600
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb08.amd.com (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53
 via Frontend Transport; Sat, 7 Nov 2026 09:47:59 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <broonie@kernel.org>, <yung-chuan.liao@linux.intel.com>,
	<pierre-louis.bossart@linux.dev>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <venkataprasad.potturu@amd.com>,
	<Syed.SabaKareem@amd.com>, <Mario.Limonciello@amd.com>,
	<Richard.Gong@amd.com>, <lee@kernel.org>, <Poojitha.N@amd.com>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>
Subject: [PATCH v5 00/25] soundwire: amd: SoundWire manager driver bug fixes
Date: Sat, 7 Nov 2026 21:15:09 +0530
Message-ID: <20261107154659.3358223-1-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: BY1PEPF00026964:EE_|PH7PR12MB8056:EE_
X-MS-Office365-Filtering-Correlation-Id: e0857c29-9236-4dc1-ea3e-08df3ce68343
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|23010399003|36860700016|1800799024|18002099003|6133799003|10067099003|13003099007|56012099006|11063799006|261026140227099003|261028144727099003|261102123227099003|261022075727099003|261022105027099003|261021121427099003|261021123027099003|261026121527099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	xOrZAxTL5zadGZWXG6OuAfcpP2nVc2bJNxfGMpLGTFbe46MHiKlKMTm+Sq0y6/rJJWoNGjAiwzDuauldVC3P5YJkTraMFRKvtjDUCmB/i+Ax+ejgZiUK6yAPdpPOEf8b+PArMZ9jro0VoZiZyT9Dho8F1JyOAW5P62QLgTCPHgYf5tQ7emho436Nz2P8xI6WZ4x/dJ/w9sx/hxR7YLDDC79WNAQuOh8O5FXpSiFV/APvB6M11lhjzZs254QsNBud2+myC0fIggIlmoAy2HQaGV1tLFRqa8TnOT9L9kokSYURL1JAEeOEE3+rg57YWVAXUtlX3riDXd7GDWNSMmwSe/r8ty8tZ+6aEM7woRta3Lak5ak2GteFrqF8+afMfYVrWwFrN/HAOUmdXlk3HlzKuhMS+FgSGYamVrA2jUfeuEOhBEG8b1H9aAsnxgeAGWQ0Fk2sgCzNGnx/D7Hp87R+YlVYeNiZhxWb8N38mhcALwMRhdpwWkfYNHlbaIGy5ZbeFSBZDGI9YwVlVBFzPpKaFniDC5gLfSZ8IIjTw9gFyYDCMlpRQp+5X5LhU5BmgmjtKbocg1iA99tnkNfWR7V4zarhVGJKVItGc3E1jkSGadwdUcxW9xBhnyKM8Y4ZWbTGLwbMRmt1RUOxCjAkKwgVpv0QqhwB6q9yQKO7PKN3y84=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(23010399003)(36860700016)(1800799024)(18002099003)(6133799003)(10067099003)(13003099007)(56012099006)(11063799006)(261026140227099003)(261028144727099003)(261102123227099003)(261022075727099003)(261022105027099003)(261021121427099003)(261021123027099003)(261026121527099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ywiWT5Ttqa6jynZnhrS/tPBh1aku9anVB1MRtFMIEyY0xfkV/yWDBtqHp4cggPkyghoZtPMdQAutZxk7133DYmRq6CwN0qmy4dEO3keWeDjy+Pk5bftfhNt1NRfMc/yRvI5ZyPbeJNFE2gSsEj8kf79dWGnopKwFfCmMvrEhsZ6GU2SCZvU7EkuPoXF2vutzrawzqFn+NVkI5D9TBsXCeW5b0zMx++SEqKpIAgaSjbT1wSqVdSiCwZBErtL9qM+9OspWXWBYH3DJki+IX54a2Wu9Y56mAKsmezYJ/9/FzFP3qwtHqmDTbURqO7/Yam5pHCiDaLEKO7PmwBtDH1YR8JsH3Qzf7rOWtNMUg60opJJsDdxRVtEBBb8b0/WqwueTXEKydgr0t2foppn5NmeeK+Lxcwu9YgSKBMg/1p3xKdot/ijbVs7yyARPcFvtfOc7
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2026 15:48:05.1288
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e0857c29-9236-4dc1-ea3e-08df3ce68343
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF00026964.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8056

This series collects bug fixes for the AMD SoundWire manager driver
(ACP6.3/7.0/7.1/7.2). The patches address correctness issues across
five areas. Patches 9, 14, 15, 17, 22, and 23 fix issues reported by
Lee Jones <lee@kernel.org>.

Wake interrupt handling (patches 1-8): fixes reported on OEM platforms
running ACP6.3/7.0/7.1/7.2. Consolidate pad register macros into
amd_init.h, add correct SCHMEN/OE programming for ACP 7.0/7.1/7.2,
introduce D0/D3 PM pad helpers, track full pad teardown across
suspend/resume, fix missing wake interrupt and group wake-arming calls
in runtime suspend, fix the IRQ thread dropping STATUS_0TO7 on
simultaneous wake and state-change events, remove the spurious
STATUS_8TO11 clear in amd_sdw_process_wake_event(), and fix a missing
wake interrupt for ACP6.3 in POWER_OFF suspend.

Command response handling (patches 9-13): fix silent widening of
-ETIMEDOUT to u64 (reported by Lee Jones), return valid hardware
response when only the IMM status cleanup poll times out, clarify the
bad-state guard poll omission in the IMM_RES_VALID path, cache the
last successful PING result to avoid spurious disconnect warnings on
transient timeouts, and add lockdep_assert_held() to enforce the
msg_lock contract.

Work-queue and driver lifecycle (patches 14-18): fix drain ordering in
the remove path and defer dev_set_drvdata() until after INIT_WORK() to
close a concurrent-remove window (both reported by Lee Jones), guard
pm_runtime_disable() against unpaired calls, guard IRQ work scheduling
with the interrupt_enabled flag (reported by Lee Jones), and delay
*sdw_ctx publication until after sdw_amd_startup() succeeds.

Power management (patches 19-22): propagate amd_init_sdw_manager()
errors on POWER_OFF resume, drop amd_deinit_sdw_manager() in POWER_OFF
suspend, replace the open-coded >= ACP70 comparison with an explicit
switch/case, and fix interrupt-gate and work-drain ordering in PM ops
(reported by Lee Jones).

Drvdata and register safety (patches 23-25): add a NULL drvdata guard
in sdw_amd_startup() (reported by Lee Jones), and fix shared-register
read-modify-write races in amd_sdw_set_device_state() and
amd_sdw_host_wake_enable() by holding acp_sdw_lock.

Changes since v4:
- Add patches 1-8 (OEM-reported wake interrupt fixes for
  ACP6.3/7.0/7.1/7.2): pad register macro consolidation, SCHMEN/OE
  programming for ACP 7.0/7.1/7.2, D0/D3 PM helpers, pad teardown
  tracking, missing wake interrupt in runtime suspend, STATUS_0TO7
  race fix (promoted from patch 12/13 in v4), STATUS_8TO11 fix
  reworked to a targeted removal of the clear in
  amd_sdw_process_wake_event(), and ACP6.3 POWER_OFF wake fix.
- Add patch 11: clarify bad-state guard poll omission in
  IMM_RES_VALID path.
- Add patch 15: defer dev_set_drvdata() until after INIT_WORK().
- Add patches 17-18: guard IRQ work with interrupt_enabled flag;
  delay *sdw_ctx publication until after startup succeeds
  (supersedes v4 patch 7 ctx-leak fix with a more robust approach).
- Add patches 23-25: NULL drvdata guard in sdw_amd_startup(), and
  shared-register RMW races in amd_sdw_set_device_state() and
  amd_sdw_host_wake_enable().
- Drop v4 patch 7 (fix ctx leak when sdw_amd_startup() fails):
  superseded by patch 18.
-Link to v4:
https://lore.kernel.org/all/20261026044507.2310694-1-Vijendar.Mukunda@amd.com/

Changes since v3:
- Add patch 12/13 to fix IRQ thread dropping STATUS_0TO7 when a
  wake event and a device-state change arrive simultaneously.
- Add patch 13/13 to fix STATUS_8TO11 double-clear race in the
  wake handler introduced by the simultaneous-wake fix.
- Add lockdep_assert_held() to amd_sdw_read_ping_status() (patch 4/13)
  to enforce the msg_lock contract machine-checkably.
- Add return response on IMM status cleanup timeout (patch 2/13).
- Update patch 11/13 (fix interrupt gate and work drain ordering in PM
  ops) to also fix amd_sdw_wake_enable() ordering in both CLK_STOP_MODE
  paths: move the call to after amd_enable_sdw_interrupts() so the
  unconditional interrupt mask write does not clobber the wake bit.

Changes since v2:
- Update comment for ping_slave_stat variable description in patch 3/13.
- Split the remove path work drain and pm ops guard patch into separate
  patches (patches 5/13 and 6/13) to improve clarity and maintainability.

Changes since v1:
- Rework patch 1 to fix the u64 return type properly via out-parameter.

Vijendar Mukunda (25):
  soundwire: amd: consolidate pad register macros into amd_init.h
  soundwire: amd: program pad SCHMEN and OE control for ACP 7.0/7.1/7.2
  soundwire: amd: add pad ctrl helpers for D0/D3 PM transitions
  soundwire: amd: track full pad teardown across suspend/resume
  soundwire: amd: fix missing wake interrupt and group wake-arming calls
    in runtime suspend
  soundwire: amd: fix IRQ thread dropping STATUS_0TO7 on simultaneous
    wake
  soundwire: amd: remove STATUS_8TO11 clear from
    amd_sdw_process_wake_event()
  soundwire: amd: fix missing wake interrupt for ACP6.3 in POWER_OFF
    suspend
  soundwire: amd: fix SDW command timeout return value handling
  soundwire: amd: return response on IMM status cleanup timeout
  soundwire: amd: clarify bad-state guard poll omission in IMM_RES_VALID
    path
  soundwire: amd: cache ping slave status to avoid spurious disconnect
    on timeout
  soundwire: amd: assert msg_lock is held in amd_sdw_read_ping_status()
  soundwire: amd: fix work drain ordering in remove path
  soundwire: amd: defer dev_set_drvdata() until after INIT_WORK()
  soundwire: amd: pm_runtime guard in remove path
  soundwire: amd: use interrupt_enabled flag to guard IRQ work
    scheduling
  soundwire: amd: delay *sdw_ctx publication until after startup
    succeeds
  soundwire: amd: propagate amd_init_sdw_manager() error on resume
  soundwire: amd: drop amd_deinit_sdw_manager() in POWER_OFF suspend
  soundwire: amd: replace >= ACP70 with explicit switch/case in PM paths
  soundwire: amd: fix interrupt gate and work drain ordering in PM ops
  soundwire: amd: check for NULL manager drvdata in sdw_amd_startup()
  soundwire: amd: fix shared-register RMW race in
    amd_sdw_set_device_state()
  soundwire: amd: fix shared-register RMW race in
    amd_sdw_host_wake_enable()

 drivers/soundwire/amd_init.c      |  69 ++++--
 drivers/soundwire/amd_init.h      |  18 ++
 drivers/soundwire/amd_manager.c   | 364 ++++++++++++++++++++++++------
 drivers/soundwire/amd_manager.h   |  10 -
 include/linux/soundwire/sdw_amd.h |  15 ++
 5 files changed, 369 insertions(+), 107 deletions(-)

-- 
2.53.0

