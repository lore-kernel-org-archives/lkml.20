Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.196.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792649323;
	b=ns7HRqQU42VDbvwX0v5PFSVkJ1tbqyIxl3YTl7ivqSuuwhLhItCIxiWaoP9RGwRmktE2
	 gMIz8nGQtYEK6/L71I0XnxVIOVqsOn+dHaSBfXwv//dWZbKn1NYwcLAP4CSWmYbcJo0qO
	 yz3ewl21rEURrcZa9jjlGcK27n4W7vbcM32/9ul5Hsix5h4MdlGgENeU9/BzV0Tw0xsIV
	 fA1KmlFvY9czrBRtx7fuSvYcYcz+QR1p2+EqyVEppzm8UsUW8y+P8oTfokFTk2ulIk+Gv
	 IbXrwkjb/wKOAbr5RS9x8rcsIVFp5NMUMF4BRlTn6Bx4B34t18dPJjTJNVV4R8GdUOg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792649323;
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
	bh=6+zDnlcInp+Uaoa5fIbXP7Ii6sDp7J66Lr/YYGnGCv0=;
	b=dPv3VYW8gwchAxzlDEsd9SuUIze/3PHDOfeMsYtsG1+LUEKzgJmdBfjUd9dHi27zn/Hm
	 gWhVMihGkNvP791LQOvaJSYTwQnF9rIz521ltJlC4GQIGjUyN0YKm3K2DOkEtDJjJMCNF
	 /8q8C+eS1McaoQnYz4n/5TuykQPla05pkOlOrGsvR4ljxWcCYJ1XNH8d7U7s85x8ed8xE
	 Q4zIRHyUAm1dyWkN/F5EGrpWuFWGqllKSvfxSXaPfm33X1/9YIM5JuLXuXb389K6VP5cN
	 8ZLTTIyv2PPQQYMZ46WWh3jMpr5g1mPjegZT/SkkwmACjr9c4uusUcvMjGGuDsl+yhQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=bzQyyLAO;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.196.45
Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013045.outbound.protection.outlook.com [40.93.196.45])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79618606A319;
	Thu, 22 Oct 2026 06:08:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79618606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=bzQyyLAO
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L4/UCaaRY6kiQlLb0o6Z5gQ++Ip4ZzLdDVhoIdUZdhBhWk/2Kwbgdjwob5Oiq5E4bDmw1RjmNkXiiZ10wqyxyY+dtqrBppQ85sTXjopXQJvf7Zh7VARi+d1zKExYICLigCS5OteVLdhsfLVMBuejSZyN1I9zUho0RzH986PvnFENIeJ1IxJ3eujLJ91G8aBK0xzexgw6Gjyc6Op328kg0pxeMYXS+uRjI9+4FCLe+cnfIFsmpSX87vvz62kM2TApu1e/ydNSWcw6kIF9XNfYxkZIhJWJunOxE/E/R98FaI8FFY0YsDkGjeKurFWC02cPO1rWb0O5Z356P2egNHyJYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6+zDnlcInp+Uaoa5fIbXP7Ii6sDp7J66Lr/YYGnGCv0=;
 b=a3Q7ZFKVfkJg/9XxGUGACCcr2nWY7rQzaL31bg3Fxi9oz/c+QSbQ3c36nFY1rq5Lqnu9MHSF6j7zcxyNPtj+wLNWOzIPis/zKmw0IDdTKJunEgXJBRzwVV/CUBlaGMBOYgmUSfzZdcSS7KuoRtUaO1H2FQAWkiYCl9lRD9wSv3FivYf4/q91mrI7M4BHwhFLKfxJ1nL096M8JKLq+DaL3h5up2WAAI06abrWOdYP+G5weUffRO+10dsYZDnU1629GiJk1LK5U0iHIu8/wcoiX6K5u0X/+dTsd4jK65aSLWbKTfRGCjKB4pOGb0GkyVRoI8zat8IhPRDA9VeoEZpTxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6+zDnlcInp+Uaoa5fIbXP7Ii6sDp7J66Lr/YYGnGCv0=;
 b=bzQyyLAOQfOVb3Uc+VsOqH/lPb5+CtBF54VCHJeEr1pk37isjGi2D1F27rmkr10YVTKVCAq+0d4n0xajnBlq/tO9pva85HGsPC72Bqu7IeYBrI7oiaKmikJyV6U/B2JxBlOEnzhPaH5/iTfgBf7tbUdAYhFyFXnqv6G2BZuvOFE=
