Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.61.40
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794899431;
	b=W52WLDQT0Sh2RudGl+osx7o00qF+enap6PTdYA5qlqbQC8rZBkbx1/FwQHDPhNP+LiEA
	 IZhrjxiwtXn2DgF569IAZqPiBa79DT7Y5XumSORUardxVQ2leM5EL9aPQuOMAX+L6hO7C
	 WRQpfxX8DzEneDqEi5srfE+9Gfu8Ndr2bcQjIW7S0I039tIU7xH/NQKeMQgDaXXRQwoyE
	 hAdBlZ83SSFLbz6V55A+joB5Af55unCAE7Bu33BD3mDdXF+2U9sYFaNq3PYwul/9hZFoK
	 KHXB+JE6zU5lWI4bkhigqObOXSZ07AaSCwWsnmYA27iAvCy9y8a2JycpWMagcezQMPA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794899431;
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
	bh=5sJ7mvul8ZX+e4tVgNRzplW3p1fhk0NocsATG/DhYo0=;
	b=3ERRJwxMnvskLk16alnPDFMyvyiwQriSHno4/Pl4F5rZUyuWKKdN3Xuk3K3xFeVqDBbj
	 Zo2cu/dXetUJtwYasWchl+UrQbVVKwGlHj/p6E2/Hoa1OiYaKIgIAof0ad+MKvmTEBBdy
	 T7MVbxtqplwPQymtox/cGInyxinAlIH47xQJ1xTQZAC3pqPFuT5L3vsT4Zf8DVZsAINVO
	 +6z4gQ9xJqMwokeQy7yLJCL7UXTqWaC9x4o0oNKxq87p7rEVSh7d+IXPTWqWqpozF+p9Z
	 5vY+aGLWTLNcwn2zpoCGTHdGRxgLWkk/zH+tRkv/O9DCFtLZjvdEDlK0/9aV1dmxSSg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=k6Z0DHWQ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.61.40
Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010040.outbound.protection.outlook.com [52.101.61.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BE38606A31C;
	Tue, 17 Nov 2026 07:10:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9BE38606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=k6Z0DHWQ
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W5IdVd6pT+1nyDNn+BSMEnBpKitti3kBnQTuLuV9hJyFUYHez4NuJhRQ58WS/yvdAhRP6oWL2TXq3TI6Jv+fUsJG+DJecBewfy/bGjliaKdEgd5rr6DA6kqkNglvzf7sg6lNJGXFnjhhgPs9k2/4D6IN2QuT8sLgdGbsajY7LAr8KuT8s55pRbbRcM8s9+ulnphcM4cqVOHZw3WBNYVa4a2BSK1h9Q+o4LGa9R1XB6oIZRbTCT1k+BdEwlITO34LqnME0BQuDCkBO0zwYJxyMDda1zSYo2TJpqEeIOkxz1i81GMI8l3/lt2ahyEWE+K5/VWdT98VL29LbVA2+Ko90Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5sJ7mvul8ZX+e4tVgNRzplW3p1fhk0NocsATG/DhYo0=;
 b=O92jc1AmCPMdVevGr/SGBKEBP42FSQp6hc+2JDnxiYb/6NSX54Pw/UhzhxWbTbIaZiRRsCQu5kc8Imym6B3AgFaQKrtZGS1SnH3NZwFzRsDj2lK1Hr4gpnFQkgg6nhynVcJHAz7hhMlyDjW8vdmh+s9wjEmVpNjADwV40sCeiaBVD5Onzx9e7uqh4Ux9H0EZFocjx6oAYvKL7ZlqrZ/hun4V4NMTaoUsA/qBWKWDrPZ66CQ0DN0kU/WYgQPi6HezPyrM3xY1he7hslRu64GVsoEiD89QvQU9pv1mY6a+hKzA+Ay3DdpKe2HysMQ8g3skt8i84cMIuMylh9hzHdGWbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5sJ7mvul8ZX+e4tVgNRzplW3p1fhk0NocsATG/DhYo0=;
 b=k6Z0DHWQ6QVLRqI5Bjs9VL77ZpOxcD4PmkEIkk65jd8xON4gPDupXZi7OB0sECHDh9zJd78C66Q/IaBCtieS3J+UmEkEWA2PeyBWP2Eae17DxpecdUCixNC+Xi+j9INl1LVgS5rhPI2c3jO0xpSp70KngZEzZZUTPVnLPLBpJqU=
Received: from CH0PR03CA0091.namprd03.prod.outlook.com (2603:10b6:610:cd::6)
 by CH2PR12MB4327.namprd12.prod.outlook.com (2603:10b6:610:7d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 17 Nov
 2026 07:10:26 +0000
Received: from CH2PEPF00000148.namprd02.prod.outlook.com
 (2603:10b6:610:cd:cafe::a7) by CH0PR03CA0091.outlook.office365.com
 (2603:10b6:610:cd::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.14 via Frontend Transport; Tue,
 17 Nov 2026 07:10:26 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CH2PEPF00000148.mail.protection.outlook.com (10.167.244.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Tue, 17 Nov 2026 07:10:26 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 17 Nov
 2026 01:10:22 -0600
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb08.amd.com (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.57
 via Frontend Transport; Tue, 17 Nov 2026 01:10:18 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, <Richard.Gong@amd.com>, <Poojitha.N@amd.com>,
	<lee@kernel.org>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH v6 00/23] soundwire: amd: SoundWire manager driver bug fixes
Date: Tue, 17 Nov 2026 12:35:35 +0530
Message-ID: <20261117070906.803139-1-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF00000148:EE_|CH2PR12MB4327:EE_
X-MS-Office365-Filtering-Correlation-Id: 598750e8-adb7-4c75-370a-08df4479dab1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|1800799024|82310400026|23010399003|261026121527099003|261022105027099003|11063799006|56012099006|261021123027099003|261009223027099003|261021121427099003|10067099003|261102123227099003|261022113327099003|261026140227099003|261022075727099003|261028144727099003|18002099003|6133799003|13003099007;
X-Microsoft-Antispam-Message-Info:
	m+FX6aplBGH/+sCz6JqZiBxmPT0pTzBZ13EHli2KmIrvqtppQnkyhIvUs/n76L3hQOt91qCjoL54iNs5qdACU0PsGlovN/IOz8BWns6Wwd7MFmv9EiJ5i35fznBc1U27XAvvBPQZbAvSR7Zs8O8gq4c97RvKevbvSzjjpgvwjQkXxwxFYK0RJpYYApKQUsyrlNYm+kSZPASNmA8pwNq+BQmDg+/I30VlO1Gdqvw7beuxQx4+C6zdG5i7yt5AKvxRpqWe6oAgCbQHUuVEWkvvY0widBs6LvQZeqqHHvq+8shKr+7W8FomMgRlz2Ny6jK4p/M26zygHVclV71D6VibgFoGC/IYrIv4weU3gqF1FslTSqYLMKyNTxQtVV+UpM5+KBslA9I3mKeNEIsFtoE6rgOxklp2pz0uTHEipmLo3g1xY2UtSyucr/XNHq0oWOOGk7/u4dllF+02IzO8fZWlwsHse7cLD9gPtX+e6oPBLYwomC4tSG7mif0kC/qSsma+7uFVYc1HxUCRkCSxzx13cew+Jicpf5/m246qcsrOOU2dSUXUf/+xIt+JfIYu5436/07gPDoXcQ8tZ+U2ctVEhZfMhudSCJ9mUs6EVUnQ+UU2hAADEestKuf71A1h8oXwr3wDZPc1Aevo6kzfrlHdyg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(1800799024)(82310400026)(23010399003)(261026121527099003)(261022105027099003)(11063799006)(56012099006)(261021123027099003)(261009223027099003)(261021121427099003)(10067099003)(261102123227099003)(261022113327099003)(261026140227099003)(261022075727099003)(261028144727099003)(18002099003)(6133799003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	p3wMl85YhAcSc4ZJfB0zRHzeL6fYXY/3i6GNKuvw8NlWfNaO8rgSK9VP3Q9zdb1xjxBgm2J6635OKWdH6tWjJPGajAr6FCvS1I6dSwAjjypeTRxzkNj9TuJiV0m2QE6OgZIZj1LX77ySKHDDCgz/JQbcXZo68UXvWDkR2gKPtSuiJbsx+lOFYmouGmCfsX2SUe4iVEiEY91QBfDRE1/B8E8DaYJ2Ib+KeXKkGuh1iolqSxQXwNEdbR/1qoh0gusIOX7GlZoPxWWbpCJyNQKDhV/sAMdpnyUeC9LSTMNd7g06xWmtpKZTgcPrIeNrUmCA1flBECrXeCtYfuCHjJW5iK+Y4muw7MMg0l82EC2ojFCQ+Cwb1KtJ0G/3up/fbdG4Qcmb9YH0KqMe7Hy5VZZvPRAZEh8JlwMbIzLw+a8mUc4QL88h243VkYgNMHKBmVQ9
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 07:10:26.0137
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 598750e8-adb7-4c75-370a-08df4479dab1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00000148.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4327

This series collects bug fixes for the AMD SoundWire manager driver
(ACP6.3/7.0/7.1/7.2). The patches address correctness issues across
five areas. Patches 9, 12, 13, 15, 20, and 21 fix issues reported by
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

Command response handling (patches 9-11): fix silent widening of
-ETIMEDOUT to u64 (reported by Lee Jones), cache the last successful
PING result to avoid spurious disconnect warnings on transient timeouts,
and add lockdep_assert_held() to enforce the msg_lock contract.

Work-queue and driver lifecycle (patches 12-16): fix drain ordering in
the remove path and defer dev_set_drvdata() until after INIT_WORK() to
close a concurrent-remove window (both reported by Lee Jones), guard
pm_runtime_disable() against unpaired calls, guard IRQ work execution
with the interrupt_enabled flag using WRITE_ONCE/READ_ONCE to annotate
the cross-context access (reported by Lee Jones), and delay *sdw_ctx
publication until after sdw_amd_startup() succeeds. The corresponding
NULL-check fixes for the IRQ handler window opened by patch 16 have
been posted as ASoC companion patches and are already merged:
  34ea81a7f284 ("ASoC: SOF: amd: guard adata->sdw dereferences with
                 NULL check in IRQ handler")
  41e06aaef9c0 ("ASoC: amd: ps: guard adata->sdw dereferences with
                 NULL check in IRQ handler")

Power management (patches 17-20): propagate amd_init_sdw_manager()
errors on POWER_OFF resume, drop amd_deinit_sdw_manager() in POWER_OFF
suspend, replace the open-coded >= ACP70 comparison with an explicit
switch/case, and fix interrupt-gate and work-drain ordering in PM ops
(reported by Lee Jones).

Drvdata and register safety (patches 21-23): add a NULL drvdata guard
in sdw_amd_startup() (reported by Lee Jones), and fix shared-register
read-modify-write races in amd_sdw_set_device_state() and
amd_sdw_host_wake_enable() by holding acp_sdw_lock.

Changes since v5:
- Drop patch 10 (return response on IMM status cleanup timeout) and
  patch 11 (clarify bad-state guard poll omission in IMM_RES_VALID
  path): dropped after review feedback.
- Patch 2: rename disable_oe to needs_schmen_oe for clarity; update
  Fixes tags to cite ACP 7.x introduction commits instead of the
  ACP 6.3-only refactor commit:
  commit 2c0ae8ef1e5e ("soundwire: amd: add support for ACP7.0 & ACP7.1 platforms")
  commit 34b1cb4ec286 ("soundwire: amd: Add support for acp7.2 platform")
- Patch 4: use "POWER_OFF_MODE runtime suspend" instead of
  "wake-armed runtime suspend" for precision.
- Patch 5: add commit description explaining why the early return
  before wake-arming is correct when amd_deinit_sdw_manager() fails;
  update Fixes tag to commit dcc48a73eae7 ("soundwire: amd: change the
  soundwire wake enable/disable sequence").
- Patch 8: update Fixes tag to correct commit SHA.
- Patch 9: drop dev_err_ratelimited() calls for ping status timeout;
  the error is already tracked via the cache introduced in patch 10.
- Patch 14: update Fixes tag to commit ed5e8741b8db ("soundwire: amd:
  refactor amd soundwire manager device node creation"), which introduced
  the partial-init startup sequence that makes the unconditional
  pm_runtime_disable() incorrect.
- Patch 15: add WRITE_ONCE() for all stores to interrupt_enabled and
  READ_ONCE() for the load in amd_sdw_irq_thread(); restore
  interrupt_enabled in the ACP6.3-specific wake-re-enable block in
  amd_suspend_runtime() POWER_OFF_MODE; guard IRQ work execution
  instead of scheduling.
- Patch 16: simplify to single-problem description (ctx leak on
  startup failure); remove the concurrent IRQ handler race rationale.
  Two ASoC companion patches addressing the IRQ handler NULL dereference
  window (adata->sdw dereferenced without NULL check between
  amd_enable_sdw_interrupts() and *sdw_ctx assignment) have been posted
  and merged in Mark Brown's ASoC tree:
    34ea81a7f284 ("ASoC: SOF: amd: guard adata->sdw dereferences with
                   NULL check in IRQ handler")
    41e06aaef9c0 ("ASoC: amd: ps: guard adata->sdw dereferences with
                   NULL check in IRQ handler")
- Patch 19: add WRITE_ONCE(interrupt_enabled, true) in the ACP6.3
  wake-re-enable block in amd_suspend_runtime() POWER_OFF_MODE.
- Patch 20: expand description to explain the redundant
  amd_sdw_wake_enable(false) calls and clarify CLK_STOP_MODE
  interrupt handling through D3.
- Link to v5:
https://lore.kernel.org/linux-sound/20261107154659.3358223-1-Vijendar.Mukunda@amd.com/

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
- Link to v4:
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

Vijendar Mukunda (23):
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

 drivers/soundwire/amd_init.c      |  75 +++++--
 drivers/soundwire/amd_init.h      |  18 ++
 drivers/soundwire/amd_manager.c   | 351 ++++++++++++++++++++++++------
 drivers/soundwire/amd_manager.h   |  10 -
 include/linux/soundwire/sdw_amd.h |  15 ++
 5 files changed, 365 insertions(+), 104 deletions(-)

-- 
2.53.0

