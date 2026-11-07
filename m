Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.198.39
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794066552;
	b=XEk/v4kDM4OaXDOQcZdgJJiVVMFLJSn/3/4zrKZCmYtMGMHeJASGldC4IDXLjYkxEQ79
	 dQ8JEHOD2nmn43msw1yWoEhkuO4ud8qfqjtYhbfUD7ItWaQSU1WMwS0QsiPnDrDeYAhWB
	 o15pZ7EySeZ9H88PQfO8txLp2LwDk+3E67qksJ8zntmi/gssxSEaAPATh5dA3CGc5UBHo
	 Qa+3kMM1Sxd7KL4zVGj4GUjFb7Rlu2L0i2XaXeBvkHwJZwhwy3TfjbBs/pvAAl5TIzHeT
	 LNDHIk86ZK4ezSDQq2oQ/MRQqk1OqK7hUrA/Hk46tLn/Zchz3cGzTeMUrLUNPlruKTg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794066552;
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
	bh=NkNDHm07znOu07+Jd1Nw277ucA8d1O/dXMc17e13/u8=;
	b=1NgiGJtYGGBy7R2PxDZtLTfyBYxHIHMP/UqlwhAXytdGI2foCRnCC+Q5yN/PwRLgQOHB
	 ObTTpTncs8LvqZxAS7trzqfakLryHbmajKZZeNa++OhgDDPu6VpUP19YZkCcXuyUs81BL
	 EFACHDirGuTqQZ8uJeSAs2VSkOEOIg3lvddGz6dp6HG1s/NRdlBgyngkRbaX9L77jXUm5
	 Zaq/aGEhjRiDAEu1XVej+6WvLA/DXFP0sAFZ3grKBhAORnj8uOqEVmRUm25+xvrkm/JpD
	 dPTcaJjKeHKj1R8sSmiTfGUvS5zqvQfeyrv7liMcvEbW2FHd2IO3DoPLPZR7ZdK2ZNw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=F3AsXvQj;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.198.39
Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010039.outbound.protection.outlook.com [40.93.198.39])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 048E2606EEB3;
	Sat,  7 Nov 2026 15:49:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 048E2606EEB3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=F3AsXvQj
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b7WvbAjr8DWNBQx6wMu33aEmVlb2VnpgU0ligvOPqVc7FLx+MHZ/OYipNYp5CIp8RYZL1BcT+yMovBULVCAHQsdGTjxhXfJ75/ML8+kyTc1fiNxGaRh8J+6fqVE182CO4olhxnnfQ4urO3aJswBm2bjkNoia2J3lOckja9TuJpe1taKt1YAdn4oSEJtuUhQtYOMa9vbRX5MbXnMnAqhCMhFNVxUKCTRy9LxJf2wTrPXnNEcncrjAtroEhXTzlzpo2MaEF6tLzQVCj78TAKLJCfEpYyYr5uiYmkXe0B3A17Yv8Kw5N0B4CdXRGxCmFkc1mE8JV5tfAA+5+T9B9sq1Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NkNDHm07znOu07+Jd1Nw277ucA8d1O/dXMc17e13/u8=;
 b=dVeJr/s2VjHScADvEb63wwZWJHFMGqBbJIHUEMHB7wQeflprrc1bUGUBZcbg93wuQPRMUfpMvb6SEFizbZNXFEIltPravtK7YFi/vBIi1PWfaN884Zqq/hR5Z+lHhxZxQLs9QbPDfmD5oHQAS5HTWoKQ3czJwG1/cX7pVs5DdDifUE76TZ752HdLAaqLFtr3+CATAhAMOVvewrYtGc4HXGrrP5B7g6sW0B/kOviFXf3AcOD9V4qSY/TZanDX4WDfX+AJ9UfpFqno4ozQkkktIpfu2YeIZe7Arm7TawUYeVBjYDpNoK3WPy5htj9Bc+H9aSk3/NMvWv1ixbAebYDFaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NkNDHm07znOu07+Jd1Nw277ucA8d1O/dXMc17e13/u8=;
 b=F3AsXvQj/LfdvjgcQt4uIj4CE3nUMc0Jvy9l+F2z/Spe1N9K1oopZZ/8R8VVNksgtGVIH5QkBs37YX5tAnVhragoUwV5xbPqnho5r8ve1VD6KOOsjSFq3NdK1bBuJkrDuhhd6jZG1rVBreL4/gCn2LuvlBsg91x/3HmsNPDrCW8=