Received: from CH0PR08CA0022.namprd08.prod.outlook.com (2603:10b6:610:33::27)
 by BY5PR12MB4241.namprd12.prod.outlook.com (2603:10b6:a03:20c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Thu, 22 Oct
 2026 06:08:37 +0000
Received: from CH2PEPF00000143.namprd02.prod.outlook.com
 (2603:10b6:610:33:cafe::5e) by CH0PR08CA0022.outlook.office365.com
 (2603:10b6:610:33::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.18 via Frontend Transport; Thu,
 22 Oct 2026 06:08:36 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CH2PEPF00000143.mail.protection.outlook.com (10.167.244.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.15 via Frontend Transport; Thu, 22 Oct 2026 06:08:36 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Thu, 22 Oct
 2026 01:08:35 -0500
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53
 via Frontend Transport; Thu, 22 Oct 2026 01:08:31 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <lgirdwood@gmail.com>, <perex@perex.cz>,
	<tiwai@suse.com>, <pierre-louis.bossart@linux.dev>,
	<yung-chuan.liao@linux.intel.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <venkataprasad.potturu@amd.com>,
	<Syed.SabaKareem@amd.com>, <Mario.Limonciello@amd.com>,
	<Richard.Gong@amd.com>, <Vijendar.Mukunda@amd.com>, <Poojitha.N@amd.com>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<sound-open-firmware@alsa-project.org>
Subject: [PATCH V2 00/13] ASoC: amd: acp: ACP7.B/7.F SoundWire machine driver support
Date: Thu, 22 Oct 2026 11:32:10 +0530
Message-ID: <20261022060724.1814741-1-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.48.1
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
X-MS-TrafficTypeDiagnostic: CH2PEPF00000143:EE_|BY5PR12MB4241:EE_
X-MS-Office365-Filtering-Correlation-Id: 8bf91d48-942d-4717-f5f6-08df3002e8fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|36860700016|23010399003|82310400026|261021123027099003|56012099006|11063799006|261009223027099003|10067099003|18002099003|261021121427099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	4WGTwDUHeO2MVgkeADIr1hzefLpOF2J2F/ib6DMm/sp8C989HTFLmRwu86ZjapTwU/lkd/bT3u+Fr5by6f6VXbn69Z0gGstPjC+KF7w0Kvx5dd/MoEuT8vAhVjiC1mTzxUAjse/7qmJ71R42e3+2lejGpHSex4kxoBUtSzwoC4bm6Ksj5+xjpgQ7aN7uY8UEJSWaSEE4ZVjC1yUWiABR1J2eQP/6yyHog/oQLIu9anEF2GmMZ4CN/uW/TNZOz/F6Wtq3CivkTHo6YYSujLbOagVySf5Gv7fwV/sThDBDN/zLcQUJaow/4gkov6axFithQBWv7xXz1PKipn/ZEcvCeLrobu89LcoiMKW/5tn+PIKBRHgD3L7uMKPgnOCXS3oXsfGiR/u/BUuTcroQsDCeWb3M7bVZoyi6aDk3GwCzwk/sVcP9xzvDGOKsIlvFR8IO7baxu+D673dbwzQd0oy45WnKqEjoQbM7xJJ+l4Al6LwXSW9adTweikGjFBXK65YwRwrGhLqPUVQltU5UPrkuSMlcZLDAnTLMeeDgnI4SqStprmBGNNCYkycxT2N02CUlO754G0TYV5S5qoy1OevZp1jD1+weHq4bCTYH+nKSn0ultrgmJpH43jWeVleiOofbNtEcKY0GvbtrkgGdlH+t5hWDgYB+2BJ6gefOoabuGSQZPHCvUzplq6im4FzDTjf1PUcR8/Fp494sjtYz97YXzA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(36860700016)(23010399003)(82310400026)(261021123027099003)(56012099006)(11063799006)(261009223027099003)(10067099003)(18002099003)(261021121427099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	vh/+ZUc9h/RmQclnWI3f67ww/tAjteOovj+M4e7n2DggXeVc4FNDUmNt6kU22KwJv4TxooczZT2bn3ck/02TQjTFO2XLIGfhf89vwtmDS0TNvHTrZAKd1TrP1n6ExTpU9yV0tKP201Lw0SqxTBiowA9Sbhfuf+Vmet7AvahOBikIQT/llF+sfQH9as4Zw0KYYf+spSbBIFYNT+uuZFZ/pOWun5aBp4iYxjmvfB73aWcyfN2kr8B9GCK9+N8ffUbMHYHL5hlg4GqNGst/aBmb03cPxQDAeGLoyjnDrTcpBbbaQ0Jl/6PxrveE6704Cld3cEDU3bWnoKM2N6cRPFQF137dsGvMyiCFujBEoKNtVZoyQyE1Ea1he1ekDKDMJt4vQWSamf9zixQQq4Vhe7Hp3V9DvSK2cwvg1UVENC1xSCVGuhF4KZ5mEXECK1lxsuDv
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2026 06:08:36.6235
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bf91d48-942d-4717-f5f6-08df3002e8fb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00000143.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4241

This series extends the AMD ACP SoundWire machine driver to support
ACP7.B and ACP7.F platforms, adds ACPI machine tables for SoundWire
codec configurations, and fixes several issues in the SOF SoundWire
machine driver.

Patches 1-2 add the infrastructure for ACP7.B/7.F SoundWire support.
Patch 1 adds PCI revision constants and the ACP7X_SDW_MAX_LINKS (4)
constant to soc_amd_sdw_common.h, and switches mc_probe() to set
max_sdw_links based on PCI revision. Patch 2 adds the
get_acp7x_cpu_pin_id() function and hooks it into create_sdw_dailink()
for ACP7.B/7.F alongside the existing ACP63 and ACP70 paths.

Patches 3-7 address DMIC DAI link selection and components string
handling for ACP7.B/7.F platforms. Patch 3 fixes the PDM quirk
evaluation order: ASOC_SDW_ACP_DMIC1 was checked before dmi_check_system()
and quirk_override were applied, making the fallback dead code. It also
corrects the condition to use else if, since only one PDM controller
can be active at a time. Patch 4 adds ASOC_SDW_ACP_DMIC1 to log_quirks()
for boot-time diagnostics. Patch 5 extends the DMIC DAI link enable
condition to also check amd_ctx->pdm_sel so that ACPI-selected PDM
controllers on ACP7.B/7.F are handled without requiring a DMI quirk.
Patch 6 moves the ignore_internal_dmic gate to the DMIC enable condition,
removing dead code and demoting a spurious dev_warn to dev_dbg. Patch 7
appends the DMIC components string to card->components in mc_probe()
when a DMIC link will be registered, mirroring the condition used in
sof_card_dai_links_create().

Patch 8 propagates the PCI subsystem vendor and device IDs to the ALSA
card via snd_soc_card_set_pci_ssid() for correct device identification.

Patch 9 fixes a pre-existing typo: the MODULE_AUTHOR macro call was
missing the closing '>' in the email address.

Patches 10-13 add ACPI machine tables and wire them into the SOF
descriptors. Patch 10 introduces amd-acp7x-acpi-match.c with four
ACP7.F SoundWire machine entries covering RT721+RT1320 (L0+L3),
RT721+RT1320 (L0+L1), standalone RT721, and standalone RT722. Patch 11
registers the ACP7.F SoundWire table as alt_machines in the ACP7.F SOF
descriptor. Patch 12 adds a single ACP7.B entry for RT721 (L0) + RT1320
(L3). Patch 13 registers the ACP7.B SoundWire table as alt_machines in
the ACP7.B SOF descriptor.

Changes in V2:
  - Patch 6: simplify the DMIC enable condition as suggested by Pierre:
    evaluate the three-way boolean once and nest the ignore_internal_dmic
    check inside, avoiding the double-tested condition from V1.

Vijendar Mukunda (13):
  ASoC: amd: acp: add ACP7.B/7.F SoundWire link count for machine driver
  ASoC: amd: acp: add ACP7.B/7.F SoundWire DAI link support
  ASoC: amd: acp: fix PDM1 quirk and PDM controller selection for
    ACP7.B/7.F
  ASoC: amd: acp: log ASOC_SDW_ACP_DMIC1 quirk in SOF SoundWire machine
    driver
  ASoC: amd: acp7x: enable DMIC DAI link based on PDM controller
    selection
  ASoC: amd: acp: move ignore_internal_dmic gate to DMIC enable
    condition
  ASoC: amd: acp: add DMIC components string for SOF SoundWire machine
    driver
  ASoC: amd: acp: set PCI subsystem ID for SOF SoundWire machine driver
  ASoC: amd: acp: fix MODULE_AUTHOR missing closing angle bracket
  ASoC: amd: acp: add ACPI machine tables for ACP7.F SoundWire
  ASoC: SOF: amd: add alt_machines for ACP7.F SOF SoundWire
  ASoC: amd: acp: add SoundWire machine table for ACP7.B platform
  ASoC: SOF: amd: register SoundWire alt_machines for ACP7.B

 sound/soc/amd/acp/Makefile               |   2 +-
 sound/soc/amd/acp/acp-sdw-mach-common.c  |  36 +++++
 sound/soc/amd/acp/acp-sdw-sof-mach.c     | 103 ++++++++++--
 sound/soc/amd/acp/amd-acp7x-acpi-match.c | 198 +++++++++++++++++++++++
 sound/soc/amd/acp/soc_amd_sdw_common.h   |  32 ++++
 sound/soc/amd/mach-config.h              |   2 +
 sound/soc/sof/amd/pci-acp7x.c            |   2 +
 7 files changed, 361 insertions(+), 14 deletions(-)
 create mode 100644 sound/soc/amd/acp/amd-acp7x-acpi-match.c

-- 
2.48.1
