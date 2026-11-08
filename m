Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.193.31
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794166338;
	b=OhOP5mHkaNlPA0Lchmdtk9cmNL+Bsg46Ql5u+ymytNW86O/y6wPsDG3Fupc15LWok8nD
	 7U9ijK0rlkiu/Vgr/Tyf4RtsctGwOGwm/lpdi9nIXi04hUdtSTVsIVcB2U/nCqWYR0aIy
	 rEreUIQcF8VRDwXZqT2tyIABIL1VKjs/6Jy6St3U2flkamFi4OuIsUNfDnj1yfjzu1VRi
	 jrCfvKoj6hbRaqgY00CvCfC9626pv43Fj1vQEyfv2XnKHorvHsRbl2MNHoOUNQ2vRJKdA
	 uJHpC+9Dm7qBJFG8waHJKCnsUWRHLRXh+Kcz/BugGvfCvE+9+tFO3Lqu9OXy2BPJ2Ng==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794166338;
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
	bh=Fn9Qk+/3NGgLtw+AumGFFjczHvZGt9urpzPszHSoE2o=;
	b=5qlQ1FOs8PmeOs/O0hmGbYeZ76c1IckVnSY0zjGo72rH2sFnv/UmhSMO6A7py19Cl0+J
	 SkbS72tkMpg4VmURqsj0B0j6pQ+CKqi0rxyY2r9Ojlnp0YwK5lHZwgns7u+uoAAJtVyJD
	 imhX0q4JWguz5xeJUXkqwz+T5K2LrFIX9dQHEAiid0ALoVcKyeKR+ZqwwkOgBB2grIipz
	 pJf6CkRePeb6wrSJjKQqvVFb2D0TvIiuxcKVjBeuSAHIhrpdnjVv17tcUfyduvjbxwRQZ
	 +sNuPUgh8ReNpZwQ+CkCQm2s7iN7LqqGdsHGeFuDuLpLKOoudOC55R/YLnMLXaygWVA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=L6jZQxmN;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.193.31
Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010031.outbound.protection.outlook.com [52.101.193.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6529606A330;
	Sun,  8 Nov 2026 19:32:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6529606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=L6jZQxmN
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i0SsY7CpKVCycgYqufsueYxuZGTKlQ6dUReIj6f04imXC4gEpKZHs6cCejwwRthrFFR7g420JA0vZ8BTzFBDgBr5DWuL8N/MgEg9YdXWRDRxiRd6OmLkirkAJVi7T17+8xpcMWgLPKUoHFFSPBTLNsDf7SKHX2ufjUr1s04OVUHoQGurEP4U4OQKQM05qvjbk0uF7K3XS1YQqQ98VCfd8FVk76MpamNKeyr7lheLCxKYzvdHTX2nV+kK5mOb1bS8Z4Ni8NnZOmgjPsyBtW/dFx4kJ3sA2g/iasRB9g9oll8PJ7Nt+mNoXUKjL8yY4XuvNlIjt5LTU99UEgujJV5mlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fn9Qk+/3NGgLtw+AumGFFjczHvZGt9urpzPszHSoE2o=;
 b=IMUxKlLUfn4JBYH9WP2qfqy23rn5Kc2o0iG7qOkLuqEJIcxA2bursrQagqx4zO712HASt/D8qPn+6upJ8n0OH0uJs6aBLSh+pf1IVMR/yT3B5FRQGaFO/4Mgk/jKYx5jXbIMGEazCEkaRnqQYd4TkvJV6wJJWOG2HpHwB0xpxv7bJRCT2QIE6TZoBvbd6tpMNE46+2KWJvX6OgS1rqJ+LqeFiVR4K+DcYop4cwzsoJmwzvP7h+nvZbWsX+6AsuRApDpKv1ITN4+PYayFYWtOfqqLnG8y14Sb18jeX4SD5d6YYeZ7/DRSDoLI7RHsWy4lcMOGSlv6i+lzlVeYWEq/6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fn9Qk+/3NGgLtw+AumGFFjczHvZGt9urpzPszHSoE2o=;
 b=L6jZQxmNytoeLH7qqYlVSC7gMnT48T8r34KBEqqQwLCzIr/V1ZKpr9hRIwaHC0zNGzp7D/J+oa98BkG1EMT7vlEavX+80IOovbZScgw6j7vdhL9jOIjIvfyuHOvYyGfnS+AiOlBtlHDXPEjPOKLWEAzMK481TOzqhoH3V2lOF90=
Received: from PH7P220CA0052.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:32b::34)
 by BY5PR12MB4036.namprd12.prod.outlook.com (2603:10b6:a03:210::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.12; Sun, 8 Nov
 2026 19:32:12 +0000
Received: from PH3PEPF0005961A.namprd05.prod.outlook.com
 (2603:10b6:510:32b:cafe::2) by PH7P220CA0052.outlook.office365.com
 (2603:10b6:510:32b::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.12 via Frontend Transport; Sun, 8
 Nov 2026 19:32:12 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 PH3PEPF0005961A.mail.protection.outlook.com (10.167.243.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Sun, 8 Nov 2026 19:32:12 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Sun, 8 Nov
 2026 13:32:08 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Sun, 8 Nov
 2026 13:32:08 -0600
Received: from amd-B550M-DS3H.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Sun, 8 Nov 2026 13:31:59 -0600
From: Syed Saba Kareem <syed.sabakareem@amd.com>
To: <broonie@kernel.org>
CC: <Sunil-kumar.Dommati@amd.com>, <vijendar.mukunda@amd.com>,
	<Mario.Limonciello@amd.com>, <venkataprasad.potturu@amd.com>, "Syed Saba
 Kareem" <Syed.SabaKareem@amd.com>, Siva Subramanian Ravi Saravanan
	<sravisar@amd.com>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>, "Liam
 Girdwood" <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, "Takashi
 Iwai" <tiwai@suse.com>, Pierre-Louis Bossart
	<pierre-louis.bossart@linux.dev>, open list <linux-kernel@vger.kernel.org>,
	"open list:AMD ASoC DRIVERS" <linux-sound@vger.kernel.org>
Subject: [PATCH v3 4/6] ASoC: amd: acp: add SOF function topology support
Date: Mon, 9 Nov 2026 01:00:32 +0530
Message-ID: <20261108193119.2308421-5-syed.sabakareem@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261108193119.2308421-1-syed.sabakareem@amd.com>
References: <20261108193119.2308421-1-syed.sabakareem@amd.com>
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
X-MS-TrafficTypeDiagnostic: PH3PEPF0005961A:EE_|BY5PR12MB4036:EE_
X-MS-Office365-Filtering-Correlation-Id: c91edd2f-f4a7-4959-4efe-08df3dcefcb8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|23010399003|82310400026|36860700016|11063799006|56012099006|261021123027099003|261021121427099003|261022075727099003|261022105027099003|261009223027099003|261026140227099003|261028144727099003|261102123227099003|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	90qJigE9mVXt4jW2N/1gjcQdDJgYIfeuBCEwhQ/6rdw2994TwEU+fUYDXOEdYDKrGnsUUgIGUtygqqe9w2gNUt/auyYwbKxkCzktWLrPhJjrPUkyQrjWYA3ecs/PIC5xTznHdCX2GnilWO4F/LlKgL3ABosck93kGIgFVl3qg15da+4OyVb7CuA23foyxRP2N0gMJc7nWNHCz0JAKuZT84gtjjZha7h2tFBfe8ygU0KlTl/QQMeaKG3vwACI8a8THANZakpuevxfmRpJ8pUVbDaP/64khd7TGFXgpNWnXdW3TDggKxZMOUB5jcRuAPnhUtdmzEMN3ho6dTPSDAneQT7zwGTBALIu8agMzsX/89GpeVXPJDs4gzxv27hNZ36tuQgitRpPz/9IKs6gv+0g26A6pEWun2tXiOPZeamU3d6/LVuyiT7fnU9oY1cCC24tv3qnISeQUN675qXNs0Xobp5EQDSunznlgTtCfdbzByIuad/hJd8TOI2ON6eWapfo4cpR6OBjsW/xVQF+ZPKhlR7p0cQmOTI8UwKAiesGnV7F5CzpBli9QXalhlmlNEjuF4nsbbbLda98EWzhJOo1vopeAkDJ0ju4ZrTVm1VQXc/dzq4Zj55rsrqayRMDMtUNsugLFD3P/krGB8aITs4bibCIhr/DxZJeFtNqF7kBq+MMupm3uBS6cb2Xc2K85RUEhTp6TgkWd0F4IvF5Za/j0g==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(82310400026)(36860700016)(11063799006)(56012099006)(261021123027099003)(261021121427099003)(261022075727099003)(261022105027099003)(261009223027099003)(261026140227099003)(261028144727099003)(261102123227099003)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	I0io+KiqcD44swmMEF0qDIraNar/TdAWFSHIr2C8qbhyLoj5tNUM4WfE68GFRIH+3MdZBTId9I8D689nmGgcLn4a1vZ++btQ42IxZfk0kFLGg7o+JQHzrR+N+mpFgnZ6hSySVVYuThamXvCPTEvfI+oSm9Xah1WihnsRZcm5/nNd2ADECVnG+V9ojoQ/afVx+8aI1/TKZ8vWnPTKtNZ1aKBUu3MjUdCUCIAcPYj+ODDxl+rAYDwom1h/nFaSTDX32LeXSgog8x8Y/0l+qsl9RC27aGcdnAWR7OronvMHNyKAW53pV/OSMg7zZSxMOi49jjRnhgsd7vhy9EmRu/4QS0AGatp93zmoO/w0aDxOgfpYz5e9OKtGXGMEtl37oaE+ilBWx3HoBHe21nOyABp9WOjWm53SH4a6ZSLktMx6yGrC4mgU0J+Gt5gQ778SowRn
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2026 19:32:12.1616
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c91edd2f-f4a7-4959-4efe-08df3dcefcb8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	PH3PEPF0005961A.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4036

From: Syed Saba Kareem <Syed.SabaKareem@amd.com>

From: Siva Subramanian Ravi Saravanan <sravisar@amd.com>

Add amd_sof_sdw_get_tplg_files() to build the list of SOF function
topologies from the card DAI links, so that a card can be formed from
per-function topologies instead of one monolithic topology per codec
configuration.

Signed-off-by: Siva Subramanian Ravi Saravanan <sravisar@amd.com>
Signed-off-by: Syed Saba Kareem <Syed.SabaKareem@amd.com>
---
 sound/soc/amd/acp/Makefile                    |   3 +-
 .../amd/acp/amd-sof-function-topology-lib.c   | 129 ++++++++++++++++++
 .../amd/acp/amd-sof-function-topology-lib.h   |  19 +++
 3 files changed, 150 insertions(+), 1 deletion(-)
 create mode 100644 sound/soc/amd/acp/amd-sof-function-topology-lib.c
 create mode 100644 sound/soc/amd/acp/amd-sof-function-topology-lib.h

diff --git a/sound/soc/amd/acp/Makefile b/sound/soc/amd/acp/Makefile
index 42e2bd34da06..91bbbeef5b8a 100644
--- a/sound/soc/amd/acp/Makefile
+++ b/sound/soc/amd/acp/Makefile
@@ -23,7 +23,8 @@ snd-acp70-y := acp70.o
 snd-acp-mach-y     := acp-mach-common.o
 snd-acp-legacy-mach-y     := acp-legacy-mach.o acp3x-es83xx/acp3x-es83xx.o
 snd-acp-sof-mach-y     := acp-sof-mach.o
-snd-soc-acpi-amd-match-y := amd-acp63-acpi-match.o amd-acp70-acpi-match.o amd-acp7x-acpi-match.o
+snd-soc-acpi-amd-match-y := amd-acp63-acpi-match.o amd-acp70-acpi-match.o amd-acp7x-acpi-match.o \
+	amd-sof-function-topology-lib.o
 snd-soc-acpi-amd-match-$(CONFIG_SND_SOC_ACPI_AMD_SDCA_QUIRKS) += soc-acpi-amd-sdca-quirks.o
 snd-acp-sdw-mach-y     := acp-sdw-mach-common.o
 snd-acp-sdw-sof-mach-y += acp-sdw-sof-mach.o
diff --git a/sound/soc/amd/acp/amd-sof-function-topology-lib.c b/sound/soc/amd/acp/amd-sof-function-topology-lib.c
new file mode 100644
index 000000000000..8d70d46d769e
--- /dev/null
+++ b/sound/soc/amd/acp/amd-sof-function-topology-lib.c
@@ -0,0 +1,129 @@
+// SPDX-License-Identifier: GPL-2.0-only
+//
+// Copyright(c) 2026 Advanced Micro Devices, Inc.
+//
+
+#include <linux/bits.h>
+#include <linux/device.h>
+#include <linux/errno.h>
+#include <linux/kernel.h>
+#include <linux/string.h>
+#include <sound/soc.h>
+#include <sound/soc-acpi.h>
+#include "amd-sof-function-topology-lib.h"
+
+#define SOF_AMD_PLATFORM_NAME_MAX 8
+#define SOF_AMD_SDW_MAX_LINKS 4
+
+static int get_sdw_link_num(struct device *dev, struct snd_soc_dai_link *dai_link,
+			    unsigned int *link_num)
+{
+	if (sscanf(dai_link->name, "SDW%u", link_num) != 1 ||
+	    *link_num >= SOF_AMD_SDW_MAX_LINKS) {
+		dev_err(dev, "Can't get SDW link from dai_link->name %s\n", dai_link->name);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+int amd_sof_sdw_get_tplg_files(struct snd_soc_card *card, const struct snd_soc_acpi_mach *mach,
+			       const char *prefix, const char ***tplg_files, bool best_effort)
+{
+	struct snd_soc_dai_link *dai_link;
+	char platform[SOF_AMD_PLATFORM_NAME_MAX];
+	unsigned long tplg_mask = 0;
+	int tplg_num = 0;
+	char *tplg_file;
+	int tplg_bit;
+	int tplg_dev;
+	int ret;
+	int i;
+
+	/* ACP SoundWire and PDM DAI configuration is platform dependent */
+	ret = snd_soc_acpi_get_platform_name(card, mach, platform);
+	if (ret < 0)
+		return ret;
+
+	/*
+	 * ACP SoundWire DAI index and stream names in the topologies are
+	 * specific to the SoundWire link, so the link number is part of the
+	 * SoundWire function names.
+	 */
+	for_each_card_prelinks(card, i, dai_link) {
+		unsigned int link_num = 0;
+		const char *tplg_dev_name;
+
+		dev_dbg(card->dev, "dai_link %s id %d\n", dai_link->name, dai_link->id);
+		if (strstr(dai_link->name, "SimpleJack")) {
+			ret = get_sdw_link_num(card->dev, dai_link, &link_num);
+			if (ret)
+				return ret;
+
+			tplg_dev = TPLG_DEVICE_ACP_SDW_JACK;
+			tplg_dev_name = devm_kasprintf(card->dev, GFP_KERNEL, "jack-l%u", link_num);
+			if (!tplg_dev_name)
+				return -ENOMEM;
+		} else if (strstr(dai_link->name, "SmartAmp")) {
+			ret = get_sdw_link_num(card->dev, dai_link, &link_num);
+			if (ret)
+				return ret;
+
+			tplg_dev = TPLG_DEVICE_ACP_SDW_AMP;
+			tplg_dev_name = devm_kasprintf(card->dev, GFP_KERNEL, "%damp-l%u",
+						       dai_link->num_cpus, link_num);
+			if (!tplg_dev_name)
+				return -ENOMEM;
+		} else if (strstr(dai_link->name, "SmartMic")) {
+			ret = get_sdw_link_num(card->dev, dai_link, &link_num);
+			if (ret)
+				return ret;
+
+			tplg_dev = TPLG_DEVICE_ACP_SDW_MIC;
+			tplg_dev_name = devm_kasprintf(card->dev, GFP_KERNEL, "mic-l%u", link_num);
+			if (!tplg_dev_name)
+				return -ENOMEM;
+		} else if (strstr(dai_link->name, "dmic")) {
+			/* ACP PDM DMIC is always stereo */
+			tplg_dev = TPLG_DEVICE_ACP_DMIC;
+			tplg_dev_name = "dmic-2ch";
+		} else {
+			/* The dai link is not supported by separated tplg yet */
+			dev_dbg(card->dev,
+				"dai_link %s is not supported by separated tplg yet\n",
+				dai_link->name);
+			if (best_effort)
+				continue;
+
+			return 0;
+		}
+
+		/* the same function on different links needs its own topology */
+		tplg_bit = (tplg_dev - TPLG_DEVICE_ACP_SDW_JACK) * SOF_AMD_SDW_MAX_LINKS + link_num;
+		if (tplg_mask & BIT(tplg_bit))
+			continue;
+
+		tplg_file = snd_soc_acpi_get_tplg_filename(card->dev, prefix, platform,
+							   tplg_dev_name, dai_link->id, tplg_dev);
+		if (!tplg_file)
+			return -ENOMEM;
+
+		/* Check presence of sub-topologies */
+		if (!snd_soc_acpi_tplg_files_exist(card->dev, tplg_file)) {
+			devm_kfree(card->dev, tplg_file);
+			if (best_effort)
+				continue;
+
+			return 0;
+		}
+
+		tplg_mask |= BIT(tplg_bit);
+
+		(*tplg_files)[tplg_num] = tplg_file;
+		tplg_num++;
+	}
+
+	dev_dbg(card->dev, "tplg_mask %#lx tplg_num %d\n", tplg_mask, tplg_num);
+
+	return tplg_num;
+}
diff --git a/sound/soc/amd/acp/amd-sof-function-topology-lib.h b/sound/soc/amd/acp/amd-sof-function-topology-lib.h
new file mode 100644
index 000000000000..cea49aa9c200
--- /dev/null
+++ b/sound/soc/amd/acp/amd-sof-function-topology-lib.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * amd-sof-function-topology-lib.h - get-tplg-files ops
+ *
+ * Copyright(c) 2026 Advanced Micro Devices, Inc.
+ */
+
+#ifndef __AMD_SOF_FUNCTION_TOPOLOGY_LIB_H
+#define __AMD_SOF_FUNCTION_TOPOLOGY_LIB_H
+
+#include <linux/types.h>
+
+struct snd_soc_acpi_mach;
+struct snd_soc_card;
+
+int amd_sof_sdw_get_tplg_files(struct snd_soc_card *card, const struct snd_soc_acpi_mach *mach,
+			       const char *prefix, const char ***tplg_files, bool best_effort);
+
+#endif
-- 
2.43.0

