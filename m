Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.52.70
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794899489;
	b=mM5Wnd/x9RgI/bu3ED6cpHaEcExH00WCOKtdpKTypki9yOtFtXGln+T403CA+dbWmDBv
	 bgzp+WgIDxjTtO9Imdp6pjAQM7oWTMBksEy9YPehE0b583Ge0TeDIGfAEsRkBhABm56me
	 A6F1rYbe6M9v4aNGDUUAqDqzVrHbFUd/GHjzflQk0dxDESsjX7MSXxSzi/jbCs9007pdy
	 jMqNEVjdTpidxBLwd2aIjCdN+hr7CiKlb8fPwBV/BybT02hyZnERhOSHdmgxin+kl7zwv
	 7FMQ6X+Kb+muBM2MKVd1lR4K3g0hMYBnMzz45arzzBPTiL8EJtTTBMAdeHKGcOslQtQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794899489;
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
	bh=M664JNpn091wVoCawh2yBjnL1zlaHNI0KK+9Io34pEs=;
	b=eteZg4mWYZ3DzyfsOpnUe6/lzRyjC46BN3kXVYYHGjwleaw/RrIY72waqx4G3cFNy2qu
	 Y4XbtZiikXi7YH0VWWpXpd1pGwP5C2uwmAZ5UGZPlabHB4I+Q3rEsM4sTRywhYUBrjq7H
	 nUijk/ZByCJPheS6OuCoi5YjDOVph8qUqsiPJlj8ZBK2TXk1qV/uFW1PkPhjLJH/w/FG9
	 9B3Avr+Wdx8gMh4jWPOOj9x7a902Nxc4llAgNhF/bvLn9f+hyudpfLQ9ZZgrFsc5WvlGJ
	 i8oHJxAgoYdFw6T4v9cZN6DUxJBg/dagJtHXjT5ljySgOsloRRihCik6A0JRqpENNew==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=KSWEdSl4;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.52.70
Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011070.outbound.protection.outlook.com [52.101.52.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1263B606A323;
	Tue, 17 Nov 2026 07:11:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1263B606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=KSWEdSl4
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WFHrLcJFcCANHes6OHQuYwjApvEoKur1sq0r1YR1kCAhjawPVni/9zyRGlAacVjI8aMvsklWSJtXSDEDOvHFvfchsjATw9xl8ei5AP0QKSASi/I8K6DmLzRrZq433zopVOO+suawBzClii+sjk4hHE+CnrOreqhtG3216cPJC2BvxfjoW2GXob831lJssoFHU7z0S5ZDwVm3Bm7NInhH5J4yRivSlnlxhGiSYpXcBLU2nGKouJiTn5XgPgkhtqdREhsM8cDOF0o97xke/gp9Cekwp4m3d9MDWdtOAwvRjyYBgctnqd42wguZtE+wXWaRS0lTSux7zzzOsJ+5fgcBOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M664JNpn091wVoCawh2yBjnL1zlaHNI0KK+9Io34pEs=;
 b=nVYZ9TZJGx/EC1br3viW27pBhZAGrUVRbRtpPFF01YMT5aN4R8hmJkYKozTEhlJkBrGQ2B5a+PxaL4RiHrX+UNelvueoYEsB5QkvOCSgaXcU7tGdnYP8zKAxBHWHKc361brF1ULh6bKIzkEp/ibW3aPnAQDsi8m90x2y0oEoxgDn6jRvro2AWEnm5H+THxcEw6KPODoi4uvNW5aBdRNsep/fp0MGn/7xKKrs1l4qojoZp5i6MsffjEHSWBty7mbiotBbN0YqA6SMOVljv9NhFSao8UKPwUhFDSbiSYcE23jUrhzTJmOOLEGNlOsZ07zNpZ2IvXru9VRCy0ti7weMtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M664JNpn091wVoCawh2yBjnL1zlaHNI0KK+9Io34pEs=;
 b=KSWEdSl4hv6eNtmg9/MZCIQ0lgkAVpp7mIMxB5dhtNaUPfiRulXXGu4qHGz4gZ+1I5P4EswpITkGcuwrP0o0wGPbHYJ3kHk/kPuB0XYkxRTKtlkI/OFdJXcgp1FuruFUyhPn2Ctj41Uxx0TrPh7QJ9Y3fD4CdvnB0klvCqzxd2s=
Received: from CH2PR17CA0005.namprd17.prod.outlook.com (2603:10b6:610:53::15)
 by DS6PR12MB786665.namprd12.prod.outlook.com (2603:10b6:8:4c1::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 17 Nov
 2026 07:11:25 +0000
Received: from CH2PEPF0000014A.namprd02.prod.outlook.com
 (2603:10b6:610:53:cafe::a) by CH2PR17CA0005.outlook.office365.com
 (2603:10b6:610:53::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.10 via Frontend Transport; Tue,
 17 Nov 2026 07:11:25 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CH2PEPF0000014A.mail.protection.outlook.com (10.167.244.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Tue, 17 Nov 2026 07:11:25 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 17 Nov
 2026 01:11:23 -0600
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb08.amd.com (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.57
 via Frontend Transport; Tue, 17 Nov 2026 01:11:20 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, <Richard.Gong@amd.com>, <Poojitha.N@amd.com>,
	<lee@kernel.org>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH v6 15/23] soundwire: amd: use interrupt_enabled flag to guard IRQ work scheduling
Date: Tue, 17 Nov 2026 12:35:50 +0530
Message-ID: <20261117070906.803139-16-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261117070906.803139-1-Vijendar.Mukunda@amd.com>
References: <20261117070906.803139-1-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF0000014A:EE_|DS6PR12MB786665:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ce98582-4664-416a-4fb5-08df4479fe20
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700016|23010399003|82310400026|261022105027099003|261021121427099003|11063799006|10067099003|56012099006|261026121527099003|261026140227099003|261028144727099003|261022075727099003|261102123227099003|261021123027099003|261009223027099003|18002099003|22082099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	250jzmSTV5PWgjBaPRCHJV1MxlkIrJ3RhhqGtt8bzffnMwWYOZs6h7mhiH0GgSlsQUeCdHFXG5PbSiLIl8+mdwq87RNWcURuJxV1ZPzIAogG+GyBtzV9QuvdIDyusTWetFARCsq7ptdZzpKeyyOVF9TTb5O13tx9SRZTa5AwwrZMq2ENpDiFCLkSm3L8mRCn0y0JWnmj6cqRaJWlwzTlA53xr2SL2PodPah3l4ufAVgFtNANG1Av04mUiYjaSU/LcExBZ3RKHShOcbZ+T1fXL4x6p50AJh0aeUz1aOspxnSG+Gd24gROE//TqQmPH2C7X5NcUDrHRjN/sQls1hhikWa//n8kb2b7qKMygZmGZWPiDmSeve2FrNpPdwjYwE2LsPn3mDRJ47eNiBpQkG3GeusLBXBPBxf3vgtCovVVw+CYra4DVbmDnMGJ0Li/Pt0iyNBKfSqCei2KNL7uBBy4RX6puxnf32RbXIUq4g+onoisA0hUcMY3eK0KgDRtqU/jjIcq9pUQc0rpFlWdPjBs5coQ5Wnv5V0KB4ezKJmx0wim5iOMAGJpHJB7C+2Q/1MgSxLUn1Fp1KfRKrqeOvH71h8WUJGdabhOwwFqCsmooAeqvLLn0cScpYydlJw02s0W54BYNUTblYb+N0HR03fwiw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700016)(23010399003)(82310400026)(261022105027099003)(261021121427099003)(11063799006)(10067099003)(56012099006)(261026121527099003)(261026140227099003)(261028144727099003)(261022075727099003)(261102123227099003)(261021123027099003)(261009223027099003)(18002099003)(22082099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	rOr+zagajTgmPuC2m75Qb1VrDmNder+fQL2hJv+DswKokdvOv7ASuP0FqhXxyXh9vABfc7BwCifX3M/gWPyDsQ/4WwLgNo0yBXXxWVIyRRzfhOkGNm18CJ5PnJxrCsVCh8IHP2I535qqtglXfMKUsFOhfaMUnf0ip4JxA3gxBeD1b+5jYtbjizR0z/eecE9araMGlSQYmzEFNh++uNCAeI/Q8DYYXlIcOHV109i28dl/HS3nK4oQyI1fG5i5zCy62o96kKs61MjrRRsdiuT+ZZ6qMXomJPvNX/nm8SYS/P9e+RjSoQzKhIlurhxFj07Oz8VeQBfrGXU8TUQV4nxTiZDDPOGY0ITNMxvbCT+wBoAild202w2x9jrCW/UUbeZTeNtli+Ivu4waxpzfUbFgg6D1GNwtNO7AfNGFHQzLsUwkqPX86FEqfivqi8Hm8CR2
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 07:11:25.4875
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ce98582-4664-416a-4fb5-08df4479fe20
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF0000014A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS6PR12MB786665

Add an interrupt_enabled boolean to struct amd_sdw_manager to prevent
already-queued work from executing during the window between starting to
disable interrupts and the hardware masks taking effect.

- Add interrupt_enabled to struct amd_sdw_manager.
- Set it to true at the start of amd_enable_sdw_interrupts(), before
  unmasking any hardware registers, so no IRQ can fire with the flag false.
- Clear it to false at the start of amd_disable_sdw_interrupts(), before
  touching any hardware registers, so that queued work items that start
  executing after the flag is cleared will return early.
- Guard execution of amd_sdw_irq_thread() with an early-return flag check.
- Restore interrupt_enabled inside the ACP6.3-specific wake-re-enable
  block in amd_suspend_runtime() POWER_OFF_MODE, so that wake events are
  processed after hardware wake delivery is re-armed.
- Use WRITE_ONCE() for all stores to interrupt_enabled and READ_ONCE()
  for the load in amd_sdw_irq_thread() to annotate the intended
  single-writer/single-reader cross-context access and prevent compiler
  caching under LKMM.

Reported-by: Lee Jones <lee@kernel.org>
Closes: https://sashiko.dev/#/bug/linux-ab458b2e-f505-4a41-8238-a93ceb5d9c77
Fixes: 65f93e4096a0 ("soundwire: amd: add SoundWire manager interrupt handling")
Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 drivers/soundwire/amd_manager.c   | 17 +++++++++++++++++
 include/linux/soundwire/sdw_amd.h |  4 ++++
 2 files changed, 21 insertions(+)

diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
index 93c96613b5d8..1a3d3af4e0a4 100644
--- a/drivers/soundwire/amd_manager.c
+++ b/drivers/soundwire/amd_manager.c
@@ -119,6 +119,7 @@ static void amd_enable_sdw_interrupts(struct amd_sdw_manager *amd_manager)
 {
 	u32 val;
 
+	WRITE_ONCE(amd_manager->interrupt_enabled, true);
 	mutex_lock(amd_manager->acp_sdw_lock);
 	val = sdw_manager_reg_mask_array[amd_manager->instance];
 	amd_updatel(amd_manager->acp_mmio, ACP_EXTERNAL_INTR_CNTL(amd_manager->instance), val, val);
@@ -135,6 +136,18 @@ static void amd_disable_sdw_interrupts(struct amd_sdw_manager *amd_manager)
 {
 	u32 irq_mask;
 
+	/*
+	 * Clear the flag before updating hardware masks. Work items already
+	 * queued but not yet started will see the flag false at entry and
+	 * return early; work items already running will complete their current
+	 * invocation. Callers that need to ensure no instance of
+	 * amd_sdw_irq_thread() is executing on return must follow this call
+	 * with cancel_work_sync(&amd_manager->amd_sdw_irq_thread). Once the
+	 * mask registers are written, the ACP hardware will not assert any new
+	 * SDW interrupt.
+	 */
+	WRITE_ONCE(amd_manager->interrupt_enabled, false);
+
 	mutex_lock(amd_manager->acp_sdw_lock);
 	irq_mask = sdw_manager_reg_mask_array[amd_manager->instance];
 	amd_updatel(amd_manager->acp_mmio, ACP_EXTERNAL_INTR_CNTL(amd_manager->instance),
@@ -1112,6 +1125,9 @@ static void amd_sdw_irq_thread(struct work_struct *work)
 	u32 status_change_8to11;
 	u32 status_change_0to7;
 
+	if (!READ_ONCE(amd_manager->interrupt_enabled))
+		return;
+
 	status_change_8to11 = readl(amd_manager->mmio + ACP_SW_STATE_CHANGE_STATUS_8TO11);
 	status_change_0to7 = readl(amd_manager->mmio + ACP_SW_STATE_CHANGE_STATUS_0TO7);
 	if (!status_change_0to7 && !status_change_8to11)
@@ -1482,6 +1498,7 @@ static int __maybe_unused amd_suspend_runtime(struct device *dev)
 				return ret;
 		} else if ((amd_manager->acp_rev == ACP63_PCI_REV_ID) &&
 			   amd_manager->wake_en_mask) {
+			WRITE_ONCE(amd_manager->interrupt_enabled, true);
 			mutex_lock(amd_manager->acp_sdw_lock);
 			val = sdw_manager_reg_mask_array[amd_manager->instance];
 			amd_updatel(amd_manager->acp_mmio,
diff --git a/include/linux/soundwire/sdw_amd.h b/include/linux/soundwire/sdw_amd.h
index bf97c790c669..2213eea4afe1 100644
--- a/include/linux/soundwire/sdw_amd.h
+++ b/include/linux/soundwire/sdw_amd.h
@@ -85,6 +85,9 @@ struct sdw_amd_dai_runtime {
  * @ping_slave_stat: cached slave status from the last ping
  *		     transaction that returned a response;
  *		     initialised to U32_MAX ("no valid reading yet")
+ * @interrupt_enabled: set when hardware interrupts are enabled; cleared
+ *		     before disabling to prevent queued work from executing
+ *		     interrupt events during teardown
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

