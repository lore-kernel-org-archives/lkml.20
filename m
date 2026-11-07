Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.52.27
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794068102;
	b=o3Hyn4Kb2QL7dV7r2NQtn3q/mZZWFnJCfX563QsacfgGA5U/I1SZadysVzSn46MMAE6m
	 3zRQzw3Mai+66cu0lXmYrWzLVsU7T18Z64uYiFN3CCDtKH36XD0BAfcKxJpLWVF+0Vjba
	 oGeA4JUlaDFtA+GmFA+wQq+BV3cP9WSsCzCAAcSWopFlHr0DpiSdta8PVJWc8t4gmIHCk
	 bx06tL9y0hf49FOcO5RUYj3/3CxwOAB3zPxGEdFRYgucauuPgceSFWTuGAJL/fN28Yl3M
	 as7RDMM1V57devxmhuB4ft6Y8fBloukXM2XcZYBPptCsZCawWalm1j3hA1BS/+sxB2Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794068102;
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
	bh=xTG93F6+sTWvLNnW8CZDXGFvvndMef37RSNgxsgMhKk=;
	b=POjxHQ5IpYo6yYEAEVyzIXezAN0StUUUKb97V0a9ePFHeI7V51gXurFvSgDfaFapSyqf
	 /LSV1TA8nTEk3jisujhDH/MaqjbS1u/LiixY8hO8+VvWypPE80sNs+VAotP6ABE539kex
	 bmy9P3q1GsWyLpMPhhPR/cTaH1rFbDAiLs3fGcXoCLYxseRFMrcZ2gPI+T34XUqcIbnd3
	 pRCk7hD5ZisvonPuAmp2hB/+1MoLpjPFMz3Aaqbf5S52p78hqhkSrcRTRx4Q/bxAZ6N/w
	 zBrg7qIHR3RnY8ebtbzrKl3HRtqZZkViqIDlvCfOZIAWPYGvYGcqL1Jl3yVcNd4YM4Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=cYT1ZvNE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.52.27
Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011027.outbound.protection.outlook.com [52.101.52.27])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B7B0606A32E;
	Sat,  7 Nov 2026 16:15:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B7B0606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=cYT1ZvNE
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dwZ6TPdu8ju+asI7fwJeMdCIp2iK2/RgUo1R1tzh5t4N22FtJAFeEATLAOch9lKDepb5DeCh5WGg2Quc1GBmEvZF+hJr43qh6/eJEOeDvnEdahng/7s4+xO4EqrNNQ3cOoxqYfHEj8FFhG5JZaKhERNWMcGKm3K/7T2Err7eO40xSIDTNhrGKZRVN36d2DtnfAL+N4gkht8R5QdVvWrG2Qt5qcHd6MWbUa9rlxzzDF2J2013Pciwb8lxVCvawnk0ydR1iuu/krbVYaHz9CdLv85PIb0tWX6mO4YQVEriH/MZtZ+zuHT6g/lK9IJYZc1c72ADK77+jmLvaBgZwFjhQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xTG93F6+sTWvLNnW8CZDXGFvvndMef37RSNgxsgMhKk=;
 b=P/zvoww0rSxKCGPKCKGdece42FWJN+FqU60WYc/cqts8L7lkoBA22BGSVKWwuHA2AqmCG+drEd1rLWBjahfraoUlOo6zHovWORQPGFTJVGK7IQfWejN6+dicy+2A3xdF33v7NRwp34pEK5DFza4m6ENZZr37DepkSc3I7ihYo7E3s7vSggrQrGruISy2kRre2pYYJKMdEbijlQRvu4ZzvoJtieNiU/7cnOnH0H/dzzCKJzr3CVQUL59Vd5oMRlU3OAuh98KqAGQtqEtg6ChCaJmChTp7J9Ojfj8pY6P/lqkPtsm9xs12o0afIAiJZ8EfHZQGChtgcLYHjo007dV9/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xTG93F6+sTWvLNnW8CZDXGFvvndMef37RSNgxsgMhKk=;
 b=cYT1ZvNEbYl7yRJSLYyNK9dZdpOkGPSHQQf2Efumz8rlTMOfxf7sPxxj2Fr38amgUrZrA/UKTOxAhnna++jrvw6HDwghN+z8d1PhlD/luxPFlUNp+9BWaYZvL+ADNwGCPObX7E4reJNwSSVmtJgdJyuzu4zUpqNllMaJ7lxc650=
