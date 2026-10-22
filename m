Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.46.31
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792649383;
	b=Rv7sb6UItRp4BRSpxoNTzmnbOMlbsUgkHuYj/YT0/79m9AQuW8i5jBkyJoh3Ze+Uh17D
	 PCR0HTLBSqmwdC72utK4hCMocs6naBtaU4tC7Mkem4TccUwpoo+g7j4Zs+abKJicOjHK2
	 6TAe4rykAnQkA3Qj8i3/oz4eLEDEv5oGZSihq6tbAw3KAVnzWZDR1dNXdsewoBEZgzV7p
	 h5ZeKrqHeD2Aa9Bv/cQgeblPloJftZSvdYp0qY6T572u1dZJ1pc2lcgFd1C2DFRi6iWnF
	 xG/pmnXzEdRtKVJZ4M+YKWIx+j1HbmEupPSe2hpT1QpeZov5V+iESOqOmaLx1oxTKjg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792649383;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:Content-Type:
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
	bh=1KfTk3Uuu5/r1ixTcmSrg/SsIAsGezUGfeW3iomcpRk=;
	b=yWi94untoVrffUefQl5k9MYeV39gRolD6Qz7UrOuA/F1EbggWhCRTgzK7pbn26Vl+3s8
	 cE1AzAkEvDHUqeQsOSBwF3thEsOu/GsKfYo7zx6bHCniq5Csk8VPfDaqaIrHR1oeerQC8
	 STobURjaNO4CPWAX4F+lNjVc116cAKXgdprooKXL9EEWYiuMyBT2oex7RpIZfAPXvijLi
	 +E3fWsHTtJopIBD+U7v9lasJ35I6OxQvtFDe/KWIl/aad/N6UZzWtrpepbTr7SzyV69Uo
	 ie9QanLWItyX9JfjyKpNFzJ09lnwZwZmPbt+xPF6owMernm3fLYHpZ5rXUmU1tykqyw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b="rxjA/GP0";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.46.31
Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010031.outbound.protection.outlook.com [52.101.46.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91BB5606A319;
	Thu, 22 Oct 2026 06:09:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91BB5606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=rxjA/GP0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OXt1dMsYCCkAzPlKvC7PmJNrwZdWodWZBGtXizurPL68QARqMqW07g8jAfy7Mu07k7Qlz/d7npxz1NNGv1cl2E/cNtHihx0tRYp4OP/GbTW+zMVBdwcJfHEFYn7AqY4F0grlwFblexrKaSzJ3iD1TC1d6hSsdsGbKx1rpQFH7Sg0ZcTeBWrEcpMmY0GxvEpUIk71ElDLGX2hCILPxnals5odDusIv15InOCGbeD4VASgxMpQ/Ipeb6X3aytr5xzRupccPGqFh/a0FV/HtA/ZcGVIm5fZJenDQWh8Ja8MI+zsp+uUyp+0iyUylRyvGNN8OOp29w1KGSQU96ZIIypUFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1KfTk3Uuu5/r1ixTcmSrg/SsIAsGezUGfeW3iomcpRk=;
 b=K3wX5v6HHXuaEwut3+aiCyQeolzFyX9ZevI99sRt6xTwfMkbNhTFqzW5unGrF4DL2p0c6q8wyKOnsLSgdn8gdqzM614IPnT5eaY+3dbAH2zVAlLdcyRfzYLBNndIZs6gp64JwEhSnhTuBBG2kZPIOdnOLJK7YGQCyRtsYD4AkbWo70RQpPfjlKs7GNhFxh4EduGEdlrex0/GY7tYjzTNqA+hfer8BX6HP7Tg2KdI/OKYJ5/hpncG/CoWPlVOxg0EnzOJMQaN9Ddezf7OC6U2miwbGpaeFjMPYUw9bK6uQYJKUTYAvxjSfw+nyk/cwYstaeISqAUnwHD2W4UddqCDiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1KfTk3Uuu5/r1ixTcmSrg/SsIAsGezUGfeW3iomcpRk=;
 b=rxjA/GP0Yv97uxZBhy4bhgYQLBA1jJ7VG+Jkz8EfNnidBhHnn8eKjucUj497Vr0jxHg3DjTEmNnMPXLOl/5/e5uQ//UKkq1tTTGvC+MASBwhC2VrZkyA1J2TkIBxKsOt09L4Ws32jVjM1Yhv+2XcuU2RRZMnpevRpbiueS7qpJk=
Received: from CH2PR15CA0030.namprd15.prod.outlook.com (2603:10b6:610:51::40)
 by SN7PR12MB7299.namprd12.prod.outlook.com (2603:10b6:806:2af::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Thu, 22 Oct
 2026 06:09:36 +0000
Received: from CH2PEPF00000146.namprd02.prod.outlook.com
 (2603:10b6:610:51:cafe::66) by CH2PR15CA0030.outlook.office365.com
 (2603:10b6:610:51::40) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.16 via Frontend Transport; Thu,
 22 Oct 2026 06:09:36 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CH2PEPF00000146.mail.protection.outlook.com (10.167.244.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.15 via Frontend Transport; Thu, 22 Oct 2026 06:09:36 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Thu, 22 Oct
 2026 01:09:34 -0500
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53
 via Frontend Transport; Thu, 22 Oct 2026 01:09:29 -0500
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
Subject: [PATCH V2 10/13] ASoC: amd: acp: add ACPI machine tables for ACP7.F SoundWire
Date: Thu, 22 Oct 2026 11:32:20 +0530
Message-ID: <20261022060724.1814741-11-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20261022060724.1814741-1-Vijendar.Mukunda@amd.com>
References: <20261022060724.1814741-1-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF00000146:EE_|SN7PR12MB7299:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a8fd812-aed5-45f5-c097-08df30030cb6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|376014|23010399003|36860700016|82310400026|261021123027099003|56012099006|11063799006|261009223027099003|10067099003|22082099003|18002099003|261021121427099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	+ElxWFDQ6QRlGVOQqPXG3zpE4Eca+9X7fn1t46e9l1fsOGuBgbvQGYNo3ErQT35OFfG5mqicGTP2Z+RuqmKETx+vDlDNQ2GXEisNcwAjqfBNSult8WpqgxttxqOftkB8/RihR3pknXEba61fvvfGmAld1v2C83Ax7XgPU6FrxX/LmfaMWE8TMTlLpKFsrFZ/aq/UnywpDbQV0waBoYetfQPCiFVLQ6AegYjpot084bWjcP8iJKkRoieG73AEQz1Cz1xqoYaYX8UghHkPWSSHqR/K/DyD2lfiIjLbknR5LSeMkHq6o20Tu621slCNs0TFt9mn/CnvhCjkm7bhCQwlErO9VRu9OSFE9pBwqoyVKJW0uPxWQLp7OcIkDmNK2NiR+NNgTdBAvyR2IgS4oyYkeAR3oZ3IswFvKAqAISv26WtyaC2guNMdBixUOFMRIcFea/EDtqRGzr3dULnE9R/VAShhuB3sjZTwGBM5kW85D6LgisvLGnjTfvX/Urwt7U27GIvpUhLRYgAhooI+mqdJuAobcFGBqWSauRWMPfCEhPky1hpi8RlTcBfrNmSZgBUizgDAmyunLbrC9b/69AtR6qQTenaj1DabkWinGqCtOpHwSr0FkFZNQCx5hEH1cvbM9ONfxFYiopawKUqGvTwfdaKDyKQL998dqzRxWuZkQKUN6qGwlo51xCfK0icApf9r
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(23010399003)(36860700016)(82310400026)(261021123027099003)(56012099006)(11063799006)(261009223027099003)(10067099003)(22082099003)(18002099003)(261021121427099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	dhVjy3S4KGX5X/C+lC/lnY0/StL1kSGnIWboPcoDmq0I1IThtLJyTvVpCrBxDS72tG5oPnIkms6D7eRBVzABg9gkhkdwiIZRISl3+CvTJgR89CQRMWtXOj4GAfUXIwLIbHjT1jX1RVYU5ApLU8TjiZWGCQYcMFIV+5npQWcgJj8x6LCbPLw6p+RUGakkgtYyrrkFMn2AC9RHRqlmkoEwtZh7hbqtsxddWmFjojcRgOnGNW54qBArFnpnP8zLTfNf93+Gp0amzY3mGeo2kGNSxVx5+b2UmaauWDLo94EAiEnzmtNI2Ymn745kU9sRYhz6kb/URNqMoeHbD9OCOV9L2moWOkobcN8jfDDcovxK4BGHzgbyHyHtiXPDjFuYF2gazEiypG3bB13gLXD6BmI4J7+/BHW/y1a8zpfGus13hDWn7urxl2/yQLH9c9U6/tBS
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2026 06:09:36.5923
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a8fd812-aed5-45f5-c097-08df30030cb6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00000146.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7299

Add amd-acp7x-acpi-match.c with four snd_soc_acpi_mach entries for
ACP7.F SoundWire configurations:
- RT721 + RT1320 on SoundWire links L0+L3
  (jack+dmic on RT721, spk on RT1320)
- RT721 + RT1320 on SoundWire links L0+L1
  (jack+dmic on RT721, spk on RT1320)
- Standalone RT721 on L0 (jack, amp and dmic endpoints)
- Standalone RT722 on L0 (jack, amp and dmic endpoints)

RT721+RT1320 combo configurations use jack_dmic_endpoints for RT721,
skipping the internal amp since RT1320 provides amplification on a
dedicated SoundWire link.

ACP7.B machine table will be added in a follow-up patch.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/acp/Makefile               |   2 +-
 sound/soc/amd/acp/amd-acp7x-acpi-match.c | 186 +++++++++++++++++++++++
 sound/soc/amd/mach-config.h              |   1 +
 3 files changed, 188 insertions(+), 1 deletion(-)
 create mode 100644 sound/soc/amd/acp/amd-acp7x-acpi-match.c

diff --git a/sound/soc/amd/acp/Makefile b/sound/soc/amd/acp/Makefile
index ab5f9dc871a67..42e2bd34da060 100644
--- a/sound/soc/amd/acp/Makefile
+++ b/sound/soc/amd/acp/Makefile
@@ -23,7 +23,7 @@ snd-acp70-y := acp70.o
 snd-acp-mach-y     := acp-mach-common.o
 snd-acp-legacy-mach-y     := acp-legacy-mach.o acp3x-es83xx/acp3x-es83xx.o
 snd-acp-sof-mach-y     := acp-sof-mach.o
-snd-soc-acpi-amd-match-y := amd-acp63-acpi-match.o amd-acp70-acpi-match.o
+snd-soc-acpi-amd-match-y := amd-acp63-acpi-match.o amd-acp70-acpi-match.o amd-acp7x-acpi-match.o
 snd-soc-acpi-amd-match-$(CONFIG_SND_SOC_ACPI_AMD_SDCA_QUIRKS) += soc-acpi-amd-sdca-quirks.o
 snd-acp-sdw-mach-y     := acp-sdw-mach-common.o
 snd-acp-sdw-sof-mach-y += acp-sdw-sof-mach.o
diff --git a/sound/soc/amd/acp/amd-acp7x-acpi-match.c b/sound/soc/amd/acp/amd-acp7x-acpi-match.c
new file mode 100644
index 0000000000000..2f5e060ec79b4
--- /dev/null
+++ b/sound/soc/amd/acp/amd-acp7x-acpi-match.c
@@ -0,0 +1,186 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * amd-acp7x-acpi-match.c - tables and support for ACP7.x(7.B/7.F) platforms
+ * ACPI enumeration.
+ *
+ * Copyright 2026 Advanced Micro Devices, Inc.
+ */
+
+#include <sound/soc-acpi.h>
+#include "../mach-config.h"
+
+static const struct snd_soc_acpi_endpoint single_endpoint = {
+	.num = 0,
+	.aggregated = 0,
+	.group_position = 0,
+	.group_id = 0
+};
+
+static const struct snd_soc_acpi_endpoint jack_dmic_endpoints[] = {
+	/* Jack Endpoint */
+	{
+		.num = 0,
+		.aggregated = 0,
+		.group_position = 0,
+		.group_id = 0,
+	},
+	/* DMIC Endpoint */
+	{
+		.num = 2,
+		.aggregated = 0,
+		.group_position = 0,
+		.group_id = 0,
+	},
+};
+
+static const struct snd_soc_acpi_endpoint jack_amp_dmic_endpoints[] = {
+	/* Jack Endpoint */
+	{
+		.num = 0,
+		.aggregated = 0,
+		.group_position = 0,
+		.group_id = 0,
+	},
+	/* Amp Endpoint */
+	{
+		.num = 1,
+		.aggregated = 0,
+		.group_position = 0,
+		.group_id = 0,
+	},
+	/* DMIC Endpoint */
+	{
+		.num = 2,
+		.aggregated = 0,
+		.group_position = 0,
+		.group_id = 0,
+	},
+};
+
+static const struct snd_soc_acpi_adr_device rt721_l0_single_adr[] = {
+	{
+		.adr = 0x000030025d072101ull,
+		.num_endpoints = ARRAY_SIZE(jack_dmic_endpoints),
+		.endpoints = jack_dmic_endpoints,
+		.name_prefix = "rt721"
+	}
+};
+
+static const struct snd_soc_acpi_adr_device rt721_l0_only[] = {
+	{
+		.adr = 0x000030025d072101ull,
+		.num_endpoints = ARRAY_SIZE(jack_amp_dmic_endpoints),
+		.endpoints = jack_amp_dmic_endpoints,
+		.name_prefix = "rt721"
+	}
+};
+
+static const struct snd_soc_acpi_link_adr acp7x_rt721_only[] = {
+	{
+		.mask = BIT(0),
+		.num_adr = ARRAY_SIZE(rt721_l0_only),
+		.adr_d = rt721_l0_only,
+	},
+	{}
+};
+
+static const struct snd_soc_acpi_adr_device rt722_l0_single_adr[] = {
+	{
+		.adr = 0x000030025d072201ull,
+		.num_endpoints = ARRAY_SIZE(jack_amp_dmic_endpoints),
+		.endpoints = jack_amp_dmic_endpoints,
+		.name_prefix = "rt722"
+	}
+};
+
+static const struct snd_soc_acpi_link_adr acp7x_rt722_only[] = {
+	{
+		.mask = BIT(0),
+		.num_adr = ARRAY_SIZE(rt722_l0_single_adr),
+		.adr_d = rt722_l0_single_adr,
+	},
+	{}
+};
+
+static const struct snd_soc_acpi_adr_device rt1320_l1_single_adr[] = {
+	{
+		.adr = 0x000130025d132001ull,
+		.num_endpoints = 1,
+		.endpoints = &single_endpoint,
+		.name_prefix = "rt1320-1"
+	},
+};
+
+static const struct snd_soc_acpi_adr_device rt1320_l3_single_adr[] = {
+	{
+		.adr = 0x000330025d132001ull,
+		.num_endpoints = 1,
+		.endpoints = &single_endpoint,
+		.name_prefix = "rt1320-1"
+	},
+};
+
+static const struct snd_soc_acpi_link_adr acp7x_rt721_l0_rt1320_l1[] = {
+	{
+		.mask = BIT(0),
+		.num_adr = ARRAY_SIZE(rt721_l0_single_adr),
+		.adr_d = rt721_l0_single_adr,
+	},
+	{
+		.mask = BIT(1),
+		.num_adr = ARRAY_SIZE(rt1320_l1_single_adr),
+		.adr_d = rt1320_l1_single_adr,
+	},
+	{}
+};
+
+static const struct snd_soc_acpi_link_adr acp7x_rt721_l0_rt1320_l3[] = {
+	{
+		.mask = BIT(0),
+		.num_adr = ARRAY_SIZE(rt721_l0_single_adr),
+		.adr_d = rt721_l0_single_adr,
+	},
+	{
+		.mask = BIT(3),
+		.num_adr = ARRAY_SIZE(rt1320_l3_single_adr),
+		.adr_d = rt1320_l3_single_adr,
+	},
+	{}
+};
+
+struct snd_soc_acpi_mach snd_soc_acpi_amd_acp7f_sof_sdw_machines[] = {
+	{
+		.link_mask = BIT(0) | BIT(3),
+		.links = acp7x_rt721_l0_rt1320_l3,
+		.drv_name = "amd_sof_sdw",
+		.sof_tplg_filename = "sof-acp7f-rt721-l0-rt1320-l3.tplg",
+		.fw_filename = "sof-acp7f.ri",
+	},
+	{
+		.link_mask = BIT(0) | BIT(1),
+		.links = acp7x_rt721_l0_rt1320_l1,
+		.drv_name = "amd_sof_sdw",
+		.sof_tplg_filename = "sof-acp7f-rt721-l0-rt1320-l1.tplg",
+		.fw_filename = "sof-acp7f.ri",
+	},
+	{
+		.link_mask = BIT(0),
+		.links = acp7x_rt721_only,
+		.drv_name = "amd_sof_sdw",
+		.sof_tplg_filename = "sof-acp7f-rt721-l0.tplg",
+		.fw_filename = "sof-acp7f.ri",
+	},
+	{
+		.link_mask = BIT(0),
+		.links = acp7x_rt722_only,
+		.drv_name = "amd_sof_sdw",
+		.sof_tplg_filename = "sof-acp7f-rt722-l0.tplg",
+		.fw_filename = "sof-acp7f.ri",
+	},
+	{},
+};
+EXPORT_SYMBOL(snd_soc_acpi_amd_acp7f_sof_sdw_machines);
+
+MODULE_DESCRIPTION("AMD ACP7.x SoundWire machine tables for ACPI enumeration");
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Vijendar Mukunda <Vijendar.Mukunda@amd.com>");
diff --git a/sound/soc/amd/mach-config.h b/sound/soc/amd/mach-config.h
index 02ce044bcbf72..321af4682fd30 100644
--- a/sound/soc/amd/mach-config.h
+++ b/sound/soc/amd/mach-config.h
@@ -30,6 +30,7 @@ extern struct snd_soc_acpi_mach snd_soc_acpi_amd_acp70_sdw_machines[];
 extern struct snd_soc_acpi_mach snd_soc_acpi_amd_acp70_sof_sdw_machines[];
 extern struct snd_soc_acpi_mach snd_soc_acpi_amd_acp7b_sof_machines[];
 extern struct snd_soc_acpi_mach snd_soc_acpi_amd_acp7f_sof_machines[];
+extern struct snd_soc_acpi_mach snd_soc_acpi_amd_acp7f_sof_sdw_machines[];
 
 struct config_entry {
 	u32 flags;
-- 
2.48.1

