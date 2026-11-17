Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.193.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794899522;
	b=Mif9DEg4C+OsDUdeYftJ5E8FfFv3vs1BmW95aqaBXn9E1ukOUmo70LqaqLq8xX8vZMVG
	 k3QzlIAsIPx8of5aGj88eiaVhYJG5pK4nA1R9AvLT8vSOOZ3Thh95l6aImaNOsQxQbkJq
	 wdq4KCY/G0kUuQdw3eawAU/TxaoW9ZKxMQVQESEGzvKT8syodLVypmVmvLTy18iAmGQ2e
	 giBxJOxL+NKRsB+nuEe8c4qf14fgLmVw/vdh+iVnGSo2o1xcqqK81Uvq+MejH4cXrLTmM
	 sv5V8VK/JJDhfdbj8WJQ+9/eb6RjvJ1McD9gKCHSjD6G8WYEZiwmNsEF2uSRStQn2+g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794899522;
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
	bh=gbzc0b0hqZkI1AZyqNSTSaubT0tKmq9Itj1wl1KFX08=;
	b=GoWs31hGKBgMDYfKA2OIUNsySuDoIJc0jCciSPQ5taMpFZ+v0eFhJ5li20ETjOM1HC5M
	 PrLrpylyD5/ZB8PBuqPZXKMQiCYH6ne9GTtAbDDIGJQOaBQlmBPFVLmUd75j99A4f4lgX
	 tdhLRUhXYCGNMCCjvVyGyg0WyEkplG1WUtqx1Dx2tL0Bq+5rQPEDDVcQnjRoS4/ya0m4b
	 8kQTDD/gRjqzrzqqyZ2n6iZ9CRYmIeHrLFG03jaH3Tq+tivt3nnkbb80ZaLcymFEyS5d9
	 trzeyc30eq9VK8comSpnSuqrR/zuI+eXfpYgBY9mSEM/dei2ReW5Q/r4AlEhtL8KfeQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=ikOpX8oh;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.193.46
Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010046.outbound.protection.outlook.com [52.101.193.46])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 781B3606A8A0;
	Tue, 17 Nov 2026 07:12:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 781B3606A8A0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=ikOpX8oh
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cYbn6/sRBoimONxbaSjlJjyLYVp3bLkoeggN2wcNgc/ucrqa03bkcr2MZAlwfX1pnJDOvqQZhC+63UCEQGsKXUlzapyLaNyp+SEyfsWHRokxgT589jypVuhI97pVry41HROWVjUmD2iMirkijoQGS/1PVBxS2blb5Ub82tG4RCOf8FrcUYMLxxMxMNzv7UlCt8Ys1Hsv/zEwBPfBJ3znANHoDJ0kx0HDtMZWNOsfzwD9PDfpkUv2lJWRbZ5z7uAwuyDUorz6yaE2MV36SYysG6+RO5XQqJ+eIgVL3yxJF5M84R+/yrg3sgZFKdoo/ytVwdOmHn/vCOmsQolq++lDjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gbzc0b0hqZkI1AZyqNSTSaubT0tKmq9Itj1wl1KFX08=;
 b=WclwFbNNXwNv7BXgcgh8kAQQ6Inzdhu3AVCLDX3JwT7qLVNnl0fkLj0kGSFOrrEbToZ8UBgQlO0XX+WISctyFNGwOT/sc9oouIrR7T+r06xzaxBQKlh90daiyG9TnLmvwnVZAR4kDPhjiIiidTAUEncl5us7FRxyeuoUCIaaViR1gTNul+iHXWnM2iHT/o0y0Brs50m1gQKWeHqP1rkf/rXh+ZCYXI6Ac3BUzrudat6zoEqU/6GO89avmTWfZ+dI5CtbxhyHyW2uum27qh4u434KXrR0cih1pa9BJz96NhIxrgKHzLrg0CoDQLpH+1jG1MHOVMLUE6qCO9HvX5OUvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gbzc0b0hqZkI1AZyqNSTSaubT0tKmq9Itj1wl1KFX08=;
 b=ikOpX8ohmhRhdi3ZGVapA+diZwBJXf1NXcMdCz8Ge395yPQnVbR7vgjy26ChDbi0qqkZVf+tQelHqDvQbs7USp/eA9UWJE7AaZ2M4Li0bpVkfQRp/BrWCE/YLr/ALNZgW+aQQhvkBKeEMh4iXTZMuvbPgTd/mOS8LOyzXr7QylU=
