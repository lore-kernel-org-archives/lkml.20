Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.195.30
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794066562;
	b=BmVkhE02ZIZIxnB0F8dQaZo/k56Qh28ythJfaeG8TwTVekvSXuyCT7qv+2squccrHQ6J
	 D1Mx+yTAEKOtglQVmDYbeQNLuwwC4yt63xE/rJgmm1iMjtmRf0SZnnVKM6QYr5I3CdbBx
	 7Ozw6z7bwGdGAoONFd+lqhOsSGbpiTjR2BO0r3MDSHvwwYmMYlzWi3et6tZbZlDnY7YL3
	 Mth+062OKuUptFt0OHFuCvdGz7tOleeX+Lp0q9KwPNYN7djzuYpc7uvuh7t0cX6djkzku
	 GMS6UhEDB/Rtd2BhqWj1xkcNJysLyxvnyGraEtzYQDuPHndvw5GHvONf/Aa8KQPrV5A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794066562;
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
	bh=hHro5cnHm/nGmDiIOY/0/l6FmkbtS67Vo/M4aXiWOAY=;
	b=JHcqnEeOjo0qr7B5q5a6Gf+0fmyYizUQeze8S//O2iBQpuq6iZl/1GFFL2j36BdDFUpA
	 wtVjIav+xYpONppilGuIw5Xi9CnVNbul1iqVnqVao/U5RRUAfRHseALZAvVokrDwOtDTO
	 EG4soPtxc0nRpliVJBaLOfdmG3VU8iOal2sEP/ZigQ6qz5xv8UfDWTZH0DX6U1p43wIEJ
	 YQW9xslrwwbBoIryv3t7IKLR1+KfFd3S9FsQ82rNpux/42mARB1UsexekWtETGNklji/x
	 HcnukDJdHpeIveTiQyR7jjlnBGmyI6j8/zunrkUJeyfk7BFIKgKs9L+8K8BOHkFB+JA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=mGJeW9UF;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.195.30
Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012030.outbound.protection.outlook.com [40.93.195.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 146266082BC7;
	Sat,  7 Nov 2026 15:49:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 146266082BC7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=mGJeW9UF
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cpGI5j/WKfEe/FbBO1kuRSBh5kDSzQH9/yyrnG2Kv0fHthMQS1k1AFeKbHWMRtIiUK7zsUEhZG1oQWKDNEQuAkGQeLwrsDOMOySKYYCcjvkbfZy5hVvCLPp4bvMup6Hlvm2Nh0j0yG+Yd20zwp+OrOeIY/IHlWHpMDmYmCeNsp7G8+EtortTzk7yZS+0RYDmNNyaCDHyzfMvuRE1d7QwRTQFELlhUhJcni7hcvqOVWUhzSTp6m7muLLqqJ2mxTV8lk7qiVS8gvTVMrvwaTsNLVaqkcpIViYPcLozOjQ2kPU9w/yvXVH8QFJrgVyMXizCY6/MG5yF6jR+u3tFnhLRtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hHro5cnHm/nGmDiIOY/0/l6FmkbtS67Vo/M4aXiWOAY=;
 b=T3DXC32Ga6dTy4nYJnYBLyr3/3FMwWkLp5wVY+ZRftKSwPJ530ynQLtKaKKKIGvbiu+iHMdUgL/wyY6CpxZGmnqXrHH+l7C7W54oA5Dmf2Lhf2DKh9e3ry/XZCrvs3GltOz0nz3mIC4YFLhTkkQPYnOQ0UqzmqoAkXMEhdm51VP61Eqpmf/NSoAQ2HwlRpCjMpO1PtWezj2xcTqnZbee1P8S/s0Cg/Q0Pv5SiXXAuUw2fRHP5Iqw0/qwHSWa5WKDBbgXqXRcWKkEZB5VOnoZqM2tT/t+xfk3T4Vjm9zoKSY42R5tdm2fZEB8s0XIHgCPeNWZnhQ9dS8SRcSSM8FA+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hHro5cnHm/nGmDiIOY/0/l6FmkbtS67Vo/M4aXiWOAY=;
 b=mGJeW9UFKe3cMHDIsWotqcK+2eqbN0Z3v/Np4ckEr3zvJyAhDmE7VaUzD5BqFiHsCVXe6PRHq5iZGmCTxPATFZfYX/MajAa2nQRisRDcKCNaR41QeJ6czjslQki8klkunQSAWKJ3Mn3O1qC+dGwUSyhJrzmzcUgbKoUFp9iG/J8=
Received: from BN9PR03CA0059.namprd03.prod.outlook.com (2603:10b6:408:fb::34)
 by CH0PR12MB8552.namprd12.prod.outlook.com (2603:10b6:610:18e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Sat, 7 Nov
 2026 15:49:18 +0000
Received: from BN6PEPF00000070.namprd03.prod.outlook.com
 (2603:10b6:408:fb:cafe::43) by BN9PR03CA0059.outlook.office365.com
 (2603:10b6:408:fb::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.11 via Frontend Transport; Sat, 7
 Nov 2026 15:49:18 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN6PEPF00000070.mail.protection.outlook.com (10.167.248.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Sat, 7 Nov 2026 15:49:18 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Sat, 7 Nov
 2026 09:49:17 -0600
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb08.amd.com (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53
 via Frontend Transport; Sat, 7 Nov 2026 09:49:13 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <broonie@kernel.org>, <yung-chuan.liao@linux.intel.com>,
	<pierre-louis.bossart@linux.dev>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <venkataprasad.potturu@amd.com>,
	<Syed.SabaKareem@amd.com>, <Mario.Limonciello@amd.com>,
	<Richard.Gong@amd.com>, <lee@kernel.org>, <Poojitha.N@amd.com>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>
Subject: [PATCH v5 17/25] soundwire: amd: use interrupt_enabled flag to guard IRQ work scheduling
Date: Sat, 7 Nov 2026 21:15:26 +0530
Message-ID: <20261107154659.3358223-18-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN6PEPF00000070:EE_|CH0PR12MB8552:EE_
X-MS-Office365-Filtering-Correlation-Id: 77359eac-d454-4b66-43ed-08df3ce6aebd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|376014|23010399003|1800799024|18002099003|22082099003|10067099003|261022105027099003|56012099006|11063799006|261026140227099003|261026121527099003|261102123227099003|261028144727099003|261021123027099003|261022075727099003|261021121427099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	3CIO4dvRH5uRFVo+X+154IXbSjQ+x8bCopL4/IXzDagLAYrUFLvgQiUh8WQzrL0NWElQtcFgnpDklP+7UQ9Z78j4ddw8L0IKZmLs/p+DKwt8W3nv+5eXgXVk1nle3S4W1m6swAqNv3XmAdkbrUDeHDS29hPm1o34HqwbyYYiSSct5eOJ5IRWanRzhJxqAPilFl5zJJl6A1EcnXqqpCbBh8x/hMyXtY3oZ9de5oyNfEv7/LPTOviXZukEUXkPEJIUhyESNgKyplfNwxZnzuCUdGLAWMzgU3dVP2TspoQHm5mUxhkZUEK4yZWyYUF01MexOiWnPToNINwycpDf55REwgUjB1DDWeW0Jsh3WLSU1aKB1uRa+9DxjC3GcKbPIf4Dk45hBou5ACdl/YNNBI9l9/8kTCztrLIxBl6jcFR49WAif26C4diO0kUGheinBhsfBJyiXAzYynDcddEYKKH6lODIdBhGU/xuCiv38n5ju5oiqZruQ208jSc9lTcKQ5/CpRhvZIAomxEngGOH924uoBeFRI0DBhfsG+omwXs9OXD3DI/lIKuD0R0hD85QQMPJmT9OFmETobcUjOzYn/1e+mwo3fNMygVjyiwq0sgBSB6e2pPawURDpOggdpHiBCuSBDgesf2k9V4Ecm+myPPYKw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(23010399003)(1800799024)(18002099003)(22082099003)(10067099003)(261022105027099003)(56012099006)(11063799006)(261026140227099003)(261026121527099003)(261102123227099003)(261028144727099003)(261021123027099003)(261022075727099003)(261021121427099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	EMYvm2jKj8PLP7t3rMrC0TtlD4D2pdXxZ9PYzLtkUKxGzcQP4+V/vDkIC2TbgE6cYnX5B3JiX4NQ0KpTqLa+eDetnmTMxuLhgTy8JSv95NFXa24yJdztEoJqrMg6ofvQiq/E6JSzPMu0KKt7/iFAWW5WG7AJb0WuctOWn4BPeNue2jJ9fP68qg5P/On5pYok4jIC1fAJo1yXoGS9N9mGWcj2TLd4PyLeBpManWNzyok5WOXrYHkkAvWHImvLxoOj0vKJdJrp/P7JWHUe3M91Za/Z/R2PaS7GXE4APa/rVjGgQoCyh6cgsQ9j847dLLQX8FP/tPXLkVmRfRK7gPbpC1Qz7l/Zgn0zIcveDK02ivpfZ2aU1tbRnJz6d1ehG0KeF5WISmkG8N7+k+WAyGUDDiGQoZ1s99KNosW/5didwxFamy6cdJzNMW7sT8hF/G22
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2026 15:49:18.1300
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 77359eac-d454-4b66-43ed-08df3ce6aebd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN6PEPF00000070.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB8552

Use a boolean interrupt_enabled flag to guard IRQ work scheduling and
prevent new work from being queued by an in-flight IRQ during the window
between starting to disable hardware interrupts and the masks taking
effect.

- Add interrupt_enabled to struct amd_sdw_manager.
- Set it to true at the end of amd_enable_sdw_interrupts(), after all
  hardware mask registers have been written.
- Clear it to false at the start of amd_disable_sdw_interrupts(), before
  touching any hardware registers, so that any IRQ that fires during the
  mask-register writes sees the flag as false and skips scheduling.
- Guard schedule_work(&amd_manager->amd_sdw_work) in
  amd_sdw_irq_thread() with the flag check.

Reported-by: Lee Jones <lee@kernel.org>
Closes: https://sashiko.dev/#/bug/linux-ab458b2e-f505-4a41-8238-a93ceb5d9c77
Fixes: 65f93e4096a0 ("soundwire: amd: add SoundWire manager interrupt handling")
Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 drivers/soundwire/amd_manager.c   | 12 +++++++++++-
 include/linux/soundwire/sdw_amd.h |  4 ++++
 2 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
index 01aa051cf63f..108553b0f32e 100644
--- a/drivers/soundwire/amd_manager.c
+++ b/drivers/soundwire/amd_manager.c
@@ -129,12 +129,22 @@ static void amd_enable_sdw_interrupts(struct amd_sdw_manager *amd_manager)
 	writel(AMD_SDW_IRQ_MASK_8TO11, amd_manager->mmio +
 		       ACP_SW_STATE_CHANGE_STATUS_MASK_8TO11);
 	writel(AMD_SDW_IRQ_ERROR_MASK, amd_manager->mmio + ACP_SW_ERROR_INTR_MASK);
+	amd_manager->interrupt_enabled = true;
 }
 
 static void amd_disable_sdw_interrupts(struct amd_sdw_manager *amd_manager)
 {
 	u32 irq_mask;
 
+	/*
+	 * Clear the flag before updating hardware masks so that any IRQ
+	 * that fires during the mask-register writes sees the flag as false
+	 * and does not queue new work. Once the mask registers are written,
+	 * the ACP hardware will not assert any new SDW interrupt, so no
+	 * synchronize_irq() is required after this function returns.
+	 */
+	amd_manager->interrupt_enabled = false;
+
 	mutex_lock(amd_manager->acp_sdw_lock);
 	irq_mask = sdw_manager_reg_mask_array[amd_manager->instance];
 	amd_updatel(amd_manager->acp_mmio, ACP_EXTERNAL_INTR_CNTL(amd_manager->instance),
@@ -1143,7 +1153,7 @@ static void amd_sdw_irq_thread(struct work_struct *work)
 		/* Check for the updated status on peripheral device */
 		amd_sdw_update_slave_status(status_change_0to7, status_change_8to11, amd_manager);
 	}
-	if (status_change_8to11 || status_change_0to7)
+	if ((status_change_8to11 || status_change_0to7) && amd_manager->interrupt_enabled)
 		schedule_work(&amd_manager->amd_sdw_work);
 	writel(0x00, amd_manager->mmio + ACP_SW_STATE_CHANGE_STATUS_8TO11);
 	writel(0x00, amd_manager->mmio + ACP_SW_STATE_CHANGE_STATUS_0TO7);
diff --git a/include/linux/soundwire/sdw_amd.h b/include/linux/soundwire/sdw_amd.h
index 2d26f357d842..04b95379a724 100644
--- a/include/linux/soundwire/sdw_amd.h
+++ b/include/linux/soundwire/sdw_amd.h
@@ -85,6 +85,9 @@ struct sdw_amd_dai_runtime {
  * @ping_slave_stat: cached slave status from the last ping
  *		     transaction that returned a response;
  *		     initialised to U32_MAX ("no valid reading yet")
+ * @interrupt_enabled: set when hardware interrupts are enabled; cleared
+ *		     before disabling to prevent new work from being queued
+ *		     by an in-flight IRQ during teardown
  * @dai_runtime_array: dai runtime array
  */
 struct amd_sdw_manager {
@@ -117,6 +120,7 @@ struct amd_sdw_manager {
 	u32 ping_slave_stat;
 	bool clk_stopped;
 	bool pad_fully_torn_down;
+	bool interrupt_enabled;
 
 	struct sdw_amd_dai_runtime **dai_runtime_array;
 };
-- 
2.53.0

