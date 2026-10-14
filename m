Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010053.outbound.protection.outlook.com [52.101.85.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE59A47884D;
	Wed, 14 Oct 2026 10:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791972611; cv=fail; b=de++KIye0WcRNIlVAYW9fBu6L4ekF6tw/KDNl6jQdOPToVojVLO1l/uKoV3aNWWAm4eN22ghi1dDR4sE+/yAA/A2oeSHaCaO4WHNg5YQ1IoSnVfjPSu0yh/2MiOos5rHUpkoyQwM9s+bbxE/kyEuNY668YkoHr+iIoigIqJBxTs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791972611; c=relaxed/simple;
	bh=jWvvmMYMRXHpEAlMKD6TTSrSgvKWy5PurfZW8LK+QLI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VwYF4dbrqTSXGPHqFSFcS+D5dVq7XBRyh5+Wbd77o+z69W7SioDP54zohm64+36z/zETqwfpkxxC9uj/+puxlymahIBqa+ooCKhY9ZjWCGBqZ4ybVx6Hu5smonAzkcwlcUQTOJGo+dZprvQpIKu5BTsS1xdvHQ/kxFk7EMHX6B0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Gt14L9Tk; arc=fail smtp.client-ip=52.101.85.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Gt14L9Tk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HQkCw2jQh324ZOe17YLKDJC2Ra6HZauGP6jI0HsVql/EjrG0aRo5w3PGunQcn3YUfXvFmbH+kh8EwAIb2TUaC7OIBuC66kgpaOmmcJ3l/uIbdMBT1FOWvLjFU7AENY+fMn63MZcg9VQkLdJHKuQ1nkc605ge5Ws+bXmoXnLqMHTZ3NxqJLUvOXhetFUd2vkmell8IWy4otwQtVjcU729EtdP5lt9SDLAcLyUqXJXjf/OkFHV2c+R5bjnjvOcIL/vwGS7wnSreqzRGQOSQRGBQrGy6aeoo7ZSO/3dXZoMC8HpXYLY5gFhvLVTBhAb/Brhy+3flQSS44tXv9oect+X8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8w50jiJdV9jvJwvRxJMO4GNxf8MdWXUmTipDcS4/sh4=;
 b=jADTRbDKoyMgsvc22FwqoDq+c2UffF2uk/RGX7fDhAPIIlxO/bNYHPsz/ipjK8BW9RL7hjvOQGrQgDQWo1GnC7zJdvCyMnsb86urZSBlBNU0Kw3GezKUtNMepaNPla3A0v3cWq4NvnKY18gS2sVQ7oSBlpbzGrEutI2V3ZAuXCTsSpNZS5MyenC0DutJe0MIFHB5XuiGK1kZeTpDRHqQ/pOSIbWP6/68NwUdTNW8uWTo6uotOs3QKaS6oseuNpQka8F3OrXyyAFNVMNUF0KWzEc8M7YY3HOBlldkDJh+Ac7AYh764NVC1m3U5wyZWNcLihd690TV4Nskg0F4EZz0Fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8w50jiJdV9jvJwvRxJMO4GNxf8MdWXUmTipDcS4/sh4=;
 b=Gt14L9TkCPxRltYxkrGtdhnj6ACxmLAYPL+j1gLjlXSR0kvABJ0X3i2aVRfp3xCB3ea10+FItjY/wmdYtGNksd/PIpzATnwwy6gmv9xuElzAM0pblZ0dOe38Y2tnGPidiwl1Hknh/NTGNfgBgUca13b0CUsEHgODashjB9swSWQ=
Received: from CH5P222CA0021.NAMP222.PROD.OUTLOOK.COM (2603:10b6:610:1ee::10)
 by BY5PR12MB4324.namprd12.prod.outlook.com (2603:10b6:a03:209::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Wed, 14 Oct
 2026 10:10:06 +0000
Received: from CH3PEPF00000009.namprd04.prod.outlook.com
 (2603:10b6:610:1ee:cafe::2a) by CH5P222CA0021.outlook.office365.com
 (2603:10b6:610:1ee::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.4 via Frontend Transport; Wed, 14
 Oct 2026 10:10:06 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CH3PEPF00000009.mail.protection.outlook.com (10.167.244.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Wed, 14 Oct 2026 10:10:06 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Wed, 14 Oct
 2026 05:10:00 -0500
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53
 via Frontend Transport; Wed, 14 Oct 2026 05:09:56 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <lgirdwood@gmail.com>, <perex@perex.cz>,
	<tiwai@suse.com>, <yung-chuan.liao@linux.intel.com>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, <Richard.Gong@amd.com>,
	<Vijendar.Mukunda@amd.com>, <Poojitha.N@amd.com>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<sound-open-firmware@alsa-project.org>
Subject: [PATCH v2 01/10] ASoC: SOF: amd: rename acp7x machine table and descriptor to acp7f
Date: Wed, 14 Oct 2026 15:29:09 +0530
Message-ID: <20261014100902.1215212-2-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20261014100902.1215212-1-Vijendar.Mukunda@amd.com>
References: <20261014100902.1215212-1-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH3PEPF00000009:EE_|BY5PR12MB4324:EE_
X-MS-Office365-Filtering-Correlation-Id: e625a973-1af6-4dbc-e04a-08df29db5240
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|23010399003|1800799024|376014|6133799003|10067099003|18002099003|22082099003|11063799006|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	0IwXVWOmJwg9fusZdV2LXcMsE75vlWCXjOC31tEZYlw6Lr6qXJ0SedFXdYz//kLG611nNbWUT2SH6HqBfNbrfFshepz/LDLPop1ddBDGgUdrRaLsr5un9OMw5sVAuxbsVulXpBoOdM5AC0MzhxQLy8tP3aRZbdjESyJJXbdFeMJoVnEaLhNiMSgFasV68s6QrgzSmRZ1B4Y6yrM4VC+aZGwwqQRhlu8MhRBpCVz/S+Kd864CO7LD81vem/vU0SUbsmWVPOU/le4Du69RrNWg09GtuV2vzg9AWJ3zpsBcErv/6ligpL1iggJ0Lqg8aXuSXHzgLqjt2u8Q7YSofosdxABXXclbvuK0m9zDqQeNhVUHS3mUOAqHTgv7Pw0vwZwA22kxsP7gngYWIEDKgf2z8LWTfaHaywkSISLBCvBB1wJTj1Ed1S9r2hPIq8kvPz8oztZWEA8Bep9bBI7dm8HbF/3pb02Kyzzu9ei1DubkkGza4KcQkVP3vbx5aO/cn7yekerEcZu1rrGndaxuDyEaQBa9cyeNAhAC2lve6uJbltoEnNwSRDLYkWsXYJNkl8QV1aR/uJzxqIZ/POuUezzoFmOtBXz1YE6bhemlduawjxzqtsZ2QRTB6tIlTx2NRwlL+5hreYo/HZe/DmQjuUtrhl5yVj8SN2CselEYfpcYszTCsrVQH3KPoyMEmACTVJ+AvkrF5V9JNVAmWepDflTYAA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(23010399003)(1800799024)(376014)(6133799003)(10067099003)(18002099003)(22082099003)(11063799006)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	5OSDEBAHcifG1l7S14aonTZ7OCJbmSs2PFVkB0dnw17wpCHYDOj0ZVdeB44kSPuG0+nF2Mr312YeRpC4a6HYJeN4/z1ScE0KjQxkS/QJB/v7hm99jl9j4FRS4odd0JRzWW9ysRt5Criq+v2WSaDEUNH9q+2bnjgijhGhyFFF+V8gahziAVvNsVcWIdJSkr5vezLHjg8x2c042B26FKm4/TaanA7ACC5oI4PSTFwAH4vcA6KUygW11gLP4g0IaxRSQSBL+fVNpX10dQtoCFnn3W8xVMHjyqvEGFeuTmpnvAUvZGflElb7s+KqtnNoOXZCdMi1BnvF+cmOLAuHv+1caQC+aZaRmxi73Um6kqSIZnCB9e+MFxXOiU9BPTRdVFhXr10OVFvZwW5lYR0IqnOHCYYhcOWhL4Fd7Q4r1Ks9V+RCghA4MjjNwGhs4ThH1Gbw
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2026 10:10:06.4166
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e625a973-1af6-4dbc-e04a-08df29db5240
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF00000009.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4324

The existing acp7x machine table, chip descriptor, firmware, and
topology files all target ACP7.F hardware. Rename them to acp7f
to reflect the actual hardware variant.

No functional change.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/acp-config.c    | 10 +++++-----
 sound/soc/amd/mach-config.h   |  2 +-
 sound/soc/sof/amd/pci-acp7x.c | 14 +++++++-------
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/sound/soc/amd/acp-config.c b/sound/soc/amd/acp-config.c
index 3d48bb0f100f2..d40600e12d4f0 100644
--- a/sound/soc/amd/acp-config.c
+++ b/sound/soc/amd/acp-config.c
@@ -428,17 +428,17 @@ struct snd_soc_acpi_mach snd_soc_acpi_amd_acp70_sof_machines[] = {
 };
 EXPORT_SYMBOL(snd_soc_acpi_amd_acp70_sof_machines);
 
-struct snd_soc_acpi_mach snd_soc_acpi_amd_acp7x_sof_machines[] = {
+struct snd_soc_acpi_mach snd_soc_acpi_amd_acp7f_sof_machines[] = {
 	{
 		.id = "AMDI1010",
-		.drv_name = "acp7x-dsp",
+		.drv_name = "acp7f-dsp",
 		.pdata = &acp_quirk_data,
-		.fw_filename = "sof-acp7x.ri",
-		.sof_tplg_filename = "sof-acp7x.tplg",
+		.fw_filename = "sof-acp7f.ri",
+		.sof_tplg_filename = "sof-acp7f.tplg",
 	},
 	{},
 };
-EXPORT_SYMBOL(snd_soc_acpi_amd_acp7x_sof_machines);
+EXPORT_SYMBOL(snd_soc_acpi_amd_acp7f_sof_machines);
 
 MODULE_DESCRIPTION("AMD ACP Machine Configuration Module");
 MODULE_LICENSE("Dual BSD/GPL");
diff --git a/sound/soc/amd/mach-config.h b/sound/soc/amd/mach-config.h
index b602a983feb7f..2dafd742dc01c 100644
--- a/sound/soc/amd/mach-config.h
+++ b/sound/soc/amd/mach-config.h
@@ -28,7 +28,7 @@ extern struct snd_soc_acpi_mach snd_soc_acpi_amd_acp63_sof_sdw_machines[];
 extern struct snd_soc_acpi_mach snd_soc_acpi_amd_acp70_sof_machines[];
 extern struct snd_soc_acpi_mach snd_soc_acpi_amd_acp70_sdw_machines[];
 extern struct snd_soc_acpi_mach snd_soc_acpi_amd_acp70_sof_sdw_machines[];
-extern struct snd_soc_acpi_mach snd_soc_acpi_amd_acp7x_sof_machines[];
+extern struct snd_soc_acpi_mach snd_soc_acpi_amd_acp7f_sof_machines[];
 
 struct config_entry {
 	u32 flags;
diff --git a/sound/soc/sof/amd/pci-acp7x.c b/sound/soc/sof/amd/pci-acp7x.c
index 0594c1f3deb6b..5949aefe26bc3 100644
--- a/sound/soc/sof/amd/pci-acp7x.c
+++ b/sound/soc/sof/amd/pci-acp7x.c
@@ -26,8 +26,8 @@
 #define ACP7X_REG_START			0x1240000
 #define ACP7X_REG_END			0x125C000
 
-static const struct sof_amd_acp_desc acp7x_chip_info = {
-	.name		= "acp7x",
+static const struct sof_amd_acp_desc acp7f_chip_info = {
+	.name		= "acp7f",
 	.pgfsm_base	= ACP7X_PGFSM_BASE,
 	.ext_intr_enb	= ACP6X_EXTERNAL_INTR_ENB,
 	.ext_intr_cntl	= ACP7X_EXTERNAL_INTR_CNTL,
@@ -45,13 +45,13 @@ static const struct sof_amd_acp_desc acp7x_chip_info = {
 	.reg_end_addr	= ACP7X_REG_END,
 };
 
-static const struct sof_dev_desc acp7x_desc = {
-	.machines		= snd_soc_acpi_amd_acp7x_sof_machines,
+static const struct sof_dev_desc acp7f_desc = {
+	.machines		= snd_soc_acpi_amd_acp7f_sof_machines,
 	.resindex_lpe_base	= 0,
 	.resindex_pcicfg_base	= -1,
 	.resindex_imr_base	= -1,
 	.irqindex_host_ipc	= -1,
-	.chip_info		= &acp7x_chip_info,
+	.chip_info		= &acp7f_chip_info,
 	.ipc_supported_mask	= BIT(SOF_IPC_TYPE_3),
 	.ipc_default		= SOF_IPC_TYPE_3,
 	.default_fw_path	= {
@@ -61,7 +61,7 @@ static const struct sof_dev_desc acp7x_desc = {
 		[SOF_IPC_TYPE_3] = "amd/sof-tplg",
 	},
 	.default_fw_filename	= {
-		[SOF_IPC_TYPE_3] = "sof-acp7x.ri",
+		[SOF_IPC_TYPE_3] = "sof-acp7f.ri",
 	},
 	.nocodec_tplg_filename	= "sof-acp.tplg",
 	.ops			= &sof_acp7x_ops,
@@ -95,7 +95,7 @@ static void acp7x_pci_remove(struct pci_dev *pci)
 /* PCI IDs */
 static const struct pci_device_id acp7x_pci_ids[] = {
 	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, ACP_PCI_DEV_ID),
-	.driver_data = (unsigned long)&acp7x_desc},
+	.driver_data = (unsigned long)&acp7f_desc},
 	{ 0, }
 };
 MODULE_DEVICE_TABLE(pci, acp7x_pci_ids);
-- 
2.48.1

