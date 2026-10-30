Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.196.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793353708;
	b=UK37TpVwSNfZw1wMgU/C0FRvttQgq71pm3Kk3xCCfcoWnkeeheZRe74NYBhA+bOVv62M
	 RR5qyBIp4VbKCaxXha1uKAyT4i6zQ4FM7BzpFW6Y872FKjYYm4IJ0UXfJWdZpZHEKBJMD
	 GlYkzhEokKTvBjQsb0GsJIi9zFd5nFVv4kTn+yHeh9H554qxuhcZOkiLuXmFleFjaOW8H
	 dcvqrf924z8cA/3XBMIhqhCazWydsFgWjnz8SumbyAUdbHNsS6k9VwjURIvcDDZ2XewBA
	 U7Wh0DzCJDLBQYCrJelySn2FyTmDeMIgrmVHidWao9JV1jKLasLFI8LhreabmOt8zmA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793353708;
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
	bh=baomvxXg2b2yCdaACeca8RoO5XVv1mmm9Vp82x0s2oQ=;
	b=wNVeeQ0JWOluxS/+i9sV2wQ8rcbzqvvxPDgj8XoPEIFMwo1c9kLEPawL0DRM2CUhc935
	 6YuFJGQNOG6HqcSnQiOMrzuU5e/ZclSoZbLP/mroogJwrC2kozJ8qxb3MaRZOoZBBNZmy
	 3pbY4Zb5gY4ldauHgBPs51Yp17VYnz0br0HO6WmOmY5ZB8neYL+mdP98lwTnrow5lgBNg
	 2JoKUtNluZ87sBiV+UoInZFWpUsNF9gPF2bQzmJyavDOVHI5k9M4NfFyLESWAxnMD9Hcm
	 6RJUsILHqjSsAAP7DA6Stjy0cdxG/k0J86h7XNGymQUvgz1z88iAzzdyC6HBqhdr4Uw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=jWGGmels;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.196.42
Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013042.outbound.protection.outlook.com [40.93.196.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90EEE606A31F;
	Fri, 30 Oct 2026 09:48:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90EEE606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=jWGGmels
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iF3h/fmY2Lj8jUoFEE+cgJiobcq2ZlqSTz546QpBL55wR26NEI3gea+9gjnq0ZbP+gSS5NZ6hkuyN3ROPXbs+vP4FiYeO/hsibKCDW+ohI5DxN9mg3MHxeBoaxA8rqO75dSCRf4J2tOGKLVut3xDIE2JyACgbF2Op1DgSFRQPPG2J9wSuf96BPEcA8pPsDH1P9vQrauj5dCUpy5Cl3gi50ESOu7b/tnGGRi37OQY0G7Gg5VbLTUej9b8yYNnGewBqrfiMk4LXriCH6nIQTfZxQHf4MHLk9hx+N0n9nHZ1ktVKmk6NViWfXyg5mPAqPZ8ayXAdSR8vU8Ie7oqmnWGoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=baomvxXg2b2yCdaACeca8RoO5XVv1mmm9Vp82x0s2oQ=;
 b=XWBqgUmjPd7nR2A9qZlWRmu4IHJexyTUO5czXP2LO/tH7IFmpXT58MYgugDQBCtIXdnlXW7sPv0sAqKO+HLtuQdes0FeCYrH9ewdiPGgSzGoGQ9Ko9YygUhNC2EqqknPkzEfh8fCR4TH56H04Rn3RZoqrVBYtKQ9N0VHaWLTRwArYuYUFKN3sXZ8WccDV3cINMQq1fMx9BD7Ufu19zwxM9+iCQ7o7/OtNI9CrkFm9u5u+em9oUj9CvqK3Jx3QzNGN2VeDB49eBZDBrBBf5pOVQvmjkgUF3PCsj+in4oTVKaFl0QxauZ1ruOKycXyfb54KrIg/BRTqXY8JtSnacV5yQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=baomvxXg2b2yCdaACeca8RoO5XVv1mmm9Vp82x0s2oQ=;
 b=jWGGmelswAL0jor3Ot8EI7TqhZEhM+PIGd5w+fHojWIAfOApUfP+V66nCLTPX0T46RxFHIptH1uRhnj0IzDSTIXQ1V1mOBOTAGtUPkMLP8cBGsfEyxSM+R4fx0TofMCNIcKnOIecukCEHWWAxT08/zuyi+3nOW8jZhVL7EcTRVk=
Received: from MW4P222CA0021.NAMP222.PROD.OUTLOOK.COM (2603:10b6:303:114::26)
 by DS0PR12MB999287.namprd12.prod.outlook.com (2603:10b6:8:424::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.10; Fri, 30 Oct
 2026 09:48:24 +0000
Received: from SJ1PEPF000037B6.namprd05.prod.outlook.com
 (2603:10b6:303:114:cafe::5b) by MW4P222CA0021.outlook.office365.com
 (2603:10b6:303:114::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.9 via Frontend Transport; Fri, 30
 Oct 2026 09:48:23 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF000037B6.mail.protection.outlook.com (10.167.244.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Fri, 30 Oct 2026 09:48:23 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Fri, 30 Oct
 2026 04:48:22 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Fri, 30 Oct
 2026 04:48:21 -0500
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53
 via Frontend Transport; Fri, 30 Oct 2026 04:48:17 -0500
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
Subject: [PATCH v4 00/16] ASoC: amd: acp: ACP7.B/7.F SoundWire machine driver support
Date: Fri, 30 Oct 2026 15:15:15 +0530
Message-ID: <20261030094714.1123396-1-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF000037B6:EE_|DS0PR12MB999287:EE_
X-MS-Office365-Filtering-Correlation-Id: 0562444b-f451-4d72-fb88-08df366af050
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|23010399003|7416014|376014|1800799024|6133799003|10067099003|18002099003|56012099006|11063799006|261026121527099003|261028144727099003|261026140227099003|261022105027099003|261021123027099003|261021121427099003|261022075727099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	UdEFbcHofDyYGg8T63l2Y/Ehes/RLND6BOyv1qD3sK9rtns2o1mhSonHKcFMjUKxPAQx8Ge1DKRbw3USTNw5RaTXLG6T4khOp0upi6ewiIoFmkNICcSYVFSyyD8+zOV5xQTsEgAmuGc3m0Yg8qMqovqbH4FKktInapq0OpkUEXmbZPkDVO+aSR3wDXdUPZbNxyvhSuSgg/5ZpQLFQH0VYFzSFXe0OiOE5rTKLPwUbdkNRfmPVjwV1DiUueNpHBfAsZWjRcl++/iLWqYyYSo+3/dCKfAIVbGKTfhsskKpqybKOrmAj6aOpdkIe7ZaePtcDcpPyC4GVrPLpNYYUJdC+ERs5CeFZcDonEpf2iIhToKD6aFG6wbGT2UOucsgvuIibNPWoiwmGe8DG+Rf54jpiN86I+d/v+SpCcIYJEUWvNcG/lF+/bEyprtszf3Y33BSzZ6pu3863WxOOQS2SjBg2ubIehXDd1SDhY6WQhdQsq3JnhhK000HaodBjaAdUEAqKFa/O9uL0OAhINPjmEemzgGCNAQxx0wiMB9Yekxm3PIZIID53kFV4kcKRLW9EP/EMjppHz40AtnBIeIPqjtQdUZujAVrsSNDnhBfKHflUvs5gkOr+eNu3h9p//WfQ01kndI7p3CZH0BiPAAJPSTjDTntrf0fPXSp5+XpEvVYbZiEG+nFJ0RpChiLJSTLLoADhNxeMJV60qeAmmjZaoVVqg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(23010399003)(7416014)(376014)(1800799024)(6133799003)(10067099003)(18002099003)(56012099006)(11063799006)(261026121527099003)(261028144727099003)(261026140227099003)(261022105027099003)(261021123027099003)(261021121427099003)(261022075727099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Ba4ir8JCtHB7CN8zwncZjoXMcOOJHmO/8+L+cOqmcvTuhO6aCJatF9Rw0Zmh8us+/CpoPbddb/0OqHdH9yDQNFGqtlmNHyqi/Re3RrDPc5f+xrlDkW96UFdh6ReqGe1Y6U9FUvWsnFkFswXaG9ZAuv76x6zrS+9BOvUwCovfiJlXCFnhGnHsBBm/s5iM5akBlN8S2ibfUltROHONhe7aFGcc/qAydJokRY6W42JSOxn46xY3JL9LTKRSMZ1oN2TqBo2gkWDLOtBg1jDffLE/TrHTXg5uLY6HMNgbdzVlMfcA+Bp5QkhFLe2R9c1jeo7knR+ZnRwqO5fngbeYi1hxa4d3T9tFFmpkGSyd8UZRJxolvGkvBVi1OJlPTxXnVooHdtiG14Z/H59Pa8VmVWm83BOh2lpu3JkGMnN1OlRKGNCIbZP1BlUs9SvKPHc/4jbC
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 09:48:23.4851
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0562444b-f451-4d72-fb88-08df366af050
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000037B6.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB999287

This series adds SoundWire machine driver support for ACP7.B and ACP7.F
platforms. It extends the existing AMD ACP SoundWire infrastructure with
per-platform CPU pin ID lookup, PDM controller selection via ACPI and DMI
quirks, DMIC DAI link and components string handling, PCI subsystem ID
propagation, and ACPI machine tables for RT721/RT722/RT1320 codec
configurations on both platforms.

Changes in v4:
  - Patch 1: fix missing asoc_sdw_mc_dailink_exit_loop() cleanup on
    devm_kasprintf() failure in acp-sdw-sof-mach.c mc_probe() (new).
  - Patch 2: fix missing asoc_sdw_mc_dailink_exit_loop() cleanup on
    both devm_kasprintf() failure paths in acp-sdw-legacy-mach.c
    mc_probe(); update commit message to reference the correct function
    name soc_card_dai_links_create() instead of sof_card_dai_links_create()
    (new).
  - Patch 3: remove unused ACP63_SDW_MAX_CPU_DAIS define (new).
  - Patch 5 (was 2): add comments above ACP7X_SW_AUDIO* define block
    and get_acp7x_cpu_pin_id() to document the dedicated per-port DMA
    layout and the port-to-use-case mapping.
  - Patch 9 (was 6): replace misleading "No functional change" claim
    with an accurate description of the behavioural change for platforms
    where ignore_internal_dmic is true (dmic_num now stays zero at the
    gate rather than reaching the dmic_num > 0 block).

Changes in v3:
  - Patch 3: update subject and changelog to accurately describe the new
    PDM controller selection infrastructure being added.
  - Patch 5: fix commit subject prefix from "amd: acp7x:" to "amd: acp:"
    since the change is in the generic ACP SoundWire machine driver
    (acp-sdw-sof-mach.c), not the ACP7x-specific SOF driver.

Changes in v2:
  - Patch 6: simplify the DMIC enable condition as suggested by Pierre:
    evaluate the three-way boolean once and nest the ignore_internal_dmic
    check inside, avoiding the double-tested condition from v1.

Vijendar Mukunda (16):
  ASoC: amd: acp: fix missing cleanup on devm_kasprintf() failure in
    mc_probe()
  ASoC: amd: acp: fix missing cleanup on devm_kasprintf() failure in
    legacy SDW machine driver
  ASoC: amd: sdw: remove unused ACP63_SDW_MAX_CPU_DAIS define
  ASoC: amd: acp: add ACP7.B/7.F SoundWire link count for machine driver
  ASoC: amd: acp: add ACP7.B/7.F SoundWire DAI link support
  ASoC: amd: acp: add PDM controller selection for ACP7.B/7.F SoundWire
    machine driver
  ASoC: amd: acp: log ASOC_SDW_ACP_DMIC1 quirk in SOF SoundWire machine
    driver
  ASoC: amd: acp: enable DMIC DAI link based on PDM controller selection
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
 sound/soc/amd/acp/acp-sdw-legacy-mach.c  |   8 +-
 sound/soc/amd/acp/acp-sdw-mach-common.c  |  48 ++++++
 sound/soc/amd/acp/acp-sdw-sof-mach.c     | 109 +++++++++++--
 sound/soc/amd/acp/amd-acp7x-acpi-match.c | 198 +++++++++++++++++++++++
 sound/soc/amd/acp/soc_amd_sdw_common.h   |  45 +++++-
 sound/soc/amd/mach-config.h              |   2 +
 sound/soc/sof/amd/pci-acp7x.c            |   2 +
 8 files changed, 396 insertions(+), 18 deletions(-)
 create mode 100644 sound/soc/amd/acp/amd-acp7x-acpi-match.c

-- 
2.53.0

