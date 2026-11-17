Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.53.63
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794899448;
	b=b4lPl1c/+SZSvtQ7jkxpkzBgix+SEOXdGnKRLuOCRU5l05WQeO5w43ql4uEonqnfvJot
	 UWiXmOJxNJw9oPP4vpsB/0t7zBkX/3GY+WfnGIIr9lfv03KzgReo8VjtQ017rYE8yY+P9
	 CfsYXSlmRbeSUSG0MQP7DeieYM2hSD5a2fWvathHkLco9ZKSKy4Flvx0RaSZUEFIaaXnZ
	 UP22N7OkQyQOQgmxCbghwLM8jHvqq4EmKVVOwhn5Yw5z5qJ9qdrqwXJHQQgjbc8zqps5q
	 O4/otj8M6RrG/rR3/+KkQ32MSTAcZc0BefCZl+p9YzXi/JXcgKZtIRw+RtVlcNMXc5Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794899448;
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
	bh=2vX7B+CavSUSUwFuXn0aXdB3GkKzX7meG0bqHCYIhLI=;
	b=4gPMy+mLLXAMlJW29GnxX5kmwcPv0LEdcIVfIEXAtPjv5V8RNJZZVAsylxvRynHCPw4t
	 CChXsvXiHVJ6hgrS0u4NBF4telRC3J2utXSFzP8hZgciXJGWBtw4GCYt+CNvTjLYJx0SM
	 E/ZaLBWcIWaqqEU4LA4jEd85Bh9MSTHpkAv3wZ2tM23hOMqmTugYaJaSnlZ18UGABDxdq
	 ipn6eQUgahGw/SdLaW4dMGj0HOMcqbSWfwAsav0CEkCuD9FY5VNVG/N/u03cvgvUh9Nrn
	 HbTEGOyQrRyC+wuO1BXWQyluuoG0HUG8EeIBmQjk/sy0D837J2QsYI65Ovy9xcRJxHQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=k3SR5ty3;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.53.63
Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012063.outbound.protection.outlook.com [52.101.53.63])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91FF3606A331;
	Tue, 17 Nov 2026 07:10:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91FF3606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=k3SR5ty3
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FTRYvTI+IjeuQnHgScxmvFz0f972WF4Z+Oi3EQpMNEuNrVJ8RnlUhMo9r0imLEVdiRkjTrSxgHtfYtq6LSUK2Dz5TvO4Z6CSzKrfvyQuwzeLhQ0Ge5bl0RilmffxEWMPJKB/GVUV3vT7Fl7bxjD5ExTgv6tT2xhntkcFeoGf7y5/v7klyo3w+xA/HzYR6DtQ4W9yne50ZIs7zwp5xVdjUEH0aRoXw0QGu3iH+66ArH4yR2xLVAIge6a+D9pH8b95eT7yBf2Xu0oytA2R9vFZMOg1c3XZre5FFVuXm47/jE+YWRqtGeoExkgsCCkQQBqHcXubwFEINNOn+TfWyqda7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2vX7B+CavSUSUwFuXn0aXdB3GkKzX7meG0bqHCYIhLI=;
 b=Yqsu6sgHEVO5EM3x/jpeilksI1dgn/S54kRHfs1s/d1eklL1Edh75JfQXKOqOG71RGZdwKkAiX2rT5m9YhlQM4NwQ12BfjHWnSxzUazleKrJs9vYCCWX5FSTkcWt6THExTQScakQVI6JNhoGMvju9uSka/nBIe5CApO41CXlFP1TaMTvtoKpsqhWPy8ltK6+pK3riwP4ClD/fYAUoLHJF7EAiKgojdTPtcwemqKIrGx2ahZuBirtU+iMYaIAd/CmRadiI1hPK7v5OM0jDyFHTfX0+i/CSIP6dXt4DAbjvMyyF7riXFc3StvC1ztJiHJwZLLxpXiGqW6G1xKfg3oLOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2vX7B+CavSUSUwFuXn0aXdB3GkKzX7meG0bqHCYIhLI=;
 b=k3SR5ty3t9F/y5xjIhp2w5P4gU6ICuPkDjNTCD7ZcOSc1sbHwhY0zUZ9mKHX1xq9jlfzennFqO3vuRZmVn5x01kwzKVHDrrIDgiY+xH1VJuUXn+olzujcEbMXJ2pCqtzaFXQZHAQv+AAEYg+mf1eD6tZw2xK2BWKmU/lhn/q9vA=
