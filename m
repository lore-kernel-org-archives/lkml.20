Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.195.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793353725;
	b=dWcM7xMQ96gNB6a5iKD3DaQJQL1MSmXDoL7/JCL1FAs6DKWhF8wohNmL886QkTiiMyZJ
	 0reLpKON834ELLbgXc2pZzi+v00EH5ncUT2XoJcohRb6yDBfFrUl7lwUSglvph97LR5wr
	 zQYlbxqvnWd6HUIGeBx4NunEwe/F5+z9kQTNZ1m56ERcLZr1p6fOVUmA4hgsD2L4bvXV9
	 IA36//l4x+KPSTTqV7y8VyjRCOFeH89dDgwvWMKsR13nXDoGtXFCgUA/J0JxzrgK25Stp
	 j6PXEFs8mrA9b5pwPJhvRs8RCpPxnPzeLQYwetQ3P2mjNtw9cuUfIE+wEreRPlyd5pw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793353725;
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
	bh=RMNXbO5e837di/gKbsUaLGrkIoL90Yj5parM3rryJU0=;
	b=wS0doIXr5eiBeRKQ3Za8LkMe9DrGUgr9UoQikeLDaMBXitXndxeIN1H07Kv0QrxEL1K6
	 qjgu/+Jt1/YwP6NH2ijMGietnl6DarUhTtSIq/9RJlP2tDn/n2iLdgm1x0v/I5lE/TL7h
	 qg7Rqh4lvNdO4QvTYXNoUD9IB0aFe2OEPdAE5+b9ClKNYulrcDjdeRw2Onc42BsBKRi9V
	 g44K7URT1tOkij1J+7uyvFBAIu+GBMN5BVdHrWoDD+dUYClxjaZsZO+h9iSitgRF+1jp0
	 6155PYuDIjPzHXs3o3Y7PxW7ooIbz8U1JQHi7vlz5vH+hLK2xF7FvMgeqx2ILvGGnKg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=QUgmvTDb;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.195.49
Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012049.outbound.protection.outlook.com [40.93.195.49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CD13606A321;
	Fri, 30 Oct 2026 09:48:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3CD13606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=QUgmvTDb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LX3/YhsnYlAGXV702H2rgoncp6sAJ7dKJ6ZMYUmM3jU+vvGKhKxd2FcErE7059q8BsYGMyh7PFDL4CHiSTgVkRNZxse+52r8NY5RHXo5++PDqr5ZH1GOnKjiKVvKjA6ADzkdOuqPKVO3v7d2PZLOBAQEpox9fEp7cJYPeD/HPBBVkz4AqJJG1Kx2A4D6dQcpOP9INODG7zVRKxIq0lNuUxInyz11OmIA0HUINbTJWwHSJSsy7QddSLjtDlCCnfDSnEASSYRDK1kr/B213Qpp1CdZ2+qjWA/G5P5FEGvGHxPfMnRFqjwtqZYhCNCo4pqmF6i1eIqu3IPbKGxvbqvlDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RMNXbO5e837di/gKbsUaLGrkIoL90Yj5parM3rryJU0=;
 b=DWCQ2bxgEtI9VTou4ktxuq7IhHreZWW8lXfraFSvI5WSQJWUAvFOFH12h9US7Q/hJR2MGgmpxifh7icf0CJL82jVTSZlGY4Y6vqVd5+a/yXu08eqJi+Rtc2tEHPu3X+lqjKPNnhEuUDhTeTY1iyxc69ytYhhSpCjZWXdPZ1q/1pPELRx1Qty2MFpqJUU3hDbJbKSya9p7dGW+rOV4l7YP8VVxQLFzJoyCbKZmbJmt8Z9RJq3CHlUs6PFJXPXUM3WgkVClWBkGepRKs7sFtn9hHSOiOg6esh8skvaxcZEfibaTdcCNpDpK5A4SrbdNZeGsEa2fuY28mQUPPZX6IwI6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RMNXbO5e837di/gKbsUaLGrkIoL90Yj5parM3rryJU0=;
 b=QUgmvTDbHNGpkkUILIRmy/wyWsF1+ZfD/vBV9qfn/CR/KTs5uzq982MAaOXEh99rVvLb1kxJ1HsMlPzEKF9jO8WldLpW6nyZQskwKSyxg/gcc8/9rJ7LNRBFt72nQGGufvaI83DVgFh9C9vtaIO2trjQh2Huv0nj6gxWH4pJ/I8=
Received: from CH0PR04CA0063.namprd04.prod.outlook.com (2603:10b6:610:74::8)
 by LV2PR12MB999098.namprd12.prod.outlook.com (2603:10b6:408:353::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.9; Fri, 30 Oct
 2026 09:48:42 +0000
Received: from BN7PEPF000000A4.namprd05.prod.outlook.com
 (2603:10b6:610:74:cafe::1) by CH0PR04CA0063.outlook.office365.com
 (2603:10b6:610:74::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.10 via Frontend Transport; Fri,
 30 Oct 2026 09:48:41 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN7PEPF000000A4.mail.protection.outlook.com (10.167.245.228) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Fri, 30 Oct 2026 09:48:41 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Fri, 30 Oct
 2026 04:48:41 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Fri, 30 Oct
 2026 04:48:41 -0500
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53
 via Frontend Transport; Fri, 30 Oct 2026 04:48:36 -0500
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
Subject: [PATCH v4 04/16] ASoC: amd: acp: add ACP7.B/7.F SoundWire link count for machine driver
Date: Fri, 30 Oct 2026 15:15:19 +0530
Message-ID: <20261030094714.1123396-5-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN7PEPF000000A4:EE_|LV2PR12MB999098:EE_
X-MS-Office365-Filtering-Correlation-Id: 15a60d9c-9426-4cfa-c5ee-08df366afb2b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|7416014|82310400026|36860700016|11063799006|56012099006|261009223027099003|261026140227099003|261028144727099003|261022105027099003|261021123027099003|261021121427099003|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	bbve9pJVJWmUdzrQcRDkRma5tnFSM9Yv3sq+//dCUX8m6ppzbw5DRCJxw3NcfYN8NRyl0F+57IlBrZsXyBftesKW7euOX4xvZB0oITyR3qEkCWlBwc8sVPUmNrhZPAQ8iiHIUcRAx3lmQionNDKvMdTzeDFtwpYYzeQUV8gzMnlYsHM00Fok2NADnwMYac3hhgFg22y12+OjMy8MB772LiWaGLKEmaX2gpVGftr4T7uXlpDzyVI1P0kO3KhNnvbr7LEdBeCfyiN2a6LuA701XuDqCCwSPygGhOlhqjPEvagt0mNg3H5O62AMxopxZRCMo9y8VHIqW8qwd+Q6FqkaJc8VN54oYPR13EYT65fEY9GvOuOK0WpeZlcYUxGYV5/wF4coLo/x5wecjk4ZS1S1xrv9ShjbqXXSA6+BPKszgkUd7OV5tuotImHVNA46u5CPXKiA3W2oWhjZ6yG5u2hk/avFWlGolu/4JJ7RHh4SrMWMUzyCN5oq2NIpfVsQS5Eo6lIntVRnJMscCVB2vAmtskQ/AxJybpc8YqIJd3Gg55P1LLeRhYIFPSfh3BNiPZGLxX4URUP3x5sEO9Nx+LZVDCSP6tkrAxZgk8F5c6webRUPtwx9Ng5fHoUNzMrO6VJrt+FajKRFyfr0+EWEXXacs9C4NbdJotUI+c5IATq/PRoiiCrIpZxfIEXZzIt/6eY8
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(7416014)(82310400026)(36860700016)(11063799006)(56012099006)(261009223027099003)(261026140227099003)(261028144727099003)(261022105027099003)(261021123027099003)(261021121427099003)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	XVu7UpEb9NET2OS1SuCRSHsCkwuFbuf8PB0wIL19swX0sjB+bsV8zLBf1mCs4+Sz8AhkJjI/VwWlsKeMyOPPW55gB5OCnaAViF0JybpdXnrO1WFAmnp3cy8+JWj6S1y9KT/SzkZeLyQ6FDs3B9+qSeAziZ0x1OO0cdemnSKfFEZEb6T7mtpjQ2wCj23JBs9ldu3b31TGAm4PJGcvUy/7RXmvop1aHL4Ex9EMjdEH7CYNdKRjmC3rix1mcp+UQkscYQirtcd9PoLNrqhR7J9hdpfjCelr2vwttHhY/ElMkRaYMKLDtVv/RbUo7xnaiu/Ke9LWfv8onU4bysGsnpzNzalSnG391yZ37D9hmxOsCuGzkgUINabcooCMBapeosu9jLUZobk5QbDvWkdA0QK0M3b1IlYwtdbnoOYDP8e8J64XRtEY5DF8sYmLLrje9nFf
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 09:48:41.7845
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 15a60d9c-9426-4cfa-c5ee-08df366afb2b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN7PEPF000000A4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB999098

ACP7.B/7.F platforms expose four SoundWire managers, whereas earlier
platforms use two. Add PCI revision constants and ACP7X_SDW_MAX_LINKS
to soc_amd_sdw_common.h, and set max_sdw_links in mc_probe() based on
PCI revision so the machine driver validates DAI links against the
correct manager count.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/acp/acp-sdw-sof-mach.c   | 10 +++++++++-
 sound/soc/amd/acp/soc_amd_sdw_common.h |  3 +++
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/sound/soc/amd/acp/acp-sdw-sof-mach.c b/sound/soc/amd/acp/acp-sdw-sof-mach.c
index 979048e42424..46c3815a777f 100644
--- a/sound/soc/amd/acp/acp-sdw-sof-mach.c
+++ b/sound/soc/amd/acp/acp-sdw-sof-mach.c
@@ -382,7 +382,15 @@ static int mc_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	amd_ctx->acp_rev = mach->mach_params.subsystem_rev;
-	amd_ctx->max_sdw_links = ACP63_SDW_MAX_LINKS;
+	switch (amd_ctx->acp_rev) {
+	case ACP7B_PCI_REV:
+	case ACP7F_PCI_REV:
+		amd_ctx->max_sdw_links = ACP7X_SDW_MAX_LINKS;
+		break;
+	default:
+		amd_ctx->max_sdw_links = ACP63_SDW_MAX_LINKS;
+		break;
+	}
 	ctx = devm_kzalloc(&pdev->dev, sizeof(*ctx), GFP_KERNEL);
 	if (!ctx)
 		return -ENOMEM;
diff --git a/sound/soc/amd/acp/soc_amd_sdw_common.h b/sound/soc/amd/acp/soc_amd_sdw_common.h
index 0ae85165573d..c98d70a0d6ce 100644
--- a/sound/soc/amd/acp/soc_amd_sdw_common.h
+++ b/sound/soc/amd/acp/soc_amd_sdw_common.h
@@ -16,12 +16,15 @@
 #include "acp-mach-common.h"
 
 #define ACP63_SDW_MAX_LINKS		2
+#define ACP7X_SDW_MAX_LINKS		4
 
 #define AMD_SDW_MAX_GROUPS		9
 #define ACP63_PCI_REV			0x63
 #define ACP70_PCI_REV			0x70
 #define ACP71_PCI_REV			0x71
 #define ACP72_PCI_REV			0x72
+#define ACP7B_PCI_REV			0x7b
+#define ACP7F_PCI_REV			0x7f
 
 #define SOC_JACK_JDSRC(quirk)		((quirk) & GENMASK(3, 0))
 #define ASOC_SDW_FOUR_SPK		BIT(4)
-- 
2.53.0

