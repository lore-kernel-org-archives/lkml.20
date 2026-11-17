Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.48.8
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794902655;
	b=C8P9RC666fi0p8yLSYb6tDeZMZ5T76nXqtYsCWYMmS+pCNvB9ApuzMclShmq/VXW5vYu
	 hWTYzf6Sy240muQ1gXLj/p7A0bQK/mGIQaTxfU7rVLNcBNS3luT7+2Ntec9XchohdLKR0
	 G6S4SCRti3+wFZsK4PddhY1S+71sYSELhgQRBW0ic2CLefPj4dNABo5p4+awuH1+ExWfR
	 MPq1iYbTj809Jj0wd07FnBHbh936uFNvhXKkbhzhza0vZ6LMXnFumV/6zXN4USJ2mrkHn
	 rlN7fHF4l23/Bp6jdrKenU3ZEBto4+HM4oX7eqHz7stm68GhVtoz3PChRNCWOffgw8Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794902655;
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
	bh=pn+9bxxbleGYV3ptI3sDXsO0viD3vx4l8QaUzJ7WQis=;
	b=K/bNEDf/nvZgrT7h8Rc9xtgWR5YY3dMDacr4XBpBNpDru6bcdIf3mgoGOarb/4qrn/nB
	 MhMcXv9O13fYRJiyoBSuB0Hbne8hFivZyvI8mGHn6qU5YrkJMf0O5ASsRmsrpMqsTm/Mu
	 Dy5Kp06bXTMw8kEz3P0ccumN+zbUSjuQfLCFPMr+OZZ2JoDIkB00AWAqJk5vLkU/t037h
	 kusiQHnpQIdJsV/ABoVQEOJL7kWCOXqM/7nOm1scFCMJY0iFR+T46Ot3YupQNBy2/IAnV
	 zgOWlb/EnPvTjIq1dEsitylqA4uoolry1lQ+7pPrBpBe2G0tE2tTCg7rLd0vOD+VVtg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=gMI9shMo;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.48.8
Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012008.outbound.protection.outlook.com [52.101.48.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BD04606A31C;
	Tue, 17 Nov 2026 08:04:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5BD04606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=gMI9shMo
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rTM/F79lIkjhN09R+4hKpaWOZ2lUPNSsimamJ4ki+3Is81bHX/cnJK9B/RKTi/lxrsG+m21+/J1LANOR03A19Pqgqf6XTQZZltq6Kr3fqJ4X7pFNF19VA7kErlst85guy+COw6y0MG8H8xDhUskKpffOOG3LLbZRDOgaG8ovD78pLX7nxwmLfDOZHt6WgEaV1V34xJ5/6lOKCYbuQkzf6SPAhCNHd+ItO2nMu7n0noTjTgrjjnVuA2Zq+vfyO79hVY+29L3VmpVg3Y1R2LJAv8gVoruHv1l6coIchXezVYHQuiZa/76ItpcFpaqifSrwSP+FalkvUVkb3+/dlvEvmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pn+9bxxbleGYV3ptI3sDXsO0viD3vx4l8QaUzJ7WQis=;
 b=xoYJxkeF52VxxrY0ajp+QDsL+piafRg8F8papxpXBs5sWew86OPA3pd+05fEpY3zNoU6x7UPk9jtoGV74hupQEZ/B0nQ+MTcpASOWl+w3jymISzB45umCwDsVA4SMzsinZ8+WRaXOuwugGu3at8EpVs8+c3X1Sa68PQnN0XhCcZQxi2mQQ9OU3MEGOkEtF9gTbfCtpJqLtShYk4DUXdxm/PDrjLT4Dj7inkTvaP4d7gqzwRhx24Su+Htk11EtzNQxHNW1yimlm7uNUMxkRTFxIgzd2X6urvM3K7nP2xoQ+CqXFEiTvXkOxRMzBmKs+jUQMhEosN66J/Z8EAgUgJ34w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pn+9bxxbleGYV3ptI3sDXsO0viD3vx4l8QaUzJ7WQis=;
 b=gMI9shMoR7HmEs74mflKmAyCV422qpDBKjXNEGJRweaCmauHwF+U32pnRCLkJrBDkVVEqwKivzor+nQvHJXfoUPDN5IFZPMC6Hu4HV9qDvc90IiHRyOPXCY3pB7sIc3Rl1GNdZQNfOXOjJuWAGxx2i9kBVpGYWceEOFf2FnPNEA=
Received: from BN9PR03CA0900.namprd03.prod.outlook.com (2603:10b6:408:13c::35)
 by PH8PR12MB7256.namprd12.prod.outlook.com (2603:10b6:510:223::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 17 Nov
 2026 08:04:09 +0000
Received: from BN2PEPF0000A994.namprd04.prod.outlook.com
 (2603:10b6:408:13c:cafe::16) by BN9PR03CA0900.outlook.office365.com
 (2603:10b6:408:13c::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.10 via Frontend Transport; Tue,
 17 Nov 2026 08:04:08 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN2PEPF0000A994.mail.protection.outlook.com (10.167.248.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Tue, 17 Nov 2026 08:04:08 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 17 Nov
 2026 02:04:03 -0600
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb08.amd.com (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.57
 via Frontend Transport; Tue, 17 Nov 2026 02:04:00 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, <Richard.Gong@amd.com>, <Poojitha.N@amd.com>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>
Subject: [PATCH v2 01/11] soundwire: amd: add ACP7B/7E/7F register definitions and revision IDs
Date: Tue, 17 Nov 2026 13:31:40 +0530
Message-ID: <20261117080239.918428-2-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261117080239.918428-1-Vijendar.Mukunda@amd.com>
References: <20261117080239.918428-1-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF0000A994:EE_|PH8PR12MB7256:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ce12c1b-724d-4421-64f2-08df44815b5b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|23010399003|36860700016|261102123227099003|10067099003|11063799006|56012099006|261021135927099003|261022115727099003|261021123027099003|261021121427099003|261021133027099003|261026140227099003|261026121527099003|261022105027099003|261022075727099003|261026130827099003|261021130227099003|261022113327099003|261026135527099003|261028144727099003|261009223027099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	aCywU48XqGI3BplhkrlbcHxV83/1jzcBw9ZowogRUVpBs+4XiAuUezeL10LiIXzfGLNI6PAzZcG+nUbtsadi/FykdUhICHjukrU+9LOKN2os8BvOQ0A1GxPWL0svk/vSE8LNDhcOzcyxXe9+8aJTiQkuW7GBerjdOc6nEc9iuEZ7BIQXI4m+X4bpfwupj6/1EdJWH9akCsEBEczvixwn6H+nQvJRUYfFe0ApXg7j2h3p55DZ59dndklgMaq8hEjXnPqq91Ya97TA3sm+5V1F0mjQOsVAass1Lo1ArOUq37TYRAURKTE8HBjmzFRNgHeUIL5UtXpKw+t6+ytG7rkRMfoaoylWr1Z4aU8dk85rz2Qui6ex770b+g7zR/8JtKtA8Nc5U9gvgcQjOsrfdndYhry9jp8v9IyNzsggi4u8e925zuEkUl7qiWsSEavNUcFGyIwmublblAwT+Ogs+PYxSV+lO/PNlg6DW4rieiQ1XUZOSo7BFQ1wnQ0lgwxixl/lxJKCDYYAW8Yupsl7Q+Kf9rvyD9yZouhTzyXvrQ1ruHrlH/b7pj4K/Is6+WGwkAce5kSetdDw5ES8kMV3uYGPcK8gjpvWIL6YNb588zeRrY6ik5Y6gIIRh1XGzRTw7/l/hKDud9Ng3Y2R+9GhOYYXMgREJBi2T8Pv4pQz5DwYQLObopJeePQgRJHpleFTurJslRhMUCm2yz/QmMCO1msnRA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(23010399003)(36860700016)(261102123227099003)(10067099003)(11063799006)(56012099006)(261021135927099003)(261022115727099003)(261021123027099003)(261021121427099003)(261021133027099003)(261026140227099003)(261026121527099003)(261022105027099003)(261022075727099003)(261026130827099003)(261021130227099003)(261022113327099003)(261026135527099003)(261028144727099003)(261009223027099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	dkn5qlfnD6tpNGSK6RyLHuBFSkpYcqULmxqJhkte8x5ZySR7PVeswm1Vj95QNKcnzI9BEdZ2Us1xgMJriO4+rIPH6BR0Gh2KpYT8ZIMXCd+vogZRDNlhp7024uhyXvL3Cu/d0X77Jw1QYqg7Ubic2mM616LX4VMj23GNUmBGHSYnI4mOze93dIIVCGbpV8P7K0zDKFT4S5MoLDMvY2iqqV2FMCh8l7gMZSnoDzr5lTZbQZ+t/0pSmPsm6hulHHPrAzPQc15jgRptm7sVAJnYS02FCRXt3rlF4q7FJHg626UcUEZzetkRLYekVIUyHyqiiK7n0li1zO+zOPK7nWevR1pbgHRqpeF3J3Y8qI3kGrHJVRItXq3ZpM1b/AKj8cuct93T8DZed1Zrl4WvDY/tz8JEmI+zHHEM1m+c8rEQ326geUkRy4FlrLUovIO737VF
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 08:04:08.3688
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ce12c1b-724d-4421-64f2-08df44815b5b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF0000A994.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7256

Add ACP7B/7E/7F PCI revision ID constants (ACP7B_PCI_REV_ID,
ACP7E_PCI_REV_ID, ACP7F_PCI_REV_ID), SoundWire instance indices
ACP_SDW2 and ACP_SDW3, and AMD_ACP7X_SDW_MAX_MANAGER_COUNT (4)
for the four-manager topology supported by these revisions.

Add ACP7X_* register offset definitions for manager enable/disable,
interrupt control, IMM command/response, state-change status,
clock frequency control, frame size, bus reset, ping status, wake
enable, external interrupt control, and all TX/RX data port registers
(DP0-DP7 with per-bank sub-port layout).

Add struct sdw_manager_acp7x_dp_reg to describe the per-DAI register
layout for ACP7x data ports, and extend acp_sdw_pdata with mmio_base
for direct per-manager ACP register access without a second ioremap
call.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 drivers/soundwire/amd_manager.h   | 289 ++++++++++++++++++++++++++++++
 include/linux/soundwire/sdw_amd.h |   8 +
 2 files changed, 297 insertions(+)

diff --git a/drivers/soundwire/amd_manager.h b/drivers/soundwire/amd_manager.h
index 8eabe14d6ba7..45fe27ee0246 100644
--- a/drivers/soundwire/amd_manager.h
+++ b/drivers/soundwire/amd_manager.h
@@ -120,6 +120,276 @@
 #define ACP_SW_ERROR_INTR_MASK				0x0003270
 #define ACP_SW_PHY_TEST_MODE_DATA_OFF			0x0003274
 
+/* ACP7B/7E/7F SoundWire manager register offset between successive instances */
+#define ACP7X_SDW_MANAGER_REG_OFFSET			0x2000
+
+/* ACP7B/7E/7F IMM command/response registers (ACP-base relative) */
+#define ACP7X_SW_IMM_CMD_UPPER_WORD			0x005130
+#define ACP7X_SW_IMM_CMD_LOWER_QWORD			0x005134
+#define ACP7X_SW_IMM_RESP_UPPER_WORD			0x005138
+#define ACP7X_SW_IMM_RESP_LOWER_QWORD			0x00513c
+#define ACP7X_SW_IMM_CMD_STS				0x005140
+
+/* ACP7B/7E/7F slave state-change status registers */
+#define ACP7X_SW_STATE_CHANGE_STATUS_0TO7		0x00515c
+#define ACP7X_SW_STATE_CHANGE_STATUS_8TO11		0x005160
+#define ACP7X_SW_STATE_CHANGE_STATUS_MASK_0TO7		0x005164
+#define ACP7X_SW_STATE_CHANGE_STATUS_MASK_8TO11		0x005168
+
+/* ACP7B/7E/7F clock frequency control registers (one per bank) */
+#define ACP7X_SW_CLK_FREQUENCY_CTRL_BANK0		0x00516c
+#define ACP7X_SW_CLK_FREQUENCY_CTRL_BANK1		0x005170
+
+/* ACP7B/7E/7F error interrupt mask */
+#define ACP7X_SW_ERROR_INTR_MASK			0x005174
+
+/* ACP7B/7E/7F manager enable / frame-shape registers */
+#define ACP7X_SW_EN					0x005200
+#define ACP7X_SW_EN_STATUS				0x005204
+#define ACP7X_SW_FRAMESIZE_BANK0			0x005208
+#define ACP7X_SW_FRAMESIZE_BANK1			0x00520c
+
+/* ACP7B/7E/7F clock-stop resume control */
+#define ACP7X_SW_CLK_RESUME_CTRL			0x0057f8
+#define ACP7X_SW_CLK_RESUME_DELAY_CNTR			0x0057fc
+#define ACP7X_SW_BUS_RESET_CTRL				0x005800
+
+/* ACP7B/7E/7F ping status registers */
+#define ACP7X_SW_PING_STATUS_REGISTER_LOW		0x005810
+#define ACP7X_SW_PING_STATUS_REGISTER_HIGH		0x005814
+#define ACP7X_SW_PING_STATUS_CURRENT_BANK_SEL		0x005818
+
+/* ACP7B/7E/7F capabilities register */
+#define ACP7X_SW_GLOBAL_CAPABILITIES			0x004e00
+
+/* ACP7B/7E/7F wake enable */
+#define ACP7X_SW_WAKE_EN				0x0001458
+
+/*
+ * ACP7B/7E/7F external interrupt control registers (ACP-level).
+ * Offset 0x1a0c is a status register on ACP63 and a control register here.
+ */
+#define ACP7X_EXTERNAL_INTR_CNTL			0x0001a04
+#define ACP7X_EXTERNAL_INTR_CNTL1			0x0001a08
+#define ACP7X_EXTERNAL_SW_INTR_CNTL			0x0001a0c
+
+/* ACP7B/7E/7F per-manager interrupt masks (within ACP7X_EXTERNAL_INTR_CNTL) */
+#define ACP7X_SDW0_EXT_INTR_MASK			BIT(23)
+#define ACP7X_SDW1_EXT_INTR_MASK			BIT(24)
+#define ACP7X_SDW2_EXT_INTR_MASK			BIT(25)
+#define ACP7X_SDW3_EXT_INTR_MASK			BIT(26)
+
+/* ACP7B/7E/7F host-wake interrupt masks (within ACP7X_EXTERNAL_INTR_CNTL1, 0x1a08) */
+#define ACP7X_SDW0_HOST_WAKE_INTR_MASK			BIT(22)
+#define ACP7X_SDW1_HOST_WAKE_INTR_MASK			BIT(23)
+#define ACP7X_SDW2_HOST_WAKE_INTR_MASK			BIT(24)
+#define ACP7X_SDW3_HOST_WAKE_INTR_MASK			BIT(25)
+
+/* ACP7B/7E/7F device state masks within AMD_SDW_DEVICE_STATE register */
+#define ACP7X_SDW0_DEVICE_STATE_MASK			GENMASK(1, 0)
+#define ACP7X_SDW1_DEVICE_STATE_MASK			GENMASK(3, 2)
+#define ACP7X_SDW2_DEVICE_STATE_MASK			GENMASK(5, 4)
+#define ACP7X_SDW3_DEVICE_STATE_MASK			GENMASK(7, 6)
+
+/*
+ * ACP7B/7E/7F GLOBAL_CAPABILITIES bitmasks for extracting TX/RX port counts.
+ * The register encodes #TX ports in bits[3:0] and #RX ports in bits[7:4].
+ */
+#define ACP7X_SDW_NO_OF_TX_DATA_PORTS			0x0f
+#define ACP7X_SDW_NO_OF_RX_DATA_PORTS			0xf0
+#define ACP7X_SDW_MAX_DAI				22
+
+/* ACP7B/7E/7F DP register bank stride (bank1 = bank0 + ACP7X_SDW_BANK_REG_OFFSET) */
+#define ACP7X_SDW_BANK_REG_OFFSET			0x18
+
+/* ACP7B/7E/7F field masks for DP registers */
+#define ACP7X_DPN_LCTRL				GENMASK(2, 0)
+#define ACP7X_DPN_FRAME_FMT_BLK_PKG_MODE		BIT(0)
+#define ACP7X_DPN_FRAME_FMT_BLK_GRP_CTRL		GENMASK(2, 1)
+#define ACP7X_DPN_FRAME_FMT_INVERTED			BIT(4)
+#define ACP7X_DPN_CH_EN_CHMASK			GENMASK(7, 0)
+
+/* ACP7B/7E/7F TX DP frame-format registers (one per data port) */
+#define ACP7X_SW_TX_DP0_FRAME_FORMAT			0x005254
+#define ACP7X_SW_TX_DP1_FRAME_FORMAT			0x005258
+#define ACP7X_SW_TX_DP2_FRAME_FORMAT			0x00525c
+#define ACP7X_SW_TX_DP3_FRAME_FORMAT			0x005260
+#define ACP7X_SW_TX_DP4_FRAME_FORMAT			0x005264
+#define ACP7X_SW_TX_DP5_FRAME_FORMAT			0x005268
+#define ACP7X_SW_TX_DP6_FRAME_FORMAT			0x00526c
+#define ACP7X_SW_TX_DP7_FRAME_FORMAT			0x005270
+
+/* ACP7B/7E/7F TX DP0 sub-port bank-0 transport registers (DP0_0 .. DP0_3) */
+#define ACP7X_SW_TX_DP0_0_SAMPLEINTERVAL_BANK0		0x005280
+#define ACP7X_SW_TX_DP0_0_HCTRL_BANK0			0x005284
+#define ACP7X_SW_TX_DP0_0_HCTRL_OFFSET_BANK0		0x005288
+#define ACP7X_SW_TX_DP0_0_LANE_CTRL_BANK0		0x00528c
+#define ACP7X_SW_TX_DP0_0_CHANNEL_ENABLE_BANK0		0x005290
+#define ACP7X_SW_TX_DP0_0_BLOCK_PKGMODE_GRPCTRL_BANK0	0x005294
+
+#define ACP7X_SW_TX_DP0_1_SAMPLEINTERVAL_BANK0		0x0052b0
+#define ACP7X_SW_TX_DP0_1_HCTRL_BANK0			0x0052b4
+#define ACP7X_SW_TX_DP0_1_HCTRL_OFFSET_BANK0		0x0052b8
+#define ACP7X_SW_TX_DP0_1_LANE_CTRL_BANK0		0x0052bc
+#define ACP7X_SW_TX_DP0_1_CHANNEL_ENABLE_BANK0		0x0052c0
+#define ACP7X_SW_TX_DP0_1_BLOCK_PKGMODE_GRPCTRL_BANK0	0x0052c4
+
+#define ACP7X_SW_TX_DP0_2_SAMPLEINTERVAL_BANK0		0x0052e0
+#define ACP7X_SW_TX_DP0_2_HCTRL_BANK0			0x0052e4
+#define ACP7X_SW_TX_DP0_2_HCTRL_OFFSET_BANK0		0x0052e8
+#define ACP7X_SW_TX_DP0_2_LANE_CTRL_BANK0		0x0052ec
+#define ACP7X_SW_TX_DP0_2_CHANNEL_ENABLE_BANK0		0x0052f0
+#define ACP7X_SW_TX_DP0_2_BLOCK_PKGMODE_GRPCTRL_BANK0	0x0052f4
+
+#define ACP7X_SW_TX_DP0_3_SAMPLEINTERVAL_BANK0		0x005310
+#define ACP7X_SW_TX_DP0_3_HCTRL_BANK0			0x005314
+#define ACP7X_SW_TX_DP0_3_HCTRL_OFFSET_BANK0		0x005318
+#define ACP7X_SW_TX_DP0_3_LANE_CTRL_BANK0		0x00531c
+#define ACP7X_SW_TX_DP0_3_CHANNEL_ENABLE_BANK0		0x005320
+#define ACP7X_SW_TX_DP0_3_BLOCK_PKGMODE_GRPCTRL_BANK0	0x005324
+
+/* ACP7B/7E/7F TX DP1-DP7 bank-0 transport registers */
+#define ACP7X_SW_TX_DP1_SAMPLEINTERVAL_BANK0		0x005370
+#define ACP7X_SW_TX_DP1_HCTRL_BANK0			0x005374
+#define ACP7X_SW_TX_DP1_HCTRL_OFFSET_BANK0		0x005378
+#define ACP7X_SW_TX_DP1_LANE_CTRL_BANK0		0x00537c
+#define ACP7X_SW_TX_DP1_CHANNEL_ENABLE_BANK0		0x005380
+#define ACP7X_SW_TX_DP1_BLOCK_PKGMODE_GRPCTRL_BANK0	0x005384
+
+#define ACP7X_SW_TX_DP2_SAMPLEINTERVAL_BANK0		0x0053a0
+#define ACP7X_SW_TX_DP2_HCTRL_BANK0			0x0053a4
+#define ACP7X_SW_TX_DP2_HCTRL_OFFSET_BANK0		0x0053a8
+#define ACP7X_SW_TX_DP2_LANE_CTRL_BANK0		0x0053ac
+#define ACP7X_SW_TX_DP2_CHANNEL_ENABLE_BANK0		0x0053b0
+#define ACP7X_SW_TX_DP2_BLOCK_PKGMODE_GRPCTRL_BANK0	0x0053b4
+
+#define ACP7X_SW_TX_DP3_SAMPLEINTERVAL_BANK0		0x0053d0
+#define ACP7X_SW_TX_DP3_HCTRL_BANK0			0x0053d4
+#define ACP7X_SW_TX_DP3_HCTRL_OFFSET_BANK0		0x0053d8
+#define ACP7X_SW_TX_DP3_LANE_CTRL_BANK0		0x0053dc
+#define ACP7X_SW_TX_DP3_CHANNEL_ENABLE_BANK0		0x0053e0
+#define ACP7X_SW_TX_DP3_BLOCK_PKGMODE_GRPCTRL_BANK0	0x0053e4
+
+#define ACP7X_SW_TX_DP4_SAMPLEINTERVAL_BANK0		0x005400
+#define ACP7X_SW_TX_DP4_HCTRL_BANK0			0x005404
+#define ACP7X_SW_TX_DP4_HCTRL_OFFSET_BANK0		0x005408
+#define ACP7X_SW_TX_DP4_LANE_CTRL_BANK0		0x00540c
+#define ACP7X_SW_TX_DP4_CHANNEL_ENABLE_BANK0		0x005410
+#define ACP7X_SW_TX_DP4_BLOCK_PKGMODE_GRPCTRL_BANK0	0x005414
+
+#define ACP7X_SW_TX_DP5_SAMPLEINTERVAL_BANK0		0x005430
+#define ACP7X_SW_TX_DP5_HCTRL_BANK0			0x005434
+#define ACP7X_SW_TX_DP5_HCTRL_OFFSET_BANK0		0x005438
+#define ACP7X_SW_TX_DP5_LANE_CTRL_BANK0		0x00543c
+#define ACP7X_SW_TX_DP5_CHANNEL_ENABLE_BANK0		0x005440
+#define ACP7X_SW_TX_DP5_BLOCK_PKGMODE_GRPCTRL_BANK0	0x005444
+
+#define ACP7X_SW_TX_DP6_SAMPLEINTERVAL_BANK0		0x005460
+#define ACP7X_SW_TX_DP6_HCTRL_BANK0			0x005464
+#define ACP7X_SW_TX_DP6_HCTRL_OFFSET_BANK0		0x005468
+#define ACP7X_SW_TX_DP6_LANE_CTRL_BANK0		0x00546c
+#define ACP7X_SW_TX_DP6_CHANNEL_ENABLE_BANK0		0x005470
+#define ACP7X_SW_TX_DP6_BLOCK_PKGMODE_GRPCTRL_BANK0	0x005474
+
+#define ACP7X_SW_TX_DP7_SAMPLEINTERVAL_BANK0		0x005490
+#define ACP7X_SW_TX_DP7_HCTRL_BANK0			0x005494
+#define ACP7X_SW_TX_DP7_HCTRL_OFFSET_BANK0		0x005498
+#define ACP7X_SW_TX_DP7_LANE_CTRL_BANK0		0x00549c
+#define ACP7X_SW_TX_DP7_CHANNEL_ENABLE_BANK0		0x0054a0
+#define ACP7X_SW_TX_DP7_BLOCK_PKGMODE_GRPCTRL_BANK0	0x0054a4
+
+/* ACP7B/7E/7F RX DP frame-format registers */
+#define ACP7X_SW_RX_DP0_FRAME_FORMAT			0x005554
+#define ACP7X_SW_RX_DP1_FRAME_FORMAT			0x005558
+#define ACP7X_SW_RX_DP2_FRAME_FORMAT			0x00555c
+#define ACP7X_SW_RX_DP3_FRAME_FORMAT			0x005560
+#define ACP7X_SW_RX_DP4_FRAME_FORMAT			0x005564
+#define ACP7X_SW_RX_DP5_FRAME_FORMAT			0x005568
+#define ACP7X_SW_RX_DP6_FRAME_FORMAT			0x00556c
+#define ACP7X_SW_RX_DP7_FRAME_FORMAT			0x005570
+
+/* ACP7B/7E/7F RX DP0 sub-port bank-0 transport registers (DP0_0 .. DP0_3) */
+#define ACP7X_SW_RX_DP0_0_SAMPLEINTERVAL_BANK0		0x005580
+#define ACP7X_SW_RX_DP0_0_HCTRL_BANK0			0x005584
+#define ACP7X_SW_RX_DP0_0_HCTRL_OFFSET_BANK0		0x005588
+#define ACP7X_SW_RX_DP0_0_LANE_CTRL_BANK0		0x00558c
+#define ACP7X_SW_RX_DP0_0_CHANNEL_ENABLE_BANK0		0x005590
+#define ACP7X_SW_RX_DP0_0_BLOCK_PKGMODE_GRPCTRL_BANK0	0x005594
+
+#define ACP7X_SW_RX_DP0_1_SAMPLEINTERVAL_BANK0		0x0055b0
+#define ACP7X_SW_RX_DP0_1_HCTRL_BANK0			0x0055b4
+#define ACP7X_SW_RX_DP0_1_HCTRL_OFFSET_BANK0		0x0055b8
+#define ACP7X_SW_RX_DP0_1_LANE_CTRL_BANK0		0x0055bc
+#define ACP7X_SW_RX_DP0_1_CHANNEL_ENABLE_BANK0		0x0055c0
+#define ACP7X_SW_RX_DP0_1_BLOCK_PKGMODE_GRPCTRL_BANK0	0x0055c4
+
+#define ACP7X_SW_RX_DP0_2_SAMPLEINTERVAL_BANK0		0x0055e0
+#define ACP7X_SW_RX_DP0_2_HCTRL_BANK0			0x0055e4
+#define ACP7X_SW_RX_DP0_2_HCTRL_OFFSET_BANK0		0x0055e8
+#define ACP7X_SW_RX_DP0_2_LANE_CTRL_BANK0		0x0055ec
+#define ACP7X_SW_RX_DP0_2_CHANNEL_ENABLE_BANK0		0x0055f0
+#define ACP7X_SW_RX_DP0_2_BLOCK_PKGMODE_GRPCTRL_BANK0	0x0055f4
+
+#define ACP7X_SW_RX_DP0_3_SAMPLEINTERVAL_BANK0		0x005610
+#define ACP7X_SW_RX_DP0_3_HCTRL_BANK0			0x005614
+#define ACP7X_SW_RX_DP0_3_HCTRL_OFFSET_BANK0		0x005618
+#define ACP7X_SW_RX_DP0_3_LANE_CTRL_BANK0		0x00561c
+#define ACP7X_SW_RX_DP0_3_CHANNEL_ENABLE_BANK0		0x005620
+#define ACP7X_SW_RX_DP0_3_BLOCK_PKGMODE_GRPCTRL_BANK0	0x005624
+
+/* ACP7B/7E/7F RX DP1-DP7 bank-0 transport registers */
+#define ACP7X_SW_RX_DP1_SAMPLEINTERVAL_BANK0		0x005670
+#define ACP7X_SW_RX_DP1_HCTRL_BANK0			0x005674
+#define ACP7X_SW_RX_DP1_HCTRL_OFFSET_BANK0		0x005678
+#define ACP7X_SW_RX_DP1_LANE_CTRL_BANK0		0x00567c
+#define ACP7X_SW_RX_DP1_CHANNEL_ENABLE_BANK0		0x005680
+#define ACP7X_SW_RX_DP1_BLOCK_PKGMODE_GRPCTRL_BANK0	0x005684
+
+#define ACP7X_SW_RX_DP2_SAMPLEINTERVAL_BANK0		0x0056a0
+#define ACP7X_SW_RX_DP2_HCTRL_BANK0			0x0056a4
+#define ACP7X_SW_RX_DP2_HCTRL_OFFSET_BANK0		0x0056a8
+#define ACP7X_SW_RX_DP2_LANE_CTRL_BANK0		0x0056ac
+#define ACP7X_SW_RX_DP2_CHANNEL_ENABLE_BANK0		0x0056b0
+#define ACP7X_SW_RX_DP2_BLOCK_PKGMODE_GRPCTRL_BANK0	0x0056b4
+
+#define ACP7X_SW_RX_DP3_SAMPLEINTERVAL_BANK0		0x0056d0
+#define ACP7X_SW_RX_DP3_HCTRL_BANK0			0x0056d4
+#define ACP7X_SW_RX_DP3_HCTRL_OFFSET_BANK0		0x0056d8
+#define ACP7X_SW_RX_DP3_LANE_CTRL_BANK0		0x0056dc
+#define ACP7X_SW_RX_DP3_CHANNEL_ENABLE_BANK0		0x0056e0
+#define ACP7X_SW_RX_DP3_BLOCK_PKGMODE_GRPCTRL_BANK0	0x0056e4
+
+#define ACP7X_SW_RX_DP4_SAMPLEINTERVAL_BANK0		0x005700
+#define ACP7X_SW_RX_DP4_HCTRL_BANK0			0x005704
+#define ACP7X_SW_RX_DP4_HCTRL_OFFSET_BANK0		0x005708
+#define ACP7X_SW_RX_DP4_LANE_CTRL_BANK0		0x00570c
+#define ACP7X_SW_RX_DP4_CHANNEL_ENABLE_BANK0		0x005710
+#define ACP7X_SW_RX_DP4_BLOCK_PKGMODE_GRPCTRL_BANK0	0x005714
+
+#define ACP7X_SW_RX_DP5_SAMPLEINTERVAL_BANK0		0x005730
+#define ACP7X_SW_RX_DP5_HCTRL_BANK0			0x005734
+#define ACP7X_SW_RX_DP5_HCTRL_OFFSET_BANK0		0x005738
+#define ACP7X_SW_RX_DP5_LANE_CTRL_BANK0		0x00573c
+#define ACP7X_SW_RX_DP5_CHANNEL_ENABLE_BANK0		0x005740
+#define ACP7X_SW_RX_DP5_BLOCK_PKGMODE_GRPCTRL_BANK0	0x005744
+
+#define ACP7X_SW_RX_DP6_SAMPLEINTERVAL_BANK0		0x005760
+#define ACP7X_SW_RX_DP6_HCTRL_BANK0			0x005764
+#define ACP7X_SW_RX_DP6_HCTRL_OFFSET_BANK0		0x005768
+#define ACP7X_SW_RX_DP6_LANE_CTRL_BANK0		0x00576c
+#define ACP7X_SW_RX_DP6_CHANNEL_ENABLE_BANK0		0x005770
+#define ACP7X_SW_RX_DP6_BLOCK_PKGMODE_GRPCTRL_BANK0	0x005774
+
+#define ACP7X_SW_RX_DP7_SAMPLEINTERVAL_BANK0		0x005790
+#define ACP7X_SW_RX_DP7_HCTRL_BANK0			0x005794
+#define ACP7X_SW_RX_DP7_HCTRL_OFFSET_BANK0		0x005798
+#define ACP7X_SW_RX_DP7_LANE_CTRL_BANK0		0x00579c
+#define ACP7X_SW_RX_DP7_CHANNEL_ENABLE_BANK0		0x0057a0
+#define ACP7X_SW_RX_DP7_BLOCK_PKGMODE_GRPCTRL_BANK0	0x0057a4
+
+/* ACP7B/7E/7F SSP counter (shared with ACP63 naming but different base) */
+#define ACP7X_SW_SSP_COUNTER				0x005210
+
 #define ACP_DELAY_US					10
 #define AMD_SDW_TIMEOUT					1000
 #define AMD_SDW_DEFAULT_CLK_FREQ			12000000
@@ -198,6 +468,25 @@
 #define AMD_SDW_DEVICE_STATE_D0				0
 #define AMD_SDW_DEVICE_STATE_D3				3
 #define ACP_PME_EN					0x0001400
+#define ACP_SW_48MHZ_CLK_SEL				0x1030
+#define AMD_SDW_MCP_FRAME_SHAPE_COL_MASK		GENMASK(2, 0)
+#define AMD_SDW_MCP_FRAME_SHAPE_ROW_MASK		GENMASK(7, 3)
+#define AMD_SDW_8TO11_DEV_STATUS			0xffff
+
+/*
+ * ACP7B/7E/7F DP register layout. Frame-format is shared across banks; sample
+ * interval, hctrl, offset, lane-ctrl, channel-enable, and config registers
+ * are bank-0 base addresses (bank-1 = bank-0 + ACP7X_SDW_BANK_REG_OFFSET).
+ */
+struct sdw_manager_acp7x_dp_reg {
+	u32 frame_fmt_reg;
+	u32 sample_int_reg;
+	u32 hctrl_dp_reg;
+	u32 offset_reg;
+	u32 lane_ctrl_reg;
+	u32 ch_en_reg;
+	u32 config_reg;
+};
 
 /* Cross-file prototypes: amd_manager_common.c functions used by amd_acp63_manager.c */
 enum sdw_command_response amd_sdw_xfer_msg(struct sdw_bus *bus, struct sdw_msg *msg);
diff --git a/include/linux/soundwire/sdw_amd.h b/include/linux/soundwire/sdw_amd.h
index a1bc263c26b0..58f74aea5c21 100644
--- a/include/linux/soundwire/sdw_amd.h
+++ b/include/linux/soundwire/sdw_amd.h
@@ -26,14 +26,22 @@
 #define AMD_SDW_POWER_OFF_MODE		2
 #define ACP_SDW0	0
 #define ACP_SDW1	1
+#define ACP_SDW2	2
+#define ACP_SDW3	3
 /* ACP6.3/7.0/7.1/7.2 all expose two SoundWire manager instances */
 #define AMD_ACP63_SDW_MAX_MANAGER_COUNT	2
 #define ACP63_PCI_REV_ID		0x63
 #define ACP70_PCI_REV_ID		0x70
 #define ACP71_PCI_REV_ID		0x71
 #define ACP72_PCI_REV_ID		0x72
+#define ACP7B_PCI_REV_ID		0x7b
+#define ACP7E_PCI_REV_ID		0x7e
+#define ACP7F_PCI_REV_ID		0x7f
+/* ACP7B/7E/7F exposes up to four SoundWire manager instances */
+#define AMD_ACP7X_SDW_MAX_MANAGER_COUNT	4
 
 struct acp_sdw_pdata {
+	void __iomem *mmio_base;
 	u16 instance;
 	u32 acp_rev;
 	/* mutex to protect acp common register access */
-- 
2.53.0

