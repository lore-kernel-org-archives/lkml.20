Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.48.29
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794068128;
	b=CXHd+1zH6/bGnVW3LXgt7ZmiaCWrWx3xj7hd0VK1GusU+o0vPdehaaHphoziI3Kq6+mZ
	 7uRMKHBKWGw0CrBr4jlTkk/9w0ePRpKuXMKkne3rJSKA/vy/aE/Wu0K4uc59Gc3fLpAuY
	 zJ7GtRxvgeekZa3XC5/s72GblQGzVpyNxmudxXVeAevwMdbbfmUgxmvjKTFFiaQIhFmyf
	 TErWQjp4rBPkDkCkpQY9CHUc4iQ7bu+mKtrnIDFWXF/Frhpv7sEr7uQ0jOr8VgKsqnlkg
	 tr9mfBKNIsbRwtfEfyTrnORXAT6blmmszbknsDe3Yk5Zd1DI/sRZYsIMiLtRAjIfWWA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794068128;
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
	bh=q40QczatGYwOXKA1DxSmKV7WVY9fBull5wAc5jSb4Qo=;
	b=HQzKcUqpAmBjhgIucVLlT5/qq9S4jSitYAOY2KbtJzfkah1zxmTHV+HGj7s+iY99xySB
	 yQtPma8vZZWnkDaRulIKH0usMNILHSsnLLmdf7229i3FoZD6FJ+3lVTkjlbwz5ohlgoBr
	 mu/xzmHKDh5nFY8HMFA6rSmPfE1TJs4y2e/SykCvhWsCAwdLHTZDfwXkm5EavHaQpaUJe
	 fqfzOy00y0l6mQvyALh66rCq148Kskr1ga4mEIEuk4cyUVbEKDTSDEzFVMst6QSw+syW2
	 o8eFASpMOVYaHH4yb5GcostL3XPQ11bPKO138IM+DIAA/2nmAKjew8C+F6PnBKg/M4A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=uWR3ztiV;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.48.29
Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012029.outbound.protection.outlook.com [52.101.48.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7BF9606AC2B;
	Sat,  7 Nov 2026 16:15:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7BF9606AC2B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=uWR3ztiV
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xcli+QlVgGiLDQCC4rU2Q96TMZbamAdl8IQkPlMIrhJXT4SEYPFpM0xhW8Z9X4p0dEpUQ9YnHFIXcfT83bF7CoxivYqOMEqPib9Xv+1qeRzH2XTTbNrM7E43SfWUYZfDWXmWJXEC5wYnl+sFGC45XIK8d5K6R1jAtemAygRFW8Mj9MuXFrT2xiJqaIMWTolScd+0zuaojrHxQ5GKUUpUUwRGAn15+RrhFabnnQvy4ijAnJPtpvGlKApAP/GPAbzOgRUmTig2FVy2beUok6B6iVTR4aSuaiSMwyvDNSFAEMdG+cC09K9Ta6qSaPHjEoWbPqxhpgBiuUCZv1V7OxJk8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q40QczatGYwOXKA1DxSmKV7WVY9fBull5wAc5jSb4Qo=;
 b=muOMfaZYWTQjRp2EmTwdQzLk/AsND/7qUAk35WFFkdXy9kn/t6NSzfOCsVXRazFgVH5nvRsnoUKgpVa+BrU83/Y1SEWgW4UKZZA9kB5GpSOc5ERCpEKbm8ze502jCvtJXsPxx2aUnYRNRuaPrfKiK1Fn6Vyi+P30ofEXDoAl5Au+0LE1O9co6LOX4pkRBBv+zoCkDaE0lEbJbUHCHPwFb1QjbFskaq2vwTq0bjFtZosAIaVifaL4bmMKTZHLAP196OZFo5mKaG3JyRVaxFDu8FSfxgZO0iiAHU0MDIXEB0Y5ZFFhVJnFlqiGzAdbsN+B8g65ZUPzCaVMsV6YPPHVJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q40QczatGYwOXKA1DxSmKV7WVY9fBull5wAc5jSb4Qo=;
 b=uWR3ztiVjFpKjXxXDAzDknHHDUrrPF1sI7dJT25462+JBys5ALZBsj2YV3AXr3rt5ptErbTR2CwpGX8AXspceV2RfOeScvdDLT3NUdj1HkEG7dMw/NwljT97DJ2zA+CL0messKgl77qE0xv7UuwV4h03S3ih7fD3xN1Jbixkq40=
Received: from MW4PR04CA0252.namprd04.prod.outlook.com (2603:10b6:303:88::17)
 by DS0PR12MB8562.namprd12.prod.outlook.com (2603:10b6:8:164::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Sat, 7 Nov
 2026 16:15:22 +0000
Received: from MWH0EPF000C618A.namprd02.prod.outlook.com
 (2603:10b6:303:88:cafe::a4) by MW4PR04CA0252.outlook.office365.com
 (2603:10b6:303:88::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.11 via Frontend Transport; Sat, 7
 Nov 2026 16:15:22 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 MWH0EPF000C618A.mail.protection.outlook.com (10.167.249.122) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Sat, 7 Nov 2026 16:15:22 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Sat, 7 Nov
 2026 10:15:14 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Sat, 7 Nov
 2026 10:15:14 -0600
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb08.amd.com (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53
 via Frontend Transport; Sat, 7 Nov 2026 10:15:10 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, <Richard.Gong@amd.com>, <Poojitha.N@amd.com>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>
Subject: [PATCH v3 06/11] soundwire: amd: introduce struct amd_sdw_hw_ops dispatch framework
Date: Sat, 7 Nov 2026 21:42:23 +0530
Message-ID: <20261107161345.3411491-7-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000C618A:EE_|DS0PR12MB8562:EE_
X-MS-Office365-Filtering-Correlation-Id: deb5df39-d004-48b3-1bae-08df3cea5308
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|23010399003|376014|18002099003|22082099003|10067099003|11063799006|261028144727099003|261102123227099003|261022105027099003|56012099006|261021121427099003|261026121527099003|261026140227099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	1zY4KG3OJPAKAxP6jaNH/Q+i5vRYvjWZpKJocMz38PHvnyRu5KhBFgsjQzDaXHRycxKeOsdCFzceS6m9tjcXjpF0h35qkYkBCRIgEpZORCfHYpqQBhiI9OCGa4vvcrvBTdeMc0ai8i6Mfc42kZxMS67ZucyZH/kOZ8EsclfwuFiMcLxOqMn82XjhRu2VkD62TtOKfl3HrElXsKk1PME7shcGZQiAgnvjgqs0m7AzqWrqsznwbFQKY48fTCW8bVjk09l+KFRs9UIp28I3x7TmqA/o75GGBPWYePTFikq7ha5WmM0ctamdKRYG87VGnFFvbLr9nL34K/JYjKauvh0QxAG9LbnNWcg4kjnyHFvuNJ7HYCWRNPvXENY7Gb5jFB1Kk0I+f44qVDV3jdOAb2xrpxcMFnCEXGdzTD99FvsSU9oI0O3QP0Ikh68ptTz541bRhEVSUDxcJoWjFL8pZ1+MaGMB5wsZOEPCAwiraPN3lhGHJTncOKiZMEwKqsgC9kr6AhiXMoYId12af+MpmA/83z6qfxnwH5+wdRDk83ADNPIoR4XEYdYQ2HzfYS7PPC3Gs32HoKSb1+hCDOYxusql+TQIAP1Rqih+kW7h5Y1sW5dGlHyF9xtQmFn5l35U45Kfg8XAHglnacJmZrWq+UYEwKGjAvh55lep/28+VJg0ZMz0CKJxdop3fQAkOU6UvcwJAteXWoeX2L6eGUo584G1Rg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(23010399003)(376014)(18002099003)(22082099003)(10067099003)(11063799006)(261028144727099003)(261102123227099003)(261022105027099003)(56012099006)(261021121427099003)(261026121527099003)(261026140227099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	X7jP4GjVHZTJeny+b7xHrQbR8CTj6gSe6CMigczv3hHOF3gURdg9tlC1CeCi9acvsf3Zt4aaUAuowgDVCcrAfIBYPBIEHo8XDhoq8RFEl2SgKnG8VENUYLOaDMk7dA8c229WsNALNths1lThmY3lGUTrW9ohxB1M3pztmEfF8vbThOl/hu0ySzTXpzJ0z27IGOf3bN6TqD/6MZiiTrZJJi9EwN8ZedgJdOX9RoCVimiMWlw1Re44KAVCuEo80k00VEk45NBiLISdBAVFYbjY9QBIIV2iFQ8/fwJs/Bvuu7ZhPL8TlcgB2l0ugpDbI0rocVM7WWtrqtTVAhEKRfPkPN6s26QdmhHQEq1+nEnxdQ5PMCSUgZK7UUkKCTwDsH+W4qPn1DxMM1cPkQeF3Sv9hcvgU1fjj70BbDkhR8h8TeYWLZ7whc6+I75Sz3Wm3mdU
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2026 16:15:22.1623
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: deb5df39-d004-48b3-1bae-08df3cea5308
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000C618A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8562

Add struct amd_sdw_hw_ops, a function-pointer dispatch table for
hardware-revision-specific SoundWire manager operations, including
register-level init/enable/disable, interrupt masking, frameshape,
wake/host-wake, command/response, ping handling, clock-stop exit,
and the PM suspend/resume paths. Add inline dispatch helpers for
each callback and a const hw_ops pointer in struct amd_sdw_manager.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 drivers/soundwire/amd_manager.h   | 175 ++++++++++++++++++++++++++++++
 include/linux/soundwire/sdw_amd.h |   4 +
 2 files changed, 179 insertions(+)

diff --git a/drivers/soundwire/amd_manager.h b/drivers/soundwire/amd_manager.h
index 5e280fb542f8..8780759b9c1c 100644
--- a/drivers/soundwire/amd_manager.h
+++ b/drivers/soundwire/amd_manager.h
@@ -264,4 +264,179 @@ static u32 sdw_manager_reg_mask_array[AMD_ACP63_SDW_MAX_MANAGER_COUNT] =  {
 		AMD_SDW0_EXT_INTR_MASK,
 		AMD_SDW1_EXT_INTR_MASK
 };
+
+#define AMD_SDW_HW_OPS(amd_manager, cb)	((amd_manager)->hw_ops->cb)
+
+/**
+ * struct amd_sdw_hw_ops - hardware-revision-specific SoundWire manager ops
+ *
+ * @init_sdw_manager: enable the SoundWire manager hardware and perform bus reset
+ * @enable_sdw_manager: set the manager enable bit and wait for it to assert
+ * @disable_sdw_manager: clear the manager enable bit and wait for it to deassert
+ * @enable_sdw_interrupts: unmask ACP-level and per-manager interrupt bits
+ * @disable_sdw_interrupts: mask ACP-level and per-manager interrupt bits
+ * @set_frameshape: write the row/column frame-shape register
+ * @send_cmd_get_resp: issue an immediate command and return the response;
+ *   returns 0 on success with the raw u64 response in @response,
+ *   or negative on hardware timeout
+ * @wake_enable: enable or disable the in-band SoundWire wake interrupt
+ * @host_wake_enable: enable or disable the host-side wake interrupt
+ * @set_device_state: write the D0/D3 device power state for the manager instance
+ * @read_and_process_ping_status: issue a PING command and process the slave
+ *   attach/detach status; called from the IRQ work path
+ * @process_wake_event: handle an in-band wake notification from a slave
+ * @clk_init_ctrl: set the clock divider and update the frame shape registers
+ *   based on the current bus clock frequency
+ * @clock_stop_exit: restart the SoundWire bus clock after a CLK_STOP_MODE
+ *   suspend; implementation differs across ACP revisions
+ * @suspend: system-suspend hook; stops the bus and powers down the manager
+ * @suspend_runtime: runtime-suspend hook; same sequence as @suspend
+ * @resume_runtime: runtime-resume hook; reinitialises the manager and restarts
+ *   the bus after a POWER_OFF_MODE or CLK_STOP_MODE suspend
+ */
+struct amd_sdw_hw_ops {
+	int (*init_sdw_manager)(struct amd_sdw_manager *amd_manager);
+	int (*enable_sdw_manager)(struct amd_sdw_manager *amd_manager);
+	int (*disable_sdw_manager)(struct amd_sdw_manager *amd_manager);
+	void (*enable_sdw_interrupts)(struct amd_sdw_manager *amd_manager);
+	void (*disable_sdw_interrupts)(struct amd_sdw_manager *amd_manager);
+	void (*set_frameshape)(struct amd_sdw_manager *amd_manager);
+	int (*send_cmd_get_resp)(struct amd_sdw_manager *amd_manager, u32 lower_data,
+				 u32 upper_data, u64 *response);
+	void (*wake_enable)(struct amd_sdw_manager *amd_manager, bool enable);
+	int (*host_wake_enable)(struct amd_sdw_manager *amd_manager, bool enable);
+	int (*set_device_state)(struct amd_sdw_manager *amd_manager, u32 target_device_state);
+	void (*read_and_process_ping_status)(struct amd_sdw_manager *amd_manager);
+	void (*process_wake_event)(struct amd_sdw_manager *amd_manager);
+	int (*clk_init_ctrl)(struct amd_sdw_manager *amd_manager);
+	int (*clock_stop_exit)(struct amd_sdw_manager *amd_manager);
+	int (*suspend)(struct amd_sdw_manager *amd_manager);
+	int (*suspend_runtime)(struct amd_sdw_manager *amd_manager);
+	int (*resume_runtime)(struct amd_sdw_manager *amd_manager);
+};
+
+static inline int acp_init_sdw_manager(struct amd_sdw_manager *amd_manager)
+{
+	if (amd_manager && amd_manager->hw_ops && amd_manager->hw_ops->init_sdw_manager)
+		return AMD_SDW_HW_OPS(amd_manager, init_sdw_manager)(amd_manager);
+	return -EOPNOTSUPP;
+}
+
+static inline int acp_enable_sdw_manager(struct amd_sdw_manager *amd_manager)
+{
+	if (amd_manager && amd_manager->hw_ops && amd_manager->hw_ops->enable_sdw_manager)
+		return AMD_SDW_HW_OPS(amd_manager, enable_sdw_manager)(amd_manager);
+	return -EOPNOTSUPP;
+}
+
+static inline int acp_disable_sdw_manager(struct amd_sdw_manager *amd_manager)
+{
+	if (amd_manager && amd_manager->hw_ops && amd_manager->hw_ops->disable_sdw_manager)
+		return AMD_SDW_HW_OPS(amd_manager, disable_sdw_manager)(amd_manager);
+	return -EOPNOTSUPP;
+}
+
+static inline void acp_enable_sdw_interrupts(struct amd_sdw_manager *amd_manager)
+{
+	if (amd_manager && amd_manager->hw_ops && amd_manager->hw_ops->enable_sdw_interrupts)
+		AMD_SDW_HW_OPS(amd_manager, enable_sdw_interrupts)(amd_manager);
+}
+
+static inline void acp_disable_sdw_interrupts(struct amd_sdw_manager *amd_manager)
+{
+	if (amd_manager && amd_manager->hw_ops && amd_manager->hw_ops->disable_sdw_interrupts)
+		AMD_SDW_HW_OPS(amd_manager, disable_sdw_interrupts)(amd_manager);
+}
+
+static inline void acp_sdw_set_frameshape(struct amd_sdw_manager *amd_manager)
+{
+	if (amd_manager && amd_manager->hw_ops && amd_manager->hw_ops->set_frameshape)
+		AMD_SDW_HW_OPS(amd_manager, set_frameshape)(amd_manager);
+}
+
+static inline int acp_sdw_send_cmd_get_resp(struct amd_sdw_manager *amd_manager,
+					    u32 lower_data, u32 upper_data, u64 *response)
+{
+	if (amd_manager && amd_manager->hw_ops && amd_manager->hw_ops->send_cmd_get_resp)
+		return AMD_SDW_HW_OPS(amd_manager, send_cmd_get_resp)(amd_manager,
+								      lower_data, upper_data,
+								      response);
+	return -EOPNOTSUPP;
+}
+
+static inline void acp_sdw_wake_enable(struct amd_sdw_manager *amd_manager, bool enable)
+{
+	if (amd_manager && amd_manager->hw_ops && amd_manager->hw_ops->wake_enable)
+		AMD_SDW_HW_OPS(amd_manager, wake_enable)(amd_manager, enable);
+}
+
+static inline int acp_sdw_host_wake_enable(struct amd_sdw_manager *amd_manager, bool enable)
+{
+	if (amd_manager && amd_manager->hw_ops && amd_manager->hw_ops->host_wake_enable)
+		return AMD_SDW_HW_OPS(amd_manager, host_wake_enable)(amd_manager, enable);
+	return -EOPNOTSUPP;
+}
+
+static inline int acp_sdw_set_device_state(struct amd_sdw_manager *amd_manager,
+					   u32 target_device_state)
+{
+	if (amd_manager && amd_manager->hw_ops && amd_manager->hw_ops->set_device_state)
+		return AMD_SDW_HW_OPS(amd_manager, set_device_state)(amd_manager,
+								      target_device_state);
+	return -EOPNOTSUPP;
+}
+
+static inline void acp_sdw_read_and_process_ping_status(struct amd_sdw_manager *amd_manager)
+{
+	if (amd_manager && amd_manager->hw_ops && amd_manager->hw_ops->read_and_process_ping_status)
+		AMD_SDW_HW_OPS(amd_manager, read_and_process_ping_status)(amd_manager);
+}
+
+static inline void acp_sdw_process_wake_event(struct amd_sdw_manager *amd_manager)
+{
+	if (amd_manager && amd_manager->hw_ops && amd_manager->hw_ops->process_wake_event)
+		AMD_SDW_HW_OPS(amd_manager, process_wake_event)(amd_manager);
+}
+
+static inline int acp_sdw_clk_init_ctrl(struct amd_sdw_manager *amd_manager)
+{
+	if (amd_manager && amd_manager->hw_ops && amd_manager->hw_ops->clk_init_ctrl)
+		return AMD_SDW_HW_OPS(amd_manager, clk_init_ctrl)(amd_manager);
+	return -EOPNOTSUPP;
+}
+
+static inline int acp_sdw_clock_stop_exit(struct amd_sdw_manager *amd_manager)
+{
+	if (amd_manager && amd_manager->hw_ops && amd_manager->hw_ops->clock_stop_exit)
+		return AMD_SDW_HW_OPS(amd_manager, clock_stop_exit)(amd_manager);
+	return -EOPNOTSUPP;
+}
+
+static inline int acp_sdw_suspend(struct device *dev)
+{
+	struct amd_sdw_manager *amd_manager = dev_get_drvdata(dev);
+
+	if (amd_manager && amd_manager->hw_ops && amd_manager->hw_ops->suspend)
+		return AMD_SDW_HW_OPS(amd_manager, suspend)(amd_manager);
+	return -EOPNOTSUPP;
+}
+
+static inline int acp_sdw_suspend_runtime(struct device *dev)
+{
+	struct amd_sdw_manager *amd_manager = dev_get_drvdata(dev);
+
+	if (amd_manager && amd_manager->hw_ops && amd_manager->hw_ops->suspend_runtime)
+		return AMD_SDW_HW_OPS(amd_manager, suspend_runtime)(amd_manager);
+	return -EOPNOTSUPP;
+}
+
+static inline int acp_sdw_resume_runtime(struct device *dev)
+{
+	struct amd_sdw_manager *amd_manager = dev_get_drvdata(dev);
+
+	if (amd_manager && amd_manager->hw_ops && amd_manager->hw_ops->resume_runtime)
+		return AMD_SDW_HW_OPS(amd_manager, resume_runtime)(amd_manager);
+	return -EOPNOTSUPP;
+}
+
 #endif
diff --git a/include/linux/soundwire/sdw_amd.h b/include/linux/soundwire/sdw_amd.h
index 6174e888b433..64e7cea8bd50 100644
--- a/include/linux/soundwire/sdw_amd.h
+++ b/include/linux/soundwire/sdw_amd.h
@@ -55,10 +55,13 @@ struct sdw_amd_dai_runtime {
 	enum sdw_stream_type stream_type;
 };
 
+struct amd_sdw_hw_ops;
+
 /**
  * struct amd_sdw_manager - amd manager driver context
  * @bus: bus handle
  * @dev: linux device
+ * @hw_ops: pointer to hardware-revision-specific dispatch table
  * @mmio: SoundWire registers mmio base
  * @acp_mmio: acp registers mmio base
  * @amd_sdw_irq_thread: SoundWire manager irq workqueue
@@ -94,6 +97,7 @@ struct sdw_amd_dai_runtime {
 struct amd_sdw_manager {
 	struct sdw_bus bus;
 	struct device *dev;
+	const struct amd_sdw_hw_ops *hw_ops;
 
 	void __iomem *mmio;
 	void __iomem *acp_mmio;
-- 
2.53.0

