Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.57.29
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794066551;
	b=vvsD3Eq/IFJmyt9ZoOUFpUSIenJs/kZKvu1iLp5c1YkgWfJMRrGd+Z9S5lLtsZnXMRvI
	 2/u7/TPDCk2yqyIQfa1Qkpsn93v1FkzFGy7M0+UagkmB3OUaDM0csLuKpC23PdsePIPbR
	 dGb6GCQRhnnIDjEsO4psbpK+scJiCfpGl9HhKIBvZvUWTQWr/Ra1e1tx5HdSjEtn9a+v1
	 8mokMv2MIpKup6AXQmiRQLWQz/iEaABP+dgmcboyGKiRKwhmc1Q7Eap43QeEnXUaFHqjL
	 9AWbJITFYDtoYfl0YYuSTkuISoKQX4Xlv9nOF1j4AlruA9vmAaikrRz/Ppnvb+oAvag==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794066551;
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
	bh=Ccz1Eld2K1EM2jYosQHKmbHSJxP5CCRYnQZKDIlGa/I=;
	b=abgJ/NDfil0kNUOSJFNg2TtN6uBTtW47frT6SLAtxyKuwZPKQKKeyy6DK28UjzZj2P4K
	 5tLkUBL6THzGa7jNYMtu9708O5iJo4OEsfR+qRgAEY1/vIIy+XN9OJVBMIUGKdf3XYKn5
	 PUi9Jfw4acvUmckUIbfWrUTCz1L4PuGb+H2B6QwpLNlSPmpwTfrAyuUBeS4wIbXvIMlsl
	 uP6bYcihNW+QrzTaCwNWk0yaPuZQBWd2yemf4neKNhK3ed5RG5myt/bjjDoWIRluoW3HJ
	 CixlbhWGgacE8CrNhIm/pMysm4fst7jZQFcPFAWbODtLAXtbPCZXWSTLdh6Yyt1wK+g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=hTJcK+ZY;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.57.29
Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011029.outbound.protection.outlook.com [52.101.57.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A689D606D802;
	Sat,  7 Nov 2026 15:49:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A689D606D802
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=hTJcK+ZY
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MbOIJK7db6U0E+HIKMK13k3l0rusA5mwFp0zhclY0ALyY2cdcZnlg6nDuoZmpDLK7fYP44fELfWiHFRB/uvHOHkIV829VjT7H6NUiXfF6BTjnXvGcnKQvRfByrerZO8Zghh56Asnm/rWdk+IBGNanRSCbwuqy+ry2qzE0IOlBy/DWUozZSKwekcpwf0FwlBlnvH6Dm/c12YWM36jd/E9gxNuszz+OaVpOFaU6PwHMPvg9ZSeTR+bcZrB7P7rSFP8lcpUu8oD45791VT/NhWyoafWJTiI4Op0wDq4VGOFWNjTuBrmWx/i+vjDBMI5+9fiNMFmvR7kA2FUK3oenIW/lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ccz1Eld2K1EM2jYosQHKmbHSJxP5CCRYnQZKDIlGa/I=;
 b=RgBjK1x9aK0PM2ZfuM6mQChchfHKFjPfhahMbift9C6qgbPRJRpY6HIDOikH6luZmwgLv/Z/r0nouDOmlbqD5GH+C1oCCC///53mh9ZuT8ExpEbn8aD8baWDax7oLmJpdhwXmSFqaTGAitMS8YqezPT0J86nU4CxDHI726oE4eYAPuopC0r3goPw7EIlKlnxK4gRVhtg2XBaIoCANdNZJF6Y0YWp/n80AZVqwFcufKbKPmx/PnCve/WoGNxEMPp7GqvC8rD7G5GFR/Xak8LCohrgl1By8MM9wGhFSDKEQisWUeRDGOrPPsScKVqptA/tweLy+cbcUJNfXw1A06tHdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ccz1Eld2K1EM2jYosQHKmbHSJxP5CCRYnQZKDIlGa/I=;
 b=hTJcK+ZYRElPZGYjzDqV681nLoIHZaEHUYRsKwHo5i2WAWShA4POIngw7kc6pY4iiPojBIBeQ2IH0JNR4Siql9v0CPPkpf7cyjOg16qfgBUtDZ7/2Du/F8c32RmyiqKR5EkZXKqIe2KeiamUuTSuZe+x01gRj7JdBKvFshj2sZQ=
Received: from SJ0PR03CA0185.namprd03.prod.outlook.com (2603:10b6:a03:2ef::10)
 by DS7PR12MB6359.namprd12.prod.outlook.com (2603:10b6:8:94::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Sat, 7 Nov
 2026 15:49:06 +0000
Received: from BY1PEPF0002696A.namprd05.prod.outlook.com
 (2603:10b6:a03:2ef:cafe::49) by SJ0PR03CA0185.outlook.office365.com
 (2603:10b6:a03:2ef::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.8 via Frontend Transport; Sat, 7
 Nov 2026 15:49:05 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BY1PEPF0002696A.mail.protection.outlook.com (10.167.244.154) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Sat, 7 Nov 2026 15:49:05 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Sat, 7 Nov
 2026 09:49:04 -0600
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb08.amd.com (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53
 via Frontend Transport; Sat, 7 Nov 2026 09:49:00 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <broonie@kernel.org>, <yung-chuan.liao@linux.intel.com>,
	<pierre-louis.bossart@linux.dev>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <venkataprasad.potturu@amd.com>,
	<Syed.SabaKareem@amd.com>, <Mario.Limonciello@amd.com>,
	<Richard.Gong@amd.com>, <lee@kernel.org>, <Poojitha.N@amd.com>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>
Subject: [PATCH v5 14/25] soundwire: amd: fix work drain ordering in remove path
Date: Sat, 7 Nov 2026 21:15:23 +0530
Message-ID: <20261107154659.3358223-15-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: BY1PEPF0002696A:EE_|DS7PR12MB6359:EE_
X-MS-Office365-Filtering-Correlation-Id: d9a8757f-2961-4f71-6bb0-08df3ce6a755
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|36860700016|82310400026|1800799024|56012099006|11063799006|261021121427099003|261021123027099003|261102123227099003|261022075727099003|261022105027099003|261009223027099003|261028144727099003|261026140227099003|10067099003|22082099003|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	B5mxueoBXNwebxXrTv21tQMhUEy5FVC6VR+ajnD5EZYDHC/1047g59Y3eI1YpYz5jXV4OYNs7RZ8YSeiaGSEypwPNdUVhwpnTYsNOgjUMtpNhNAQWlMqCj3ujmErTqER9OkXgjPFyd0iGqacjwYa4xvbkFvj1YcXGEB+096w49w6P3gPsegiuoUj850JjnJ0QGhVxMSDg4yQ6CKmSYYnFk4jthnOkq1bivtq5ALq49fLh0ZSleT3HOH5afPhm/gw+AmVGyJTH6jAavt+OSyEvVrFIiwmD547t2BtU5YzP4VXm4OYSyb/GlYW6ZOkzHyuE9X1pialyPE53Vlm0H7aT7nDCmuEnPKi2EzDvehq2BAEEoWFQpd0OZDfZevHj5Cb40gLc2xRzPd0TQu24llvogPZFEM8xur+PA5pNlRgRRRk56QKz21289n1tnhoyt2Qae+LzUPkdXsEDgLbtPLrNO+sJujvewebNKShzb0rg0vp628DRWkvFyz+iiJeYPl0A1eGMkM7KvzcdGi11278JZO3LQlVcZUm56vGe3tTS38V7FCi+Sd3x40ltoGxyv1wxDP280zsE/3LGYeYcai7U10xZoPxwAj4jDQYzlPAxUU0OSq9gSBUY7odzcSnClkEk219JICBm4XVDEA6oWrg8Q==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(36860700016)(82310400026)(1800799024)(56012099006)(11063799006)(261021121427099003)(261021123027099003)(261102123227099003)(261022075727099003)(261022105027099003)(261009223027099003)(261028144727099003)(261026140227099003)(10067099003)(22082099003)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	caLD0M2VvY8Tskgo6r95p4Mq8npb4P3XqPb7M98ku4kCjls/ez1+rrHU3rzB/QG8cLBXNF20+AaGKrD8vo6JyG0gwa0OWjDrK2Sp8MqjG5/dYhDqTzxpNjAO/Q1vWKhZrY5SNVYwkynrQlWne2SUFuOQrCdWysBhnJAbhaW5CZHcwr/s0DvBqxMlg2+YS/RpkWObxw9hVohZwu1voAqtO+eL85JhdQz68fIaLEAkehxqQcx2a00KrzpYvnoH/vP/seUawTmu1U9PjYVmo/iOVhs9ZwsCRE9Er//QmgLPNPjobqH5gvlTO+B5VFLHM15853OSpJSk6lJOSmppkfe3ZGThJpq1L0MnPqXcSkJlblBAEFIzevLemmo/4BD1kjKU5pSdeZGF0/p7EYStGWC5rQ2c4Rzscm9XSMJb3qwCuHPLZyet73b+HBk1aHSFFTJC
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2026 15:49:05.6149
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d9a8757f-2961-4f71-6bb0-08df3ce6a755
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF0002696A.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6359

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
Reported-by: Lee Jones <lee@kernel.org>
Closes: https://sashiko.dev/#/bug/linux-9890e8dc-4b7d-44d3-bfb0-171dc421e28c
Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 drivers/soundwire/amd_manager.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
index 767bc5510dfe..4083a3f0ec2f 100644
--- a/drivers/soundwire/amd_manager.c
+++ b/drivers/soundwire/amd_manager.c
@@ -1278,8 +1278,9 @@ static void amd_sdw_manager_remove(struct platform_device *pdev)
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
2.53.0

