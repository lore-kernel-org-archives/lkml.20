Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.195.58
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794068125;
	b=SQx3ZkUEoDT1wKAlibzzYexusBJVCo7G+tpYASIT6Hpy5qiNlGApBJJ3tPHQQlI+9HMp
	 ZpKoI8P4bTsPFcq/TD3IJXlEFOYGQIEud9Gzl0qVvN8Y7t8qWlHvzSK+2+DStInr4Ul1l
	 gYIuez0aXeNqpCay/UCyl7dmm7E3NhXAmdVnqSoolbCiRs20229o9rLUv20H5eeBUTik3
	 GmXxcW4Iz7Xy9xjCuMZhv4Zu/q3jLGrv0/pNOO9IE16X+NTgF6VvsH+SubG6q5gz2slAx
	 C0XViE3a+dl0XmRDk08DcF9E6ErvvZ8bWVg1t/CuYCVm3OhMuSr7cuM/OWVfheLp5vQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794068125;
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
	bh=dRv72TxWSJs20zXpuHDrcfEO7H+Fu3d2/yAZOmnDIM8=;
	b=Oh0y0hkAz/JjWNq0PrjpnYHRQEy0LXKWLjTAsOR8k4lN+F+WSDzE2bnc5DheFvwB6N0V
	 kks2il7hWQAqVZLJveBUe8O4GTNEmgZTvx0OeM4h85Wh4j3cP1/qVP8GN61vxyHRu902x
	 /P9YjEPMCfoO4LJ0xZx0ybQPFbpUY9OOpvTGNGaZD6uq2HeLbvU4S6eyVQLSvG9v2Busu
	 t1yxhrrPKlIi7AQmKvIQJMj3tce09W1a3tfalj1YAYlw7YvlSRbzAQHSa2YCHFuRk/eF5
	 O/3kZC2khi6aKTaH1iyM0vWyeUjGKN/XeMjEy3dkyGAfy5jUDYhAyFN7ElbH+lT9lZw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=l8gYYXrW;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.195.58
Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012058.outbound.protection.outlook.com [40.93.195.58])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4EB4606A337;
	Sat,  7 Nov 2026 16:15:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4EB4606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=l8gYYXrW
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eeaIe+lQU5ZCstJ7kHF2wL9gewAmiRBERQOx2RVkhHeZNgGObEv+9Z8Eukdeuqc3yNWhsdMaeTo20PqX6GtRjGnCjTcw9k/10x/Mibjv7gc5DnFJyqn2QtxxYxw8iunFZl/xd8W66o4UFGTA7y2znNp4jQc1jqkIGcBPFPBvDHHLfSTSFHn957bkherAoI8vZWf3AmzJNiG9WmioL4TQV1+5Y+mq/1UAGSOD04LYxMim+0z1Bvc2ha8g+IV09mxeEcvaMdIb0t2UjKyU/ari77u9gYf6zRu+ojR3BbkauvNrs1gzdR+6ffm6/5qaDr0vZZ4QfxfwyPFZB9hihe/Smw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dRv72TxWSJs20zXpuHDrcfEO7H+Fu3d2/yAZOmnDIM8=;
 b=wsz7aD/+ZHDtFLMVYpkWCBxsoolKEjA+QVZKt7JawiJPDjz5DuSx9yoOdOvL90aLasGJogH1b7brE7+xv8AT1kNuaLVSykiu6/kU99sQjUNGBmNCypIsUc1y0URopxMqQyd9WrxZ4CtS4KjiZtCoY7NYX8J6G6D0DChzDCbFCxJ1mF34gucOtyGveyhDA7XVScJAg6FhfGqKtg7yoTyWQ+4sEuXnGbVXZKVHF48WUmqYIEVATCL59njjChbnb3X5MD1Bb/zr2uIUkGgmX3hvMTdgcxhRj81xWAdFf8+Q69KJn9Czk84ogbwhMRojILovr3EnhpTAwUQZjeyIiw3kjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dRv72TxWSJs20zXpuHDrcfEO7H+Fu3d2/yAZOmnDIM8=;
 b=l8gYYXrWYimszVxDQkedUrnr8YeORD1rmX6nS3O4DNTkgnI30xWu3rqYhcRce5UdxNha8+WJvLkqS+PeHj2Rj3oXTWL2L9xxFmjVfLG6RHWl33hsTky7m7KIytgeVjqiwoKqeIq8JTzK03LoUtySeMYXZ0T4K/JxX9XeDSKtia0=
