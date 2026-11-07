Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.201.38
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794089462;
	b=nb4jGff050bSR6dYNydhbJfUaPpAntRITMxjuicbZSsmEhFbhcYHAXW0eIlePXGhnVt1
	 9GvKSjFWCFUbshNiBSGLyBRSTmyjRILk+AFoOk/rGnWPywcxRfsb/1po2H+CX59eGGSer
	 d+jXTWWM600YGguGZX8+gSr3JL4msmlyqTeZXNJnv2uuAfLOs0+yFVNltRud63++SmdLq
	 B0t9exrrNPFcJTFSTLOprK8hRV2eUQeiWPaCzKVqIeeSdzu9U+/fTedBfSe1MOo+Sj5Ok
	 eXDIoOBlYhxDMSW9pSvkkseXl1eD4rm0DnQ1ulizyiCxrTMzoF8pyXGAbc4yuiiRwDw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794089462;
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
	bh=np3Ee4kG3Xo3E9UeqOU44WgWsJELqHapQa4kA7GY80A=;
	b=pZkxYyRvOXNE9NE/y9f/ORhzZbmxF308GbTtprdsyCbgSLqo9euxgGQQIcS3P4oj8MDT
	 6Hx6xC7mc36pDbgrkMzYjpEu0sZObsx64GXCFRnI3KEDPStVG/y+fYxhrSrUALzGtWBMB
	 VGJJkgOB8NS1x8HAzsI2RXYQY4eVverLke14KONR56Lhz+5c/0qxMMA21wJx3S/+nlIAM
	 dYQ1Icb9h+UEgjBDNBwPCtEu7Jx0y013uqubnPJUWqHVKRhcFsblTqNvvyYrF1qAFDA3+
	 eBYsv4DhMCgHT1C65OqRjtMyx3ZPe57sUZ/8eMOdCgpg2Ml+LvBrJm5SlRTzwoBBWTg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=XVPlUX8f;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.201.38
Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010038.outbound.protection.outlook.com [52.101.201.38])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5ECB606A32C;
	Sat,  7 Nov 2026 22:11:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5ECB606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=XVPlUX8f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BsSGTcHnDpfpDYbIoA2SvyozuUzKB28+QOWuKl25snNRducvX7hDd/iblM9ZTiETKXALY92QtcFOazjj0qXy5fy0wjuhBzIwvt3kctAEL9CCzP6wiNVO9ZYI/yBMdrfQVxrqbWHYJrATo7ExFVPqUAu6NznRE6iY20aUI50P+3qGiZSq9+dZvvq7/RqmK5nkNZhM/IUYYCUgtA17d2v/2CURWVY6sTjEEci3LcBPZs4laN1QxdtEHBlzChsiDUXcBCNI2I98fHFOutUh5So4bOT4CF2S3tIlGXyQLP6GgxVJ7lBsWuTXqpg7oI5Fjhtwbak1Hf530Gr/EyQmaYtU/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=np3Ee4kG3Xo3E9UeqOU44WgWsJELqHapQa4kA7GY80A=;
 b=zHIvhTuUB+POixj+YsV2jcNS1RkqszPVeh3oU2az0unPlvYJqSGadm2QXFHkOFJvHwdNNesizmXBeEM7tU55kwrJqUAQsOVZvNsUw6tZRQAUxRcVa3pXFezqaf3d6mSHQ+0AXN9sBOU9kvAeDLWNpGsWIh/4ucgNhrJeenDb0J/EU0HxYmYzkuc+CIe2etF3gW/NtUp2JptimLx1L5S0YV8vbzneoMmE8DPV6lAxYd9wf6YZhpkyxjBelb2d+YGOB4Uhu786HcDs1pIPiaRv6ZFfCEELx+XmO9vl4+c3w18/p+3PE7wdUks4OxzSLjnrEsrrG0ajy7EdUicWoy+9dA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=np3Ee4kG3Xo3E9UeqOU44WgWsJELqHapQa4kA7GY80A=;
 b=XVPlUX8fGyJ55KXJOzWe0V7uDs7LftfRPCn3za2ZY7Lz4Tt1EpW+MkKaJfSrhAiMxw2KhogFdx630WMOhF9PqMUSOz9ggugU0WOS5fR34qEIbG+HHhifi3sMYuIESw2ySYyAEiecffZu0eCT4a7G42cQ81oOS2XblbFThtn3RA0=