Received: from BN9PR03CA0060.namprd03.prod.outlook.com (2603:10b6:408:fb::35)
 by DS6PR12MB349270.namprd12.prod.outlook.com (2603:10b6:8:52b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Sat, 7 Nov
 2026 15:49:09 +0000
Received: from BN6PEPF00000070.namprd03.prod.outlook.com
 (2603:10b6:408:fb:cafe::78) by BN9PR03CA0060.outlook.office365.com
 (2603:10b6:408:fb::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.11 via Frontend Transport; Sat, 7
 Nov 2026 15:49:09 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN6PEPF00000070.mail.protection.outlook.com (10.167.248.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Sat, 7 Nov 2026 15:49:09 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Sat, 7 Nov
 2026 09:49:09 -0600
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb08.amd.com (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53
 via Frontend Transport; Sat, 7 Nov 2026 09:49:05 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <broonie@kernel.org>, <yung-chuan.liao@linux.intel.com>,
	<pierre-louis.bossart@linux.dev>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <venkataprasad.potturu@amd.com>,
	<Syed.SabaKareem@amd.com>, <Mario.Limonciello@amd.com>,
	<Richard.Gong@amd.com>, <lee@kernel.org>, <Poojitha.N@amd.com>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>
Subject: [PATCH v5 15/25] soundwire: amd: defer dev_set_drvdata() until after INIT_WORK()
Date: Sat, 7 Nov 2026 21:15:24 +0530
Message-ID: <20261107154659.3358223-16-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN6PEPF00000070:EE_|DS6PR12MB349270:EE_
X-MS-Office365-Filtering-Correlation-Id: ceee4993-c505-4133-25f6-08df3ce6a99f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|23010399003|82310400026|36860700016|11063799006|56012099006|261009223027099003|261021121427099003|261021123027099003|261102123227099003|261026121527099003|10067099003|18002099003|22082099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	ARuN886L6BYAHr47uDVNca1hI+L/ibDUlmKRPK+VAaELjqXTyq4R11g6GjINKMDUWpdh5O4WF3/nY+S2VUXOiuCCEN9SJsJaVxTw9nr8FUFn/F65yY4kYlR4z2BwD48c6RaFOYCSpilfeMtO6Npr8oEsdZ+sxyjyTEs2AYSRKZK+oX1yrzLZl2OFfzdVRCbiZFs3G/9YTAY4+DnfbBL6GWiaflXVZVoViQ+Q9ykTZDmj4vLD+zWr/c+qIyaAaHNkd/PojzwD7GBdC9UByfNRGQoyAvUlWyvbigkQ992khAXo84tsii52k0xHAGVng0jped/iSf/UPQJckMHGSBlWQHC0GEienYHfyrBkktsaAkfqKyvDgOjFOaiTnbt94xbgiDq6CRqlpQxW0tWyND9098e1D6AOE+lcAT4Xy/n0lqZmdPWbd06nSf86oCIcRGj2ijZ/mxvBo7H1n5J28Fhg/ESHCl51ip1kdswQGpRos/00rnI0O6WrTbLXJgrD9leQ9ZcsHtBqRxItSEI87lFjp2CZwjmQ7X2AnwmpU9BzPL29EjRHXrpJz3ENaKs7mNofZ17o8L6m6tNiKrxKlbAKltLzxLLpcH8BTgdyUxU5kO6SGOh4gOr1g65rIsvI3S4zbHkXkl/4gVp8ysO+Svayfg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(82310400026)(36860700016)(11063799006)(56012099006)(261009223027099003)(261021121427099003)(261021123027099003)(261102123227099003)(261026121527099003)(10067099003)(18002099003)(22082099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	HYm2T0EgwcBPYnkhWt84c4Ui+KmTC9COWeXKBekKpRW44lR1uxvBqVrE325sND6jWcxQn84ILM4Kk2UC0Zmqu9moSACfjTY6DonBQVzNSEogWkE9x8mWTeutdNdM3hbxHW3kk9aO+r2TJoA37LdGiMCRPpe5ffrk7tNcOwfMjS/7PiuntmOEgSOzjwFKs08heiCcGs30Rwu3i/i/r3ngYQzMUB/P1quoI4Ytoj7nDUiYmtMQW/DrpO8Qxdc0ga4fNoQZLqQlMLddLSGFrHeSPKM5X+SlkVVaEsd8N5CqiUJC8z7YbvBj9IurUVkUzvtso5aZtDiig+JmOc7K/lTNefRmnn4LgOs9+ocDtkATQy6BNVfujJ1puDbIUns4mGxo62x/XNyYLS0ohYvF6vq8aDZW0J9rkBKhPGMIHsa/nXCpqdbzTPK3U8TPaahPnIC5
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2026 15:49:09.5352
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ceee4993-c505-4133-25f6-08df3ce6a99f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN6PEPF00000070.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS6PR12MB349270

amd_sdw_manager_probe() called dev_set_drvdata() before initialising
the amd_sdw_irq_thread and amd_sdw_work structures with INIT_WORK().
An interrupt arriving in that window could call the IRQ handler which
enqueues amd_sdw_irq_thread before the work struct is initialised,
leading to undefined behaviour.

Move dev_set_drvdata() to after both INIT_WORK() calls to close the
race window.

Fixes: 65f93e4096a0 ("soundwire: amd: add SoundWire manager interrupt handling")
Reported-by: Lee Jones <lee@kernel.org>
Closes: https://sashiko.dev/#/bug/linux-9890e8dc-4b7d-44d3-bfb0-171dc421e28c
Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 drivers/soundwire/amd_manager.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
index 4083a3f0ec2f..df2fdff18d3d 100644
--- a/drivers/soundwire/amd_manager.c
+++ b/drivers/soundwire/amd_manager.c
@@ -1266,9 +1266,9 @@ static int amd_sdw_manager_probe(struct platform_device *pdev)
 		sdw_bus_master_delete(&amd_manager->bus);
 		return ret;
 	}
-	dev_set_drvdata(dev, amd_manager);
 	INIT_WORK(&amd_manager->amd_sdw_irq_thread, amd_sdw_irq_thread);
 	INIT_WORK(&amd_manager->amd_sdw_work, amd_sdw_update_slave_status_work);
+	dev_set_drvdata(dev, amd_manager);
 	return 0;
 }
 
-- 
2.53.0

