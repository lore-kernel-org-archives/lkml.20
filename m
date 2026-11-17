Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.209.63
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794902663;
	b=AI85lUEBHEfenfpXMFo5CBrTdmcg6QZmj4tXeZHPjx1pegv8OPsa8EOPhl1yJUKbukwY
	 j26Hx7L0s3Wgq+nUNIuyugk1QsR+3yG8jS0V51nId8YMZ7Z2mF2WVXkVrFiV7vq55jp7Y
	 9TNFrPMJP4wzUnM/TlCSRLmlLwGJDKEft2wr4Gvl2NDjrPUzLROh2mXaLrvKx+ngha9U+
	 MrGW7Svw1czlFz3G6v4Nqom6KS+T8H3DO1KErimy3l0Yu/oPw9S3V2WP6D7GIVnT1Z8Qy
	 y7eolOIMVl4fcVZ71U6mLYNOc094jRjla88fO5R46m0HTnIE5nX3PHkxmZJRoYMZq8Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794902663;
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
	bh=S0XWMci2FHFxKLQBPVBU8OZ+bhgMBtXohbRGrvQ3udA=;
	b=wb+UcHWux6OIs2lrv0TTJ9ssIymWgoE8D/CKXDAao7ILq0gJ/7YNf2yYhtVblrc29TV7
	 NdVSGSpgixuPirMNLvXrHtZypKJv7yMra5KCcaMjlr7AAfzn1sun/7Vqnbhg0OtUiS3hI
	 54CWlqH4xLwui6ic4Gmbltx0YU2RXzF4ABsAx1C4y+ypqw+FSK3z2s/V6LdCJ5I5x14PS
	 4gtGQCesW4zwgLuwXhqXKZzsxXvaon9q9enyxf31mOEFc2tblrS2CzY676vu4UmAnhLwT
	 WNqwpzGnBs++8Go3FInylFaIGxu4lzdZ8GvUBBuOhmyd77pRIz6InfPf0+P9aOuWzxQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=GJlN5T69;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.209.63
Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012063.outbound.protection.outlook.com [40.107.209.63])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AF5B606A33F;
	Tue, 17 Nov 2026 08:04:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6AF5B606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=GJlN5T69
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m6iUk7PfXjDJ+ce/uFONXDBKgOLgA8/oDO9sZt41nEcE+llJzlQshR1xKzsC18Y5bCDpuN9d1Mn4GeV0J8IZ6+BqZd0qW5eIPSoWJrSnuWKeKR9mxBrBx7DIhw5P/EfgKWlTpU+kiG3zySboT8bvtmFBYjSWPc7WLSaF3OB1Zmk2qY4lvCRsAr8QMgl5uGUnY3kE5OEhtX3+2FvxJ21b8iU1GzKOFjQPRh/viW/Dwjx7c83QeDZoK5mvq44AEXm2fq3zTY4guFMqlg+GnQPQ0SFnOtovf6wp/Yoy+NIAI2cc+fYWahnAdzLPofGW1BAZn7E3mfiNuDAfAuwLquMDrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S0XWMci2FHFxKLQBPVBU8OZ+bhgMBtXohbRGrvQ3udA=;
 b=XoY2/hj5WgsOO0aqZQepA+BBtM9VI9qfJycHPb0PG6Ba23XN2y1sk5PuVhGUg3t+GQl6UhrpWiAAT+HUOBVn3c7k7kge5NylNA6Mhui4VZcDoILU4U8QC4etCiUWa9xkfoXy9rmOCYGDtDXc77ALV72UGF5XVVJDr34HGkxKqa1rHb0mIzU3Jt1oM12vK5N6IDzebWncAerTzd9IsOLEI8SUNKJJRf2vsaZSvgkJWdD2KpKEfriSS+ZrZ7E1X8Q+QzLHeeZzIWswyurSd/5ka/3wbsTC9b/duEendF2201OL9DCx/m+yfFiHjXNgJsh1sf0YWZt1d7uhWcaRDrJLhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S0XWMci2FHFxKLQBPVBU8OZ+bhgMBtXohbRGrvQ3udA=;
 b=GJlN5T69VGne8m92N/MpHSDDOigA4lMVaWNtuery113Dg14FDQ+hptdH/n2ygS/NCmIz1yvY0SXWvOrizq/D6pOrls+Myznv5Gtxp1bYqIXLTIxm7p1NpfvUnSnQiLycIoXrDLMSfOA/gjcEEs5XXHx7EO+8Db4Ss82MF9UMsi8=
