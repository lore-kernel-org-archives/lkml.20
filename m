Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010006.outbound.protection.outlook.com [52.101.46.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A22E490C1E;
	Thu, 17 Sep 2026 08:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789634366; cv=fail; b=b9pxoEG5h5aMO7i5MjvIimlcdvAPJZ4VM5AAWLdutrN+53ZS7athfJlGIPXZ5fu00lDV0mzYFs4SXbX7I6aUyEGCgmI5wrjXPDBTt+GC/gSZOevFHQO4l2GrIDleUfhU0vBgcKfcGK/cCjVyFz7lOm2AqQ26nJ47lq319htRB1E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789634366; c=relaxed/simple;
	bh=FiYxvLQfZOzn0S+erQOmR9MUw8KrCg6OCPCvGDzWFN4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ToO3lmK6RC/99e3wLHS9gJpPM9XHINBIUMjFahB5s6KqWq3bxBqOuXuSd+zQAhsbSxCN6gbXPU6CzvZnmZ32KYIyP/TKO/BsyyZYqW6XNj0up8ZMnYeo3onITGL+kf6RfJ6+8trrXNr/J3niRErc0QWjs/A35p+/GqH4f2yEstU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=T7p+GvDo; arc=fail smtp.client-ip=52.101.46.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="T7p+GvDo"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iYZddRV6+c+ZAMCRFicTDM7sSTlYr/k5J45PUjhwoaZ9qJfOYTlYSoJcexCOKTT3HWI87AZT1ab6Q0CN2X4TElMQWbgVROBHhbr58abm2nXSykHhT0aG2uEVMphD3Sehk7Y6E7hNFhJen5BH20UV57O/FZFTGexEgJIM0vpCsVOwikG8nHOJUCENtldqzgfpOg6KLmZf7JluapienzDBecXtvTdgsD8Nnmc7TKDnmzrxOQTTqXMhIhzA97RfUK1mwrXd9tnJ24G6f6ca+YvjTEfG95QPwGF8PHOSyQLZdwLCLGZd6teKJ2Jiyo3ZTFJIE/QCvJDOPwUm2PGwlVRfxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kxi7wE8XfHSshdHEh9HFbWphzQEHHBqurR6ZiwHBKiY=;
 b=F8OVRrWKX23j6Q+IWtgETSAttJ0fVwuJ6a4LIKnl4os7+qEzCeXFv3pFkOTkpg/Ls24BBYu2/K/oBpC3T5QODf1SHdFDGjcJEbmeAUAKRoxZB0FdpOEE4YsvjaiRs0J9NbytaY3QdhRfNGl8//XXDCK00IXBjYql9PsTl1Y9aViHd6PNUGXkr76beFSnoINm/JdTdakVPk1n9xWtzdyYTg9VYQ4+AwRxngmv3FQo1RLoKp6W9Vg0lfVo8vM8xtgk+gCBtYDLFOD75tOKXrjnk/FCpCoY7nEbxJKxUTvHAblHGT6+x7uI+H9T8xwrq7exklT78SM9/s5tP/fKfZeB2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kxi7wE8XfHSshdHEh9HFbWphzQEHHBqurR6ZiwHBKiY=;
 b=T7p+GvDo2xRSMfcJXF3Uld1+w7YXHD5LO+o5AnCJ4mioYM6tYPS7GTHsQaKRnGOgXNJZIA6wy7303t61Vh5RK0ikhM3NjkX/r/NxO5rm91PMBMb88xFa5jSS2taDpz5R4O/pXcx6BLjviXXoqV0rCIoO6KPwRwXEIau0sBP4V5g=
Received: from CP6P284CA0029.BRAP284.PROD.OUTLOOK.COM (2603:10d6:103:15d::12)
 by CH1PPF2C6B99E0C.namprd12.prod.outlook.com (2603:10b6:61f:fc00::609) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.11; Thu, 17 Sep
 2026 08:39:01 +0000
Received: from BN1PEPF00004680.namprd03.prod.outlook.com
 (2603:10d6:103:15d:cafe::98) by CP6P284CA0029.outlook.office365.com
 (2603:10d6:103:15d::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.12 via Frontend Transport; Thu,
 17 Sep 2026 08:39:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN1PEPF00004680.mail.protection.outlook.com (10.167.243.85) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Thu, 17 Sep 2026 08:39:00 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Thu, 17 Sep
 2026 03:38:56 -0500
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.49
 via Frontend Transport; Thu, 17 Sep 2026 03:38:52 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <broonie@kernel.org>, <alsa-devel@alsa-project.org>,
	<yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, <Richard.Gong@amd.com>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>
Subject: [PATCH V2 3/9] soundwire: amd: fix work drain ordering in remove path
Date: Thu, 17 Sep 2026 14:04:14 +0530
Message-ID: <20260917083732.3803526-4-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260917083732.3803526-1-Vijendar.Mukunda@amd.com>
References: <20260917083732.3803526-1-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF00004680:EE_|CH1PPF2C6B99E0C:EE_
X-MS-Office365-Filtering-Correlation-Id: 74c5fc01-6364-4bc6-2781-08df14971f25
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|1800799024|82310400026|376014|10067099003|22082099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	rZ7j2Sv/FjiDF94noiOUdZ7ROq/cc4ByGiqd2EgiZ9pLaL/ul5QsSXtMYEJ/CICtpNUrfWSpKTOdPMepjIzsKLqbp1RaHBV/7mtAmm5rOWWFj6RmH5xCQJP2TteWSnHMEEcibGejUfvJCjxqiFaa4hOSkgJF6sh377iuJb8LlQfeSugjDye1KBFgJuXlFaDb9XQ6J+43e2zMoqMpgFxig6zX/2UfqWtdBHFMhB/kfvuvCXxYJ+Y+Wu76AYuu3LYckRRA7o13j/V5JInT2WLCsoj3nhfq0MafzJDpe6qS/FD4nxzw4uHLACwsl81wYF3Uc20TUprtI3CR94HThq4ViaiHulDqq4DD4ESwIo0+qa6YPkGOaZE/IFp6SrBK237VRjsSDp79ooVwUEmPmr+ZT4Z7zeDHCMN5tb+xPyBFn11zH24k3licnn4zgeYlX+m0LhCkL3gd342ckwftIguy9Jh/UO17b5oeORFZ63yk7xatno7jDIgySyqhSYPDj3nVFQCC9aUD6wsZpipWhihFDwrrksLl/NGRkx5L4j10MsIqmLGBD89/YbzRUEc45roQhyM0+GxoZf6HHPQFASXvtihMlHWu4XHoRLGaOeH+tvZWF3cBYm2egedeDVxDZk79fztTzrt7pvEd/08yrcUXRBF0SapDda/hO3xt1cS/2HJXwTDOBpxwwpExTZGCDzdaO1/pEKykeccfoaiMI+7eLA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(1800799024)(82310400026)(376014)(10067099003)(22082099003)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	YdbzD/pfx25ph7aGnsWCw0jCoVLxPMGfIP22bOi+1agDOtvGqrAkuKTfF0w9BtivNZHh1C+uc+/13+YaKzvbuPGDfUJmbCv8zxlTE/Ikm2PfGHM1g574gRyOioAnLq0U0L2JfyoK6zrIVfbuzDYnSpd5SUgD4jw76owt8KzwOnEoI+58/1tgJhEpE9TrEruAK8ZdxWk77zEZjHIaCvx7fZmbXS9XkrHa9BEtT6Q9xmq0DGzjUEZEizIigZfYbjTuoXivkv1hACgeXvj7iiPO5YiSyCZ8JPtkRhEoJcHqX7o3lYKf+8KGTGiRNZJKz6Chi4q3qmQBUYlLeczckcSKN9eaDr4aImrnquforMQoGURs7c/bRlzEydurjjlFzka+pdHBPrpCOOROci/jWGgLv32kW+lRnxlkV4vUPMizFio+4u3J7fpsI3E3hgkW8jE7
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2026 08:39:00.4632
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 74c5fc01-6364-4bc6-2781-08df14971f25
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00004680.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPF2C6B99E0C

amd_sdw_manager_remove() cancelled amd_sdw_work but not
amd_sdw_irq_thread. Since amd_sdw_irq_thread() calls
schedule_work(&amd_sdw_work), an in-flight irq_thread item can
re-queue amd_sdw_work after its cancel returns, defeating the
cancellation.

Fix by calling amd_disable_sdw_interrupts() first to quiesce the
hardware IRQ source, then cancel_work_sync() for amd_sdw_irq_thread,
then cancel_work_sync() for amd_sdw_work. The existing
cancel_work_sync(amd_sdw_work) is also moved to after
amd_disable_sdw_interrupts() so that any work item queued between the
old cancel position and the interrupt disable cannot escape draining.

synchronize_irq() is deliberately not used before the
cancel_work_sync() calls. Once SoundWire interrupts are masked, no new
IRQ deliveries can occur. An IRQ handler already in flight may still
queue amd_sdw_irq_thread, so cancel_work_sync() is used to drain both
amd_sdw_irq_thread and any amd_sdw_work items it may have scheduled.
This fully quiesces the driver workqueues, making synchronize_irq()
unnecessary.

Fixes: f93b697ed98e ("soundwire: amd: cancel pending slave status handling workqueue during remove sequence")
Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 drivers/soundwire/amd_manager.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
index a57b59609bfe..dfbe9a181983 100644
--- a/drivers/soundwire/amd_manager.c
+++ b/drivers/soundwire/amd_manager.c
@@ -1173,8 +1173,9 @@ static void amd_sdw_manager_remove(struct platform_device *pdev)
 	int ret;
 
 	pm_runtime_disable(&pdev->dev);
-	cancel_work_sync(&amd_manager->amd_sdw_work);
 	amd_disable_sdw_interrupts(amd_manager);
+	cancel_work_sync(&amd_manager->amd_sdw_irq_thread);
+	cancel_work_sync(&amd_manager->amd_sdw_work);
 	sdw_bus_master_delete(&amd_manager->bus);
 	ret = amd_disable_sdw_manager(amd_manager);
 	if (ret)
-- 
2.48.1