Received: from CH0PR03CA0023.namprd03.prod.outlook.com (2603:10b6:610:b0::28)
 by PH7PR12MB7890.namprd12.prod.outlook.com (2603:10b6:510:268::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Sat, 7 Nov
 2026 22:10:55 +0000
Received: from CH2PEPF000166C3.namprd04.prod.outlook.com
 (2603:10b6:610:b0:cafe::19) by CH0PR03CA0023.outlook.office365.com
 (2603:10b6:610:b0::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.11 via Frontend Transport; Sat, 7
 Nov 2026 22:10:54 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CH2PEPF000166C3.mail.protection.outlook.com (10.167.244.231) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Sat, 7 Nov 2026 22:10:54 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Sat, 7 Nov
 2026 16:10:54 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Sat, 7 Nov
 2026 16:10:54 -0600
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53
 via Frontend Transport; Sat, 7 Nov 2026 16:10:50 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <broonie@kernel.org>, <yung-chuan.liao@linux.intel.com>,
	<pierre-louis.bossart@linux.dev>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <venkataprasad.potturu@amd.com>,
	<Syed.SabaKareem@amd.com>, <Mario.Limonciello@amd.com>, <Poojitha.N@amd.com>,
	<sravisar@amd.com>, <Richard.Gong@amd.com>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH 07/11] soundwire: amd: add IO pad enable/disable for ACP7B/7E/7F D0/D3 sequence
Date: Sun, 8 Nov 2026 03:38:02 +0530
Message-ID: <20261107220913.4058072-8-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261107220913.4058072-1-Vijendar.Mukunda@amd.com>
References: <20261107220913.4058072-1-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF000166C3:EE_|PH7PR12MB7890:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b2bf518-7416-4453-e893-08df3d1bfe49
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|36860700016|1800799024|82310400026|11063799006|5023799004|56012099006|261021123027099003|261021121427099003|261022105027099003|261022075727099003|261009220027099003|261009221227099003|261009223027099003|261009223327099003|261009221727099003|261026140227099003|261026121527099003|261028144727099003|261102123227099003|10067099003|22082099003|18002099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	PbnHaXj9xBQHDpW4tHwEiv+319Z60obgInYOfEfXiJNdkm7fCUA66RWd7oRwZarkauP1X8BGRmLk93QP/BERYR0RGKMju5WQbr4zTCV42rYkw7kzFt8bubBqTJ1X8a7cqGt4/aIfbpH6OeErCy4AHJyV4TmvItwK8LHCjyG/7I5gxpJGWJ8/3InQRZ4o+TIJWlYcF362PwwAYF2vtGDAN7AU+3fEoCfIPuDGf31iNpL1TJnVBEEooeoLVmsbMTVzBOQu2/A5kNVoM3Fh8Jk/TW5lCbmE/uECXOShf1+Xi5FV2EKAe20i/8Yc3cIxqvwFyo3UR0QRkroK2QX/N3Jp7L6FYUbzPTVc2dm9GXXITfs2ngE75Mfq3V33az6jbQjobtNL9+ZKQkun34GDnZ5uLxKM3WX4EaJAuvahBPV9+Wui+k+5wUe7famVuU10lDdIuEhMLEYKxyIDaK31OcOTbyEwrrfxzUt1yCgOq4X74QvP4Er6ybglnJ32fxSOiuEnMo1sdO2ymJ8uwMlkcWo5wOSg1MIo4SmgpPf+TcHhpTm8Rkv3kbsME7j8ZORaxSEk8J/nXzMeUxur9ANcIj+DHmLleEgCJBZBVMOIo0fZBQLx9FJ0IrF+yyUPwkM0YGzN4IHADdeF6fi31qQOqd6/tujMwOHI3IFK6MiHho5ak7fvxZ7GNEkNGc5quLA7IBUbRtB20b0eVEhmg91Hyhq7gQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(36860700016)(1800799024)(82310400026)(11063799006)(5023799004)(56012099006)(261021123027099003)(261021121427099003)(261022105027099003)(261022075727099003)(261009220027099003)(261009221227099003)(261009223027099003)(261009223327099003)(261009221727099003)(261026140227099003)(261026121527099003)(261028144727099003)(261102123227099003)(10067099003)(22082099003)(18002099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	+MuoiPzi81kghcWD3tkS/Gs+Xxzorn0oz+bYxX2HM8nB+CFM3Toql8NrHQ41z3lHValEOqqqc+5vH1og5Ip61AaQyoQ5i77t7s2PnAb2I97zYS3xO+eTRZyuSVBE72mHXRNwoBDSHW+hVD8zZTfJ+ZV2j5/7ffqW+b7z/85oEo/0b48DecsiVCsh44KBV66xF+fYpWdRtUQCmDCGDBPals/NBiApuCfCCj7KEq8TVa/a39TE0a+koXbqx2h1C+yzsH4oCyOM3lw2X3a0jfuzp/qf+U0SY7PMye2MATqrjkqNgMjPfN8p/OIkIiiUHN//se03CFq4UHDsCQGJLhOHfdO0ASEgrsIV6+vt1rcCWUcegMOZSzhMMAZTL+wI1GycB1xyhsvF7gk2Tp1JmeSMajD8pa8VxY0A1ZTVUYRXxtI/3IdkAuI5Ma/6/fb3LXFg
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2026 22:10:54.9010
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b2bf518-7416-4453-e893-08df3d1bfe49
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF000166C3.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7890

ACP7B/7E/7F SoundWire IO pad registers (ACP_SW_PAD_KEEPER_EN,
ACP7X_PAD_SCHMEN_CTRL, ACP7X_PAD_DISABLE_OE_CTRL) are reset when the
ACP power domain is removed at D3. Without restoring them on D0 resume
the output drivers are tri-stated and SoundWire IO cannot function.

Add pad control functions for ACP7B/7E/7F in amd_init.c:
- amd_acp7x_sdw_pads_save_masks(): compute per-instance bitmasks from
  ACP7X_PIN_CONFIG and revision-specific bump-pin tables; save to
  amd_sdw_manager for use by suspend/resume paths.
- amd_acp7x_sdw_pads_enable(): restore all three pad registers in the
  HW-required order (KEEPER_EN -> SCHMEN_CTRL -> DISABLE_OE_CTRL) on
  D0 resume after a power-off cycle that cleared all pads.
- amd_acp7x_sdw_pads_disable(): tri-state output drivers (DISABLE_OE
  only) for runtime D3 with wake enabled.
- amd_acp7x_sdw_pads_oe_ctrl(): OE-only toggle for clock-stop mode;
  equivalent to amd_acp63_sdw_oe_ctrl() for ACP7.0/7.1/7.2.
- amd_acp7x_sdw_pads_clear_all(): clears all three pad registers in
  reverse order (OE -> SCHMEN -> KEEPER) on device removal or
  power-off system suspend.

Wire the pad helpers into PM paths in amd_acp7x_manager.c:
- Clock-stop suspend (runtime and system): disable OE only via
  pads_oe_ctrl(false); the ACP power domain stays intact so keeper
  and schmen registers are preserved.
- Clock-stop resume: re-enable OE via pads_oe_ctrl(true).
- Power-off runtime suspend: tri-state OE via pads_disable(); wake
  interrupt path remains active.
- Power-off system suspend: clear all three pad registers via
  pads_clear_all() and set pad_fully_torn_down flag.
- Power-off resume: if pad_fully_torn_down is set, restore all pads
  via pads_enable() and clear the flag; otherwise restore OE only
  via pads_oe_ctrl(true). Full bus re-enumeration follows in both
  cases.

In amd_manager_common.c amd_sdw_manager_start(), add explicit cases
for ACP6.3/7.0/7.1/7.2 (break, no pad masks needed) and return
-EINVAL for unrecognised revisions. For ACP7B/7E/7F, propagate any
error from pads_save_masks() as a hard failure so the driver does
not start with uninitialised pad masks.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 drivers/soundwire/amd_acp7x_manager.c  |  14 +
 drivers/soundwire/amd_init.c           | 365 ++++++++++++++++++++++++-
 drivers/soundwire/amd_init.h           |  13 +
 drivers/soundwire/amd_manager_common.c |  31 +++
 include/linux/soundwire/sdw_amd.h      |  20 +-
 5 files changed, 436 insertions(+), 7 deletions(-)

diff --git a/drivers/soundwire/amd_acp7x_manager.c b/drivers/soundwire/amd_acp7x_manager.c
index 33fc9ced48b6..721d4e97371b 100644
--- a/drivers/soundwire/amd_acp7x_manager.c
+++ b/drivers/soundwire/amd_acp7x_manager.c
@@ -636,6 +636,7 @@ static int amd_acp7x_sdw_suspend(struct amd_sdw_manager *amd_manager)
 		ret = amd_sdw_clock_stop(amd_manager);
 		if (ret)
 			return ret;
+		amd_acp7x_sdw_pads_oe_ctrl(amd_manager, false);
 		acp_enable_sdw_interrupts(amd_manager);
 	} else if (amd_manager->power_mode_mask & AMD_SDW_POWER_OFF_MODE) {
 		acp_disable_sdw_interrupts(amd_manager);
@@ -651,6 +652,8 @@ static int amd_acp7x_sdw_suspend(struct amd_sdw_manager *amd_manager)
 		ret = acp_disable_sdw_manager(amd_manager);
 		if (ret)
 			return ret;
+		amd_acp7x_sdw_pads_clear_all(amd_manager);
+		amd_manager->pad_fully_torn_down = true;
 	}
 	return acp_sdw_set_device_state(amd_manager, AMD_SDW_DEVICE_STATE_D3);
 }
