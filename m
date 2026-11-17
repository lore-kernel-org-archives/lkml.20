Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.43.63
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794900073;
	b=tSNYwRpm3+h4QTiyJNiYs5/700S9dtNSjbBh5dcKb+DyhG+fAmACCcGg4E40z0bdrXzZ
	 sF6jbf+dxZSKHDiDiH8lduZzClMsrVaEXrojNvMjxxKJh2GIpdu91eZLBazXOA2O5HbDj
	 fy5XyfP/3GHrILpQmKXad8lQurO6ExUriSCbUbw+yRatn2tSy8+W8ykngr1kdZTvxCQHi
	 cO6sYHQzfG981yji+TPgaM1+X2w2fxeFY2NLVCdoDZbnyZMW9zAtzzEf8JT/LIWITi3FI
	 q27OR9IgUCTxxR1it98Jx9jVhDpYi++oopEz3ELig//FTe+tx0rNZ8WGqIe1RIMM9Kw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794900073;
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
	bh=7WEGbjLom9SbeV1qFwE3cpJ8k2pI3nuX/L6m/wYnGSg=;
	b=Hg/ti3uh97tge8pzianCb7eFLwmZ0iVWwij10BcIZXn2DaJW8bC9iDn5048/AV77Tsg9
	 jwSgfPYNumEIxqPq7ls2t90A8VXsUg7YMZytE2fK86MdtIJ5YqOAzwaIEIt2QLSMvjjqO
	 TPJGlbh1MV7loXAo5X8I9NAOUvyEhHvw9Q9KoMQdUv+XX1zjJ49AzjHQM+N34USietkKD
	 30RNLAVAVCyIAlHIb+D8v13g4Nf4adpXI7zpCwTd9CBR4U/7zpdon0yU7+AHO0lDv0F0O
	 Kym9TqlLEUhgvpOtwrav8ZQnkK3A5ZpaoHB0HvWx1ZT9YERFMS28bXH+zw5ojn4haBg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=eFtpe1Sc;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.43.63
Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012063.outbound.protection.outlook.com [52.101.43.63])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51CEB606A33A;
	Tue, 17 Nov 2026 07:21:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51CEB606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=eFtpe1Sc
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UjN1kKm/EA1vOGyXGPvfjFOB7SDZqwtXOIftMyvGoL+UkK6xU9cXyLkNqA3Y2eyLQMUmooQk/U9ycfAxkLiMWHEkgHv6wEsBduBYxPVMyyYp+SAMsx9kBVGMyDV+rx6n6xmB4Iac6yeBqgXLkCpXfGxfv7zNbywY9ckTenmtm3UQj+cfl/nsJF+3h20oifpRAcSBTe/CCKU5MzEZYUEkv6Ph2TUb+kBrcE2T6Ht0wN0wRoM7JMpQq7xG6P5uJ3UTnmQdEt3TurNaQ36xEF4IA3rIyNphgyLrYDbzqbGhWfbmedz1MuXApy+ME/lNAEwDdddQpMsY5ebRlVMkOhGlwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7WEGbjLom9SbeV1qFwE3cpJ8k2pI3nuX/L6m/wYnGSg=;
 b=jy1pwsqNqjzgp3Mnck8WH/PA7XbCqmu6Qdd/9chi1z6keazuGy+DnzVhKvViPsHGNbP2+WGoV92G79f08JsYSHR3M9MORihfBcFOj+fed0yT6FFvxnMWkjbaCvRjcPKgCPVTkrkmkYIrkQoGkSVZvIIMAXAtRKWj/He1Ec6ElbSrLYr2PjpFv5vhEystmwA7TAr/hjvmzBX7qPTqpmFY3hUUGCkPNnEGLAzv0MnTBTaMdHefMBFhTBqgCZI2sm4Dt20dLeWpkR05+6JR6p0LkSu5Rul2WvWPQ8WiRajDaYu8GzGUnhHZ00z8r4bkrPNLA+cTKJaacgV6clGY20gFhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7WEGbjLom9SbeV1qFwE3cpJ8k2pI3nuX/L6m/wYnGSg=;
 b=eFtpe1ScFEB37HToLLP9v19Uvos+Ts78aVF0ECdGgwV4a8JDpR/KX2KAoUxSy6grznfoNW5vEKN+nO8i4+j39Lg0ay+qWrIqxrteiZdWDcgVd9Juu+VDdUsUERQDkBJEe+TqiXYQ6IH+yXXSsVdp/7BjMGRL/3maig5K2bvXOI8=