Received: from BN0PR04CA0083.namprd04.prod.outlook.com (2603:10b6:408:ea::28)
 by CH3PR12MB9314.namprd12.prod.outlook.com (2603:10b6:610:1c5::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Sat, 7 Nov
 2026 16:15:16 +0000
Received: from BN2PEPF00004FBC.namprd04.prod.outlook.com
 (2603:10b6:408:ea:cafe::74) by BN0PR04CA0083.outlook.office365.com
 (2603:10b6:408:ea::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.11 via Frontend Transport; Sat, 7
 Nov 2026 16:15:15 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF00004FBC.mail.protection.outlook.com (10.167.243.182) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Sat, 7 Nov 2026 16:15:15 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Sat, 7 Nov
 2026 10:15:05 -0600
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb08.amd.com (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53
 via Frontend Transport; Sat, 7 Nov 2026 10:15:02 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, <Richard.Gong@amd.com>, <Poojitha.N@amd.com>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>
Subject: [PATCH v3 04/11] soundwire: amd: rename hardware backend symbols to amd_acp63_*() prefix
Date: Sat, 7 Nov 2026 21:42:21 +0530
Message-ID: <20261107161345.3411491-5-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261107161345.3411491-1-Vijendar.Mukunda@amd.com>
References: <20261107161345.3411491-1-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBC:EE_|CH3PR12MB9314:EE_
X-MS-Office365-Filtering-Correlation-Id: ba11b4ab-6950-4ee2-a8a1-08df3cea4f34
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700016|82310400026|23010399003|18002099003|22082099003|6133799003|10067099003|3023799007|11063799006|56012099006|261026121527099003|261026140227099003|261028144727099003|261022113327099003|261021123027099003|261022075727099003|261021121427099003|261022105027099003|261009221727099003|261102123227099003|261009220027099003|261009223327099003|261009223027099003|261009221227099003;
X-Microsoft-Antispam-Message-Info:
	5dUoBbuv8XYPshpJPATtR02W/5v6W5El3jwt16gTcfn3h8KhTraUV8Qrk5QgXe7e0s5K+gA7il+n8nTkbUkN72THWO4d/xQqQUGiYK/gdKOI1e9q0erZUv2gJGPrhUXzLI4HE4vjvROjXrBmYWiSUCeb2lFEX32WXcA23QDVzm0mtp6y8oBYyMNL4+Me6MteUab6d2en9pHBDUoxckO2+GgXuxXAUKCJ7mALRvYLn27FbPD5obOAD6I9vt9ei/31ipT5TmT3LFzKgi5aq2O0sSWQNUQOivzNwZWIyl0RzGbwhBqkNDnKKsYJRanjU665nUde1QTAlNZeUB4CspLpaFoXtTR5w/g6WFnYF3ZwzFTAZkUA1gOMEet4zC36RcRIQs4OrCuhnsh6W8iKmkhrsEyfL08owDqhG47duBQeanZLqxdaR8Eyotk5/M+b8R5s2qP6jPMJgITGO9p4dt0bNHQWAgYeC548kb4HcYytPA53rwTRHeMd+qm7m1Kc8x8198dzGqMgp9ZJj3QuMduyp8dEs0g+BxP58j5yB+wp+Ae6RA84cQGfE1JbwlkQJ4N6wppQwif9se7aJADDxYFUFGW4DE7lE3+MGC8nrA2m5mfj+euhdyBHlSQN49P0IcB4MHGmukgEF1AnZ8rw0qJ6OJmULXoQxT4XaeLT0gdXbnm+ZxmgD/Dgkf2noQYnaMdE1zMmS8/A6sXg3uPag6O2+A==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700016)(82310400026)(23010399003)(18002099003)(22082099003)(6133799003)(10067099003)(3023799007)(11063799006)(56012099006)(261026121527099003)(261026140227099003)(261028144727099003)(261022113327099003)(261021123027099003)(261022075727099003)(261021121427099003)(261022105027099003)(261009221727099003)(261102123227099003)(261009220027099003)(261009223327099003)(261009223027099003)(261009221227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	U+ziGRAkt6sES79RvRHXZVByUQjHfABSa31UeMi9GlIDXx/g4+IqsUiyfCPSHGKxt4SwbFmJDyBERpfq8eWLWJoLJW9PeN5r1pjUM60SW5XQpD03e5RKACk9dMm40qNTWnsm4G864oACuQu5d4I/PBQe33YwlF4/9FXx/aa+JktU7EzvQ1YRsgeQW5ZT51XlkWdhwFteh6Eo++OieVP8ulrwjO/HiddIy83nKnxD2trcBFQhYo9R+DzyRYl9gzjiVstlG87Qj7d5OY7LLu8qASH2hcByRGYgsgovkhTB3VXTw0sBRn0uZHrUu1sb/IWQBedRQtiSUMDw6T/SRtkR/vB3b6fgcVjKQsSz2MTdSjBS2IzZuzwqGRRMq9rMSKw4I0SPTqR8+VwuO1O8A0mJUMsBtxC0Y+srMtyIW4+pLmOf8tzlfyTz0DBFR1nXqETl
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2026 16:15:15.8338
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ba11b4ab-6950-4ee2-a8a1-08df3cea4f34
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF00004FBC.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9314

In preparation for the hw_ops dispatch framework, rename the
revision-specific hardware-access functions, op-table instances and
the register-offset constant in amd_manager.c / amd_manager.h to the
amd_acp63_*() / ACP63_* prefix. The amd_acp63_ prefix denotes ACP6.3
as the base revision of this shared IP block, not ACP6.3-only support.

Generic SoundWire protocol helpers (amd_sdw_xfer_msg(), amd_prop_read(),
amd_sdw_clock_stop() and related bus helpers) and the top-level
work_struct handlers (amd_sdw_irq_thread(),
amd_sdw_update_slave_status_work()) intentionally keep the amd_sdw_*()
prefix; inline comments mark them as revision-independent. All other
amd_sdw_*() and amd_*() functions in the hardware path are renamed,
including amd_acp63_sdw_process_wake_event().

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 drivers/soundwire/amd_manager.c | 198 +++++++++++++++++---------------
 drivers/soundwire/amd_manager.h |   7 +-
 2 files changed, 112 insertions(+), 93 deletions(-)

diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
index dd39968a7770..52801059b87a 100644
--- a/drivers/soundwire/amd_manager.c
+++ b/drivers/soundwire/amd_manager.c
@@ -27,7 +27,7 @@
 
 #define to_amd_sdw(b)	container_of(b, struct amd_sdw_manager, bus)
 
-static int amd_sdw_clk_init_ctrl(struct amd_sdw_manager *amd_manager)
+static int amd_acp63_sdw_clk_init_ctrl(struct amd_sdw_manager *amd_manager)
 {
 	struct sdw_bus *bus = &amd_manager->bus;
 	struct sdw_master_prop *prop = &bus->prop;
@@ -57,7 +57,7 @@ static int amd_sdw_clk_init_ctrl(struct amd_sdw_manager *amd_manager)
 	return 0;
 }
 
-static int amd_init_sdw_manager(struct amd_sdw_manager *amd_manager)
+static int amd_acp63_init_sdw_manager(struct amd_sdw_manager *amd_manager)
 {
 	u32 val;
 	int ret;
@@ -89,7 +89,7 @@ static int amd_init_sdw_manager(struct amd_sdw_manager *amd_manager)
 				  AMD_SDW_TIMEOUT);
 }
 
-static int amd_enable_sdw_manager(struct amd_sdw_manager *amd_manager)
+static int amd_acp63_enable_sdw_manager(struct amd_sdw_manager *amd_manager)
 {
 	u32 val;
 
@@ -98,7 +98,7 @@ static int amd_enable_sdw_manager(struct amd_sdw_manager *amd_manager)
 				  AMD_SDW_TIMEOUT);
 }
 
-static int amd_disable_sdw_manager(struct amd_sdw_manager *amd_manager)
+static int amd_acp63_disable_sdw_manager(struct amd_sdw_manager *amd_manager)
 {
 	u32 val;
 
@@ -115,7 +115,7 @@ static int amd_disable_sdw_manager(struct amd_sdw_manager *amd_manager)
 				  AMD_SDW_TIMEOUT);
 }
 