@@ -675,6 +678,7 @@ static int amd_acp7x_sdw_suspend_runtime(struct amd_sdw_manager *amd_manager)
 		ret = amd_sdw_clock_stop(amd_manager);
 		if (ret)
 			return ret;
+		amd_acp7x_sdw_pads_oe_ctrl(amd_manager, false);
 		acp_enable_sdw_interrupts(amd_manager);
 	} else if (amd_manager->power_mode_mask & AMD_SDW_POWER_OFF_MODE) {
 		acp_disable_sdw_interrupts(amd_manager);
@@ -690,6 +694,7 @@ static int amd_acp7x_sdw_suspend_runtime(struct amd_sdw_manager *amd_manager)
 		ret = acp_disable_sdw_manager(amd_manager);
 		if (ret)
 			return ret;
+		amd_acp7x_sdw_pads_disable(amd_manager);
 	}
 	ret = acp_sdw_set_device_state(amd_manager, AMD_SDW_DEVICE_STATE_D3);
 	if (ret)
@@ -719,6 +724,7 @@ static int amd_acp7x_sdw_resume_runtime(struct amd_sdw_manager *amd_manager)
 		ret = amd_sdw_host_wake_enable_by_rev(amd_manager, false);
 		if (ret)
 			return ret;
+		amd_acp7x_sdw_pads_oe_ctrl(amd_manager, true);
 		ret = acp_sdw_clock_stop_exit(amd_manager);
 		if (ret)
 			return ret;
@@ -731,6 +737,14 @@ static int amd_acp7x_sdw_resume_runtime(struct amd_sdw_manager *amd_manager)
 		ret = amd_sdw_host_wake_enable_by_rev(amd_manager, false);
 		if (ret)
 			return ret;
+		if (amd_manager->pad_fully_torn_down) {
+			ret = amd_acp7x_sdw_pads_enable(amd_manager);
+			if (ret)
+				return ret;
+			amd_manager->pad_fully_torn_down = false;
+		} else {
+			amd_acp7x_sdw_pads_oe_ctrl(amd_manager, true);
+		}
 		sdw_clear_slave_status(bus, SDW_UNATTACH_REQUEST_MASTER_RESET);
 		ret = acp_sdw_clk_init_ctrl(amd_manager);
 		if (ret)