Received: from CH0PR13CA0021.namprd13.prod.outlook.com (2603:10b6:610:b1::26)
 by DS7PR12MB9550.namprd12.prod.outlook.com (2603:10b6:8:24e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Tue, 17 Nov
 2026 07:11:57 +0000
Received: from CH3PEPF00024580.namprd04.prod.outlook.com
 (2603:10b6:610:b1:cafe::9f) by CH0PR13CA0021.outlook.office365.com
 (2603:10b6:610:b1::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.0 via Frontend Transport; Tue, 17
 Nov 2026 07:11:57 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH3PEPF00024580.mail.protection.outlook.com (10.167.252.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Tue, 17 Nov 2026 07:11:57 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 17 Nov
 2026 01:11:57 -0600
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb08.amd.com (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.57
 via Frontend Transport; Tue, 17 Nov 2026 01:11:53 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, <Richard.Gong@amd.com>, <Poojitha.N@amd.com>,
	<lee@kernel.org>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH v6 23/23] soundwire: amd: fix shared-register RMW race in amd_sdw_host_wake_enable()
Date: Tue, 17 Nov 2026 12:35:58 +0530
Message-ID: <20261117070906.803139-24-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH3PEPF00024580:EE_|DS7PR12MB9550:EE_
X-MS-Office365-Filtering-Correlation-Id: e2335b07-4da8-4c61-885f-08df447a1144
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|82310400026|36860700016|261102123227099003|10067099003|11063799006|261021121427099003|261009223027099003|56012099006|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	Szdj3gmz6PUhH1yzYmWdGr6MOrg7eqopqykIdkSK2YNdO3Ker1m1ZhWgAOkliRKIizsk24ucKK29ccoC5C/RMIwAbMrNL1avn+15wIAXpYP2x8Gx/RCsiAlHSgG72yqwgo+jnqjhW4brjbFIn9xqb31i6kDhUzx59T6YNHyk2uBpY9U9ZMHkXE/jYIT8mFGegZARRb2oUdw0evQNe7ZScyr+rg+LJndX0FBZ8XsedIwdx63pC8XLDpy6twm7SZ/wX5XQggXwOptRrhzWCIvSHiUKDsXL7/uD/57jDzHeNk6K/EgUcqooF51jAsw03Red20I7U3PnwLIH2HCuBlTSuxTxmrC30H1/lKJvNed1JT21K7nQ8FaT2TD5Kb46ya+vEupfq36z7OQ0rBiGV5Gs9+kIOCTFlAlUe+YYJGleY67U/T4t1JlPEu1eUCC0+KAzkwMNXoC2OfcP2K8DYE0edEqNG9bDLlLtSgowpeUidupYUKZoOE7AhO8sN4EbFSG7fmqHIyvw12qBwC5yMhS2LBym8gXe4ZTeQNjkcUKjdr9Q8fB5cZ5MlZs+Xg8IOpXiAv101BnHEQmpVFB+SRiwZE5DZJcqjxeabGMQVtv6JUFdAsDYJl2GP3EabyAOMB91Fx1oU9fC2YHGGmr6nTALko1cgxLYBDzp/KyKrh7gM5nFzmAizY2hBHi74NJm5YCboTBr0moXvDk4hVaMC9CekA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(82310400026)(36860700016)(261102123227099003)(10067099003)(11063799006)(261021121427099003)(261009223027099003)(56012099006)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	E7gGNhNjPWKzvfwi5WVPEuHRae1B14sKmpegU1dkr13BzhFx74nZmib/9qhTLf4LJZjetspjJGPzZpnZc/jXpVWKY6z7bxgCH1NIrStCySbdXVkl98L1rRsvCFKbch9RoBUy9QHhRZzRbdhoBMEC5IND2au9YAkzVoXORa5oreOEdfcDSfeztTUzeLwNgqRrXh0Z2l2kwYfLT01Zb1D1rIFQIil/oFnOqsnMoMg4GLw8U2Jd4E3llsrubHNMTUygCe6ad/mWBrYOp0xvbDYv35CuqB5iYn1SRLveORpwaQ5U4ToNHmA5NHs6S5IOLgWOFDDt+oO7P7U9eIiTNYbts35lTsEqwCH44C5BHG1xBO7eA2jDFpGyLc+GL5c0cInBbrMaYDnsfXlFdnqn8vuCoiuijFnX/nvdvTgrm7LLMKchkFVegf8WwEy09h91eyb0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 07:11:57.5768
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e2335b07-4da8-4c61-885f-08df447a1144
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF00024580.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB9550

ACP_EXTERNAL_INTR_CNTL(ACP_SDW1) holds host-wake interrupt bits for
both instances (BIT(22) for SDW0, BIT(23) for SDW1).
amd_sdw_host_wake_enable() performed a read-modify-write sequence on
this shared register without holding acp_sdw_lock, leaving it open to
a lost-update race when SDW0 and SDW1 execute concurrent PM transitions.

Acquire acp_sdw_lock around the read-modify-write sequence.

Fixes: 3df75289ddc2 ("soundwire: amd: add soundwire host wake interrupt enable/disable sequence")
Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 drivers/soundwire/amd_manager.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
index b882ec4d5cb5..f9ababd30393 100644
--- a/drivers/soundwire/amd_manager.c
+++ b/drivers/soundwire/amd_manager.c
@@ -323,12 +323,14 @@ static int amd_sdw_host_wake_enable(struct amd_sdw_manager *amd_manager, bool en
 		return -EINVAL;
 	}
 
+	mutex_lock(amd_manager->acp_sdw_lock);
 	intr_cntl1 = readl(amd_manager->acp_mmio + ACP_EXTERNAL_INTR_CNTL(ACP_SDW1));
 	if (enable)
 		intr_cntl1 |= sdw_host_wake_irq_mask;
 	else
 		intr_cntl1 &= ~sdw_host_wake_irq_mask;
 	writel(intr_cntl1, amd_manager->acp_mmio + ACP_EXTERNAL_INTR_CNTL(ACP_SDW1));
+	mutex_unlock(amd_manager->acp_sdw_lock);
 	return 0;
 }
 
-- 
2.53.0

