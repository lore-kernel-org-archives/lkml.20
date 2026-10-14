Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011064.outbound.protection.outlook.com [52.101.57.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F6674F4739;
	Wed, 14 Oct 2026 10:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791972663; cv=fail; b=B6sZ1TIl6j93bvUF9LS2+zVFEOHW8UPEzDxT7cAHzyY1IBECSUiE6Hre/gZFDv8VfFzebNUkvfHaNGban/MTqd8hyTfbFfCwYnv8rlNPrFrgmIcZ/uPe3HP1qSiSWJz3CZj/1gfL8ecSH2WYCJZ5R1vZcUdp0QwLaQ0sRe3js14=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791972663; c=relaxed/simple;
	bh=eB0rqO/z/Z4eQ9vpB7buQVOQysJn2j45rZTHW/x7s1o=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qWaIcZAIF+OK1fLJM9UAP0/09INVTdlaCcILRoiVCf1fxuLZZskLFzwpklmWuMaxYqBIocxxA3vyldBaUVuqdyGRMBXlnhh6PPZlz/0mMInG023i6sc88K9WJya1TxNhBtuD7fx+vFY+IFVDZtHrS/7SzAOaLAAdTm/pD71+3vM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=RL8/j1MV; arc=fail smtp.client-ip=52.101.57.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="RL8/j1MV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eU+a67dKSImwVYusVJm75fP6QK+VikhZA7ZA8DpHspphwTALJVANwegc+ueZZzvZuL0svuh58zcjOJV2eYfgL53UccB/p5MGKBTFK0y34n84lLuxmr1sMEdBWTkw4nt84ZbJ5Nh2F1y1ia9F6RDSNtYEOah+eSFpNJ8S2cYIS6ON64vQpJocZeiEK4oqd0Vs5+ibEdH5gCcdk4viMDsGw7Dh4Q49ycBwmBgvjeJ99YuDUbT1t8gd9T6992NXr+gA4h5dbwg/7ZLc3oYiiu8yrp2+CsyO2hFQkj90uam6N/I/oQ1zyIyGONjlIESrAt66zxmtsvEBYteNJdUFkblfwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/if5REUAu7WkY5FIbfi/pP38fgS9iSEROgCL9BSfpSc=;
 b=Xbmodc4PKNtrepXE4s+ZGOhb0F0JIzyVyvtRoCoA2uxlEXepT6Vt8IPFRNFX/rWW6edBuV2P0pwpeN71lG8xUgKUfQNWaxY3ANZ2T91sOH3Ah5Lo1PuXy4O6XxY1f/XphTwyVNZAty/e5opjLThLoMdt717Ne10oeKJ3GcucJnLwgTEmb/NuxHHWXAqjS7CDCBnMLO4MyV69liz/WUjbhK4GPcdOP6hPBdw5f1TZ8KzE/sWI3+Q7l6F8ZIJmvv0SfDimyGhwIRnlkeTDsjQRaLUofBzB/G9v5oX23Nd3fCz/LQ71XQNPbxo7eZiTwJ80bXWA9ArrKx4e3E/C0/f43Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/if5REUAu7WkY5FIbfi/pP38fgS9iSEROgCL9BSfpSc=;
 b=RL8/j1MV23YdoXtTxWbojQGIyUk+k4+GI3jqv6Hyw5SjKyyGMTRrp90jvJebP1tx/pJNQLDV9hmLB/jW7CjDNbG74Yrn4th6kC8j5ADm6Sls2Xt30QHngIUsv2W9SX/4kYztfWTHmycM6qGyOJnlvfKaOhayoY/PVyR7cKt9Efk=
Received: from BN9PR03CA0674.namprd03.prod.outlook.com (2603:10b6:408:10e::19)
 by SN7PR12MB7201.namprd12.prod.outlook.com (2603:10b6:806:2a8::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Wed, 14 Oct
 2026 10:10:49 +0000
Received: from BN2PEPF000044A3.namprd02.prod.outlook.com
 (2603:10b6:408:10e:cafe::2f) by BN9PR03CA0674.outlook.office365.com
 (2603:10b6:408:10e::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.4 via Frontend Transport; Wed, 14
 Oct 2026 10:10:49 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN2PEPF000044A3.mail.protection.outlook.com (10.167.243.154) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Wed, 14 Oct 2026 10:10:49 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Wed, 14 Oct
 2026 05:10:37 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Wed, 14 Oct
 2026 05:10:37 -0500
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53
 via Frontend Transport; Wed, 14 Oct 2026 05:10:33 -0500
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
Subject: [PATCH v2 09/10] ASoC: SOF: amd: propagate pdm_sel to SDW machine driver via mach->pdata
Date: Wed, 14 Oct 2026 15:29:17 +0530
Message-ID: <20261014100902.1215212-10-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A3:EE_|SN7PR12MB7201:EE_
X-MS-Office365-Filtering-Correlation-Id: 026796a7-cbc2-4187-4181-08df29db6bd4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|23010399003|1800799024|376014|18002099003|22082099003|10067099003|11063799006|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	GkX8CQbanfLpOswDmkzMVVbyLxfrYbvEcPpjz6M/FEfCOYK/7MkwISzOVmdVDdeXwSnpSnjHJ4jN/A4YGo2cNzi1sbp3ykPOLee904/9ueQtZ5ZRFWnBSNeX8UBSahMEEc4Rowk5nyDwHNgWi7acCAuYlQy8xqvX4+DUCfR3qOhoylTPozaBgU9gzZALP3IZt77X/T4A7Xjo6UFHY2GW1cyo2ClOSaMHjLHo9W34iSHDDgoSMBrMbCyf+7v0ZyRRrod1FjOCx1IZQWDZ3P4IPupazbAdyuhCR9fvzj/mmQnILrIlZLpQJ2FWZuoMJhw3Y9IpNlFsb/weJonm3DXSKw48Ng3XDTwnGVrAvPzBKtzkR//+Vi5+UuuBti7UinFXCoZYDSzcCk00dwiw0B9p0tVhi6O0efjLSWGXyRMdiEAMSPFb4j9ImUk56IAn3Hiy+zfRHjw9mnu9rOspafCQzZ8uuz9iZhwkwKYJI1a5GdxnAASk/dnX4DAOrf5DYa9yNn9dvrptIs+rdC0sX8Wy+n1nXQAUGX/x9SI9dM89Ov8plbcEMIxcnkOXNkge5gp6EtWcnPuTCHR1smDMEIlJdyibwIDABcTHKZHDGCHrSWoh3UNgJMMPkXD7Zx93qFFJBC+BDK/jLY1E875HLdOceYIC96nbqbZjM8kx1F7ZDOQPIozD4tFXxLsD4VOiInQoDHtjultRzkFln/YZ6xueOQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(23010399003)(1800799024)(376014)(18002099003)(22082099003)(10067099003)(11063799006)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	HTFDYPlbwpDB7QauuS49UocL9qrEMQI9atONniG+3wjptJo03q2dshhK4Fl0q4uAsL2atPkLS7WgHG5FKL2H1nAbs2bQExnF8mta64AH2o6asoC/FKuxa9kvj+uBKhfkV919jeD8vEJYMdewwClCs4NuP75q/wmePurHmze17k9CAdoXF13qDAPyJKBeI7ojwrNVKthJ633wo3+0tfZTULYhsH076OUr7nJN8rDZGvK/WAdNqYumhqZM3OBB1omAy1xoYBSdzR4YHcKd1ZSbstAVdXPst9YK+fvfvAYRRGGELzm19Eo6tbIXR7LoP+8iq7kmOPjYm/gzDAfz7wgwwPU8BdbHNgKdXiVhSilS+/pOrrAM36tobq1z3svKDdLstivBjn330UNaghQrr10Xhu64oEtYaC8s/j3ol0N7hrn4tC6jDlnwyVz+s6Y7lDBa
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2026 10:10:49.3139
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 026796a7-cbc2-4187-4181-08df29db6bd4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044A3.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7201

When amd_sof_sdw_machine_select() returns a SoundWire machine, it did
not carry the PDM controller selection to the machine driver. Without
this, acp-sdw-sof-mach.c cannot configure the correct DMIC DAI link
for ACP7.B/7.F platforms.

Allocate amd_pdm_pdata and assign it to mach->pdata in the SDW machine
select return path when acp_data->pdm_sel is non-zero, mirroring the
existing handling in amd_sof_machine_select().

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/sof/amd/acp-common.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/sound/soc/sof/amd/acp-common.c b/sound/soc/sof/amd/acp-common.c
index 60e5c851c8743..3bb1de8c03762 100644
--- a/sound/soc/sof/amd/acp-common.c
+++ b/sound/soc/sof/amd/acp-common.c
@@ -132,6 +132,7 @@ static struct snd_soc_acpi_mach *amd_sof_sdw_machine_select(struct snd_sof_dev *
 	struct snd_soc_acpi_mach *mach;
 	const struct snd_soc_acpi_link_adr *link;
 	struct acp_dev_data *acp_data = sdev->pdata->hw_pdata;
+	struct amd_pdm_pdata *pdm_pdata;
 	int ret, i;
 
 	if (acp_data->info.count) {
@@ -162,6 +163,16 @@ static struct snd_soc_acpi_mach *amd_sof_sdw_machine_select(struct snd_sof_dev *
 			mach->mach_params.link_mask = mach->link_mask;
 			mach->mach_params.platform = dev_name(sdev->dev);
 
+			if (acp_data->pdm_sel) {
+				pdm_pdata = devm_kzalloc(sdev->dev,
+							 sizeof(*pdm_pdata),
+							 GFP_KERNEL);
+				if (!pdm_pdata)
+					return NULL;
+				pdm_pdata->pdm_sel = acp_data->pdm_sel;
+				mach->pdata = pdm_pdata;
+			}
+
 			dev_dbg(sdev->dev, "SSID %x%04x\n", mach->mach_params.subsystem_vendor,
 				mach->mach_params.subsystem_device);
 			return mach;
-- 
2.48.1

