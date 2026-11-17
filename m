Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.193.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794899523;
	b=Ihr6iHYeUwa9fNa7LdKokUJouNIuNF3UuxIoPABr37ATQYWC7PFZzuN/hPjsUWWEZ6jq
	 QvxSf7P/PUzvefDr0TW2x12UIwsNwyUiSpeC9BJWM5EYowVd/XlppeYApHx7v2ORf1m1Q
	 gMBDfRAZS59ERjXWUHLsHswzCttMR9DRiGjATRFgnQ4W6YI0l0S4nDJtx3taRceAGzqUS
	 Ab/Sn1eBAkmj0058kR+gQH4ddP7ZiT/t+1QVDgdTSu1ZyyK3g42M73nc9WlGZzxPDqOQJ
	 CmEVkK2GSJ6ewKQe4Zj9+XZ4v18uqjDSX2mOh0T2H4ipf0evuSbrNpLFoji4xL5nK+w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794899523;
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
	bh=rXqW/GOJBbRToEmI773p9d5WGXLMUmbgpxehM0c/j0o=;
	b=rFh4wPGp2A/mVl9BvT6oVcFgI93YhjryVz4JSmDdHm347zURx21TTGwS42cMre5037t8
	 hY/eqn6WwnV8kuqVvGVzdv17s3cimxNzgeCbfoiTgdtMpsgKDJ559UaZ1IVx1nWMZtrx7
	 B9qjtemDCuZHZ303esnNvhatpqeoag9Z5Ond5PBnYguJ915/zv24gKry8DQxrjXMNgFKf
	 q740ay4eS3gUliJiKWlxH8Tu/yPkN7ssLQ/fEoLU91SwBJBV0nTwspU3Sd1h2Y5l9PV/5
	 VZDXZjQmhbK7/CmaUStaT0OFH1Mr2Zyz2p/kEKMcQQmUUwEb8MJzRbAfBSxM6TdxChQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=IUe3Vbv2;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.193.50
Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010050.outbound.protection.outlook.com [52.101.193.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D272C606A8AA;
	Tue, 17 Nov 2026 07:12:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D272C606A8AA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=IUe3Vbv2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o7Xf4273pHib7shFnUwC7bBkphA7i293569pzVYG4xzdq1ACQXqDmJYwIXI2jgg4Nyxip3Ij7n+ZBEXnWIRu0tORhFw4pchjfy/CDqiL4vQ+HzQ8n5iUH7SPxD1DeWIKsMjLt/GcvitQL9O0e4erHOHbDE8O/566xdq7iAs/TURdEnart/ZDgyKhaYWUq2If3J/2q59ptywPR0qPPxj+kkQkzgQtrlPasyOg7dYzANd9N3UQvlg/AGu/rYdJrdPYtdAmNSYwzdHKGoeCwnSnToxHFbNwpxiuj62cZitv1HP5Kn/nR2I+xqHIjDSGfAgWs8hU47Nnd+6jS5HPVlG2HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rXqW/GOJBbRToEmI773p9d5WGXLMUmbgpxehM0c/j0o=;
 b=ktaAjtuWCo40qhazYHq4wwd15K/K18yS6bDe0m8KKYiritMqrBfkp74CMxpOvCK87wM7GP0ztmh7OusKE+yL0nNc/tsnh3DYjaL3ntSacCAB01Q7HzXULg3WThG+AhTCsO4dqJt4NHQ/Db7TVkpEC4Au/UZCVlTvwLZPxAk1sOV0iMXA0+f/QVUfks70FT3vT2BfiWzdpCKMza4Qfop8XQnRMsaF15RjY2Qh7WRZjEsgccaWpVFsGf8FQFvBaOyUtpIdPGAaKegNuqo4kamGa2c7smwpJN3gnt2xixtiJfQp67xPpmtlTJpGPQu0ovsN8iaavTGqbQ8RNDMUCwRl6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rXqW/GOJBbRToEmI773p9d5WGXLMUmbgpxehM0c/j0o=;
 b=IUe3Vbv2uNYpNVBnYOXmOBzBp6hGSg+Pulb2/vdx130q0IGMT+y/D2N3nPxrXvLJXhTlU8k7WQ+nkc9t4srTBnPsQpc51xPXs6H2dk5sSh2fnzPfSulK0nHuRxI0+8Dm9h1/fysHJlkCcCByZN4FpBavw/Jr11CH/oQRqcAhM7Q=
Received: from CH0PR03CA0344.namprd03.prod.outlook.com (2603:10b6:610:11a::35)
 by DS0PR12MB7581.namprd12.prod.outlook.com (2603:10b6:8:13d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 17 Nov
 2026 07:11:53 +0000
Received: from CH2PEPF00000144.namprd02.prod.outlook.com
 (2603:10b6:610:11a:cafe::76) by CH0PR03CA0344.outlook.office365.com
 (2603:10b6:610:11a::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.8 via Frontend Transport; Tue, 17
 Nov 2026 07:11:53 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CH2PEPF00000144.mail.protection.outlook.com (10.167.244.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Tue, 17 Nov 2026 07:11:53 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 17 Nov
 2026 01:11:52 -0600
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb08.amd.com (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.57
 via Frontend Transport; Tue, 17 Nov 2026 01:11:49 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, <Richard.Gong@amd.com>, <Poojitha.N@amd.com>,
	<lee@kernel.org>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH v6 22/23] soundwire: amd: fix shared-register RMW race in amd_sdw_set_device_state()
Date: Tue, 17 Nov 2026 12:35:57 +0530
Message-ID: <20261117070906.803139-23-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261117070906.803139-1-Vijendar.Mukunda@amd.com>
References: <20261117070906.803139-1-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF00000144:EE_|DS0PR12MB7581:EE_
X-MS-Office365-Filtering-Correlation-Id: 0912f06d-152c-47e0-3cf9-08df447a0ed4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|1800799024|82310400026|23010399003|11063799006|56012099006|261021121427099003|10067099003|261102123227099003|261009223027099003|261022075727099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	XVbRWNeae5hPSlkhMY+80gPPaPkumgtZj9RtrTJEQJChKFmacpbgzLGNyNU4Bg5Uvw82AIQDdlYTcdOwaUGNZ1HTLrzjde46RHf0r1xwW8n1xH/vhgv2x4u0gJJCL4XFeE7V9Y+zg8RJ2DAMahc7qtofuqB1mzWYy0HpD5KwGhrq0n+QUiGQWbRGmfg6IdbtwLZafKioZPVmzQVckCpBKyAdn6VPef3fvBXppdRC3ieb3/Q86otSwki+TQHHuVnn7Ubr0TA6AjadcgC1H1vKTQWqtf5x0VuYuMriSAszfQkseUWSYkmDhZ7+iwTZEMk1Z9b+MEzkDQDqwLXN0evqdYAFl9XGPeu+2Bq5rk2OxnFSWWjWMwWfMl3el3C62VM+QOzNNAb4zVARaBIgMXdDTAB8L2tqQH376Lluk9Jdx0yI9uB1QtXGYUozwPX/zYT+PJE7eikFIx7kYk6fVrxIGz52ZDlReN7VU3WrZVKnbIRwGunxd7IFzmryIFLuaTF8DzlCB97LgAZYqk/kyZdRAFNZcBhN4CdCUggKlgrPafq7z6UHL/P/2lsZR5DIboGfzXa0J8itqXnKOV/O4DGdfmzBmv/poYT8f2w6gJqqb0PM+BKK/bq+zJYnQzpodfS1fQE7044lWC1tQEj4TwBSM013eqAykAR4g4pU+TZ1yzHF87CxTV9bTm3DEUf1x6/sZRQXYRMrzNmuifroBeIa0Q==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(1800799024)(82310400026)(23010399003)(11063799006)(56012099006)(261021121427099003)(10067099003)(261102123227099003)(261009223027099003)(261022075727099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	q8PSdhdkf4/yVHXzW7PPmIQ6k+eoa7uMQFBWbmSW66gP8gMNGpwockUWbGlebEtWJ6BijcZjXzcpSCtmc8jasD5FQrvofi4WFJwn2YsoP8LkVjgR83S24yM/S7/VaViZ/rGRbwbNQFNdGX0KaaA2ca/dGDHWBLpAyoCNnRotlYqdybENdu/XtFBuqlw232Thn6ncFjd/ViEGvzH/i2h6R+uD6aUPU4+MF6b3EznfjxA6/b6MbxzHpRsSteFPjNaoxR4tH+UzaNH3CHjoqRm47D/PrsfIGWXhsRM8wpFE+fVZncgOXqJJkc2AhiGqSsJdCOPuAyN/8nMOBsGokXstTOyKHu7Y3yCC51jNG3qxFKfVsGqQW0q05HKWukbvjDZUAphA9olkOPNSt7PY3BWUx+wxZigzvI3sU4lQL1t3nd8aUXhVSOE9/JFO46+/SO2m
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 07:11:53.4842
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0912f06d-152c-47e0-3cf9-08df447a0ed4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00000144.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7581

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
index 4f997198f5fe..b882ec4d5cb5 100644
--- a/drivers/soundwire/amd_manager.c
+++ b/drivers/soundwire/amd_manager.c
@@ -282,6 +282,7 @@ static int amd_sdw_set_device_state(struct amd_sdw_manager *amd_manager, u32 tar
 {
 	u32 sdw_dev_state;
 
+	mutex_lock(amd_manager->acp_sdw_lock);
 	sdw_dev_state = readl(amd_manager->acp_mmio + AMD_SDW_DEVICE_STATE);
 	switch (amd_manager->instance) {
 	case ACP_SDW0:
@@ -293,10 +294,12 @@ static int amd_sdw_set_device_state(struct amd_sdw_manager *amd_manager, u32 tar
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

