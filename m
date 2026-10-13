Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013070.outbound.protection.outlook.com [40.93.196.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11C4739EB59;
	Tue, 13 Oct 2026 08:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791881589; cv=fail; b=h1rz9g1dp7FfWxElP/rgnKgFzfl6qn+VfEVCw5kBqcx4lB6R7R87qGuDxkDOH04xvtVFexdja3wRYk3zySPepyrtSiLmGsgRrbIGYUEoifJBH646+0QRDVrpuV/pYRUzCTFqLcpamLnQitB4xdxpFfvRzMJh0yefqD50Jv+qCDE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791881589; c=relaxed/simple;
	bh=ZQlP9em70BAvUJm4UXPlNJ9j8gIhNWmG5YiAz14deMo=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=K+ICsTWaiAoCj5lbfyNN+BnBRb2YwnQiMBK2gc8B0TtbC4L9ENB3fXkrudlvnHLohdLv1iYzrFshjOMO+lqGZKXQbxYK35v1WQ4bATYr4ApSh+jZjI6a7QimPQHC0dHLPfjIE4YPJ0tX81JZPrptRHBc36Ygk6G54TRTtEHUs50=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Qg2HPA4f; arc=fail smtp.client-ip=40.93.196.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Qg2HPA4f"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oXFo9M0FB4fNCv5IzEPw5YzcS/yYR2S7XqjhmFKmaTxOKVZsB2Kwmrk7LqleV7H4EuPUfdUc3F56ZMrJQ8ZWFzsayFIDDCIXHD48ctf0pqsLAX+i0JPIhjCw7O6TdTsNmZNyPdX3PEA5LQIMqAXakZCaWDS494mQp4fIBkf217C/H3dPkdEeBlwjI0yM0RpwuPvQmbkJxS38Vly0ijqnoxizDpgs8zxZrqU21lb8EMZ1L9DzT5TCvJGtTDi7FlKaGNEA4sB0y1EscGiq+IjhhQ3qqf2Jvhzhu/0sS9QXfjOsi8kr7EZGbrpunztlBAZLYJnmYpsctkK5uHPGNXu6WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WLW+nHLpbGJ8rTJ78Dz27zwIXURWI77D/18g/jA21Ws=;
 b=NzjpzRc8r999c0QYGMuKNkYk9obes0PAnKRFnoKgKfgyGgtvaqlq+7cXzMVdNHOIkQX28Al87UIrxiwb/lKPdLmZCo4B4xpDj8Ll67VoMo3vgupaIfKVEOqCPJPW4FmRs8UfvNS6RgV+t48wlZySoyEJZZRI/kSambuMyukibeSnqzP6HNMmmD0QY4Ly1jpTSBnq+hguDP4kFKGnVOuhq8rvZIW0zCYpPehKn8xY/pvkt9FHFgQ4AZqKtviBU1mFz9wcqL2hJxKcia/xAgt2B7EVEgau5VdIXV/dTQifai3WkD/a/MJM9dv/5NnuAm/CNXZNYzWOleNSvk7cZVLoBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WLW+nHLpbGJ8rTJ78Dz27zwIXURWI77D/18g/jA21Ws=;
 b=Qg2HPA4f+1cG80HmGFe9OMaBrEA0DRuc6CDgLh9eja3fjQkvJ93bPqYY1wSopdm8BtQUgllSwh+D7i4ZKNuVouIvo+TzJ7xH2WCKDB33i1+sPr0/IThdl+mxUgsV4+2OhypBjjLAFyyiL8x6MVxeGgwE//tbzevNg32CPh01fK8=
Received: from PH5P222CA0005.NAMP222.PROD.OUTLOOK.COM (2603:10b6:510:34b::16)
 by DS2PR12MB9589.namprd12.prod.outlook.com (2603:10b6:8:279::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Tue, 13 Oct
 2026 08:52:11 +0000
Received: from SJ5PEPF000001CA.namprd05.prod.outlook.com
 (2603:10b6:510:34b:cafe::a5) by PH5P222CA0005.outlook.office365.com
 (2603:10b6:510:34b::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.4 via Frontend Transport; Tue, 13
 Oct 2026 08:52:10 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ5PEPF000001CA.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Tue, 13 Oct 2026 08:52:10 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Tue, 13 Oct
 2026 03:52:03 -0500
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb08.amd.com (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53
 via Frontend Transport; Tue, 13 Oct 2026 03:52:00 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <broonie@kernel.org>, <alsa-devel@alsa-project.org>,
	<yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, <Richard.Gong@amd.com>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>
Subject: [PATCH V3 00/10] soundwire: amd: SoundWire manager driver bug fixes
Date: Tue, 13 Oct 2026 14:19:21 +0530
Message-ID: <20261013085111.2009061-1-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CA:EE_|DS2PR12MB9589:EE_
X-MS-Office365-Filtering-Correlation-Id: 8369dc03-30d8-4bf8-f6e3-08df290744d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|1800799024|376014|82310400026|10067099003|261009223027099003|11063799006|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	nTaoPopcNwhFamH6TJ3EvbmN9/cWqVTQYJP7Vsjle8Ogj+0sfrxHXako8KpK5Z6qd9j+JMlBvS6LJYSZVFr6yzVJq4cCp7c74LHYts1K3kwnENS3Mp0NtuY5WvAC+vI8ngTS0oRUcMfZ9J4Bm5bIZ+CPNNQ7kuMCbS1ByuHgujUgdsQIm50m9RP7A+3RKOe6h1bsB4OzJodOiiuJUkVkR6wA/OToeTERwUB+24YAKTAdZl5yiItc93PTYh2WySZOeOFV6MhAr/0xOc1e1g73GKEmkmhSJxrEk4u0luZhN/LQeb62iYJIQPrhtnxXK5A7r98rgab+g06Vtw4Gh3Myg02juwi8Juev9VbrfadxI2Ox1Dhj5M5Vj7XTzBP9k/ZImMQcqTsQGEdkkGSL3hEgZe2E8lYdXbhsJMmFDbDhSRBD7xIQFNOdR7mit4pXL/MnyoWh/xydRg2/sP/iO0hljOPhMTPIAB23YLBw27BofgD2sAHoxasJq3r6zN/Awela4RnNmZqtzoqF+V2+3vTPKBuL1EOK6cXvCtWQW/CWXgRAectrV53tEgKyTG8VNkRg5PHVQSufvuh++WJJvp1YSWQjbwPIMJx2V4GVlSOSykUX68fDLHSRYE33ZASF8BvfWQz3mPAswMsmb129i640AFrOzS7Ycjqcvdhv+3K1VnlHawUfbPmKZS2SNVgSqXUuSxUIfa2bsXjMUgy8qugo6Q==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(1800799024)(376014)(82310400026)(10067099003)(261009223027099003)(11063799006)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	egSz/VnqsFd6+Nf6M3t4QCRbN/OaYUxEHEG46ti8WwkUog9OO8Z4foNAFoj6sMSh6uiitVgLhurWRiz+KC2LuNdSYLG7Nf0uGEz9Hi86NchS8ZyziKxFXRTbm/qDsBacXmSCxTMlCz86wHhlFbEtKKEHG7xX8T/ZJdlOgJAF88K6pG+uTI+pV1vOlRvijL1E4SyCx+oufCo5vQabTaNlA31yKB8X8i01pOZVtP1VHhHRkuw4WBNmfFezr5u2YZs/CdHQR4Ha8NHTexZ8tSLXdNGkb/WUy0v6ZE0xk1TUgF6kXMf2BqRAdBcyYUyK2Slzy/PC8f9y3XP1k6xtk2RtKWSxRNPUer3XmaD71L8ghIdfN5IiQUIrJH5+9SRwpR4qEZzLZS1g+5ej03OHFvqbUji/FBsDiuHEpJns/DgnOQYz2uF7NAU4ZUPX7sVN2vyh
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2026 08:52:10.5125
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8369dc03-30d8-4bf8-f6e3-08df290744d3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001CA.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB9589

This series collects bug fixes for the AMD SoundWire manager
driver (ACP6.3/7.0/7.1/7.2). The patches address correctness issues
in command response handling, slave status caching, work-queue teardown
ordering, resource cleanup on probe failure, power-management
suspend/resume sequences, and IRQ thread status handling.

Changes since v2:
- Add patch 10/10 to fix the IRQ thread dropping STATUS_0TO7 when a
  device-state change and a wake event arrive simultaneously, which
  caused slave ATTACHED events to be lost during concurrent manager
  wake/re-attach.

Changes since v1:
- Update comment for ping_slave_stat variable description in patch 2/9.
- split the remove path work drain and pm ops guard patch into separate
  patches (patches 3/9 and 4/9) to improve clarity and maintainability.

Vijendar Mukunda (10):
  soundwire: amd: fix SDW command timeout return value handling
  soundwire: amd: cache ping slave status to avoid spurious disconnect
    on timeout
  soundwire: amd: fix work drain ordering in remove path
  soundwire: amd: pm_runtime guard in remove path
  soundwire: amd: fix ctx leak when sdw_amd_startup() fails
  soundwire: amd: propagate amd_init_sdw_manager() error on resume
  soundwire: amd: drop amd_deinit_sdw_manager() in POWER_OFF suspend
  soundwire: amd: replace >= ACP70 with explicit switch/case in PM paths
  soundwire: amd: fix interrupt gate and work drain ordering in PM ops
  soundwire: amd: fix IRQ thread dropping STATUS_0TO7 on simultaneous
    wake

 drivers/soundwire/amd_init.c      |   9 +-
 drivers/soundwire/amd_manager.c   | 212 ++++++++++++++++++++----------
 include/linux/soundwire/sdw_amd.h |   4 +
 3 files changed, 154 insertions(+), 71 deletions(-)

-- 
2.48.1

