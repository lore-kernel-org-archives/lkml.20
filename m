Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.201.64
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794089478;
	b=WscfWwarTbPAP+idJr5CaGJilRU+JWwm9Nj3kbejTvbx5iJ3SY3GTiApEmFVMbhtnbJD
	 joUb7/7YB3KLIEMVR+DeJ5ETNA8ddw7Vyt4yVjDV1P4TAs+SmNd6v+lix8CbEK8TTmnse
	 kdN5e7cbfQrVhj3f7E7tJl/fsPGi8cUZsArM01gmZHEKZW2gIgaK2D2/irrDn8whRgxtQ
	 ZCJp5pLMhOdu/U7zA96364UcY1dMRGJvhD7cdxxQdZJ1TiKqDZzsK08AUz9d4EJQyhKZv
	 dApKX1JSPY0RXi6ZC/mBEJ4yCbQeTz/5LajNcC/IESh/71paKT6f++wRl9iUZgj/tOw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794089478;
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
	bh=9xEbJtySW3cwF6shX5z99kYIMp1tL/Cy8atQK53/1LU=;
	b=PmQb24CqdhIvkXHbBOtdmHHdXDD9RLtUj73/6jXQArPG9p12p43b32gFPokLRrbrXcQy
	 1ITXUXKbboefpmDJTj0S7e4SO+Ray/ilARJrV8TmeDYgtHFvf/m6LefibLOcuIhoeps/k
	 iEVNsizgPnVs/q7xERWMkEbDkV+cD9QUB43R72mZjGItByeuxzTKHJVj1sJkmVWwqSY9/
	 3ch0+F47R4UH2QgkPdmmdDu8lHmXIO+/TYJ9U1eJy5upQz9fAhajyGP3/hXSIVo0KdIQc
	 fsGgyorkPAckbYA0x5dlCFozYFxcxmVtARkEgmMcxkU5fiagF2mA/fuUwrFMmfmpFtA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=JYuNKXFl;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.201.64
Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010064.outbound.protection.outlook.com [52.101.201.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABA3C606A326;
	Sat,  7 Nov 2026 22:11:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ABA3C606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=JYuNKXFl
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rFyi+xjNMF97YDjg/7LiCnAmXvNnHu80PuQc5SpbhTMcxb3QBxiNfJI2cBoobBomRhkkT2Rmsb9/0R57uL/0INB+sOw/h/NeoD24AaWCwjPSe94JHdaRrNLgwwqaJDA9sKIdTENJO0BRXaKDPK0pF4BpSg5z6thy7WkzmqzCpLP782sv189zr5lWNBp7VT5DNeIvRaAmfK0+0utcFPJwq8Ukfq0IKi5HP+1CXB3ODOQOvEZovV0mRu0uIB+c+jajsO4baQZArrKl76QzX465uDszU1XHyu3/UD+UNmtCmiOOTSI8/IZwLNm1ieGlDI7FFE0h0F6XeZETb4HV1FV8aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9xEbJtySW3cwF6shX5z99kYIMp1tL/Cy8atQK53/1LU=;
 b=BSiSRpfVDh2tUwQcfsi9BDG7jm75T5371kyJQOGWN36QcWPYh8FXujYx2qScsVqc5kNzdtqjCDip/XSFKmlskD7YPyVHnPK1Zexlj4/rbSTtoIFqTIE/GBFcGCgm26QuJtit7t7zqZoaWoExAQ8j90It6D3K1ZTActWpZXpa6gL3wUPwvMKct1gozslSP8WLzceBdIK6etdSLxrN8kIHDi4aaQXE8qhlL7nre9Ge5yQGUitpsOhFsM4d3UmHrzyCqgvBDkGRqohok3A5XMWGFpuzkFrLhYVjdtDXu31/QYrdJosKNJA8UMcJWFdiHztEObc+pIXYsifz97OysTX7vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9xEbJtySW3cwF6shX5z99kYIMp1tL/Cy8atQK53/1LU=;
 b=JYuNKXFlNsZx2BGIcEaP6YStZXW1X8jWauFK+UPU3GqEcxRLozEPqahvIOOJYbm2s16YrxQSsHfY+heJPdFN6uazvWg7G9MrLyDDqDqGPJN0X/jv8MZYIyfWfxvYxFQnYZcwW0O0fOrSzMZlHi9+9Gc0kkgnmWXd/N4YdGHKJTQ=
Received: from BN9PR03CA0572.namprd03.prod.outlook.com (2603:10b6:408:10d::7)
 by DM4PR12MB5988.namprd12.prod.outlook.com (2603:10b6:8:6b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Sat, 7 Nov
 2026 22:11:12 +0000
Received: from BN3PEPF00022BD1.namprd03.prod.outlook.com
 (2603:10b6:408:10d:cafe::45) by BN9PR03CA0572.outlook.office365.com
 (2603:10b6:408:10d::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.11 via Frontend Transport; Sat, 7
 Nov 2026 22:11:12 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN3PEPF00022BD1.mail.protection.outlook.com (10.167.248.171) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Sat, 7 Nov 2026 22:11:12 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Sat, 7 Nov
 2026 16:11:11 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Sat, 7 Nov
 2026 16:11:11 -0600
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53
 via Frontend Transport; Sat, 7 Nov 2026 16:11:07 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <broonie@kernel.org>, <yung-chuan.liao@linux.intel.com>,
	<pierre-louis.bossart@linux.dev>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <venkataprasad.potturu@amd.com>,
	<Syed.SabaKareem@amd.com>, <Mario.Limonciello@amd.com>, <Poojitha.N@amd.com>,
	<sravisar@amd.com>, <Richard.Gong@amd.com>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH 11/11] soundwire: amd: add interrupt_enabled synchronization for ACP7B/7E/7F
Date: Sun, 8 Nov 2026 03:38:06 +0530
Message-ID: <20261107220913.4058072-12-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261107220913.4058072-1-Vijendar.Mukunda@amd.com>
References: <20261107220913.4058072-1-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF00022BD1:EE_|DM4PR12MB5988:EE_
X-MS-Office365-Filtering-Correlation-Id: 42554043-149e-41be-bda6-08df3d1c08a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|376014|23010399003|22082099003|18002099003|10067099003|11063799006|56012099006|261026121527099003|261021121427099003|261021123027099003|261022075727099003|261102123227099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	yqtyGmkjFpwTcOBiXGLd4fLw/AEiawPMPC09/CQgKR17wD61vrIP0txy1D85FkoMvTsFvyDzwZAb/YTrBA3UkfcjKRAmq6Pwisj56BULNwmbu+aaHb0WUGUyviWQZ+oSkVZ85DGH/mYQfeF1lT9ZuX+S5ymoH5Np6TySy3u/mtwp8NY4qtr6uk6Endstz49a4bEQx11plHm6IPihfMvvWywYVi8DMXbe+o5G1t4gTKvlb7tqPXUAyYQ9wrZCXfSA91SSc3l7jlbzhLPNQ8GyHRkB7SJT4NoTzr99feHqll8qE8+iky4ylj7MOKQkYOEvZK59L2lImNr1Isxlxo3FdWoKC+gzNL6VqrOjrc8wxKW8aJSn1PJOazYZpAcErCEq/N1BKP3F70u91kIDoHtU0xNQjWhvkUUOkfvQSeaaRZy6kp2AVBcBmUQkqyccYcBNMuMJyyJrd+nkAiKIOQvfE+TFGiruYBzqpNA7rcNRXnprFBvGM02gOyY4ozqe9SQb7MQByKQAbstPlWyt9kPjd+8OFygbsRxRmxhSD2mrBMzqFMKNNDFuMPjbDKr7Asi8uPE2CdEHKS875YlKcRV6e5dwIqWTUnCRPD1HclQDDr+1u0wx5UwGkDVL+8BEvVGLjCTX1b8eB4JZtSHxwFWyG2bfOpiGDmYJOJkLVFu2CCPiN+3jAhNQIF4Rq7UppHZahvvfRBRy5KIEtAcJTPxUsA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(376014)(23010399003)(22082099003)(18002099003)(10067099003)(11063799006)(56012099006)(261026121527099003)(261021121427099003)(261021123027099003)(261022075727099003)(261102123227099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	tbd1N5JgTVEuYsUZsoTuSwtn4H63oNIsKgb1gso2DmUx+UeUsjhSMDwRFlHInOGBH7dR2Ns5KFwNCSdU7mNnKNM/qi4l12ZMK88JrqtQoBzkRhp9cCImDdpajESn+vfpIaZu4Ms1HdgSBaLzd0k4ptatmuvtkqlO448LdUWa0dY9+ZLNV/+bABdPmPbNJIvYTjHjxx8BGmDQHUHFgM5wux53LPgP6qpk3tfr1U5btopFvvvd32hx5BjYMPiKHPc+dBtH1T1nBjVRrr4EDVkgLSqyDB7NaXShFWhP/NKCcB3UnRBVLmqMb8eh28cv6vwRJO8ExhRVxkop/30ZyEdmUGze5o+HNjNq1QbL9eX8Ux2NnGqLdVqAh5RIb2UsAyOKLYRa2x+9R/TxP9qOmfAGDeQyNL5MmWDguo2PC0Aa2tAXkOrUevx2c66g92YJxr6O
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2026 22:11:12.2800
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 42554043-149e-41be-bda6-08df3d1c08a3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF00022BD1.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5988

Mirror the interrupt_enabled guard already used by the ACP6.3/7.0/7.1/7.2
manager to prevent new work from being queued during teardown.

- amd_acp7x_enable_sdw_interrupts(): set interrupt_enabled after all
  hardware interrupt mask registers are written.
- amd_acp7x_disable_sdw_interrupts(): clear interrupt_enabled before
  writing the hardware mask registers so any in-flight IRQ that arrives
  during the mask writes sees the flag as false and skips scheduling.
- amd_acp7x_sdw_irq_thread(): guard schedule_work() with the
  interrupt_enabled flag to avoid queueing new work once the driver
  has begun teardown.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 drivers/soundwire/amd_acp7x_manager.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/soundwire/amd_acp7x_manager.c b/drivers/soundwire/amd_acp7x_manager.c
index 9605577a8d35..d48254a279fe 100644
--- a/drivers/soundwire/amd_acp7x_manager.c
+++ b/drivers/soundwire/amd_acp7x_manager.c
@@ -362,12 +362,20 @@ static void amd_acp7x_enable_sdw_interrupts(struct amd_sdw_manager *amd_manager)
 	writel(AMD_SDW_IRQ_MASK_0TO7, amd_manager->mmio + ACP7X_SW_STATE_CHANGE_STATUS_MASK_0TO7);
 	writel(AMD_SDW_IRQ_MASK_8TO11, amd_manager->mmio + ACP7X_SW_STATE_CHANGE_STATUS_MASK_8TO11);
 	writel(AMD_SDW_IRQ_ERROR_MASK, amd_manager->mmio + ACP7X_SW_ERROR_INTR_MASK);
+	amd_manager->interrupt_enabled = true;
 }
 
 static void amd_acp7x_disable_sdw_interrupts(struct amd_sdw_manager *amd_manager)
 {
 	u32 val, acp_ext_intr_cntl, sdw_intr_cntl;
 
+	/*
+	 * Clear the flag before updating hardware masks so that any IRQ
+	 * that fires during the mask-register writes sees the flag as false
+	 * and does not queue new work.
+	 */
+	amd_manager->interrupt_enabled = false;
+
 	mutex_lock(amd_manager->acp_sdw_lock);
 	val = acp7x_sdw_manager_reg_mask_array[amd_manager->instance];
 	acp_ext_intr_cntl = readl(amd_manager->acp_mmio + ACP7X_EXTERNAL_INTR_CNTL);
@@ -582,8 +590,9 @@ void amd_acp7x_sdw_irq_thread(struct amd_sdw_manager *amd_manager)
 		amd_acp7x_sdw_read_and_process_ping_status(amd_manager);
 	else if (status_change_0to7 || (status_change_8to11 & AMD_SDW_8TO11_DEV_STATUS))
 		amd_sdw_update_slave_status(status_change_0to7, status_change_8to11, amd_manager);
-	if ((status_change_8to11 & AMD_SDW_PREQ_INTR_STAT) ||
-	    (status_change_8to11 & AMD_SDW_8TO11_DEV_STATUS) || status_change_0to7)
+	if (((status_change_8to11 & AMD_SDW_PREQ_INTR_STAT) ||
+	     (status_change_8to11 & AMD_SDW_8TO11_DEV_STATUS) || status_change_0to7) &&
+	    amd_manager->interrupt_enabled)
 		schedule_work(&amd_manager->amd_sdw_work);
 }
 
-- 
2.53.0

