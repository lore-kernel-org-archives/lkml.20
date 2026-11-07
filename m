Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.198.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794066506;
	b=C2DR3CETOSxtRfwonaceTy2Iqe+2atHH/QOvNzc8/Lainffyzsmi5x4uNBLBCYuk3PLF
	 ln7jIlnkna2t5yX1lzDK3aB1ZwpEvdUEi9hVSOGEEARDC/9w+WSz/5JGI/Y1qcoTERxns
	 MUY9R48hA3ys8xpOpFB4g4KeBitABCmEevFF7L6OV75oA9SyIKA/EqJl8J/MjVz8YYraC
	 4R+630R8Jjx0NtVn18X+JJFe5ySwDL1ZnkjiKYm/0OikINkqbEjr+RspF84vfk63ic4bC
	 4Unu+rebjSB7GzRMjWdprUxJU9Mq4FfFInAAtM2Qy2n5GP+3O2RniiaeAMD/JyMk/yg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794066506;
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
	bh=iZ9czAITy2bSJoMpuhdxwzNAsaxCHGtmgxRE6AW40Fc=;
	b=yXCPeUMLfKA3J1V+sLU+I8qCFFTGc8o0qshCUirU4Ylc8knkQEzH6xqH4HLXBiUlbJvU
	 mAq8ZQacHp9k6rzXEhYtFy10SC2dXzw1RcdMq/F67XfwvacwXjjkM4L3iYJOwXjRK4NMV
	 8rzCzpKYsgqggYvGYEdQPfGZoxPpmq85GWhNqVa/HUZj2wKTSSrsBVY7sjtzJqeBpd5ji
	 7xJnML/qrRsB2c9F5eIfs/taLafmjSrB1fx0z7BChTkfkES1TvUJb+G0rz0Thc36sOh1N
	 eh/m0nyT8FQqbC2ARci2DKkEU3EvPlnfry1eG2Jvman+oyagnycNChcuocLriNMMSaA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=C3WrIHBH;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.198.49
Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010049.outbound.protection.outlook.com [40.93.198.49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58B22606D83B;
	Sat,  7 Nov 2026 15:48:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58B22606D83B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=C3WrIHBH
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cgL+NyctzweNRk3PQmIWe9reX7ZWds9aUo2n8Vk24Fy1HZ3S6LcKvp+kyYdR5Ch/GFzXA/JUvMdlTxhMLnoCZvAGVkqlSyfZ75SaxKMVL90YpyGqG3XV1rCHQXyGwdP+GVzv2M/GmQt/+JW/RkISxYxSZjFyKPK+7BJN8I7AXqfDc7fWpGNTEKXL/ySFV/qbbnjLN5/U4qxaBZfPBQDA8aNNdeeXAqC5nanfjFlYPotO4fpEa/Izpiky441/Z8i7ZPgzMcD7ZikSEWUzJG/eOBaOlrrFfUhg444TOnhLMFVN/MsKwhzPM+qriAaiHjImoSnvsAFV+FOtf6r51N4/CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iZ9czAITy2bSJoMpuhdxwzNAsaxCHGtmgxRE6AW40Fc=;
 b=IbVzTeyx3a/LocKtvP2L+d1DxCav39YRd1/KfaSjNipcUcvA/DmcVSxMw1CbkM7sQHmuEh/9i34qXebaytKh8g98UJga66rjGWT4/7qb3Zz6buDimq3XIJvchttqfMERURXvGDrLEltH4T18NNWVjT2zYtBv1pzpd777mq0wlZ8LXlsgPNBgbMGBdyaKh8QQmi6YaScY01YrI27/mzrEwAZVMqItg+GtjOGLzpXJ4ZfPagWl2rohLGy5k2yGjsAiVcRQM+hNB96asc18sMG58K6/QubCGI9EkDkyno4kvjLcxv0DoPkelBaway79kb3a9qXB2H9LIsgSB+O3cMWDrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iZ9czAITy2bSJoMpuhdxwzNAsaxCHGtmgxRE6AW40Fc=;
 b=C3WrIHBHZGE6/RP0IRfZW/NW4RdZ5oIK53wBj9PVIxVHShy/qAJP/8QpHUaIOBOfKOkAw+UAMrkGUDN8sONg3SZ4pnO8adaupZsx4F0wEC4c71QCbvScumJT5AFNQjhOaG9OCcLMC7KNNYrrrfbhPvsoG+dZSSj8EqxMrsTvVGc=
Received: from BN9PR03CA0033.namprd03.prod.outlook.com (2603:10b6:408:fb::8)
 by IA0PPFF4B476A86.namprd12.prod.outlook.com (2603:10b6:20f:fc04::bea) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Sat, 7 Nov
 2026 15:48:22 +0000
Received: from BN6PEPF00000070.namprd03.prod.outlook.com
 (2603:10b6:408:fb:cafe::5c) by BN9PR03CA0033.outlook.office365.com
 (2603:10b6:408:fb::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.11 via Frontend Transport; Sat, 7
 Nov 2026 15:48:22 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN6PEPF00000070.mail.protection.outlook.com (10.167.248.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Sat, 7 Nov 2026 15:48:22 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Sat, 7 Nov
 2026 09:48:21 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Sat, 7 Nov
 2026 09:48:21 -0600
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb08.amd.com (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53
 via Frontend Transport; Sat, 7 Nov 2026 09:48:17 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <broonie@kernel.org>, <yung-chuan.liao@linux.intel.com>,
	<pierre-louis.bossart@linux.dev>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <venkataprasad.potturu@amd.com>,
	<Syed.SabaKareem@amd.com>, <Mario.Limonciello@amd.com>,
	<Richard.Gong@amd.com>, <lee@kernel.org>, <Poojitha.N@amd.com>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>
Subject: [PATCH v5 04/25] soundwire: amd: track full pad teardown across suspend/resume
Date: Sat, 7 Nov 2026 21:15:13 +0530
Message-ID: <20261107154659.3358223-5-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN6PEPF00000070:EE_|IA0PPFF4B476A86:EE_
X-MS-Office365-Filtering-Correlation-Id: 34b2095d-35ce-4cbc-83c3-08df3ce68d5b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|82310400026|36860700016|261026140227099003|11063799006|261022075727099003|261009223027099003|56012099006|261022105027099003|261021121427099003|261021123027099003|261102123227099003|261026121527099003|261028144727099003|18002099003|22082099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	oRIZwZEWQqrwsYDUX4dLKNgHQixYWbgE+oQjc1bUvSLbvGgwRhbs2zzUlOMXDMQDewGx0J0MJNAve390FK1yrf9q665Kr7cw+SABdqVM1SDqjU/cePUdgu+Iiy24KyNsaDVlGbMbIHgoFdGG5oozaMMo3so0l5O+ObrsrnHe+0us/BzV7MvOmH0qckZ8k9KdOfo/mJ3UO9QxB34w1WEMF+O4Ee9/8uOH75/mgObPUgef8kM5oc4s+s5/JSqGH/A22S3UPt2DIMcjfKPXuV4OPEtLdu2kTfSzIgYjoq5LdAeyk+Fiblv8wmSBuMdOa7qdOGzQz3azVmJx8lyzpQvxEkuER876Ms/l5ohdk1ZCXHRhwl/+GdLxXkQQJb1NaRZRiTvqsxEMzLfCUs1eWAXWmwKXegvhs+Tr/sPsqUWnCRIFnaSxr4InSLAB8C8YZpu75iVE8yYY4gbYPYq0Bw3FB+ar/A2w8D1Hj4RcmSKQFRcJwmVU7HdWlIKDivZrFjEaPFFkrH0aRgDy22dPBqwYMiSfwFeSJtLGPJ2LLbgOfJp2ys3LDdllRQsyOUfvyOQiflO6PtCxclT6AeTJXvv3PUYBEcAwjQ1yXjz6tOq/MjSUuPudXBVYoJd3i67uEmeUlR6UgQMMXiE8TODgohLd9i+gtwmLmW3zV/PUoM/dFVwh05ugI0FAXtiBXKcXW0N80kloYV05pXcbxytQTkT9dw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(82310400026)(36860700016)(261026140227099003)(11063799006)(261022075727099003)(261009223027099003)(56012099006)(261022105027099003)(261021121427099003)(261021123027099003)(261102123227099003)(261026121527099003)(261028144727099003)(18002099003)(22082099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	qcDqpn30PgEcBKeVqHIQ6sx0I5uex7RvS1En1zTyQ5YnS0PzYA8tAbleiEn5ocFB6EJ95hZE2O4LEXGZeordAykh4LpfNtTdHrgMcKfRbKwHh9ZFlwFXWPgD9LWjmp5A6OsrbmjxkV/aNTPSrISWSSW6M+RMFFCrUoWK0AE7+voaaT0uOFbBUuDkdp+PcroUZxlTNgYE71s9iiHAzXmcMRDmKFXOpenf0bbw5DZ3cVu9JQ5KXGjse5adsnC6HDsjt/hGUBwH6v8wbvA/O0mxsmZZMA+wPH0i42iK+WnhOdfcJcYPLeFf8nlXvbRJ6EDjwQ/UVpEeyX6QXDzoB7Zkhw1vIBhTdxP9SsvDcbh15ca1bBqD/KfCrbJ+kgnbQfzwJPnYx3PkSUF+lojy77l2shN7UT138w+lO1oOx4+aawpoytHEUYODFqh2PKVUta6O
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2026 15:48:22.1240
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 34b2095d-35ce-4cbc-83c3-08df3ce68d5b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN6PEPF00000070.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPFF4B476A86

amd_sdw_pad_ctrl() performs a full pad teardown (keeper, pulldown, schmen
and OE) for system suspend, while amd_sdw_oe_ctrl() disables only OE for
wake-armed runtime suspend. amd_resume_runtime() must distinguish between
these two cases to restore pads correctly: a full teardown requires
amd_sdw_pad_ctrl(true) on resume; a wake-armed runtime suspend requires
only amd_sdw_oe_ctrl(true).

Introduce pad_fully_torn_down flag to track when a full pad teardown was
performed. Set the flag after amd_sdw_pad_ctrl(false) in amd_suspend()
using amd_sdw_pad_ctrl_supported() to gate the assignment to revisions
that support pad control. Clear it after the full restore in
amd_resume_runtime(). On resume, restore all pads if the flag is set,
otherwise restore OE only; both paths delegate revision gating to the
respective helpers.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 drivers/soundwire/amd_manager.c   | 12 ++++++++++--
 include/linux/soundwire/sdw_amd.h |  7 +++++++
 2 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
index b21691652490..28f5dbe131dc 100644
--- a/drivers/soundwire/amd_manager.c
+++ b/drivers/soundwire/amd_manager.c
@@ -1418,7 +1418,10 @@ static int __maybe_unused amd_suspend(struct device *dev)
 		if (ret)
 			return ret;
 		/* System suspend: tear down all pads */
-		amd_sdw_pad_ctrl(amd_manager, false);
+		if (amd_sdw_pad_ctrl_supported(amd_manager)) {
+			amd_sdw_pad_ctrl(amd_manager, false);
+			amd_manager->pad_fully_torn_down = true;
+		}
 	}
 	if (amd_manager->acp_rev >= ACP70_PCI_REV_ID) {
 		ret = amd_sdw_set_device_state(amd_manager, AMD_SDW_DEVICE_STATE_D3);
@@ -1510,7 +1513,12 @@ static int __maybe_unused amd_resume_runtime(struct device *dev)
 				return ret;
 		}
 	} else if (amd_manager->power_mode_mask & AMD_SDW_POWER_OFF_MODE) {
-		amd_sdw_pad_ctrl(amd_manager, true);
+		if (amd_manager->pad_fully_torn_down) {
+			amd_sdw_pad_ctrl(amd_manager, true);
+			amd_manager->pad_fully_torn_down = false;
+		} else {
+			amd_sdw_oe_ctrl(amd_manager, true);
+		}
 		writel(0x00, amd_manager->acp_mmio + ACP_SW_WAKE_EN(amd_manager->instance));
 		if (amd_manager->acp_rev >= ACP70_PCI_REV_ID) {
 			ret = amd_sdw_host_wake_enable(amd_manager, false);
diff --git a/include/linux/soundwire/sdw_amd.h b/include/linux/soundwire/sdw_amd.h
index 470360a2723c..c959d0fe2a39 100644
--- a/include/linux/soundwire/sdw_amd.h
+++ b/include/linux/soundwire/sdw_amd.h
@@ -75,6 +75,12 @@ struct sdw_amd_dai_runtime {
  * @wake_en_mask: wake enable mask per SoundWire manager
  * @acp_rev: acp pci device revision id
  * @clk_stopped: flag set to true when clock is stopped
+ * @pad_fully_torn_down: true when system suspend performed a full pad
+ *   teardown (keeper, schmen and OE cleared, pulldown asserted). Cleared after
+ *   all pads are restored in amd_resume_runtime(). False on initial probe
+ *   (zero-initialized) and after a wake-armed runtime suspend in which
+ *   only OE was disabled; in the latter case amd_resume_runtime() restores
+ *   OE only, leaving keeper and schmen untouched.
  * @power_mode_mask: flag interprets amd SoundWire manager power mode
  * @dai_runtime_array: dai runtime array
  */
@@ -106,6 +112,7 @@ struct amd_sdw_manager {
 	u32 power_mode_mask;
 	u32 acp_rev;
 	bool clk_stopped;
+	bool pad_fully_torn_down;
 
 	struct sdw_amd_dai_runtime **dai_runtime_array;
 };
-- 
2.53.0

