Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.194.60
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794900078;
	b=D4cKNLDCOHJiaW+Xo11IT8NP8t56amwxHn8Ix7N4KArI9jI2G1xshVjoqYtYQrojIIJd
	 Iuv3zpOHEQOvL1NcfYcrg0gKw5/dA+tv9oFetNAz6nn6fE7NW3WXOOduy9dfNf6hMtJP8
	 UPuB/IwV8Ef0+ahS1ZqWO8/fhOPOfeCoCHos8K7cAgiNH/twxfz/H1xGRRiMAdhuUoYwH
	 ly/H6qspdlsSq2tDLgWV0uPaM0EnIqn2TMqbw/zhUmSgGuDo8HTBcDGUjjDTEI3+crgs4
	 MywOwmYcIcOko2b/cswR+ecVt0PcKHV4o5mbk9UD+VH2k6KbUdAIp6Ro7Z2FEUiAh2A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794900078;
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
	bh=GG3kTYYYFFdiYAavcyu8ppaDsGZ+YRHp33jHGn0Cw+Y=;
	b=EIZQ3WPY7xQrNy52+iUcBwDkP5CaloruJz/p8cOkXp0St4jJ8m6CMpOxfaUA+vENe5ZX
	 xsgi988oqAY62QgCf4LCHqPMSAXxeBkYO5Gh8nHOEzBgLL9YnGgdBRRgf+OzRChSX3Rw8
	 IxehlOVzVV/MhsLGxUTJMDJJZYR/7yi5C4p0qTjeg6FafemiZr6rVpXy3RlPlB1ulKbAv
	 7efsrEfvKbm/p+5xLyVZZRxFFJHdvkquxTF8kKn4NMeSIKPM7hl60BDf9pl5H5RqCRcRH
	 gPUUU9xdWdVr95PysnI4z01XZJdWLttiJ6xpe+vprFxZTB2z69Z7Ptd6+uw87X1SP/g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=XUleyFb0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.194.60
Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011060.outbound.protection.outlook.com [40.93.194.60])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1315E606A323;
	Tue, 17 Nov 2026 07:21:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1315E606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=XUleyFb0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EclAu2Y3Bjbhxm/kdS0364RV806EEBdAWS+jQzhJ9PCCtI1oRlVtljxjrp+9hddumm4YTpUCpRt/by2XuIwMybxsEX45LhowvIqmU2HSGDvFcHDZEoDZ2o7ESgVhpWzK0auQKJvEmrl5EPb/gapK1Xoc3Z7a5dPxeZhWnNIl7OaLdtywiifF4g/oYSg0HFzeUxlLGGdFRoGNlx3AanmTy+Q+ADBejYtP8+g26BiayT2jIn6wC4mNKTjH4hZxKARgbpVI4+6KTkm5CV3FNFEDJE+mTP9/qkaHnPRMrFx8Qnj1oya5BbYmX1ythszXoB1USVBQvL9i06dmOAsqB0Y+UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GG3kTYYYFFdiYAavcyu8ppaDsGZ+YRHp33jHGn0Cw+Y=;
 b=KqjRZwp683hv0AxY+ZtmhiZrk39i5W71s3kO1RQDbqUs6/bhSDuIPD9FYleTVicRQKAezvypoF4jf9iGWSmMksd0TpTQoUJ+gkW06jx0mBcanu5X3yTln95BECZ3iY5yiW+1sX/7ln3raum3OmrNPeuA682BrzPB84DUmsClnj+eZ01hqyHMB+VJBTj4AOo18an5qlATBFSyPtg4vDOaCcEC+tKdCGZfo6pSgqp7LOGyg3avG7md/PUbzkUBKZlgaJAESLBxMViQ7e019l39wL5fYAxUY/HSz0gUrn/FQc9mVAnMsIqFewGUncGDrPSWmLRkK63L5LfxE3bhhL5Ehg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GG3kTYYYFFdiYAavcyu8ppaDsGZ+YRHp33jHGn0Cw+Y=;
 b=XUleyFb0t5BPMC45viUNITioHPG8bRstnKwo8rwByiITkzRWat1sd9LrTTZXaLosJ8LJ5J3XgNohfoRG6AHp5Z1A4cKxf7WDjGxQX0kxGxO4wBYu6TXdVdr6Zw45xdq1asczXMLBoJKL74tgSfW77UBobby99FnkrBamtRZgzWo=