Received: from CH0PR03CA0346.namprd03.prod.outlook.com (2603:10b6:610:11a::32)
 by LVUPR12MB999138.namprd12.prod.outlook.com (2603:10b6:408:39e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 17 Nov
 2026 07:21:05 +0000
Received: from BN2PEPF0000A805.namprd02.prod.outlook.com
 (2603:10b6:610:11a:cafe::4b) by CH0PR03CA0346.outlook.office365.com
 (2603:10b6:610:11a::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.8 via Frontend Transport; Tue, 17
 Nov 2026 07:21:05 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN2PEPF0000A805.mail.protection.outlook.com (10.167.245.169) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Tue, 17 Nov 2026 07:21:05 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 17 Nov
 2026 01:21:03 -0600
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.57
 via Frontend Transport; Tue, 17 Nov 2026 01:21:00 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, <Richard.Gong@amd.com>, <Poojitha.N@amd.com>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>
Subject: [PATCH v4 04/11] soundwire: amd: rename hardware backend symbols to amd_acp63_*() prefix
Date: Tue, 17 Nov 2026 12:48:13 +0530
Message-ID: <20261117071927.830373-5-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261117071927.830373-1-Vijendar.Mukunda@amd.com>
References: <20261117071927.830373-1-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF0000A805:EE_|LVUPR12MB999138:EE_
X-MS-Office365-Filtering-Correlation-Id: 13d00fa1-f9f1-4ec8-6294-08df447b57ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|23010399003|36860700016|10067099003|11063799006|56012099006|261022075727099003|261021130227099003|261026130827099003|261026140227099003|261021121427099003|261021135927099003|261026121527099003|261021123027099003|261026135527099003|261022115727099003|261022113327099003|261022105027099003|261021133027099003|261102123227099003|261028144727099003|261009221227099003|261009221727099003|261009223327099003|261009220027099003|261009223027099003|18002099003|22082099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	KdoSUyGf8ky21TgVnTTdx93yPonb9R0j3zqjzDaiJ+YrlE+Kjac2CGOdZOh3sbOGIBNk656E033dKpTy/MtEobcqU1pl4/9VBumTeNJTltBeetxfoMRj+Lskuvtx1+rptwFdqxymADQDJrNSRu5bvaxS3Z81lhSRGdD4i4yxOEFwQd6695OO+D4sdTAlBq87PhXNWT3Ldf/QwZfdkCrsluoJ9XjmI6w5g8FD1T2H+mQhktqaoqFB2nkNKs5VSGxIQTFbaBnTyZ+WS4P1UPV9+yUKbtQW7lA50oPs9sXUCaLqy1Lc5XoOMnf3wcJVDLCicGcVeQoohx4N+76pdyG+W+2LvObpVKZynXkWLi3NN6dCOvEA0B5OvWu7o5kinc5N4OqlukElY80+N+7Um9L3V8iJnPaRjYGWOlfdprOMeeHhJNj7x6G/mIYyDgTm52ofX7M9ko+Sp+NMlG1k36dfX90N7wn1+I38L/sXa4fcMTlkfja+F4zXJwNEw2beV+i5nP2tpt4r/qtGldZYPZ8T6GvFKfrc1oAk1ZQFEhAbTja2XFiB8OM729z3ExaTMU+U6jsjTU4mShaMm+yIfLbd6SPJMIs2b6qU6IYlhJaBWseSS+1OchJHQtnAOMiRbYk5g3jy8M/WHvcDc70mYC+MTOvfOGPauFrAhfwSjC/XLcKnpLjaskzVpP+SxhSL+HmvR7acPWtOuKuUfOG/4Efyog==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(23010399003)(36860700016)(10067099003)(11063799006)(56012099006)(261022075727099003)(261021130227099003)(261026130827099003)(261026140227099003)(261021121427099003)(261021135927099003)(261026121527099003)(261021123027099003)(261026135527099003)(261022115727099003)(261022113327099003)(261022105027099003)(261021133027099003)(261102123227099003)(261028144727099003)(261009221227099003)(261009221727099003)(261009223327099003)(261009220027099003)(261009223027099003)(18002099003)(22082099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	fA+1eg9YDhEKOcgPjASu1TFE8F0l2i5TBlfhRBT4FmmQYNYRovftrnduTuqsaNuF87oluGUXOi6uHKJK1hTZRFHixEwCRpZ98UmQrAL3XlGHUelN63mFI+7b4V9kXJcw/ezh5gwZXn/wn+lfl4LTcDZUsJ76YgbasEMXxWnJTZIQtTCsDQZiviLkS3Mbk49AlM/xuu+tX+Fg4ZIAHiQIj4+eONZxk8qBQ81VwaVLglwj93glqPkFDBOnr3HiYUyzkeF7EFRNYkJapySmA6mdfZ5G9kNjMpsaDaeQxDJpNhdkAlcvpG711CQ53WGTVM91x8rXoMCJAmDfDqcG4hE62pHyeGrx7Ib6zfHjiDMHMHVxuBLPt9R5qVY4W+hZ4JNH3c46uDeRdEy0a1N4KA1j/mbERQp8++3fgWAZe1tARXRTrRlZaTZhtmc00hlwvSaS
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 07:21:05.2220
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 13d00fa1-f9f1-4ec8-6294-08df447b57ae
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF0000A805.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LVUPR12MB999138

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
 drivers/soundwire/amd_manager.c | 194 +++++++++++++++++---------------
 drivers/soundwire/amd_manager.h |   9 +-
 2 files changed, 112 insertions(+), 91 deletions(-)

diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
index 92e9ff0e03a4..a00c2ee039fd 100644
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
 	writel(AMD_SDW_IRQ_ERROR_MASK, amd_manager->mmio + ACP_SW_ERROR_INTR_MASK);
 }
 
-static void amd_disable_sdw_interrupts(struct amd_sdw_manager *amd_manager)
+static void amd_acp63_disable_sdw_interrupts(struct amd_sdw_manager *amd_manager)
 {
 	u32 irq_mask;
 
@@ -159,14 +159,14 @@ static void amd_disable_sdw_interrupts(struct amd_sdw_manager *amd_manager)
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
@@ -182,11 +182,11 @@ static bool amd_sdw_pad_ctrl_supported(struct amd_sdw_manager *amd_manager)
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
@@ -203,29 +203,29 @@ static void amd_sdw_oe_ctrl(struct amd_sdw_manager *amd_manager, bool enable)
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
@@ -253,11 +253,11 @@ static void amd_sdw_pad_ctrl(struct amd_sdw_manager *amd_manager, bool enable)
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
 
@@ -265,7 +265,7 @@ static void amd_sdw_set_frameshape(struct amd_sdw_manager *amd_manager)
 	writel(frame_size, amd_manager->mmio + ACP_SW_FRAMESIZE);
 }
 
-static void amd_sdw_wake_enable(struct amd_sdw_manager *amd_manager, bool enable)
+static void amd_acp63_sdw_wake_enable(struct amd_sdw_manager *amd_manager, bool enable)
 {
 	u32 wake_ctrl;
 
@@ -278,7 +278,8 @@ static void amd_sdw_wake_enable(struct amd_sdw_manager *amd_manager, bool enable
 	writel(wake_ctrl, amd_manager->mmio + ACP_SW_STATE_CHANGE_STATUS_MASK_8TO11);
 }
 
-static int amd_sdw_set_device_state(struct amd_sdw_manager *amd_manager, u32 target_device_state)
+static int amd_acp63_sdw_set_device_state(struct amd_sdw_manager *amd_manager,
+					  u32 target_device_state)
 {
 	u32 sdw_dev_state;
 
@@ -304,7 +305,7 @@ static int amd_sdw_set_device_state(struct amd_sdw_manager *amd_manager, u32 tar
 	return 0;
 }
 
-static int amd_sdw_host_wake_enable(struct amd_sdw_manager *amd_manager, bool enable)
+static int amd_acp63_sdw_host_wake_enable(struct amd_sdw_manager *amd_manager, bool enable)
 {
 	u32 intr_cntl1;
 	u32 sdw_host_wake_irq_mask;
@@ -360,8 +361,8 @@ static void amd_sdw_ctl_word_prep(u32 *lower_word, u32 *upper_word, struct sdw_m
 	*lower_word = lower_data;
 }
 
-static int amd_sdw_send_cmd_get_resp(struct amd_sdw_manager *amd_manager, u32 lower_data,
-				     u32 upper_data, u64 *response)
+static int amd_acp63_sdw_send_cmd_get_resp(struct amd_sdw_manager *amd_manager, u32 lower_data,
+					   u32 upper_data, u64 *response)
 {
 	u32 lower_resp, upper_resp;
 	u32 sts;
@@ -417,7 +418,8 @@ amd_program_scp_addr(struct amd_sdw_manager *amd_manager, struct sdw_msg *msg)
 	scp_msg.buf = &msg->addr_page1;
 	scp_msg.flags = SDW_MSG_FLAG_WRITE;
 	amd_sdw_ctl_word_prep(&lower_data, &upper_data, &scp_msg, 0);
-	if (amd_sdw_send_cmd_get_resp(amd_manager, lower_data, upper_data, &response_buf[0])) {
+	if (amd_acp63_sdw_send_cmd_get_resp(amd_manager, lower_data, upper_data,
+					    &response_buf[0])) {
 		dev_err_ratelimited(amd_manager->dev,
 				    "SCP_addrpage command timeout for Slave %d\n", msg->dev_num);
 		return SDW_CMD_TIMEOUT;
@@ -425,7 +427,8 @@ amd_program_scp_addr(struct amd_sdw_manager *amd_manager, struct sdw_msg *msg)
 	scp_msg.addr = SDW_SCP_ADDRPAGE2;
 	scp_msg.buf = &msg->addr_page2;
 	amd_sdw_ctl_word_prep(&lower_data, &upper_data, &scp_msg, 0);
-	if (amd_sdw_send_cmd_get_resp(amd_manager, lower_data, upper_data, &response_buf[1])) {
+	if (amd_acp63_sdw_send_cmd_get_resp(amd_manager, lower_data, upper_data,
+					    &response_buf[1])) {
 		dev_err_ratelimited(amd_manager->dev,
 				    "SCP_addrpage command timeout for Slave %d\n", msg->dev_num);
 		return SDW_CMD_TIMEOUT;
@@ -490,6 +493,7 @@ static enum sdw_command_response amd_sdw_fill_msg_resp(struct amd_sdw_manager *a
 	return SDW_CMD_OK;
 }
 
+/* AMD SoundWire bus helper shared across all ACP revisions. */
 static unsigned int _amd_sdw_xfer_msg(struct amd_sdw_manager *amd_manager, struct sdw_msg *msg,
 				      int cmd_offset)
 {
@@ -497,7 +501,7 @@ static unsigned int _amd_sdw_xfer_msg(struct amd_sdw_manager *amd_manager, struc
 	u32 upper_data = 0, lower_data = 0;
 
 	amd_sdw_ctl_word_prep(&lower_data, &upper_data, msg, cmd_offset);
-	if (amd_sdw_send_cmd_get_resp(amd_manager, lower_data, upper_data, &response)) {
+	if (amd_acp63_sdw_send_cmd_get_resp(amd_manager, lower_data, upper_data, &response)) {
 		dev_err_ratelimited(amd_manager->dev, "command timeout for Slave %d\n",
 				    msg->dev_num);
 		return SDW_CMD_TIMEOUT;
@@ -505,6 +509,7 @@ static unsigned int _amd_sdw_xfer_msg(struct amd_sdw_manager *amd_manager, struc
 	return amd_sdw_fill_msg_resp(amd_manager, msg, response, cmd_offset);
 }
 
+/* AMD SoundWire bus helper shared across all ACP revisions. */
 static enum sdw_command_response amd_sdw_xfer_msg(struct sdw_bus *bus, struct sdw_msg *msg)
 {
 	struct amd_sdw_manager *amd_manager = to_amd_sdw(bus);
@@ -521,6 +526,7 @@ static enum sdw_command_response amd_sdw_xfer_msg(struct sdw_bus *bus, struct sd
 	return SDW_CMD_OK;
 }
 
+/* AMD SoundWire bus helper shared across all ACP revisions. */
 static void amd_sdw_fill_slave_status(struct amd_sdw_manager *amd_manager, u16 index, u32 status)
 {
 	switch (status) {
@@ -535,6 +541,7 @@ static void amd_sdw_fill_slave_status(struct amd_sdw_manager *amd_manager, u16 i
 	}
 }
 
+/* AMD SoundWire bus helper shared across all ACP revisions. */
 static void amd_sdw_process_ping_status(u64 response, struct amd_sdw_manager *amd_manager)
 {
 	u64 slave_stat;
@@ -552,12 +559,12 @@ static void amd_sdw_process_ping_status(u64 response, struct amd_sdw_manager *am
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
 		return;
 	}
@@ -568,14 +575,14 @@ static void amd_sdw_read_and_process_ping_status(struct amd_sdw_manager *amd_man
 	amd_sdw_process_ping_status(response, amd_manager);
 }
 
-static u32 amd_sdw_read_ping_status(struct sdw_bus *bus)
+static u32 amd_acp63_sdw_read_ping_status(struct sdw_bus *bus)
 {
 	struct amd_sdw_manager *amd_manager = to_amd_sdw(bus);
 	u64 response;
 	u32 slave_stat;
 
 	lockdep_assert_held(&bus->msg_lock);
-	if (amd_sdw_send_cmd_get_resp(amd_manager, 0, 0, &response))
+	if (amd_acp63_sdw_send_cmd_get_resp(amd_manager, 0, 0, &response))
 		return amd_manager->ping_slave_stat == U32_MAX ? 0 : amd_manager->ping_slave_stat;
 	/* slave status from ping response */
 	slave_stat = FIELD_GET(AMD_SDW_MCP_SLAVE_STAT_0_3, response);
@@ -585,7 +592,7 @@ static u32 amd_sdw_read_ping_status(struct sdw_bus *bus)
 	return slave_stat;
 }
 
-static int amd_sdw_compute_params(struct sdw_bus *bus, struct sdw_stream_runtime *stream)
+static int amd_acp63_sdw_compute_params(struct sdw_bus *bus, struct sdw_stream_runtime *stream)
 {
 	struct amd_sdw_manager *amd_manager = to_amd_sdw(bus);
 	struct sdw_transport_data t_data = {0};
@@ -671,8 +678,8 @@ static int amd_sdw_compute_params(struct sdw_bus *bus, struct sdw_stream_runtime
 	return 0;
 }
 
-static int amd_sdw_port_params(struct sdw_bus *bus, struct sdw_port_params *p_params,
-			       unsigned int bank)
+static int amd_acp63_sdw_port_params(struct sdw_bus *bus, struct sdw_port_params *p_params,
+				     unsigned int bank)
 {
 	struct amd_sdw_manager *amd_manager = to_amd_sdw(bus);
 	u32 frame_fmt_reg, dpn_frame_fmt;
@@ -708,9 +715,9 @@ static int amd_sdw_port_params(struct sdw_bus *bus, struct sdw_port_params *p_pa
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
@@ -785,9 +792,9 @@ static int amd_sdw_transport_params(struct sdw_bus *bus,
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
@@ -864,6 +871,7 @@ static int sdw_master_read_amd_prop(struct sdw_bus *bus)
 	return 0;
 }
 
+/* AMD SoundWire bus helper shared across all ACP revisions. */
 static int amd_prop_read(struct sdw_bus *bus)
 {
 	sdw_master_read_prop(bus);
@@ -871,16 +879,16 @@ static int amd_prop_read(struct sdw_bus *bus)
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
@@ -1076,7 +1084,7 @@ static void amd_sdw_update_slave_status_work(struct work_struct *work)
 			       ACP_SW_STATE_CHANGE_STATUS_MASK_0TO7);
 			writel(AMD_SDW_IRQ_MASK_8TO11, amd_manager->mmio +
 			       ACP_SW_STATE_CHANGE_STATUS_MASK_8TO11);
-			amd_sdw_read_and_process_ping_status(amd_manager);
+			amd_acp63_sdw_read_and_process_ping_status(amd_manager);
 			goto update_status;
 		} else {
 			dev_err_ratelimited(amd_manager->dev,
@@ -1110,7 +1118,7 @@ static void amd_sdw_update_slave_status(u32 status_change_0to7, u32 status_chang
 	}
 }
 
-static void amd_sdw_process_wake_event(struct amd_sdw_manager *amd_manager)
+static void amd_acp63_sdw_process_wake_event(struct amd_sdw_manager *amd_manager)
 {
 	dev_dbg(amd_manager->dev, "SoundWire Wake event reported\n");
 	pm_request_resume(amd_manager->dev);
@@ -1136,12 +1144,12 @@ static void amd_sdw_irq_thread(struct work_struct *work)
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
@@ -1159,17 +1167,17 @@ int amd_sdw_manager_start(struct amd_sdw_manager *amd_manager)
 
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
@@ -1205,15 +1213,15 @@ static int amd_sdw_manager_probe(struct platform_device *pdev)
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
 
@@ -1282,15 +1290,21 @@ static void amd_sdw_manager_remove(struct platform_device *pdev)
 
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
@@ -1322,7 +1336,7 @@ static int amd_sdw_clock_stop(struct amd_sdw_manager *amd_manager)
 	return 0;
 }
 
-static int amd_sdw_clock_stop_exit(struct amd_sdw_manager *amd_manager)
+static int amd_acp63_sdw_clock_stop_exit(struct amd_sdw_manager *amd_manager)
 {
 	int ret;
 	u32 val;
@@ -1415,7 +1429,7 @@ static int __maybe_unused amd_sdw_host_wake_enable_by_rev(struct amd_sdw_manager
 	case ACP70_PCI_REV_ID:
 	case ACP71_PCI_REV_ID:
 	case ACP72_PCI_REV_ID:
-		return amd_sdw_host_wake_enable(amd_manager, enable);
+		return amd_acp63_sdw_host_wake_enable(amd_manager, enable);
 	default:
 		dev_err(amd_manager->dev, "unexpected acp_rev 0x%x\n", amd_manager->acp_rev);
 		return -EINVAL;
@@ -1436,7 +1450,7 @@ static int __maybe_unused amd_suspend(struct device *dev)
 	}
 
 	if (amd_manager->power_mode_mask & AMD_SDW_CLK_STOP_MODE) {
-		amd_disable_sdw_interrupts(amd_manager);
+		amd_acp63_disable_sdw_interrupts(amd_manager);
 		cancel_work_sync(&amd_manager->amd_sdw_irq_thread);
 		cancel_work_sync(&amd_manager->amd_sdw_work);
 		ret = amd_sdw_host_wake_enable_by_rev(amd_manager, false);
@@ -1445,9 +1459,9 @@ static int __maybe_unused amd_suspend(struct device *dev)
 		ret = amd_sdw_clock_stop(amd_manager);
 		if (ret)
 			return ret;
-		amd_enable_sdw_interrupts(amd_manager);
+		amd_acp63_enable_sdw_interrupts(amd_manager);
 	} else if (amd_manager->power_mode_mask & AMD_SDW_POWER_OFF_MODE) {
-		amd_disable_sdw_interrupts(amd_manager);
+		amd_acp63_disable_sdw_interrupts(amd_manager);
 		cancel_work_sync(&amd_manager->amd_sdw_irq_thread);
 		cancel_work_sync(&amd_manager->amd_sdw_work);
 		ret = amd_sdw_host_wake_enable_by_rev(amd_manager, false);
@@ -1460,12 +1474,12 @@ static int __maybe_unused amd_suspend(struct device *dev)
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
@@ -1475,7 +1489,7 @@ static int __maybe_unused amd_suspend(struct device *dev)
 	case ACP70_PCI_REV_ID:
 	case ACP71_PCI_REV_ID:
 	case ACP72_PCI_REV_ID:
-		ret = amd_sdw_set_device_state(amd_manager, AMD_SDW_DEVICE_STATE_D3);
+		ret = amd_acp63_sdw_set_device_state(amd_manager, AMD_SDW_DEVICE_STATE_D3);
 		if (ret)
 			return ret;
 		break;
@@ -1499,7 +1513,7 @@ static int __maybe_unused amd_suspend_runtime(struct device *dev)
 		return 0;
 	}
 	if (amd_manager->power_mode_mask & AMD_SDW_CLK_STOP_MODE) {
-		amd_disable_sdw_interrupts(amd_manager);
+		amd_acp63_disable_sdw_interrupts(amd_manager);
 		cancel_work_sync(&amd_manager->amd_sdw_irq_thread);
 		cancel_work_sync(&amd_manager->amd_sdw_work);
 		ret = amd_sdw_host_wake_enable_by_rev(amd_manager, true);
@@ -1508,19 +1522,19 @@ static int __maybe_unused amd_suspend_runtime(struct device *dev)
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
@@ -1538,7 +1552,7 @@ static int __maybe_unused amd_suspend_runtime(struct device *dev)
 		 * wake events if wake is armed.
 		 * For ACP 6.3 this call is a no-op.
 		 */
-		amd_sdw_oe_ctrl(amd_manager, false);
+		amd_acp63_sdw_oe_ctrl(amd_manager, false);
 	}
 	switch (amd_manager->acp_rev) {
 	case ACP63_PCI_REV_ID:
@@ -1546,7 +1560,7 @@ static int __maybe_unused amd_suspend_runtime(struct device *dev)
 	case ACP70_PCI_REV_ID:
 	case ACP71_PCI_REV_ID:
 	case ACP72_PCI_REV_ID:
-		ret = amd_sdw_set_device_state(amd_manager, AMD_SDW_DEVICE_STATE_D3);
+		ret = amd_acp63_sdw_set_device_state(amd_manager, AMD_SDW_DEVICE_STATE_D3);
 		if (ret)
 			return ret;
 		if (amd_manager->wake_en_mask) {
@@ -1579,7 +1593,7 @@ static int __maybe_unused amd_resume_runtime(struct device *dev)
 	}
 
 	if (amd_manager->power_mode_mask & AMD_SDW_CLK_STOP_MODE) {
-		ret = amd_sdw_clock_stop_exit(amd_manager);
+		ret = amd_acp63_sdw_clock_stop_exit(amd_manager);
 		if (ret)
 			return ret;
 		ret = amd_sdw_host_wake_enable_by_rev(amd_manager, false);
@@ -1587,10 +1601,10 @@ static int __maybe_unused amd_resume_runtime(struct device *dev)
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
@@ -1620,17 +1634,17 @@ static int __maybe_unused amd_resume_runtime(struct device *dev)
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
@@ -1638,7 +1652,7 @@ static int __maybe_unused amd_resume_runtime(struct device *dev)
 	case ACP70_PCI_REV_ID:
 	case ACP71_PCI_REV_ID:
 	case ACP72_PCI_REV_ID:
-		ret = amd_sdw_set_device_state(amd_manager, AMD_SDW_DEVICE_STATE_D0);
+		ret = amd_acp63_sdw_set_device_state(amd_manager, AMD_SDW_DEVICE_STATE_D0);
 		if (ret)
 			return ret;
 		break;
diff --git a/drivers/soundwire/amd_manager.h b/drivers/soundwire/amd_manager.h
index ff49e5d08f68..79372e93ad2a 100644
--- a/drivers/soundwire/amd_manager.h
+++ b/drivers/soundwire/amd_manager.h
@@ -8,7 +8,14 @@
 
 #include <linux/soundwire/sdw_amd.h>
 
-#define SDW_MANAGER_REG_OFFSET				0xc00
+/*
+ * Register offset between successive SoundWire manager instances.
+ * ACP7.0, ACP7.1, and ACP7.2 share the ACP6.3 IP base and use this
+ * same offset; the ACP63_ prefix denotes the shared base revision, not
+ * ACP6.3 exclusivity. A future revision with a different offset should
+ * define its own constant.
+ */
+#define ACP63_SDW_MANAGER_REG_OFFSET				0xc00
 #define AMD_SDW_DEFAULT_ROWS				50
 #define AMD_SDW_DEFAULT_COLUMNS				10
 #define ACP_SW0_WAKE_EN					0x0001458
-- 
2.53.0

