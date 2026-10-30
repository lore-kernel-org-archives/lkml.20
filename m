Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.57.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793353771;
	b=3JnNjeJxzDnaPCHC9AtPAx5yyPTZbga+QATH9MaiM0RQG2zYykZj7U3ANZ9Gx9bg1VCt
	 YXkc0GyDYzh+MjSDCkPcsrplOFhfSPFqymw7YuLfBIPFEc/Rzxw6UaZhUHPAKexnkIpGN
	 wa243HTqDgAkbHqNzx9yTfnGS1Mrtdls6ON2fuWAjT0yj8zSHklK8EcPP7d6wgeMnt1rK
	 9lX1Qy/AviOHduOOzLhwx3Yxq1qZY2tCSlkWpqxeXDBJn3uNanmDrcZvS0p4BJm/MU/ML
	 g/aI2e8mufyVjRyWIjGrQUeYkwT1X9kcRuG7AktkgSK2+CbmT8YoMC3acPElBbxn/gg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793353771;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type:X-EOPAttributedMessage:X-MS-PublicTrafficType:
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
	bh=vY2mIEwci5SpwHUsLEEeDTbiQFbM44QfWO/kBDRaWbE=;
	b=EZ1g5CYrmapzuhjgv+NsEnn0Tvj7WNp7+2q0IEKshBXauZeOdbAu/ba2Cq4Crl8Ks2aE
	 l5CQXeGN0mMC1DZQarJAjPT9N50y8a3AGzfbAx0LpWYjcsWXjajjIY+l1FUcg5pi/8Kdd
	 JzrGJChJCUdTJ/hoLjS1WT5xaMKx27bCx06iXmtvsuAocEnLefFgWQVnRQdsdenxL2sMi
	 tMmeoo/0QoN6Ccb4FHq9ZJJ/Fe4qF/ryoByO4/2zjSS9t9LS+00Uf7GvXkuqRYVHDWol0
	 1+tYw8jA2tmBWo9n2dLdieIIOoih7/tvHEWB893kiJwGmyszeLjvw+7abGWDRHf9I9Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=oGSSThz0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.57.42
Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011042.outbound.protection.outlook.com [52.101.57.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B167F606A31C;
	Fri, 30 Oct 2026 09:49:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B167F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=oGSSThz0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PxzWsE4+b/aV5ricUmKFfJ/kpuaNqk4RI9RdL6P7ot0LcLoMgORALKQZY34jpAJHOUuuRXWcbDEtWgMqhsf1OXObuigfJKm1jEnUKxErbiEDAzqB5GVSYl4NUaKafRtHPIzYGEpaJY5eDr3t9i1mgtwdxHKQghgROlbeRlZh3VxK6RRd8fjz3BU3zBDFiLC/CA28gPe3IOaSWNa/lz6yREkqxzACldASlLldhT26uVZR6ZYsMoAq57RkREFIIwtfK8P/msBQm8kQfiCLQ+QkziAPHuhdzkD4MqQCPeg1MWi+e3/FbB3cGYHA70azDH4HJ6r52E9dOXE2cEeniwGt4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vY2mIEwci5SpwHUsLEEeDTbiQFbM44QfWO/kBDRaWbE=;
 b=dpzxY0ssa0RIp7hHBHxs5sANy48lIabLfCuRhZSZWw8PTruCBhlJMIywHAG69LgRZi6iJKtU+0wtGA1skqgXpufx+IQuecx5zGfhX/3XyCXwRO14isZsHDxUcGcME/zbWHySG0bcagxDc98yFciGOplXtvDmO1eyTi1+qlK+wgUl0oQtiL5OsNvShsLqBr22ARl6JKxlG9tlVPLJWrWUxWodW3gvrnzgz3XfAtAE1m16BgXcGPdSUbVW8Ipv5hc47FF60UMX978zDmfDA6F+dom/w6BdMHQk4vNM8HLdpfrrXLgKye5eLgO0IMOI2NCrFpn5kE1q5yKNO8KSH+Gelg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vY2mIEwci5SpwHUsLEEeDTbiQFbM44QfWO/kBDRaWbE=;
 b=oGSSThz089uPUAhK4Bz6omCa8uLpb4h5LfDXbZeyOCh6Ghmqiab7xeWgG9nA6UiPilZeWJgRp0jttQgAn3OVJZxZdgBAuIGxMrtZYe2wM9rOilu397DuQfz29cLvOOVx6DDAu9+uupBmisVWk/Vx4zu8ATwjmSeArVlyQF6iBb4=
Received: from BY1P220CA0041.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:59e::13)
 by MW4PR12MB7216.namprd12.prod.outlook.com (2603:10b6:303:226::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.9; Fri, 30 Oct
 2026 09:49:25 +0000
Received: from SJ1PEPF000037B9.namprd05.prod.outlook.com
 (2603:10b6:a03:59e:cafe::36) by BY1P220CA0041.outlook.office365.com
 (2603:10b6:a03:59e::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.9 via Frontend Transport; Fri, 30
 Oct 2026 09:49:25 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF000037B9.mail.protection.outlook.com (10.167.244.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Fri, 30 Oct 2026 09:49:25 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Fri, 30 Oct
 2026 04:49:24 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Fri, 30 Oct
 2026 04:49:24 -0500
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53
 via Frontend Transport; Fri, 30 Oct 2026 04:49:20 -0500
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
Subject: [PATCH v4 13/16] ASoC: amd: acp: add ACPI machine tables for ACP7.F SoundWire
Date: Fri, 30 Oct 2026 15:15:28 +0530
Message-ID: <20261030094714.1123396-14-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261030094714.1123396-1-Vijendar.Mukunda@amd.com>
References: <20261030094714.1123396-1-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF000037B9:EE_|MW4PR12MB7216:EE_
X-MS-Office365-Filtering-Correlation-Id: 5386fa3f-495f-4f6e-2137-08df366b154f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|23010399003|376014|7416014|1800799024|6133799003|22082099003|18002099003|56012099006|11063799006|261022075727099003|261022113327099003|261021123027099003|261021121427099003|261026121527099003|261009223027099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	OQlew4FEREXm9xWAOBAcvzkJkD9s4pyuMAKwkSiEkVqjdCGteXlplH1ko9l+pA0BMXAgWD4AKqfEcDrrQTdzwHetl6DsUQ8lk5XoW4G4EwazEv/9XRWl2vUsm3GbW2Z+iJd4SvcW6RnsQUuAQ9yK5JemOTjYiRtOyk0gc6keBvN0dKmx0moe5cbi6v7UBanftUSagV9FHP71Kia8UmKtYqxceMeWutHqnXbbFPytHGkyc6SFgx0O/Swe6yiJODB6ZZ0yddgnN5iAlMV9+1r7ZuiogvXvJTNAymKGiBuWOzNVe4jAAdAQzr4XWWp2NxFwtoaahTUcbTHLgpidTmTE0viX1fAssLLCRmAmvuOZWaQcfulkoUPDXE2unUIxd74w0oZfyYI6dpx0YaTbHwj+1OHQwh9Fyes5pQPCDEvYyfsgWHzWbwEVVCwvQkkCFiHeyAKOOCd86e4uL6ZjUtTyqq7xiAEbXtfttmizxY+V7GHCJ1CRg2V1FKl4CDY8N8mXS98+fU0pgwlvPq36ZQ9h2ndIC2r0RyGEwv5AqNTFvEVGGQJaOW9VxtAF/EYP6GSEnoZyfiujDUvmWQgVm5GQ7jXlNA20AZjTM4/GHA87zuPmzya6ZFmSfJzgvDG+hUVx34zDFZfef2A3BR+adWzkwCtJytFYW/nDZ4gxj+h1EZx2EOxFNLIhd21OtPfUMDo7TskUmXbtvWH/mT4oO9VTSw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(23010399003)(376014)(7416014)(1800799024)(6133799003)(22082099003)(18002099003)(56012099006)(11063799006)(261022075727099003)(261022113327099003)(261021123027099003)(261021121427099003)(261026121527099003)(261009223027099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	EjwQ2UDuvG1mkBcxyQhvUQSRON76nYpnnaMYeyG+glFg8HPwFF1z/VRZ3zTtxnwx9qLS3I9rSsrypBuTua/wNF6QY0dWa8i0YmsxEzZoX+wgM8YxlHj6HuGNlwkYmxCFDPtAz+gofsz90L2xU5qott32O6ByJL2/0r6IBsrOgfAA3gesbMvdUxRnCZl1qFBjAUosHvlslkl1vo8uCkqRopX6emEwaSnCV+43Vl3aK0GQGonW3Yu4VReIi6qc4ZzCAdPE2QSZCKKGOSDgnucYKYwhc9N2F+Vd+RAnwtYGXuVajlXjFk8jGVHPvlz1Be/XN5fyHICEg1/3nW1Q/qS9lpg3THQ0VtCRjs+xs4QcSQVrx+uI7hTKDXAGq5qh4lx49TnXr5yQTBIxZSLMNh6eJY6jl3KPOOkdsYDYfJTxsaR/Js+G0ezmbVlMfB9CwGAg
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 09:49:25.5521
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5386fa3f-495f-4f6e-2137-08df366b154f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000037B9.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7216

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
index ab5f9dc871a6..42e2bd34da06 100644
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
index 000000000000..2f5e060ec79b
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
index 02ce044bcbf7..321af4682fd3 100644
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
2.53.0