Received: from CH0PR03CA0228.namprd03.prod.outlook.com (2603:10b6:610:e7::23)
 by DM6PR12MB4252.namprd12.prod.outlook.com (2603:10b6:5:211::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 17 Nov
 2026 07:10:44 +0000
Received: from CH3PEPF0002457E.namprd04.prod.outlook.com
 (2603:10b6:610:e7:cafe::54) by CH0PR03CA0228.outlook.office365.com
 (2603:10b6:610:e7::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.13 via Frontend Transport; Tue,
 17 Nov 2026 07:10:44 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH3PEPF0002457E.mail.protection.outlook.com (10.167.252.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Tue, 17 Nov 2026 07:10:44 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 17 Nov
 2026 01:10:43 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 17 Nov
 2026 01:10:42 -0600
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb08.amd.com (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.57
 via Frontend Transport; Tue, 17 Nov 2026 01:10:39 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, <Richard.Gong@amd.com>, <Poojitha.N@amd.com>,
	<lee@kernel.org>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH v6 05/23] soundwire: amd: fix missing wake interrupt and group wake-arming calls in runtime suspend
Date: Tue, 17 Nov 2026 12:35:40 +0530
Message-ID: <20261117070906.803139-6-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH3PEPF0002457E:EE_|DM6PR12MB4252:EE_
X-MS-Office365-Filtering-Correlation-Id: 041aa7f9-fe12-4350-6951-08df4479e57f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|36860700016|82310400026|5023799004|11063799006|56012099006|261026140227099003|261028144727099003|10067099003|261022075727099003|261021123027099003|261021121427099003|261022105027099003|261102123227099003|261009223027099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	i/mzrEcngLNoraziAqhKKkPbIVXL0Q6BmfmeCHLITXv1nPJo/C8TOFO5t8n7WwjPCM8Uz9uj8JDuY4NgjqRSeD5aeORR2tOjLv6kfUxaPrK44O7OnHX+91oODUTM+9CF3peL8oOc26CXFB3HYlRqJ55YNPiuenHOPLVVESOkBppXLlpVRgZvz2dKzeIJSAqNgVTIukvUMKh81tvsXWWQSRYFDs4Zk4jLGQ57tDc85vK3GQSp1Sqxk8ei0egWGEgd/Pvsieh+VTFhkrVZVjucFVCnQZktWbwArEv7i4qRRAqCTeJj5twhF45EuDfshEg4JdkB5gdjvnaT3ZQX1c9zJ31BuDe+0IB4SOQ5w0hCUIbJIY7lGg4Gx3ws7DyhidRqJE62gxffzlEVmXFk3Ig8C2Rgg0EBNuLCssYNlQBznTzfRKFthWGAeMEDvWPK4S4rm7mBGAg6DDkLkOHFIUfF3nh9oyG2aJvA75I4lOlMz/fH6+nit+SjiKDH5Pu5Nsxed/o9kW2KYzopWo1KiXH2u+ZhOy2GE+CRf5ICY+FzXLcQuin3HuH+BFUGqhyp3gqoPCUa3xzVu8c+H08f344dBVHkHfNJgjmKwS8pBn5umDStihztK7IZNMSVSbBBo/auL8+hJKZ8VnW4YYwtS06GfYxUAl90pqZThu5Q8Ib57RlwMSQJczEJ6VOYTcogXSQR2I0H4v+XDLTTPX9MgLpGUw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(36860700016)(82310400026)(5023799004)(11063799006)(56012099006)(261026140227099003)(261028144727099003)(10067099003)(261022075727099003)(261021123027099003)(261021121427099003)(261022105027099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	gxg70ZU/NWwr1izJRynn9qnlz7tfXRSzEJ2v0FsHb3+v+oBKUwtqRudFaNA548SKDNagiFrjpdsH559ZLYhDmXUDvV5Nu1rxtZzJKJGX55+XAlKsPTj990TWT82VeIcC2Z7SXyBZDZa72EhCuvBdFw/gop86LqFsDxi2ZBCk9E/CgFw3rw5Y3gAztnKUqlghf6i5JEEoWeWR9ovBZqBxCUHB9/YazATz3wPMn4Ze8VI3628QLaTcqF7PgBC/IK+z9hqMPlIB749dJNaAgEbgacxCsgKGf+S6f4ASLhcsX/FuNVgD7eTHmvzeg1QZK281aVoqeFGQ9P7Y/jmBnsFX+aVcAZVMnLdQhZqV0RXncFMRUzuvmzscWSDqkk0JZBrO7wMPAQ/PjR6GHU7Oa8xKSr+I94a8GJePcan1AA1mjSmn43jwAv+UGwp8Yx4aI1Yq
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 07:10:44.1410
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 041aa7f9-fe12-4350-6951-08df4479e57f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF0002457E.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4252

In amd_suspend_runtime() POWER_OFF_MODE, amd_sdw_wake_enable() was called
before amd_deinit_sdw_manager(), causing the wake IRQ mask to be silently
overwritten.

amd_deinit_sdw_manager() calls amd_disable_sdw_interrupts() which writes
0x00 to ACP_SW_STATE_CHANGE_STATUS_MASK_8TO11, wiping
AMD_SDW_WAKE_INTR_MASK (BIT(16)) set by amd_sdw_wake_enable(). Move
amd_sdw_wake_enable() to after amd_deinit_sdw_manager() so the wake mask
is armed after the interrupt-disable sequence and cannot be clobbered.

Move amd_sdw_host_wake_enable() after amd_deinit_sdw_manager() as well,
grouping both wake-arming calls together after the interrupt-disable
sequence.

If amd_deinit_sdw_manager() fails (timeout waiting for ACP_SW_EN_STATUS),
the hardware is in an indeterminate state and wake IRQ delivery cannot be
expected to function; the early return before the wake-arming calls is
correct in this case.

Fixes: dcc48a73eae7 ("soundwire: amd: change the soundwire wake enable/disable sequence")
Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 drivers/soundwire/amd_manager.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
index 28f5dbe131dc..3d60bea82792 100644
--- a/drivers/soundwire/amd_manager.c
+++ b/drivers/soundwire/amd_manager.c
@@ -1454,18 +1454,18 @@ static int __maybe_unused amd_suspend_runtime(struct device *dev)
 		if (ret)
 			return ret;
 	} else if (amd_manager->power_mode_mask & AMD_SDW_POWER_OFF_MODE) {
-		amd_sdw_wake_enable(amd_manager, true);
-		if (amd_manager->acp_rev >= ACP70_PCI_REV_ID) {
-			ret = amd_sdw_host_wake_enable(amd_manager, true);
-			if (ret)
-				return ret;
-		}
 		ret = amd_sdw_clock_stop(amd_manager);
 		if (ret)
 			return ret;
 		ret = amd_deinit_sdw_manager(amd_manager);
 		if (ret)
 			return ret;
+		amd_sdw_wake_enable(amd_manager, true);
+		if (amd_manager->acp_rev >= ACP70_PCI_REV_ID) {
+			ret = amd_sdw_host_wake_enable(amd_manager, true);
+			if (ret)
+				return ret;
+		}
 		/*
 		 * For ACP 7.0/7.1/7.2: disable OE only; keeper and schmen remain
 		 * enabled unconditionally so that wake-capable devices can detect
-- 
2.53.0

