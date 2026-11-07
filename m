Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.53.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794079728;
	b=OirrQpTc/Q3rz5fXb0b7S8PwQpo9JWxvZaS1G7Ohk93itJZczl/DwQhbapG75PL8vGXz
	 ME03D5yL7VmL0GdzMJT6rIoO+wqn3XZ7hz6pIdmuys1GGSqv1+w3KYuMEeur9MjL3Xizs
	 H4nGb7VxBiZ/oraU7zhWnE7H1CHLBklliCerGLVvYlO6/8EzslLVk66tsaZ2qyDITYMc9
	 G30WI1OoNnvUmINgh//804Xre5s0SvyRmjpcmFe2+EythwJFLXu97s+bWQTvCYJZMfD/5
	 uGq61+/XPm2j6PX2FqEfayJqkAYK9cmbb8tMhe64HH12nbxOTWs1Guquz7VksMYT9CQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794079728;
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
	b=iQT4O/m4odjzixsi/Qi30sxkapJwew1hL1gVLYHbhxoVVWUqMvFLqrafi5kQHEoHq/2+
	 TkqhNw/uEhfk+q5tdQyZVO8gkQTopS3hIHw/GjG1k3r3hS3g4Heilp66anvf0u27nbGgr
	 jrbmyyaa5iqGjV8SPtfyUy4/PS6rgxxtv87zBXZPos2UNklNoxBafXD6MpOVhPRaHmVUR
	 dZ2ZwWZQZOGJqbSMwc1A85MuY2Hgz53mLA2pdxkJA+Q83upzSbWl4qL5Ckq1ReVwe1R88
	 uqSPa9I1dX0UV0Vxj8EDF89zAZ1VAMhla3LsUfTK1iiy40bti8uyAbEl64T5JQPSXSQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b="x2R/B7y0";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.53.48
Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012048.outbound.protection.outlook.com [52.101.53.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46812606A338;
	Sat,  7 Nov 2026 19:28:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46812606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=x2R/B7y0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=meEmMDzAcm/iTLG3UMWNQ6g4d8suhKaDZ+JAUdappAzmqC3rCYdK9/LOsl6A+STvejsf6aQZXZeFLHNDx6yc8IwrPLWBG/k/MfHe/L2k3FyZjFpSwCo7iQK1jwfNRvFlbGohI4xe1UrWi3QjGMaZN7pmxlPUHkN+W+GNNiYa/WRpIWllKnRDBKFyLMNVjIMumbkyIYlGkLEVnUXbZEF8J1vW4rRcQ/Ai2wvyY1shYAnuIQjJRK1GDoSl5kwUe403Ad1LKhOU9V4EqpJHUjxUTKpfWPeZCdocquC3NmBR24KXgFq9kGXwmD69y83+apknTso7ja8gf3X+YFJAgJOJtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fn9Qk+/3NGgLtw+AumGFFjczHvZGt9urpzPszHSoE2o=;
 b=DRHPoDMPrV8tTmCHz3OcozpOeNgxL52zeYLm8sy4eFWwB9fFpwf8AM+bO8WdnwTxZUdtE5hEOzPH/rF9ucWgJa4jht9tV4Jzq4FHiz0gmEJm18oqseHSn3vw9cWQBjyHU4ikXl8VHe6qvSVYjiBl0qEihi9SZh3cSQwXDR+VdiAMbssews5sydIpg3vRzdaWBqf6BIPIs/8fuMg39N85zy3/14Ias9dbyxSKaKqug4vUXikZ0xo4p79qLKD4FEXsaXt2UgcaML/hm03uvJcwHvWwzMEY+NqM+LPV6D0r6VioKhpWt4TF7qTM18kTkL8LTlAsOLfwpzLQm1kVIb4mxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fn9Qk+/3NGgLtw+AumGFFjczHvZGt9urpzPszHSoE2o=;
 b=x2R/B7y0gzVYyn7c9ar6ckEeLczNTOigPbwXty32IUkz767wmI8DsWyWkT10CVOWGICqTLT24FS9Mp271noNBBFx6PU83yyCfFWF9aS4Sy8WNV4K063CWrrhovNv07Nx9FcJTFA6YPB0FLJP0ev9YONug1+BNY+jeAsGiYGua+w=
Received: from CYXPR03CA0046.namprd03.prod.outlook.com (2603:10b6:930:d2::19)
 by CHBPR12MB419055.namprd12.prod.outlook.com (2603:10b6:610:40c::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Sat, 7 Nov
 2026 19:28:41 +0000
Received: from CY5PEPF00000E7B.namprd02.prod.outlook.com
 (2603:10b6:930:d2:cafe::72) by CYXPR03CA0046.outlook.office365.com
 (2603:10b6:930:d2::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.11 via Frontend Transport; Sat, 7
 Nov 2026 19:28:40 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY5PEPF00000E7B.mail.protection.outlook.com (10.167.247.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Sat, 7 Nov 2026 19:28:40 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Sat, 7 Nov
 2026 13:28:40 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Sat, 7 Nov
 2026 13:28:39 -0600
Received: from amd-B550M-DS3H.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Sat, 7 Nov 2026 13:28:31 -0600
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
Subject: [PATCH v2 4/6] ASoC: amd: acp: add SOF function topology support
Date: Sun, 8 Nov 2026 00:57:00 +0530
Message-ID: <20261107192744.2027264-5-syed.sabakareem@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261107192744.2027264-1-syed.sabakareem@amd.com>
References: <20261107192744.2027264-1-syed.sabakareem@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY5PEPF00000E7B:EE_|CHBPR12MB419055:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c536cdf-4598-446a-2c2b-08df3d055446
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|36860700016|82310400026|261026140227099003|11063799006|261022075727099003|56012099006|261009223027099003|261022105027099003|261021121427099003|261021123027099003|261102123227099003|261028144727099003|18002099003|22082099003|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info:
	444slNlwNUdOkcWaH5IlZ21pFm7pscikd8+zDPESWYRI+A4e1iRF5fjNzlPPed/LZqHgjm59YBzLbEoq8HGRnfYrevN0j5A5xyCxgIJGUZ6hPhMl1GHPJHOpwo4vBSX9ze2gWlCsm7BZMmv78c7FNR9fGUZJNJC425feddfchVIHUWQ4zXdseqq2ZPaYehcekroHhZ5WI9Md3wfSWHkTMuXm53j2zaGaEGFc4V2ZRhE9e1zBBZQ4/b0Cg/D/aTfFvEUTeGpVRuEMxUPFfnjXKKhSBFXVM47tlYmQLkAdMI1e/eSvV0klO56vhG4kZQp6z4vNpgv6U1yWVivmx3ZSbxBkHdExbt8Xe5y0390kqTa6A9hP+nS9FxSeorvDegfpRUAumTAVTlbAe5/AwXxs28qYlWljcVM+f3n822HksPQfsdfJQTG3MH36mv8x22aQcjJwuj4217Lp/e2f6L9aAZG3gqtqjcuB819+Vny6Uyq+GEIpo0kNFTFg013froICQ+RdXs9dfc1xODZn1gX0tolbGUlBf2s3NRL9Wa3a2o2OGNB/hzAaoCYqBXbHziMFKnMCAq240cBEN9ghIafL8e34u74MGpFIcSgNG7lFkwc+tG+8v8CCzJRb73IORNywpV+Ejh8JvWWUc5KsABB4A+8E03XegTrs6Y8v3xtA6m1l+9lF5n1yadr2TTHbEXnWBP+/Z6FZ04OCEHRKuIVdcg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(36860700016)(82310400026)(261026140227099003)(11063799006)(261022075727099003)(56012099006)(261009223027099003)(261022105027099003)(261021121427099003)(261021123027099003)(261102123227099003)(261028144727099003)(18002099003)(22082099003)(6133799003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	PkSErOcqoHZ/N6Qd5hJt7Lyo0ayo1rXnkEmcHEX+OtT99CcO5BtTEg7Gtd/zEGMvef366yOo3YMdSbxP4as6X0m4jT/mzgt9yiLgghCxs97IL5VEwNX3CnvfLVhDuztH1W5X6Aq8vRJ6iza/mEjviedT+wbJUKSaM7BWwkpNP6H/G+ERiXp2hh85JYgMuPXBD971Vb0kHC53JvFfTEMljlubVcKk//3z4K3lAg3rWldzH34Peict5OSkUu8/JrevDtPnWOz/VK3z0OEpTpm6UJFOgGRPTSnxJTmi1PkTidC5kpT7cZRHM58JFg33lgY5nCNrJWJZwbZmStnWErDKEtDnoMR+ZU4Exm2N+sR/koLejyL8L1y39Wb1tFPE5sE4WAWjFcprh6RvotO3NNWM0PvYVa0qKn8IazdfGEgWEVkCw/6c5B7+8kRTFG48PGWD
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2026 19:28:40.7022
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c536cdf-4598-446a-2c2b-08df3d055446
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY5PEPF00000E7B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CHBPR12MB419055

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