Received: from BN9PR03CA0896.namprd03.prod.outlook.com (2603:10b6:408:13c::31)
 by SJ0PR12MB6967.namprd12.prod.outlook.com (2603:10b6:a03:44b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 17 Nov
 2026 08:04:19 +0000
Received: from BN2PEPF0000A994.namprd04.prod.outlook.com
 (2603:10b6:408:13c:cafe::97) by BN9PR03CA0896.outlook.office365.com
 (2603:10b6:408:13c::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.10 via Frontend Transport; Tue,
 17 Nov 2026 08:04:19 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN2PEPF0000A994.mail.protection.outlook.com (10.167.248.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Tue, 17 Nov 2026 08:04:19 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 17 Nov
 2026 02:04:15 -0600
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb08.amd.com (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.57
 via Frontend Transport; Tue, 17 Nov 2026 02:04:12 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, <Richard.Gong@amd.com>, <Poojitha.N@amd.com>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>
Subject: [PATCH v2 04/11] soundwire: amd: add ACP7B/7E/7F DAI PCM capabilities in register_dais()
Date: Tue, 17 Nov 2026 13:31:43 +0530
Message-ID: <20261117080239.918428-5-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261117080239.918428-1-Vijendar.Mukunda@amd.com>
References: <20261117080239.918428-1-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF0000A994:EE_|SJ0PR12MB6967:EE_
X-MS-Office365-Filtering-Correlation-Id: 80a2fd2a-e666-48f1-0ba2-08df448161c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|36860700016|82310400026|11063799006|56012099006|261026140227099003|261028144727099003|10067099003|261021121427099003|261022105027099003|261102123227099003|261009223027099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	ElHZCk47RDlpgH89GDMERFPsW4XsE+Qw74LxtAaSX3Uhwc9ufZtxwdp+xbNCsUSUNTLxXyvXSLZbhXvLSlT0Uzs2p1B+IA7my7HxPucStyAjzmYczaoJzmdsMitibAXyUFVgmpB/Mb3N576HhpHHikqTCwgEw+Xbh7Ik7Vsz8wS3D/7HQ+EvfsFJh1luOtNx5tCmPY99arVDdtCmi3+O8bq3I9B538Dmt7Lp77JcVbSRI9VPdqcemYWyUBVRf3g5lt3ds03Q4vXPb1osPwx/Xh1zTfyZ8FyKoQvSNa5egQiRuXzffUoIq/wXywtqSnRFgQvXU1TY9NrzTyAlUnlgQIkx7TpMgIt5DAuw4H/PZRngq/UF+wvjQmZ5U20yOQSE+LJmWXzyfn4cXZF8c70i0uz/N7hhgOPWkdc081QYJu1R4+uIl0Pj9Y8CgAdnjHc7+XnR60wGNUiOdJeFB7BfZuF70WR7xKzstaz7mP1i11bysNjYdWNalFc7nTtXN3ozorguvWWC3kcP1j8jbDQcDZbrD7NBImbZO/hE8/yY8+pYPLloBJ2F7EGtaT8N5V4/wNNIj2VdXV6CHrC10q6/Uf6zzQenJ6oos3MRxIn944uKpCy4DW6a0NQSO2a2N6R63ZdrkXWNvbXorHsJmCibh4DYwiO397XlSQH1L/UmqsS29Qc47gEO5howqSjGHaSX9qSKGwWm6R/CxGaGDqHn+Q==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(36860700016)(82310400026)(11063799006)(56012099006)(261026140227099003)(261028144727099003)(10067099003)(261021121427099003)(261022105027099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	va2hHHoOXrUGUOpr2dgdBXa4D1taels0A500Jm+7uxzfQjqODu9ba6HoLCpTHs+4LfIpTeJ7qajO/4xaPUctkl3S8x1Ipzf97akiBJ7DmaHE+nBasxXFkLk9fKIurEa6EohL/9NP3y6m9ekutRr+3Yt2OlK9e0xs8MPxLBhkF2g0lvjvbtfZxrP1sbhmugn2WIWeOogp/q4q73gN9IhvSEGr7qpBgUzTitF7Z82muzP2GNrdkjg1bS7BbCj2OqKNAKoUygCR7WWIzwfTNz3IIKlmxWtsxC7eFaTqIVmqDCMIrr5gq73SfHokvY8DSI7cEvvoFZFSkc9kxMSWWpOv9AUlW0CQlLczGQ1DZ4k+9jO/SrLmWbubBdAv0reUdPufC+53I2zpquE8+6Iu3oK0lEeaZu86MYM03fQhgsFQkBkKmU2Fo2dYO+vfcneFpkXi
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 08:04:19.1292
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 80a2fd2a-e666-48f1-0ba2-08df448161c5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF0000A994.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6967

ACP7B/7E/7F SoundWire hardware supports higher sample rates and
additional sample formats beyond those of ACP6.3/7.0/7.1/7.2.

Extend the acp_rev switch/case in amd_sdw_register_dais() to set
48 kHz / 96 kHz / 192 kHz rates and S16/S24/S32 formats for
ACP7B/7E/7F DAI streams.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 drivers/soundwire/amd_manager_common.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/soundwire/amd_manager_common.c b/drivers/soundwire/amd_manager_common.c
index 4c1765cac1e7..f74ae24912e9 100644
--- a/drivers/soundwire/amd_manager_common.c
+++ b/drivers/soundwire/amd_manager_common.c
@@ -425,6 +425,14 @@ static int amd_sdw_register_dais(struct amd_sdw_manager *amd_manager)
 			stream->rates = SNDRV_PCM_RATE_48000;
 			stream->formats = SNDRV_PCM_FMTBIT_S16_LE;
 			break;
+		case ACP7B_PCI_REV_ID:
+		case ACP7E_PCI_REV_ID:
+		case ACP7F_PCI_REV_ID:
+			stream->rates = SNDRV_PCM_RATE_48000 | SNDRV_PCM_RATE_96000 |
+					SNDRV_PCM_RATE_192000;
+			stream->formats = SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S24_LE |
+					  SNDRV_PCM_FMTBIT_S32_LE;
+			break;
 		default:
 			dev_err(dev, "unexpected acp_rev 0x%x\n", amd_manager->acp_rev);
 			return -EINVAL;
-- 
2.53.0

