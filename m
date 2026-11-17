Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.209.57
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794900056;
	b=bzrQoovN2S8CxoDE2WerYKIUc3P9Hc2iwPcOU568HTdmczMggeLDBtWajItWNUZ6hiUo
	 OB41y46l+LzhiEIsTOsLSO+BJwQBtlsciswkKUpwU248VndfPCEqM0l7Sp6uGDiYXWMnS
	 vWH1HCZZXhd7pCkYurnWsWrLWrjLbMcsIUEHqocUUUsQca0TsUYnolZGbfhmipbVRnXPb
	 P0J2K90zX5ha9F8kvOs6fzUBJYlaZj+7tCWQbVIqWm0N9kHawSYSYJ96d88CzrgVuSSA5
	 D1t+z8R5o6meDrGxiZqGrPXawO3VzGLG9o9RoSx38OVabAeNBT9RXtv0wIBU5TDYq8Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794900056;
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
	bh=Fq5NAs18KyXX/20c+YPtyS1HlEH1YG3pZK8nd8tW5+c=;
	b=SbAtU36oxsf//f6wRX/nO9ksgIthJnA8uhBme2OiDZCl0CkgY2tqS/P0XjxUDYgTTd48
	 T0o6C7aMHxOCvVoj0BiE0Jq8xv2iVfmr5IDSlE6ex32mta6IJb190BtS2651OTM8LChI+
	 u6JerGgdMD+2v6BzG42+BvY+BUp+xfcbZoRIoEqTxltVraunwQ+HpNn/TKp4NWKb1VmM3
	 x46pNoNO3rVOObZiMuEYXgnarsu228hwhxeKCLzrhbdnckTRKqUSS+/bj6c8aCTKx/ydM
	 hUX+KhmifDNHRNHQsZHCKJViKk5QynquVNXh/VFIZCbWZjR09mkTL854p2dY8PUGFmA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=ogYgSv6G;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.209.57
Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012057.outbound.protection.outlook.com [40.107.209.57])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02B2C606A331;
	Tue, 17 Nov 2026 07:20:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02B2C606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=ogYgSv6G
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O9YN0A++VhGEAbklRV92hg4aRT5ANcIDqcsQb17b3By4KjfU3FZgZzFsMo9mgmeKhAjxV0gGMC0stqol3fG5gEtNnFkGFd2lUPfi0xXkXWyu9YbwaXB1MTnMK2j6UGIGNSgBowfNm+dA/f/kYtj/Owm8bzZt6x3l4gRhVC7c2NO9UMcbEPjLa6pjIA4kXnd6wIyCRUEqhd7aPOF/C50D/8shQ40nLlS9Wt+Hy3P+qY6RYbhgmLjye3Qh76Vmwc/iiehWvFAC7DSSFeKknG1VChP2SwKBiZJQA8ZQJ5ZLLxm+axPAyqpeVOPLt9K96xUw0uBy6DJFecnDTHC6m6sQVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fq5NAs18KyXX/20c+YPtyS1HlEH1YG3pZK8nd8tW5+c=;
 b=wjS8LO1cYceDEko/vi2bZ0yXIEjE6oOAyseKcFcoh1evpi2TFJXEEwwVVGwJZ127QpO8Na4X3JUu/jTXCd+CJyL4/lHoSdDKoBpGVeUPefao23qHt0ZJojvNgoZamg/ot7RJ6wpFbuVnGzq6DKergb35yfuQTWWLG/Q2Wqh17snlO++RR6j9AEu4n68PrsOBTEgcw84ru9xxU2fu8a0Sop/9ZlS3Sr4VKH9lbo/WkgELO3pGWxxLOMLI7lUN1is4FWbPcG1J08Soa2P+5wCjOZOvc/WadK3+XuXayhVAaPep71QiOrCHF5ebI5Wd4+rAkiyCbr/7hgjN2HsyourxIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fq5NAs18KyXX/20c+YPtyS1HlEH1YG3pZK8nd8tW5+c=;
 b=ogYgSv6GDVyakkOMpfGnoBcflKpVf9W9eIwbOhyajyoywr3etJS9gl7Fh2TdZpwc+sJzRVjFtPfp+NTKka3FX9RkNyVIQKHoPJcdNAll5zxvnxvt1gF/cyPWuSqVogVTrnPEOrNluGB0MJnHjdinCWsXzWnPjj5TelSsPN17DfA=
