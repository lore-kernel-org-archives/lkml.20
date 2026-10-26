Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.193.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792989973;
	b=CL8dI4HzWJ+/BCxbdDJ4Q/4lnPFaxgRDAVQuou1tyaLcSX8JXfV302Ts3JhyJupeUemR
	 d4g1yUw79rulzs6EA3nIt+lrbCdKpaaHKD37k5JktqZTDZcdA0CB0/DpeZVzq4rsxDqLc
	 WkfjqJMGaaExpcq2V+66TNtNiJ0QHVZ4C8ZuIuDns0vaY+GYXRasPzj59OXl1SbMEcge8
	 dNXmMc1W19seXNbjeBJFHVRnRake/dGO5sr0zKMFJJC14gQlXZsvY/59Tibwp54YyooOH
	 IabNGtTe8H1Mc8CST2RF64mEUL7v9UowTQDHGKIJbnogSsKCfm4MmZS8LmLZ1SrIXKg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792989973;
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
	bh=05g9z5V7H7ypMTIyHgLlzORgLcwD7giW8iZXLRnvaiY=;
	b=TSLM9WplXOh70KRBMgxdN07QyUK5qrnjWdGqCz/ghyElqo9NZTDnsjQYo6UlsFR9+p6v
	 V+rsf5rL4QG0GleuaN2bam1rMnWRj4UIJUbtbU1/JAFNQXb6JwhIHU88Z+A+0GyilkcDv
	 2ppeRWdBx9vkfpm//ejL7EtwFzhqz9xwAQNhVmxenKRh5wxj7qFOk2VLI6kmynedOmqIP
	 xOxxTQUegjXn+37o0F1NU1MIJf82ZjGmgryADVkNd9VkXDKMKOlR4LwIK7z7CT/WRbhZk
	 atpzsIS+UBNJtTq3liGW7I0XXKOmOzap0ghNErTGXVUm5KqSvoICNZBMGwG8e1vS4MQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=lca3r2P4;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.193.48
Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010048.outbound.protection.outlook.com [52.101.193.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75A17606A31D;
	Mon, 26 Oct 2026 04:46:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75A17606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=lca3r2P4
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wnpjC6P+U57/hrJ2hR32CNCXJhOHdffb7inBJqjV2KV6Ml3mLAe0omR5JOcUs5gYSUACK8m2Q7wTsjQx7kK0rzhr7NThA45n0SeAFGqXR5xprRLAk0egYhms8xE6t5M5iEFHCsnNyRNOM1YyLoF3iHzQrPNRx0Ziekie/H+Qt4a/l0n5zaqCANzTj1lbfFLKyas/rlYarIDOucd2kUN/c1h6AIstpkMre2Zs7N2jaw7wIV4pycEUeheUAx6Bkx3nqbvhBa5N8ehE62eJtmFlX1L6NFYUqWy4yCCiM2pjDsvWU3R+XRjJWX4vGzmKKQ/o0hH56MZ32AwBKil9tVc7Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=05g9z5V7H7ypMTIyHgLlzORgLcwD7giW8iZXLRnvaiY=;
 b=yDROgPSrvMtb00vvjqxzbVYwtJWmm8XOemSCXoQQ9lT1q4L/C55oFzq2q9/EhBiO3BeniXFelLC6eCdpmEPmnTzz4Zspci9JzY/xOR5qXrvyLrZM7MRC+jmwnoy+XjPeez8/nDMs4pBmWWwYmQ27S1d1mNzLjC71dg9PiQ8kbg1EUzqnFRDs7cvik3xkHyj1ulincGDmnGlPpziZ82xa8iMgXldzrWrHHzNNK8KjwpzOlgZAsqiJKO/oncWsLM/IpB7GpzOX3Fez/kPljkIgWkRErZzS1027GkhxGv5eTPfc6HV46AhCrqft56eAXPxaIc3vuMXXfPOVf6imzbo8Fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=05g9z5V7H7ypMTIyHgLlzORgLcwD7giW8iZXLRnvaiY=;
 b=lca3r2P4cvFtOyDLVuGshRtbHn0632OQTApbXctv22xtBHJFysxCqQTGrG1ELmlvzud3NQxTAgZUlw5T6OWfaCAKye80buh50remXopKntIwIodH8Bica0+pMqiuNIgB+pKIK88GK2ArYpOQgzCeW95bryzMhIAzKmcLsTzNf1s=
Received: from BN9PR03CA0097.namprd03.prod.outlook.com (2603:10b6:408:fd::12)
 by PH8PR12MB999273.namprd12.prod.outlook.com (2603:10b6:510:425::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Mon, 26 Oct
 2026 04:46:07 +0000
Received: from LV8PEPF0000005A.namprd02.prod.outlook.com
 (2603:10b6:408:fd:cafe::67) by BN9PR03CA0097.outlook.office365.com
 (2603:10b6:408:fd::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Mon, 26
 Oct 2026 04:46:06 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 LV8PEPF0000005A.mail.protection.outlook.com (10.167.245.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Mon, 26 Oct 2026 04:46:06 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Sun, 25 Oct
 2026 23:46:06 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Sun, 25 Oct
 2026 23:46:06 -0500
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb08.amd.com (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53
 via Frontend Transport; Sun, 25 Oct 2026 23:46:02 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <broonie@kernel.org>, <alsa-devel@alsa-project.org>,
	<yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, <Richard.Gong@amd.com>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>
Subject: [PATCH v4 00/13] soundwire: amd: SoundWire manager driver bug fixes
Date: Mon, 26 Oct 2026 10:13:31 +0530
Message-ID: <20261026044507.2310694-1-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: LV8PEPF0000005A:EE_|PH8PR12MB999273:EE_
X-MS-Office365-Filtering-Correlation-Id: b6cc8079-d142-4cff-e290-08df331c0c50
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700016|23010399003|82310400026|261021121427099003|11063799006|56012099006|261009223027099003|261022075727099003|261022105027099003|261021123027099003|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	g/dFRgGoCSsIdjX9KsD1KWVaD8Pil+JNhZIwsznWZqdZvER5I5qnipb12r8ltIWLl4xIUcNLCKMBC8bCxeo+k3/HcXxhD+ncaYhOXwOnS+lzubRhqnvHU6MxrbSqq40uq/5k1VpGTTg5VTvYAruWD0LkigNFf7poHWHh1/jBxSDY4FenL5ytTiDuUSytFRve4/e6tGDPf39yeyBpnns0X7R4CA0BbvsFjgBBvBXBK6gW4IjlrDhq46S7BtSI4yFMyzsStnHJdDdmMwWdZ0o86O8i0r2Dp2mx1Z6p3+VNCC43avftvvhSQFdWn2Xzrjji+6Tp84ShblKAIHuCf0vHAPXCfKKQ8mH/F7XzobQ0CIiDJP2Cu+OJuxB/k6sJ7RWJFugZT5PDq2ZQ+SGJlOAE4F9AkbIwBlzNVIJ77s8sNuFngCXA5lRcBFVmZt7qWR0HMkrj5uUqZ7fRVvL3mb5wxr0EOrs+iWoobpSP0t87N9XzW9DcugPa8FfgbIisLl4HSDd4pz50uHACdeTcMsICQepkswc/TIR4MzcRmv21Je8dtDeQhFgztHDSMqBZlUsL48ehiGYU927XZolo9M88BuNYpRpHPNQuWUVqcrsDTqm91iO036bFNa1Sg2kuL+0ORYxfR+iuPitMogp9OWxPak7M0vkD9oEWWzf6ZHXdeSwA8TBSLaKrjQvbBCwTKsXHkYUZw3CU7NA8a2zMgRwdkg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700016)(23010399003)(82310400026)(261021121427099003)(11063799006)(56012099006)(261009223027099003)(261022075727099003)(261022105027099003)(261021123027099003)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Y83lMnr+oHOb4iB9eZWXTPtOnNC83amf1QQqZdjOkltUqg+vI4+50sKMi95S0NBBEG9vhJBnRAwe/eN9Y1x9yCiUciz/gNvTQIeuPPLsEaCJZwYQZbZk50QKR9nP2zaPBgVtU56buqh31kwy3koiy66x893GXWZGE+18bFLnq9G2xj/JC4+kXqpg2e08JIggJLf6DSz1/x6tmVvgRyf8mBw27dhVVL3TGx5N66S186mU0sLwnkZry3R7x8fKCKuI9jJEpR1Wn+EI423geuHzA1LEV0VAq+ZxYStnYFseqSNDK36qzj298HVO7KBEd3q3ukfkGir3NIwEfxzu0zdc82gWc4Tdv/AYM5g/qQ0r41y4o9wItTnR2ZsCBW836MrVVZcaOOuTkkoeO9K2R+ER4flYdfkzwyxMGtavC21Rer8Qz9B5CY26GxJMou1otJHA
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2026 04:46:06.8204
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b6cc8079-d142-4cff-e290-08df331c0c50
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	LV8PEPF0000005A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB999273

This series collects bug fixes for the AMD SoundWire manager driver
(ACP6.3/7.0/7.1/7.2). The patches address correctness issues across
three areas:

Command response handling: fix silent widening of -ETIMEDOUT to u64,
return valid hardware response when only the IMM status cleanup poll
times out, and cache the last successful PING result to avoid spurious
disconnect warnings on transient timeouts.

Work-queue and interrupt teardown: fix drain ordering in the remove
path and all PM suspend paths so the interrupt gate is closed before
work queues are drained, preventing re-queuing races against
clock-stop and power-off sequences.

Power management and locking: propagate amd_init_sdw_manager() errors
on POWER_OFF resume, guard pm_runtime_disable() against unpaired
calls, fix the IRQ thread dropping STATUS_0TO7 on simultaneous
wake+state-change events, and fix a double-clear race on
STATUS_8TO11 in the wake handler.

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

Vijendar Mukunda (13):
  soundwire: amd: fix SDW command timeout return value handling
  soundwire: amd: return response on IMM status cleanup timeout
  soundwire: amd: cache ping slave status to avoid spurious disconnect
    on timeout
  soundwire: amd: assert msg_lock is held in amd_sdw_read_ping_status()
  soundwire: amd: fix work drain ordering in remove path
  soundwire: amd: pm_runtime guard in remove path
  soundwire: amd: fix ctx leak when sdw_amd_startup() fails
  soundwire: amd: propagate amd_init_sdw_manager() error on resume
  soundwire: amd: drop amd_deinit_sdw_manager() in POWER_OFF suspend
  soundwire: amd: replace >= ACP70 with explicit switch/case in PM paths
  soundwire: amd: fix interrupt gate and work drain ordering in PM ops
  soundwire: amd: fix IRQ thread dropping STATUS_0TO7 on simultaneous
    wake
  soundwire: amd: fix STATUS_8TO11 double-clear race in wake handler

 drivers/soundwire/amd_init.c      |   9 +-
 drivers/soundwire/amd_manager.c   | 217 ++++++++++++++++++++----------
 include/linux/soundwire/sdw_amd.h |   4 +
 3 files changed, 155 insertions(+), 75 deletions(-)

-- 
2.53.0

