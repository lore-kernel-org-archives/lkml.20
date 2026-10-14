Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010029.outbound.protection.outlook.com [40.93.198.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8380F4E36FE;
	Wed, 14 Oct 2026 10:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791972658; cv=fail; b=J4JnPj0ewb8wS/SYINO5D9UHbAbSFZCGHTntVnIdlv0k/C3u6ffGqlwwERz7NwZ56eFGrjcUAiOoc4OwlzdIKHRGkeHjvqfr9OwMTow7CQY1vHWCHiWVvuwCqwzjDz2SOoeHHd+MKGF5g61DxT0wIeedHno3qYyCqvTVRzerncA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791972658; c=relaxed/simple;
	bh=SKEhg/EOItaMFJmuNdSF6RZF3tZqZja/6UCXp1Xrv1g=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iY6Da5dWxNXZ9ObP3vbVaKxNLgsR+Ffm/wVmgOwswI7ktfbbnCE+Sb6nFU+mFl28mGmF1zV52pRUmeozy5Le/TJiF97JMsUINBkwyQswSh26ykhHCBJw4A6b7O7TIoKhLCnt1R/5WuCSXySvcIufIGwpjdUgMRF/7V7LAMXFwxA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=t/JBDuX2; arc=fail smtp.client-ip=40.93.198.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="t/JBDuX2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y04S7Tuk/sXp78qOf7xLOeyerfIv+DCrISgQDADhLlc3lhup12M/rmG2Gc6RezZIF4l0gPj0VHCRWNt9wYV/153Jgp9OkYqA4EZKJdhAC+FOrDo6L3fnFO9g3DZH/7nxK1b2XitPoqVhN0KXOk+ynch4wuuW+gizFyAvz8d+QlQrainynT1VvuzMATiFksut1yfbvdieXopLw+k/LLBvvd65mGs4K4aP/cRFMyYVlPkHV9f4BagLa82+cEYC+LaOmg2EQF4f+w5CpVLnPJn241xygTxHXO8HKZVoFl9rZr7xwUEy1lKiXO7XyAwacb5tk7Uk36BWMTZ8dYaNbMwHbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AeLjOxTFKbnmYOoEGl+7opD1qnar+gMGoxfbal3GB7g=;
 b=cud4qo6D3KS/gOZbjZDrUClq88pTSGtFV8oYASn6GyFxfqBjeJOriiOVsnzY1obp8IZIfAq2uKOYvwYEWOygon33zkbwGQs+WRT5xbrBkQV65o12kUsL1DYn+dc+VOvHQbI221w8x4i8qBYuktTbujNmdVLtpe8GAN32d8yWsK3vvDIvy9eXYcAj6C1yDsLTvYqwx2+f/PNKi+AF8RVsqz9ysavcodkiCTRMdoFouqjatsROFoyS1WWqegt/xSFLv4t7C0GnScHaZAwOXCtwuCkQX/WSiFzeuy4D3D+5WB1K1rhDVSOKz77Dm1CBcgU0bSGJYD6ZwDbqc/9cR726Jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AeLjOxTFKbnmYOoEGl+7opD1qnar+gMGoxfbal3GB7g=;
 b=t/JBDuX2L5NOnwukhAMXLKCM/vTBQsiFMSFyjGUs093Vjks81Y+tDLKvNsRRvMJm9whmACQd/zcnyVStC6/YS1b3H+LbWEVzjbHCWwRR+W+8QWWIEZ2Iu6snd5GXn0wR2KIgmGUeL9t1cfhZYEdmALAQSj3lgqIIWG4Tb4ieM9k=
Received: from RI1P284CA0032.BRAP284.PROD.OUTLOOK.COM (2603:10d6:10:154::16)
 by DS4PR12MB004847.namprd12.prod.outlook.com (2603:10b6:8:502::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.12; Wed, 14 Oct
 2026 10:10:45 +0000
Received: from BN2PEPF0000449E.namprd02.prod.outlook.com
 (2603:10d6:10:154:cafe::11) by RI1P284CA0032.outlook.office365.com
 (2603:10d6:10:154::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Wed,
 14 Oct 2026 10:10:43 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN2PEPF0000449E.mail.protection.outlook.com (10.167.243.149) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Wed, 14 Oct 2026 10:10:43 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Wed, 14 Oct
 2026 05:10:32 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Wed, 14 Oct
 2026 05:10:32 -0500
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53
 via Frontend Transport; Wed, 14 Oct 2026 05:10:28 -0500
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
Subject: [PATCH v2 08/10] ASoC: amd: acp: move ACP7X_PDM_DMIC0/1 to acp-mach-common.h
Date: Wed, 14 Oct 2026 15:29:16 +0530
Message-ID: <20261014100902.1215212-9-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF0000449E:EE_|DS4PR12MB004847:EE_
X-MS-Office365-Filtering-Correlation-Id: b9cf8681-80c9-4b18-9148-08df29db6855
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|376014|23010399003|1800799024|10067099003|18002099003|22082099003|11063799006|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	lp4JjnhVAm3G/Q/2yl5Ky2bBK3UQAd+Y6FzhUwfLjSSoD73gksAkoA6EJlgkmAOfSSGFJ9OmJlxRrkCyxopyL6m4SuOfRiSsc0BnGSqZd5VOmG84fUbRWIKn0s6r+F0gHcgAOSfnPRIjdWrRl72a5SPEY8qZj0yuCgOIPyWdF/OcbnAQpASHRK6YHKFW0vQDSsnYmClVlMpRPxf6sNSDSxRwOtL7k1pqmnB7ilWcMrNp+Js7wFgkMkyGvBDMo+smOKHPL/erH7BpGWU3yCXy2ov143Q2x9vriGpbN4bGuZ5rbzXWkzgT1UDBgWggPT3f0oBU8JcunK4U9Mqw/0fqSEuvdotPlOoT9DJ8N3Ovi3x82QMkFfX3CP3B0SoYC61TpU9MWfqvfs6E9dqc+9VIYNrSQK9aZ3LIBQP/0zKT6W9MG5IXIuOBrO/gToIXCu+vHYxOamVLICCAhk9LjSn+s8wiZh18hVpB3m/MQAmZKmma/GEQLzSaw6O4CdylXuWH8sdqxTnJ2E4BKnGs8e0rAAbvKZNmKMM3axScLoZeYAOB2ajHBtfVyDECtm/K23eN0KURTgYDMdQ0KZK9Kd49itYlfCWRJYwlwl+3K4sDj3PsqsR5piBOxeYxIB4Sq2TJqJc/k6J1QRw4XnBM2y7aYPe6fMksrQC53wkQMC1P9i1HRp7YXA1tGa6MNLxt+c9NEXa9IO24bAxKoWcX3ZcvnQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(23010399003)(1800799024)(10067099003)(18002099003)(22082099003)(11063799006)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	gpNUyX1PxpXd8k7mjO3edMz9moHQZ1kVmtUdNkRcfoHpuZWUFz5ShsVnbMWu9Zx2k6LzVTW21WbGYQOTDUvHqc3VGr9EVpLHsN0/d5ImfLREM0nbPBUhheBj2nKjFRyg14NQH+W957UbJeqOzldoiTmsv28rhRc69ooe5dHZeSYnT5LpTgdZl75J1ruE7CjpCahyp6kmBDvnQPfOWjnvSEwqN/iwoSQ4x6YxxSjM1ylmHYbRs5ztLD6XZgDRPT/P49elyAtUptDHAWuwR/cNsOV8gDoWqGGOFOoW/pkYMmzp9aTr8Zz01MpPeApbKsLtK4e/QISiBZ3uaijeFihBqByF6SCe7AwahmQvLoXcjS7702GZXtxUx8AIUBWC4FjcnCF5SvwWnDuh7oZP33NCX7+uLriXMx0vHlxQymHlgp3XhTnNxZBEn9oInxis3RYg
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2026 10:10:43.4518
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b9cf8681-80c9-4b18-9148-08df29db6855
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF0000449E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB004847

ACP7X_PDM_DMIC0 and ACP7X_PDM_DMIC1 identify the active PDM controller
on ACP7.B/7.F platforms. They are carried in amd_pdm_pdata.pdm_sel,
which is defined in acp-mach-common.h, and in amd_mc_ctx.pdm_sel, which
is defined in soc_amd_sdw_common.h.

Move the constants to acp-mach-common.h so there is a single shared
location for all PDM types and values, accessible to every AMD ACP
machine driver (I2S, SoundWire, and SOF paths) without driver-specific
header duplication.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/acp/acp-mach-common.h | 4 ++++
 sound/soc/sof/amd/acp.h             | 3 ---
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/sound/soc/amd/acp/acp-mach-common.h b/sound/soc/amd/acp/acp-mach-common.h
index a2cb25be6bf8f..36b80fb88d58b 100644
--- a/sound/soc/amd/acp/acp-mach-common.h
+++ b/sound/soc/amd/acp/acp-mach-common.h
@@ -9,6 +9,10 @@
 #ifndef __ACP_MACH_COMMON_H
 #define __ACP_MACH_COMMON_H
 
+/* ACP7X PDM controller selection values for pdm_sel; 0 = not set */
+#define ACP7X_PDM_DMIC0                        1
+#define ACP7X_PDM_DMIC1                        2
+
 /**
  * struct amd_pdm_pdata - PDM controller platform data passed via mach->pdata
  * @pdm_sel: active PDM controller (ACP7X_PDM_DMIC0 or ACP7X_PDM_DMIC1),
diff --git a/sound/soc/sof/amd/acp.h b/sound/soc/sof/amd/acp.h
index 929251772526a..e48a6cc64b6df 100644
--- a/sound/soc/sof/amd/acp.h
+++ b/sound/soc/sof/amd/acp.h
@@ -133,9 +133,6 @@
 
 /* ACPI child device address for the ACP7x PDM/DMIC device */
 #define ACP7X_DMIC_ADDR				2
-/* ACP7X PDM controller selection values for acp_dev_data.pdm_sel; 0 = not set */
-#define ACP7X_PDM_DMIC0				1
-#define ACP7X_PDM_DMIC1				2
 #define ACP_DSP_MSG_SET				1
 #define ACP_DSP_ACK_SET				1
 
-- 
2.48.1

