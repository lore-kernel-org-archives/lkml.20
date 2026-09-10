Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012063.outbound.protection.outlook.com [40.107.200.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 764545437E7;
	Thu, 10 Sep 2026 19:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789067033; cv=fail; b=EDXCcemTHsWjccXV0QXA0ukUTK9BN2qteLBFPR2gaIiRP61DQDFWpnVSuccBD8+vYD0xqx5VjELDBopxwsuFX8zGWRcEYIVZvg4s04w++xqv69+x8QMadlWj3rjqgMcklBkPYDEp38+9iB7x+cFnbNpt6amKlIQnOrQ1x5b9w0Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789067033; c=relaxed/simple;
	bh=XL2wNW85H7kFl7fX+PrWY4od/s5XLX3+tBk4AmaAxac=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Hp4mVZ0+lfdOu5GS4uz9IJjSOfEzJgPqvKbXbOQF5sMEfj7/tufLYnJSkxgEVOym+epJiYDmnkGgp5vvPrZpWIG+41GpeNFymfT5NDxLQi0hEVGR94qUrmGxT4JriD6GswIA4VaNgV2cxN0ig18WcsmnRSXjXEChzovuZbPXYmg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=p2Qfuoc4; arc=fail smtp.client-ip=40.107.200.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="p2Qfuoc4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g0yjiHAkBOc7IMwlLf8YFYucJHuGu73Z3ugqpv5hKeIPvyOjF7gktW6+fxPqlx0LYo9zrYSy8dT2pCuMFv5jq5+Jzhsj7oiBaL6/JF2h9WMYr2mtq1Llub3dFiY0Zo6mDOnRECDWxNSkv60ndQCI8vYxQHr6mXWYsZ+qfLcW7/ir/Dfl8qayeToMqNT5BruD8C6J8Kkq6a8q5CxriHjnOWpWlmPIaSYCHJo1jMbmI1DmabbgnSb/5IMG1iLoSFmM4MX+l09sPzfNHHmBKrisJvUK68CkOFy2kM9RoVrzoa9AgFF4BBhHI1XDmvnOphhkSeKUU5UComGB0bbEHMfXTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qsp4xl1i6Iz4ZaOO2XGdCE86QZChi28KNlAbFRJw+kU=;
 b=TMaV151jQMdRBIBeKZuIfnVYTSGrEAOLuh2RrNSdoCKF3Xet2vUuL1I2bdN3lBfn7z4z+FLcAJDfLxmocyx5qkpMFzdMhhTzlI4xrVUbucXTduRiMSmbBOmTwgJItNTDUIlHc/ali7OvTETYnYFwWoE5iByABLUODWslpbq3c8yQeOqDOijomibe1l6Rvc2NLaspSvNyJ2ZIQLrczES1J6fdmMRYaUI3CTlT7pcoVbLNrswDy3zc4YQiPwrRcBw91tLd3BQzoOd06AhzGWaYZQ/vRLor/meim82bJrbVCF/ToEq+rTHdduMfczHi6b6atqWh4eljGb11wiiLoDcJ+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qsp4xl1i6Iz4ZaOO2XGdCE86QZChi28KNlAbFRJw+kU=;
 b=p2Qfuoc4p6m39V0C4H8nx8VrYlYv7/yy7Q2qZRDtcMqAecbsRs/TkT6pIFIa7LStLZPjy1CCLItuKGl50byH9zflDieTB/768DWGzrKd9hYMJpDTyyv/HHjjLtr605rimB53eAzrIIUmPAQ3JUjK/+w4w15E2Zc19up+/sMcG3Y=
Received: from SJ0PR13CA0064.namprd13.prod.outlook.com (2603:10b6:a03:2c4::9)
 by CH2PR12MB4149.namprd12.prod.outlook.com (2603:10b6:610:7c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Thu, 10 Sep
 2026 19:03:47 +0000
Received: from CO1PEPF00012E80.namprd03.prod.outlook.com
 (2603:10b6:a03:2c4:cafe::c0) by SJ0PR13CA0064.outlook.office365.com
 (2603:10b6:a03:2c4::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.5 via Frontend Transport; Thu, 10
 Sep 2026 19:03:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CO1PEPF00012E80.mail.protection.outlook.com (10.167.249.55) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Thu, 10 Sep 2026 19:03:46 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 10 Sep
 2026 14:03:46 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 10 Sep
 2026 14:03:45 -0500
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.46
 via Frontend Transport; Thu, 10 Sep 2026 14:03:42 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, <Richard.Gong@amd.com>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>
Subject: [PATCH 0/8] soundwire: amd: SoundWire manager driver bug fixes
Date: Fri, 11 Sep 2026 00:30:48 +0530
Message-ID: <20260910190240.1604447-1-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E80:EE_|CH2PR12MB4149:EE_
X-MS-Office365-Filtering-Correlation-Id: dce22909-4cd0-4dd0-a06c-08df0f6e3dfc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|23010399003|1800799024|82310400026|10067099003|11063799006|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
	O8mQ5lX3amFEkToERoe0OpwoiQLIgyo8jUCZcY62bEoPSJO79BxeZqaHc2S2rWn1BJ28yS+OrS4vfdQ5rXJS8YqjBOdnwtFetdR0523HwhZ60+wRLK6kkpf7XcXcUDmh4HAFLfmZ/YtKcFkTm6o/O9PMlkc/8wvnT4m0wS/r8Ke0T7v/5kLa4vBaTzQMOFtt5Osq9cAza3CiP7kc/uAZEjzq2889hOQPQu86bltCQgxiOrWAfKQw5lyMWk8JdNaeSZ/zpIzONC/hXunreoerXQ+CQmKPeZVq9u3eIKp7j32mZm9nh2auFW7PQbAei7AY97SmPnBFIIkzQZHMQiZcXpK7N+CtG95/tGRJsHAsR+5lV2CwgUwFpkaFR4TNm7m0OTahVMor/3B1vA0ccNVUd/yTk379t8ot0/0z7kX5wm8sKfj69EcADiic6K/9Y3NkmRsUSSL1T0vXRwPOksAhNIhI8a1VVm9Rta51X69/ILmoURCGaLMHbJCyl+oV4bZDK1UeZ5aw1nKiHOr8Hnu4nAYqYVrsNpgZnp9e7q8IR1PXynIG4xIheNgxQs7F9HH+2G+tGi0xvr3507db4CaUa7R6QF+NoULFyzZRtf2Rb8LRtrhMXSTkiidpfKypYs+Pj8bARem3AVZUOz0JBV/Q/SaHmNtTLxQorBJ6BjieMSJHUy8g3wNtJJeU8viE4TO8QgwS62VICzK0woeRsI2E2A==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(23010399003)(1800799024)(82310400026)(10067099003)(11063799006)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	7qVEmCFJQ+TP8i1AT4lCOL42OfO91AaPKftQS1pXWcWr5Qfr+Mev6iRNNg1FAU90dwXXsojAMkVwHyHs7iR+JYYoRRXTDk6B2/kM9GmB9nnEDrL3wZFkDngOLasbJjCwwgJ3TREMH/jB3t9F5u59KSpTcyF0MF1pj9TRw7Aj2Lek899HqgiZCM+xpFldzkZSV3J4ABxLj6zfIIKuEbhNAaZGumgwqNGPMX1jjM2hWBjp9Tk+FiqI9qTD/edJHOXzPBPzwMM8qo5m+1SMGnmhp4sX2Txr3ECMYIj70pIjtsgV3syG15ll5NdhoqAvIqvy772E5X3vW7unzB3686prfFLb2XyoEAuVImPrGokXKSncH9olD75d9J8A4EwzQs1r78LO1hUxICs0LWt8RrOMY1sSQNEYb+K+Bp4khzoDvqualdRjm7+6Ric7P4FJSV3l
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 19:03:46.9586
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dce22909-4cd0-4dd0-a06c-08df0f6e3dfc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF00012E80.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4149

This series collects eight bug fixes for the AMD SoundWire manager
driver (ACP6.3/7.0/7.1/7.2). The patches address correctness issues
in command response handling, slave status caching, work-queue teardown
ordering, resource cleanup on probe failure, and power-management
suspend/resume sequences.

Patch 1 fixes a silent type widening in amd_sdw_send_cmd_get_resp()
where -ETIMEDOUT was returned through a u64, producing a large positive
value instead of an error.

Patch 2 caches the last successful ping slave status so that a command
timeout during sdw_show_ping_status() does not report a spurious
"no peripherals attached" warning.

Patch 3 fixes the work-drain sequence in amd_sdw_manager_remove(): the
interrupt delivery gate must be closed before cancel_work_sync() to
prevent an in-flight IRQ handler from re-queuing work after the cancel
returns. A pm_runtime_disable() imbalance on partially-started managers
is also corrected.

Patch 4 adds the missing sdw_amd_exit() call and ctx pointer clear on
the sdw_amd_startup() failure path in sdw_amd_probe().

Patch 5 propagates the amd_init_sdw_manager() return value in
amd_resume_runtime() instead of ignoring it.

Patch 6 removes the amd_deinit_sdw_manager() helper and expands its
two call sites in the POWER_OFF suspend path to direct calls, making
the sequence explicit with no functional change.

Patch 7 replaces open-ended acp_rev >= ACP70_PCI_REV_ID comparisons
in the PM callbacks with explicit per-revision handling covering
ACP63, ACP70, ACP71 and ACP72, with a dev_err + -EINVAL default. The
repeated host-wake-by-revision block is factored into a helper,
amd_sdw_host_wake_enable_by_rev().

Patch 8 fixes the interrupt gate and work drain ordering in all four
suspend mode/path combinations: the ACP_EXTERNAL_INTR_CNTL gate must
be closed before cancel_work_sync() calls to prevent a racing ISR from
re-queuing work after the drain completes.

Vijendar Mukunda (8):
  soundwire: amd: fix SDW command timeout return value handling
  soundwire: amd: cache ping slave status to avoid spurious disconnect
    on timeout
  soundwire: amd: fix work drain ordering and pm_runtime guard in remove
    path
  soundwire: amd: fix ctx leak when sdw_amd_startup() fails
  soundwire: amd: propagate amd_init_sdw_manager() error on resume
  soundwire: amd: drop amd_deinit_sdw_manager() in POWER_OFF suspend
  soundwire: amd: replace >= ACP70 with explicit switch/case in PM paths
  soundwire: amd: fix interrupt gate and work drain ordering in PM ops

 drivers/soundwire/amd_init.c      |   9 +-
 drivers/soundwire/amd_manager.c   | 204 ++++++++++++++++++++----------
 include/linux/soundwire/sdw_amd.h |   3 +
 3 files changed, 148 insertions(+), 68 deletions(-)

-- 
2.48.1