Received: from BN0PR04CA0063.namprd04.prod.outlook.com (2603:10b6:408:ea::8)
 by CH3PR12MB7546.namprd12.prod.outlook.com (2603:10b6:610:149::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.9; Sat, 7 Nov 2026
 16:14:56 +0000
Received: from BN2PEPF00004FBC.namprd04.prod.outlook.com
 (2603:10b6:408:ea:cafe::4f) by BN0PR04CA0063.outlook.office365.com
 (2603:10b6:408:ea::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.11 via Frontend Transport; Sat, 7
 Nov 2026 16:14:54 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF00004FBC.mail.protection.outlook.com (10.167.243.182) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Sat, 7 Nov 2026 16:14:54 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Sat, 7 Nov
 2026 10:14:53 -0600
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb08.amd.com (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53
 via Frontend Transport; Sat, 7 Nov 2026 10:14:50 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, <Richard.Gong@amd.com>, <Poojitha.N@amd.com>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>
Subject: [PATCH v3 01/11] soundwire: amd: rename AMD_SDW_MAX_MANAGER_COUNT macro
Date: Sat, 7 Nov 2026 21:42:18 +0530
Message-ID: <20261107161345.3411491-2-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261107161345.3411491-1-Vijendar.Mukunda@amd.com>
References: <20261107161345.3411491-1-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBC:EE_|CH3PR12MB7546:EE_
X-MS-Office365-Filtering-Correlation-Id: ffef39c9-2bcb-4a0a-0a00-08df3cea428a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|36860700016|82310400026|56012099006|261021123027099003|11063799006|261021121427099003|261102123227099003|261009223027099003|261026140227099003|261028144727099003|261022105027099003|10067099003|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	lEG6/0bpqBgLt5T7kjuU7mzVotsqqRdXtPn1k5PTZniJ9WhfOSOCUV5aNCtvUyQeOFriPPWK+gVf3z8XxabhycqdOXDOpOVpfRJT6Nexz+Dr1WlzhKX4+uYIOvZMNCeuNNZ4o612Ja5OeRqwvkX86jXu64II/JqrA33JiZZO6jCkfP1lxBhCDij9rOgsSlX1zRg3AnsMQ2arcIoGrYS10Ypu6zgkDMZLOsK+PSzmYi7wJKU+kqnBuHwyknTabIWuZpFh8OwxbXR2F70RCsI0QfSp68wLnu9Bho2jx0qEflwQM0Nv744eYmeeMsnROB/bBq76o8OHicYiVRW0ePlqtnYOIlDwxgJ8k7nEJYaHrhi9uW1ji7CrnFSd0PP8ynaTKP4ylCyxuXMfLrAvNxTydWI0ssdEqaMaGTRFn6kqrX12aaYMJgbB1LswHxM4Wx0hG1iPcisv9DFx68Kf53p0dnecg5I8RaEQKZBUmNYYHprdw+KF6fYL7SUp6O7YbLNGA3Ri7Dm2KQKqkeYvdG0EHgSNUyEcdZzsHegC8f0xPpUWyAE0EFKyuwtZbD+2XR3thsQe1j1KGzbh0r2YwBwM+b36y0jAqSpi8HOXCwYR7yM3MAf+pkOJ7AZwjN/nQ1MRkYUa2SmZfqJr2bmc/1DBgcnts6yNOqXHCFTEro7Y22Lvv/h3lK9aLXwNVG8UGBMo5FWzWnepGTBE5FvojxIAXw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(36860700016)(82310400026)(56012099006)(261021123027099003)(11063799006)(261021121427099003)(261102123227099003)(261009223027099003)(261026140227099003)(261028144727099003)(261022105027099003)(10067099003)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	IXnRar3IvwUUDrPuGlEx2D5I9jAcmU03g/4BmuOD5PBifzCFfTTS5dlIRYGz6FRtcCoQx3CrJNUerCQbjhk8b3eQ8jbWycawkbDo76WBxnyzP+xWCsrkHw/8kYSC3mI+z24D0LToQW5JPxDIKbLN9Yeg0cB6Hqaq5LpZ9JHjLcOUl0MgE3gtiailX/yjH+UO62nC9/YH8nWSU5N2lZpUiy+/GFUr4AGHJW6qYMhEuP4YUIE4X86gwsy44L1WNhI6UWyDLj4hJshXmOAVLKaApQVocyOnnM5v48vo+V+ke0ENE4z3aOey8f8bkCk6Mrj81hOPbQZe4weOOCfdjKccX++9OKoBwHOM5zwGWErLtH4hVl7aPELuRTOS6uyH1YIsIXXv7d5tsoS1RShG3NQ47sDQR4TGzudEa+HB8wCIroxp67dPSIOKB2qhNe9WSqKG
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2026 16:14:54.5835
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ffef39c9-2bcb-4a0a-0a00-08df3cea428a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF00004FBC.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7546

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
index 2c52fd181e3c..dd39968a7770 100644
--- a/drivers/soundwire/amd_manager.c
+++ b/drivers/soundwire/amd_manager.c
@@ -604,7 +604,7 @@ static int amd_sdw_compute_params(struct sdw_bus *bus, struct sdw_stream_runtime
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
index 04b95379a724..b67ae581fa17 100644
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