-static void amd_enable_sdw_interrupts(struct amd_sdw_manager *amd_manager)
+static void amd_acp63_enable_sdw_interrupts(struct amd_sdw_manager *amd_manager)
 {
 	u32 val;
 
@@ -132,7 +132,7 @@ static void amd_enable_sdw_interrupts(struct amd_sdw_manager *amd_manager)
 	amd_manager->interrupt_enabled = true;
 }
 
-static void amd_disable_sdw_interrupts(struct amd_sdw_manager *amd_manager)
+static void amd_acp63_disable_sdw_interrupts(struct amd_sdw_manager *amd_manager)
 {
 	u32 irq_mask;
 
@@ -156,14 +156,14 @@ static void amd_disable_sdw_interrupts(struct amd_sdw_manager *amd_manager)
 	writel(0x00, amd_manager->mmio + ACP_SW_ERROR_INTR_MASK);
 }
 
-static void __amd_sdw_oe_update(struct amd_sdw_manager *amd_manager,
-				u32 mask, bool enable)
+static void __amd_acp63_sdw_oe_update(struct amd_sdw_manager *amd_manager,
+				      u32 mask, bool enable)
 {
 	amd_updatel(amd_manager->acp_mmio, ACP_PAD_DISABLE_OE_CTRL,
 		    mask, enable ? 0 : mask);
 }
 
-static bool amd_sdw_pad_ctrl_supported(struct amd_sdw_manager *amd_manager)
+static bool amd_acp63_sdw_pad_ctrl_supported(struct amd_sdw_manager *amd_manager)
 {
 	switch (amd_manager->acp_rev) {
 	case ACP70_PCI_REV_ID:
@@ -179,11 +179,11 @@ static bool amd_sdw_pad_ctrl_supported(struct amd_sdw_manager *amd_manager)
 	}
 }
 
-static void amd_sdw_oe_ctrl(struct amd_sdw_manager *amd_manager, bool enable)
+static void amd_acp63_sdw_oe_ctrl(struct amd_sdw_manager *amd_manager, bool enable)
 {
 	u32 mask;
 
-	if (!amd_sdw_pad_ctrl_supported(amd_manager))
+	if (!amd_acp63_sdw_pad_ctrl_supported(amd_manager))
 		return;
 
 	switch (amd_manager->instance) {
@@ -200,29 +200,29 @@ static void amd_sdw_oe_ctrl(struct amd_sdw_manager *amd_manager, bool enable)
 	}
 
 	mutex_lock(amd_manager->acp_sdw_lock);
-	__amd_sdw_oe_update(amd_manager, mask, enable);
+	__amd_acp63_sdw_oe_update(amd_manager, mask, enable);
 	mutex_unlock(amd_manager->acp_sdw_lock);
 }
 