Received: from BN1PR12CA0011.namprd12.prod.outlook.com (2603:10b6:408:e1::16)
 by DM6PR12MB4107.namprd12.prod.outlook.com (2603:10b6:5:218::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 17 Nov
 2026 07:20:53 +0000
Received: from BN2PEPF0000A800.namprd02.prod.outlook.com
 (2603:10b6:408:e1:cafe::10) by BN1PR12CA0011.outlook.office365.com
 (2603:10b6:408:e1::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.13 via Frontend Transport; Tue,
 17 Nov 2026 07:20:52 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN2PEPF0000A800.mail.protection.outlook.com (10.167.245.167) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Tue, 17 Nov 2026 07:20:52 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 17 Nov
 2026 01:20:52 -0600
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.57
 via Frontend Transport; Tue, 17 Nov 2026 01:20:48 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, <Richard.Gong@amd.com>, <Poojitha.N@amd.com>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>
Subject: [PATCH v4 01/11] soundwire: amd: rename AMD_SDW_MAX_MANAGER_COUNT macro
Date: Tue, 17 Nov 2026 12:48:10 +0530
Message-ID: <20261117071927.830373-2-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261117071927.830373-1-Vijendar.Mukunda@amd.com>
References: <20261117071927.830373-1-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF0000A800:EE_|DM6PR12MB4107:EE_
X-MS-Office365-Filtering-Correlation-Id: 807b2dfb-9f96-4b36-ca81-08df447b5033
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|23010399003|82310400026|36860700016|10067099003|56012099006|11063799006|261021121427099003|261026140227099003|261022105027099003|261021123027099003|261028144727099003|261102123227099003|261009223027099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	mlX52bfoxBzavRWIgc1kG71A2YS5Re7d94z1VhIjGQsDGCDPvYlptOnfn4UPmX1wyMoJgPgB5kh7EHafGPzwNSFGZ/TLzUlWdbwLYyvTwFGE0A2pxjmsQKLUHedc3LJvcf/oH8bqqhITewqoohK/Xwj+F/3N8rt+/6JP4WdlnSgm7QMxaJplMe1qvGHMx6p+0x/KO5f5znf99RpYr9P039Fi3Ja3fbmkQuHK+ht0i/SahuyNGuvSfxaJ1kTjZvqtgn88u2kS73lh9h39pjwXsDpZISNvLbZvRshQlxyJTm4Fes6jReQE2TRZ1gG6L7VtC6iQFPfwl7JK3rvkJP/mZRkt+J00fNcR5s8xG6npVRzyLa6u8IMIUkOkaQNKzoLupxPxqVr5Bx7Qony5ZZx0WrzpXVYHHMDY/ac4z08cbI1gv1eewiVbjxKm+fx5MItGX7C7rJyRPJDpj8L31vDvigWnwLnlGyJucXoG8N1VugvbZD8gIDodDma9Qu/ABvLjMYjaz2+FPsB1VJy/fSaFLUO2E3NpNwXRdl5kDa2Pc5T2zYggKxt17KnkFSvDbsr2onh/TR1cP4ZHmlz0zQFdLktbt/pnP5EGyNX4DeAKbKlDO+wUKF/zfAdPfV13Y5IqHb7csk7OL7tToxcGCsPIaglqNF71Dj8wgdIDTH+eBki+YK1o7yWKLB3FKBHnejSlUCZmMVd4NwtdH5Rwn2HWqg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(82310400026)(36860700016)(10067099003)(56012099006)(11063799006)(261021121427099003)(261026140227099003)(261022105027099003)(261021123027099003)(261028144727099003)(261102123227099003)(261009223027099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	RupxoTbs9KjfzvRP01Sj5HUkTS5B0/8Cajcm0TdqLNo91vX9F3/DP4EKfQiODgsQDUuPbacGG7aKXK3/lEB5/6fojl1J5FJwR/JV6vEfimSEYiUpeffvaYVvfOc7QRftlfeJOJxvEpO6ffS8sl39u64TmXDMw2GVbd4LagJD4SfUtElOZ5EBGeoiA3kMxOptqo8RpApwcVE2sdaManpdxCOlLXxQKFFcaQemxgbeg0kBE3419s+qvAKViUoBVElxUkcQ7c+BsZUo8VFe/zBMxzBzIP1T9LidDoYRjRKm5PO8e+AHO5gRcq/jYzDeLlmH943IAI7PhhWFYJNWkRtEyJwyJJX3teXcV5tQTZjW9ns/8hAs1FNdxoGmC2+dVBHBS8r0Ti8/UmNTQeVVbdjAGNqwF04l1z8BeM63hZiKixv+1D0+CRg4UY96WSvRiPmi
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 07:20:52.6706
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 807b2dfb-9f96-4b36-ca81-08df447b5033
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF0000A800.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4107

Rename AMD_SDW_MAX_MANAGER_COUNT to AMD_ACP63_SDW_MAX_MANAGER_COUNT and
add a comment clarifying that ACP6.3/7.0/7.1/7.2 all expose two
SoundWire manager instances. The rename makes the platform scope
explicit and matches the acp63 prefix convention used for the shared
ACP6.3-base hardware throughout the driver.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 drivers/soundwire/amd_manager.c   | 2 +-
 drivers/soundwire/amd_manager.h   | 2 +-
 include/linux/soundwire/sdw_amd.h | 5 +++--
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
index f9ababd30393..92e9ff0e03a4 100644
--- a/drivers/soundwire/amd_manager.c
+++ b/drivers/soundwire/amd_manager.c
@@ -595,7 +595,7 @@ static int amd_sdw_compute_params(struct sdw_bus *bus, struct sdw_stream_runtime
 	int port_bo, hstart, hstop, sample_int;
 	unsigned int rate, bps, channels;
 	unsigned int stream_slot_size, max_slots;
-	static unsigned int next_offset[AMD_SDW_MAX_MANAGER_COUNT] = {1};
+	static unsigned int next_offset[AMD_ACP63_SDW_MAX_MANAGER_COUNT] = {1};
 	unsigned int inst_id = amd_manager->instance;
 
 	port_bo = 0;
diff --git a/drivers/soundwire/amd_manager.h b/drivers/soundwire/amd_manager.h
index 98c814d5d7cd..ff49e5d08f68 100644
--- a/drivers/soundwire/amd_manager.h
+++ b/drivers/soundwire/amd_manager.h
@@ -256,7 +256,7 @@ static struct sdw_manager_dp_reg acp70_sdw_dp_reg[AMD_ACP70_SDW_MAX_DAI] =  {
 	 ACP_SW_AUDIO2_RX_OFFSET, ACP_SW_AUDIO2_RX_CHANNEL_ENABLE_DP0},
 };
 
-static u32 sdw_manager_reg_mask_array[AMD_SDW_MAX_MANAGER_COUNT] =  {
+static u32 sdw_manager_reg_mask_array[AMD_ACP63_SDW_MAX_MANAGER_COUNT] =  {
 		AMD_SDW0_EXT_INTR_MASK,
 		AMD_SDW1_EXT_INTR_MASK
 };
diff --git a/include/linux/soundwire/sdw_amd.h b/include/linux/soundwire/sdw_amd.h
index 2213eea4afe1..14f446bed77c 100644
--- a/include/linux/soundwire/sdw_amd.h
+++ b/include/linux/soundwire/sdw_amd.h
@@ -26,7 +26,8 @@
 #define AMD_SDW_POWER_OFF_MODE		2
 #define ACP_SDW0	0
 #define ACP_SDW1	1
-#define AMD_SDW_MAX_MANAGER_COUNT	2
+/* ACP6.3/7.0/7.1/7.2 all expose two SoundWire manager instances */
+#define AMD_ACP63_SDW_MAX_MANAGER_COUNT	2
 #define ACP63_PCI_REV_ID		0x63
 #define ACP70_PCI_REV_ID		0x70
 #define ACP71_PCI_REV_ID		0x71
@@ -149,7 +150,7 @@ struct sdw_amd_acpi_info {
 struct sdw_amd_ctx {
 	int count;
 	u32 link_mask;
-	struct platform_device *pdev[AMD_SDW_MAX_MANAGER_COUNT];
+	struct platform_device *pdev[AMD_ACP63_SDW_MAX_MANAGER_COUNT];
 	struct sdw_peripherals *peripherals;
 };
 
-- 
2.53.0

