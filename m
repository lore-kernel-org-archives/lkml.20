Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010032.outbound.protection.outlook.com [52.101.201.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B24A5542806;
	Tue, 13 Oct 2026 15:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791906505; cv=fail; b=bUxmb+ikGRu06qhF58+ITOZwV9y6BrXXTJukmiadEbtyiR58XQPgwshjcWTp4XhJu6keDrta/pT4q9GS5JMp9eq1LqfUIoVUnbtvED1n1YYRlQZaYgekQeOzf+h+ItqSW30O+rfZVNAh9kVJEfuDKTq2Y8i5mJTrQHyxSsbkNTU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791906505; c=relaxed/simple;
	bh=eB0rqO/z/Z4eQ9vpB7buQVOQysJn2j45rZTHW/x7s1o=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QnIY/IotiRcaxrRtcteUbAOEqXmGDkDhaNOWCI7+iENzqhglsOITKnADruOjWpB0XRSqb0RInLcAo5qoYcPcTBP3uksqjwnvRC2/OMY6DjJ6e1LTceJnT/GfR7hNadzAoB4ucOZNmGc7RCVIMXGB1hQREV4YYL/iGuecAuFK+zI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=CzDvPtpw; arc=fail smtp.client-ip=52.101.201.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="CzDvPtpw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wVwfB4pL33ImNnwqpHd8+KCGWJSAZVtL3epL9rlK/5tBYCc0ROAKtqdvnYnsQfgdBfFUVjT5yEcysVH6AHK94U4lAK3zZpu0E+3Skb9G+C35YkAGvvQhVJJiOrvtqygc0+x7XYDNiuVA7QV9GzbfV9Je8JGBGn8EFEmmHMzYtTut6NSQOpolrZ351z+LZhh+gWPm7+Q+TS58yE2r/cte0dcdDVl5OrkvnFpRwVGqYD0iuG7/FXtq1n7NliFRqEgpJVlWGVAAR6oWCUa0kMlGZLzELJDaIBZocYLuhHePyVCyCpAZ8PKqrPT8OgxrBqdRQ9mOfF1ccinxYn1jtw1j5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/if5REUAu7WkY5FIbfi/pP38fgS9iSEROgCL9BSfpSc=;
 b=q9hpbdbX0wiVDBCx7QFesSHkcmKK07YDNr8GAMP2xPmhU+PxXzNfX8haw5AERcHyV+mhLMvmGCku2sa/HHSHAdGI88qjC9lC/fv/cSWZFUUMwU7QLENi9e111PC933XCumF7eJRcw+rj83/ntivP5s8jP1mefh2+jfRmOeLyxDpyp0Uplpg7k/9mUnwAaBTPubvR/PilTm52KcCPwhMH13N2+T1QmjnYfPVjg6XpNIehueRJLNRfX3YzoKcpGbEnOIzjU5IgKe8aY0Evl93FjWE74jSIJZYFroh4YwcUQcYwGd9fHa1kagC357VAWoptwyuis+YT5WQI8DFw0TN2OQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/if5REUAu7WkY5FIbfi/pP38fgS9iSEROgCL9BSfpSc=;
 b=CzDvPtpwQSWciKNMiBra7g+fGUG7HbAXXvSFzEV9fETibEKWIcp2SRd0KlGJ2PPRRhRAoq5HmCHydDNtV3DpNCIKayqyltRTsWUIgKLD+ShbpFvbu9PeLjK7LLBcBKqTcmbREh4aiEF/325k24hAPn1Mv60hxLzsJ4d9nbqZSHY=
Received: from CH0PR08CA0013.namprd08.prod.outlook.com (2603:10b6:610:33::18)
 by CH2PR12MB9541.namprd12.prod.outlook.com (2603:10b6:610:27e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Tue, 13 Oct
 2026 15:48:20 +0000
Received: from BN2PEPF0000A801.namprd02.prod.outlook.com
 (2603:10b6:610:33:cafe::4b) by CH0PR08CA0013.outlook.office365.com
 (2603:10b6:610:33::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.4 via Frontend Transport; Tue, 13
 Oct 2026 15:48:20 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF0000A801.mail.protection.outlook.com (10.167.245.170) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Tue, 13 Oct 2026 15:48:20 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Tue, 13 Oct
 2026 10:48:14 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Tue, 13 Oct
 2026 10:48:14 -0500
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb08.amd.com (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53
 via Frontend Transport; Tue, 13 Oct 2026 10:48:10 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <lgirdwood@gmail.com>, <perex@perex.cz>,
	<tiwai@suse.com>, <yung-chuan.liao@linux.intel.com>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, <Richard.Gong@amd.com>,
	<Vijendar.Mukunda@amd.com>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <sound-open-firmware@alsa-project.org>
Subject: [PATCH 8/9] ASoC: SOF: amd: propagate pdm_sel to SDW machine driver via mach->pdata
Date: Tue, 13 Oct 2026 21:11:40 +0530
Message-ID: <20261013154644.3788064-9-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20261013154644.3788064-1-Vijendar.Mukunda@amd.com>
References: <20261013154644.3788064-1-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF0000A801:EE_|CH2PR12MB9541:EE_
X-MS-Office365-Filtering-Correlation-Id: a8d50bf4-ec56-4269-e4c0-08df29416814
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700016|1800799024|23010399003|11063799006|56012099006|18002099003|22082099003|261009223027099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	ks8Yejkm/o5LDKoADDpCK9CQlyU+5qkjFR8/DH6hXMeMqaAaBty+TeqBnK6yhA0R7yYCUhLtFRivKUqWgQWfb0Wy1b5U1eriXNM7lLn/VZPBEuJwi3IZmRdp7ZRCRVmoF5jmV6ziqLKVu93CueH/MvGWCjOfkpEriV0Au/pJH+I5xCK3rWZ3shxO1L8eG1f+i2UxS1el9tjuO94gstbsE/w9aPQo28kmta/2B219Ecgag1alEADzMrbZ0aeHnnU/OGSr8Hm1zHHHblVUmXbuJCtZ05BX3qKTR0d2QySzceC6/PHtSPmjp44dRIQQSS4nH9mSqRrkFR1DgN50j7X1+LYSt4MzOy7MfBccrTuJio4GxYuiZWEsY0/SzN11wTgXgyPO/zpQ3UhXpBRK+sI7CZA1qOuRoSEgjUBHw3ekUNSwr15SwxmuYWomo1pb4O2KPs20CiRAhRlj/KXnJNh72IsMVYvT63ytfhZqWbAMbAuaIms3mF6OcoZ3KCnzb1xEn28PFjIpLgAhUShwF7ZU0qKgFZ3LOmxbjIZTNEMTc7E48vHUUxHm714UlNERd6SAPgqmUxbpRnqsDcxXJ08wK9CUOHRj4ahBWBvInM8c2rzjhuiZ76y25p36wFEVAwbQHCcfoSLA1C5JcRovVHsPy3OAEr7S1yHMLYx5qQPHCA/OMs4o2N7Xsx8sGpuBY2kKwFprdh7qKZz9/F+hh2xu7w==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700016)(1800799024)(23010399003)(11063799006)(56012099006)(18002099003)(22082099003)(261009223027099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	57/sGz/QS8DuXZVGlZ9bXXRc6UEHuQOcvQTCj6zspDu5DQAC6r0Yqpjmx6Kin4ihp7VKc+DXP51XZ2OfLBmwRECUDYoXF4LHBQCEctFir09Dp31vRDHNRSzN8w8S0KnAFqrwxZco+7Tw2+ztELdqqG3ZPTA+drYaVi75WJsU6dl8HY0cQAsHwvxEskFw47lWzZesVagXu7S/Vs4JdDY0TbCmSbD9HZk/xlGqq2gg//aUir+ZwpjUTOoAAOchTUr/uMXRNDLcZKYMrr9Gsw4YF5w3KmnPbY64CtHqJqeCybHFJXlwDf3PVHnOggE9wACxeXKQp+ED5NDmJyj+Lq2TYAeEc5okeeu5yPe4b/Mfqe2Dgpb6Yge5ihtAt1yoU0y62nneSsTzK8ESmklX2vGAlTXAOKzvtIEwv44O66hjSBTpVBfEqFg3EiibtpE7qvug
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2026 15:48:20.5255
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a8d50bf4-ec56-4269-e4c0-08df29416814
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF0000A801.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB9541

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

