Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.194.55
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794066595;
	b=iNdjdEjBQJEs147VW/IEl7SlwrNvzpXALyUzY1f5p4vdWbQqT575IMMUIYbyIUjjbAfL
	 u2K1i3QiGLg6MEFGwbQ25tb+X7pVGusxc/BL93ZDZpL912GnCNbxxMy/rai4ZkuegOpIV
	 eDfQw5zAbJ6CuCTVLFajmnv51WSsFyzrzuAjD7ACT7K+ByR239zUXk7kn0+37HjUgT8rB
	 0DGd2Hj0Hs9WWCspsRrAovmkSRbczybWQpdhZpzFM/An8nMD4uQt6KrgKglPHOHhF2uIZ
	 SlbE2lKvLsuaJGHZPyMY5/PY5AfCWXWl3gpSM9V2ND0/318ENsQqk+nCT1Ozv4TPaMg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794066595;
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
	bh=ImpR4MRGiI+xiLR+001kG9TxO3GEdvKnSoY8tCIMP8g=;
	b=ze9JUQomY7w719Drp+JcUbTFt54zR6Hd8cGmSG77ZM6xQfCwePnPMOm3za0hb1iP5suS
	 V525FpRPVrv1aMYQi0kN0N9P1MDqhI5p0re7Kt3ols72Z5h0eqoEmaMqE+VZUqRS9NuIT
	 x4wJJXxpPEnzfxcXufGk6mIkjFKz7KsNCCyS7MGA0BnVcd4TLf21oDfyNLi/YbFpB/vo4
	 3dDA5CbU8JDaVPCYQkhKS3/K2fVgIN4YBxtqZTH4CgMnoh+aj6uWWEQYVmmChO8YNf2dt
	 SsBnuLQ1OBdxeyrQqa+XTlfkV6BrmE6wA8wQbxBkJ2JwzpiVTXECGdmuNjjCPwYPzPw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=WhpmPVea;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.194.55
Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011055.outbound.protection.outlook.com [40.93.194.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58935606A333;
	Sat,  7 Nov 2026 15:49:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58935606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=WhpmPVea
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FhuW11QFCWy1i7SSuadxLpM/0HRBG3muMuaYQyLe4uMVFlW9xkYqWCm0TIWBG5W3CNLNym1v4jmP9ADgfANTxesjOSeRLdWZWUO7Krlu+eLYtb8L+w+MQ4dZUlOwYu3KESv6JGhA/tor1AY/HhHnhLWGbTmxZGW6UGIVaI35DuqYuSf651DXS6v0ttHVL5tvo0GREL/17maf4uLgSFSrqiYxdO0IiukgKtosnvrXyK5c5KnGn9t4HcNBZhWzWqiNB//nWeGvZVGuhBz1vMB/1mYEJbmoUjzSt1ey/Cdw68P/S4MaYTTAPwlWkZcYU2ReOWUduZVl1OaKCnyehclAzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ImpR4MRGiI+xiLR+001kG9TxO3GEdvKnSoY8tCIMP8g=;
 b=iuY+UP+ZzRofmGNPnkck1t7iYwT0ISVwSySk1enJaYzGG/jWuXBaIYmRyOLopi8GlyriMW5T8DyEKT6SIuxVUM64hSUW4SW0qmPthBkO1f4yQvdCP05aBUgrsc/JRCGlX6t8FXSEcQhs1x/hImEzHBqcBCPA35jm1zim287bP2u8K4w3Aj+vWrVJzd2iTpQlAhJVl76m/3v4D3DmXOrQviTaCHwuxYA9Keiu8l5yKS3/9jRgvH9Jg86JmW75GV5iKBc9R6Sk+mrIRTgAtTmMsmpSUo3aW5IcEesVO+DsWDmibC5CQBaPuCGSEuQRWyB7aPnYXabuZuLs487oHZ7m0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ImpR4MRGiI+xiLR+001kG9TxO3GEdvKnSoY8tCIMP8g=;
 b=WhpmPVeaWwinBHcGD9fu9GdW1Jh2ucpC9pr4kQ6N3amTAInivqI9kFYHHXRwcqTXx9Zt6fqZ3Pdu4dd8hadQMN6ZF4rUgpGUmfSmQa+LoXUQ1+Mp5u1kGj71KlNrbjGw8khBCNxJB1RMT6RwmHF66PqCwI7SxjAz00wnzg3m4S4=
Received: from PH0PR07CA0105.namprd07.prod.outlook.com (2603:10b6:510:4::20)
 by CH4PR12MB840224.namprd12.prod.outlook.com (2603:10b6:610:51a::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Sat, 7 Nov
 2026 15:49:50 +0000
Received: from BY1PEPF00026969.namprd05.prod.outlook.com
 (2603:10b6:510:4:cafe::3) by PH0PR07CA0105.outlook.office365.com
 (2603:10b6:510:4::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.11 via Frontend Transport; Sat, 7
 Nov 2026 15:49:49 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BY1PEPF00026969.mail.protection.outlook.com (10.167.244.153) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Sat, 7 Nov 2026 15:49:49 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Sat, 7 Nov
 2026 09:49:48 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Sat, 7 Nov
 2026 09:49:48 -0600
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb08.amd.com (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53
 via Frontend Transport; Sat, 7 Nov 2026 09:49:44 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <broonie@kernel.org>, <yung-chuan.liao@linux.intel.com>,
	<pierre-louis.bossart@linux.dev>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <venkataprasad.potturu@amd.com>,
	<Syed.SabaKareem@amd.com>, <Mario.Limonciello@amd.com>,
	<Richard.Gong@amd.com>, <lee@kernel.org>, <Poojitha.N@amd.com>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>
Subject: [PATCH v5 24/25] soundwire: amd: fix shared-register RMW race in amd_sdw_set_device_state()
Date: Sat, 7 Nov 2026 21:15:33 +0530
Message-ID: <20261107154659.3358223-25-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261107154659.3358223-1-Vijendar.Mukunda@amd.com>
References: <20261107154659.3358223-1-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: BY1PEPF00026969:EE_|CH4PR12MB840224:EE_
X-MS-Office365-Filtering-Correlation-Id: b666da54-0475-43f0-7326-08df3ce6c186
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|23010399003|376014|1800799024|18002099003|22082099003|6133799003|10067099003|11063799006|261102123227099003|261021121427099003|261022075727099003|56012099006|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	QLwlkE5sHzItsj8Nhl5ZHKtEpZN6Ps2YpKgo7Iykc4YzAVEWCw96xIZi0sjsLXAhZpkTSxz1vqnIzGeuG3j8jEiGGgJlr3gPNMI0CmrvrTXPOG1QTl9y3m+sfkvUSBEven2A7YFbSh+QfpZpDo+M4rRpN05nviNFJjJQBsXmVnn+ONxYrJaNKDyTyj18wwRKh7llOoQzmkfYMf3I+LOuKVecDa5r+ZPfGNv1Nj0u8L6kvJRMUDaXv/J9b63hOvdMrjeS0BPCQaABuZzT0V9JuevWt8/xkbRu6/Cl+qSZOkVsydWVZh+nIXaN9XVTwjsz3mKrluluoRZuPVrTAoJ2NPpNNkSJt4nvYtFIxmzTolQ6ih4IMTClbO2ut4rSiwM5lsiXfKdas1i7Pjis3U2Z93U/OPIAjhXqsMohypcRxI2mGNJc3UIHNjDae5DfCyViNP4tVDM19RO/I+HAunZUVB3Ij1mjfZldazfMl2ki8AjCLnL8WzSQbb2nzVBChqr8ZYCDemPcMOKREGH7rT+OEc2sKRndyusiXiWfTeoke0ww5rIzOabGbOKKmlejAfLFpL5zEc8+Bquzc7InzGlAcOgLu6ebmSeGqqxYhcspb/Q9RK723XLbQ0WbtkCbgbaoKfucOPw+ItSRAC2fQWhoSP8QnRbKMR2QTAotaGIDn+yAKCtOIiokd+nwS7ZOn8PwmCyeIFSTSvwMqtcNDD7O6g==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(23010399003)(376014)(1800799024)(18002099003)(22082099003)(6133799003)(10067099003)(11063799006)(261102123227099003)(261021121427099003)(261022075727099003)(56012099006)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	iOBZczrNcWbJQKM73+F23FIg8QZnjytgRiRygHHK6aiwm+ii61f4eLAbX7rgPbbweXlSYnYydxbN6roIM24eia4DMIWXB2kfBegX2QVh2QwsvSsWshAuXi38216SsY0OZqe6yXVYMRItG93UgRNnVai2oO8FGXpD3KDMXEB3fa2Yk/xumax1u8/RGQwl11A3WYd1lsxCkJjGPI/pkcpuV2i6GBjAKtfia1NMWJOK0RJrYUBBnKC3gnNZMCE93rc8ya7+T9xn+lb36KewcGsOBRraroqJGSUBt2wfeBi9s8nB81P/S9jur6fEUXS1Qc7GqzyoA6AUcObgrIZRaNUwnVJ0iB7X/IzVZ/QOHdtDDIITEI8bAG6vaGze9PGEa+1Rnnp0ZzNt8zqF4Q93DVYqUS8uyGE8skoxz1hHiQdDFWdVUrt653OwjMKB9lILGGDc
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2026 15:49:49.5600
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b666da54-0475-43f0-7326-08df3ce6c186
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF00026969.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH4PR12MB840224

AMD_SDW_DEVICE_STATE packs the D0/D3 state for SDW0 (bits [1:0]) and
SDW1 (bits [3:2]) in a single ACP-level register.
amd_sdw_set_device_state() performed a read-modify-write sequence on
this shared register without holding acp_sdw_lock, leaving it open to
a lost-update race when SDW0 and SDW1 execute concurrent PM transitions.

Acquire acp_sdw_lock around the read-modify-write sequence. Unlock
before returning -EINVAL from the default branch so the mutex is always
released on every exit path.

Fixes: 829c3e1cb4a3 ("soundwire: amd: set device power state during suspend/resume sequence")
Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 drivers/soundwire/amd_manager.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
index 4e151f7350c9..495f0607bb0b 100644
--- a/drivers/soundwire/amd_manager.c
+++ b/drivers/soundwire/amd_manager.c
@@ -279,6 +279,7 @@ static int amd_sdw_set_device_state(struct amd_sdw_manager *amd_manager, u32 tar
 {
 	u32 sdw_dev_state;
 
+	mutex_lock(amd_manager->acp_sdw_lock);
 	sdw_dev_state = readl(amd_manager->acp_mmio + AMD_SDW_DEVICE_STATE);
 	switch (amd_manager->instance) {
 	case ACP_SDW0:
@@ -290,10 +291,12 @@ static int amd_sdw_set_device_state(struct amd_sdw_manager *amd_manager, u32 tar
 				  AMD_SDW1_DEVICE_STATE_MASK);
 		break;
 	default:
+		mutex_unlock(amd_manager->acp_sdw_lock);
 		return -EINVAL;
 	}
 	writel(sdw_dev_state, amd_manager->acp_mmio + AMD_SDW_DEVICE_STATE);
 	sdw_dev_state = readl(amd_manager->acp_mmio + AMD_SDW_DEVICE_STATE);
+	mutex_unlock(amd_manager->acp_sdw_lock);
 	dev_dbg(amd_manager->dev, "AMD_SDW_DEVICE_STATE:0x%x\n", sdw_dev_state);
 	return 0;
 }
-- 
2.53.0