Received: from BN9PR03CA0178.namprd03.prod.outlook.com (2603:10b6:408:f4::33)
 by CH3PR12MB8934.namprd12.prod.outlook.com (2603:10b6:610:17a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.13; Tue, 17 Nov
 2026 07:21:12 +0000
Received: from BN2PEPF0000A803.namprd02.prod.outlook.com
 (2603:10b6:408:f4:cafe::9d) by BN9PR03CA0178.outlook.office365.com
 (2603:10b6:408:f4::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.13 via Frontend Transport; Tue,
 17 Nov 2026 07:21:12 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN2PEPF0000A803.mail.protection.outlook.com (10.167.245.164) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Tue, 17 Nov 2026 07:21:12 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 17 Nov
 2026 01:21:12 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 17 Nov
 2026 01:21:11 -0600
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.57
 via Frontend Transport; Tue, 17 Nov 2026 01:21:08 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, <Richard.Gong@amd.com>, <Poojitha.N@amd.com>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>
Subject: [PATCH v4 06/11] soundwire: amd: introduce struct amd_sdw_hw_ops dispatch framework
Date: Tue, 17 Nov 2026 12:48:15 +0530
Message-ID: <20261117071927.830373-7-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF0000A803:EE_|CH3PR12MB8934:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b185aaa-a958-4d41-64e6-08df447b5c1c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|23010399003|376014|36860700016|1800799024|56012099006|11063799006|261026121527099003|261026140227099003|10067099003|261028144727099003|261022105027099003|261021121427099003|261102123227099003|261009223027099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	kXDhUO8t+ep37vuIYKrEwd23r9oMYr18hyR3VPmmusho8JCOo6oZidPnTYP4zpb2DVvWLdtw/HVrTdtzOWJqY01MXYRstMLiBHjFga8Q8luRFMy3+p6VmcZOjdmHnYYhQJpedqsj3KBkjIHPfbuj0d5as6ok1VHo1VwvP4qwBnzI31hUVMoVHuEVXCh0JUOpXsBVoeGRubD5tBiXLj5jxKJtoIDhiJqpF2886qRcSIN1U4fECDotmd0AKhzMR1ImcELGwzRSHw2LtQ9AFmaSqBn+zUYxHc4pkvrCQGj5AzBnZR01Y5Kz9DD0BFzU8KnS9XAvqokvmCBTBLZHegaivcSs4SqydHAV5Hd1fPiYhyJ4iH2UBCL3GMjrwAvRpEIz4tTIkeNXek/2Zc6ZIrkskbkHR38JLCSB6qCXhCx4cbStLJPMlyi4rd986sI2ZqzIXIaFWir7kwf+W1Fyhwau9zIlxkUSlW3nRFGHB3GloxFfns3W8vnbz5y3W7ya98+OaPKwD485N9Q+v2yoK3+tYKuJTTiD4BSEHrz0gFCiRU2Wh0333qbt3S4L29mTYWgPGCqeEFocUajZDKbSjqAd8vQPjQ0m+pmRao7CIH1FYQy1P1hZX339oqgY4DxkTBOMZ0Sv7qw0JDFOFuhAsqLXafEfSjTFys/zHF02yl66Oxibtr+hqBdRF3gqADnJZXnleLn7n5PB/uBEh/wF92gjrA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(376014)(36860700016)(1800799024)(56012099006)(11063799006)(261026121527099003)(261026140227099003)(10067099003)(261028144727099003)(261022105027099003)(261021121427099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	tA9UTFUB7WAZyC8Smg+bQ4B18z/sDviHNFn2lt9asFpxACQEhTiY2192okWy5orIyWvcel5GF3+6/gMtn3PpjqulO2m67nE5juYbInI39n8zNFZLFJwYOgoSgU6zABVfTPcbwuR+atp+/5srJW0EVYekiwpKLL606nwrbWtrvsfDmcBAHkTWijPgLWjBm0so6hOj9a51sq3D6I72jIXtSS39iQzNO29aOcGBOOr6Omjo4udEY4iPith3W73cbX0z3gmJWAj9aGpQPQMiueik4o+2RpZgLxAaYIteyZWiNk6n2WBbbWZNWkF2qltZ4C4PlGoJBsb/HVNCtMpsHloPh1SInJyxiQYaoLRWSvRtZ9jYZrM06fRMsjaaIx+T9eu0rMDaruu3YC2my6EaUAa6Ms6layQ5Ordmfs1ejESJEjaDHXHLpEcRIgBGdNujV5T6
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 07:21:12.6502
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b185aaa-a958-4d41-64e6-08df447b5c1c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF0000A803.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8934

Add struct amd_sdw_hw_ops, a function-pointer dispatch table for
hardware-revision-specific SoundWire manager operations, including
register-level init/enable/disable, interrupt masking, frameshape,
wake/host-wake, command/response, ping handling, clock-stop exit,
and the PM suspend/resume paths. Add inline dispatch helpers for
each callback and a const hw_ops pointer in struct amd_sdw_manager.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 drivers/soundwire/amd_manager.h   | 177 ++++++++++++++++++++++++++++++
 include/linux/soundwire/sdw_amd.h |   4 +
 2 files changed, 181 insertions(+)

diff --git a/drivers/soundwire/amd_manager.h b/drivers/soundwire/amd_manager.h
index f3cb62398fb5..fb9b74d7b38b 100644
--- a/drivers/soundwire/amd_manager.h
+++ b/drivers/soundwire/amd_manager.h
@@ -266,4 +266,181 @@ static u32 sdw_manager_reg_mask_array[AMD_ACP63_SDW_MAX_MANAGER_COUNT] =  {
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
+ * @suspend_runtime: runtime-suspend hook; stops the bus like @suspend but
+ * arms host-wake interrupts (host_wake_enable true) so the hardware can
+ * wake the host, where @suspend disarms them
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
index 26a5ae7f46e2..a1bc263c26b0 100644
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