diff --git a/drivers/soundwire/amd_init.c b/drivers/soundwire/amd_init.c
index d8e559439cef..12b7801964a5 100644
--- a/drivers/soundwire/amd_init.c
+++ b/drivers/soundwire/amd_init.c
@@ -16,6 +16,99 @@
 
 #include "amd_init.h"
 
+/*
+ * Pin-config group: maps {clock, data[0..3]} to bump-pin indices per manager.
+ * -1 indicates the pin is not present for that lane.
+ */
+struct sdw_pin_config_group {
+	s8 clock;
+	s8 data[4];
+};
+
+/*
+ * Clock and data bump-pin assignments per manager instance.
+ * Data[0] is the primary (single-lane) data pad used for non-GSYNC operation.
+ */
+static const struct sdw_pin_config_group acp7b_pin_config[AMD_ACP7X_SDW_MAX_MANAGER_COUNT] = {
+	[ACP_SDW0] = { .clock = 0, .data = { 1,  2,  3,  5 } },
+	[ACP_SDW1] = { .clock = 2, .data = { 3,  5,  7,  1 } },
+	[ACP_SDW2] = { .clock = 4, .data = { 5,  7,  1,  2 } },
+	[ACP_SDW3] = { .clock = 6, .data = { 7,  1,  2,  5 } },
+};
+
+/*
+ * ACP7E bump-pin assignments per manager instance.
+ * SW0: CLK=BumpPin_5, DATA={BumpPin_6,1,3,4}
+ * SW1: CLK=BumpPin_0, DATA={BumpPin_2}
+ * SW2: CLK=BumpPin_5, DATA={BumpPin_6,1,3,4}
+ * SW3: CLK=BumpPin_0, DATA={BumpPin_2}
+ */
+static const struct sdw_pin_config_group acp7e_pin_config[AMD_ACP7X_SDW_MAX_MANAGER_COUNT] = {
+	[ACP_SDW0] = { .clock = 5, .data = { 6,  1,  3,  4 } },
+	[ACP_SDW1] = { .clock = 0, .data = { 2, -1, -1, -1 } },
+	[ACP_SDW2] = { .clock = 5, .data = { 6,  1,  3,  4 } },
+	[ACP_SDW3] = { .clock = 0, .data = { 2, -1, -1, -1 } },
+};
+
+/*
+ * ACP7F bump-pin assignments per manager instance.
+ * SW2 uses BumpPin_8 (clock) and BumpPin_1 (data) in multi-link configs.
+ */
+static const struct sdw_pin_config_group acp7f_pin_config[AMD_ACP7X_SDW_MAX_MANAGER_COUNT] = {
+	[ACP_SDW0] = { .clock = 5, .data = { 6,  1,  3,  4 } },
+	[ACP_SDW1] = { .clock = 0, .data = { 2, -1, -1, -1 } },
+	[ACP_SDW2] = { .clock = 8, .data = { 1, -1, -1, -1 } },
+	[ACP_SDW3] = { .clock = 0, .data = { 2, -1, -1, -1 } },
+};
+
+/*
+ * Bump-pin to bit-position mappings for pad control registers.
+ * Index = bump pin, value = bit position (-1 = not present for this revision).
+ * BumpPin_0 has no keeper-control bit on ACP7B/7E/7F, but it has
+ * Schmitt-trigger and output-enable control bits.
+ * ACP7B also has no keeper-control bits for BumpPins 4, 6, and 8.
+ *
+ * Keeper register:
+ *   ACP7B: { -1, 0, 1, 2, -1, 3, -1, 4, -1 }
+ *   ACP7E: { -1, 1, 4, 2,  3, -1,  0, -1, -1 }
+ *   ACP7F: { -1, 1, 4, 2,  3, -1,  0,  1,  1 }
+ *
+ * ACP7X_PAD_SCHMEN_CTRL and ACP7X_PAD_DISABLE_OE_CTRL use the same identity
+ * mapping per revision. The separate disable_oe_map pointer allows future
+ * revisions to use a different output-disable layout.
+ *
+ *   ACP7B: { 0, 1, 2, 3, 4, 5, 6, 7, -1 }
+ *   ACP7E: { 0, 1, 2, 3, 4, 5, 6, -1, -1 }
+ *   ACP7F: { 0, 1, 2, 3, 4, 5, 6,  7,  8 }
+ */
+static const s8 acp7b_pad_to_bit_keeper[AMD_ACP7X_BUMP_PIN_COUNT] = {
+	-1, 0, 1, 2, -1, 3, -1, 4, -1,
+};
+
+static const s8 acp7e_pad_to_bit_keeper[AMD_ACP7X_BUMP_PIN_COUNT] = {
+	-1, 1, 4, 2, 3, -1, 0, -1, -1,
+};
+
+/* ACP7F: BumpPin_1 (SW2 data) and BumpPin_8 (SW2 clock) both map to
+ * keeper bit 1 - this is intentional HW layout for the ACP7F SoundWire
+ * SW2 instance where both pads share the same keeper control bit.
+ */
+static const s8 acp7f_pad_to_bit_keeper[AMD_ACP7X_BUMP_PIN_COUNT] = {
+	-1, 1, 4, 2, 3, -1, 0, 1, 1,
+};
+
+static const s8 acp7b_pad_to_bit_schmen[AMD_ACP7X_BUMP_PIN_COUNT] = {
+	0, 1, 2, 3, 4, 5, 6, 7, -1,
+};
+
+static const s8 acp7e_pad_to_bit_schmen[AMD_ACP7X_BUMP_PIN_COUNT] = {
+	0, 1, 2, 3, 4, 5, 6, -1, -1,
+};
+
+static const s8 acp7f_pad_to_bit_schmen[AMD_ACP7X_BUMP_PIN_COUNT] = {
+	0, 1, 2, 3, 4, 5, 6, 7, 8,
+};
+
 static int amd_acp63_enable_sdw_pads(void __iomem *mmio, u32 link_mask,
 				     u32 acp_rev, struct device *dev)
 {
@@ -64,6 +157,254 @@ static int amd_acp63_enable_sdw_pads(void __iomem *mmio, u32 link_mask,
 	return 0;
 }
 
+/*
+ * Compute bitmask for a pad control register given a manager's bump-pin layout.
+ * Only the clock and primary data pad (lane 0) are programmed for single-lane use.
+ */
+static u32 acp7x_sdw_compute_pad_bit_mask(const struct sdw_pin_config_group *cfg,
+					  const s8 *bit_map)
+{
+	u32 mask = 0;
+	s8 bit;
+
+	if (cfg->clock >= 0 && cfg->clock < AMD_ACP7X_BUMP_PIN_COUNT) {
+		bit = bit_map[cfg->clock];
+		if (bit >= 0)
+			mask |= BIT(bit);
+	}
+
+	if (cfg->data[0] >= 0 && cfg->data[0] < AMD_ACP7X_BUMP_PIN_COUNT) {
+		bit = bit_map[cfg->data[0]];
+		if (bit >= 0)
+			mask |= BIT(bit);
+	}
+
+	return mask;
+}
+
+static int amd_acp7x_select_pad_tables(u32 acp_rev, struct device *dev,
+				       const struct sdw_pin_config_group **table,
+				       const s8 **keeper_map, const s8 **schmen_map,
+				       const s8 **disable_oe_map, u32 *max_pin_config)
+{
+	switch (acp_rev) {
+	case ACP7B_PCI_REV_ID:
+		*max_pin_config = ACP7B_MAX_PIN_CONFIG;
+		*table = acp7b_pin_config;
+		*keeper_map = acp7b_pad_to_bit_keeper;
+		*schmen_map = acp7b_pad_to_bit_schmen;
+		*disable_oe_map = acp7b_pad_to_bit_schmen;
+		break;
+	case ACP7E_PCI_REV_ID:
+		*max_pin_config = ACP7E_MAX_PIN_CONFIG;
+		*table = acp7e_pin_config;
+		*keeper_map = acp7e_pad_to_bit_keeper;
+		*schmen_map = acp7e_pad_to_bit_schmen;
+		*disable_oe_map = acp7e_pad_to_bit_schmen;
+		break;
+	case ACP7F_PCI_REV_ID:
+		*max_pin_config = ACP7F_MAX_PIN_CONFIG;
+		*table = acp7f_pin_config;
+		*keeper_map = acp7f_pad_to_bit_keeper;
+		*schmen_map = acp7f_pad_to_bit_schmen;
+		*disable_oe_map = acp7f_pad_to_bit_schmen;
+		break;
+	default:
+		dev_err(dev, "%s: unsupported ACP rev 0x%x\n", __func__, acp_rev);
+		return -ENODEV;
+	}
+	return 0;
+}
+
+static int amd_acp7x_enable_sdw_pads(void __iomem *mmio, u32 link_mask, struct device *dev,
+				     u32 acp_rev)
+{
+	const struct sdw_pin_config_group *pin_cfg_table;
+	const s8 *keeper_map, *schmen_map, *disable_oe_map;
+	u32 max_pin_config;
+	u32 pad_keeper_en = 0;
+	u32 pad_schmen = 0;
+	u32 pad_disable_oe_mask = 0;
+	u32 pin_config;
+	int i, ret;
+
+	pin_config = readl(mmio + ACP7X_PIN_CONFIG);
+
+	ret = amd_acp7x_select_pad_tables(acp_rev, dev, &pin_cfg_table,
+					  &keeper_map, &schmen_map,
+					  &disable_oe_map, &max_pin_config);
+	if (ret)
+		return ret;
+
+	if (pin_config == 0 || pin_config > max_pin_config) {
+		dev_err(dev, "Unsupported ACP7X_PIN_CONFIG:0x%x for ACP Rev:0x%x\n",
+			pin_config, acp_rev);
+		return -ENODEV;
+	}
+
+	for (i = 0; i < AMD_ACP7X_SDW_MAX_MANAGER_COUNT; i++) {
+		if (!(link_mask & BIT(i)))
+			continue;
+		pad_keeper_en |= acp7x_sdw_compute_pad_bit_mask(&pin_cfg_table[i], keeper_map);
+		pad_schmen |= acp7x_sdw_compute_pad_bit_mask(&pin_cfg_table[i], schmen_map);
+		pad_disable_oe_mask |= acp7x_sdw_compute_pad_bit_mask(&pin_cfg_table[i],
+								 disable_oe_map);
+	}
+
+	/*
+	 * Program pad control registers in HW-required sequence:
+	 *   1. KEEPER_EN - latch/keep pad state
+	 *   2. SCHMEN_CTRL - enable Schmitt trigger on input pads
+	 *   3. DISABLE_OE_CTRL - clear output-disable bits to enable output drivers
+	 */
+	if (pad_keeper_en)
+		amd_updatel(mmio, ACP_SW_PAD_KEEPER_EN, pad_keeper_en, pad_keeper_en);
+
+	if (pad_schmen)
+		amd_updatel(mmio, ACP7X_PAD_SCHMEN_CTRL, pad_schmen, pad_schmen);
+
+	if (pad_disable_oe_mask)
+		amd_updatel(mmio, ACP7X_PAD_DISABLE_OE_CTRL, pad_disable_oe_mask, 0);
+
+	return 0;
+}
+
+static int amd_acp7x_sdw_pads_compute_masks(struct amd_sdw_manager *amd_manager,
+					    u32 *keeper_en, u32 *schmen, u32 *disable_oe)
+{
+	const struct sdw_pin_config_group *pin_cfg_table;
+	const s8 *keeper_map, *schmen_map, *disable_oe_map;
+	u32 max_pin_config;
+	u32 pin_config;
+	int ret;
+
+	pin_config = readl(amd_manager->acp_mmio + ACP7X_PIN_CONFIG);
+
+	ret = amd_acp7x_select_pad_tables(amd_manager->acp_rev, amd_manager->dev,
+					  &pin_cfg_table, &keeper_map, &schmen_map,
+					  &disable_oe_map, &max_pin_config);
+	if (ret)
+		return ret;
+
+	if (pin_config == 0 || pin_config > max_pin_config) {
+		dev_err(amd_manager->dev,
+			"%s unsupported ACP7X_PIN_CONFIG 0x%x for rev 0x%x\n",
+			__func__, pin_config, amd_manager->acp_rev);
+		return -ENODEV;
+	}
+
+	*keeper_en = acp7x_sdw_compute_pad_bit_mask(&pin_cfg_table[amd_manager->instance],
+						    keeper_map);
+	*schmen = acp7x_sdw_compute_pad_bit_mask(&pin_cfg_table[amd_manager->instance],
+						 schmen_map);
+	*disable_oe = acp7x_sdw_compute_pad_bit_mask(&pin_cfg_table[amd_manager->instance],
+						     disable_oe_map);
+	return 0;
+}
+
+int amd_acp7x_sdw_pads_save_masks(struct amd_sdw_manager *amd_manager)
+{
+	u32 pad_keeper_en, pad_schmen, pad_disable_oe_mask;
+	int ret;
+
+	ret = amd_acp7x_sdw_pads_compute_masks(amd_manager, &pad_keeper_en,
+					       &pad_schmen, &pad_disable_oe_mask);
+	if (ret)
+		return ret;
+
+	amd_manager->pad_keeper_en = pad_keeper_en;
+	amd_manager->pad_schmen = pad_schmen;
+	amd_manager->pad_disable_oe_mask = pad_disable_oe_mask;
+	return 0;
+}
+
+int amd_acp7x_sdw_pads_enable(struct amd_sdw_manager *amd_manager)
+{
+	u32 pad_keeper_en, pad_schmen, pad_disable_oe_mask;
+	int ret;
+
+	ret = amd_acp7x_sdw_pads_compute_masks(amd_manager, &pad_keeper_en,
+					       &pad_schmen, &pad_disable_oe_mask);
+	if (ret)
+		return ret;
+
+	/* Program in HW-required sequence: KEEPER -> SCHMEN -> DISABLE_OE */
+	mutex_lock(amd_manager->acp_sdw_lock);
+	if (pad_keeper_en)
+		amd_updatel(amd_manager->acp_mmio, ACP_SW_PAD_KEEPER_EN,
+			    pad_keeper_en, pad_keeper_en);
+	if (pad_schmen)
+		amd_updatel(amd_manager->acp_mmio, ACP7X_PAD_SCHMEN_CTRL,
+			    pad_schmen, pad_schmen);
+	if (pad_disable_oe_mask)
+		amd_updatel(amd_manager->acp_mmio, ACP7X_PAD_DISABLE_OE_CTRL,
+			    pad_disable_oe_mask, 0);
+	mutex_unlock(amd_manager->acp_sdw_lock);
+
+	amd_manager->pad_keeper_en = pad_keeper_en;
+	amd_manager->pad_schmen = pad_schmen;
+	amd_manager->pad_disable_oe_mask = pad_disable_oe_mask;
+	return 0;
+}
+
+void amd_acp7x_sdw_pads_disable(struct amd_sdw_manager *amd_manager)
+{
+	if (!amd_manager->pad_disable_oe_mask)
+		return;
+
+	mutex_lock(amd_manager->acp_sdw_lock);
+	amd_updatel(amd_manager->acp_mmio, ACP7X_PAD_DISABLE_OE_CTRL,
+		    amd_manager->pad_disable_oe_mask,
+		    amd_manager->pad_disable_oe_mask);
+	mutex_unlock(amd_manager->acp_sdw_lock);
+}
+
+void amd_acp7x_sdw_pads_clear_all(struct amd_sdw_manager *amd_manager)
+{
+	/* Clear all pad registers in reverse order: OE -> Schmen -> Keeper */
+	mutex_lock(amd_manager->acp_sdw_lock);
+	if (amd_manager->pad_disable_oe_mask)
+		amd_updatel(amd_manager->acp_mmio, ACP7X_PAD_DISABLE_OE_CTRL,
+			    amd_manager->pad_disable_oe_mask,
+			    amd_manager->pad_disable_oe_mask);
+
+	if (amd_manager->pad_schmen)
+		amd_updatel(amd_manager->acp_mmio, ACP7X_PAD_SCHMEN_CTRL,
+			    amd_manager->pad_schmen, 0);
+
+	if (amd_manager->pad_keeper_en)
+		amd_updatel(amd_manager->acp_mmio, ACP_SW_PAD_KEEPER_EN,
+			    amd_manager->pad_keeper_en, 0);
+	mutex_unlock(amd_manager->acp_sdw_lock);
+}
+
+/*
+ * amd_acp7x_sdw_pads_oe_ctrl - enable or disable OE control for ACP7B/7E/7F
+ *
+ * Clock-stop suspend/resume sequence (power domain stays on):
+ *   suspend: disable OE (set DISABLE_OE bits) to tri-state outputs
+ *   resume:  enable OE (clear DISABLE_OE bits) to drive outputs again
+ *
+ * Uses pad_disable_oe_mask saved at probe time by amd_acp7x_sdw_pads_save_masks()
+ * and reused for every clock-stop cycle.
+ * Equivalent to amd_acp63_sdw_oe_ctrl() used by ACP6.3/7.0/7.1/7.2.
+ */
+void amd_acp7x_sdw_pads_oe_ctrl(struct amd_sdw_manager *amd_manager, bool enable)
+{
+	if (!amd_manager->pad_disable_oe_mask)
+		return;
+
+	mutex_lock(amd_manager->acp_sdw_lock);
+	/*
+	 * DISABLE_OE register: set bits = tri-state (OE off),
+	 *                       clear bits = drive (OE on).
+	 */
+	amd_updatel(amd_manager->acp_mmio, ACP7X_PAD_DISABLE_OE_CTRL,
+		    amd_manager->pad_disable_oe_mask,
+		    enable ? 0 : amd_manager->pad_disable_oe_mask);
+	mutex_unlock(amd_manager->acp_sdw_lock);
+}
+
 static int sdw_amd_cleanup(struct sdw_amd_ctx *ctx)
 {
 	int i;
@@ -107,12 +448,34 @@ static struct sdw_amd_ctx *sdw_amd_probe_controller(struct sdw_amd_res *res)
 	case ACP72_PCI_REV_ID:
 		max_manager_count = AMD_ACP63_SDW_MAX_MANAGER_COUNT;
 		break;
+	case ACP7B_PCI_REV_ID:
+	case ACP7E_PCI_REV_ID:
+	case ACP7F_PCI_REV_ID:
+		max_manager_count = AMD_ACP7X_SDW_MAX_MANAGER_COUNT;
+		break;
 	default:
 		dev_err(&adev->dev, "unsupported ACP revision: 0x%x\n", res->acp_rev);
 		return NULL;
 	}
 
-	ret = amd_acp63_enable_sdw_pads(res->mmio_base, res->link_mask, res->acp_rev, res->parent);
+	switch (res->acp_rev) {
+	case ACP63_PCI_REV_ID:
+	case ACP70_PCI_REV_ID:
+	case ACP71_PCI_REV_ID:
+	case ACP72_PCI_REV_ID:
+		ret = amd_acp63_enable_sdw_pads(res->mmio_base, res->link_mask,
+						res->acp_rev, res->parent);
+		break;
+	case ACP7B_PCI_REV_ID:
+	case ACP7E_PCI_REV_ID:
+	case ACP7F_PCI_REV_ID:
+		ret = amd_acp7x_enable_sdw_pads(res->mmio_base, res->link_mask,
+						res->parent, res->acp_rev);
+		break;
+	default:
+		dev_err(&adev->dev, "unsupported ACP revision: 0x%x\n", res->acp_rev);
+		return NULL;
+	}
 	if (ret)
 		return NULL;
 
diff --git a/drivers/soundwire/amd_init.h b/drivers/soundwire/amd_init.h
index 8324bc7a147f..775a4feb1a0c 100644
--- a/drivers/soundwire/amd_init.h
+++ b/drivers/soundwire/amd_init.h
@@ -12,6 +12,8 @@
 #define ACP_PAD_SCHMEN_CTRL				0x0001450
 #define ACP_SW_PAD_KEEPER_EN				0x0001454
 #define ACP_PAD_DISABLE_OE_CTRL				0x0001468
+#define ACP7X_PAD_SCHMEN_CTRL				ACP_PAD_SCHMEN_CTRL
+#define ACP7X_PAD_DISABLE_OE_CTRL			ACP_PAD_DISABLE_OE_CTRL
 
 #define AMD_SDW0_PAD_PULLDOWN_MASK			(BIT(5) | BIT(6))
 #define AMD_SDW1_PAD_PULLDOWN_MASK			(BIT(0) | BIT(2))
@@ -26,7 +28,18 @@
 #define AMD_SDW1_PAD_SCHMEN_MASK			(BIT(0) | BIT(2))
 #define AMD_SDW_PAD_SCHMEN_MASK		(AMD_SDW0_PAD_SCHMEN_MASK | AMD_SDW1_PAD_SCHMEN_MASK)
 
+#define ACP7X_PIN_CONFIG			0x0001440
+#define AMD_ACP7X_BUMP_PIN_COUNT		9
+#define ACP7B_MAX_PIN_CONFIG			0x16
+#define ACP7E_MAX_PIN_CONFIG			0x1d
+#define ACP7F_MAX_PIN_CONFIG			0x2a
+
 int amd_sdw_manager_start(struct amd_sdw_manager *amd_manager);
+int amd_acp7x_sdw_pads_save_masks(struct amd_sdw_manager *amd_manager);
+int amd_acp7x_sdw_pads_enable(struct amd_sdw_manager *amd_manager);
+void amd_acp7x_sdw_pads_disable(struct amd_sdw_manager *amd_manager);
+void amd_acp7x_sdw_pads_oe_ctrl(struct amd_sdw_manager *amd_manager, bool enable);
+void amd_acp7x_sdw_pads_clear_all(struct amd_sdw_manager *amd_manager);
 
 static inline void amd_updatel(void __iomem *mmio, int offset, u32 mask, u32 val)
 {
diff --git a/drivers/soundwire/amd_manager_common.c b/drivers/soundwire/amd_manager_common.c
index 158845f67224..03c92b6991f2 100644
--- a/drivers/soundwire/amd_manager_common.c
+++ b/drivers/soundwire/amd_manager_common.c
@@ -536,6 +536,22 @@ int amd_sdw_manager_start(struct amd_sdw_manager *amd_manager)
 			return ret;
 		acp_sdw_set_frameshape(amd_manager);
 	}
+	switch (amd_manager->acp_rev) {
+	case ACP63_PCI_REV_ID:
+	case ACP70_PCI_REV_ID:
+	case ACP71_PCI_REV_ID:
+	case ACP72_PCI_REV_ID:
+		break;
+	case ACP7B_PCI_REV_ID:
+	case ACP7E_PCI_REV_ID:
+	case ACP7F_PCI_REV_ID:
+		ret = amd_acp7x_sdw_pads_save_masks(amd_manager);
+		if (ret)
+			return ret;
+		break;
+	default:
+		return -EINVAL;
+	}
 	/* Enable runtime PM */
 	pm_runtime_set_autosuspend_delay(amd_manager->dev, AMD_SDW_MASTER_SUSPEND_DELAY_MS);
 	pm_runtime_use_autosuspend(amd_manager->dev);
@@ -886,6 +902,21 @@ static void amd_sdw_manager_remove(struct platform_device *pdev)
 	ret = acp_disable_sdw_manager(amd_manager);
 	if (ret)
 		dev_err(&pdev->dev, "Failed to disable device (%pe)\n", ERR_PTR(ret));
+	/*
+	 * On device removal, clear all ACP7B/7E/7F IO pad registers
+	 * (DISABLE_OE -> SCHMEN -> KEEPER) so the pads are fully released
+	 * when the power domain is removed permanently. The runtime suspend
+	 * path only tri-states OE; full pad release is done on removal.
+	 */
+	switch (amd_manager->acp_rev) {
+	case ACP7B_PCI_REV_ID:
+	case ACP7E_PCI_REV_ID:
+	case ACP7F_PCI_REV_ID:
+		amd_acp7x_sdw_pads_clear_all(amd_manager);
+		break;
+	default:
+		break;
+	}
 }
 
 static const struct dev_pm_ops amd_pm = {
diff --git a/include/linux/soundwire/sdw_amd.h b/include/linux/soundwire/sdw_amd.h
index 7dfb17603159..2c09a406fbda 100644
--- a/include/linux/soundwire/sdw_amd.h
+++ b/include/linux/soundwire/sdw_amd.h
@@ -87,16 +87,21 @@ struct amd_sdw_hw_ops;
  * @wake_en_mask: wake enable mask per SoundWire manager
  * @acp_rev: acp pci device revision id
  * @clk_stopped: flag set to true when clock is stopped
- * @pad_fully_torn_down: true when system suspend performed a full pad
- *   teardown (keeper, schmen and OE cleared, pulldown asserted). Cleared after
- *   all pads are restored in amd_resume_runtime(). False on initial probe
- *   (zero-initialized) and after a wake-armed runtime suspend in which
- *   only OE was disabled; in the latter case amd_resume_runtime() restores
- *   OE only, leaving keeper and schmen untouched.
+ * @pad_fully_torn_down: true when system suspend cleared all three pad
+ *   registers (KEEPER_EN, SCHMEN_CTRL and DISABLE_OE_CTRL). Set to false
+ *   on initial probe and after a runtime suspend that only disabled OE
+ *   (wake enabled path). amd_acp7x_sdw_resume_runtime() checks this flag
+ *   to decide whether to restore all pads or OE only.
  * @power_mode_mask: flag interprets amd SoundWire manager power mode
  * @ping_slave_stat: cached slave status from the last ping
  *		     transaction that returned a response;
  *		     initialised to U32_MAX ("no valid reading yet")
+ * @pad_keeper_en: bitmask saved from ACP_SW_PAD_KEEPER_EN at probe time;
+ *                 restored in power-off mode D0 resume after a pad power cycle
+ * @pad_schmen: bitmask saved from ACP7X_PAD_SCHMEN_CTRL at probe time;
+ *              restored in power-off mode D0 resume
+ * @pad_disable_oe_mask: output-enable disable bitmask saved at probe time;
+ *                       re-applied (cleared) in power-off mode D0 resume
  * @interrupt_enabled: set when hardware interrupts are enabled; cleared
  *		     before disabling to prevent new work from being queued
  *		     by an in-flight IRQ during teardown
@@ -131,6 +136,9 @@ struct amd_sdw_manager {
 	u32 power_mode_mask;
 	u32 acp_rev;
 	u32 ping_slave_stat;
+	u32 pad_keeper_en;
+	u32 pad_schmen;
+	u32 pad_disable_oe_mask;
 	bool clk_stopped;
 	bool pad_fully_torn_down;
 	bool interrupt_enabled;
-- 
2.53.0

