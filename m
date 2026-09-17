Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011019.outbound.protection.outlook.com [52.101.62.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C38E04A384B;
	Thu, 17 Sep 2026 09:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789635967; cv=fail; b=k2bMDOmrtyfXJI36SAFeyNiGzZBCF83jyXUS3lofC845eg/wmIz/8+1CK7MRPO9+ObSJiKg9K1unsECuXsR/Dly2+E51fSRJpj3r/2OLHEWRxz33mmXbVbSabQMVvOhk6ZGwKmTbbEmPXWTsVpDNeDOuoHspBpfSHkZdBj4oLYI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789635967; c=relaxed/simple;
	bh=UrJLV5j22ucMTTkqxzRN3/ifOVkUnncYOyVaEaXU5Oo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SV+Q8f2rWGUNt3Ex7vK/O+jBv8iM/aIsag+zF1v5pJJlEPf5mbkXybjbmtxWaBth3zp2InhZkx70vSJimjY6CMFqtfMjW9uK8ZeZ+SisgHJcLmJ046VJTQMCyBZVURSzTCw9PeoB+FAXPQaWKwP5nS5RG6Q7KvRCUnLGyAO0hFA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Iq+ElTfj; arc=fail smtp.client-ip=52.101.62.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Iq+ElTfj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=muAWhO9zkiKX+YzmT5Urm5ZtnP1dWLkBFmFs83mBySvxeGa1GLhq/6p/6RmTZb7K5O6OjjsqeOrBE+AnFcVWApG0EU+T7dTP5513CGufxsAiGWbiLI+oBcFCTIdB2giSfX1w9IZVAAILX0ArGVNIweZ98xzKzGgSMESF7nmv47Y81y+iSaQyAqbnSPI7kW6NyPxqw7nbc13YSX6i81SsChdHYKcBweJAXjT/CE8MBIU+sho/q5Yz3Cfo6gH90RGnexVbB1xKfuNlNdseCe+TRRppWOnHQMAg43h9CPbhzYMlazKGvnYbMgwRp5tWpzSLxUBG9FI6aWKhp8wxYAqDZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aa1yFdGIVC5IukFuOHlA2VCb3GjKpZFAkPuHbsg5pko=;
 b=HyfPi0WZKDTzEOG8A5vuFo/BFaUDhYePXOFdJhJ23k3S25WSYwnZEl2sPpf3YVQLXDjAzEQv9coFoNMSAH+GQSSZfke0DNWX5QTa5XC+kMSixztjxWMTCxqltIdOsfx5vJOkHddQ9CsVL1GqBu8IMr5/pRlcSaJ9JLvC8AaAdFkADy8Vup2RMUjbrr2GUVFviZmSy49U8Bvfx7tdLAoAQvwi0a3C2dzeLsog1E7n0St5NasJCAOCO4Q/vE0j1AvyUeeuG/WuTD5dOv29wDrtrZ8xchmWz67IqMqHVUTWc3Gm+kmw6Pzsnjilkgb/8ye2vDXSyaok35ZILKHwPyDhDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aa1yFdGIVC5IukFuOHlA2VCb3GjKpZFAkPuHbsg5pko=;
 b=Iq+ElTfjsKMVO0pUFMmWLtjWJy8WDAPRoUFQsoeYhniHFwJgH5YdPEQJYajeyGUpRPehoXyTSQTWawZ59WHkQ+1gMbgoHBNybG2/UITSf9EPs/nDaoY0OH75PC913a5sH58YbG7b8T1ogn0tTI80+eKnTN0N8chsu1ra35IfRow=
Received: from SA1P222CA0133.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:3c2::18)
 by IA1PR12MB6043.namprd12.prod.outlook.com (2603:10b6:208:3d5::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Thu, 17 Sep
 2026 09:05:45 +0000
Received: from SJ1PEPF00002311.namprd03.prod.outlook.com
 (2603:10b6:806:3c2:cafe::24) by SA1P222CA0133.outlook.office365.com
 (2603:10b6:806:3c2::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.11 via Frontend Transport; Thu,
 17 Sep 2026 09:05:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF00002311.mail.protection.outlook.com (10.167.242.165) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Thu, 17 Sep 2026 09:05:45 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Thu, 17 Sep
 2026 04:05:39 -0500
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb08.amd.com (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.49
 via Frontend Transport; Thu, 17 Sep 2026 04:05:35 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <broonie@kernel.org>, <alsa-devel@alsa-project.org>,
	<yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, <Richard.Gong@amd.com>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>
Subject: [PATCH 5/9] soundwire: amd: remove unused AMD_SDW_MAX_FREQ_NUM define
Date: Thu, 17 Sep 2026 14:32:53 +0530
Message-ID: <20260917090407.3828816-6-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260917090407.3828816-1-Vijendar.Mukunda@amd.com>
References: <20260917090407.3828816-1-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002311:EE_|IA1PR12MB6043:EE_
X-MS-Office365-Filtering-Correlation-Id: 5587ee74-97b1-4055-4c2f-08df149adb96
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700016|23010399003|1800799024|10067099003|22082099003|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info:
	4sYwems6GoWq9/ozaBKBBmMOTxCF5v1ufT/rXiPlDGT41dWDmWgVKEUDS9b1SPJoNZT4UOZM5kqRyCoN0u7PdWSqYRelvDfrLsZGFi5/SaQJkr2ItZfdGU6vNI5Q7cX+AprMGTTicg+qRLLpU01+QFeRaZPFaVhF6XvBY1kppOfNLS/TmTk8JLCY9sQSDu0RCg1NQaCFMM2cu3OG7jVwW+PnCBXyBbQIiyaTsO/4zDxlNPHbprZRa7uxA3VkzTZMysqjl2jp6OuflDgXImrwpi5pTU1XbbygH5QKdYzWpxdCtGFblhgKQSYJwRBZ5ZwWCZL/3IWkrx1gI0vkOfShXpjvkSdqp3/IDK/lmzP1b9G7qL+h3wFTmqUol5m+x8YnBJOtHCAraK1RqHU/hWfYGPImiVXjHvDwVAyEVZhAiklbCAZp4rSfJKMO/yAMMd87WMEfOzja5NjVBvjZxo6CQMF2vGGnKeGRwqQ2qfQg4i7pd+ij2DffYJPEiwy2itoYqN189dBYVcZOD/gEcbxlWpp3f5dN8/sz9vFJb5VsUA1tH6zVcPUoU87JyRCAIB1J0S9lqiW4bdAwzQhO/3U4W/ZLZN/R6XXF31YPbXL9/z0wExl7YYMZnpYGsG9MvKbg/rI8wW4H+Dcisb65qdskTJ1Pn+QSeV0KHy4GoP8tZUV/MzhnfQckr2Zo+R/NkbYNl5MQ3m+Eedj14sZCclAwKQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700016)(23010399003)(1800799024)(10067099003)(22082099003)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	5Vn4DjLgCGEo7865oMScwzb+1klP5V0BVPVIOl+r+VSoVevj9cDVOhsSVeRpN5stj6fTqrSU3Abo+EWawIQE1ccwdu3KQSQBRZI/fTzLV0f/FKOo7EvbuBVzxVZe85v1orhEtdDXUoeJ0up7jDuQnN9Ln3rmcsO16Bj2soMTnrPMoI3Ku0SEQso/tkDMG29N6Lzz1d1vMhTcOLwCxcs4fgFBFmJQCL04XrOZS7jRc4TNcmeOhQ1ctNbAECqXhmWVTml/N/0Lv7YWZPD95iZu0UpjTMstOesKR7H4ksoDSMv7vOY6QhMyRaEGaNrFyYLe8OJ0ftblg/8mqtD0b9LNA4oPEHm8Ccf0aSfv21FJwhOUeG3W5oGHy2YYddlaAVwR0W99rVdVr1aoRcNg68OQ4IBEr4ON1sm4qYI+mY3glNmyUAWE0cDzatYr6FnMzY+B
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2026 09:05:45.0466
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5587ee74-97b1-4055-4c2f-08df149adb96
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002311.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6043

The AMD_SDW_MAX_FREQ_NUM macro has no users anywhere in the driver.
Remove it as a straightforward cleanup with no functional change.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 drivers/soundwire/amd_manager.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/soundwire/amd_manager.h b/drivers/soundwire/amd_manager.h
index adde192f61fe..63fecff62079 100644
--- a/drivers/soundwire/amd_manager.h
+++ b/drivers/soundwire/amd_manager.h
@@ -159,7 +159,6 @@
 #define AMD_SDW_IRQ_MASK_0TO7		0x77777777
 #define AMD_SDW_IRQ_MASK_8TO11		0x000c7777
 #define AMD_SDW_IRQ_ERROR_MASK		0xff
-#define AMD_SDW_MAX_FREQ_NUM		1
 #define AMD_ACP63_SDW0_MAX_TX_PORTS		3
 #define AMD_ACP63_SDW0_MAX_RX_PORTS		3
 #define AMD_ACP63_SDW1_MAX_TX_PORTS		1
-- 
2.48.1

