Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012058.outbound.protection.outlook.com [40.93.195.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D1AE3B95E7;
	Tue, 13 Oct 2026 08:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791881549; cv=fail; b=MHGI/wnTsQT2Nfgpy0YoKlWhQxWKzSxohiTRruz3IGZm6b/jh9Z1vxti9bQuH/EIkfrrXhnwpOX+ccPG27AaIe9mmNZZw4ZUELrnVpSZ816+n/QsMCreB/WDVGw5Wx+DSRFa79u5eS62HY3fHjdRSbwAR+tjHTI6aGQvDBsL/j4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791881549; c=relaxed/simple;
	bh=FiYxvLQfZOzn0S+erQOmR9MUw8KrCg6OCPCvGDzWFN4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EbeMOZPCGF3nr9XlirZ++lyek1k2SJNrubI4TTrG5ByC2vey7fG+pdNwCE9bsnLAbii7sZ2HSnFHH5/bEeMBGkukVb3sAGPm2EWClm0mdDD2JVZsWXP9CoH2pr2jzkj7SFOqQ3IgR8sYs/Y0ZgLvc+naCTsvKIUZZ5U8nKqxqhg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=DYiMDung; arc=fail smtp.client-ip=40.93.195.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="DYiMDung"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kQ3d5p/c8TblnnDkH5NWFTjt/hieYUbMAr5pm+pJCzWlDDXiEX3xwdsGevc6wmHZZ+YIvpNljasuZp4L4D+Y9iT+QgNKAbOHLrbD2h8To+21HIeUBX5YYmZDzYr1RYcTYfRtHmbdbmXRFPPnzyYnQ+XKIeOLoD+6J8XoS5onbpVr8aQG+jfcGLVhXOKn68Kj4gBEz9pyFhEXoC6imTy3G6qrvU5wpYRi+wywRUtMBiry7bimmTwCCnBMnOJfY+YVjQDGvNBVvoHxWyPmOu7L0lZ4IP5In+qLnBf1awcoMFf8pv+wrkefpd7/Qgw2QXlNz66rYdOXHKU3pafUcep3vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kxi7wE8XfHSshdHEh9HFbWphzQEHHBqurR6ZiwHBKiY=;
 b=dCjHpEfKTQU+fXJuB5udvqz7RZ6PSbYD5LlxLxmVsA8Z0h5sg2xIauQScXMTUKnct/HEE+EHEZJwLNOiKKsMNaTueo3fFOsNy3lDPKbibe0GHeCvo7lyvZ7h3+JSL1sc8Sgx8Euub0hSP6VPRcceLgmqeIouna8sL0nHP9qcLKq+6JWV6lEBQD/f2sLgJeZVublAD0kdSA4HYr7Zfh3dbVWIoy6FoEZCjy89NgGhPZEGi3vUzpajCoccSjjQQXTi1nsqYjgtJKHSUvhMrnozIs+6TBrznausQxXEKYCuWpIBVMRb77xIeu3z/ef5c9wt/2DAm8sLlGWjPwb8zTYqVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kxi7wE8XfHSshdHEh9HFbWphzQEHHBqurR6ZiwHBKiY=;
 b=DYiMDung6nYQAX0jXFofRuOkgfGbxzjKetA1jjahkfUvUc/4gjOmOI/q2NqemxaydCO7katRFRH1MD6/b1geIJM+fcOou0uEpLIHCsPqO79CvDc4kWjYWcJUx8ddZ3gSQkOiZKHQ11cm7dwSK54HERRu45+nUyAA+oXEqA/xu3I=
Received: from PH5P222CA0001.NAMP222.PROD.OUTLOOK.COM (2603:10b6:510:34b::12)
 by SJ0PR12MB8090.namprd12.prod.outlook.com (2603:10b6:a03:4ea::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Tue, 13 Oct
 2026 08:52:22 +0000
Received: from SJ5PEPF000001CA.namprd05.prod.outlook.com
 (2603:10b6:510:34b:cafe::4f) by PH5P222CA0001.outlook.office365.com
 (2603:10b6:510:34b::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Tue, 13
 Oct 2026 08:52:22 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ5PEPF000001CA.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Tue, 13 Oct 2026 08:52:22 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Tue, 13 Oct
 2026 03:52:16 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Tue, 13 Oct
 2026 03:52:15 -0500
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb08.amd.com (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53
 via Frontend Transport; Tue, 13 Oct 2026 03:52:12 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <broonie@kernel.org>, <alsa-devel@alsa-project.org>,
	<yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, <Richard.Gong@amd.com>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>
Subject: [PATCH V3 03/10] soundwire: amd: fix work drain ordering in remove path
Date: Tue, 13 Oct 2026 14:19:24 +0530
Message-ID: <20261013085111.2009061-4-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20261013085111.2009061-1-Vijendar.Mukunda@amd.com>
References: <20261013085111.2009061-1-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CA:EE_|SJ0PR12MB8090:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f0fccc4-af4f-4db8-1bc4-08df29074bee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700016|82310400026|23010399003|56012099006|11063799006|261009223027099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	AQzkFO/D0f7Aa5PwTq5xigWkL5MZZozGX9KmNIUkU/T7IWO6gxfaTrHtdCT/V6H8EfgvHMNIIjU8Z49oce95IrxTQEZe1L2lfo4PchysF94ussO13KJ7LoWudTBDQV7FzXb9qkm0FCPW7tEWTBgLO2nXcXeJj9eg6SlFmh/BjPhnJcUYwKq01f1zc/uHd3AolKbQXAVG9kPVJ7Kv9lcvWlr4XIND5XHnpDuPxb2BVcZn0CHzJl2ZBTkNjV6NQdzrlu01KBcKNxxbse2vEQVYsK+cQ2fRy9070yaw2vE4pw20sP2cbhteYfNAmBi8buORA9n6Ij6oqPg9fiBZctGKKj8BaPOSF4s87cKbm8RU5O4LSyH6jHCt9fyL5cM6UCv5ukye9NTbHd6Hthy7+8xD0TpOCik9m/qWmugYPLefQqW207FyvYhrCuvv6rJVDFRO50OtjcEkAGGXOKDUMOYP5nwWnGrCkWAdgRO31owJBusbM8jOX5jIiS5ON4l2xJkmXglgt4ctGJsVMrdWg1NPQEjefSWsdQLlWuD8n86QVKssEpcVgHynVpzWwE3lnXyzFGdOSwMqpjSULU2kBWpUHffMZwcNNkyArK2QYG3QGoqI4xHut5U5SQSzO3/+3bjKgWIGqY7FwimNhGLubYRbwiY1oHBx8ltvMX63aQx4i3j7C9Bwhst+e41Khp+M1yCmQkf+bsKbebTyIWaf0neZqQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700016)(82310400026)(23010399003)(56012099006)(11063799006)(261009223027099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	joK/bXsIX3+B/WaAko10d1wc7bcQfDzntWDW17woOUkcDHI+bK/3Er9vjs12XHNXzdpjy3QfN47kwF1araMjiVOepzKPRMS8JUxivwBS+yqx9atFyEJMl7jZolRYfeOqtjZzcOhs+mZOc+rSpY8z6mHcMW+PMX5mHyX/STtVB4AEYRgAL+0YCasbGz97WxbKaX/BlAtCQ3anA0PzCL85EAt17ec2ewfMm0XZUVfxOwJJzIkuI+ZlorxHlRBQj5yekksTN6D4MfvBfIayp8FuyRRiDh5CsdLHHKqW/LzbCqnaU7sK52pWhuIm7dkT2whmr0orWhIqeWWk2sfA4t3wwF4Oq9AENeE+xrosIDwlW6K5eH43+/iyUReBVjlkY4zJaOiL2bpNSuOgZV0EtT92RrQJp33sJelIhD2/rpJ+vEQFO0u+hOeP17K4P3bDpjcV
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2026 08:52:22.4032
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f0fccc4-af4f-4db8-1bc4-08df29074bee
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001CA.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB8090

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

