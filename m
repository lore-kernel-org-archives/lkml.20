Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012007.outbound.protection.outlook.com [40.107.200.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20FD03B42F2;
	Thu, 17 Sep 2026 09:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789635928; cv=fail; b=pzDL4JbkdWFC69k7NX+Tfx2rDn9fvqvxdN/7De2rbkJdNUOGqdVZNOe6jbdhyddezXLlIhlVP7eUWRfab1HRnQ6/H11E3GGB6wM0wsRHeJgXZ8T6bHmNTjp1YLZqEATcnVBTPTzgKGd0l7N/wKm7gW8PhfYM5IrVwFP1H29ifK0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789635928; c=relaxed/simple;
	bh=tP9Jv0PfklXV1yxSRhS2lHjEdQq8EEVZZcUF7Z9TV6Y=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=XPVlMc+p4n/b54dJ6Qrn8ULsUAo//YctQ5j7iKUKg/o99yt468M4UTm3dgE55wk03fd+3YKn9NgOXrpckRYKLzIwKdqjcH7+YeTHx4Ym7jsisUSRMmALUVK3arkwiaag6oHCiBP006hFzEnt/reXUp+FQbifUiveEpTQKv+xlG0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=lfLsA2na; arc=fail smtp.client-ip=40.107.200.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="lfLsA2na"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uTV88qGZn0tbAkgKTd7QaRi6mG4qGvsWR7KxQQFi2MnAd+YhJcrN9dsjAdkMLiOkiy3S7zvnNl/2w0jjYMhDeHvc8plRGQJmouS87vAJUqnpnqaLEei4NQ0/gBboSVZ5nnIZPw9BpcKlaEW+OM/gmwlYsodOL3No6Ck9l+FXFg6Myo1D2HvOSHZqb4kYNRf/5KyK06jGjbTYZAUwEimoczvOWumQqDL7x2kZs0QbWY+1lUAB9Uo5MWvSUmwJVVcGCJ+fC7fYJNqTZYxsYuJB2gTozwlVHW3TKMgqg3vNlBV3F2rMk2apn7HmJIKwiQXOklHDOZ6K2PHn1Je96zYQ4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=azjre7g9lyPLhzfunGlwcSw1htMGcW1a35ezf0sfhTA=;
 b=QetPwWp5NkenpXf9G0MbixVw9FDSd7VyN7vZF7AxDTXcw8dstEpbeHpa0lPM8Kyjo/gJ5f/yRbuOPHKGfwAymo1+fomS4RrcVcSqEKpKBHEpyxckJVGj3xbE1GasBDqNcQboKX6sDRhGuys4EtRl6NzA5mGU8F17CDMYDIsqaWNeYdOgfa9Kaej+CDD7sTFTaKXOzRTU+xLhBOVZET9j9PuT3stC7lcYoVrAEsNpPeb4q5+eDWH9o1OVLTIfIVrCIVe0SzAhFzchjwbTKu+T7anaABQGsvQv7+VUcbRF/a+udDy6VOp+r+2HF1CrHniEi0bR9zbqFEfvdzqoDVJ3sA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=azjre7g9lyPLhzfunGlwcSw1htMGcW1a35ezf0sfhTA=;
 b=lfLsA2nawXmIGj9yt5mJBudK8YUH/L7cGoFKgUqkcvQXSZd4yszLO1g+oT60CaKkpCFaRoeCswvVEYOyBP4ih8mTYvFZy7UjEoYd47ci/RyAkb/BtCyo1ruV5kBluMDU06eMuXbzAuQAM8LPl06k8b1nyOHq6Bt7aEQHp1NrJ7s=
Received: from PH8PR21CA0010.namprd21.prod.outlook.com (2603:10b6:510:2ce::10)
 by MW3PR12MB4428.namprd12.prod.outlook.com (2603:10b6:303:57::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Thu, 17 Sep
 2026 09:05:19 +0000
Received: from SJ1PEPF00002315.namprd03.prod.outlook.com
 (2603:10b6:510:2ce:cafe::78) by PH8PR21CA0010.outlook.office365.com
 (2603:10b6:510:2ce::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.8 via Frontend Transport; Thu, 17
 Sep 2026 09:05:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF00002315.mail.protection.outlook.com (10.167.242.169) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Thu, 17 Sep 2026 09:05:19 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Thu, 17 Sep
 2026 04:05:19 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Thu, 17 Sep
 2026 04:05:18 -0500
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb08.amd.com (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.49
 via Frontend Transport; Thu, 17 Sep 2026 04:05:15 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <broonie@kernel.org>, <alsa-devel@alsa-project.org>,
	<yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, <Richard.Gong@amd.com>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>
Subject: [PATCH 0/9] soundwire: amd: introduce hw_ops dispatch and consolidate probe setup
Date: Thu, 17 Sep 2026 14:32:48 +0530
Message-ID: <20260917090407.3828816-1-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002315:EE_|MW3PR12MB4428:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c6cc807-59e7-4cd7-3de1-08df149acc5a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|82310400026|376014|1800799024|56012099006|11063799006|10067099003|18002099003|6133799003|13003099007;
X-Microsoft-Antispam-Message-Info:
	loaKYRgScHG7wrlWRS5Kjyamam26pkKTR87C5WertaNnqUuKVGAYG+l55ZygrahF6R2BD8VXn5cvxw/LVPv2aUzWR1vln88ELdr32SSGv2/jQwRkiheYymIBazgjnRvhm3TsMmyZS9kVkvRuKGRHkaGCaxAUE8BzvO5z3MiNRh3GCUhSLzYA+RiRPR+TeNxxb1tWyVwdlQPNQJFy9NbyCa32yhHKwhcc4jMOwfJopcW6XkgdnN9XZOuvOEL+qIyjff4qTiC37lybf+L6Q9z2gybe0yXxDv6F9dphk3ITTyYUNe7DX6drPqRlqQ7UI4MfGElIIdahcVyTsBctD/nUB8l09bX5AAdHOho52GRbUnC3r8hht+rQAuIk9SWuRUNGVKtZeximkmeHMds9ZVNC5rc3gr5axxw6H4u0vyYBnzWcS+NDZz5OxYsuKVNG9KpFZ/yFwhgOXDndPAm4DQh/peDXZVtvK0MgYQUQA5Dbd8y86CECya7ujUfYr53nrNI5fkpTN6g3Y3mneT4YDzMtiIoWFjVq4FQ5ki4+DsNE7nNDvYbdMNq0xpUS9FQ/4Dyyyx1ffUUfeueE3y4+Pv0pXgtgXq/LkZ2qZi3uy2qGD0kE57ImKja7ymOpT1/d2YzlZqNwaOWRixr6daLprs2hMA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(82310400026)(376014)(1800799024)(56012099006)(11063799006)(10067099003)(18002099003)(6133799003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	BroZ5u9IdXqlp5hVzvxfs5Rxvgil2AlEIUMZ6gB0Ab0udY/1q3MBZE5rsm4jzeQMHlzMFfSOkEawgP57fkW67ljSOhkB8oj4qHgcYO+rhfNML4dpm04ioZtxzztauVA6BmXQTK6WS6nEcaBw6D/8Au+lkUvCrZ4EVyoDuPKu//TBXHLFWi6ZQz7CfKc3v4DlnvpegShzK1xTBoAYG9vnDkW7SJQmnJT8DyRvNuq7f43zKK9rMbO4VNMZNzixho06XRQH7aCd92h8N3/fRpSw0FaZPxe3zjga03KwTG1ysZ6zf+scfdwSU8tJsPAiZXNuNw3aObD+hVAvahbIvi+GYzYju1Pzu0HwlYSgv3hxt+I5f5YB+PIBFIxResm9cYx5sM9Pra5PKm/9y0o78hqhJ1XFuQ1r9O52zInFmyHwy9+7Ap3/fNBGH6d+J+IL0gfc
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2026 09:05:19.5240
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c6cc807-59e7-4cd7-3de1-08df149acc5a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002315.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4428

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

Series overview:

Patches 1-3 are preparatory: rename the manager-count macro to carry
the ACP6.3 scope, convert the pdevinfo/sdw_pdata and pdev arrays in
sdw_amd_probe_controller() from fixed-size stack/inline arrays to
heap allocations sized by the ACP revision, ensuring the probe path
is ready for revisions with a different manager count.

Patch 4 renames the revision-specific hardware-access functions,
static op-table instances, and the manager register-offset constant
to the amd_acp63_* / ACP63_* prefix. Patch 5 removes an unused
define left over from an earlier refactor.

Patches 6-8 introduce and wire up the hw_ops dispatch framework:
patch 6 defines struct amd_sdw_hw_ops and the inline acp_*() dispatch
helpers; patch 7 converts the irq/work handlers to take
struct amd_sdw_manager * so they fit the hw_ops callback signature;
patch 8 extracts the PM callbacks into hw_ops slots, populates a
static const amd_acp63_hw_ops table covering all 19 callbacks, and
converts every remaining direct amd_acp63_*() call site to use the
corresponding acp_*() wrapper.

Patch 9 consolidates the remaining revision-specific probe assignments
(mmio offset, bus ops, port ops, compute_params, port_offset_map) into
a single acp_rev switch, and removes the redundant early
initialisation of cols_index and rows_index since
acp_sdw_clk_init_ctrl() always sets them before set_frameshape() is
called.

Dependencies:

This series applies on top of the AMD SoundWire fix series posted at:
https://lore.kernel.org/alsa-devel/20260917083732.3803526-1-Vijendar.Mukunda@amd.com/T/#t

Vijendar Mukunda (9):
  soundwire: amd: rename AMD_SDW_MAX_MANAGER_COUNT macro
  soundwire: amd: allocate pdevinfo and sdw_pdata by ACP revision in
    probe
  soundwire: amd: allocate sdw_amd_ctx pdev array dynamically
  soundwire: amd: rename hardware backend functions to amd_acp63_*()
    prefix
  soundwire: amd: remove unused AMD_SDW_MAX_FREQ_NUM define
  soundwire: amd: introduce struct amd_sdw_hw_ops dispatch framework
  soundwire: amd: convert irq/work handlers to hw_ops callbacks
  soundwire: amd: wire amd_acp63_*() call sites through acp_*() helpers
  soundwire: amd: consolidate revision-specific probe setup

 drivers/soundwire/amd_init.c      |  49 +++-
 drivers/soundwire/amd_manager.c   | 471 ++++++++++++++++++------------
 drivers/soundwire/amd_manager.h   | 203 ++++++++++++-
 include/linux/soundwire/sdw_amd.h |   9 +-
 4 files changed, 533 insertions(+), 199 deletions(-)

-- 
2.48.1