-static void amd_sdw_pad_ctrl(struct amd_sdw_manager *amd_manager, bool enable)
+static void amd_acp63_sdw_pad_ctrl(struct amd_sdw_manager *amd_manager, bool enable)
 {
 	u32 keeper_mask, pulldown_mask, schmen_mask, oe_mask;
 
-	if (!amd_sdw_pad_ctrl_supported(amd_manager))
+	if (!amd_acp63_sdw_pad_ctrl_supported(amd_manager))
 		return;
 
 	switch (amd_manager->instance) {
 	case ACP_SDW0:
-		keeper_mask   = AMD_SDW0_PAD_KEEPER_EN_MASK;
+		keeper_mask = AMD_SDW0_PAD_KEEPER_EN_MASK;
 		pulldown_mask = AMD_SDW0_PAD_PULLDOWN_MASK;
-		schmen_mask   = AMD_SDW0_PAD_SCHMEN_MASK;
-		oe_mask       = AMD_SDW0_PAD_OE_CTRL_MASK;
+		schmen_mask = AMD_SDW0_PAD_SCHMEN_MASK;
+		oe_mask = AMD_SDW0_PAD_OE_CTRL_MASK;
 		break;
 	case ACP_SDW1:
-		keeper_mask   = AMD_SDW1_PAD_KEEPER_EN_MASK;
+		keeper_mask = AMD_SDW1_PAD_KEEPER_EN_MASK;
 		pulldown_mask = AMD_SDW1_PAD_PULLDOWN_MASK;
-		schmen_mask   = AMD_SDW1_PAD_SCHMEN_MASK;
-		oe_mask       = AMD_SDW1_PAD_OE_CTRL_MASK;
+		schmen_mask = AMD_SDW1_PAD_SCHMEN_MASK;
+		oe_mask = AMD_SDW1_PAD_OE_CTRL_MASK;
 		break;
 	default:
 		dev_err(amd_manager->dev, "invalid SDW instance %d\n",
@@ -250,11 +250,11 @@ static void amd_sdw_pad_ctrl(struct amd_sdw_manager *amd_manager, bool enable)
 	}
 
 	/* enable OE on D0 (clear disable bits), disable OE on D3 (set them) */
-	__amd_sdw_oe_update(amd_manager, oe_mask, enable);
+	__amd_acp63_sdw_oe_update(amd_manager, oe_mask, enable);
 	mutex_unlock(amd_manager->acp_sdw_lock);
 }
 
-static void amd_sdw_set_frameshape(struct amd_sdw_manager *amd_manager)
+static void amd_acp63_sdw_set_frameshape(struct amd_sdw_manager *amd_manager)
 {
 	u32 frame_size;
 
@@ -262,7 +262,7 @@ static void amd_sdw_set_frameshape(struct amd_sdw_manager *amd_manager)
 	writel(frame_size, amd_manager->mmio + ACP_SW_FRAMESIZE);
 }
 
-static void amd_sdw_wake_enable(struct amd_sdw_manager *amd_manager, bool enable)
+static void amd_acp63_sdw_wake_enable(struct amd_sdw_manager *amd_manager, bool enable)
 {
 	u32 wake_ctrl;
 
@@ -275,7 +275,8 @@ static void amd_sdw_wake_enable(struct amd_sdw_manager *amd_manager, bool enable
 	writel(wake_ctrl, amd_manager->mmio + ACP_SW_STATE_CHANGE_STATUS_MASK_8TO11);
 }
 
-static int amd_sdw_set_device_state(struct amd_sdw_manager *amd_manager, u32 target_device_state)
+static int amd_acp63_sdw_set_device_state(struct amd_sdw_manager *amd_manager,
+					  u32 target_device_state)
 {
 	u32 sdw_dev_state;
 
@@ -301,7 +302,7 @@ static int amd_sdw_set_device_state(struct amd_sdw_manager *amd_manager, u32 tar
 	return 0;
 }
 
-static int amd_sdw_host_wake_enable(struct amd_sdw_manager *amd_manager, bool enable)
+static int amd_acp63_sdw_host_wake_enable(struct amd_sdw_manager *amd_manager, bool enable)
 {
 	u32 intr_cntl1;
 	u32 sdw_host_wake_irq_mask;
@@ -357,8 +358,8 @@ static void amd_sdw_ctl_word_prep(u32 *lower_word, u32 *upper_word, struct sdw_m
 	*lower_word = lower_data;
 }
 
-static int amd_sdw_send_cmd_get_resp(struct amd_sdw_manager *amd_manager, u32 lower_data,
-				     u32 upper_data, u64 *response)
+static int amd_acp63_sdw_send_cmd_get_resp(struct amd_sdw_manager *amd_manager, u32 lower_data,
+					   u32 upper_data, u64 *response)
 {
 	u32 lower_resp, upper_resp;
 	u32 sts;
@@ -421,7 +422,8 @@ amd_program_scp_addr(struct amd_sdw_manager *amd_manager, struct sdw_msg *msg)
 	scp_msg.buf = &msg->addr_page1;
 	scp_msg.flags = SDW_MSG_FLAG_WRITE;
 	amd_sdw_ctl_word_prep(&lower_data, &upper_data, &scp_msg, 0);
-	if (amd_sdw_send_cmd_get_resp(amd_manager, lower_data, upper_data, &response_buf[0])) {
+	if (amd_acp63_sdw_send_cmd_get_resp(amd_manager, lower_data, upper_data,
+					    &response_buf[0])) {
 		dev_err_ratelimited(amd_manager->dev,
 				    "SCP_addrpage command timeout for Slave %d\n", msg->dev_num);
 		return SDW_CMD_TIMEOUT;
@@ -429,7 +431,8 @@ amd_program_scp_addr(struct amd_sdw_manager *amd_manager, struct sdw_msg *msg)
 	scp_msg.addr = SDW_SCP_ADDRPAGE2;
 	scp_msg.buf = &msg->addr_page2;
 	amd_sdw_ctl_word_prep(&lower_data, &upper_data, &scp_msg, 0);
-	if (amd_sdw_send_cmd_get_resp(amd_manager, lower_data, upper_data, &response_buf[1])) {
+	if (amd_acp63_sdw_send_cmd_get_resp(amd_manager, lower_data, upper_data,
+					    &response_buf[1])) {
 		dev_err_ratelimited(amd_manager->dev,
 				    "SCP_addrpage command timeout for Slave %d\n", msg->dev_num);
 		return SDW_CMD_TIMEOUT;
@@ -494,6 +497,7 @@ static enum sdw_command_response amd_sdw_fill_msg_resp(struct amd_sdw_manager *a
 	return SDW_CMD_OK;
 }
 
+/* AMD SoundWire bus helper shared across all ACP revisions. */
 static unsigned int _amd_sdw_xfer_msg(struct amd_sdw_manager *amd_manager, struct sdw_msg *msg,
 				      int cmd_offset)
 {
@@ -501,7 +505,7 @@ static unsigned int _amd_sdw_xfer_msg(struct amd_sdw_manager *amd_manager, struc
 	u32 upper_data = 0, lower_data = 0;
 
 	amd_sdw_ctl_word_prep(&lower_data, &upper_data, msg, cmd_offset);
-	if (amd_sdw_send_cmd_get_resp(amd_manager, lower_data, upper_data, &response)) {
+	if (amd_acp63_sdw_send_cmd_get_resp(amd_manager, lower_data, upper_data, &response)) {
 		dev_err_ratelimited(amd_manager->dev, "command timeout for Slave %d\n",
 				    msg->dev_num);
 		return SDW_CMD_TIMEOUT;
@@ -509,6 +513,7 @@ static unsigned int _amd_sdw_xfer_msg(struct amd_sdw_manager *amd_manager, struc
 	return amd_sdw_fill_msg_resp(amd_manager, msg, response, cmd_offset);
 }
 
+/* AMD SoundWire bus helper shared across all ACP revisions. */
 static enum sdw_command_response amd_sdw_xfer_msg(struct sdw_bus *bus, struct sdw_msg *msg)
 {
 	struct amd_sdw_manager *amd_manager = to_amd_sdw(bus);
@@ -525,6 +530,7 @@ static enum sdw_command_response amd_sdw_xfer_msg(struct sdw_bus *bus, struct sd
 	return SDW_CMD_OK;
 }
 
+/* AMD SoundWire bus helper shared across all ACP revisions. */
 static void amd_sdw_fill_slave_status(struct amd_sdw_manager *amd_manager, u16 index, u32 status)
 {
 	switch (status) {
@@ -539,6 +545,7 @@ static void amd_sdw_fill_slave_status(struct amd_sdw_manager *amd_manager, u16 i
 	}
 }
 
+/* AMD SoundWire bus helper shared across all ACP revisions. */
 static void amd_sdw_process_ping_status(u64 response, struct amd_sdw_manager *amd_manager)
 {
 	u64 slave_stat;
@@ -556,12 +563,12 @@ static void amd_sdw_process_ping_status(u64 response, struct amd_sdw_manager *am
 	}
 }
 
-static void amd_sdw_read_and_process_ping_status(struct amd_sdw_manager *amd_manager)
+static void amd_acp63_sdw_read_and_process_ping_status(struct amd_sdw_manager *amd_manager)
 {
 	u64 response;
 
 	mutex_lock(&amd_manager->bus.msg_lock);
-	if (amd_sdw_send_cmd_get_resp(amd_manager, 0, 0, &response)) {
+	if (amd_acp63_sdw_send_cmd_get_resp(amd_manager, 0, 0, &response)) {
 		mutex_unlock(&amd_manager->bus.msg_lock);
 		dev_err_ratelimited(amd_manager->dev, "SDW%x ping status timeout\n",
 				    amd_manager->instance);
@@ -574,14 +581,14 @@ static void amd_sdw_read_and_process_ping_status(struct amd_sdw_manager *amd_man
 	amd_sdw_process_ping_status(response, amd_manager);
 }
 
-static u32 amd_sdw_read_ping_status(struct sdw_bus *bus)
+static u32 amd_acp63_sdw_read_ping_status(struct sdw_bus *bus)
 {
 	struct amd_sdw_manager *amd_manager = to_amd_sdw(bus);
 	u64 response;
 	u32 slave_stat;
 
 	lockdep_assert_held(&bus->msg_lock);
-	if (amd_sdw_send_cmd_get_resp(amd_manager, 0, 0, &response)) {
+	if (amd_acp63_sdw_send_cmd_get_resp(amd_manager, 0, 0, &response)) {
 		dev_err_ratelimited(amd_manager->dev, "SDW%x ping status timeout\n",
 				    amd_manager->instance);
 		return amd_manager->ping_slave_stat == U32_MAX ? 0 : amd_manager->ping_slave_stat;
@@ -594,7 +601,7 @@ static u32 amd_sdw_read_ping_status(struct sdw_bus *bus)
 	return slave_stat;
 }
 
-static int amd_sdw_compute_params(struct sdw_bus *bus, struct sdw_stream_runtime *stream)
+static int amd_acp63_sdw_compute_params(struct sdw_bus *bus, struct sdw_stream_runtime *stream)
 {
 	struct amd_sdw_manager *amd_manager = to_amd_sdw(bus);
 	struct sdw_transport_data t_data = {0};
@@ -680,8 +687,8 @@ static int amd_sdw_compute_params(struct sdw_bus *bus, struct sdw_stream_runtime
 	return 0;
 }
 
-static int amd_sdw_port_params(struct sdw_bus *bus, struct sdw_port_params *p_params,
-			       unsigned int bank)
+static int amd_acp63_sdw_port_params(struct sdw_bus *bus, struct sdw_port_params *p_params,
+				     unsigned int bank)
 {
 	struct amd_sdw_manager *amd_manager = to_amd_sdw(bus);
 	u32 frame_fmt_reg, dpn_frame_fmt;
@@ -717,9 +724,9 @@ static int amd_sdw_port_params(struct sdw_bus *bus, struct sdw_port_params *p_pa
 	return 0;
 }
 
-static int amd_sdw_transport_params(struct sdw_bus *bus,
-				    struct sdw_transport_params *params,
-				    enum sdw_reg_bank bank)
+static int amd_acp63_sdw_transport_params(struct sdw_bus *bus,
+					  struct sdw_transport_params *params,
+					  enum sdw_reg_bank bank)
 {
 	struct amd_sdw_manager *amd_manager = to_amd_sdw(bus);
 	u32 dpn_frame_fmt;
@@ -794,9 +801,9 @@ static int amd_sdw_transport_params(struct sdw_bus *bus,
 	return 0;
 }
 
-static int amd_sdw_port_enable(struct sdw_bus *bus,
-			       struct sdw_enable_ch *enable_ch,
-			       unsigned int bank)
+static int amd_acp63_sdw_port_enable(struct sdw_bus *bus,
+				     struct sdw_enable_ch *enable_ch,
+				     unsigned int bank)
 {
 	struct amd_sdw_manager *amd_manager = to_amd_sdw(bus);
 	u32 dpn_ch_enable;
@@ -873,6 +880,7 @@ static int sdw_master_read_amd_prop(struct sdw_bus *bus)
 	return 0;
 }
 
+/* AMD SoundWire bus helper shared across all ACP revisions. */
 static int amd_prop_read(struct sdw_bus *bus)
 {
 	sdw_master_read_prop(bus);
@@ -880,16 +888,16 @@ static int amd_prop_read(struct sdw_bus *bus)
 	return 0;
 }
 
-static const struct sdw_master_port_ops amd_sdw_port_ops = {
-	.dpn_set_port_params = amd_sdw_port_params,
-	.dpn_set_port_transport_params = amd_sdw_transport_params,
-	.dpn_port_enable_ch = amd_sdw_port_enable,
+static const struct sdw_master_port_ops amd_acp63_sdw_port_ops = {
+	.dpn_set_port_params = amd_acp63_sdw_port_params,
+	.dpn_set_port_transport_params = amd_acp63_sdw_transport_params,
+	.dpn_port_enable_ch = amd_acp63_sdw_port_enable,
 };
 
-static const struct sdw_master_ops amd_sdw_ops = {
+static const struct sdw_master_ops amd_acp63_sdw_ops = {
 	.read_prop = amd_prop_read,
 	.xfer_msg = amd_sdw_xfer_msg,
-	.read_ping_status = amd_sdw_read_ping_status,
+	.read_ping_status = amd_acp63_sdw_read_ping_status,
 };
 
 static int amd_sdw_hw_params(struct snd_pcm_substream *substream,
@@ -1085,7 +1093,7 @@ static void amd_sdw_update_slave_status_work(struct work_struct *work)
 			       ACP_SW_STATE_CHANGE_STATUS_MASK_0TO7);
 			writel(AMD_SDW_IRQ_MASK_8TO11, amd_manager->mmio +
 			       ACP_SW_STATE_CHANGE_STATUS_MASK_8TO11);
-			amd_sdw_read_and_process_ping_status(amd_manager);
+			amd_acp63_sdw_read_and_process_ping_status(amd_manager);
 			goto update_status;
 		} else {
 			dev_err_ratelimited(amd_manager->dev,
@@ -1119,7 +1127,7 @@ static void amd_sdw_update_slave_status(u32 status_change_0to7, u32 status_chang
 	}
 }
 
-static void amd_sdw_process_wake_event(struct amd_sdw_manager *amd_manager)
+static void amd_acp63_sdw_process_wake_event(struct amd_sdw_manager *amd_manager)
 {
 	dev_dbg(amd_manager->dev, "SoundWire Wake event reported\n");
 	pm_request_resume(amd_manager->dev);
@@ -1142,12 +1150,12 @@ static void amd_sdw_irq_thread(struct work_struct *work)
 		amd_manager->instance, status_change_0to7, status_change_8to11);
 
 	if (status_change_8to11 & AMD_SDW_WAKE_STAT_MASK) {
-		amd_sdw_process_wake_event(amd_manager);
+		amd_acp63_sdw_process_wake_event(amd_manager);
 		status_change_8to11 &= ~AMD_SDW_WAKE_STAT_MASK;
 	}
 
 	if (status_change_8to11 & AMD_SDW_PREQ_INTR_STAT) {
-		amd_sdw_read_and_process_ping_status(amd_manager);
+		amd_acp63_sdw_read_and_process_ping_status(amd_manager);
 	} else {
 		/* Check for the updated status on peripheral device */
 		amd_sdw_update_slave_status(status_change_0to7, status_change_8to11, amd_manager);
@@ -1165,17 +1173,17 @@ int amd_sdw_manager_start(struct amd_sdw_manager *amd_manager)
 
 	prop = &amd_manager->bus.prop;
 	if (!prop->hw_disabled) {
-		ret = amd_sdw_clk_init_ctrl(amd_manager);
+		ret = amd_acp63_sdw_clk_init_ctrl(amd_manager);
 		if (ret)
 			return ret;
-		ret = amd_init_sdw_manager(amd_manager);
+		ret = amd_acp63_init_sdw_manager(amd_manager);
 		if (ret)
 			return ret;
-		amd_enable_sdw_interrupts(amd_manager);
-		ret = amd_enable_sdw_manager(amd_manager);
+		amd_acp63_enable_sdw_interrupts(amd_manager);
+		ret = amd_acp63_enable_sdw_manager(amd_manager);
 		if (ret)
 			return ret;
-		amd_sdw_set_frameshape(amd_manager);
+		amd_acp63_sdw_set_frameshape(amd_manager);
 	}
 	/* Enable runtime PM */
 	pm_runtime_set_autosuspend_delay(amd_manager->dev, AMD_SDW_MASTER_SUSPEND_DELAY_MS);
@@ -1211,15 +1219,15 @@ static int amd_sdw_manager_probe(struct platform_device *pdev)
 	amd_manager->ping_slave_stat = U32_MAX;
 	amd_manager->instance = pdata->instance;
 	amd_manager->mmio = amd_manager->acp_mmio +
-			    (amd_manager->instance * SDW_MANAGER_REG_OFFSET);
+			    (amd_manager->instance * ACP63_SDW_MANAGER_REG_OFFSET);
 	amd_manager->acp_sdw_lock = pdata->acp_sdw_lock;
 	amd_manager->acp_rev = pdata->acp_rev;
 	amd_manager->cols_index = sdw_find_col_index(AMD_SDW_DEFAULT_COLUMNS);
 	amd_manager->rows_index = sdw_find_row_index(AMD_SDW_DEFAULT_ROWS);
 	amd_manager->dev = dev;
-	amd_manager->bus.ops = &amd_sdw_ops;
-	amd_manager->bus.port_ops = &amd_sdw_port_ops;
-	amd_manager->bus.compute_params = &amd_sdw_compute_params;
+	amd_manager->bus.ops = &amd_acp63_sdw_ops;
+	amd_manager->bus.port_ops = &amd_acp63_sdw_port_ops;
+	amd_manager->bus.compute_params = &amd_acp63_sdw_compute_params;
 	amd_manager->bus.clk_stop_timeout = 200;
 	amd_manager->bus.link_id = amd_manager->instance;
 
@@ -1288,15 +1296,21 @@ static void amd_sdw_manager_remove(struct platform_device *pdev)
 
 	if (pm_runtime_enabled(&pdev->dev))
 		pm_runtime_disable(&pdev->dev);
-	amd_disable_sdw_interrupts(amd_manager);
+	amd_acp63_disable_sdw_interrupts(amd_manager);
 	cancel_work_sync(&amd_manager->amd_sdw_irq_thread);
 	cancel_work_sync(&amd_manager->amd_sdw_work);
 	sdw_bus_master_delete(&amd_manager->bus);
-	ret = amd_disable_sdw_manager(amd_manager);
+	ret = amd_acp63_disable_sdw_manager(amd_manager);
 	if (ret)
 		dev_err(&pdev->dev, "Failed to disable device (%pe)\n", ERR_PTR(ret));
 }
 
+/*
+ * AMD SoundWire clock-stop sequence shared across all ACP revisions.
+ * Differences between revisions in this path are minimal; a switch/case
+ * on acp_rev is sufficient to accommodate any variant-specific additions
+ * needed for future platforms.
+ */
 static int amd_sdw_clock_stop(struct amd_sdw_manager *amd_manager)
 {
 	u32 val;
@@ -1328,7 +1342,7 @@ static int amd_sdw_clock_stop(struct amd_sdw_manager *amd_manager)
 	return 0;
 }
 
-static int amd_sdw_clock_stop_exit(struct amd_sdw_manager *amd_manager)
+static int amd_acp63_sdw_clock_stop_exit(struct amd_sdw_manager *amd_manager)
 {
 	int ret;
 	u32 val;
@@ -1421,7 +1435,7 @@ static int __maybe_unused amd_sdw_host_wake_enable_by_rev(struct amd_sdw_manager
 	case ACP70_PCI_REV_ID:
 	case ACP71_PCI_REV_ID:
 	case ACP72_PCI_REV_ID:
-		return amd_sdw_host_wake_enable(amd_manager, enable);
+		return amd_acp63_sdw_host_wake_enable(amd_manager, enable);
 	default:
 		dev_err(amd_manager->dev, "unexpected acp_rev 0x%x\n", amd_manager->acp_rev);
 		return -EINVAL;
@@ -1442,7 +1456,7 @@ static int __maybe_unused amd_suspend(struct device *dev)
 	}
 
 	if (amd_manager->power_mode_mask & AMD_SDW_CLK_STOP_MODE) {
-		amd_disable_sdw_interrupts(amd_manager);
+		amd_acp63_disable_sdw_interrupts(amd_manager);
 		cancel_work_sync(&amd_manager->amd_sdw_irq_thread);
 		cancel_work_sync(&amd_manager->amd_sdw_work);
 		ret = amd_sdw_host_wake_enable_by_rev(amd_manager, false);
@@ -1451,13 +1465,13 @@ static int __maybe_unused amd_suspend(struct device *dev)
 		ret = amd_sdw_clock_stop(amd_manager);
 		if (ret)
 			return ret;
-		amd_enable_sdw_interrupts(amd_manager);
-		amd_sdw_wake_enable(amd_manager, false);
+		amd_acp63_enable_sdw_interrupts(amd_manager);
+		amd_acp63_sdw_wake_enable(amd_manager, false);
 	} else if (amd_manager->power_mode_mask & AMD_SDW_POWER_OFF_MODE) {
-		amd_disable_sdw_interrupts(amd_manager);
+		amd_acp63_disable_sdw_interrupts(amd_manager);
 		cancel_work_sync(&amd_manager->amd_sdw_irq_thread);
 		cancel_work_sync(&amd_manager->amd_sdw_work);
-		amd_sdw_wake_enable(amd_manager, false);
+		amd_acp63_sdw_wake_enable(amd_manager, false);
 		ret = amd_sdw_host_wake_enable_by_rev(amd_manager, false);
 		if (ret)
 			return ret;
@@ -1468,12 +1482,12 @@ static int __maybe_unused amd_suspend(struct device *dev)
 		ret = amd_sdw_clock_stop(amd_manager);
 		if (ret)
 			return ret;
-		ret = amd_disable_sdw_manager(amd_manager);
+		ret = amd_acp63_disable_sdw_manager(amd_manager);
 		if (ret)
 			return ret;
 		/* System suspend: tear down all pads */
-		if (amd_sdw_pad_ctrl_supported(amd_manager)) {
-			amd_sdw_pad_ctrl(amd_manager, false);
+		if (amd_acp63_sdw_pad_ctrl_supported(amd_manager)) {
+			amd_acp63_sdw_pad_ctrl(amd_manager, false);
 			amd_manager->pad_fully_torn_down = true;
 		}
 	}
@@ -1483,7 +1497,7 @@ static int __maybe_unused amd_suspend(struct device *dev)
 	case ACP70_PCI_REV_ID:
 	case ACP71_PCI_REV_ID:
 	case ACP72_PCI_REV_ID:
-		ret = amd_sdw_set_device_state(amd_manager, AMD_SDW_DEVICE_STATE_D3);
+		ret = amd_acp63_sdw_set_device_state(amd_manager, AMD_SDW_DEVICE_STATE_D3);
 		if (ret)
 			return ret;
 		break;
@@ -1507,7 +1521,7 @@ static int __maybe_unused amd_suspend_runtime(struct device *dev)
 		return 0;
 	}
 	if (amd_manager->power_mode_mask & AMD_SDW_CLK_STOP_MODE) {
-		amd_disable_sdw_interrupts(amd_manager);
+		amd_acp63_disable_sdw_interrupts(amd_manager);
 		cancel_work_sync(&amd_manager->amd_sdw_irq_thread);
 		cancel_work_sync(&amd_manager->amd_sdw_work);
 		ret = amd_sdw_host_wake_enable_by_rev(amd_manager, true);
@@ -1516,19 +1530,19 @@ static int __maybe_unused amd_suspend_runtime(struct device *dev)
 		ret = amd_sdw_clock_stop(amd_manager);
 		if (ret)
 			return ret;
-		amd_enable_sdw_interrupts(amd_manager);
-		amd_sdw_wake_enable(amd_manager, true);
+		amd_acp63_enable_sdw_interrupts(amd_manager);
+		amd_acp63_sdw_wake_enable(amd_manager, true);
 	} else if (amd_manager->power_mode_mask & AMD_SDW_POWER_OFF_MODE) {
-		amd_disable_sdw_interrupts(amd_manager);
+		amd_acp63_disable_sdw_interrupts(amd_manager);
 		cancel_work_sync(&amd_manager->amd_sdw_irq_thread);
 		cancel_work_sync(&amd_manager->amd_sdw_work);
 		ret = amd_sdw_clock_stop(amd_manager);
 		if (ret)
 			return ret;
-		ret = amd_disable_sdw_manager(amd_manager);
+		ret = amd_acp63_disable_sdw_manager(amd_manager);
 		if (ret)
 			return ret;
-		amd_sdw_wake_enable(amd_manager, true);
+		amd_acp63_sdw_wake_enable(amd_manager, true);
 		ret = amd_sdw_host_wake_enable_by_rev(amd_manager, true);
 		if (ret)
 			return ret;
@@ -1545,7 +1559,7 @@ static int __maybe_unused amd_suspend_runtime(struct device *dev)
 		 * wake events if wake is armed.
 		 * For ACP 6.3 this call is a no-op.
 		 */
-		amd_sdw_oe_ctrl(amd_manager, false);
+		amd_acp63_sdw_oe_ctrl(amd_manager, false);
 	}
 	switch (amd_manager->acp_rev) {
 	case ACP63_PCI_REV_ID:
@@ -1553,7 +1567,7 @@ static int __maybe_unused amd_suspend_runtime(struct device *dev)
 	case ACP70_PCI_REV_ID:
 	case ACP71_PCI_REV_ID:
 	case ACP72_PCI_REV_ID:
-		ret = amd_sdw_set_device_state(amd_manager, AMD_SDW_DEVICE_STATE_D3);
+		ret = amd_acp63_sdw_set_device_state(amd_manager, AMD_SDW_DEVICE_STATE_D3);
 		if (ret)
 			return ret;
 		if (amd_manager->wake_en_mask) {
@@ -1586,7 +1600,7 @@ static int __maybe_unused amd_resume_runtime(struct device *dev)
 	}
 
 	if (amd_manager->power_mode_mask & AMD_SDW_CLK_STOP_MODE) {
-		ret = amd_sdw_clock_stop_exit(amd_manager);
+		ret = amd_acp63_sdw_clock_stop_exit(amd_manager);
 		if (ret)
 			return ret;
 		ret = amd_sdw_host_wake_enable_by_rev(amd_manager, false);
@@ -1594,10 +1608,10 @@ static int __maybe_unused amd_resume_runtime(struct device *dev)
 			return ret;
 	} else if (amd_manager->power_mode_mask & AMD_SDW_POWER_OFF_MODE) {
 		if (amd_manager->pad_fully_torn_down) {
-			amd_sdw_pad_ctrl(amd_manager, true);
+			amd_acp63_sdw_pad_ctrl(amd_manager, true);
 			amd_manager->pad_fully_torn_down = false;
 		} else {
-			amd_sdw_oe_ctrl(amd_manager, true);
+			amd_acp63_sdw_oe_ctrl(amd_manager, true);
 		}
 		writel(0x00, amd_manager->acp_mmio + ACP_SW_WAKE_EN(amd_manager->instance));
 		/*
@@ -1627,17 +1641,17 @@ static int __maybe_unused amd_resume_runtime(struct device *dev)
 			}
 		}
 		sdw_clear_slave_status(bus, SDW_UNATTACH_REQUEST_MASTER_RESET);
-		ret = amd_sdw_clk_init_ctrl(amd_manager);
+		ret = amd_acp63_sdw_clk_init_ctrl(amd_manager);
 		if (ret)
 			return ret;
-		ret = amd_init_sdw_manager(amd_manager);
+		ret = amd_acp63_init_sdw_manager(amd_manager);
 		if (ret)
 			return ret;
-		amd_enable_sdw_interrupts(amd_manager);
-		ret = amd_enable_sdw_manager(amd_manager);
+		amd_acp63_enable_sdw_interrupts(amd_manager);
+		ret = amd_acp63_enable_sdw_manager(amd_manager);
 		if (ret)
 			return ret;
-		amd_sdw_set_frameshape(amd_manager);
+		amd_acp63_sdw_set_frameshape(amd_manager);
 	}
 	switch (amd_manager->acp_rev) {
 	case ACP63_PCI_REV_ID:
@@ -1645,7 +1659,7 @@ static int __maybe_unused amd_resume_runtime(struct device *dev)
 	case ACP70_PCI_REV_ID:
 	case ACP71_PCI_REV_ID:
 	case ACP72_PCI_REV_ID:
-		ret = amd_sdw_set_device_state(amd_manager, AMD_SDW_DEVICE_STATE_D0);
+		ret = amd_acp63_sdw_set_device_state(amd_manager, AMD_SDW_DEVICE_STATE_D0);
 		if (ret)
 			return ret;
 		break;
diff --git a/drivers/soundwire/amd_manager.h b/drivers/soundwire/amd_manager.h
index ff49e5d08f68..03d3fc2a9072 100644
--- a/drivers/soundwire/amd_manager.h
+++ b/drivers/soundwire/amd_manager.h
@@ -8,7 +8,12 @@
 
 #include <linux/soundwire/sdw_amd.h>
 
-#define SDW_MANAGER_REG_OFFSET				0xc00
+/*
+ * Register offset between successive SoundWire manager instances.
+ * This value applies to ACP6.3, ACP7.0, ACP7.1, and ACP7.2. A new
+ * revision with a different offset must define its own constant.
+ */
+#define ACP63_SDW_MANAGER_REG_OFFSET				0xc00
 #define AMD_SDW_DEFAULT_ROWS				50
 #define AMD_SDW_DEFAULT_COLUMNS				10
 #define ACP_SW0_WAKE_EN					0x0001458
-- 
2.53.0

