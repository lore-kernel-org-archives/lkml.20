Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.52.25
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794089435;
	b=F7lgD/5sbeP8eVDY5G4AqGgvmGVW7ytnkUBIMlZs7ycLN5EKHKvRYeqxvQHAnm3LxtfC
	 3IGF1Xg3EYJyHpNSgdZSAdlMOSgOIlgt+LaHgK5ay+2NYdetwZJTdG+G26lAp5r0/h4tj
	 QDTvtPgLdzyk+f/1aeuIgKx7NicgsSBbCm7e0k0d6dKwpKl+XVIZEhPYm+sLmPZlNrqLZ
	 +bzkGiVG7gK2o3ObBdoTfh1VoWxZLE1sz9rFbHWTZjzviopUpHJzgcbpAqeog9PgIGjb2
	 lsN/wQkLby39D/blj51gg+2WdfyPc5Q7qHyZOYcojn3Cms5kjsTc043HR6NipZIlQ2g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794089435;
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
	bh=jdndQI6Tpb7W3TsrU2l8Q+UU2hUWqQgqV444q+bzysA=;
	b=gH2pMPzdHTD5nhAtG+6wSmgV6x3fbchO0eB7OLSKw1Xw325Tg3JVYowJNbRBOHXLzdWh
	 0Qt+csFcSFmB2dCWfe6vttlOHnhtJcovD0pk673w50ma9ZZxi5w87ExWXc5q0Uow2ranh
	 DvfHfbUWmnlIQuaXvGXf+gG3gzulFgF6PtQZTcvCeinQUGmOGxDat02Gnv4DPpGZKZuhC
	 Gp/5RE+67darPe2rOMh8QrtdR09ojg+DMngfJrJTm71kV2SmSUoPmTycOZ4hR7MkBC31U
	 Bwz1XSCNBgp6ZcMW641GAeUjxNVDAdSkoZra8wJMJsnpuT6MQknrmjc9yUCJ6VTOzuA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=B0Z7zPQO;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.52.25
Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011025.outbound.protection.outlook.com [52.101.52.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1628606A32E;
	Sat,  7 Nov 2026 22:10:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1628606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=B0Z7zPQO
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SbVzP4nqrmbhM0dQbN67BwerjNg00l7PWD0I1oCPsJjiy9+0xD+ygBz9KieLdfbbm/n4fpQ326hVqJ2SIiDZZmzPRktT6sehquyE6eWY6avNnsGjln5/I3/JkHiYjETypgggmNMCwwWJjwcTmAuvT3Tvb7PRIoeXPI9+9yyjCL0Tyn4kp6n26kZQv16eC+2IdHiTxFou7F96GG8zgMuCDOaOAC+nT51OHwsZefOVITbAnyH6+MKRvpCT7hmkdXr5lzN0AOAQGBuu6XDqKGiMWALNs5aChvnuXXagZbAwim946kP0plYFcfIxNnlwXWL+MUflbaYk7iCWTpnVcZXXJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jdndQI6Tpb7W3TsrU2l8Q+UU2hUWqQgqV444q+bzysA=;
 b=gD0kk9kXk8mUekPngBe5x8X9WUP3E8hY1Aa7VMBldgH8ETPgbk3I3wfqQGfTCNfHkdO+hivoOwDp2bsFiJHrlqvVvM5LB6mXuoq/eDRqLb4HE+wZDlDSI+VPeMR2RnsO+bRJDeZGrHp5fYFDpj1jw38Y21fnHcr7gRnKb1fy/QFNVj44qjshgcF6jlWmB6mwNnbhPWoPVII0NdONDuteNRz0wFocWpkwvISkA6ARqEas2chRw5a50zHNKaox+S1TtOToXAeqnuULKRFUt+olBYWTtpcihvhJbSAMTK3/jp1denywYAiXX0ren5ymrgZqcpujiIyeIXKEbAUiPYY2Mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jdndQI6Tpb7W3TsrU2l8Q+UU2hUWqQgqV444q+bzysA=;
 b=B0Z7zPQOaW+4DkQ8Qy+vJL9mGEU2s014oiCXyfxLze5TQ8NwQTmexVMYFVIW60rHic1xKQQrd+HOxttS94RbU8avwDSy3fhnIyULMxtQjGI1lr3JPyWMsaImjAj12aAy9Js6ItL0UxxSWXZUv9x8WkMYqUILyf93YKCHQygWA/w=
Received: from BN9PR03CA0719.namprd03.prod.outlook.com (2603:10b6:408:ef::34)
 by CH0PR12MB8508.namprd12.prod.outlook.com (2603:10b6:610:18c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Sat, 7 Nov
 2026 22:10:28 +0000
Received: from BN3PEPF00022BCB.namprd03.prod.outlook.com
 (2603:10b6:408:ef:cafe::a4) by BN9PR03CA0719.outlook.office365.com
 (2603:10b6:408:ef::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.11 via Frontend Transport; Sat, 7
 Nov 2026 22:10:28 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN3PEPF00022BCB.mail.protection.outlook.com (10.167.248.168) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Sat, 7 Nov 2026 22:10:28 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Sat, 7 Nov
 2026 16:10:27 -0600
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53
 via Frontend Transport; Sat, 7 Nov 2026 16:10:24 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <broonie@kernel.org>, <yung-chuan.liao@linux.intel.com>,
	<pierre-louis.bossart@linux.dev>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <venkataprasad.potturu@amd.com>,
	<Syed.SabaKareem@amd.com>, <Mario.Limonciello@amd.com>, <Poojitha.N@amd.com>,
	<sravisar@amd.com>, <Richard.Gong@amd.com>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH 01/11] soundwire: amd: add ACP7B/7E/7F register definitions and revision IDs
Date: Sun, 8 Nov 2026 03:37:56 +0530
Message-ID: <20261107220913.4058072-2-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF00022BCB:EE_|CH0PR12MB8508:EE_
X-MS-Office365-Filtering-Correlation-Id: 615ef5d2-0391-46e8-d64a-08df3d1bee96
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|23010399003|1800799024|82310400026|56012099006|11063799006|261021130227099003|261021123027099003|261022105027099003|261021121427099003|261021133027099003|261022113327099003|261021135927099003|261009223027099003|261022075727099003|261022115727099003|261102123227099003|261028144727099003|261026135527099003|261026130827099003|261026121527099003|261026140227099003|10067099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	F5PZHis9IYEjiY3fBr6ENlFvcfkhbD5LQFzQgOWI/3e7kq1Ww6QUl5DO2aowaKJ/oXCZaxmfla8+tc+VgSWLSW046iKd3ufFd0pP86ye7iX7y+0U2Tnrd4VyFyJM0aplaCElxN2/q1L6l1SRfTeQp55RkELjBaTUxO+QlotYoRGHQSFnkRVcTCJWf5CprRFHp/RZ9rbxlbRWU0O0sOmxv29H4IkUKSgA9WLT8C0ap4jN2CvWePlWf9CRmrNRCa6Vg2P4GIRX3CvYl+zUBpJj+yDzHyGOtoXDVLH7yxZk9wMg7ZptzNjzv2GkTjmX/cOLPXrIa0ex/KuxzNvN2NXWUQ6qR7x7GiPAB+CU2ocJRStue5IKc9EdX1GX9X8teiqVL1/FoUjjGOQR8uM8jNWNXklOLE154DUCjbC/h6CYE5Tilq+UY1H8oC9PWbsCtzxJd1JzHQih8W7v+2Gwh8jO8KjVl1cB8gaOtgNxGGXtd56HRKep/w5dsifeBGDtWXf97LaQqheE/YleSqGyAOcQLuIB/qxQraxWxfaM7KffQ/NqV3ZTyAnVbXu/HhYUZWzaKVwDlYsJkEaH89t1TDTPZzyXHXWFvNpiN5yYXtSk/QrzlP01nxv6q2avz7TWYG91hYxtGEfXy1xIUP8b89+KZHSKeyHPB9Qh4hx9h6M4RH/FlnuBs5Jng52KjBFUCajDiErf/WKZCKnqU+OzEvggvQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(23010399003)(1800799024)(82310400026)(56012099006)(11063799006)(261021130227099003)(261021123027099003)(261022105027099003)(261021121427099003)(261021133027099003)(261022113327099003)(261021135927099003)(261009223027099003)(261022075727099003)(261022115727099003)(261102123227099003)(261028144727099003)(261026135527099003)(261026130827099003)(261026121527099003)(261026140227099003)(10067099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	NXqkd0yEoHAYUGg1QwiP6fVj+nIDcpIIZGZRXmUegLzqMy/JRo4h0dXquapDq7bRPVdp8nJOHCXWAHkTv68mqGyPiwK1Ev/CU33Oq5BDwEy0T6SQVTcOEjmizChl4Fb8HPuA0B+KCErXArEFQLHHuUfl0FRObqIeNjSe9HALsw2yXUXm56hwwrVzCHANEXhMaucqnVntpUyhbsJwVYuXqkPHvKS/ftFzxmcCiQCfl2a/FI7N1ocelQUGi5f6yu/Y9i4IV78KJxOhb+6GXS8LvTUrK9ftAmrlbLDeYrIadV5YvhngMzzkbKuoXg22XQsoNcOlgwSkSKNt2I1A9gZf4IGUBQKq039E2lkPFb3Wj46tiYBpcZU2mDdbTQK3xzlVPr+etgLUsTaAreiC78ozaLvwsnb99e5cL0CErUqbDuNEOX1NY25hbaZDDvU3Ncao
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2026 22:10:28.5735
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 615ef5d2-0391-46e8-d64a-08df3d1bee96
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF00022BCB.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB8508

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
index 2e87c79580f4..f58c99ff24d4 100644
--- a/drivers/soundwire/amd_manager.h
+++ b/drivers/soundwire/amd_manager.h
@@ -118,6 +118,276 @@
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
@@ -196,6 +466,25 @@
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
index 64e7cea8bd50..7dfb17603159 100644
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

