Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010065.outbound.protection.outlook.com [52.101.56.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A427A3DB625;
	Tue, 13 Oct 2026 10:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791885865; cv=fail; b=YTVkDbrW/o/Kp/ynfcFoT4jbpnVqYvoLkKTsvZpY+PkQbFb3m5LQ0RU0HJ/oyezyl/V+9ZjkYrU9+wXblDPUQ8S0Qhrk0o4EYogWbMtjvp2jSGw2QH9ch07ykQ+AvpTk72m53CUgPRiMrHt7WoFVYpHEuKAclso1C8OXo9UlxTs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791885865; c=relaxed/simple;
	bh=3jnvyhB5sCMztF34PMV9LW19ie+VlE1HVm7h+J4gJy8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mJI5JM8x99pvk1GmHmyFpMPOsFotIkV/NMMPtB5L+awpEEbw61X+xVNHd7iSdp5zo7+eoPUh+2xTgmUvd0mvg1WIQEP8W0TF3CTsj3PUmuZNdRUHdaEGh1SNoPYiVdarwRY278xA2A45XKuMFYvI5jZVnr6sip0nHCNiA5muDWQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=HF9n09v9; arc=fail smtp.client-ip=52.101.56.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="HF9n09v9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JHzOiarzMabERFcf0lnHezlxMGYapVKHaohiKlzBx+dRteEbg32go6DmXFtA+X+y9F0C9p4pfUfIVLa3GoGd2U+O6k39nPPyj0yAF0whNc0OO5CY5ORWg0rEE2GN1R3ezb4zZVnVVF+KYt9Ts4vOfRPgcdmhrFapaKW+ZDZqbGUd4FK6A+UummpRzejqoML0ViachcvKdQJqDheDUOCp2Ziy8e8tzwGP7hps3CQs6jPsOYNFnfcCiuMkKIMw6U+ap4OTZMtwWTZywyyroA2n6GJpdxJAgPIeE7KKKxBMgwIRt9dTGkhAiKb9W91fQ/jefx5fivL1s2LlHDHctXVhcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JUXHQZp/tlSfBrltVhxTnlLHVMBbXoB7OR7t8SIayoM=;
 b=S2+RHaBZ9uMQkR+WT3FsbctqpRML0TMAYG4bTvLTzJ2wWU7IQ+k/J1iaEqWBwbEweUk2RYK5LvIcTvTeANKGAC4muD/WoQ8xvFbBQf7Aj7txFBvgk8irF6FA3f6DZXFItlTJ6JL0EHEJ6AVwNI52gHRjBqzAhDQa08ePLe9Pbn5L2ThliBChYyxcBLHdWci+FUQEDSKSzpnZ0Ieqnnp709B1peEOoDaTZIC5LDOwjCK8xFuCiBIpb/L63ZIlfZRv08eKElyfWrqjwyd8xOgMGhhkaBMf0EBXuLYzI1Dz7FyfPwdV7+U2T2hOry2RDesBEbZnchIXQTmMOw8vdvwAGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JUXHQZp/tlSfBrltVhxTnlLHVMBbXoB7OR7t8SIayoM=;
 b=HF9n09v9CJnS2VjXnLQ4Gqb0PHRPItJ38tQrGxUixND8Y4s0oO0vE0xmqSQI5HZN2ea9Rm3YtRr+NubJPCfaXy7E2EfZTC3nVsZSrx3b3P1xnGFqQh8CETO4Unqdy8mGixSRbkgfhHk5yXHDYIA5Qwo7sNdHnjg0teN+bvx3qck=
Received: from SJ0PR13CA0060.namprd13.prod.outlook.com (2603:10b6:a03:2c2::35)
 by LV2PR12MB5775.namprd12.prod.outlook.com (2603:10b6:408:179::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Tue, 13 Oct
 2026 10:04:16 +0000
Received: from SJ1PEPF00002326.namprd03.prod.outlook.com
 (2603:10b6:a03:2c2:cafe::a8) by SJ0PR13CA0060.outlook.office365.com
 (2603:10b6:a03:2c2::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.4 via Frontend Transport; Tue, 13
 Oct 2026 10:04:16 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ1PEPF00002326.mail.protection.outlook.com (10.167.242.89) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Tue, 13 Oct 2026 10:04:16 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Tue, 13 Oct
 2026 05:04:02 -0500
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53
 via Frontend Transport; Tue, 13 Oct 2026 05:03:58 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <broonie@kernel.org>, <alsa-devel@alsa-project.org>,
	<yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, <Richard.Gong@amd.com>,
	<Vijendar.Mukunda@amd.com>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH V2 1/9] soundwire: amd: rename AMD_SDW_MAX_MANAGER_COUNT macro
Date: Tue, 13 Oct 2026 15:28:47 +0530
Message-ID: <20261013100306.2921771-2-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20261013100306.2921771-1-Vijendar.Mukunda@amd.com>
References: <20261013100306.2921771-1-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002326:EE_|LV2PR12MB5775:EE_
X-MS-Office365-Filtering-Correlation-Id: ac40f6f3-a5d3-4cf4-4193-08df29115754
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|23010399003|36860700016|376014|1800799024|6133799003|22082099003|18002099003|10067099003|11063799006|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	8IHTIWt8ugndtsifdR8SbJFiVNE9LX3SzLxwgk01mktlQ6NG7W1gvdHi9dghhgTvJzGuy6lFyfTiBFo9L2Oo/G2iS8yCijmuSKFHG8u3mVvS7p/kIRLvJ0cuXszhNmQGV9IKhyh1yxJYjZsLjT5ndaFlUwzJticOe6GOpybgt62fW3Y+QhKgRXzNL1D8/1rXlA1+MktKhHFlRCkAQjgtQ47v1hjd6TR+DS55ZkflsAfLsK7OIlgFwzX+AQAz0FSA+BD941MqInA6nbR8EooJiQmjgmo+F1TWX3ABV7wmZhhCd3ImUBXpRnn3htXqBiBlRj6fz44rWfJ2d6PdUcPM4QyE6CySEAKf7hJ0Gc72L4dgClnfZYYUuaPuL0QHdaMinxUwzCkVIbCKOji7vxgcU9V8NOcgDvO97D4x6gpBUXXqpVp/whBxOdg1phYUESEuuDjdTE9g0hCMFFagt/0vMgwco5CQB0E0oJejzrqxctnCBk/pm16qPDPZRHKtXW8dG4SU5PidrvV/aDIXvjkRQAtpcJK0TSe4SBux1P9FDJYyO1PhqN08QUWbhZCVwXrLpnFQzsoUfgtaRwPWa6ub5XyYjR/MCmBS1A+xHq/IVzmrgf/KeN4G2pMPNoAhShfSHdYcNZD+N2A6U5kpJesMjAyBri/BQE0T2oDcghQqiT73j6ThORmLHFfMepi252S5azhlRZTkFAARH5ucmBjDIQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(36860700016)(376014)(1800799024)(6133799003)(22082099003)(18002099003)(10067099003)(11063799006)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	M0OBJDdLrNjZXWuGS9aJfI9HycywIUqsBUNftTwRWcnmzAdv0AaiXwfAmRwOYe5ATYo6hc1f69jnuA6GBDaTj08iUjoJ8um6G7VvwRjRq7pRfLnIViiQHaMS6ADxssX8Ka0Q9vRng8D6Gm3ruaAn6W0sWS0Vysu6SjZnRvyMZ7UazO2W5FI/F5o5PArfsqEtQZgNn4gBHGMSSRHXnYNnKkL4HpTqG0ErcV0WlezMdHPKMoFrB7dtnAn3+o5t2ScyhrprVIzTCFeWproUi55QpG+WemLnV+gImHkgpmUwXGI0Z6Nkk+N2ddP1Bf+EEe6sZk6/T52L33aa4uH+9W6pZRYrBlOTCl9BpBJB66SVRmlNu/eXOG/evVCW6N9Cj25+NmyB+okvJ8guHdk4wT9MmwJN0EGkwb5+WLj3/fkVyiAxe0ka1j+oRX5LoUxlwvuj
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2026 10:04:16.4915
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ac40f6f3-a5d3-4cf4-4193-08df29115754
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002326.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5775

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
index beb982b17fa9..c4eb97e46807 100644
--- a/drivers/soundwire/amd_manager.c
+++ b/drivers/soundwire/amd_manager.c
@@ -486,7 +486,7 @@ static int amd_sdw_compute_params(struct sdw_bus *bus, struct sdw_stream_runtime
 	int port_bo, hstart, hstop, sample_int;
 	unsigned int rate, bps, channels;
 	unsigned int stream_slot_size, max_slots;
-	static unsigned int next_offset[AMD_SDW_MAX_MANAGER_COUNT] = {1};
+	static unsigned int next_offset[AMD_ACP63_SDW_MAX_MANAGER_COUNT] = {1};
 	unsigned int inst_id = amd_manager->instance;
 
 	port_bo = 0;
diff --git a/drivers/soundwire/amd_manager.h b/drivers/soundwire/amd_manager.h
index 88cf8a426a0c..76ecaceb3ee5 100644
--- a/drivers/soundwire/amd_manager.h
+++ b/drivers/soundwire/amd_manager.h
@@ -266,7 +266,7 @@ static struct sdw_manager_dp_reg acp70_sdw_dp_reg[AMD_ACP70_SDW_MAX_DAI] =  {
 	 ACP_SW_AUDIO2_RX_OFFSET, ACP_SW_AUDIO2_RX_CHANNEL_ENABLE_DP0},
 };
 
-static u32 sdw_manager_reg_mask_array[AMD_SDW_MAX_MANAGER_COUNT] =  {
+static u32 sdw_manager_reg_mask_array[AMD_ACP63_SDW_MAX_MANAGER_COUNT] =  {
 		AMD_SDW0_EXT_INTR_MASK,
 		AMD_SDW1_EXT_INTR_MASK
 };
diff --git a/include/linux/soundwire/sdw_amd.h b/include/linux/soundwire/sdw_amd.h
index d0e97007e3ff..40ba84c3b2cc 100644
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
@@ -138,7 +139,7 @@ struct sdw_amd_acpi_info {
 struct sdw_amd_ctx {
 	int count;
 	u32 link_mask;
-	struct platform_device *pdev[AMD_SDW_MAX_MANAGER_COUNT];
+	struct platform_device *pdev[AMD_ACP63_SDW_MAX_MANAGER_COUNT];
 	struct sdw_peripherals *peripherals;
 };
 
-- 
2.48.1

