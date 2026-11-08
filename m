Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.201.5
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794166331;
	b=aLLEoBeVfIYRO0BeAvB464ewCALwxFxM6+JUlD3WL3afSGKi436uhlaLPmeqnQJO23Lj
	 6gOx39ctgicNdySJEUf8AvYysgxsAb5KH4HU6Dt0TqrTJbCHjFdqsOH4dxzqRax8tIyjH
	 6Xd61L26m/nVP4qL1qXZanorYrbfVNKChFuAzgrzub61g7H92Wmmc61Jh9mPHFYk09eZo
	 f6a6Fa1u0IL603Or1G945VF1NfA64hNQSYlRBsvRTP5bA4wVS5Qib5d9NnVLy7wO+Agew
	 ACpBd3Unm2GvSEwQcNOkuJxZkYZdo3wq720y/ZOZ6ezPeQXEtVDB1vb9TxCFpITf39A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794166331;
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
	bh=S+FbXYk8VTanI1z9R1MBXNyyT1qrf4uCRJAv52A3aeM=;
	b=0hGSqtzN9ucTvVZouHKdBptZbfPGX2/LPP1F7phnAW1NyVB1xXHIZe9hnLwvtz6UBWb/
	 S/ejocEHXpBgyYlC/FWEkSeXM+E2iVrsYR6mKHcNjEKn2xXTurGp18KMINF3wIfd6nYjj
	 YbBrKaCw9ewjRjmkVkcuf3H14qTOuaMr7lcuQq8BNDPsRdhLylwHeVWBHEE8J1iBL5AiJ
	 y+mOnj47cGe4OqKINikDfwN0T/Dit264CJRT3pTkvjWGB/3UxrXRu4Gp4CUd8ttbArgc/
	 P4n71a7trub+s+s9z1osSpQajEOPVBwTTTmIHdnnkDbUN9dYdtAZ0oVkuWUIbjOO3qA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=lpZfkIrj;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.201.5
Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013005.outbound.protection.outlook.com [40.93.201.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F367606A332;
	Sun,  8 Nov 2026 19:32:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F367606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=lpZfkIrj
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qwma8KInfh51V6nBoLOO08Ga4yJEJujuCgMW1cLMrpC4G2UfgAqQ2HR0e3J2VIn3DVttWnaY3/G93B9J3zDZqkLSajzkqCuw4me5DI4or8Gn8P7UHPRH4O6Qp7rN+vcigZt9JE8JEfg+N4tiEAMXBcO7U0hs1cVDDiYLMhgKhFnJWi+JiIz3bMlHCCAufCGNrsp3IS4QE0sYuh9rcJQUocUoFwcCL6J1yxNT6/9abBBI6pDWKTpxKq1xNU/Pf0hGPO0Erae03qxDPUykYLf24ZhYqdY4MztBGlQHc/k2zNLHhi2NqcIKvYk0/7Un37UwirFLwdxW5fQGyLDUtWKtxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S+FbXYk8VTanI1z9R1MBXNyyT1qrf4uCRJAv52A3aeM=;
 b=ITj9mmo3+o3+1O7H3dRP9AhdU4IP47pma3sb5JUogOjtopD25+IIkLd5Fq34mJVqRQQd71cY5hJojnyPmf0vxikqUfrNC8+oio3xSWm5YhKRmPTXFeSTy7/qXGCNsOkpWTDsgbAi/ThE1VtRsGO4UkLCbHTTHbG0JwciBKNONeRx267NVIOebASZrfPush9F4eCUeDMBzoyZ1zk3w7ENkgEoPkDUKoZA5ORMbGPwpQNCHWupGaNlwjovoHoadAd7KZ1QNEJQyRBtTZ5SEshes9TCxuumGPk/d6m2RZjka6meCJx8sA7Q8iDBRadiuyCeToCvVRi8goVpwaxz1E6WyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S+FbXYk8VTanI1z9R1MBXNyyT1qrf4uCRJAv52A3aeM=;
 b=lpZfkIrjalPcwBfXHwQURzbH3iiFBzBrgJJhBOJ3VrbAEC1SSwsC1hDrh8KDoeiPRrHOTFC0MKqWIL3BNDhKpXHEJ5e9X5b2Nuy4mniVTSc2ScbG+wS+cq1Zz4kafHWELDy5uqt61KupaFvfXM//Bh8ymS6jKRKugkVYr2j7kzc=
Received: from SJ0PR03CA0158.namprd03.prod.outlook.com (2603:10b6:a03:338::13)
 by PH7PR12MB7331.namprd12.prod.outlook.com (2603:10b6:510:20e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.12; Sun, 8 Nov
 2026 19:32:04 +0000
Received: from SJ1PEPF000037AA.namprd03.prod.outlook.com
 (2603:10b6:a03:338:cafe::3c) by SJ0PR03CA0158.outlook.office365.com
 (2603:10b6:a03:338::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Sun, 8
 Nov 2026 19:32:04 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ1PEPF000037AA.mail.protection.outlook.com (10.167.244.184) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Sun, 8 Nov 2026 19:32:04 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Sun, 8 Nov
 2026 13:31:52 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Sun, 8 Nov
 2026 13:31:52 -0600
Received: from amd-B550M-DS3H.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Sun, 8 Nov 2026 13:31:47 -0600
From: Syed Saba Kareem <syed.sabakareem@amd.com>
To: <broonie@kernel.org>
CC: <Sunil-kumar.Dommati@amd.com>, <vijendar.mukunda@amd.com>,
	<Mario.Limonciello@amd.com>, <venkataprasad.potturu@amd.com>, "Syed Saba
 Kareem" <Syed.SabaKareem@amd.com>, Siva Subramanian Ravi Saravanan
	<sravisar@amd.com>, Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela
	<perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Cezary Rojewski
	<cezary.rojewski@intel.com>, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>, Kai Vehmanen
	<kai.vehmanen@linux.intel.com>, Pierre-Louis Bossart
	<pierre-louis.bossart@linux.dev>, "open list:SOUND - SOC LAYER / DYNAMIC
 AUDIO POWER MANAGEM..." <linux-sound@vger.kernel.org>, open list
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v3 3/6] ASoC: soc-acpi: move common function topology helpers
Date: Mon, 9 Nov 2026 01:00:31 +0530
Message-ID: <20261108193119.2308421-4-syed.sabakareem@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF000037AA:EE_|PH7PR12MB7331:EE_
X-MS-Office365-Filtering-Correlation-Id: 0fe883f7-1023-4570-077d-08df3dcef828
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|7416014|1800799024|82310400026|36860700016|11063799006|56012099006|261021123027099003|261021121427099003|261022113327099003|261022075727099003|261022105027099003|261009223027099003|261026121527099003|261026140227099003|261028144727099003|261102130727099003|261102123227099003|10067099003|18002099003|22082099003|6133799003|13003099007;
X-Microsoft-Antispam-Message-Info:
	W4wD1GAAPaqX4zXSWLPDrHsh1XPYnH9VXPf5NNYWwDBaqTZSWYP/Dg7TJrahE4tcmwu8UfKJWSRo5w6e9pENRHnWhwLHbE2YEFUqqO7oyXIyjhNasTd28UIuPal6SiN5PU3zLj3NWvgNV/LGoiV5sfZn5XjxzlLQA/iA4y15A02LKHkTI8rjs8c4FGz4F2IvHGj4EeoCrRLb0Op+qgLnR7wgpLk9jTJ3bnfF3/xdTjIoEML4/TsDm4ryamsko+xGygR6lvwAoaZ9xUBGb3oDc9SR+GmxkdE5ErYj7QiwVimSSicpUHSMIJZuMuq7Z2MlkOIFDfYrvSjISyrH2XnoFbrylJeBpvUfrRFBDLlaG1QmwuEMF+QKFPf8npa1k1cbUDlq1gEbydKcfwPAvFyoDH04TGTewUlIJ2McbqF49L5cytDF9+v16T4xBoPPnATpAtpzhm23KGA7ELoIhk8GOr1G5P3Kbo0+mOb174/SBw92J9+Dj6Pk1S0B2SMuuzxt6DjxnoUJjUaz0rWQJilPLIXtgvY16tXN6aD5rye9NRJexp/PT/8c0n28ULz72mrVL4bZsXFHKh/Dd62L4t3EVQuN5rRxf5ZQU8r7/gcFzYHMRGxsZ6xDnYTixvTvAsVRB4XmF+9fvff0GDls1BwnObbWHQuptaABm1amYF/+Bua5hlEGNxR9e1iYrkMH/7ZsWRMJReslwsMzirQQRkTV5Q==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(1800799024)(82310400026)(36860700016)(11063799006)(56012099006)(261021123027099003)(261021121427099003)(261022113327099003)(261022075727099003)(261022105027099003)(261009223027099003)(261026121527099003)(261026140227099003)(261028144727099003)(261102130727099003)(261102123227099003)(10067099003)(18002099003)(22082099003)(6133799003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	iPIn9D9O0e9yIAGq7rYXDwe5mChXlcz6BXHpRJE5frCBnaFSw+RT2d42cumL+U8jgVIRKW1qsHjdCfVqYvm5e4z07xV0tfOwCFMdjUqI19uGgmFUE3uZN1qenHLVXxEtuFb3ra4xMlNi/7FLC5MfljXZHoTvTYFTYFcJLxff3bW+SHnx6RGufi4pi9u4DlJs5x0soKhlOJJ7P3ToWUD3a4Eh5YeVHxSQyFOpj4kXfcq4Aav0WUwwxFq3iK8f+4tzKxHghwIZexh4tTNbQmxqXxJ5R67fV7Xp+93TPZEO6t2wfua7ouOPIroOWIvTe8Zd/GnDXkEqo+J1dJ0wK5sa67MVWJiGFvdNvgzD1/DElqmRzxxAa50i2h+IkLI5DzqDhnK6du3XYdhfWfZnIWdJk8IZETrlYU3OUAVJDapuPG1tKFnj082Hjx7JvMAjmMK7
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2026 19:32:04.4798
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fe883f7-1023-4570-077d-08df3dcef828
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000037AA.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7331

From: Syed Saba Kareem <Syed.SabaKareem@amd.com>

From: Siva Subramanian Ravi Saravanan <sravisar@amd.com>

Move the Intel function topology helpers and the topology device enum
to soc-acpi so that they can be shared with other platforms too. The
moved helpers are:
 - get_platform_name() as snd_soc_acpi_get_platform_name()
 - tplg_files_exist() as snd_soc_acpi_tplg_files_exist()
 - get_tplg_filename() as snd_soc_acpi_get_tplg_filename()

As the helpers now live in the snd-soc-acpi module, the Intel match
code that calls them must always link against it. Select SND_SOC_ACPI
unconditionally instead of only when ACPI is enabled, otherwise the
build fails on non-ACPI configs with the helpers reported as undefined
symbols.

No functional change for Intel.

Signed-off-by: Siva Subramanian Ravi Saravanan <sravisar@amd.com>
Signed-off-by: Syed Saba Kareem <Syed.SabaKareem@amd.com>
---
 include/sound/soc-acpi.h                      | 25 +++++
 sound/soc/intel/Kconfig                       |  2 +-
 .../intel/common/sof-function-topology-lib.c  | 93 ++-----------------
 sound/soc/soc-acpi.c                          | 73 +++++++++++++++
 4 files changed, 107 insertions(+), 86 deletions(-)

diff --git a/include/sound/soc-acpi.h b/include/sound/soc-acpi.h
index 2ee303b791dc..aea47a42f43d 100644
--- a/include/sound/soc-acpi.h
+++ b/include/sound/soc-acpi.h
@@ -257,4 +257,29 @@ bool snd_soc_acpi_sdw_link_slaves_found(struct device *dev,
 					const struct snd_soc_acpi_link_adr *link,
 					struct sdw_peripherals *peripherals);
 
+enum tplg_device_id {
+	TPLG_DEVICE_SDCA_JACK,
+	TPLG_DEVICE_SDCA_AMP,
+	TPLG_DEVICE_SDCA_MIC,
+	TPLG_DEVICE_INTEL_PCH_DMIC,
+	TPLG_DEVICE_HDMI,
+	TPLG_DEVICE_SSP_JACK,
+	TPLG_DEVICE_SSP_AMP,
+	TPLG_DEVICE_SSP_BT,
+	TPLG_DEVICE_SSP_HDMI_IN,
+	TPLG_DEVICE_LOOPBACK_VIRTUAL,
+	TPLG_DEVICE_ACP_SDW_JACK,
+	TPLG_DEVICE_ACP_SDW_AMP,
+	TPLG_DEVICE_ACP_SDW_MIC,
+	TPLG_DEVICE_ACP_DMIC,
+	TPLG_DEVICE_MAX
+};
+
+int snd_soc_acpi_get_platform_name(struct snd_soc_card *card,
+				   const struct snd_soc_acpi_mach *mach, char *platform);
+bool snd_soc_acpi_tplg_files_exist(struct device *dev, const char *tplg_files);
+char *snd_soc_acpi_get_tplg_filename(struct device *dev, const char *prefix,
+				     const char *platform, const char *tplg_dev_name,
+				     int dai_link_id, int tplg_dev);
+
 #endif
diff --git a/sound/soc/intel/Kconfig b/sound/soc/intel/Kconfig
index 63367364916a..af08efa0ac1d 100644
--- a/sound/soc/intel/Kconfig
+++ b/sound/soc/intel/Kconfig
@@ -72,7 +72,7 @@ if SND_SOC_INTEL_SST_TOPLEVEL || SND_SOC_SOF_INTEL_TOPLEVEL
 
 config SND_SOC_ACPI_INTEL_MATCH
 	tristate
-	select SND_SOC_ACPI if ACPI
+	select SND_SOC_ACPI
 	select SND_SOC_ACPI_INTEL_SDCA_QUIRKS
 	# this option controls the compilation of ACPI matching tables and
 	# helpers and is not meant to be selected by the user.
diff --git a/sound/soc/intel/common/sof-function-topology-lib.c b/sound/soc/intel/common/sof-function-topology-lib.c
index 57e089f8e721..413d6f11a00e 100644
--- a/sound/soc/intel/common/sof-function-topology-lib.c
+++ b/sound/soc/intel/common/sof-function-topology-lib.c
@@ -13,88 +13,11 @@
 #include <sound/soc-acpi.h>
 #include "sof-function-topology-lib.h"
 
-enum tplg_device_id {
-	TPLG_DEVICE_SDCA_JACK,
-	TPLG_DEVICE_SDCA_AMP,
-	TPLG_DEVICE_SDCA_MIC,
-	TPLG_DEVICE_INTEL_PCH_DMIC,
-	TPLG_DEVICE_HDMI,
-	TPLG_DEVICE_SSP_JACK,
-	TPLG_DEVICE_SSP_AMP,
-	TPLG_DEVICE_SSP_BT,
-	TPLG_DEVICE_SSP_HDMI_IN,
-	TPLG_DEVICE_LOOPBACK_VIRTUAL,
-	TPLG_DEVICE_MAX
-};
-
 #define SDCA_DEVICE_MASK (BIT(TPLG_DEVICE_SDCA_JACK) | BIT(TPLG_DEVICE_SDCA_AMP) | \
 			  BIT(TPLG_DEVICE_SDCA_MIC))
 
 #define SOF_INTEL_PLATFORM_NAME_MAX 4
 
-static int get_platform_name(struct snd_soc_card *card,
-			     const struct snd_soc_acpi_mach *mach, char *platform)
-{
-	int ret;
-
-	ret = sscanf(mach->sof_tplg_filename, "sof-%3s-*.tplg", platform);
-	if (ret != 1) {
-		dev_err(card->dev, "Invalid platform name of tplg %s\n",
-			mach->sof_tplg_filename);
-		return -EINVAL;
-	}
-
-	return 0;
-}
-
-static bool tplg_files_exist(struct device *dev, const char *tplg_files)
-{
-	const struct firmware *fw;
-	int ret;
-
-	ret = firmware_request_nowarn(&fw, tplg_files, dev);
-	if (!ret) {
-		release_firmware(fw);
-		return true;
-	}
-
-	dev_warn(dev,
-		 "Failed to open topology file: %s, you might need to\n",
-		 tplg_files);
-	dev_warn(dev,
-		 "download it from https://github.com/thesofproject/sof-bin/\n");
-	return false;
-}
-
-static char *get_tplg_filename(struct device *dev, const char *prefix,
-			       const char *platform, const char *tplg_dev_name,
-			       int dai_link_id, int tplg_dev)
-{
-	char *filename = NULL;
-
-	/*
-	 * The tplg file naming rule is sof-<platform>-<function>-id<BE id number>.tplg
-	 * where <platform> is required for functions that depend on NHLT blobs (e.g. DMIC/SSP)
-	 * as the nhlt blob is platform dependent.
-	 */
-	switch (tplg_dev) {
-	case TPLG_DEVICE_INTEL_PCH_DMIC:
-	case TPLG_DEVICE_SSP_JACK:
-	case TPLG_DEVICE_SSP_AMP:
-	case TPLG_DEVICE_SSP_BT:
-	case TPLG_DEVICE_SSP_HDMI_IN:
-		filename = devm_kasprintf(dev, GFP_KERNEL, "%s/sof-%s-%s-id%d.tplg",
-					  prefix, platform, tplg_dev_name, dai_link_id);
-		break;
-	default:
-		filename = devm_kasprintf(dev, GFP_KERNEL, "%s/sof-%s-id%d.tplg",
-					  prefix, tplg_dev_name, dai_link_id);
-		break;
-	}
-
-	return filename;
-}
-
 static int get_dmic_tplg_dev(struct device *dev, int dmic_num,
 			     int *tplg_dev, char **tplg_dev_name)
 {
@@ -182,7 +105,7 @@ int sof_sdw_get_tplg_files(struct snd_soc_card *card, const struct snd_soc_acpi_
 	int ret;
 	int i;
 
-	ret = get_platform_name(card, mach, platform);
+	ret = snd_soc_acpi_get_platform_name(card, mach, platform);
 	if (ret < 0)
 		return ret;
 
@@ -235,13 +158,13 @@ int sof_sdw_get_tplg_files(struct snd_soc_card *card, const struct snd_soc_acpi_
 		if (tplg_mask & BIT(tplg_dev))
 			continue;
 
-		tplg_file = get_tplg_filename(card->dev, prefix, platform, tplg_dev_name,
-					      dai_link->id, tplg_dev);
+		tplg_file = snd_soc_acpi_get_tplg_filename(card->dev, prefix, platform,
+							   tplg_dev_name, dai_link->id, tplg_dev);
 		if (!tplg_file)
 			return -ENOMEM;
 
 		/* Check presence of sub-topologies */
-		if (!tplg_files_exist(card->dev, tplg_file)) {
+		if (!snd_soc_acpi_tplg_files_exist(card->dev, tplg_file)) {
 			devm_kfree(card->dev, tplg_file);
 			if (best_effort)
 				continue;
@@ -275,7 +198,7 @@ int sof_i2s_get_tplg_files(struct snd_soc_card *card, const struct snd_soc_acpi_
 	int ret;
 	int i;
 
-	ret = get_platform_name(card, mach, platform);
+	ret = snd_soc_acpi_get_platform_name(card, mach, platform);
 	if (ret < 0)
 		return ret;
 
@@ -307,13 +230,13 @@ int sof_i2s_get_tplg_files(struct snd_soc_card *card, const struct snd_soc_acpi_
 		if (tplg_mask & BIT(tplg_dev))
 			continue;
 
-		tplg_file = get_tplg_filename(card->dev, prefix, platform, tplg_dev_name,
-					      dai_link->id, tplg_dev);
+		tplg_file = snd_soc_acpi_get_tplg_filename(card->dev, prefix, platform,
+							   tplg_dev_name, dai_link->id, tplg_dev);
 		if (!tplg_file)
 			return -ENOMEM;
 
 		/* Check presence of sub-topologies */
-		if (!tplg_files_exist(card->dev, tplg_file)) {
+		if (!snd_soc_acpi_tplg_files_exist(card->dev, tplg_file)) {
 			devm_kfree(card->dev, tplg_file);
 			if (best_effort)
 				continue;
diff --git a/sound/soc/soc-acpi.c b/sound/soc/soc-acpi.c
index 270f9777942f..7e9d7b3c6b32 100644
--- a/sound/soc/soc-acpi.c
+++ b/sound/soc/soc-acpi.c
@@ -4,7 +4,9 @@
 //
 // Copyright (c) 2013-15, Intel Corporation.
 
+#include <linux/device.h>
 #include <linux/export.h>
+#include <linux/firmware.h>
 #include <linux/module.h>
 #include <sound/soc-acpi.h>
 
@@ -200,5 +202,76 @@ bool snd_soc_acpi_sdw_link_slaves_found(struct device *dev,
 }
 EXPORT_SYMBOL_GPL(snd_soc_acpi_sdw_link_slaves_found);
 
+int snd_soc_acpi_get_platform_name(struct snd_soc_card *card,
+				   const struct snd_soc_acpi_mach *mach, char *platform)
+{
+	int ret;
+
+	/* platform must hold at least 8 bytes */
+	ret = sscanf(mach->sof_tplg_filename, "sof-%7[^-]-*.tplg", platform);
+	if (ret != 1) {
+		dev_err(card->dev, "Invalid platform name of tplg %s\n",
+			mach->sof_tplg_filename);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(snd_soc_acpi_get_platform_name);
+
+bool snd_soc_acpi_tplg_files_exist(struct device *dev, const char *tplg_files)
+{
+	const struct firmware *fw;
+	int ret;
+
+	ret = firmware_request_nowarn(&fw, tplg_files, dev);
+	if (!ret) {
+		release_firmware(fw);
+		return true;
+	}
+
+	dev_warn(dev,
+		 "Failed to open topology file: %s, you might need to\n",
+		 tplg_files);
+	dev_warn(dev,
+		 "download it from https://github.com/thesofproject/sof-bin/\n");
+	return false;
+}
+EXPORT_SYMBOL_GPL(snd_soc_acpi_tplg_files_exist);
+
+char *snd_soc_acpi_get_tplg_filename(struct device *dev, const char *prefix,
+				     const char *platform, const char *tplg_dev_name,
+				     int dai_link_id, int tplg_dev)
+{
+	char *filename = NULL;
+
+	/*
+	 * The tplg file naming rule is sof-<platform>-<function>-id<BE id number>.tplg
+	 * where <platform> is required for functions that depend on NHLT blobs (e.g. DMIC/SSP)
+	 * as the nhlt blob is platform dependent.
+	 */
+	switch (tplg_dev) {
+	case TPLG_DEVICE_INTEL_PCH_DMIC:
+	case TPLG_DEVICE_SSP_JACK:
+	case TPLG_DEVICE_SSP_AMP:
+	case TPLG_DEVICE_SSP_BT:
+	case TPLG_DEVICE_SSP_HDMI_IN:
+	case TPLG_DEVICE_ACP_SDW_JACK:
+	case TPLG_DEVICE_ACP_SDW_AMP:
+	case TPLG_DEVICE_ACP_SDW_MIC:
+	case TPLG_DEVICE_ACP_DMIC:
+		filename = devm_kasprintf(dev, GFP_KERNEL, "%s/sof-%s-%s-id%d.tplg",
+					  prefix, platform, tplg_dev_name, dai_link_id);
+		break;
+	default:
+		filename = devm_kasprintf(dev, GFP_KERNEL, "%s/sof-%s-id%d.tplg",
+					  prefix, tplg_dev_name, dai_link_id);
+		break;
+	}
+
+	return filename;
+}
+EXPORT_SYMBOL_GPL(snd_soc_acpi_get_tplg_filename);
+
 MODULE_LICENSE("GPL v2");
 MODULE_DESCRIPTION("ALSA SoC ACPI module");
-- 
2.43.0

