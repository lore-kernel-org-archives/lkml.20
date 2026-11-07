Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.193.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794066559;
	b=RozjDcNxJo8Kwzf0KF26VB1uAkrkCJlxruL6O4v39FNgNaGydewWcEHwi01Mum4e0bCP
	 23D0y9fZ0BdGZXagDlhs0PfWIxlF5xIaiHFR2Yojq1Li5m5mwu1dLnTCxxhj+vQaK1rlA
	 RhTO76nCVEB+x2G4ziyOFT1651tm9NQyOhPoSNKsX0NsHVUp7VpKJAZrXROcoYidj3rQx
	 z1w2voDUc/VV7EwZsFu2b9nISzW4V+BQEV6JHu1hEPqWQmDbynPVV22tN6NzuHhgfvyb7
	 zXrnXjIzYv09aonHAVJAfBQTxx/UdO1WDioOv8K+cUnas0Tmt2BiQMNDmtgIa00+02Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794066559;
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
	bh=WKo5FY2BBGW3mprTNm6sSKCriUhBbMwnxAP0axn+plo=;
	b=H+K7LfQVM/kVHByJTOseg8Ief1iXWKkuXGztEOp96rIy4PO02+Ox+kaxKKxlIuZH5Z6h
	 bRo8WzYVFE2Hw6gKvHzxjtogr37r8XzMUtyrIO5IZ9BfoyXamCh+7lGVoSjE8Fl8vyFyD
	 RUb0ZPgNKGrE+RGrag5l4Ly1iCSN8O9mFnLa+PEX+c2HH6DlfTSN0W4c4c0Y8/GzW43MO
	 GEixFtGB8MuYFISYM3PmNfLpCTtIJVBVHZu/6aqL1fWTAndsBw7H2L+73+eh6LTxe/eZR
	 p9CNftv3A3Qdf4kaATBNaH+on5v7GZiq5atBqY6oieqnXWNs8qZUTOqqcMDRQtg4URw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=cw5KaU8c;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.193.43
Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010043.outbound.protection.outlook.com [52.101.193.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D667860A5BDA;
	Sat,  7 Nov 2026 15:49:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D667860A5BDA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=cw5KaU8c
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ETQaKIiSEjUM4XJhHJh2WjNvnRcAdySrGursqGm8Yviihg0CSKLKMaKd71FVs6gVb7wYTJVrQAPdE9XVMe3V7WkBenrlwU2mo6/e7bLF167nz7SfEEtebrwOa9IoLRYPE0oSTtT+hL+WJTnHjZUDRDABZ2XXiAj59w3epW0U1tVvEnYskH8IvXeU6I/HSZBKW/Tm9jW3WkwQKbJ3jCFcnZ7ZbLBUWnt3EsjoXdXsVCguyXOMAzN1efaimFGlnMuDkDbdJpc75k2EKdrbv8Dx5tcFtgQrxA5EzsBcl7V3nwgZL/X0vN6n6Se78/i8IXu58LV9zVWQQmVInw9b5lqNPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WKo5FY2BBGW3mprTNm6sSKCriUhBbMwnxAP0axn+plo=;
 b=NrR2kjH3VJb8CNOhk/aW60OF7wCiZNx9bUFDgpxBRQPaotBHbELPDDRjye9EKUc03ot+KOTR9eRFi5EHheDQgiq3LCvjXwa6fwn9G9jS/oCqzglhZyElyjSCG4M50jO3SU8dk/pMcM3OophD9POxIFca1KOH5JPMQOWamyP7fvzuIuRE7ZGwhlEPPrrjPWarJCga38DhAuNZXJo0dYT71dNCKTSevmIG6b7GSRGeCBtSsfWThHDXFYq5XI82AHeuWdyEmFPc3OkcvpgfRfOnprGz1lTkkQR72P+q1eN3js/M+QFQpWOaXvCmm2hXPnzYr2zmcJA4KJpQwbcdGLxohg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WKo5FY2BBGW3mprTNm6sSKCriUhBbMwnxAP0axn+plo=;
 b=cw5KaU8cGvv1aYhpK1BQT3fMqs2e7o69+aGcLrkb9llTy7Lktk94sAJY/GC1oWO3FFo6RQ+NOJ9GackPVQ3a7M8RBgTjvkJ2uofFAuBQ1R3Xp9sldS8VxzV+wBn0/3NaxQ+yNQaoOKsiasvnIjilSHzvKaJEiDBnfmaUQkmRpOc=
Received: from BN1PR12CA0011.namprd12.prod.outlook.com (2603:10b6:408:e1::16)
 by IA1PR12MB6211.namprd12.prod.outlook.com (2603:10b6:208:3e5::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Sat, 7 Nov
 2026 15:49:13 +0000
Received: from BN6PEPF00000072.namprd03.prod.outlook.com
 (2603:10b6:408:e1:cafe::84) by BN1PR12CA0011.outlook.office365.com
 (2603:10b6:408:e1::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.11 via Frontend Transport; Sat, 7
 Nov 2026 15:49:13 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN6PEPF00000072.mail.protection.outlook.com (10.167.248.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Sat, 7 Nov 2026 15:49:13 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Sat, 7 Nov
 2026 09:49:13 -0600
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb08.amd.com (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53
 via Frontend Transport; Sat, 7 Nov 2026 09:49:09 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <broonie@kernel.org>, <yung-chuan.liao@linux.intel.com>,
	<pierre-louis.bossart@linux.dev>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <venkataprasad.potturu@amd.com>,
	<Syed.SabaKareem@amd.com>, <Mario.Limonciello@amd.com>,
	<Richard.Gong@amd.com>, <lee@kernel.org>, <Poojitha.N@amd.com>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>
Subject: [PATCH v5 16/25] soundwire: amd: pm_runtime guard in remove path
Date: Sat, 7 Nov 2026 21:15:25 +0530
Message-ID: <20261107154659.3358223-17-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN6PEPF00000072:EE_|IA1PR12MB6211:EE_
X-MS-Office365-Filtering-Correlation-Id: 7156c58b-96af-4638-2339-08df3ce6ac2f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|1800799024|376014|36860700016|261021123027099003|261021121427099003|261022105027099003|261022075727099003|261009223027099003|261026140227099003|261028144727099003|11063799006|56012099006|22082099003|10067099003|6133799003|18002099003|261102123227099003;
X-Microsoft-Antispam-Message-Info:
	7OTvqqbMOK3dnLgU/MoTCXQrTf7uzCtMldylcWtabby8srz9QQVkOvqWPLR28rmO1JoTXSA/+R1e86NG1wflad8dHhdAiNNmhqwL8LuewJDC9N50bHe0Nwp0K2IT+7y8nDYfNMR5uFP+cHkE7crjYOzdKLTSMQmgVfjO9EMZsOqfVKPAom8ZC1FIbxp2cmkhaBc5Nj2ktJEuisPDDbDcxntFssNmXkPxW0dgogbnumd7l/XjijsqVHm9t/704nxsXkQKd5fjK8O3MjaaAFZNcnLt6Oqm4ksy5Sz/RWDPRSVCsoQaUFE0UG+bn3AbQhQjnCos43SoabekwafVugay2F/EcmF2f9wsaKoZZXvWJdygAjAFTyn5zQFxAW1hexeUyDNxjJV3TeMllUXWx4ac3uxyWBF7Gal3Y1TjVJCBqGuF0bQ3lACTwVyTRj34T0JzDhM9c/kXj+Ls6spCiYjWNdwDMGan4t3TbpMpn+zotXbtREkbufcv/sMXfIQ1KOcEV0SpL364HBi7v1mg9Yegs/fLbKytXd7K6vJRBym6y4NMBAjwoiz3ATIBdbppYSECP6CAjpZ0kCMBf0HH6Pm5PeC3iwGRMeIvC6TSxzxyJnW2zCrr4kH7N9g1S1RQEIwBKcpK+9n1yXm5szWSuM2zz+OaWLIO5/oNJYBjgKLlzYvG+5ceQgFltR+xriEXgduDJ5Bg9odYVTNe6LF1Ie/QeA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(1800799024)(376014)(36860700016)(261021123027099003)(261021121427099003)(261022105027099003)(261022075727099003)(261009223027099003)(261026140227099003)(261028144727099003)(11063799006)(56012099006)(22082099003)(10067099003)(6133799003)(18002099003)(261102123227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	+/fZsfE7rYyPoEXifre08iUsziWxAUdw/0Tv05+8mRqXzUzzkYVoZn/2V1XQUlbIWx2+MUZbaimllfTs+48/J/TUdbcYnL5fVTDLsMDiQgJWbnPXsyfxq7AV8o859BCndI5+Veh5z5xifyE6ZceuivFOJtVPteE3ATN8s2QPrG+rxBFOx51cAX69zq6Pxm72Kb4IRz59GHPSvI1WvUUXpHKZM+X/UqmPraJx86tT8SWDr1rje0kFnr707QItaWQw+mKE0efitv+KapH+zn/Y0jGxze24O2HKgsLK7tcQBChQfc3E3Rbrt9b55cNRxBrUTmJSOj1PaJv/yNKNdyJ0omJiGoLn+zRmzNbuWjhxji5jznEv92TSWLnRMj8DCYw1LhMSX23z7CvIT1tWf3UzDXW6fHefLcswJl0v0HaT/0nerxBQRKza571OQ2hLTPjP
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2026 15:49:13.8391
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7156c58b-96af-4638-2339-08df3ce6ac2f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN6PEPF00000072.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6211

Guard pm_runtime_disable() so it is only called when runtime PM
was actually enabled. amd_sdw_manager_start() calls pm_runtime_enable()
only at the very end, after several fallible hardware init steps. If
sdw_amd_startup() fails mid-loop (one manager started, the next fails
before pm_runtime_enable()), sdw_amd_exit() triggers
platform_device_unregister() for all managers. Calling
pm_runtime_disable() on the partially-started manager finds
disable_depth already at its initial value of 1, silently increments it
to 2 and returns without a warning, so a later pm_runtime_enable() would
only bring it back to 1 and leave runtime PM disabled. Use
pm_runtime_enabled() to skip the call when it was never paired with an
enable.

Fixes: f93b697ed98e ("soundwire: amd: cancel pending slave status handling workqueue during remove sequence")
Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 drivers/soundwire/amd_manager.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
index df2fdff18d3d..01aa051cf63f 100644
--- a/drivers/soundwire/amd_manager.c
+++ b/drivers/soundwire/amd_manager.c
@@ -1277,7 +1277,8 @@ static void amd_sdw_manager_remove(struct platform_device *pdev)
 	struct amd_sdw_manager *amd_manager = dev_get_drvdata(&pdev->dev);
 	int ret;
 
-	pm_runtime_disable(&pdev->dev);
+	if (pm_runtime_enabled(&pdev->dev))
+		pm_runtime_disable(&pdev->dev);
 	amd_disable_sdw_interrupts(amd_manager);
 	cancel_work_sync(&amd_manager->amd_sdw_irq_thread);
 	cancel_work_sync(&amd_manager->amd_sdw_work);
-- 
2.53.0

